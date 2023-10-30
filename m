Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E217DB5A9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 10:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFDD10E251;
	Mon, 30 Oct 2023 09:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6934610E251
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 09:03:25 +0000 (UTC)
X-UUID: 292a8d78770311ee8051498923ad61e6-20231030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jpW8nuYKQCNcvGDsf1014WZCblos7bNZyKdTpmIH2FQ=; 
 b=JVin93lwmuIwizSs6Kf/pUP/kCmCYFgR0jYV6OdliDwa1DZpE5ILxNlf8J0cPkbkRcaRhclziqA2V0S8b/ttglCDBmrzoILL0r7w7UIM+c1dn+BwsI73KAcL14A7ovSCZ9rHU+dOK/7Ay4b+i4ItRgDM1cGXMn9gMG1iIX2d6AU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:fcc641cc-7094-4135-b09b-db693fc065aa, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:7964eefb-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 292a8d78770311ee8051498923ad61e6-20231030
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 604541160; Mon, 30 Oct 2023 17:03:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Oct 2023 17:03:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Oct 2023 17:03:13 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v2 1/1] drm/mediatek: Fix errors when reporting rotation
 capability
Date: Mon, 30 Oct 2023 17:03:12 +0800
Message-ID: <20231030090312.7758-2-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231030090312.7758-1-shawn.sung@mediatek.com>
References: <20231030090312.7758-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.845500-8.000000
X-TMASE-MatchedRID: 2T4BY0PVJD8ijAXMyA8nC+7KTDtx8Cgg6SXuwUgGH0hbKBBN5zqG8AYB
 5gsbo0L8o5qw/iFKtvaIJs0Up7vkWIPN2a+Tga3SFYJUGv4DL3yZ2scyRQceryI9JQsGBsNv1Fv
 g6E0U6v+4+90dmk+Zo+3NnYNx6mdYKGxJMBjfwlWxCl9NrK01yIv8pidhVYOU/vhiW664SDOrKq
 FreRg70NAOjQU9UCdqp9q9Zbsl6Oa72iRvlw4XNp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyMdRT
 5TQAJnA6oja9AxlelDUKCQ01ZUHMmpdp3WWW7eFiT0Pr/5TunGeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.845500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8FB96CD340DE745395AEC7BD8EDD4C0A760F1B1D46FA0E65C709EFE94C49C5442000:8
X-MTK: N
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For CRTCs that doesn't support rotation should still return
DRM_MODE_ROTATE_0. Returns hardware capabilities accordingly.

Fixes: 84d805753983 ("drm/mediatek: Support reflect-y plane rotation")

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 30 ++++++++++---------
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  5 ++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  2 +-
 5 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 4d6e8b667bc3..c5afeb7c5527 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -127,6 +127,7 @@ void mtk_ovl_adaptor_register_vblank_cb(struct device *dev, void (*vblank_cb)(vo
 void mtk_ovl_adaptor_unregister_vblank_cb(struct device *dev);
 void mtk_ovl_adaptor_enable_vblank(struct device *dev);
 void mtk_ovl_adaptor_disable_vblank(struct device *dev);
+unsigned int mtk_ovl_adaptor_supported_rotations(struct device *dev);
 void mtk_ovl_adaptor_start(struct device *dev);
 void mtk_ovl_adaptor_stop(struct device *dev);
 unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index ecc38932fd44..bca7b2f4b1d9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -177,6 +177,7 @@ static const u32 mt8195_ovl_crc_ofs[] = {
  * @supports_clrfmt_ext: whether the ovl supports clear format (for alpha blend)
  * @crc_ofs: crc offset table
  * @crc_cnt: count of crc registers (could be more than one bank)
+ * @rotations: supported rotations
  */
 struct mtk_disp_ovl_data {
 	unsigned int addr;
@@ -190,6 +191,7 @@ struct mtk_disp_ovl_data {
 	bool supports_clrfmt_ext;
 	const u32 *crc_ofs;
 	size_t crc_cnt;
+	unsigned int rotations;
 };
 
 /**
@@ -415,35 +417,26 @@ unsigned int mtk_ovl_layer_nr(struct device *dev)
 
 unsigned int mtk_ovl_supported_rotations(struct device *dev)
 {
-	return DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
-	       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->data->rotations ?: DRM_MODE_ROTATE_0;
 }
 
 int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
 			struct mtk_plane_state *mtk_state)
 {
 	struct drm_plane_state *state = &mtk_state->base;
-	unsigned int rotation = 0;
 
-	rotation = drm_rotation_simplify(state->rotation,
-					 DRM_MODE_ROTATE_0 |
-					 DRM_MODE_REFLECT_X |
-					 DRM_MODE_REFLECT_Y);
-	rotation &= ~DRM_MODE_ROTATE_0;
-
-	/* We can only do reflection, not rotation */
-	if ((rotation & DRM_MODE_ROTATE_MASK) != 0)
+	if (state->rotation & ~mtk_ovl_supported_rotations(dev))
 		return -EINVAL;
 
 	/*
 	 * TODO: Rotating/reflecting YUV buffers is not supported at this time.
 	 *	 Only RGB[AX] variants are supported.
 	 */
-	if (state->fb->format->is_yuv && rotation != 0)
+	if (state->fb->format->is_yuv && (state->rotation & ~DRM_MODE_ROTATE_0))
 		return -EINVAL;
 
-	state->rotation = rotation;
-
 	return 0;
 }
 
@@ -883,6 +876,15 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.supports_clrfmt_ext = true,
 	.crc_ofs = mt8195_ovl_crc_ofs,
 	.crc_cnt = ARRAY_SIZE(mt8195_ovl_crc_ofs),
+
+	/*
+	 * although OVL only supports reflections on MT8195,
+	 * reflect x + reflect y = rotate 180
+	 */
+	.rotations = DRM_MODE_ROTATE_0   |
+		     DRM_MODE_ROTATE_180 |
+		     DRM_MODE_REFLECT_X  |
+		     DRM_MODE_REFLECT_Y,
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 4398db9a6276..b0d3ebdba93a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -383,6 +383,11 @@ void mtk_ovl_adaptor_register_vblank_cb(struct device *dev, void (*vblank_cb)(vo
 				     vblank_cb, vblank_cb_data);
 }
 
+unsigned int mtk_ovl_adaptor_supported_rotations(struct device *dev)
+{
+	return DRM_MODE_ROTATE_0;
+}
+
 void mtk_ovl_adaptor_unregister_vblank_cb(struct device *dev)
 {
 	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index ffa4868b1222..206dd6f6f99e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -422,6 +422,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.remove = mtk_ovl_adaptor_remove_comp,
 	.get_formats = mtk_ovl_adaptor_get_formats,
 	.get_num_formats = mtk_ovl_adaptor_get_num_formats,
+	.supported_rotations = mtk_ovl_adaptor_supported_rotations,
 };
 
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index e2ec61b69618..894c39a38a58 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -344,7 +344,7 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		return err;
 	}
 
-	if (supported_rotations & ~DRM_MODE_ROTATE_0) {
+	if (supported_rotations) {
 		err = drm_plane_create_rotation_property(plane,
 							 DRM_MODE_ROTATE_0,
 							 supported_rotations);
-- 
2.39.2

