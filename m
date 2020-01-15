Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362513CE7B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 22:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CD16EA94;
	Wed, 15 Jan 2020 21:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50AA6EA94
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 21:01:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 684A8804C3;
 Wed, 15 Jan 2020 22:01:06 +0100 (CET)
Date: Wed, 15 Jan 2020 22:01:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: sitronix,st7735r: Convert
 to DT schema
Message-ID: <20200115210104.GA28904@ravnborg.org>
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115124548.3951-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gEfo2CItAAAA:8
 a=WZHNqt2aAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=o07Ec-Mc6pqL289OE5cA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=PrHl9onO2p7xFKlKy1af:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22 a=pHzHmUro8NiASowvMSCR:22
 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert.

Thanks for doing the conversion to meta-schema.

On Wed, Jan 15, 2020 at 01:45:44PM +0100, Geert Uytterhoeven wrote:
> Convert the DT binding documentation for Sitronix ST7735R displays to DT
> schema.
> 
> Add a reference to the Adafruit 1.8" LCD while at it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> new file mode 100644
> index 0000000000000000..21bccc91f74255e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only
Use (GPL-2.0-only OR BSD-2-Clause) for new binding files.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sitronix,st7735r.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix ST7735R Display Panels Device Tree Bindings
> +
> +maintainers:
> +  - David Lechner <david@lechnology.com>
> +
> +description:
> +  This binding is for display panels using a Sitronix ST7735R controller in
> +  SPI mode.
> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#

I am no binding expert so I do not know how to add it.
But the old binding described that this MUST be a child of spi.
This is missing here.

Other panels using spi does not have it - so it is probarly OK.

So with the license fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          Adafruit 1.8" 160x128 Color TFT LCD (Product ID 358 or 618)
> +        items:
> +          - enum:
> +              - jianda,jd-t18003-t01
> +          - const: sitronix,st7735r
> +
> +  spi-max-frequency:
> +    maximum: 32000000
> +
> +  dc-gpios:
> +    maxItems: 1
> +    description: Display data/command selection (D/CX)
> +
> +required:
> +  - compatible
> +  - reg
> +  - dc-gpios
> +  - reset-gpios
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    backlight: backlight {
> +            compatible = "gpio-backlight";
> +            gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
> +    };
> +
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            display@0{
> +                    compatible = "jianda,jd-t18003-t01", "sitronix,st7735r";
> +                    reg = <0>;
> +                    spi-max-frequency = <32000000>;
> +                    dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
> +                    reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
> +                    rotation = <270>;
> +            };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea8262509bdd21ac..3007f83bd504194a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5382,7 +5382,7 @@ M:	David Lechner <david@lechnology.com>
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  S:	Maintained
>  F:	drivers/gpu/drm/tiny/st7735r.c
> -F:	Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> +F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
>  
>  DRM DRIVER FOR SONY ACX424AKP PANELS
>  M:	Linus Walleij <linus.walleij@linaro.org>
> -- 
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
