Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A54534D3C
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 12:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B1C10EE87;
	Thu, 26 May 2022 10:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA8510EB86
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 10:21:38 +0000 (UTC)
X-UUID: edf0764b24f24ed295699a388a25b030-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:fedf0c8d-0654-4f37-92b5-a77a494370a5, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:d67258b8-3c45-407b-8f66-25095432a27a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: edf0764b24f24ed295699a388a25b030-20220526
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1655648927; Thu, 26 May 2022 18:21:28 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 26 May 2022 18:21:28 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 18:21:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 18:21:27 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v22 3/5] drm/mediatek: add mediatek-drm of vdosys0 support for
 mt8195
Date: Thu, 26 May 2022 18:21:24 +0800
Message-ID: <20220526102126.19756-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220526102126.19756-1-jason-jh.lin@mediatek.com>
References: <20220526102126.19756-1-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "jason-jh.lin" <jason-jh.lin@mediatek.com>

1. Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
2. Add get driver data function to identify which vdosys by io_start.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 150 +++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   6 +
 3 files changed, 153 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 1be4caf9ff96..a000bba04e01 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -372,6 +372,10 @@ static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
 	.fifo_size = 5 * SZ_1K,
 };
 
+static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
+	.fifo_size = 1920,
+};
+
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = &mt2701_rdma_driver_data},
@@ -381,6 +385,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	  .data = &mt8183_rdma_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = &mt8192_rdma_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-rdma",
+	  .data = &mt8195_rdma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5c1c657ceb6e..eb477c17a0ce 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -4,6 +4,8 @@
  * Author: YT SHEN <yt.shen@mediatek.com>
  */
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/component.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
@@ -195,6 +197,19 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DSC0,
+	DDP_COMPONENT_MERGE0,
+	DDP_COMPONENT_DP_INTF0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -203,6 +218,13 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
+static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt2701_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.main_path = mt7623_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt7623_mtk_ddp_main),
@@ -211,6 +233,13 @@ static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
+static const struct mtk_mmsys_match_data mt7623_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt7623_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.main_path = mt2712_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
@@ -220,11 +249,25 @@ static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
 };
 
+static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt2712_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.main_path = mt8167_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8167_mtk_ddp_main),
 };
 
+static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8167_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.main_path = mt8173_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
@@ -232,6 +275,13 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8173_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.main_path = mt8183_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8183_mtk_ddp_main),
@@ -239,6 +289,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8183_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.main_path = mt8186_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8186_mtk_ddp_main),
@@ -246,6 +303,13 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8186_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8186_mmsys_driver_data,
+	},
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.main_path = mt8192_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
@@ -253,6 +317,31 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8192_mmsys_driver_data,
+	},
+};
+
+static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
+	.io_start = 0x1c01a000,
+	.main_path = mt8195_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
+};
+
+static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
+	.io_start = 0x1c100000,
+};
+
+static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8195_vdosys0_driver_data,
+		&mt8195_vdosys1_driver_data,
+	},
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -470,12 +559,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8183-disp-dither",
 	  .data = (void *)MTK_DISP_DITHER },
+	{ .compatible = "mediatek,mt8195-disp-dsc",
+	  .data = (void *)MTK_DISP_DSC },
 	{ .compatible = "mediatek,mt8167-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
+	{ .compatible = "mediatek,mt8195-disp-merge",
+	  .data = (void *)MTK_DISP_MERGE },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2712-disp-mutex",
@@ -490,6 +583,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8195-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -524,6 +619,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8192-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8195-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
@@ -549,30 +646,53 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
-	  .data = &mt2701_mmsys_driver_data},
+	  .data = &mt2701_mmsys_match_data},
 	{ .compatible = "mediatek,mt7623-mmsys",
-	  .data = &mt7623_mmsys_driver_data},
+	  .data = &mt7623_mmsys_match_data},
 	{ .compatible = "mediatek,mt2712-mmsys",
-	  .data = &mt2712_mmsys_driver_data},
+	  .data = &mt2712_mmsys_match_data},
 	{ .compatible = "mediatek,mt8167-mmsys",
-	  .data = &mt8167_mmsys_driver_data},
+	  .data = &mt8167_mmsys_match_data},
 	{ .compatible = "mediatek,mt8173-mmsys",
-	  .data = &mt8173_mmsys_driver_data},
+	  .data = &mt8173_mmsys_match_data},
 	{ .compatible = "mediatek,mt8183-mmsys",
-	  .data = &mt8183_mmsys_driver_data},
+	  .data = &mt8183_mmsys_match_data},
 	{ .compatible = "mediatek,mt8186-mmsys",
-	  .data = &mt8186_mmsys_driver_data},
+	  .data = &mt8186_mmsys_match_data},
 	{ .compatible = "mediatek,mt8192-mmsys",
-	  .data = &mt8192_mmsys_driver_data},
+	  .data = &mt8192_mmsys_match_data},
+	{ .compatible = "mediatek,mt8195-mmsys",
+	  .data = &mt8195_mmsys_match_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
 
+static int mtk_drm_find_match_data(struct device *dev,
+				   const struct mtk_mmsys_match_data *match_data)
+{
+	int i;
+	struct platform_device *pdev = of_find_device_by_node(dev->parent->of_node);
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "failed to get parent resource\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < match_data->num_drv_data; i++)
+		if (match_data->drv_data[i]->io_start == res->start)
+			return i;
+
+	return -EINVAL;
+}
+
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
+	const struct mtk_mmsys_match_data *match_data;
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
@@ -593,7 +713,19 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!of_id)
 		return -ENODEV;
 
-	private->data = of_id->data;
+	match_data = of_id->data;
+	if (match_data->num_drv_data > 1) {
+		/* This SoC has multiple mmsys channels */
+		ret = mtk_drm_find_match_data(dev, match_data);
+		if (ret < 0) {
+			dev_err(dev, "Couldn't get match driver data\n");
+			return ret;
+		}
+		private->data = match_data->drv_data[ret];
+	} else {
+		dev_dbg(dev, "Using single mmsys channel\n");
+		private->data = match_data->drv_data[0];
+	}
 
 	/* Iterate over sibling DISP function blocks */
 	for_each_child_of_node(phandle->parent, node) {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index a58cebd01d35..9fc922b1684f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -21,6 +21,7 @@ struct drm_property;
 struct regmap;
 
 struct mtk_mmsys_driver_data {
+	const resource_size_t io_start;
 	const enum mtk_ddp_comp_id *main_path;
 	unsigned int main_len;
 	const enum mtk_ddp_comp_id *ext_path;
@@ -31,6 +32,11 @@ struct mtk_mmsys_driver_data {
 	bool shadow_register;
 };
 
+struct mtk_mmsys_match_data {
+	unsigned short num_drv_data;
+	const struct mtk_mmsys_driver_data *drv_data[];
+};
+
 struct mtk_drm_private {
 	struct drm_device *drm;
 	struct device *dma_dev;
-- 
2.18.0

