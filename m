Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DD887F803
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 08:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FDF10E0A6;
	Tue, 19 Mar 2024 07:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="hHqnYAVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC1610F176
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 07:03:05 +0000 (UTC)
X-UUID: b85c6208e5be11ee935d6952f98a51a9-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IxZojfOY0LlQzghYqHAhKtrq9FYlwr3DzPfdMIaGCrs=; 
 b=hHqnYAVLF4m4yIOZIVFOQbw1KM6PugypPMaqDQBimk073yBJFEzm7ArP8JpTjF7o0eJH1ZnS41xCYSm5U/bTkMXrO4++bBbwgqasJLIewlAj70hBP77HVk8PVww+CJ9yC+JclUbIDyNktr97hYV2BdLkesEQRKD2I2iqLwNAtTc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:471a56aa-8367-4363-9e6d-e2ff7adb6d41, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:4db49190-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b85c6208e5be11ee935d6952f98a51a9-20240319
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2128425150; Tue, 19 Mar 2024 15:02:59 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 15:02:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 15:02:58 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
 <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v2 01/14] drm/mediatek: Rename "mtk_drm_crtc" to "mtk_crtc"
Date: Tue, 19 Mar 2024 15:02:44 +0800
Message-ID: <20240319070257.6443-2-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240319070257.6443-1-shawn.sung@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename all "mtk_drm_crtc" to "mtk_crtc" due to the following benefits:
- Lower the matches when searching the native drm_crtc* codes
- Reduce the code size

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 189 +++++++++++------------
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h  |  28 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  18 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c |  10 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c       |   2 +-
 6 files changed, 119 insertions(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index a04499c4f9ca2..8a4b68898c601 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -26,7 +26,7 @@
 #include "mtk_drm_plane.h"
 
 /*
- * struct mtk_drm_crtc - MediaTek specific crtc structure.
+ * struct mtk_crtc - MediaTek specific crtc structure.
  * @base: crtc object.
  * @enabled: records whether crtc_enable succeeded
  * @planes: array of 4 drm_plane structures, one for each overlay plane
@@ -38,7 +38,7 @@
  *
  * TODO: Needs update: this header is missing a bunch of member descriptions.
  */
-struct mtk_drm_crtc {
+struct mtk_crtc {
 	struct drm_crtc			base;
 	bool				enabled;
 
@@ -80,9 +80,9 @@ struct mtk_crtc_state {
 	unsigned int			pending_vrefresh;
 };
 
-static inline struct mtk_drm_crtc *to_mtk_crtc(struct drm_crtc *c)
+static inline struct mtk_crtc *to_mtk_crtc(struct drm_crtc *c)
 {
-	return container_of(c, struct mtk_drm_crtc, base);
+	return container_of(c, struct mtk_crtc, base);
 }
 
 static inline struct mtk_crtc_state *to_mtk_crtc_state(struct drm_crtc_state *s)
@@ -90,7 +90,7 @@ static inline struct mtk_crtc_state *to_mtk_crtc_state(struct drm_crtc_state *s)
 	return container_of(s, struct mtk_crtc_state, base);
 }
 
-static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
+static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	unsigned long flags;
@@ -104,11 +104,11 @@ static void mtk_drm_crtc_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
 	}
 }
 
-static void mtk_drm_finish_page_flip(struct mtk_drm_crtc *mtk_crtc)
+static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 {
 	drm_crtc_handle_vblank(&mtk_crtc->base);
 	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
-		mtk_drm_crtc_finish_page_flip(mtk_crtc);
+		mtk_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
 	}
 }
@@ -151,9 +151,9 @@ static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
 }
 #endif
 
-static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
+static void mtk_crtc_destroy(struct drm_crtc *crtc)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	int i;
 
 	mtk_mutex_put(mtk_crtc->mutex);
@@ -176,7 +176,7 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 	drm_crtc_cleanup(crtc);
 }
 
