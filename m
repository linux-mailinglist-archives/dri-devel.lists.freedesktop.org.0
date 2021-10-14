Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9E42E286
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 22:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85766E1F7;
	Thu, 14 Oct 2021 20:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37BD6E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 20:16:51 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 w12-20020a056830410c00b0054e7ceecd88so9885927ott.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sLOZBbljlJk6fxRBXiALacjUjEX+53gXTaAVz3wg99U=;
 b=5z2/4KIqjNVYvFGzRpNSq5DnP1xfMCXkAIm07xbpyKy0g+zbtY6gF4PcUHxOFG7LB0
 QoJ5oAFvvMVLx9uEFzbB9abMTSiKypnP2gfSN/kaRpjCd3CBxMhiSVfowt/TQMpUQS7i
 mX6X3o8clv5NB14IaeRLPdiLWJvcBo3VpC7EE8IGGfWw0PbGXlOSAxtat0QSyh29DT0c
 /JLQ5dbRWWAq2o+Z/tki6BygZ0gA0BR4iHeXbgL+eXZ6NalitynZ+Gt268AZ2WhWNmMX
 936Y4eXG9iJK3uM0yerwKEdUuWz8sQnFjYapjLcgJt8kiCp+huAiyz9qsi9y2Qr/UAmL
 eO8g==
X-Gm-Message-State: AOAM531UhcRbTeLcOoEpdRU/6eXVBgbUokWrVDS207OqTbFiHl+vv/vw
 /j2bTy7y6sm46v9T9Tyd/Q==
X-Google-Smtp-Source: ABdhPJzsUlG+d1iaT/mSTy2OK/mA2mBw4ASqaCFdzTmfCHcV6evnztjSEGS/un35IXxmlV95JeN2QA==
X-Received: by 2002:a9d:4684:: with SMTP id z4mr4445844ote.134.1634242610236; 
 Thu, 14 Oct 2021 13:16:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j65sm780894oif.5.2021.10.14.13.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 13:16:49 -0700 (PDT)
Received: (nullmailer pid 3850196 invoked by uid 1000);
 Thu, 14 Oct 2021 20:16:48 -0000
Date: Thu, 14 Oct 2021 15:16:48 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: a.hajda@samsung.com, daniel@ffwll.ch, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/bridge: tc358767: Convert to YAML
 binding
Message-ID: <YWiQMM0ugXFYCaD0@robh.at.kernel.org>
References: <20211006135204.505144-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006135204.505144-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 06, 2021 at 03:52:04PM +0200, AngeloGioacchino Del Regno wrote:
> Convert the Toshiba TC358767 txt documentation to YAML.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/bridge/toshiba,tc358767.txt       |  54 --------
>  .../display/bridge/toshiba,tc358767.yaml      | 118 ++++++++++++++++++
>  2 files changed, 118 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
> deleted file mode 100644
> index 583c5e9dbe6b..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.txt
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -Toshiba TC358767 eDP bridge bindings
> -
> -Required properties:
> - - compatible: "toshiba,tc358767"
> - - reg: i2c address of the bridge, 0x68 or 0x0f, depending on bootstrap pins
> - - clock-names: should be "ref"
> - - clocks: OF device-tree clock specification for refclk input. The reference
> -   clock rate must be 13 MHz, 19.2 MHz, 26 MHz, or 38.4 MHz.
> -
> -Optional properties:
> - - shutdown-gpios: OF device-tree gpio specification for SD pin
> -                   (active high shutdown input)
> - - reset-gpios: OF device-tree gpio specification for RSTX pin
> -                (active low system reset)
> - - toshiba,hpd-pin: TC358767 GPIO pin number to which HPD is connected to (0 or 1)
> - - ports: the ports node can contain video interface port nodes to connect
> -   to a DPI/DSI source and to an eDP/DP sink according to [1][2]:
> -    - port@0: DSI input port
> -    - port@1: DPI input port
> -    - port@2: eDP/DP output port
> -
> -[1]: Documentation/devicetree/bindings/graph.txt
> -[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -	edp-bridge@68 {
> -		compatible = "toshiba,tc358767";
> -		reg = <0x68>;
> -		shutdown-gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
> -		reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
> -		clock-names = "ref";
> -		clocks = <&edp_refclk>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@1 {
> -				reg = <1>;
> -
> -				bridge_in: endpoint {
> -					remote-endpoint = <&dpi_out>;
> -				};
> -			};
> -
> -			port@2 {
> -				reg = <2>;
> -
> -				bridge_out: endpoint {
> -					remote-endpoint = <&panel_in>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> new file mode 100644
> index 000000000000..8e27e6f0fc7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/toshiba,tc358767.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC358767 MIPI-DSI or MIPI-DPI to DP/eDP bridge
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - toshiba,tc358767
> +
> +  reg:
> +    description: I2C address of the bridge
> +    enum: [0x68, 0x0f]
> +
> +  clocks:
> +    description:
> +      Reference clock input. The reference clock rate must be 13MHz, 19.2MHz,
> +      26MHz, or 38.4MHz.
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ref
> +
> +  reset-gpios:
> +    description: GPIO connected to the RSTX signal.
> +    maxItems: 1
> +
> +  shutdown-gpios:
> +    description: GPIO connected to the SD signal.
> +    maxItems: 1
> +
> +  toshiba,hpd-pin:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description: TC356767 GPIO pin number to which HPD is connected
> +    enum:
> +      - 0
> +      - 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for MIPI DSI input
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for MIPI DPI input
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for DP/eDP output (panel or connector).
> +
> +    oneOf:
> +      - required:
> +          - port@0
> +          - port@2
> +      - required:
> +          - port@1
> +          - port@2

You could move port@2 out to:

       required:
         - port@2

> +
> +required:
> +  - compatible
> +  - reg
> +  - clock-names
> +  - clocks
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c1 {

i2c {

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@68 {
> +        compatible = "toshiba,tc358767";
> +        reg = <0x68>;
> +        clock-names = "ref";
> +        clocks = <&edp_refclk>;
> +        reset-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
> +        shutdown-gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@1 {
> +            reg = <1>;
> +            bridge_in: endpoint {
> +              remote-endpoint = <&dpi_out>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +            bridge_out: endpoint {
> +              remote-endpoint = <&panel_in>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.33.0
> 
> 
