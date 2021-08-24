Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F181B3F5408
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 02:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4CE89321;
	Tue, 24 Aug 2021 00:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4072389321
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 00:12:35 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtqLS6vNQz9ssD;
 Tue, 24 Aug 2021 10:12:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1629763953;
 bh=smG2A0KLlmpKlAo1m3EBk1m9rpYW/qPPGNszKvRwOTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M6T0VavKhAndB7pGZtf8ZmfojutzDUMTVroswObGTl5FJ/pnnTQhPvcIOLetH1rVM
 pLqArP+R5cilC0K56+cSp6VDunAiWNokvV2hXVsBuQoWdCPxwMFeXgOJ1ovOQ3bdws
 uA7z8yJZYRmVJHcWKRyVdndK856rcaaGtSWMfD5ks8tt6woDUOnBNDZkK0SOC1xKa1
 rLc2GzEH1G7hGimFv27mV97BkDd7kcl+OsBVDalAR/KTNVzf0Qy1ohaSL20sLDN4fK
 FLUeTRQy8+cfoOlcOdxkqWUD/G77PyNOhhYZ/klQnrGi/nX9VlcWFeD2Ri55G7+nJo
 hciDhvaeoKjuA==
Date: Tue, 24 Aug 2021 10:12:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20210824101231.72801784@canb.auug.org.au>
In-Reply-To: <20210823124122.3d088380@canb.auug.org.au>
References: <20210823124122.3d088380@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kQO=hGw=Cw+9QfpvUMF0QRy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/kQO=hGw=Cw+9QfpvUMF0QRy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Thanks Guenter for pointing this out]

On Mon, 23 Aug 2021 12:41:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
>=20
> between commit:
>=20
>   71ac6f390f6a ("drm/mediatek: Add AAL output size configuration")
>=20
> from Linus' tree and commit:
>=20
>   78d1783c3243 ("drm/mediatek: Separate aal sub driver")
>=20
> from the drm tree.
>=20
> I fixed it up (I added the following merge resolution patch after
> using the latter version of the above file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 23 Aug 2021 12:37:29 +1000
> Subject: [PATCH] drm/mediatek: merge fix for "Add AAL output size
>  configuration"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/me=
diatek/mtk_disp_aal.c
> index 64b45284766a..a6760761088b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -18,7 +18,7 @@
>  #define DISP_AAL_EN				0x0000
>  #define AAL_EN						BIT(0)
>  #define DISP_AAL_SIZE				0x0030
> -
> +#define DISP_AAL_OUTPUT_SIZE			0x04d8
> =20
>  struct mtk_disp_aal_data {
>  	bool has_gamma;
> @@ -57,6 +57,7 @@ void mtk_aal_config(struct device *dev, unsigned int w,
>  	struct mtk_disp_aal *aal =3D dev_get_drvdata(dev);
> =20
>  	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AA=
L_SIZE);
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_=
AAL_OUTPUT_SIZE);
>  }
> =20
>  void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)

My mistake, I have fixed that patch today to be this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 23 Aug 2021 12:37:29 +1000
Subject: [PATCH] drm/mediatek: merge fix for "Add AAL output size
 configuration"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/medi=
atek/mtk_disp_aal.c
index 64b45284766a..a6760761088b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -18,7 +18,7 @@
 #define DISP_AAL_EN				0x0000
 #define AAL_EN						BIT(0)
 #define DISP_AAL_SIZE				0x0030
-
+#define DISP_AAL_OUTPUT_SIZE			0x04d8
=20
 struct mtk_disp_aal_data {
 	bool has_gamma;
@@ -57,6 +57,7 @@ void mtk_aal_config(struct device *dev, unsigned int w,
 	struct mtk_disp_aal *aal =3D dev_get_drvdata(dev);
=20
 	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_=
SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_=
OUTPUT_SIZE);
 }
=20
 void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)

--=20
Cheers,
Stephen Rothwell

--Sig_/kQO=hGw=Cw+9QfpvUMF0QRy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkOW8ACgkQAVBC80lX
0Gxj3Af+JUs4RUDEmZ9oeZiWmQtN2DLoKk6/ZkCh5rNEk/sNQoV8jHrkbPeYX+qi
XKI9YLojYGGlyu4syadeBvdiXuVeYA2FR2KgLRlt/nNL5w+5w3iK2lIPK/12evI8
N0/fe2QbZoOfh/7hGOhHbefpZORb1XHNp37MbuTxp7hwVBbuPj+e89QVFRujRXgk
Eyre3Dpm2XEenEqOFX/djnCeJKQaFHbj5nHHDczAmosUxrt4ptUX+M3u7MIA6RiY
oeSxiL8qqduUxv5/5DfbuTgXKeTCryF5oDpKHsR4btwA9pwe9GD9byFfthbj6RFT
8f7G9vvZvM6ZXIlPWD4JhulCwQW3bg==
=Zv/i
-----END PGP SIGNATURE-----

--Sig_/kQO=hGw=Cw+9QfpvUMF0QRy--
