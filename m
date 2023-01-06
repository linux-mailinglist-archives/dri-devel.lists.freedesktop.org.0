Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2F66007F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 13:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C348910E03D;
	Fri,  6 Jan 2023 12:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7168C10E03D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 12:48:24 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so986633wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 04:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8zVNUT3bgdnMkFHoj/GybUreH+dejeypvrE/0mlGO44=;
 b=RLC4VF3LVFfa0bOsrwXfVnS6UTPE8TaIBoiP8TlbOSfaW4I0JqJ2Io23P0TSAHqCCu
 DHE1TXTIS5AzTr2RGltgLFG+Aco9X3ZY1L7QnO+HaZeIwZ5VfcAE2mFlrCt3Sg9NHp5d
 1QG1PW20BpMEqgjWeMknBPLUsuFxI7dKRWOpQ245bGXK5aV1qSD5MtscROyyT94iwqgs
 TSsDipA04LOSx70GU34PifTCQxjWI3Do4TSTWu9mbleO5PmcBmbtAfGJsYNmY02VUHMK
 tCSzEXzicW1n4FLhB0rilYbyjDAGnHn5lkWHxEo4HfLZmF6zgnIUZT+ymH5w6i9wpFgw
 aHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8zVNUT3bgdnMkFHoj/GybUreH+dejeypvrE/0mlGO44=;
 b=EKI1g227y4jS7/P3loSSTItIsXyzGfTUO79bFiz8N3dVAd0u4T00YpbOY8ee7sTlFd
 ty+jjCeAN/l3zqLmn8tuEZTuJdagdlo4mp9auQOsv4ukQclpYEhUfD9nB0N9v39wx+3v
 cBDXISSFh1JZqyqlJUQ81QA62Ug6J52dhpDZSh7dkYMKBFZkHNUkzbrwMovUxUFpEfKU
 Eqxq1vl1MZJF8/WwDsDC6zvhg7XXBB+cS/3IpVWAiBbJ8attZVoIgos0cnN5+JKlInbg
 XZgBUMuuN8hzii1b0AshQVrHEBMPh+MwJWbr7wb82SFmA4AAnQGWf9zNvSee5Gx+ItoB
 tr1A==
X-Gm-Message-State: AFqh2kqgpa3jZG85o+oM1I02IJgWIktGLCcxrDqVQHzLj9LPVcGp0ThC
 9AO4RVZFwj3bHZibQyk0jKZzUw==
X-Google-Smtp-Source: AMrXdXvTAo5ItVnUoTZAbTRPzwj3gQr3rM9LmIfwukZgRbRtovmTeFlA8otEKXpd826Eati8fuXXjQ==
X-Received: by 2002:a05:600c:3d91:b0:3d9:103d:9078 with SMTP id
 bi17-20020a05600c3d9100b003d9103d9078mr38149211wmb.22.1673009302667; 
 Fri, 06 Jan 2023 04:48:22 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm6235286wmc.13.2023.01.06.04.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 04:48:21 -0800 (PST)
Message-ID: <5ad7a6bc-0ffd-9d2d-ed80-62c3530cf2fa@linaro.org>
Date: Fri, 6 Jan 2023 13:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 7/9] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
References: <20230105132457.4125372-1-treapking@chromium.org>
 <20230105132457.4125372-8-treapking@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105132457.4125372-8-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org, Allen Chen <allen.chen@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-acpi@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/01/2023 14:24, Pin-yen Lin wrote:
> ITE IT6505 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
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
>  .../bindings/display/bridge/ite,it6505.yaml   | 95 ++++++++++++++++---
>  1 file changed, 84 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index b16a9d9127dd..1ee7cd0d2035 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -77,20 +77,45 @@ properties:
>          unevaluatedProperties: false
>          description: Video port for DP output
>  
> -        properties:
> -          endpoint:
> +        patternProperties:
> +          "^endpoint@[01]$":
>              $ref: /schemas/graph.yaml#/$defs/endpoint-base
>              unevaluatedProperties: false
>  
>              properties:
> +              reg:
> +                maxItems: 1
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
> +                  - minItems: 1

Drop minItems.

> +                    maxItems: 1

Actually drop this as well and just use items with one item (enum).

> +                    items:
> +                      enum: [0, 1, 2, 3]
> +
> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +
> +                  - items:
> +                      - const: 2
> +                      - const: 3
> +
> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3
> +
> +              mode-switch:
> +                type: boolean
> +                description: Register this node as a Type-C mode switch or not.
> +
> +            required:
> +              - reg
> +              - remote-endpoint
>  
>      required:
>        - port@0
> @@ -102,7 +127,6 @@ required:
>    - pwr18-supply
>    - interrupts
>    - reset-gpios
> -  - extcon
>    - ports
>  
>  additionalProperties: false
> @@ -139,8 +163,11 @@ examples:
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
> @@ -148,3 +175,49 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c3 {

Just i2c

Best regards,
Krzysztof

