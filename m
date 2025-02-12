Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9AA33013
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 20:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B79010E26A;
	Wed, 12 Feb 2025 19:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nInCXglg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8772F10E26A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 19:49:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B56BA41988;
 Wed, 12 Feb 2025 19:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BFBC4CEDF;
 Wed, 12 Feb 2025 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739389767;
 bh=ukMwm41SBfxitfaLU4ZcbtM2grba8h6Qwy+0LGZgnBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nInCXglgnks801jxB2IDu+Ejnmawpyz+w5xbfLDo22xAgmk+x1oHbSk2bDxkI6HW1
 pf4kKcc6PoVloU9v8xZvv8r8UfseSRSaJkrxBHGDurhtxVCHHbaTwDCT37Ow1W2EZf
 5+84Bx6xZgGI56Qi2x/yH6PFqomnlYf111TyyjzCRURyMmzqX0O8xqgS5+gW8SUnxQ
 Bknm/ouBRGDe+QT4xu6yCs5K/T3fLBCZSpewBIg1O7ajJROHqPCczrl5lPM4fy36m+
 5OVD+E896ms5MSG2MU7mwFh/hwhHwNiGaQrb9iGVhlfsCOUahlkmVBW6be5DfZx4dN
 1P2VaZhY8J8OQ==
Date: Wed, 12 Feb 2025 19:49:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Document TI LM3533 MFD
Message-ID: <20250212-reprint-underfed-fd723ebf3df3@spud>
References: <20250212075845.11338-1-clamor95@gmail.com>
 <20250212075845.11338-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2sr14TLGCRJiRmsH"
Content-Disposition: inline
In-Reply-To: <20250212075845.11338-2-clamor95@gmail.com>
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


--2sr14TLGCRJiRmsH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 09:58:41AM +0200, Svyatoslav Ryhel wrote:
> Add bindings for the LM3533 - a complete power source for
> backlight, keypad, and indicator LEDs in smartphone handsets.
> The high-voltage inductive boost converter provides the
> power for two series LED strings display backlight and keypad
> functions.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/mfd/ti,lm3533.yaml    | 221 ++++++++++++++++++
>  include/dt-bindings/mfd/lm3533.h              |  19 ++
>  2 files changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
>  create mode 100644 include/dt-bindings/mfd/lm3533.h
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml b/Docum=
entation/devicetree/bindings/mfd/ti,lm3533.yaml
> new file mode 100644
> index 000000000000..d0307e5894f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
> @@ -0,0 +1,221 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,lm3533.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3533 Complete Lighting Power Solution
> +
> +description: |
> +  The LM3533 is a complete power source for backlight,
> +  keypad, and indicator LEDs in smartphone handsets. The
> +  high-voltage inductive boost converter provides the
> +  power for two series LED strings display backlight and
> +  keypad functions.
> +  https://www.ti.com/product/LM3533
> +
> +maintainers:
> +  - Johan Hovold <jhovold@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: ti,lm3533
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
> +  ti,boost-ovp:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Boost OVP select (16V, 24V, 32V, 40V)
> +    enum: [ 0, 1, 2, 3 ]
> +    default: 0
> +
> +  ti,boost-freq:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Boost frequency select (500KHz or 1MHz)
> +    enum: [ 0, 1 ]
> +    default: 0

Properties like these should be in units, so some standard voltage-based
one for the boost and in hertz for the second. See property-units.yaml
in dt-schema.

> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +  - enable-gpios
> +
> +patternProperties:
> +  "^backlight@[01]$":
> +    type: object
> +    description:
> +      Properties for a backlight device.
> +
> +    properties:
> +      compatible:
> +        const: lm3533-backlight

Missing vendor prefix

> +
> +      reg:
> +        description: |
> +          The control bank that is used to program the two current sinks=
=2E The
> +          LM3533 has two control banks (A and B) and are represented as =
0 or 1
> +          in this property. The two current sinks can be controlled
> +          independently with both banks, or bank A can be configured to =
control
> +          both sinks with the led-sources property.
> +        minimum: 0
> +        maximum: 1
> +
> +      max-current-microamp:
> +        description:
> +          Maximum current in =B5A with a 800 =B5A step.
> +        enum: [ 5000, 5800, 6600, 7400, 8200, 9000, 9800,
> +                10600, 11400, 12200, 13000, 13800, 14600,
> +                15400, 16200, 17000, 17800, 18600, 19400,
> +                20200, 21000, 21800, 22600, 23400, 24200,
> +                25000, 25800, 26600, 27400, 28200, 29000,
> +                29800 ]
> +        default: 5000
> +
> +      default-brightness:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Default brightness level on boot.
> +        minimum: 0
> +        maximum: 255
> +        default: 255
> +
> +      pwm:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Default pwm level on boot.
> +        minimum: 0
> +        maximum: 63
> +        default: 0

