Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBE7B76A8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 04:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C795B10E336;
	Wed,  4 Oct 2023 02:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E818910E0C7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 02:40:24 +0000 (UTC)
X-UUID: 59f2ac3c625f11eea33bb35ae8d461a2-20231004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oTi4mssDYF2NOp+w5XKqL69CP1bNWJ/irOFu34/VQ+A=; 
 b=dRx1t53d3UXkOGQKCZfNHDDau28YvJWRDwJThUTubl25neVrq6SWtchd6tNVGjEeua8oKrsy/VyfERnRlSw1efz+4hRrhWbQNuWtHLb4i6J/UGzQu+eGbcT60oVG2rSb6b/15kws39VGuZGTurtIr51H6LUM/mtlfew0vCzjnSM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:5cbb6066-7428-4065-a933-dd69f664f1da, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:29ada814-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 59f2ac3c625f11eea33bb35ae8d461a2-20231004
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 853031053; Wed, 04 Oct 2023 10:40:16 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 10:40:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 10:40:15 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v11 5/9] drm/mediatek: Add connector dynamic selection
 capability
Date: Wed, 4 Oct 2023 10:40:09 +0800
Message-ID: <20231004024013.18956-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.483700-8.000000
X-TMASE-MatchedRID: PsyXYoMXngi3B+P0We5UJ0LEoH0ynuZVmdrHMkUHHq9aW2Ktn+I8/kBI
 CRren7xCubvf6ktW7XBEzxsFM1euZm94Ipa1otxokDpLRKO9xhRt3qsaFY4DBAqiCYa6w8tv79J
 yA2mvzQiijgZKwPbeZLYkV2Ealq/rmPnR7BD/zBV1e7Xbb6Im2t7QEjaI0NUguWYx8s2K6Rq6bB
 qJCvgv/9qG7/kn+2wE41o+auuBlMXQf/Mt4GBfb47Su3QulAZ5WDdWpJMntKhiZCTkFQiKcNKeu
 oOP1lboJkTkP3kjv4iAMuqetGVetksDkkP3zIjq3QfwsVk0UbtuRXh7bFKB7gKPeCx4TzI/E0Op
 gkn6YtSs40DYFFIEjzR3R2A1UTS+NkUSDDq742k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.483700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B521F2805D14D33DE6A4F03C1E746E3C60AF3528621A48C8329DDA760DB563362000:8
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
Cc: Nathan Lu <nathan.lu@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dynamic select available connector flow in mtk_drm_crtc_create()
and mtk_drm_crtc_atomic_enable().

In mtk_drm_crtc_create(), if there is a connector routes array in drm
driver data, all components definded in the connector routes array will
be checked and their encoder_index will be set.

In mtk_drm_crtc_atomic_enable(), crtc will check its encoder_index to
identify which componet in the connector routes array should append.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 72 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 30 ++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 13 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  7 ++
 5 files changed, 120 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index b6fa4ad2f94d..742218691080 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -63,6 +63,8 @@ struct mtk_drm_crtc {
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
 	struct mtk_ddp_comp		**ddp_comp;
+	unsigned int			num_conn_routes;
+	const struct mtk_drm_route	*conn_routes;
 
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
@@ -647,6 +649,43 @@ static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 	mtk_ddp_comp_disable_vblank(comp);
 }
 
+static void mtk_drm_crtc_update_output(struct drm_crtc *crtc,
+				       struct drm_atomic_state *state)
+{
+	int crtc_index = drm_crtc_index(crtc);
+	int i;
+	struct device *dev;
+	struct drm_crtc_state *crtc_state = state->crtcs[crtc_index].new_state;
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct mtk_drm_private *priv;
+	unsigned int encoder_mask = crtc_state->encoder_mask;
+
+	if (!crtc_state->connectors_changed)
+		return;
+
+	if (!mtk_crtc->num_conn_routes)
+		return;
+
+	priv = ((struct mtk_drm_private *)crtc->dev->dev_private)->all_drm_private[crtc_index];
+	dev = priv->dev;
+
+	dev_dbg(dev, "connector change:%d, encoder mask:0x%x for crtc:%d\n",
+		crtc_state->connectors_changed, encoder_mask, crtc_index);
+
+	for (i = 0; i < mtk_crtc->num_conn_routes; i++) {
+		unsigned int comp_id = mtk_crtc->conn_routes[i].route_ddp;
+		struct mtk_ddp_comp *comp = &priv->ddp_comp[comp_id];
+
+		if (comp->encoder_index >= 0 &&
+		    (encoder_mask & BIT(comp->encoder_index))) {
+			mtk_crtc->ddp_comp[mtk_crtc->ddp_comp_nr - 1] = comp;
+			dev_dbg(dev, "Add comp_id: %d at path index %d\n",
+				comp->id, mtk_crtc->ddp_comp_nr - 1);
+			break;
+		}
+	}
+}
+
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state)
 {
@@ -685,6 +724,8 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
+	mtk_drm_crtc_update_output(crtc, state);
+
 	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
 	if (ret) {
 		pm_runtime_put(comp->dev);
@@ -884,7 +925,8 @@ struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
 
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const unsigned int *path, unsigned int path_len,
-			int priv_data_index)
+			int priv_data_index, const struct mtk_drm_route *conn_routes,
+			unsigned int num_conn_routes)
 {
 	struct mtk_drm_private *priv = drm_dev->dev_private;
 	struct device *dev = drm_dev->dev;
@@ -935,7 +977,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 	mtk_crtc->mmsys_dev = priv->mmsys_dev;
 	mtk_crtc->ddp_comp_nr = path_len;
-	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
+	mtk_crtc->ddp_comp = devm_kmalloc_array(dev,
+						mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
 						sizeof(*mtk_crtc->ddp_comp),
 						GFP_KERNEL);
 	if (!mtk_crtc->ddp_comp)
@@ -1038,5 +1081,30 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
 	}
 #endif
