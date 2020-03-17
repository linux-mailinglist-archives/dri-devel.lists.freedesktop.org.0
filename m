Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C018873E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3F16E5C5;
	Tue, 17 Mar 2020 14:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A53889467
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1584444745;
 h=from:from:sender:reply-to:subject:subject:date:date:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+7dh6imzzMej5xNbU5tRJ/IfCuo2k2gsb2Hk62Jwlyw=;
 b=AePaoEOIXqnBOx/pD8eDrfVeXUiViZiYFAVy0hg5IoOJpvQ60yB/s8L5I17dOSlG0htFAu
 R++lgDvz3OS11hgfOND0Z9HOh5vwNdE/ZApcNeq5KtQQmS9MmPqtygmOqI9OuYx//+rDnj
 zEAJ/C9vw0m5GgjW9bky6UmXIh8Nbcw=
Date: Tue, 17 Mar 2020 12:32:07 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v1 13/36] dt-bindings: display: convert
 kingdisplay,kd035g6-54nt to DT Schema
To: Sam Ravnborg <sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-14-sam@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-14-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andrzej Hajda <a.hajda@samsung.com>,
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
 Purism Kernel Team <kernel@puri.sm>, Lin Huang <hl@rock-chips.com>,
 Douglas Anderson <dianders@chromium.org>, linux-spi@vger.kernel.org,
 Peter Rosin <peda@axentia.se>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Message-Id: <20200317141650.8B3F16E5C5@gabe.freedesktop.org>

Hi Sam,

Le dim. 15 mars 2020 =E0 14:43, Sam Ravnborg <sam@ravnborg.org> a =E9crit =

:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../panel/kingdisplay,kd035g6-54nt.txt        | 42 -------------
>  .../panel/kingdisplay,kd035g6-54nt.yaml       | 60 =

> +++++++++++++++++++
>  2 files changed, 60 insertions(+), 42 deletions(-)
>  delete mode 100644 =

> Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.=
txt
>  create mode 100644 =

> Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.=
yaml
> =

> diff --git =

> a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54n=
t.txt =

> b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54n=
t.txt
> deleted file mode 100644
> index fa9596082e44..000000000000
> --- =

> a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54n=
t.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "kingdisplay,kd035g6-54nt"
> -- power-supply: See panel-common.txt
> -- reset-gpios: See panel-common.txt
> -
> -Optional properties:
> -- backlight: see panel-common.txt
> -
> -The generic bindings for the SPI slaves documented in [1] also apply.
> -
> -The device node can contain one 'port' child node with one child
> -'endpoint' node, according to the bindings defined in [2]. This
> -node should describe panel's video bus.
> -
> -[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
> -[2]: Documentation/devicetree/bindings/graph.txt
> -
> -Example:
> -
> -&spi {
> -	panel@0 {
> -		compatible =3D "kingdisplay,kd035g6-54nt";
> -		reg =3D <0>;
> -
> -		spi-max-frequency =3D <3125000>;
> -		spi-3wire;
> -		spi-cs-high;
> -
> -		reset-gpios =3D <&gpe 2 GPIO_ACTIVE_LOW>;
> -
> -		backlight =3D <&backlight>;
> -		power-supply =3D <&ldo6>;
> -
> -		port {
> -			panel_input: endpoint {
> -				remote-endpoint =3D <&panel_output>;
> -			};
> -		};
> -	};
> -};
> diff --git =

> a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54n=
t.yaml =

> b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54n=
t.yaml
> new file mode 100644
> index 000000000000..31fc63294a9f
> --- /dev/null
> +++ =

> b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54n=
t.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: =

> http://devicetree.org/schemas/display/panel/kingdisplay,kd035g6-54nt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT =

> LCD panel
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +allOf:
> +  - $ref: ../../spi/spi-slave.yaml#
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: kingdisplay,kd035g6-54nt
> +
> +  backlight: true
> +  port: true
> +  power-supply: true
> +  reg: true
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - power-supply
> +  - reset-gpios
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "kingdisplay,kd035g6-54nt";
> +            reg =3D <0>;
> +
> +            spi-max-frequency =3D <3125000>;
> +            spi-3wire;
> +            spi-cs-high;
> +
> +            reset-gpios =3D <&gpe 2 GPIO_ACTIVE_LOW>;
> +
> +            backlight =3D <&backlight>;
> +            power-supply =3D <&ldo6>;
> +
> +            port {
> +                panel_input: endpoint {
> +                    remote-endpoint =3D <&panel_output>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> --
> 2.20.1
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
