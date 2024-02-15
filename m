Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B7E855E90
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9213010E391;
	Thu, 15 Feb 2024 09:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B187B10E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:54:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raYRr-00047w-9k; Thu, 15 Feb 2024 10:54:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raYRp-000rFT-Ba; Thu, 15 Feb 2024 10:54:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raYRp-005HU7-0o;
 Thu, 15 Feb 2024 10:54:29 +0100
Date: Thu, 15 Feb 2024 10:54:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: sam@ravnborg.org, bbrezillon@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lee@kernel.org, thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
 hari.prasathge@microchip.com, 
 manikandan.m@microchip.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [linux][PATCH v6 2/3] dt-bindings: atmel,hlcdc: convert pwm
 bindings to json-schema
Message-ID: <4psibzz7xylyp3zbmp3gup2gojh77bsllkyosbfdacyw4gzxuw@djl7eg4oeg2r>
References: <20240202001733.91455-1-dharma.b@microchip.com>
 <20240202001733.91455-3-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bkvbrrniz7f544mh"
Content-Disposition: inline
In-Reply-To: <20240202001733.91455-3-dharma.b@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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


--bkvbrrniz7f544mh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Feb 02, 2024 at 05:47:32AM +0530, Dharma Balasubiramani wrote:
> Convert device tree bindings for Atmel's HLCDC PWM controller to YAML
> format.
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changelog
> v5 -> v6
> - Drop the example as we have one complete example in mfd binding.
> v4 -> v5
> v3 -> v4
> - No changes
> Note: The clean up patch will be sent later as Sam suggested.
> v2 -> v3
> - Remove '|' in description, as there is no formatting to preserve.
> - Delete the description for pwm-cells.
> - Drop the label for pwm node as it not used.
> v1 -> v2
> - Remove the explicit copyrights.
> - Modify title (not include words like binding/driver).
> - Modify description actually describing the hardware and not the driver.
> - Remove pinctrl properties which aren't required.
> - Drop parent node and it's other sub-device node which are not related h=
ere.
> ---
>  .../bindings/pwm/atmel,hlcdc-pwm.yaml         | 35 +++++++++++++++++++
>  .../bindings/pwm/atmel-hlcdc-pwm.txt          | 29 ---------------
>  2 files changed, 35 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm=
=2Eyaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm=
=2Etxt
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml b=
/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
> new file mode 100644
> index 000000000000..0e92868a2b68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/atmel,hlcdc-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel's HLCDC's PWM controller
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +
> +description:
> +  The LCDC integrates a Pulse Width Modulation (PWM) Controller. This bl=
ock
> +  generates the LCD contrast control signal (LCD_PWM) that controls the
> +  display's contrast by software. LCDC_PWM is an 8-bit PWM signal that c=
an be
> +  converted to an analog voltage with a simple passive filter. LCD displ=
ay
> +  panels have different backlight specifications in terms of minimum/max=
imum
> +  values for PWM frequency. If the LCDC PWM frequency range does not mat=
ch the
> +  LCD display panel, it is possible to use the standalone PWM Controller=
 to
> +  drive the backlight.
> +
> +properties:
> +  compatible:
> +    const: atmel,hlcdc-pwm
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +required:
> +  - compatible
> +  - "#pwm-cells"
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt b/=
Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt
> deleted file mode 100644
> index afa501bf7f94..000000000000
> --- a/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Device-Tree bindings for Atmel's HLCDC (High-end LCD Controller) PWM dri=
ver
> -
> -The Atmel HLCDC PWM is subdevice of the HLCDC MFD device.
> -See ../mfd/atmel-hlcdc.txt for more details.
> -
> -Required properties:
> - - compatible: value should be one of the following:
> -   "atmel,hlcdc-pwm"
> - - pinctr-names: the pin control state names. Should contain "default".
> - - pinctrl-0: should contain the pinctrl states described by pinctrl
> -   default.
> - - #pwm-cells: should be set to 3. This PWM chip use the default 3 cells
> -   bindings defined in pwm.yaml in this directory.
> -
> -Example:
> -
> -	hlcdc: hlcdc@f0030000 {
> -		compatible =3D "atmel,sama5d3-hlcdc";
> -		reg =3D <0xf0030000 0x2000>;
> -		clocks =3D <&lcdc_clk>, <&lcdck>, <&clk32k>;
> -		clock-names =3D "periph_clk","sys_clk", "slow_clk";
> -
> -		hlcdc_pwm: hlcdc-pwm {
> -			compatible =3D "atmel,hlcdc-pwm";
> -			pinctrl-names =3D "default";
> -			pinctrl-0 =3D <&pinctrl_lcd_pwm>;
> -			#pwm-cells =3D <3>;
> -		};
> -	};

I guess dropping the example is fine because it's included now in the
mfd binding.

Applied to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bkvbrrniz7f544mh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXN31QACgkQj4D7WH0S
/k6NeAf9EVR8Xz9GuvTvAqU0vc/y1P/c6V7/AtXRwh5HxqS2eziYkB1DZ7gU7MzY
pZ5nyNIvTFXxrcGr4jKn8XaFMUVLaduPRRld8o4OpCxgrRcdG6yj+MRox9gQ4eTq
H31V7tmZCubtMX1CIrNgFv91u6mj2tnndzxCS2MpVIYCt4SVG0SH9Yah3VTZ2Q4h
zHteuvTsi/4n0JIx4qBGjJerCR8+5DrTW4NxbawleSuXpqfbSSPfabVjPHd4sA9g
DnREROuPWeL3QV/aQ3F7X9y2FcfjK1B2F7V3MVm6N/S7Y/gT7NjmF1985t9O3hmK
hxUuN2McBmMJC3yK4gUBzlAYjOCE3w==
=Q1fN
-----END PGP SIGNATURE-----

--bkvbrrniz7f544mh--
