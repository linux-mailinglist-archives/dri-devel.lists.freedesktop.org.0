Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D0E178103
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 20:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A43689B5F;
	Tue,  3 Mar 2020 19:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C43489B5F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 19:01:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37D7F2AF;
 Tue,  3 Mar 2020 20:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583262066;
 bh=jsSrGBwQbX7MzYFB5fYjT6w1f8w35RqJ1NtwgCjCQeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WYOoIcwVySEF4wfQE6as9Xj5VGGz1P3k3eVEwL85GbOnLrYwBXdOMYcnAecBX3Axz
 tv1r8TwsYyw9SKVszYy1Tcaco03WqD8eG5Zwk2QhL/n5jPlZFs5HcoPYPNl3G5INAU
 VYvNSycHqmBFOyZ6FJqz7evFJGxlMuKoG5WsPNCg=
Date: Tue, 3 Mar 2020 21:00:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: display: convert panel-dpi to DT
 schema
Message-ID: <20200303190044.GL11333@pendragon.ideasonboard.com>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216181513.28109-4-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Feb 16, 2020 at 07:15:11PM +0100, Sam Ravnborg wrote:
> With panel-timing converted, now convert the single
> remaining .txt user in panel/ of panel-timing to DT schema.
> 
> v2:
>   - Drop Thierry as maintainer, as this is not a general panel binding
>     and I have no acks.
>   - Drop requirement for a panel- specific binding - "panel-dpi" is enough
>   - Updated example
> 
> v3:
>   - added yaml document terminator "..."
>   - always require a specific binding - panel-dpi (based on feedback from Rob)
>   - use "power-supply" for the supply property, and made it mandatory
>     "power-supply" is the standard property for panels
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/display/panel/panel-dpi.txt      | 50 -------------
>  .../bindings/display/panel/panel-dpi.yaml     | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> deleted file mode 100644
> index 6b203bc4d932..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Generic MIPI DPI Panel
> -======================
> -
> -Required properties:
> -- compatible: "panel-dpi"
> -
> -Optional properties:
> -- label: a symbolic name for the panel
> -- enable-gpios: panel enable gpio
> -- reset-gpios: GPIO to control the RESET pin
> -- vcc-supply: phandle of regulator that will be used to enable power to the display
> -- backlight: phandle of the backlight device
> -
> -Required nodes:
> -- "panel-timing" containing video timings
> -  (Documentation/devicetree/bindings/display/panel/display-timing.txt)
> -- Video port for DPI input
> -
> -Example
> --------
> -
> -lcd0: display@0 {
> -        compatible = "samsung,lte430wq-f0c", "panel-dpi";
> -        label = "lcd";
> -
> -        backlight = <&backlight>;
> -
> -        port {
> -            lcd_in: endpoint {
> -                    remote-endpoint = <&dpi_out>;
> -            };
> -        };
> -
> -        panel-timing {
> -                clock-frequency = <9200000>;
> -                hactive = <480>;
> -                vactive = <272>;
> -                hfront-porch = <8>;
> -                hback-porch = <4>;
> -                hsync-len = <41>;
> -                vback-porch = <2>;
> -                vfront-porch = <4>;
> -                vsync-len = <10>;
> -
> -                hsync-active = <0>;
> -                vsync-active = <0>;
> -                de-active = <1>;
> -                pixelclk-active = <1>;
> -        };
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> new file mode 100644
> index 000000000000..40079fc24a63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic MIPI DPI Panel
> +
> +maintainers:
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    description:
> +      Shall contain a panel specific compatible and "panel-dpi"
> +      in that order.
> +    items:
> +      - {}
> +      - const: panel-dpi
> +
> +  backlight: true
> +  enable-gpios: true
> +  height-mm: true
> +  label: true
> +  panel-timing: true
> +  port: true
> +  power-supply: true
> +  reset-gpios: true
> +  width-mm: true
> +
> +required:
> +  - panel-timing
> +  - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    panel@0 {
> +        compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
> +        label = "osddisplay";
> +        power-supply = <&vcc_supply>;
> +
> +        backlight = <&backlight>;
> +
> +        port {
> +            lcd_in: endpoint {
> +                remote-endpoint = <&dpi_out>;
> +            };
> +        };
> +        panel-timing {
> +            clock-frequency = <9200000>;
> +            hactive = <800>;
> +            vactive = <480>;
> +            hfront-porch = <8>;
> +            hback-porch = <4>;
> +            hsync-len = <41>;
> +            vback-porch = <2>;
> +            vfront-porch = <4>;
> +            vsync-len = <10>;
> +
> +            hsync-active = <0>;
> +            vsync-active = <0>;
> +            de-active = <1>;
> +            pixelclk-active = <1>;
> +        };
> +    };
> +
> +...
> -- 
> 2.20.1
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
