Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ADF18AAEE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 04:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105096E95F;
	Thu, 19 Mar 2020 03:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963746E95F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:01:28 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id v3so711775iot.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 20:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sj5DRONGePFnAMD0m6VwnAwVGsYINDFZs3kKiK2BySo=;
 b=LrzJ//6tIeOKxdtSvFkP2OaMNgSEbd+6UZ8BIkc02kAx3yfiTOMAbrwdhvQVivM3WZ
 zchSYJHt2xZoQOe5F9UFy0Dv33xVeDXFmgJb9j7kJy0szwlUspBeuFR9XlBSnUt8miZe
 sLJp1AVgVED45YFz/8A1R+h8K4S1gZLDM4Rv2eimqWATChlBYGg/N2i2CPHzxIjsia3c
 qtlhj+N26OGUoPkreIJWsYb2SMWusKZbriYPAsMhxpzveAO5bFpL8WTskzaYMv8GJkM9
 NFuV8tI/nI/yUKUyVKyiJQUEagwWCVjXi3lJv0nGJUw6FFmPwesaqglU2b/77gjiZjTr
 fkBg==
X-Gm-Message-State: ANhLgQ3OnGO+MRqRyUi4YH5O02TyduaQDvCnofJaBSAEYUIew6XKYuwN
 /qKCtBGi2STJ2wOMxndeEw==
X-Google-Smtp-Source: ADFU+vvN0tEy2UoeXt0Uq35t7gg00cu9CjMfX2ZU0Ge4y43gv6B+0p9BCv6ru2cztfJ4yG4somcKuQ==
X-Received: by 2002:a6b:8f11:: with SMTP id r17mr804807iod.92.1584586887956;
 Wed, 18 Mar 2020 20:01:27 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id m70sm321127ilh.84.2020.03.18.20.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 20:01:27 -0700 (PDT)
Received: (nullmailer pid 30049 invoked by uid 1000);
 Thu, 19 Mar 2020 03:01:24 -0000
Date: Wed, 18 Mar 2020 21:01:24 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 22/36] dt-bindings: display: convert samsung, ld9040 to
 DT Schema
Message-ID: <20200319030124.GF29911@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-23-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-23-sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 15, 2020 at 02:44:02PM +0100, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/samsung,ld9040.txt |  66 ------------
>  .../display/panel/samsung,ld9040.yaml         | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
> deleted file mode 100644
> index 354d4d1df4ff..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Samsung LD9040 AMOLED LCD parallel RGB panel with SPI control bus
> -
> -Required properties:
> -  - compatible: "samsung,ld9040"
> -  - reg: address of the panel on SPI bus
> -  - vdd3-supply: core voltage supply
> -  - vci-supply: voltage supply for analog circuits
> -  - reset-gpios: a GPIO spec for the reset pin
> -  - display-timings: timings for the connected panel according to [1]
> -
> -The panel must obey rules for SPI slave device specified in document [2].
> -
> -Optional properties:
> -  - power-on-delay: delay after turning regulators on [ms]
> -  - reset-delay: delay after reset sequence [ms]
> -  - panel-width-mm: physical panel width [mm]
> -  - panel-height-mm: physical panel height [mm]
> -
> -The device node can contain one 'port' child node with one child
> -'endpoint' node, according to the bindings defined in [3]. This
> -node should describe panel's video bus.
> -
> -[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
> -[2]: Documentation/devicetree/bindings/spi/spi-bus.txt
> -[3]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -	lcd@0 {
> -		compatible = "samsung,ld9040";
> -		reg = <0>;
> -		vdd3-supply = <&ldo7_reg>;
> -		vci-supply = <&ldo17_reg>;
> -		reset-gpios = <&gpy4 5 0>;
> -		spi-max-frequency = <1200000>;
> -		spi-cpol;
> -		spi-cpha;
> -		power-on-delay = <10>;
> -		reset-delay = <10>;
> -		panel-width-mm = <90>;
> -		panel-height-mm = <154>;
> -
> -		display-timings {
> -			timing {
> -				clock-frequency = <23492370>;
> -				hactive = <480>;
> -				vactive = <800>;
> -				hback-porch = <16>;
> -				hfront-porch = <16>;
> -				vback-porch = <2>;
> -				vfront-porch = <28>;
> -				hsync-len = <2>;
> -				vsync-len = <1>;
> -				hsync-active = <0>;
> -				vsync-active = <0>;
> -				de-active = <0>;
> -				pixelclk-active = <0>;
> -			};
> -		};
> -
> -		port {
> -			lcd_ep: endpoint {
> -				remote-endpoint = <&fimd_dpi_ep>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> new file mode 100644
> index 000000000000..b6e7e87411e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,ld9040.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung LD9040 AMOLED LCD parallel RGB panel with SPI control bus
> +
> +maintainers:
> +  - Andrzej Hajda <a.hajda@samsung.com>
> +
> +allOf:
> +  - $ref: ../../spi/spi-slave.yaml#
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,ld9040
> +
> +  display-timings: true
> +  port: true
> +  reg: true
> +  reset-gpios: true
> +
> +  vdd3-supply:
> +    description: core voltage supply
> +
> +  vci-supply:
> +    description: voltage supply for analog circuits
> +
> +  power-on-delay:
> +    description: delay after turning regulators on [ms]

This shouldn't really be needed with a specific compatible...

It needs a type reference.

> +
> +  reset-delay:
> +    description: delay after reset sequence [ms]

So does this.

> +
> +  panel-width-mm:
> +    description: physical panel width [mm]

And this.

> +
> +  panel-height-mm:
> +    description: physical panel height [mm]
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd3-supply
> +  - vci-supply
> +  - reset-gpios
> +  - display-timings
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        lcd@0 {
> +            compatible = "samsung,ld9040";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            reg = <0>;
> +            vdd3-supply = <&ldo7_reg>;
> +            vci-supply = <&ldo17_reg>;
> +            reset-gpios = <&gpy4 5 0>;
> +            spi-max-frequency = <1200000>;
> +            spi-cpol;
> +            spi-cpha;
> +            power-on-delay = <10>;
> +            reset-delay = <10>;
> +            panel-width-mm = <90>;
> +            panel-height-mm = <154>;
> +
> +            display-timings {
> +                timing {
> +                    clock-frequency = <23492370>;
> +                    hactive = <480>;
> +                    vactive = <800>;
> +                    hback-porch = <16>;
> +                    hfront-porch = <16>;
> +                    vback-porch = <2>;
> +                    vfront-porch = <28>;
> +                    hsync-len = <2>;
> +                    vsync-len = <1>;
> +                    hsync-active = <0>;
> +                    vsync-active = <0>;
> +                    de-active = <0>;
> +                    pixelclk-active = <0>;
> +                };
> +            };
> +
> +            port {
> +                lcd_ep: endpoint {
> +                    remote-endpoint = <&fimd_dpi_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
