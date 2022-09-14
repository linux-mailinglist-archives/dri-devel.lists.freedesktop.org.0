Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE75B8ED4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AD110E9CC;
	Wed, 14 Sep 2022 18:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263C010E9C9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 18:24:04 +0000 (UTC)
X-UUID: c0f2b3ad370f4f25a9d4ba017dc616b1-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FxJ4kSiQwjUNoDV06C4Y0iNYnzEdtsFTLvG98R00Hqg=; 
 b=lJ6jBATIc+q+Ua4qKEKWbw4jTJ5//c0APVwQngmza6t9unbNhoX54AABGLFBr0M7Z6Ap8UrhjINIigZpwp7gRGtZlg/92pYxyeaLQbLxg0jUqGF5vZDQETBnpzSZh/fQBI4KQOp9lQDSlvS00UUEPlO9/ykFz6GpUK+fi7Cskeg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:65fbc6a7-197e-4d09-af7d-373cf06389f6, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:70
X-CID-INFO: VERSION:1.1.11, REQID:65fbc6a7-197e-4d09-af7d-373cf06389f6, IP:0,
 URL
 :0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
 ON:quarantine,TS:70
X-CID-META: VersionHash:39a5ff1, CLOUDID:f5e770ec-2856-4fce-b125-09d4c7ebe045,
 B
 ulkID:2209150223584FFI4X9Y,BulkQuantity:0,Recheck:0,SF:28|17|19|48,TC:nil,
 Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c0f2b3ad370f4f25a9d4ba017dc616b1-20220915
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 877485315; Thu, 15 Sep 2022 02:23:56 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 15 Sep 2022 02:23:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 02:23:55 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/5] drm/mediatek: change compatible name for mt8195
Date: Thu, 15 Sep 2022 02:23:29 +0800
Message-ID: <20220914182331.20515-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In mt8195, vdosys0 and vdosys1 are 2 different function blocks
for mediatek-drm, so using 2 compatible instead of identifying
multiple mmsys by io_start.

Fixes: 7266e90a51a3 ("drm/mediatek: Add mediatek-drm of vdosys0 support for mt8195")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 124 +++----------------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |   6 --
 2 files changed, 11 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5f02f8d0e4fc..8b45bdea7aca 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -218,13 +218,6 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
-static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt2701_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.main_path = mt7623_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt7623_mtk_ddp_main),
@@ -233,13 +226,6 @@ static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
-static const struct mtk_mmsys_match_data mt7623_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt7623_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.main_path = mt2712_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
@@ -249,25 +235,11 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
 };
 
-static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt2712_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.main_path = mt8167_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8167_mtk_ddp_main),
 };
 
-static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8167_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.main_path = mt8173_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
@@ -275,13 +247,6 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
 };
 
-static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8173_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.main_path = mt8183_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
@@ -289,13 +254,6 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
 };
 
-static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8183_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.main_path = mt8186_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8186_mtk_ddp_main),
@@ -303,13 +261,6 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
 };
 
-static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8186_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -317,31 +268,11 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
 };
 
-static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8192_mmsys_driver_data,
-	},
-};
-
 static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
-	.io_start = 0x1c01a000,
 	.main_path = mt8195_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
 };
 
-static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
-	.io_start = 0x1c100000,
-};
-
-static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
-	.num_drv_data = 1,
-	.drv_data = {
-		&mt8195_vdosys0_driver_data,
-		&mt8195_vdosys1_driver_data,
-	},
-};
-
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -648,53 +579,32 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
-	  .data = &mt2701_mmsys_match_data},
+	  .data = &mt2701_mmsys_driver_data},
 	{ .compatible = "mediatek,mt7623-mmsys",
-	  .data = &mt7623_mmsys_match_data},
+	  .data = &mt7623_mmsys_driver_data},
 	{ .compatible = "mediatek,mt2712-mmsys",
-	  .data = &mt2712_mmsys_match_data},
+	  .data = &mt2712_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8167-mmsys",
-	  .data = &mt8167_mmsys_match_data},
+	  .data = &mt8167_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8173-mmsys",
-	  .data = &mt8173_mmsys_match_data},
+	  .data = &mt8173_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8183-mmsys",
-	  .data = &mt8183_mmsys_match_data},
+	  .data = &mt8183_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8186-mmsys",
-	  .data = &mt8186_mmsys_match_data},
+	  .data = &mt8186_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
-	  .data = &mt8192_mmsys_match_data},
-	{ .compatible = "mediatek,mt8195-mmsys",
-	  .data = &mt8195_mmsys_match_data},
+	  .data = &mt8192_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8195-vdosys0",
+	  .data = &mt8195_vdosys0_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
 
-static int mtk_drm_find_match_data(struct device *dev,
-				   const struct mtk_mmsys_match_data *match_data)
-{
-	int i;
-	struct platform_device *pdev = of_find_device_by_node(dev->parent->of_node);
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get parent resource\n");
-		return -EINVAL;
-	}
-
-	for (i = 0; i < match_data->num_drv_data; i++)
-		if (match_data->drv_data[i]->io_start == res->start)
-			return i;
-
-	return -EINVAL;
-}
-
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
-	const struct mtk_mmsys_match_data *match_data;
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
@@ -715,19 +625,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!of_id)
 		return -ENODEV;
 
-	match_data = of_id->data;
-	if (match_data->num_drv_data > 1) {
-		/* This SoC has multiple mmsys channels */
-		ret = mtk_drm_find_match_data(dev, match_data);
-		if (ret < 0) {
-			dev_err(dev, "Couldn't get match driver data\n");
-			return ret;
-		}
-		private->data = match_data->drv_data[ret];
-	} else {
-		dev_dbg(dev, "Using single mmsys channel\n");
-		private->data = match_data->drv_data[0];
-	}
+	private->data = of_id->data;
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 7b37b5cf9629..64a1f66df26a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -21,7 +21,6 @@ struct drm_property;
 struct regmap;
 
 struct mtk_mmsys_driver_data {
-	const resource_size_t io_start;
 	const enum mtk_ddp_comp_id *main_path;
 	unsigned int main_len;
 	const enum mtk_ddp_comp_id *ext_path;
@@ -32,11 +31,6 @@ struct mtk_mmsys_driver_data {
 	bool shadow_register;
 };
 
-struct mtk_mmsys_match_data {
-	unsigned short num_drv_data;
-	const struct mtk_mmsys_driver_data *drv_data[];
-};
-
 struct mtk_drm_private {
 	struct drm_device *drm;
 	struct device *dma_dev;
-- 
2.18.0