+
+	if (conn_routes) {
+		for (i = 0; i < num_conn_routes; i++) {
+			unsigned int comp_id = conn_routes[i].route_ddp;
+			struct device_node *node = priv->comp_node[comp_id];
+			struct mtk_ddp_comp *comp = &priv->ddp_comp[comp_id];
+
+			if (!comp->dev) {
+				dev_dbg(dev, "comp_id:%d, Component %pOF not initialized\n",
+					comp_id, node);
+				/* mark encoder_index to -1, if route comp device is not enabled */
+				comp->encoder_index = -1;
+				continue;
+			}
+
+			mtk_ddp_comp_encoder_index_set(&priv->ddp_comp[comp_id]);
+		}
+
+		mtk_crtc->num_conn_routes = num_conn_routes;
+		mtk_crtc->conn_routes = conn_routes;
+
+		/* increase ddp_comp_nr at the end of mtk_drm_crtc_create */
+		mtk_crtc->ddp_comp_nr++;
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 3e9046993d09..3c224595fa71 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_crtc.h>
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 
 #define MTK_LUT_SIZE	512
@@ -18,7 +19,9 @@ void mtk_drm_crtc_commit(struct drm_crtc *crtc);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const unsigned int *path,
 			unsigned int path_len,
-			int priv_data_index);
+			int priv_data_index,
+			const struct mtk_drm_route *conn_routes,
+			unsigned int num_conn_routes);
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state);
 void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 771f4e173353..02f0ada3754b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -507,6 +507,31 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }
 
+static unsigned int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
+						       const struct mtk_drm_route *routes,
+						       unsigned int num_routes,
+						       struct mtk_ddp_comp *ddp_comp)
+{
+	int ret;
+	unsigned int i;
+
+	if (!routes) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	for (i = 0; i < num_routes; i++)
+		if (dev == ddp_comp[routes[i].route_ddp].dev)
+			return BIT(routes[i].crtc_id);
+
+	ret = -ENODEV;
+err:
+
+	DRM_INFO("Failed to find comp in ddp table, ret = %d\n", ret);
+
+	return 0;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type)
 {
@@ -538,7 +563,10 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 					  private->data->third_len, private->ddp_comp))
 		ret = BIT(2);
 	else
-		DRM_INFO("Failed to find comp in ddp table\n");
+		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
+							 private->data->conn_routes,
+							 private->data->num_conn_routes,
+							 private->ddp_comp);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index bf4a04c1156b..5d2e191b4106 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -424,6 +424,11 @@ static bool mtk_drm_find_mmsys_comp(struct mtk_drm_private *private, int comp_id
 			if (drv_data->third_path[i] == comp_id)
 				return true;
 
+	if (drv_data->num_conn_routes)
+		for (i = 0; i < drv_data->num_conn_routes; i++)
+			if (drv_data->conn_routes[i].route_ddp == comp_id)
+				return true;
+
 	return false;
 }
 
@@ -482,21 +487,23 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 			if (i == CRTC_MAIN && priv_n->data->main_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
-							  priv_n->data->main_len, j);
+							  priv_n->data->main_len, j,
+							  priv_n->data->conn_routes,
+							  priv_n->data->num_conn_routes);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == CRTC_EXT && priv_n->data->ext_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
-							  priv_n->data->ext_len, j);
+							  priv_n->data->ext_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
 			} else if (i == CRTC_THIRD && priv_n->data->third_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
-							  priv_n->data->third_len, j);
+							  priv_n->data->third_len, j, NULL, 0);
 				if (ret)
 					goto err_component_unbind;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index f4de8bb27685..6f98fff4f1a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -28,6 +28,11 @@ struct drm_fb_helper;
 struct drm_property;
 struct regmap;
 
+struct mtk_drm_route {
+	const unsigned int crtc_id;
+	const unsigned int route_ddp;
+};
+
 struct mtk_mmsys_driver_data {
 	const unsigned int *main_path;
 	unsigned int main_len;
@@ -35,6 +40,8 @@ struct mtk_mmsys_driver_data {
 	unsigned int ext_len;
 	const unsigned int *third_path;
 	unsigned int third_len;
+	const struct mtk_drm_route *conn_routes;
+	unsigned int num_conn_routes;
 
 	bool shadow_register;
 	unsigned int mmsys_id;
-- 
2.18.0