-static void mtk_drm_crtc_reset(struct drm_crtc *crtc)
+static void mtk_crtc_reset(struct drm_crtc *crtc)
 {
 	struct mtk_crtc_state *state;
 
@@ -191,7 +191,7 @@ static void mtk_drm_crtc_reset(struct drm_crtc *crtc)
 		__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
-static struct drm_crtc_state *mtk_drm_crtc_duplicate_state(struct drm_crtc *crtc)
+static struct drm_crtc_state *mtk_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct mtk_crtc_state *state;
 
@@ -208,18 +208,17 @@ static struct drm_crtc_state *mtk_drm_crtc_duplicate_state(struct drm_crtc *crtc
 	return &state->base;
 }
 
-static void mtk_drm_crtc_destroy_state(struct drm_crtc *crtc,
-				       struct drm_crtc_state *state)
+static void mtk_crtc_destroy_state(struct drm_crtc *crtc,
+				   struct drm_crtc_state *state)
 {
 	__drm_atomic_helper_crtc_destroy_state(state);
 	kfree(to_mtk_crtc_state(state));
 }
 
 static enum drm_mode_status
-mtk_drm_crtc_mode_valid(struct drm_crtc *crtc,
-			const struct drm_display_mode *mode)
+mtk_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	enum drm_mode_status status = MODE_OK;
 	int i;
 
@@ -231,15 +230,15 @@ mtk_drm_crtc_mode_valid(struct drm_crtc *crtc,
 	return status;
 }
 
-static bool mtk_drm_crtc_mode_fixup(struct drm_crtc *crtc,
-				    const struct drm_display_mode *mode,
-				    struct drm_display_mode *adjusted_mode)
+static bool mtk_crtc_mode_fixup(struct drm_crtc *crtc,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
 {
 	/* Nothing to do here, but this callback is mandatory. */
 	return true;
 }
 
-static void mtk_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
+static void mtk_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
 
@@ -250,7 +249,7 @@ static void mtk_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	state->pending_config = true;
 }
 
-static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
+static int mtk_crtc_ddp_clk_enable(struct mtk_crtc *mtk_crtc)
 {
 	int ret;
 	int i;
@@ -270,7 +269,7 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
 	return ret;
 }
 
-static void mtk_crtc_ddp_clk_disable(struct mtk_drm_crtc *mtk_crtc)
+static void mtk_crtc_ddp_clk_disable(struct mtk_crtc *mtk_crtc)
 {
 	int i;
 
@@ -283,7 +282,7 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 						struct drm_plane *plane,
 						unsigned int *local_layer)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp;
 	int i, count = 0;
 	unsigned int local_index = plane - mtk_crtc->planes;
@@ -306,7 +305,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
 	struct cmdq_cb_data *data = mssg;
 	struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
-	struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
+	struct mtk_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_crtc, cmdq_client);
 	struct mtk_crtc_state *state;
 	unsigned int i;
 
@@ -346,7 +345,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 }
 #endif
 
-static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
+static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
 	struct drm_connector *connector;
@@ -446,7 +445,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 	return ret;
 }
 
-static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
+static void mtk_crtc_ddp_hw_fini(struct mtk_crtc *mtk_crtc)
 {
 	struct drm_device *drm = mtk_crtc->base.dev;
 	struct drm_crtc *crtc = &mtk_crtc->base;
@@ -491,7 +490,7 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
 static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				struct cmdq_pkt *cmdq_handle)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
 	unsigned int i;
@@ -563,8 +562,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 	}
 }
 
-static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
-				       bool needs_vblank)
+static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct cmdq_pkt *cmdq_handle = &mtk_crtc->cmdq_handle;
@@ -636,7 +634,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 static void mtk_crtc_ddp_irq(void *data)
 {
 	struct drm_crtc *crtc = data;
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
@@ -652,9 +650,9 @@ static void mtk_crtc_ddp_irq(void *data)
 	mtk_drm_finish_page_flip(mtk_crtc);
 }
 
-static int mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
+static int mtk_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
 
 	mtk_ddp_comp_enable_vblank(comp);
@@ -662,22 +660,22 @@ static int mtk_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 	return 0;
 }
 
-static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
+static void mtk_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
 
 	mtk_ddp_comp_disable_vblank(comp);
 }
 
-static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
-				       struct drm_atomic_state *state)
+static void mtk_crtc_update_output(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
 {
 	int crtc_index = drm_crtc_index(crtc);
 	int i;
 	struct device *dev;
 	struct drm_crtc_state *crtc_state = state->crtcs[crtc_index].new_state;
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv;
 	unsigned int encoder_mask = crtc_state->encoder_mask;
 
@@ -707,8 +705,8 @@ static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
 	}
 }
 
-int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
-			     struct mtk_plane_state *state)
+int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
+			 struct mtk_plane_state *state)
 {
 	unsigned int local_layer;
 	struct mtk_ddp_comp *comp;
@@ -719,21 +717,21 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 	return 0;
 }
 
-void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
-			       struct drm_atomic_state *state)
+void mtk_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
+			   struct drm_atomic_state *state)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 
 	if (!mtk_crtc->enabled)
 		return;
 
