Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA407A22BD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 17:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896C010E649;
	Fri, 15 Sep 2023 15:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259B10E649
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 15:45:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7D190CE2C66;
 Fri, 15 Sep 2023 15:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0059FC433C8;
 Fri, 15 Sep 2023 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694792702;
 bh=Qregf0tH1tsCYFbBuD+Q1zfzNkRiTa1wEmXhRR539Ek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QHw1jwoHjfR5dVAEhU+mPqm5LqyXTn7IHaJ7ORwf34e38PQ9SKQ3yYRdzQtG9RCDv
 NybmMv1DkUZCVtMjTlY+I9uc9wC3SPNoRbY44vrAuah4Lb9qCt3fiQ6grgZ45Ils+/
 sAReNwpTw8E2b79fQ7a0Cy+P2JDPiBk/gIvCbvy9cpx7s6nig9UWzmBTEOylfuPqHr
 n/Mx00urPd3cb2OJHDSnLzZq/i7h1Z3CMBFN9oHCmo9MSFDerXVOtT2gk5LYv1085V
 LZrt58Xt9B6UjzJwYaGl+rGPgRGlILnGALhFb+tMshLpTTxzFMmMqh4COjDZhpd205
 X6/BDzPLHzFWQ==
Date: Fri, 15 Sep 2023 16:44:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: Add MPS MP3309C
Message-ID: <20230915-sinuous-domestic-80cd8775ecb0@spud>
References: <20230915140516.1294925-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yPgh0h9ks6ap+XUD"
Content-Disposition: inline
In-Reply-To: <20230915140516.1294925-1-f.suligoi@asem.it>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yPgh0h9ks6ap+XUD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Fri, Sep 15, 2023 at 04:05:15PM +0200, Flavio Suligoi wrote:
> The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring=
 a
> programmable switching frequency to optimize efficiency.
> The brightness can be controlled either by I2C commands (called "analog"
> mode) or by a PWM input signal (PWM mode).
> This driver supports both modes.
>=20
> For device driver details, please refer to:
> - drivers/video/backlight/mp3309c_bl.c
>=20
> The datasheet is available at:
> - https://www.monolithicpower.com/en/mp3309c.html
>=20
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>=20
> v2:
>  - remove useless properties (dimming-mode, pinctrl-names, pinctrl-0,
>    switch-on-delay-ms, switch-off-delay-ms, reset-gpios, reset-on-delay-m=
s,
>    reset-on-length-ms)
>  - add common.yaml#
>  - remove already included properties (default-brightness, max-brightness)
>  - substitute three boolean properties, used for the overvoltage-protecti=
on
>    values, with a single enum property
>  - remove some conditional definitions
>  - remove the 2nd example
> v1:
>  - first version
>=20
>  .../bindings/leds/backlight/mps,mp3309c.yaml  | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mps,=
mp3309c.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c=
=2Eyaml b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> new file mode 100644
> index 000000000000..99ccdba2c08f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/mps,mp3309c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MPS MP3309C backlight
> +
> +maintainers:
> +  - Flavio Suligoi <f.suligoi@asem.it>
> +
> +description: |
> +  The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featur=
ing a
> +  programmable switching frequency to optimize efficiency.
> +  It supports two different dimming modes:
> +
> +  - analog mode, via I2C commands (default)
> +  - PWM controlled mode.
> +
> +  The datasheet is available at:
> +  https://www.monolithicpower.com/en/mp3309c.html
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: mps,mp3309c
> +
> +  reg:
> +    maxItems: 1
> +
> +  pwms:
> +    description: if present, the backlight is controlled in PWM mode.
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: GPIO used to enable the backlight in "analog-i2c" dimmi=
ng mode.
> +    maxItems: 1
> +
> +  mps,overvoltage-protection-microvolt:
> +    description: Overvoltage protection (13.5V, 24V or 35.5V). If missin=
g, the
> +      hardware default of 35.5V is used.
> +    enum: [ 13500000, 24000000, 35500000 ]
You can add "default: 35500000" and drop the free form default as text
in the description.

Cheers,
Conor.

> +
> +  mps,no-sync-mode:
> +    description: disable synchronous rectification mode
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - max-brightness
> +  - default-brightness
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        /* Backlight with PWM control */
> +        backlight_pwm: backlight@17 {
> +            compatible =3D "mps,mp3309c-backlight";

As the bot pointed out, the compatible doesn't contain "backlight".

> +            reg =3D <0x17>;
> +            pwms =3D <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9 */
> +            max-brightness =3D <100>;
> +            default-brightness =3D <80>;
> +            overvoltage-protection-microvolt =3D <24000000>;
> +        };
> +    };
> --=20
> 2.34.1
>=20

--yPgh0h9ks6ap+XUD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQR7+QAKCRB4tDGHoIJi
0qu3AP9Bz0EaOdt7BsQosUR3kq9l/T8DdXqt/pJptO2kCXeKWQEA6onZzo3SVse2
n9/uxRJXUqWxvY0hZmRJxJVus3oZQgc=
=uV79
-----END PGP SIGNATURE-----

--yPgh0h9ks6ap+XUD--
