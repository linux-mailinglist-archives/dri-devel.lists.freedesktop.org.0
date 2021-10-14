Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B942E2BA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 22:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC94B6EC68;
	Thu, 14 Oct 2021 20:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E89F6EC64
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 20:26:09 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id g125so10013818oif.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2aHKQKohGHGpk/MatBTbP6XDKQvJpmcSe7qNkG6DZok=;
 b=RE1QxAQzejtr5BfiZzK/MtOQJgn4OG+1H4iN3fwq9PX8vpyva7/Cm3BM/g9z7waQEQ
 lr1I6vPqx6nmL4al9dZaqPxJKqi4Y9kdy+F0r7l0i9AUVnEyffQYqTpB2n0dmquCnxiw
 vcJFy/tbWcx/pjREAU+x17hpA604sh7qxzjqKQNZ5gl8K7m5xPqdS29xeMDDjjLUncnV
 5m7ToBteGjeLgSzhTCw/+yHMmLKE+Hrw26eGWnI9DkWIZboISdGGn6lWP962tnswydj5
 SyQevHT9H8/Qz1WF7HygiA9l9ZvPcV3BdsR4rNjU+MhdZFAbtc/+IB0O4zvI6AtzBNO6
 dNDw==
X-Gm-Message-State: AOAM532RXYO/joPb28nQDMf16a+/ORcFXzArz4r8Afvao75K+CbEb2uL
 bh/+/z7peklUOMMeRitJsg==
X-Google-Smtp-Source: ABdhPJyBnYn5MvMsqkDKvnQ+/dsmTWdLCTaCpyxg7n8mfq03mFhSP0BRc10xrt6YOtOsmaoGoZzj8Q==
X-Received: by 2002:aca:eb42:: with SMTP id j63mr5636680oih.11.1634243168469; 
 Thu, 14 Oct 2021 13:26:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f10sm741874otl.57.2021.10.14.13.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 13:26:07 -0700 (PDT)
Received: (nullmailer pid 3864570 invoked by uid 1000);
 Thu, 14 Oct 2021 20:26:07 -0000
Date: Thu, 14 Oct 2021 15:26:07 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, a.hajda@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display/bridge: sil,sii8620: Convert to
 YAML binding
Message-ID: <YWiSX+wQbBOzW+nK@robh.at.kernel.org>
References: <20211006150459.584875-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006150459.584875-1-angelogioacchino.delregno@collabora.com>
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

On Wed, Oct 06, 2021 at 05:04:59PM +0200, AngeloGioacchino Del Regno wrote:
> Convert the Silicon Image SiI8620 HDMI/MHL bridge documentation to YAML.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/display/bridge/sil,sii8620.yaml  | 93 +++++++++++++++++++
>  .../bindings/display/bridge/sil-sii8620.txt   | 33 -------
>  2 files changed, 93 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
> new file mode 100644
> index 000000000000..5a38595b6687
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/sil,sii8620.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Silicon Image SiI8620 HDMI/MHL bridge
> +
> +maintainers:
> +  - Andrzej Hajda <a.hajda@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: sil,sii8620
> +
> +  reg:
> +    description: I2C address of the bridge
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xtal
> +
> +  cvcc10-supply:
> +    description: Digital Core Supply Voltage, 1.0V
> +
> +  iovcc18-supply:
> +    description: I/O voltage supply, 1.8V
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO connected to the reset pin.
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for HDMI input

No need for 'ports' with only one port. However, this *should* have an 
output port for a connector, so I'm okay with this change. However, 
don't add that now. Just note the addition of 'ports' in the commit msg.

> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - cvcc10-supply
> +  - iovcc18-supply
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c1 {

i2c {

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@39 {
> +        compatible = "sil,sii8620";
> +        reg = <0x39>;
> +        cvcc10-supply = <&ldo36_reg>;
> +        iovcc18-supply = <&ldo34_reg>;
> +        interrupt-parent = <&gpf0>;
> +        interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
> +        reset-gpios = <&gpv7 0 GPIO_ACTIVE_HIGH>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            mhl_to_hdmi: endpoint {
> +              remote-endpoint = <&hdmi_to_mhl>;
> +            };
> +          };
> +        };
> +      };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt b/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
> deleted file mode 100644
> index b05052f7d62f..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Silicon Image SiI8620 HDMI/MHL bridge bindings
> -
> -Required properties:
> -	- compatible: "sil,sii8620"
> -	- reg: i2c address of the bridge
> -	- cvcc10-supply: Digital Core Supply Voltage (1.0V)
> -	- iovcc18-supply: I/O Supply Voltage (1.8V)
> -	- interrupts: interrupt specifier of INT pin
> -	- reset-gpios: gpio specifier of RESET pin
> -	- clocks, clock-names: specification and name of "xtal" clock
> -	- video interfaces: Device node can contain video interface port
> -			    node for HDMI encoder according to [1].
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -	sii8620@39 {
> -		reg = <0x39>;
> -		compatible = "sil,sii8620";
> -		cvcc10-supply = <&ldo36_reg>;
> -		iovcc18-supply = <&ldo34_reg>;
> -		interrupt-parent = <&gpf0>;
> -		interrupts = <2 0>;
> -		reset-gpio = <&gpv7 0 0>;
> -		clocks = <&pmu_system_controller 0>;
> -		clock-names = "xtal";
> -
> -		port {
> -			mhl_to_hdmi: endpoint {
> -				remote-endpoint = <&hdmi_to_mhl>;
> -			};
> -		};
> -	};
> -- 
> 2.33.0
> 
> 