-	mtk_drm_crtc_update_config(mtk_crtc, false);
+	mtk_crtc_update_config(mtk_crtc, false);
 }
 
-static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
-				       struct drm_atomic_state *state)
+static void mtk_crtc_atomic_enable(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
 	int ret;
 
@@ -745,7 +743,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
-	mtk_drm_crtc_update_output(crtc, state);
+	mtk_crtc_update_output(crtc, state);
 
 	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
 	if (ret) {
@@ -757,15 +755,12 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 	mtk_crtc->enabled = true;
 }
 
-static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
-					struct drm_atomic_state *state)
+static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
+				    struct drm_atomic_state *state)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
 	int i;
-
-	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
-	if (!mtk_crtc->enabled)
 		return;
 
 	/* Set all pending plane state to disabled */
@@ -779,7 +774,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 	mtk_crtc->pending_planes = true;
 
-	mtk_drm_crtc_update_config(mtk_crtc, false);
+	mtk_crtc_update_config(mtk_crtc, false);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	/* Wait for planes to be disabled by cmdq */
 	if (mtk_crtc->cmdq_client.chan)
@@ -797,13 +792,13 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	mtk_crtc->enabled = false;
 }
 
-static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
-				      struct drm_atomic_state *state)
+static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
 	struct mtk_crtc_state *mtk_crtc_state = to_mtk_crtc_state(crtc_state);
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	unsigned long flags;
 
 	if (mtk_crtc->event && mtk_crtc_state->base.event)
@@ -821,10 +816,10 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
 	}
 }
 
-static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
-				      struct drm_atomic_state *state)
+static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state)
 {
-	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	int i;
 
 	if (crtc->state->color_mgmt_changed)
@@ -832,33 +827,32 @@ static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
 			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
 		}
-	mtk_drm_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
+	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
 }
 
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
 	.page_flip		= drm_atomic_helper_page_flip,
-	.destroy		= mtk_drm_crtc_destroy,
-	.reset			= mtk_drm_crtc_reset,
-	.atomic_duplicate_state	= mtk_drm_crtc_duplicate_state,
-	.atomic_destroy_state	= mtk_drm_crtc_destroy_state,
-	.enable_vblank		= mtk_drm_crtc_enable_vblank,
-	.disable_vblank		= mtk_drm_crtc_disable_vblank,
+	.destroy		= mtk_crtc_destroy,
+	.reset			= mtk_crtc_reset,
+	.atomic_duplicate_state	= mtk_crtc_duplicate_state,
+	.atomic_destroy_state	= mtk_crtc_destroy_state,
+	.enable_vblank		= mtk_crtc_enable_vblank,
+	.disable_vblank		= mtk_crtc_disable_vblank,
 };
 
 static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
-	.mode_fixup	= mtk_drm_crtc_mode_fixup,
-	.mode_set_nofb	= mtk_drm_crtc_mode_set_nofb,
-	.mode_valid	= mtk_drm_crtc_mode_valid,
-	.atomic_begin	= mtk_drm_crtc_atomic_begin,
-	.atomic_flush	= mtk_drm_crtc_atomic_flush,
-	.atomic_enable	= mtk_drm_crtc_atomic_enable,
-	.atomic_disable	= mtk_drm_crtc_atomic_disable,
+	.mode_fixup	= mtk_crtc_mode_fixup,
+	.mode_set_nofb	= mtk_crtc_mode_set_nofb,
+	.mode_valid	= mtk_crtc_mode_valid,
+	.atomic_begin	= mtk_crtc_atomic_begin,
+	.atomic_flush	= mtk_crtc_atomic_flush,
+	.atomic_enable	= mtk_crtc_atomic_enable,
+	.atomic_disable	= mtk_crtc_atomic_disable,
 };
 
-static int mtk_drm_crtc_init(struct drm_device *drm,
-			     struct mtk_drm_crtc *mtk_crtc,
-			     unsigned int pipe)
+static int mtk_crtc_init(struct drm_device *drm, struct mtk_crtc *mtk_crtc,
+			 unsigned int pipe)
 {
 	struct drm_plane *primary = NULL;
 	struct drm_plane *cursor = NULL;
@@ -885,8 +879,7 @@ static int mtk_drm_crtc_init(struct drm_device *drm,
 	return ret;
 }
 
-static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
-					int comp_idx)
+static int mtk_crtc_num_comp_planes(struct mtk_crtc *mtk_crtc, int comp_idx)
 {
 	struct mtk_ddp_comp *comp;
 
@@ -904,8 +897,8 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
 }
 
 static inline
-enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
-					    unsigned int num_planes)
+enum drm_plane_type mtk_crtc_plane_type(unsigned int plane_idx,
+					unsigned int num_planes)
 {
 	if (plane_idx == 0)
 		return DRM_PLANE_TYPE_PRIMARY;
@@ -916,11 +909,11 @@ enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
 
 }
 
-static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
-					 struct mtk_drm_crtc *mtk_crtc,
-					 int comp_idx, int pipe)
+static int mtk_crtc_init_comp_planes(struct drm_device *drm_dev,
+				     struct mtk_crtc *mtk_crtc,
+				     int comp_idx, int pipe)
 {
-	int num_planes = mtk_drm_crtc_num_comp_planes(mtk_crtc, comp_idx);
+	int num_planes = mtk_crtc_num_comp_planes(mtk_crtc, comp_idx);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[comp_idx];
 	int i, ret;
 
@@ -928,8 +921,7 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 		ret = mtk_plane_init(drm_dev,
 				&mtk_crtc->planes[mtk_crtc->layer_nr],
 				BIT(pipe),
-				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
-							num_planes),
+				mtk_crtc_plane_type(mtk_crtc->layer_nr, num_planes),
 				mtk_ddp_comp_supported_rotations(comp),
 				mtk_ddp_comp_get_formats(comp),
 				mtk_ddp_comp_get_num_formats(comp));
@@ -941,9 +933,9 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 	return 0;
 }
 
-struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
+struct device *mtk_crtc_dma_dev_get(struct drm_crtc *crtc)
 {
-	struct mtk_drm_crtc *mtk_crtc = NULL;
+	struct mtk_crtc *mtk_crtc = NULL;
 
 	if (!crtc)
 		return NULL;
@@ -955,14 +947,14 @@ struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
 	return mtk_crtc->dma_dev;
 }
 
-int mtk_drm_crtc_create(struct drm_device *drm_dev,
-			const unsigned int *path, unsigned int path_len,
-			int priv_data_index, const struct mtk_drm_route *conn_routes,
-			unsigned int num_conn_routes)
+int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
+		    unsigned int path_len, int priv_data_index,
+		    const struct mtk_drm_route *conn_routes,
+		    unsigned int num_conn_routes)
 {
 	struct mtk_drm_private *priv = drm_dev->dev_private;
 	struct device *dev = drm_dev->dev;
-	struct mtk_drm_crtc *mtk_crtc;
+	struct mtk_crtc *mtk_crtc;
 	unsigned int num_comp_planes = 0;
 	int ret;
 	int i;
@@ -1047,7 +1039,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
-		num_comp_planes += mtk_drm_crtc_num_comp_planes(mtk_crtc, i);
+		num_comp_planes += mtk_crtc_num_comp_planes(mtk_crtc, i);
 
 	mtk_crtc->planes = devm_kcalloc(dev, num_comp_planes,
 					sizeof(struct drm_plane), GFP_KERNEL);
@@ -1055,8 +1047,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		return -ENOMEM;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
-		ret = mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc, i,
-						    crtc_i);
+		ret = mtk_crtc_init_comp_planes(drm_dev, mtk_crtc, i, crtc_i);
 		if (ret)
 			return ret;
 	}
@@ -1068,7 +1059,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	 */
 	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv->ddp_comp[path[0]]);
 
-	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, crtc_i);
+	ret = mtk_crtc_init(drm_dev, mtk_crtc, crtc_i);
 	if (ret < 0)
 		return ret;
 
@@ -1138,7 +1129,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		mtk_crtc->num_conn_routes = num_conn_routes;
 		mtk_crtc->conn_routes = conn_routes;
 
-		/* increase ddp_comp_nr at the end of mtk_drm_crtc_create */
+		/* increase ddp_comp_nr at the end of mtk_crtc_create */
 		mtk_crtc->ddp_comp_nr++;
 	}
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 1f988ff1bf9fd..2d9f28f436aea 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
-#ifndef MTK_DRM_CRTC_H
-#define MTK_DRM_CRTC_H
+#ifndef MTK_CRTC_H
+#define MTK_CRTC_H
 
 #include <drm/drm_crtc.h>
 #include "mtk_drm_ddp_comp.h"
@@ -14,17 +14,15 @@
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
 
