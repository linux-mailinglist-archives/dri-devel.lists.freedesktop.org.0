Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0063AEBB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 18:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEB510E300;
	Mon, 28 Nov 2022 17:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFB910E300
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 17:18:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ozhm2-0003Ke-DQ; Mon, 28 Nov 2022 18:18:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ozhm0-000tAS-SR; Mon, 28 Nov 2022 18:18:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ozhm1-0011Q7-0V; Mon, 28 Nov 2022 18:18:29 +0100
Date: Mon, 28 Nov 2022 18:18:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: display: Convert fsl,imx-fb.txt to
 dt-schema
Message-ID: <20221128171828.2ouc64el6arlv3ag@pengutronix.de>
References: <20221110094945.191100-1-u.kleine-koenig@pengutronix.de>
 <20221116172131.GA233356-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="psc2jqoxzihybe7l"
Content-Disposition: inline
In-Reply-To: <20221116172131.GA233356-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--psc2jqoxzihybe7l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Nov 16, 2022 at 11:21:31AM -0600, Rob Herring wrote:
> On Thu, Nov 10, 2022 at 10:49:45AM +0100, Uwe Kleine-K=F6nig wrote:
> > This is a straight forward conversion. Note that fsl,imx-lcdc was picked
> > as the new name as this is the compatible that should supersede the
> > legacy fb binding.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >=20
> > the eventual goal is to add drm support for this hardware. That one will
> > use a different (and more sensible) binding. However fsl,imx*-fb won't
> > go away directly, and Rob requested to describe both bindings in the
> > same file given that it describes a single hardware type.
> >=20
> > As a first step I convert the old binding to yaml. I tried to put the
> > new binding on top of that but I'm not sure about a few things in this
> > patch and so post only this first patch and once it's accepted add the
> > new binding which I guess is less overall work.
> >=20
> > What I'm unsure about is the description of the display node (Is there a
> > better description? I didn't find a schema for that.)
>=20
> That's going to be a challenge to describe because every panel binding=20
> will need a reference to those custom properties. It's a similar problem=
=20
> that spi-peripheral-props.yaml solved. But here, there may not be enough=
=20
> instances to do such a general solution. Do the panels used even have=20
> schemas yet?

Looking at the dts files in the tree[1] I only found sharp,lq035q7db03
in simple-panel which might match the display used in
arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts.

> It's kind of a separate problem. You could start with just creating a=20
> schema just listing the custom properties.

Understood that. Will try it.
=20
> > Further I didn't find documentation about additionalProperties and
> > unevaluatedProperties. Did I pick the right one here?
>=20
> example-schema.yaml talks about it some. In general, if there's a=20
> $ref to other properties for a node not defined locally, then you need=20
> unevaluatedProperties. Otherwise, additionalProperties is fine.

Not sure I got the complete picture. I'll stick to additionalProperties
and rely on people and tools to tell me if I'm wrong :-)

Best regards and thanks for the feedback,
Uwe

[1]
	&wvga in arch/arm/boot/dts/imx25-pdk.dts
	&cmo_qvga in arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.d=
ts
	&dvi_svga in arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.d=
ts
	&dvi_vga in arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-vga.dts
	&display0 in arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dts
	&display in arch/arm/boot/dts/imx27-apf27dev.dts
	&display0 in arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dts
	&display in arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
	&display0 in arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--psc2jqoxzihybe7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOE7WEACgkQwfwUeK3K
7AlLNQf+LzuZZrTcNkZwbskiUIj9bOGjwETJriOUJ+WBwQlokUZQm7vqVXJ6iszI
ihUXdsAXeCx/W2xsIfI/K/koIy6+E2CUxk+04CuJMUI+tWohpxjtCRD+CILaTL8i
bE6c1IzG6KRGIDWJVWENDcyD2cxm24+LqfZmvjqoVESEj/7M/Qz/YCqTHmoYefT4
hDZmIPGPGMMggP2YbRU2/Z5UdDkq9Si9Ivg7Ap5A1ZYHkF9MdDEA1LwOlT/vhyEV
4BOuvz2bMGHbq2jqNbgMpDWik7gR4l60CsECkMnoYU3XUWgYedh0Rp0An4jPZrFy
guBrF2ZubR5yx6vbOW69wpRJQ4QP7g==
=1Mng
-----END PGP SIGNATURE-----

--psc2jqoxzihybe7l--
