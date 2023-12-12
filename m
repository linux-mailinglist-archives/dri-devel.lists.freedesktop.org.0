Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED9D80EB73
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 13:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA9C10E5E7;
	Tue, 12 Dec 2023 12:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CC210E5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 12:20:11 +0000 (UTC)
X-UUID: c5ef250e98e811eeba30773df0976c77-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ka6DlWr8O5KPNFH1pdRfFP5nTUuhgOMLMTgYtTTQtV0=; 
 b=VyBYMoOCJ7ACDsbZtMtc869NmcA0a/uX/fXR2ulxUaRKvU3WTsFl7wfLb8l1uqdH6t5gffFrY1B5AJ3TLYgxrHCqG27V5WcqM4PGO8RKkf7XHjbFlCn6IWAvByxFDIsQaO5Fa3yXCyaMhrLhHSaRzjSFQdxynyop4xaLvBhxAxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:27f7bae1-a772-4223-89c8-73aeeab04431, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5d391d7, CLOUDID:7ea8b373-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c5ef250e98e811eeba30773df0976c77-20231212
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 990221556; Tue, 12 Dec 2023 20:20:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 20:20:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 20:20:00 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v4 05/17] drm/mediatek: Set DRM mode configs accordingly
Date: Tue, 12 Dec 2023 20:19:45 +0800
Message-ID: <20231212121957.19231-6-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231212121957.19231-1-shawn.sung@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.930400-8.000000
X-TMASE-MatchedRID: x3Ubk3t+gcy00StIHoZF5pJAa1C/+FcunhD9A3Sa7pYs/uUAk6xP7PlY
 oV6p/cSxNFCzr/YjTjOc2wuft1o14LvaJG+XDhc2DB+ErBr0bANn+sA9+u1YLX5h6y4KCSJcShj
 sNhfAcgIZ/p8qQ24bJaaYJmaMPc4/jb9Ltm8ZneZu+yxbbkYIFifyNCEwujCFXhmWufKBF2SRXS
 5OutA+GekoCEC/ht5M70Qm3YXk6SwfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPDRKhK/CnIxuNRkc
 Elpi5gOLxOGdstXMZz9Oo/9meFJyeSPyTK27pvM
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.930400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D0B24F9408CB0F914E97D4B49733F9498BF49BB0989FC96017ABFA7DF88B43D12000:8
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
Cc: devicetree@vger.kernel.org, Fei Shao <fshao@chromium.org>,
 Sean Paul <sean@poorly.run>, Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set DRM mode configs limitation accroding to the
hardware capabilities.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 28 ++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  1 +
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5d551bff6b3f..a4b740420ebb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -304,6 +304,7 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.conn_routes = mt8188_mtk_ddp_main_routes,
 	.conn_routes_num = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
 	.mmsys_dev_num = 2,
+	.max_pitch = GENMASK(15, 0),
 };
 
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
@@ -318,6 +319,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.main_path = mt8195_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
 	.mmsys_dev_num = 2,
+	.max_pitch = GENMASK(15, 0),
 };
 
 static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
@@ -325,6 +327,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
 	.mmsys_id = 1,
 	.mmsys_dev_num = 2,
+	.max_pitch = GENMASK(15, 0),
 };
 
 static const struct of_device_id mtk_drm_of_ids[] = {
@@ -463,16 +466,16 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	if (ret)
 		goto put_mutex_dev;
 
-	drm->mode_config.min_width = 64;
-	drm->mode_config.min_height = 64;
-
 	/*
-	 * set max width and height as default value(4096x4096).
-	 * this value would be used to check framebuffer size limitation
-	 * at drm_mode_addfb().
+	 * Set default values for drm mode config
+	 * these values will be referenced by drm_mode_addfb() as
+	 * frame buffer size limitation.
 	 */
-	drm->mode_config.max_width = 4096;
-	drm->mode_config.max_height = 4096;
+	drm->mode_config.min_width = 1;
+	drm->mode_config.min_height = 1;
+	drm->mode_config.cursor_width = 512;
+	drm->mode_config.cursor_height = 512;
+
 	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
 
@@ -502,6 +505,15 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		for (j = 0; j < private->data->mmsys_dev_num; j++) {
 			priv_n = private->all_drm_private[j];
 
+			if (priv_n->data->max_pitch) {
+				/* Save 4 bytes for the color depth (pitch = width x bpp) */
+				drm->mode_config.max_width  = priv_n->data->max_pitch >> 2;
+				drm->mode_config.max_height = priv_n->data->max_pitch >> 2;
+			} else {
+				drm->mode_config.max_width = 4096;
+				drm->mode_config.max_height = 4096;
+			}
+
 			if (i == 0 && priv_n->data->main_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
 							  priv_n->data->main_len, j,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index d2efd715699f..3d6c1f58a7ec 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -41,6 +41,7 @@ struct mtk_mmsys_driver_data {
 	bool shadow_register;
 	unsigned int mmsys_id;
 	unsigned int mmsys_dev_num;
+	u32 max_pitch;
 };
 
 struct mtk_drm_private {
-- 
2.18.0

