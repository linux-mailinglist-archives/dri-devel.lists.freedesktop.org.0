Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CAC64F2D9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 22:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC8910E62D;
	Fri, 16 Dec 2022 21:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673A110E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 21:01:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6HpC-00061d-LQ; Fri, 16 Dec 2022 22:00:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6Hp9-00504E-Tu; Fri, 16 Dec 2022 22:00:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6Hp9-005d4b-UL; Fri, 16 Dec 2022 22:00:55 +0100
Date: Fri, 16 Dec 2022 22:00:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] drm/imx/lcdc: Implement DRM driver for imx21
Message-ID: <20221216210054.vxz7rble3k6nwxat@pengutronix.de>
References: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
 <20221216175006.456831-3-u.kleine-koenig@pengutronix.de>
 <e33399bfe5b761ee85cf491247773f2e2fdf579b.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qsriposfjw2vd36a"
Content-Disposition: inline
In-Reply-To: <e33399bfe5b761ee85cf491247773f2e2fdf579b.camel@pengutronix.de>
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qsriposfjw2vd36a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hallo Philipp,

On Fri, Dec 16, 2022 at 07:05:13PM +0100, Philipp Zabel wrote:
> On Fr, 2022-12-16 at 18:50 +0100, Uwe Kleine-K=F6nig wrote:
> > From: Marian Cichy <m.cichy@pengutronix.de>
> >=20
> > Add support for the LCD Controller found on i.MX21 and i.MX25.
> >=20
> > It targets to be a drop in replacement for the imx-fb driver.
> >=20
> > Signed-off-by: Marian Cichy <m.cichy@pengutronix.de>
> > [ukl: Rebase to v6.1, various smaller fixes]
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > =A0drivers/gpu/drm/imx/Kconfig         |   1 +
> > =A0drivers/gpu/drm/imx/Makefile        |   1 +
>=20
> I miss drivers/gpu/drm/imx/lcdc/{Kconfig,Makefile}.

Their content is:

----- Kconfig -----
config DRM_IMX_LCDC
	tristate "Freescale i.MX LCDC displays"
	depends on DRM && (ARCH_MXC || COMPILE_TEST)
	select DRM_GEM_DMA_HELPER
	select DRM_KMS_HELPER
	help
	  Found on i.MX1, i.MX21, i.MX25 and i.MX27.
----- Makefile -----
obj-y +=3D imx-lcdc.o
----- >8 -----------

will resend the series once both dependent patches are in Linus' tree.
Until then this v3 should be good enough to give reviewers a chance to
look.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qsriposfjw2vd36a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOc3IMACgkQwfwUeK3K
7Am3bAf/XGuURZ6Ukvoi2ZYUopXfveQdlRAdNC0FVkPw0Ba6LVSnda1jTVZZ5XFA
sbjPGKye00Dt83S+GigpVDGqKgxowMzwX1m68Mf3TG+ndsa7wAvhVlBF7Uj1+l0V
Px/kOhPYPNYvFI1EEaFBwFshrqptLa4CsNPt1ybg6gSQYnDcZQU0jQEx6G2aw8tE
1USWDIbDPM867J8jsuc2voQrzxrr8RDnuCT9DW5M8IWwh1OG54vZprDqrONF98Mb
sZv1SdSoZNCdxVM1lcErQnpZizjKyydufkUOGl0nwILod0AP2tYSTmBpQMVOsZSB
xtQvYQntrDe5mFJ8aCpY43jPZUwHpw==
=+q9C
-----END PGP SIGNATURE-----

--qsriposfjw2vd36a--
