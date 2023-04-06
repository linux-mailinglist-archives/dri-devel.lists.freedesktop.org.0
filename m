Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD06D9C05
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 17:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CE010EC11;
	Thu,  6 Apr 2023 15:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE61E10EC11
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 15:18:27 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id r14so23624243oiw.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 08:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680794307;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMVZO08lvHqEqzOhCjWBkw6cuH10x2lvDXMm8yPnUHA=;
 b=QSM+3Ccn8EYf6aTg1nZ9NbR4znh1q5638M41OW9sz0aWNaMal4u9AIDulShLLKN2Wa
 qNJB8sZo9RejI79Hy/ijHZ762LQDAoGkPbACOk+UB61sWOw+E/S6tvC4T54QvCn3QTeR
 r0FIL+WQrZx6HX2HiwHgOi40XqxNAUbv92ZlD4hrznppTgxAFNBMQgmANeNG2XiY9D8Q
 yTJ1MmWhywyeZxt25CcMCGYLetfHy5t8+djFlBdREw5lBojHr6Cof/6NtVyc5xmdSTmZ
 Dv+fye2YEGUh/a6pWKQX01duKM0CofjLGSmlijOZlWWfxk0TdZeTF/tpmfL+cAFxpAd1
 jfhA==
X-Gm-Message-State: AAQBX9cr06EQn/kMGlmhqNkaqwn6rjE0K6i5+CJu7RaYj1Ily/K3ca7z
 iiANCR3s/V39egsxIRWAEQ==
X-Google-Smtp-Source: AKy350bdKh87MJnB+T/f5MC1AljIe85YEewpcZpqURUk+MxBLINdqR5LYyGaTKMJtGlA2H+WoQ6W0g==
X-Received: by 2002:a05:6808:289:b0:389:50f2:4ab0 with SMTP id
 z9-20020a056808028900b0038950f24ab0mr3866508oic.10.1680794306969; 
 Thu, 06 Apr 2023 08:18:26 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e4-20020a4a5504000000b0054156478f2esm639755oob.44.2023.04.06.08.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:18:26 -0700 (PDT)
Received: (nullmailer pid 3117135 invoked by uid 1000);
 Thu, 06 Apr 2023 15:18:25 -0000
Date: Thu, 6 Apr 2023 10:18:25 -0500
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v15 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
Message-ID: <20230406151825.GB3098002-robh@kernel.org>
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331091145.737305-5-treapking@chromium.org>
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
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Stephen Boyd <swboyd@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 05:11:39PM +0800, Pin-yen Lin wrote:
> Analogix 7625 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Also include the link to the product brief in the bindings.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ---
> 
> (no changes since v12)
> 
> Changes in v12:
> - Removed the 4-lane binding in analogix,anx7625.yaml
> - Reworded the description for the mode-switch property
> 
> Changes in v11:
> - Updated the description of the endpoints
> - Referenced video-interfaces.yaml instead for the endpoints
> 
> Changes in v10:
> - Collected Reviewed-by and Tested-by tags
> 
> Changes in v9:
> - Collected Reviewed-by tag
> 
> Changes in v8:
> - Updated anx7625 bindings for data-lane property
> - Fixed the subject prefix
> 
> Changes in v7:
> - Fixed issues reported by dt_binding_check
> - Updated the schema and the example dts for data-lanes.
> - Changed to generic naming for the example dts node.
> 
> Changes in v6:
> - Remove switches node and use endpoints and data-lanes property to
>   describe the connections.
> 
>  .../display/bridge/analogix,anx7625.yaml      | 88 ++++++++++++++++++-
>  1 file changed, 85 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index b42553ac505c..604c7391d74f 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -12,7 +12,8 @@ maintainers:
>  
>  description: |
>    The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> -  designed for portable devices.
> +  designed for portable devices. Product brief is available at
> +  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
>  
>  properties:
>    compatible:
> @@ -112,9 +113,40 @@ properties:
>                data-lanes: true
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
>          description:
> -          Video port for panel or connector.
> +          Video port for panel or connector. Each endpoint connects to a video
> +          output downstream, and the "data-lanes" property is used to describe
> +          the pin connections. 0, 1, 2, 3 in "data-lanes" maps to SSRX1, SSTX1,
> +          SSRX2, SSTX2, respectively.
> +
> +        patternProperties:
> +          "^endpoint@[01]$":
> +            $ref: /schemas/media/video-interfaces.yaml#

               unevaluatedProperties: false

> +            properties:
> +              reg: true
> +
> +              remote-endpoint: true

Don't need to list these 2.

> +
> +              data-lanes:
> +                oneOf:
> +                  - items:
> +                      - enum: [0, 1, 2, 3]
> +
> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +
> +                  - items:
> +                      - const: 2
> +                      - const: 3
> +
> +              mode-switch:
> +                type: boolean
> +                description: Serves as Type-C mode switch if present.
> +
> +            required:
> +              - remote-endpoint

Don't need required.

>  
>      required:
>        - port@0
> @@ -186,3 +218,53 @@ examples:
>              };
>          };
>      };
> +  - |
> +    i2c3 {

i2c-3

But better yet, just expand the existing example rather than a whole new 
one.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        encoder@58 {
> +            compatible = "analogix,anx7625";
> +            reg = <0x58>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&anx7625_dp_pins>;
> +            enable-gpios = <&pio 176 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
> +            vdd10-supply = <&pp1100_dpbrdg>;
> +            vdd18-supply = <&pp1800_dpbrdg_dx>;
> +            vdd33-supply = <&pp3300_dpbrdg_dx>;
> +            analogix,audio-enable;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    anx7625_dp_in: endpoint {
> +                        bus-type = <7>;
> +                        remote-endpoint = <&dpi_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    reg = <1>;
> +                    anx_typec0: endpoint@0 {
> +                        reg = <0>;
> +                        mode-switch;
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&typec_port0>;
> +                    };
> +                    anx_typec1: endpoint@1 {
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
> 2.40.0.348.gf938b09366-goog
> 
