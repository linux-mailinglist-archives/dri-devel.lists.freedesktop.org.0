Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1B211CAF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCB76E997;
	Thu,  2 Jul 2020 07:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617D56E12B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593621147; bh=yQdyiwJG0A0w25TNt5S9+Tyx+rihJlmHrZ5Ch0iuRzo=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=H/T1TXu+32OpzHlT61UjI0935+8p6dAuEkqfx9vm7iFtVjPE4z/J+Zf3Eva+u61dD
 lhphd6NgFd7dBXdwVuKBgneRowDJ2HWBkotWxkYXj6hEcv5K3Tm/bm1tAPiTooX6et
 O7zdc3SpFdseCm+TyAwBulGGQ+w+KxdHGPvEHjFc=
Date: Wed, 1 Jul 2020 18:32:27 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>
Subject: Re: [PATCH v6 02/13] dt-bindings: panel: Convert
 rocktech,jh057n00900 to yaml
Message-ID: <20200701163227.on7wo6fo5majket6@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>,
 linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Purism Kernel Team <kernel@puri.sm>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Icenowy Zheng <icenowy@aosc.io>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>,
 Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
 Bhushan Shah <bshah@kde.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-3-megous@megous.com>
 <20200701155857.GB174356@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701155857.GB174356@bogon.m.sigxcpu.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Guido,

On Wed, Jul 01, 2020 at 05:58:57PM +0200, Guido G=FCnther wrote:
> Hi Ondrej,
> On Wed, Jul 01, 2020 at 12:31:15PM +0200, Ondrej Jirman wrote:
> > Convert Rocktech MIPI DSI panel driver from txt to yaml bindings.
> > =

> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  .../display/panel/rocktech,jh057n00900.txt    | 23 -------
> >  .../display/panel/rocktech,jh057n00900.yaml   | 66 +++++++++++++++++++
> >  2 files changed, 66 insertions(+), 23 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/roc=
ktech,jh057n00900.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.ya=
ml
> =

> Thanks for the conversion! Shouldn't we switch to `sitronix-st7703.yaml`
> as well in this patch?

Names of yaml files should be according to one of the compatibles.

And thank you for your review of the patches.

regards,
	o.

> Cheers,
>  -- Guido
> =

> > =

> > diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,j=
h057n00900.txt b/Documentation/devicetree/bindings/display/panel/rocktech,j=
h057n00900.txt
> > deleted file mode 100644
> > index a372c5d84695..000000000000
> > --- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00=
900.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -Rocktech jh057n00900 5.5" 720x1440 TFT LCD panel
> > -
> > -Required properties:
> > -- compatible: should be "rocktech,jh057n00900"
> > -- reg: DSI virtual channel of the peripheral
> > -- reset-gpios: panel reset gpio
> > -- backlight: phandle of the backlight device attached to the panel
> > -- vcc-supply: phandle of the regulator that provides the vcc supply vo=
ltage.
> > -- iovcc-supply: phandle of the regulator that provides the iovcc supply
> > -  voltage.
> > -
> > -Example:
> > -
> > -	&mipi_dsi {
> > -		panel@0 {
> > -			compatible =3D "rocktech,jh057n00900";
> > -			reg =3D <0>;
> > -			backlight =3D <&backlight>;
> > -			reset-gpios =3D <&gpio3 13 GPIO_ACTIVE_LOW>;
> > -			vcc-supply =3D <&reg_2v8_p>;
> > -			iovcc-supply =3D <&reg_1v8_p>;
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,j=
h057n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,=
jh057n00900.yaml
> > new file mode 100644
> > index 000000000000..928ba42e7f8d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00=
900.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/rocktech,jh057n00900.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rocktech JH057N00900 5.5" 720x1440 TFT LCD panel
> > +
> > +maintainers:
> > +  - Ondrej Jirman <megi@xff.cz>
> > +
> > +description: |
> > +             Rocktech JH057N00900 is a 720x1440 TFT LCD panel
> > +             connected using a MIPI-DSI video interface.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: rocktech,jh057n00900
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: DSI virtual channel
> > +
> > +  vcc-supply:
> > +    description: Panel power supply
> > +
> > +  iovcc-supply:
> > +    description: I/O voltage supply
> > +
> > +  reset-gpios:
> > +    description: GPIO used for the reset pin
> > +    maxItems: 1
> > +
> > +  backlight:
> > +    description: Backlight used by the panel
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vcc-supply
> > +  - iovcc-supply
> > +  - reset-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +      panel@0 {
> > +        compatible =3D "rocktech,jh057n00900";
> > +        reg =3D <0>;
> > +        vcc-supply =3D <&reg_2v8_p>;
> > +        iovcc-supply =3D <&reg_1v8_p>;
> > +        reset-gpios =3D <&gpio3 13 GPIO_ACTIVE_LOW>;
> > +        backlight =3D <&backlight>;
> > +      };
> > +    };
> > +...
> > -- =

> > 2.27.0
> > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
