# DockerfileをビルドするとDocker Image（コンテナ仮想環境のひな形）が作成される

# rubyのバージョンを指定
FROM ruby:2.5.1

# railsの実行環境に必要
RUN apt-get update -qq && apt-get install -y build-essential nodejs

# appディレクトリ内にrailsアプリを構築
RUN mkdir /app

# appディレクトリに移動
WORKDIR /app

# GemfileとGemfile.lockをコピーしてbundle install
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# railsに必要なアプリケーションをappディレクトリ内にコピー
COPY . /app
