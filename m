Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D6BCA8DB
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 20:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3DB10E05F;
	Thu,  9 Oct 2025 18:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MHIkDUP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE0D10E05F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 18:21:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A518F623D9;
 Thu,  9 Oct 2025 18:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3023DC4CEE7;
 Thu,  9 Oct 2025 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760034067;
 bh=gSU8W5D4kBW7HRmvXDO5mEeTlq8vT4Rj7qnh9fKuWsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MHIkDUP8L1PxRA/oWJPqb0+xdtOgd6Cv0hkFUhfzjX963Uaq73ApP7JeaUXF65O9e
 ysw38t0EbeE1V2n/6itF9XDl8LbBFsb2EH0taFpB/2djmBnBoTCyxDbpzmgdHyFYcP
 aXQkyk3fOHuDgHq2z85I22XolPBpy4S2m/JixFojMjRRPF8yWczmM6BOnoVhAsr0Ub
 OycjLXvvfJ93Df/wglCnwldJOjkr4YNCc2U/i9ThK/tT4+iRHBUU0EpbSHngC8Z7D3
 5PRafWTVx4F09M/lMsA+ifwsDyhkNfsOnYo+ILl7RTNltlKERFxLCoohw4Xh98cMI2
 ff0UNX8hKmI/A==
Date: Thu, 9 Oct 2025 19:21:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: backlight: Add max25014 bindings
Message-ID: <20251009-overjoyed-unpopular-54f69e9bd82c@spud>
References: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
 <20251009-max25014-v4-1-6adb2a0aa35f@gocontroll.com>
 <aOfM7jnlPO77YSu1@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GWNRbICvH2XFNKt7"
Content-Disposition: inline
In-Reply-To: <aOfM7jnlPO77YSu1@lizhi-Precision-Tower-5810>
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


--GWNRbICvH2XFNKt7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 10:55:42AM -0400, Frank Li wrote:
> On Thu, Oct 09, 2025 at 08:48:25AM +0200, Maud Spierings via B4 Relay wro=
te:
> > From: Maud Spierings <maudspierings@gocontroll.com>
>=20
> Subject needn't double bindings.
>=20
> dt-bindings: backlight: Add max25014 support
>=20
> >
> > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > with integrated boost controller.
> >
> > In the current implementation the control registers for channel 1,
> > control all channels. So only one led subnode with led-sources is
> > supported right now. If at some point the driver functionality is
> > expanded the bindings can be easily extended with it.
>=20
> Need descript hardware, not driver. Need descript full functions even tho=
ugh
> driver have not implement yet.
>=20
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > ---
> >  .../bindings/leds/backlight/maxim,max25014.yaml    | 109 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   5 +
> >  2 files changed, 114 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max=
25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max2501=
4.yaml
> > new file mode 100644
> > index 0000000000000..496520e1374e5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.y=
aml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Maxim max25014 backlight controller
> > +
> > +maintainers:
> > +  - Maud Spierings <maudspierings@gocontroll.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - maxim,max25014
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  enable-gpios:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-supply:
> > +    description: Regulator which controls the boost converter input ra=
il.
> > +
> > +  pwms:
> > +    maxItems: 1
> > +
> > +  maxim,iset:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maximum: 15
> > +    default: 11
> > +    description:
> > +      Value of the ISET register field. This controls the current scal=
e of the
> > +      outputs, a higher number means more current.
>=20
> Can't use register value directly, need use standard unit. or percentage
>=20
> 100: means max, 0: min.

=46rom that datasheet, it seems like the values here don't neatly map to
currents, because it depends on the value of the iref register. I don't
love percentages here either, too much of a force-fit for me.

If current is used, a property for the reference resistor will be
needed, to compute the register values. That only makes sense to me if
Maxim/Analog provide a formula that can be used to calculate the
appropriate register value, and I did not find one in the datasheet from
my quick skim, only two example current tables.
Sure, those two examples can be reverse-engineered to give a way to
compute it, but can we be sure that the numbers apply across the whole
range of permitted values for the resistor?

I don't like using register values for stuff, but I think it is the most
accurate and least likely to cause problems way of representing this.

Maud, on the language used - its the ISET field in the ISET register, I
think the property should make that clear.

> > +patternProperties:
> > +  "^led@[01]$":

Why does this have [01] if reg has to be zero?

> > +    type: object
> > +    description: Properties for a string of connected LEDs.
> > +    $ref: common.yaml#
> > +
> > +    properties:
> > +      reg:
> > +        const: 0
> > +
> > +      led-sources:
> > +        allOf:
> > +          - minItems: 1
> > +            maxItems: 4
> > +            items:
> > +              minimum: 0
> > +              maximum: 3
> > +            default: [0, 1, 2, 3]
> > +
> > +      default-brightness:
> > +        minimum: 0
> > +        maximum: 100
> > +        default: 50
> > +
> > +    required:
> > +      - reg
> > +
> > +    additionalProperties: false
>=20
> there are $ref, should use unevaluatedProperties: false

Not always, looks like they've listed some properties from the file,
which would make addtionalPropeties: false correct if they dont want
the other properties in the file to be used.

>=20
> Frank
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        backlight@6f {
> > +            compatible =3D "maxim,max25014";
> > +            reg =3D <0x6f>;
> > +            enable-gpios =3D <&gpio1 4 GPIO_ACTIVE_HIGH>;
> > +            interrupt-parent =3D <&gpio1>;
> > +            interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
> > +            power-supply =3D <&reg_backlight>;
> > +            pwms =3D <&pwm1>;
> > +            maxim,iset =3D <7>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            led@0 {
> > +                reg =3D <0>;
> > +                led-sources =3D <0 1 2 3>;
> > +                default-brightness =3D <50>;
> > +            };
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 47fbc5e06808f..be5e2515900ce 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15171,6 +15171,11 @@ F:	Documentation/userspace-api/media/drivers/m=
ax2175.rst
> >  F:	drivers/media/i2c/max2175*
> >  F:	include/uapi/linux/max2175.h
> >
> > +MAX25014 BACKLIGHT DRIVER
> > +M:	Maud Spierings <maudspierings@gocontroll.com>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> > +
> >  MAX31335 RTC DRIVER
> >  M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
> >  L:	linux-rtc@vger.kernel.org
> >
> > --
> > 2.51.0
> >
> >

--GWNRbICvH2XFNKt7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOf9DAAKCRB4tDGHoIJi
0p3tAP47AzB5bTLsDsM2hZCp4QQOrxzGbZd7QeTNZnPvuVKVjAD/ajHvzPM9GJH6
JrmJ4TzHGEQovDKBG7x28JpYUVrfTQ8=
=7s2i
-----END PGP SIGNATURE-----

--GWNRbICvH2XFNKt7--
