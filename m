Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3CD3F4375
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 04:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E61089C9A;
	Mon, 23 Aug 2021 02:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA1C89C9A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 02:41:26 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtGhg08Lxz9sW8;
 Mon, 23 Aug 2021 12:41:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1629686484;
 bh=p8oByTOGAloztmMhai0zbi98JHCMQvgBGnOUIeW5GlE=;
 h=Date:From:To:Cc:Subject:From;
 b=REPKpkgZGF1lAYk7ca2EjMAU4EBNpBTVYgvTg5HkWvjO+5NBAHhdpUgQtIucXomZz
 BoDm9c+9oPxqev/1ifWcpoco6qILEBZuFbnqln3gg4CYEVw6lCPO8TM5OBazVYNWo3
 i1QiQK6r81GjQMa+Ww9Fcy4MZ+O5oUnD80EfrgiDyzA7LsT0fDSfpP5JT2b1rnwpk0
 kbg1yUSSLUrjJW7EGLUh8vqUiGP/vcHVU4vatTd5ehKG2mAih6ycRxo67YxW/uYkDR
 jhCMWXkoF9CwSj5Mo/t/Il4WjD0XZMNRr1tQ8BVIsrw7g8uRXyZll7xT0dFaWD7ni/
 6Pm0U2oZ5oLRQ==
Date: Mon, 23 Aug 2021 12:41:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20210823124122.3d088380@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bG7XfPthEFmfz/DOLSyhu7w";
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

--Sig_/bG7XfPthEFmfz/DOLSyhu7w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c

between commit:

  71ac6f390f6a ("drm/mediatek: Add AAL output size configuration")

from Linus' tree and commit:

  78d1783c3243 ("drm/mediatek: Separate aal sub driver")

from the drm tree.

I fixed it up (I added the following merge resolution patch after
using the latter version of the above file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

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
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs, DISP_AA=
L_OUTPUT_SIZE);
 }
=20
 void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/bG7XfPthEFmfz/DOLSyhu7w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEjCtIACgkQAVBC80lX
0GyDuAf+MqP/Zo6dleuzRf78dkVKcymuWgO25c2+tMTN3+2OCCf1a6xLAIqdAW21
uJ55GbQGRaazlm1go052k/0sSnpZ5w69bwxJRI6WAKurKfhqdh+xmg2OAR+q8REy
d34opG1QbdL2ZRZfr7bf/499YnRJUdYQGUlXTCYzZSiUd++8UDiEITmQekzl9Kxd
puJKg6LsojbaCifq/PDf6MX40pu3C/tms7puVNT14TVHPWgRHvigv6yeMLR+QBCF
IWO2eK5CmDTvDRlQbPHr5Vpr5nIzuDmQzk/WuCZ6X4oUvtB0+6hUrtm3MJ2VZWa9
CK5sbSfLwZfVR3OsQSe+Ra4AHi+VWg==
=5vJG
-----END PGP SIGNATURE-----

--Sig_/bG7XfPthEFmfz/DOLSyhu7w--
