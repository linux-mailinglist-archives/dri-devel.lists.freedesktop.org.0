Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF5B63AF80
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 18:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E7E10E31B;
	Mon, 28 Nov 2022 17:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0748910E31B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 17:42:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ozi9L-0006hp-0U; Mon, 28 Nov 2022 18:42:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ozi9I-000tFv-G5; Mon, 28 Nov 2022 18:42:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ozi9I-0011Vx-8G; Mon, 28 Nov 2022 18:42:32 +0100
Date: Mon, 28 Nov 2022 18:42:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1] dt-bindings: display: Convert fsl,imx-fb.txt to
 dt-schema
Message-ID: <20221128174232.irad6caswhz2y2jk@pengutronix.de>
References: <20221110094945.191100-1-u.kleine-koenig@pengutronix.de>
 <20221116174921.GA25509@pengutronix.de>
 <2b0463c1-7fee-b7f0-5cf7-0448a6aab4a7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3f6icgljmgqv3qn4"
Content-Disposition: inline
In-Reply-To: <2b0463c1-7fee-b7f0-5cf7-0448a6aab4a7@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3f6icgljmgqv3qn4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 06:49:02PM +0100, Krzysztof Kozlowski wrote:
> On 16/11/2022 18:49, Philipp Zabel wrote:
> > On Thu, Nov 10, 2022 at 10:49:45AM +0100, Uwe Kleine-K=F6nig wrote:
> > [...]
> >> new file mode 100644
> >> index 000000000000..c3cf6f92a766
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> >> @@ -0,0 +1,110 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/imx/fsl,imx-lcdc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Freescale i.MX LCD Controller, found on i.MX1, i.MX21, i.MX25 =
and i.MX27
> >> +
> >> +maintainers:
> >> +  - Sascha Hauer <s.hauer@pengutronix.de>
> >> +  - Pengutronix Kernel Team <kernel@pengutronix.de>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - fsl,imx1-fb
> >> +              - fsl,imx21-fb
> >=20
> > Are the items/enum keywords superfluous here? Couldn't this just be two
> >=20
> >          - const: fsl,imx1-fb
> >          - const: fsl,imx21-fb
> >=20
> > entries?
>=20
> Only "items" is, so should be dropped.

Status quo are the following settings:

imx25.dtsi uses:
	compatible =3D "fsl,imx25-fb", "fsl,imx21-fb";
imx27.dtsi uses:
	compatible =3D "fsl,imx27-fb", "fsl,imx21-fb";

The fb driver (drivers/video/fbdev/imxfb.c) supports devices with
"fsl,imx1-fb" and "fsl,imx21-fb" in their comaptible list.

So my best guess is to assume an i.MX21 would use

	compatible =3D "fsl,imx21-fb";

and an i.MX1 would use:

	compatible =3D "fsl,imx1-fb";

=2E Looking at the driver it might be that it works in i.MX1 mode on an
i.MX2x. The latter has some additional registers, higher y-resolution
and supports 16, 18 and 24 bpp.

However my actual plan was to support the drm driver with the saner
binding on i.MX25 and not cleanup the driver and binding I want to
deprecate.

So I'd go for putting into the legacy binding what is currently done in
arch/arm/boot/dts and the driver allowing exactly:

	compatible =3D "fsl,imx27-fb", "fsl,imx21-fb";
	compatible =3D "fsl,imx25-fb", "fsl,imx21-fb";
	compatible =3D "fsl,imx21-fb";
	compatible =3D "fsl,imx1-fb";

I thinks this is accomplished using:

  compatible:
    oneOf:
      - enum:
          - fsl,imx1-fb
	  - fsl,imx21-fb
      - items
          - enum:
	      - fsl,imx25-fb
	      - fsl,imx27-fb
	  - const: fsl,imx21-fb

right?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3f6icgljmgqv3qn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOE8wQACgkQwfwUeK3K
7AlT0QgAgovHzvz271l8Ti2LI57evWjmOB5E6M2++U4ZgHIMTxWCgxzks1HoRrQI
KAVy5S2qRUAHjwAncrgzwAGvdg9Ha31EzeK4fYIpF2iOvWoCiXOhCZYnT5PEegZu
n8s5z4W7XT0qQeEg6c417mSq2wVsMgtZE9ZVE2k9o2PH3rSs6syz6fJsKGxyZPCG
P4IxC2NiFqIJ+nlefeAuhjiluseQd3LC5NPUo7Uz9/KrSCOJN/QBFDNWMr4wTg/g
DgZd0ZRuDctEss+D9rdFzKhXcCYrRMfXKZr0LeOohNdvlnf2j8YHs4pP/hsrNPaQ
pEaZuDzrbThnJAp5GYY13i9WAwGWYQ==
=4JL6
-----END PGP SIGNATURE-----

--3f6icgljmgqv3qn4--
