Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E85179E2E9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 11:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747F410E34F;
	Wed, 13 Sep 2023 09:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BA110E34F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 09:04:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qgLn3-0005KH-BZ; Wed, 13 Sep 2023 11:04:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qgLn1-005yTW-MW; Wed, 13 Sep 2023 11:04:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qgLn0-001Htc-UT; Wed, 13 Sep 2023 11:04:02 +0200
Date: Wed, 13 Sep 2023 11:04:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20230913090400.ujxm7zv66qe4weuj@pengutronix.de>
References: <20230913110939.574c7ec2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="clcng7srrdwctgdk"
Content-Disposition: inline
In-Reply-To: <20230913110939.574c7ec2@canb.auug.org.au>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--clcng7srrdwctgdk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:09:39AM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/mediatek/mtk_dpi.c
>=20
> between commits:
>=20
>   47d4bb6bbcdb ("drm/mediatek: mtk_dpi: Simplify with devm_drm_bridge_add=
()")
>   90c95c3892dd ("drm/mediatek: mtk_dpi: Switch to .remove_new() void call=
back")
>=20
> from Linus' tree and commit:
>=20
>   c04ca6bbb7ea ("drm/mediatek: Convert to platform remove callback return=
ing void")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (the latter is the same as 90c95c3892dd)

That's not entirely true:

uwe@taurus:~/gsrc/linux$ git show --oneline --stat 90c95c3892dd
90c95c3892dd drm/mediatek: mtk_dpi: Switch to .remove_new() void callback
 drivers/gpu/drm/mediatek/mtk_dpi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
uwe@taurus:~/gsrc/linux$ git show --oneline --stat c04ca6bbb7ea
c04ca6bbb7ea drm/mediatek: Convert to platform remove callback returning vo=
id
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 6 ++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dp.c         | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 6 ++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 6 ++----
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 6 ++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 5 ++---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c   | 6 ++----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c   | 5 ++---
 14 files changed, 28 insertions(+), 54 deletions(-)

But yes, restricted to drivers/gpu/drm/mediatek/mtk_dpi.c the patches do
the same (but have a different base, so there is some fuzz):

$ diff -u <(git show c04ca6bbb7ea drivers/gpu/drm/mediatek/mtk_dpi.c ) <(gi=
t show 90c95c3892dd)
--- /dev/fd/63	2023-09-13 10:22:37.368055450 +0200
+++ /dev/fd/62	2023-09-13 10:22:37.372055516 +0200
@@ -1,46 +1,36 @@
-commit c04ca6bbb7ea6ea7cba9ba8d3d4d4c767008d189
-Author: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
-Date:   Sun May 7 18:25:52 2023 +0200
+commit 90c95c3892dde019182ceac984d4ca1f3c85844b
+Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
+Date:   Wed Jul 26 10:22:43 2023 +0200

[...]

 diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek=
/mtk_dpi.c
-index 28bdb1f427ff..0ef722c24150 100644
+index e9c5a0f44537..3a140498c98a 100644
 --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
 +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
-@@ -1101,14 +1101,12 @@ static int mtk_dpi_probe(struct platform_device *p=
dev)
+@@ -1087,11 +1087,9 @@ static int mtk_dpi_probe(struct platform_device *pd=
ev)
  	return 0;
  }

 -static int mtk_dpi_remove(struct platform_device *pdev)
 +static void mtk_dpi_remove(struct platform_device *pdev)
  {
- 	struct mtk_dpi *dpi =3D platform_get_drvdata(pdev);
-
  	component_del(&pdev->dev, &mtk_dpi_component_ops);
- 	drm_bridge_remove(&dpi->bridge);
 -
 -	return 0;
  }

  static const struct of_device_id mtk_dpi_of_ids[] =3D {
-@@ -1139,7 +1137,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
+@@ -1122,7 +1120,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);

  struct platform_driver mtk_dpi_driver =3D {
  	.probe =3D mtk_dpi_probe,


e44dd16393896b2545a6d57b2c11381fe7628aa0 looks right.

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--clcng7srrdwctgdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUBev8ACgkQj4D7WH0S
/k4qSAf+OV1nuZBGo6mnwuIyxTR3yFNLsReHPsPo/eGwdbSr8OPllw1tww+TVmBm
rejF5b22dIqLvQri5u1qfc9vNhgU+re7zvsL2xwT6kSnfc21kShAIV7sq/qt9wui
JDLdvtR6q2SR1C5JxUOeOB/fxEb6W2SD5SZklt4v7Kw0OAHzcAcYJisaUps8dKfS
Pf2hhnGP6mvgM2N1uxoRo973zzWQk3RinM6vBY0l201ddUpAisyqaSDWlzK/I80J
fVz3isnr81e8scItpDW9PuOnqjgM5kP9guGK8bAl/k/KMulTTHhVyCnuyjLcSjPU
egLhqdY/KoxwPtK66jQXxuKAqJj08w==
=hXQN
-----END PGP SIGNATURE-----

--clcng7srrdwctgdk--
