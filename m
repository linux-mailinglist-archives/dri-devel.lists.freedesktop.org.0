Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520BD8868EF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 10:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8DA10F421;
	Fri, 22 Mar 2024 09:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="IW6cdhSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3B110EEDD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:12:44 +0000 (UTC)
X-UUID: 534f93c4e82c11eeb8927bc1f75efef4-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PZJix1J9Jpmh+i91OEHpGMGggBKx4tQWzIsRWzZa578=; 
 b=IW6cdhSPAItBocEGICoMemKZtRORlRJh7E9w3J7ZVE70Gg2AsCRn4yHlIaPgAs7oS8qh+/c8+Rc/7KTmSd7Bk2UQMtclZf6RCO59GSNnhrH0HlUmz0SJT5qa/qYtsWanCWf1GTLhPCupDhnxUqq0Ye6LBxTNungLJ1iIwUG3BL4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:666dbc25-6397-42c9-8b67-571a72b9cf2e, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:9947b690-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 534f93c4e82c11eeb8927bc1f75efef4-20240322
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 863254185; Fri, 22 Mar 2024 17:12:36 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:12:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:12:35 +0800
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
Subject: [PATCH v5 14/14] drm/mediatek: Rename mtk_ddp_comp functions
Date: Fri, 22 Mar 2024 17:12:32 +0800
Message-ID: <20240322091232.26387-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322091232.26387-1-shawn.sung@mediatek.com>
References: <20240322091232.26387-1-shawn.sung@mediatek.com>
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

Rename functions of mtk_ddp_comp:
- To align the naming rule
- To reduce the code size

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 45 ++++++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  3 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c      |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c      |  2 +-
 4 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index c3441508f452f..17b0364112922 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -497,10 +497,10 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,		1, NULL },
 };
 
-static bool mtk_drm_find_comp_in_ddp(struct device *dev,
-				     const unsigned int *path,
-				     unsigned int path_len,
-				     struct mtk_ddp_comp *ddp_comp)
+static bool mtk_ddp_comp_find(struct device *dev,
+			      const unsigned int *path,
+			      unsigned int path_len,
+			      struct mtk_ddp_comp *ddp_comp)
 {
 	unsigned int i;
 
@@ -514,10 +514,10 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }
 
-static unsigned int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
-						       const struct mtk_drm_route *routes,
-						       unsigned int num_routes,
-						       struct mtk_ddp_comp *ddp_comp)
+static unsigned int mtk_ddp_comp_find_in_route(struct device *dev,
+					       const struct mtk_drm_route *routes,
+					       unsigned int num_routes,
+					       struct mtk_ddp_comp *ddp_comp)
 {
 	int ret;
 	unsigned int i;
@@ -554,26 +554,31 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }
 
-unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-						struct device *dev)
+unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
 	unsigned int ret = 0;
 
-	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
-				     private->ddp_comp))
+	if (mtk_ddp_comp_find(dev,
+			      private->data->main_path,
+			      private->data->main_len,
+			      private->ddp_comp))
 		ret = BIT(0);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
-					  private->data->ext_len, private->ddp_comp))
+	else if (mtk_ddp_comp_find(dev,
+				   private->data->ext_path,
+				   private->data->ext_len,
+				   private->ddp_comp))
 		ret = BIT(1);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
-					  private->data->third_len, private->ddp_comp))
+	else if (mtk_ddp_comp_find(dev,
+				   private->data->third_path,
+				   private->data->third_len,
+				   private->ddp_comp))
 		ret = BIT(2);
 	else
-		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
-							 private->data->conn_routes,
-							 private->data->num_conn_routes,
-							 private->ddp_comp);
+		ret = mtk_ddp_comp_find_in_route(dev,
+						 private->data->conn_routes,
+						 private->data->num_conn_routes,
+						 private->ddp_comp);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index ba985206fdd24..26236691ce4c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -326,8 +326,7 @@ static inline void mtk_ddp_comp_encoder_index_set(struct mtk_ddp_comp *comp)
 
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
-unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-						struct device *dev);
+unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index fbf63e0441337..bfe8653005dbf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -805,7 +805,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	dpi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
+	dpi->encoder.possible_crtcs = mtk_find_possible_crtcs(drm_dev, dpi->dev);
 
 	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e29c37fb5be09..67239606adbfc 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -836,7 +836,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		return ret;
 	}
 
-	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
+	dsi->encoder.possible_crtcs = mtk_find_possible_crtcs(drm, dsi->host.dev);
 
 	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-- 
2.18.0

