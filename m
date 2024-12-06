Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458DB9E76D7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A519010E62A;
	Fri,  6 Dec 2024 17:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ijP8pa/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF73710E62A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:14:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0FB45A443B1;
 Fri,  6 Dec 2024 17:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F420C4CEDC;
 Fri,  6 Dec 2024 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733505256;
 bh=KYrkgXaTwqhP8HgpH8nwpOb2FLa+80m4Qodso23nLzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ijP8pa/N/sftrlw1o0uXuYtH0FWCMQTmau6Oz3xKFnFL8b4AdDwUJQVNbWfjInkhe
 6HzufOZzS6dJpqOQERDFjwlQc/sOOVEAwoCMReZd4szuibM33f+X92ovoR8m2w6q1S
 9e9b8HzG7J/kddFOsYPm6rgqSiBWelleFs6m3Mw+a9FzB5r06pGzjJDGjXN+ciBZnu
 Up5VlVqJASX1X7jZthbV8paGopI3sYF9FRmZZQclQJLMbZsghLtZR3KbF43dSo964Y
 Kl5AbUoCY9VJ8FU6dYsjIurBPw7GScgBlXOAcukFbfC3QP0N5GFmPqz+EDkADlnjaJ
 HSc1IwcqJIwTw==
Date: Fri, 6 Dec 2024 17:14:12 +0000
From: Conor Dooley <conor@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML
 format adding LP886x
Message-ID: <20241206-brim-talcum-f5e8c504c572@spud>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
 <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Qlj+s/p4vOBn4o0H"
Content-Disposition: inline
In-Reply-To: <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
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


--Qlj+s/p4vOBn4o0H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 06:07:12PM +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> Add Texas Instruments' LP8864/LP8866 bindings into LP8860 converting them
> into YAML format simultaneously. While here, drop the index of the "led"
> subnode, this one is neither used nor mandated by the drivers. All the
> *-cells properties are therefore not required.

Are you sure this is a correct thing to do? The lp8860-q1 product link
cites it as being a 4-channel device. Even if the kernel only ever
supports it as a single-channel device, the binding should reflect what
it is capable of doing.

Cheers,
Conor.

>=20
> Move the file into backlight directory because all of the LP886x drivers
> are special backlight products.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  .../bindings/leds/backlight/ti,lp8860.yaml    | 86 +++++++++++++++++++
>  .../devicetree/bindings/leds/leds-lp8860.txt  | 50 -----------
>  2 files changed, 86 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,l=
p8860.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.y=
aml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
> new file mode 100644
> index 0000000000000..3ece2f6fc3f02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/ti,lp8860.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments - LP886x 4/6-Channel LED Driver family
> +
> +maintainers:
> +  - Andrew Davis <afd@ti.com>
> +  - Alexander Sverdlin <alexander.sverdlin@siemens.com>
> +
> +description: |
> +  The LP8860-Q1 is an high-efficiency LED driver with boost controller.
> +  It has 4 high-precision current sinks that can be controlled by a PWM =
input
> +  signal, a SPI/I2C master, or both.
> +
> +  LP8866-Q1, LP8866S-Q1, LP8864-Q1, LP8864S-Q1 are newer products offeri=
ng
> +  similar functionality with 4/6 channels.
> +
> +  For more product information please see the links below:
> +    https://www.ti.com/product/lp8860-q1
> +    https://www.ti.com/product/LP8864-Q1
> +    https://www.ti.com/product/LP8864S-Q1
> +    https://www.ti.com/product/LP8866-Q1
> +    https://www.ti.com/product/LP8866S-Q1
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,lp8860
> +      - ti,lp8864
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C slave address
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO pin to enable (active high) / disable the device
> +
> +  vled-supply:
> +    description: LED supply
> +
> +  led:
> +    type: object
> +    $ref: common.yaml#
> +    properties:
> +      function: true
> +      color: true
> +      label: true
> +      linux,default-trigger: true
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - led
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        led-controller@2d {
> +            compatible =3D "ti,lp8860";
> +            reg =3D <0x2d>;
> +            enable-gpios =3D <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +            vled-supply =3D <&vbatt>;
> +
> +            led {
> +                function =3D LED_FUNCTION_BACKLIGHT;
> +                color =3D <LED_COLOR_ID_WHITE>;
> +                linux,default-trigger =3D "backlight";
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Doc=
umentation/devicetree/bindings/leds/leds-lp8860.txt
> deleted file mode 100644
> index 8bb25749a3da3..0000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -* Texas Instruments - lp8860 4-Channel LED Driver
> -
> -The LP8860-Q1 is an high-efficiency LED
> -driver with boost controller. It has 4 high-precision
> -current sinks that can be controlled by a PWM input
> -signal, a SPI/I2C master, or both.
> -
> -Required properties:
> -	- compatible :
> -		"ti,lp8860"
> -	- reg : I2C slave address
> -	- #address-cells : 1
> -	- #size-cells : 0
> -
> -Optional properties:
> -	- enable-gpios : gpio pin to enable (active high)/disable the device.
> -	- vled-supply : LED supply
> -
> -Required child properties:
> -	- reg : 0
> -
> -Optional child properties:
> -	- function : see Documentation/devicetree/bindings/leds/common.txt
> -	- color : see Documentation/devicetree/bindings/leds/common.txt
> -	- label : see Documentation/devicetree/bindings/leds/common.txt (deprec=
ated)
> -	- linux,default-trigger :
> -	   see Documentation/devicetree/bindings/leds/common.txt
> -
> -Example:
> -
> -#include <dt-bindings/leds/common.h>
> -
> -led-controller@2d {
> -	compatible =3D "ti,lp8860";
> -	#address-cells =3D <1>;
> -	#size-cells =3D <0>;
> -	reg =3D <0x2d>;
> -	enable-gpios =3D <&gpio1 28 GPIO_ACTIVE_HIGH>;
> -	vled-supply =3D <&vbatt>;
> -
> -	led@0 {
> -		reg =3D <0>;
> -		function =3D LED_FUNCTION_BACKLIGHT;
> -		color =3D <LED_COLOR_ID_WHITE>;
> -		linux,default-trigger =3D "backlight";
> -	};
> -}
> -
> -For more product information please see the link below:
> -https://www.ti.com/product/lp8860-q1
> --=20
> 2.47.1
>=20

--Qlj+s/p4vOBn4o0H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1Mw5AAKCRB4tDGHoIJi
0tkXAQCu+1CVMY8L2nKR4b+9uxmoiTDyzlaE0D0NeTCJoVGIPQEA8t+yHr3xlTJt
Voy21saUBgSDby4hnc61PRkHDJ8Qvwg=
=aQUN
-----END PGP SIGNATURE-----

--Qlj+s/p4vOBn4o0H--
