Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A99797C7
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 18:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B1810E2F3;
	Sun, 15 Sep 2024 16:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="UELd1nZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6D110E2F3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 16:12:53 +0000 (UTC)
X-UUID: 5a58eeb8737d11ef8b96093e013ec31c-20240916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hNZ1r0i2EWsUM1gTtvTP6iHnQAcCgxDwEygERSSrjaI=; 
 b=UELd1nZ5jD+Sdu8QtRm2jq0SlkATlSBA93Xi0Wj7Uz9ie8spnXQeiXowEA5vLN9kYlPVCbPWkvYsYFlXvtGaQOVtJady5Kp6ColTINfIBoMHezbvbWRcaVqeJJHezkwqcE7zBWLNDi+ndJR1JWspfz5hTMgmR5M7PKDd9qXiUi0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:d53c865f-77dd-48b5-a397-5d8dd5d4333b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:1caa3dd0-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5a58eeb8737d11ef8b96093e013ec31c-20240916
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 768547468; Mon, 16 Sep 2024 00:12:49 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Sep 2024 00:12:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Sep 2024 00:12:46 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] drm/mediatek: ovl: Add fmt_support_man for MT8192 and
 MT8195
Date: Mon, 16 Sep 2024 00:12:45 +0800
Message-ID: <20240915161245.30296-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.635900-8.000000
X-TMASE-MatchedRID: LIcGYmSXSDozP1+hKLmUcMu00lnG8+PWIaLR+2xKRDLb6Y+fnTZUL0/3
 ZkXeY1OA6eS1Op7zNynNm52TpbFN7NMd/xz9OgvcA9lly13c/gHmELBDcs0dnQqiCYa6w8tv5sZ
 TwYHfBM5BHv20aQGKCx1+KsAVmYZiXHEPHmpuRH0URSScn+QSXt0H8LFZNFG7bkV4e2xSge79/t
 TnQt11ajNTj3nkQ/kevBS707Nog9ImKZteJCYG+0sMHBii02BH
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.635900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8B727294A5D89EEAA7E4A3D476C35C50F3980071A25ADD2361203F28CC166F6F2000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OVL_CON_CLRFMT_MAN is an configuration for extending color format
settings of DISP_REG_OVL_CON(n).
It will change some of the original color format settings.

Take the settings of (3 << 12) for example.
- If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
- If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.

Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
It breaks the OVL color format setting of MT8173.
So add fmt_support_man to the driver data of MT8192 and MT8195
to solve the downgrade problem.

Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 43 ++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6..7b053ca25b10 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -70,10 +70,33 @@
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
 #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
-#define OVL_CON_CLRFMT_PARGB8888 ((3 << 12) | OVL_CON_CLRFMT_MAN)
-#define OVL_CON_CLRFMT_PABGR8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP)
-#define OVL_CON_CLRFMT_PBGRA8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_PRGBA8888 (OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP)
+
+#define OVL_CON_CLRFMT_PARGB8888(ovl)  ({ \
+	struct mtk_disp_ovl *_ovl = (ovl); \
+	(_ovl->data->fmt_support_man ? \
+	((3 << 12) | OVL_CON_CLRFMT_MAN) : OVL_CON_CLRFMT_ARGB8888); \
+})
+
+#define OVL_CON_CLRFMT_PABGR8888(ovl)  ({ \
+	struct mtk_disp_ovl *_ovl = (ovl); \
+	(_ovl->data->fmt_support_man ? \
+	(OVL_CON_CLRFMT_PARGB8888(_ovl) | OVL_CON_RGB_SWAP) : OVL_CON_CLRFMT_ABGR8888); \
+})
+
+#define OVL_CON_CLRFMT_PBGRA8888(ovl)  ({ \
+	struct mtk_disp_ovl *_ovl = (ovl); \
+	(_ovl->data->fmt_support_man ? \
+	(OVL_CON_CLRFMT_PARGB8888(_ovl) | OVL_CON_BYTE_SWAP) : \
+	 OVL_CON_CLRFMT_BGRA8888); \
+})
+
+#define OVL_CON_CLRFMT_PRGBA8888(ovl)  ({ \
+	struct mtk_disp_ovl *_ovl = (ovl); \
+	(_ovl->data->fmt_support_man ? \
+	(OVL_CON_CLRFMT_PABGR8888(_ovl) | OVL_CON_BYTE_SWAP) : \
+	OVL_CON_CLRFMT_RGBA8888); \
+})
+
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -144,6 +167,7 @@ struct mtk_disp_ovl_data {
 	unsigned int gmc_bits;
 	unsigned int layer_nr;
 	bool fmt_rgb565_is_0;
+	bool fmt_support_man;
 	bool smi_id_en;
 	bool supports_afbc;
 	const u32 *formats;
@@ -410,28 +434,28 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
 	case DRM_FORMAT_RGBA1010102:
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_RGBA8888 :
-		       OVL_CON_CLRFMT_PRGBA8888;
+		       OVL_CON_CLRFMT_PRGBA8888(ovl);
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
 	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_BGRA8888 :
-		       OVL_CON_CLRFMT_PBGRA8888;
+		       OVL_CON_CLRFMT_PBGRA8888(ovl);
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_ARGB8888 :
-		       OVL_CON_CLRFMT_PARGB8888;
+		       OVL_CON_CLRFMT_PARGB8888(ovl);
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_XBGR2101010:
 	case DRM_FORMAT_ABGR2101010:
 		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
 		       OVL_CON_CLRFMT_ABGR8888 :
-		       OVL_CON_CLRFMT_PABGR8888;
+		       OVL_CON_CLRFMT_PABGR8888(ovl);
 	case DRM_FORMAT_UYVY:
 		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
 	case DRM_FORMAT_YUYV:
@@ -662,6 +686,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.fmt_support_man = true,
 	.smi_id_en = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -672,6 +697,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
+	.fmt_support_man = true,
 	.smi_id_en = true,
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
@@ -682,6 +708,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.fmt_support_man = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
 	.formats = mt8195_formats,
-- 
2.43.0

