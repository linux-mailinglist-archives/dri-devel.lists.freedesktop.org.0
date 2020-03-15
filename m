Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A89185EC8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Mar 2020 18:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A3B89214;
	Sun, 15 Mar 2020 17:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76ED89214
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 17:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id EBD7BFB03;
 Sun, 15 Mar 2020 18:58:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QEgVtUjIBhwL; Sun, 15 Mar 2020 18:58:40 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 62A474117D; Sun, 15 Mar 2020 18:58:39 +0100 (CET)
Date: Sun, 15 Mar 2020 18:58:39 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 19/36] dt-bindings: display: convert
 rocktech,jh057n00900 to DT Schema
Message-ID: <20200315175839.GA4953@bogon.m.sigxcpu.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-20-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-20-sam@ravnborg.org>
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
 Nikolaus Schaller <hns@goldelico.com>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Jonathan Bakker <xc-racer2@live.ca>,
 Brian Masney <masneyb@onstation.org>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Sun, Mar 15, 2020 at 02:43:59PM +0100, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: "Guido G=FCnther" <agx@sigxcpu.org>
> Cc: Purism Kernel Team <kernel@puri.sm>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>

Thanks!
 -- Guido

> ---
>  .../display/panel/rocktech,jh057n00900.txt    | 23 --------
>  .../display/panel/rocktech,jh057n00900.yaml   | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/rockt=
ech,jh057n00900.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/rockt=
ech,jh057n00900.yaml
> =

> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh0=
57n00900.txt b/Documentation/devicetree/bindings/display/panel/rocktech,jh0=
57n00900.txt
> deleted file mode 100644
> index a372c5d84695..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n0090=
0.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Rocktech jh057n00900 5.5" 720x1440 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "rocktech,jh057n00900"
> -- reg: DSI virtual channel of the peripheral
> -- reset-gpios: panel reset gpio
> -- backlight: phandle of the backlight device attached to the panel
> -- vcc-supply: phandle of the regulator that provides the vcc supply volt=
age.
> -- iovcc-supply: phandle of the regulator that provides the iovcc supply
> -  voltage.
> -
> -Example:
> -
> -	&mipi_dsi {
> -		panel@0 {
> -			compatible =3D "rocktech,jh057n00900";
> -			reg =3D <0>;
> -			backlight =3D <&backlight>;
> -			reset-gpios =3D <&gpio3 13 GPIO_ACTIVE_LOW>;
> -			vcc-supply =3D <&reg_2v8_p>;
> -			iovcc-supply =3D <&reg_1v8_p>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh0=
57n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh=
057n00900.yaml
> new file mode 100644
> index 000000000000..827417bbff63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n0090=
0.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/rocktech,jh057n00900.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rocktech jh057n00900 5.5" 720x1440 TFT LCD panel
> +
> +maintainers:
> +  - Guido G=FCnther <agx@sigxcpu.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: rocktech,jh057n00900
> +
> +  reg: true
> +  reset-gpios: true
> +  backlight: true
> +
> +  vcc-supply:
> +    description: The regulator that provides the vcc supply voltage
> +
> +  iovcc-supply:
> +    description: The regulator that provides the iovcc supply voltage
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - backlight
> +  - vcc-supply
> +  - iovcc-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel@0 {
> +            compatible =3D "rocktech,jh057n00900";
> +            reg =3D <0>;
> +            backlight =3D <&backlight>;
> +            reset-gpios =3D <&gpio3 13 GPIO_ACTIVE_LOW>;
> +            vcc-supply =3D <&reg_2v8_p>;
> +            iovcc-supply =3D <&reg_1v8_p>;
> +        };
> +    };
> +
> +...
> -- =

> 2.20.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
