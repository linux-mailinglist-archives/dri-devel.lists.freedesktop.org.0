Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6D168B9F0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874AB10E182;
	Mon,  6 Feb 2023 10:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4628D10E182
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 10:22:53 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id a24so12139085vsl.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 02:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IDFXynxhTW1MwQ5q7ACPsdQYoX0X11isexUWJq5g+yg=;
 b=Tn+42238E/9sl6eoWwma3KtObVRsN/fRvB+q+b9YCSNv+D3eCfQs1FaM3VJac8A3r/
 DRhLjpUmzMZPlOcK4vFkiPX7O2EbwTtrNBHslK4TrfU5m1lwFmhchOwPN20shA+qADeN
 GIgNAy56Yw6c7Uv/a5ovUg0s+6fOBYxNGV9dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IDFXynxhTW1MwQ5q7ACPsdQYoX0X11isexUWJq5g+yg=;
 b=7JdOgx2xQlH3oG1gA2OSk1cpXQRGJGfRdXeM6z+CIJt+cipwZgedq0FkOasmH5MMuW
 b9UqkIY+2s/J8ZL5ePmkpW7s3H5DHBImYLxPHCxgZ1X7dcdKZKJaQSNPup0K0ug7uZwx
 tnXbDSVA5a76yPmJm++eI5OgzGm/obZSScz/vHqrDd9zekFOEUDbgeDhP9cP6cQucn+E
 tlRna+mZvg2x0tJJtBDvPKYl4mdCnFRCB5J2MDhJAkE3ecFYAFXaFRDDkMKoBhlKJZwJ
 0GAI43hXuwRJOz2iU6VOQ7EbqcXIevWEDorNUT7dMBpL5tLHMbX1uorBPXMK/esYwsOU
 9tZA==
X-Gm-Message-State: AO0yUKUXLl7XvdetfW0p6VBjhJ3t43fDp/tiEWohsyHQ6FLamLb67z32
 KW4BuWG+USvPGIcB7r+B+iLnvrk1zepyQnC93PpMQA==
X-Google-Smtp-Source: AK7set9UEObC8Y3n/7lmYrPAsFQnv8OgXuuTtX5cUD3nMzyjS/+VIqLpJpkmCwvPrE9S9lf2zhO2/iIUbDgx4yAMAfo=
X-Received: by 2002:a05:6102:322a:b0:3fe:ae88:d22 with SMTP id
 x10-20020a056102322a00b003feae880d22mr2896334vsf.65.1675678972359; Mon, 06
 Feb 2023 02:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-8-treapking@chromium.org>
In-Reply-To: <20230204133040.1236799-8-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Feb 2023 18:22:41 +0800
Message-ID: <CAGXv+5FBHKgOA_XAr7HzsZhsB_W5QbdY6R3q+5PCy5yynduprw@mail.gmail.com>
Subject: Re: [PATCH v11 7/9] dt-bindings: display: bridge: it6505: Add
 mode-switch support
To: Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 4, 2023 at 9:31 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> ITE IT6505 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
>
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
> Changes in v11:
> - Updated the description of the endpoints in the bindings
> - Referenced video-interfaces.yaml instead for the endpoints binding
> - Removed duplicated definitions from inherited schema
>
> Changes in v9:
> - Fixed subject prefix again
> - Changed the naming of the example node for it6505
>
> Changes in v8:
> - Updated bindings for data-lanes property
> - Fixed subject prefix
>
> Changes in v7:
> - Fixed issues reported by dt_binding_check.
> - Updated the schema and the example dts for data-lanes.
> - Changed to generic naming for the example dts node.
>
> Changes in v6:
> - Remove switches node and use endpoints and data-lanes property to
>   describe the connections.
>
>  .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
>  1 file changed, 88 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index b16a9d9127dd..8ae9c5cba22c 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -75,22 +75,49 @@ properties:
>        port@1:
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
> -        description: Video port for DP output
> +        description:
> +          Video port for DP output. Each endpoint connects to a video output
> +          downstream, and the "data-lanes" property is used to describe the pin
> +          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
> +          respectively.
>
> -        properties:
> -          endpoint:
> -            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +
> +        patternProperties:
> +          "^endpoint@[01]$":
> +            $ref: /schemas/media/video-interfaces.yaml#
>              unevaluatedProperties: false
>
>              properties:
> +              reg: true
> +
> +              remote-endpoint: true
> +
>                data-lanes:
> -                minItems: 1
> -                uniqueItems: true
> -                items:
> -                  - enum: [ 0, 1 ]
> -                  - const: 1
> -                  - const: 2
> -                  - const: 3
> +                oneOf:
> +                  - items:
> +                      - enum: [0, 1, 2, 3]

Based on the datasheets we have and the downstream driver, I assume
the hardware implements "lane swap" as simply reversing the order
of the output pins.

In that case the hardware can't output 1 lane DP on any arbitrary lane,
but only lane 0 or 3.

> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +
> +                  - items:
> +                      - const: 2
> +                      - const: 3

And maybe a bit pedantic, but have the order correct as:

    - const: 3
    - const: 2

> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3
> +
> +              mode-switch:
> +                type: boolean
> +                description: Register this node as a Type-C mode switch or not.

Same as the anx7625 patch, I would reword this as "Serves as Type-C mode
switch if present".


ChenYu


> +
> +            required:
> +              - reg
> +              - remote-endpoint
>
>      required:
>        - port@0
> @@ -102,7 +129,6 @@ required:
>    - pwr18-supply
>    - interrupts
>    - reset-gpios
> -  - extcon
>    - ports
>
>  additionalProperties: false
> @@ -139,8 +165,11 @@ examples:
>                  };
>
>                  port@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
>                      reg = <1>;
> -                    it6505_out: endpoint {
> +                    it6505_out: endpoint@0 {
> +                        reg = <0>;
>                          remote-endpoint = <&dp_in>;
>                          data-lanes = <0 1>;
>                      };
> @@ -148,3 +177,49 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dp-bridge@5c {
> +            compatible = "ite,it6505";
> +            interrupts = <8 IRQ_TYPE_LEVEL_LOW 8 0>;
> +            reg = <0x5c>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&it6505_pins>;
> +            ovdd-supply = <&mt6366_vsim2_reg>;
> +            pwr18-supply = <&pp1800_dpbrdg_dx>;
> +            reset-gpios = <&pio 177 0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    it6505_dpi_in: endpoint {
> +                        remote-endpoint = <&dpi_out>;
> +                    };
> +                };
> +                port@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <1>;
> +                    ite_typec0: endpoint@0 {
> +                        reg = <0>;
> +                        mode-switch;
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&typec_port0>;
> +                    };
> +                    ite_typec1: endpoint@1 {
> +                        reg = <1>;
> +                        mode-switch;
> +                        data-lanes = <2 3>;
> +                        remote-endpoint = <&typec_port1>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> --
> 2.39.1.519.gcb327c4b5f-goog
>