-void mtk_drm_crtc_commit(struct drm_crtc *crtc);
-int mtk_drm_crtc_create(struct drm_device *drm_dev,
-			const unsigned int *path,
-			unsigned int path_len,
-			int priv_data_index,
-			const struct mtk_drm_route *conn_routes,
-			unsigned int num_conn_routes);
-int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
-			     struct mtk_plane_state *state);
-void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
-			       struct drm_atomic_state *plane_state);
-struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc);
+void mtk_crtc_commit(struct drm_crtc *crtc);
+int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
+		    unsigned int path_len, int priv_data_index,
+		    const struct mtk_drm_route *conn_routes,
+		    unsigned int num_conn_routes);
+int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
+			 struct mtk_plane_state *state);
+void mtk_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
+			   struct drm_atomic_state *plane_state);
+struct device *mtk_crtc_dma_dev_get(struct drm_crtc *crtc);
 
-#endif /* MTK_DRM_CRTC_H */
+#endif /* MTK_CRTC_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74832c2130921..c46773569b3c9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -494,24 +494,24 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 			priv_n = private->all_drm_private[j];
 
 			if (i == CRTC_MAIN && priv_n->data->main_len) {
-				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
-							  priv_n->data->main_len, j,
-							  priv_n->data->conn_routes,
-							  priv_n->data->num_conn_routes);
+				ret = mtk_crtc_create(drm, priv_n->data->main_path,
+						      priv_n->data->main_len, j,
+						      priv_n->data->conn_routes,
+						      priv_n->data->num_conn_routes);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == CRTC_EXT && priv_n->data->ext_len) {
-				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
-							  priv_n->data->ext_len, j, NULL, 0);
+				ret = mtk_crtc_create(drm, priv_n->data->ext_path,
+						      priv_n->data->ext_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == CRTC_THIRD && priv_n->data->third_len) {
-				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
-							  priv_n->data->third_len, j, NULL, 0);
+				ret = mtk_crtc_create(drm, priv_n->data->third_path,
+						      priv_n->data->third_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
@@ -523,7 +523,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	/* Use OVL device for all DMA memory allocations */
 	crtc = drm_crtc_from_index(drm, 0);
 	if (crtc)
-		dma_dev = mtk_drm_crtc_dma_dev_get(crtc);
+		dma_dev = mtk_crtc_dma_dev_get(crtc);
 	if (!dma_dev) {
 		ret = -ENODEV;
 		dev_err(drm->dev, "Need at least one OVL device\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 33fadb08dc1c7..24c4d59085bd6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -13,7 +13,7 @@
 #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
 #define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVL_ADAPTOR + 1)
 
-enum mtk_drm_crtc_path {
+enum mtk_crtc_path {
 	CRTC_MAIN,
 	CRTC_EXT,
 	CRTC_THIRD,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index ddc9355b06d51..cbdb70677d305 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -117,8 +117,8 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
 	if (!plane->state->fb)
 		return -EINVAL;
 
-	ret = mtk_drm_crtc_plane_check(new_plane_state->crtc, plane,
-				       to_mtk_plane_state(new_plane_state));
+	ret = mtk_crtc_plane_check(new_plane_state->crtc, plane,
+				   to_mtk_plane_state(new_plane_state));
 	if (ret)
 		return ret;
 
@@ -232,7 +232,7 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
 	swap(plane->state->fb, new_state->fb);
 	wmb(); /* Make sure the above parameters are set before update */
 	new_plane_state->pending.async_dirty = true;
-	mtk_drm_crtc_async_update(new_state->crtc, plane, state);
+	mtk_crtc_async_update(new_state->crtc, plane, state);
 }
 
 static const struct drm_plane_funcs mtk_plane_funcs = {
@@ -260,8 +260,8 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(!new_plane_state->crtc))
 		return 0;
 
-	ret = mtk_drm_crtc_plane_check(new_plane_state->crtc, plane,
-				       to_mtk_plane_state(new_plane_state));
+	ret = mtk_crtc_plane_check(new_plane_state->crtc, plane,
+				   to_mtk_plane_state(new_plane_state));
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 9501f40191990..ec9d96396d7b2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -662,7 +662,7 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 
 	/*
 	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
-	 * mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(),
+	 * mtk_dsi_stop() should be called after mtk_crtc_atomic_disable(),
 	 * which needs irq for vblank, and mtk_dsi_stop() will disable irq.
 	 * mtk_dsi_start() needs to be called in mtk_output_dsi_enable(),
 	 * after dsi is fully set.
-- 
2.18.0

