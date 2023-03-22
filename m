Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529436C45FD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8AC10E8CB;
	Wed, 22 Mar 2023 09:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8407D10E8CB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:16:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1peuZi-0008Tz-Kl; Wed, 22 Mar 2023 10:16:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1peuZh-005t2v-GG; Wed, 22 Mar 2023 10:16:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1peuZg-0070yg-UF; Wed, 22 Mar 2023 10:16:04 +0100
Date: Wed, 22 Mar 2023 10:16:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
Message-ID: <20230322091604.3zgzogskrtn3evur@pengutronix.de>
References: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2c2aouyncpmczm5x"
Content-Disposition: inline
In-Reply-To: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Marian Cichy <m.cichy@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2c2aouyncpmczm5x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:06:55PM +0300, Dan Carpenter wrote:
> The devm_drm_dev_alloc() function returns error pointers.  It never
> returns NULL.  Fix the check.
>=20
> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks!
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2c2aouyncpmczm5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQax1MACgkQj4D7WH0S
/k5w6AgAt3c7qCqEfoFBiHx1LjSNf/8dLgvIMNKE0iknXsrDb1OLuwsS62vuZCH9
0wCbQKZJnE1ym/maV3RTVu0UQNigJHNfqLjgX9L4O6+4dbttgPQwcS07VbNuirkD
jsmpnQ4zJvOjmVWD3GnAb7IzEuw/uP3fddE/ArRKHHFhCfGrvj9FOKEmxoYdcXvq
NpbrjQKqm96+X1TMqszm9p2XIYBg7IvzSDPMTLzUdyhPqxlD2617brWpmD5/Q+EY
aI27L7HMS6jhizEsGRt218g9hCOq4vXMbRM8OkIlo667vx65u6+V34+2peVpe2O3
WfBweZVxTz1+S20j4eYvKULxcAimow==
=hwTs
-----END PGP SIGNATURE-----

--2c2aouyncpmczm5x--
