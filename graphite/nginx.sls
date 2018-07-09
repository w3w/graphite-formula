{%- from 'graphite/settings.sls' import graphite with context -%}

/etc/nginx/conf.d/graphite.conf:
  file.managed:
    - source: salt://graphite/files/graphite.conf.nginx
    - template: jinja
    - context:
      graphite_host: {{ graphite.host }}
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx
