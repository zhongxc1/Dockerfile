FROM webdevops/php-apache:alpine-php7

RUN curl https://drupalconsole.com/installer -L -o drupal.phar && \
    mv drupal.phar /usr/local/bin/drupal && \
    chmod +x /usr/local/bin/drupal && \
    drupal self-update

RUN curl https://github.com/drush-ops/drush-launcher/releases/download/0.5.1/drush.phar -L -o drush.phar && \
    mv drush.phar /usr/local/bin/drush && \
    chmod +x /usr/local/bin/drush && \
    drush self-update

RUN apk add --no-cache mysql-client
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php
