Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EDA7A6BE4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 21:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5958610E1D9;
	Tue, 19 Sep 2023 19:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AACA10E1D9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 19:55:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qigp2-0002Ho-Vt; Tue, 19 Sep 2023 21:55:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qigp2-007Wh3-8Y; Tue, 19 Sep 2023 21:55:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qigp1-0035rs-VN; Tue, 19 Sep 2023 21:55:47 +0200
Date: Tue, 19 Sep 2023 21:55:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/lcdc: Fix double-free of driver data
Message-ID: <20230919195546.xykqgt6kvqohe6eb@pengutronix.de>
References: <20230706092731.2630232-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yogaf7bvz6vg4bpm"
Content-Disposition: inline
In-Reply-To: <20230706092731.2630232-1-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yogaf7bvz6vg4bpm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 06, 2023 at 11:27:31AM +0200, Uwe Kleine-K=F6nig wrote:
> The struct imx_lcdc driver data is allocated using devm_drm_dev_alloc()
> so it must not be explicitly kfree()d.
>=20
> Also drm_kms_helper_poll_fini() should not be called as there is no
> matching drm_kms_helper_poll_init(). So drop the release function
> completely.
>=20
> Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

This fix is now waiting for two months to be picked up. Who feels
responsible?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yogaf7bvz6vg4bpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUJ/MEACgkQj4D7WH0S
/k745Qf/dAWyiIlIH8Ho83DpP3R/2bmeUhrb1PSbtZgy//peF7TnghJx/uBtsRBK
2uc4SB60+nZDpSy+NrsCvDLZlW6CCS/LnC0UR8ZT3GSJj3V7a6bXFIioj/7GQfPV
F5FkDniNRfku6jXV4aB31nQPVsSqVZ2EwoX6WZUmadDEcccPzyRhHmeuFx2TRMkZ
a9PFgAbU71be4+X7N5chiBsjxFNEW9bIVDMlnQ8K8FvWgVYWDPADBQqO5fTW/Xw1
3a0TUeI4Y9kGuJ93ler3fdMOKNONfxQnaUBpae/WLCapptvnMFZCJ8Gac5Ifl8A8
icUjBt1HTsBOW0OwnMWCwOK+f6D/5w==
=y55O
-----END PGP SIGNATURE-----

--yogaf7bvz6vg4bpm--