Why is default-brightness /and/ a default for pwm needed? If the pwm
drives the backlight, wouldn't you only need one of these two?

If it stays, I think it needs a rename to be more clear about what it is
doing. "pwm" is very close to "pwms", the property used for phandles to
pwm providers but the use is rather different.

backlight/common.yaml has standard properties that you could be using,
so I'd expect to see a ref here, rather than redefining your own
version.

> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: false
> +
> +  "^led@[0-3]$":
> +    type: object
> +    description:
> +      Properties for a led device.
> +
> +    properties:
> +      compatible:
> +        const: lm3533-leds

Ditto here re: compatible.

> +
> +      reg:
> +        description:
> +          4 led banks
> +        minimum: 0
> +        maximum: 3
> +
> +      max-current-microamp:
> +        description:
> +          Maximum current in =B5A with a 800 =B5A step.
> +        enum: [ 5000, 5800, 6600, 7400, 8200, 9000, 9800,
> +                10600, 11400, 12200, 13000, 13800, 14600,
> +                15400, 16200, 17000, 17800, 18600, 19400,
> +                20200, 21000, 21800, 22600, 23400, 24200,
> +                25000, 25800, 26600, 27400, 28200, 29000,
> +                29800 ]
> +        default: 5000
> +
> +      default-trigger:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description: |
> +          This parameter, if present, is a string defining
> +          the trigger assigned to the LED. Check linux,default-trigger.
> +
> +      pwm:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Default pwm level on boot.
> +        minimum: 0
> +        maximum: 63
> +        default: 0

Same applies here, leds/common.yaml has some of these already.

> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: false
> +
> +  "^light-sensor@[0]$":

Not a pattern if it can only have 1 outcome.

> +    type: object
> +    description:
> +      Properties for an illumination sensor.
> +
> +    properties:
> +      compatible:
> +        const: lm3533-als
> +
> +      reg:
> +        const: 0
> +
> +      resistor-value:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          PWM resistor value a linear step in currents
> +          of 10 =B5A per code based upon 2V/R_ALS.
> +        minimum: 1
> +        maximum: 127
> +        default: 1
> +

I'd expect a resistor to be measured in ohms of some sort,
hard to tell what the increments actually are here, they don't appear to
be a real unit. Are they register values?

This and all other custom properties need to have a vendor prefix on
them btw.

> +      pwm-mode:
> +        type: boolean
> +        description: Mode in which ALS is running

Are there multiple pwm modes? Or is this trying to say that, if set, the
sensor is in pwm mode? Hard to tell from the description here, sorry.

Cheers,
Conor.


> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/mfd/lm3533.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        led-controller@36 {
> +            compatible =3D "ti,lm3533";
> +            reg =3D <0x36>;
> +
> +            enable-gpios =3D <&gpio 110 GPIO_ACTIVE_HIGH>;
> +
> +            ti,boost-ovp =3D <LM3533_BOOST_OVP_24V>;
> +            ti,boost-freq =3D <LM3533_BOOST_FREQ_500KHZ>;
> +
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            backlight@0 {
> +                compatible =3D "lm3533-backlight";
> +                reg =3D <0>;
> +
> +                max-current-microamp =3D <23400>;
> +                default-brightness =3D <113>;
> +                pwm =3D <0x00>;
> +            };
> +        };
> +    };


--2sr14TLGCRJiRmsH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6z7QQAKCRB4tDGHoIJi
0mXKAP9Pxfv/6EGnQDex8gDTpQhlgAtjZZaGN8P0Ck+ynf1ulwEA8UhnY1kpky8h
CSf4ymU5K1BBdq8/Ycg+1y5t2JyZyAI=
=lDN7
-----END PGP SIGNATURE-----

--2sr14TLGCRJiRmsH--
