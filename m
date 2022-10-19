Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1865603844
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 04:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197D510F0CB;
	Wed, 19 Oct 2022 02:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC4B10F0CA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:52:28 +0000 (UTC)
X-UUID: 33632b6b8d9d4ae3b8b6d444f9a0febb-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9etT1Q07LM7WV2yFK5RkTj17fGI7ePiYXL+BTT0Pw+0=; 
 b=NydLnQjZmi0PS73Xh0TE5IglDo/VtVpMlw0H2WTxGlYBoH/XMBl7qZ7SR+Db9hhMn3v5V7cDO2b631lIteisIUeJqqRo6qk3y2V71ntMZHtq8S6rCkSvbp/GLSc9mWI4wlGybElYavBFkFugqigXN38Z5Qj7D0uQZpEpxMOakaY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:1d3ba43c-691d-4b57-a91c-7cdfdd9efc6a, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:70
X-CID-INFO: VERSION:1.1.11, REQID:1d3ba43c-691d-4b57-a91c-7cdfdd9efc6a, IP:0,
 URL
 :0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
 ON:quarantine,TS:70
X-CID-META: VersionHash:39a5ff1, CLOUDID:aecd3ca4-ebb2-41a8-a87c-97702aaf2e20,
 B
 ulkID:221019105225A0JO0XZ8,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 33632b6b8d9d4ae3b8b6d444f9a0febb-20221019
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1230461729; Wed, 19 Oct 2022 10:52:24 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 19 Oct 2022 10:52:23 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 19 Oct 2022 10:52:22 +0800
From: <xinlei.lee@mediatek.com>
To: <matthias.bgg@gmail.com>, <rex-bc.chen@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <jason-jh.lin@mediatek.com>,
 <nfraprado@collabora.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v12,2/3] drm: mediatek: Set dpi format in mmsys
Date: Wed, 19 Oct 2022 10:52:15 +0800
Message-ID: <1666147936-27368-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

Dpi output needs to adjust the output format to dual edge for MT8186.

Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 508a6d994e83..b9d740efdb6a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -14,6 +14,7 @@
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/types.h>
 
 #include <video/videomode.h>
@@ -29,6 +30,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_dpi_regs.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 enum mtk_dpi_out_bit_num {
 	MTK_DPI_OUT_BIT_NUM_8BITS,
@@ -66,6 +68,7 @@ struct mtk_dpi {
 	struct drm_connector *connector;
 	void __iomem *regs;
 	struct device *dev;
+	struct device *mmsys_dev;
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
 	struct clk *tvd_clk;
@@ -134,6 +137,7 @@ struct mtk_dpi_yc_limit {
  * @yuv422_en_bit: Enable bit of yuv422.
  * @csc_enable_bit: Enable bit of CSC.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
+ * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
  */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
@@ -152,6 +156,7 @@ struct mtk_dpi_conf {
 	u32 yuv422_en_bit;
 	u32 csc_enable_bit;
 	u32 pixels_per_iter;
+	bool edge_cfg_in_mmsys;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -448,8 +453,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
 		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
 			     dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE ?
 			     EDGE_SEL : 0, EDGE_SEL);
+		if (dpi->conf->edge_cfg_in_mmsys)
+			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_DPI_RGB888_DDR_CON);
 	} else {
 		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE, 0);
+		if (dpi->conf->edge_cfg_in_mmsys)
+			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev, MTK_DPI_RGB888_SDR_CON);
 	}
 }
 
@@ -777,8 +786,10 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct mtk_drm_private *priv = drm_dev->dev_private;
 	int ret;
 
+	dpi->mmsys_dev = priv->mmsys_dev;
 	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
 				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
-- 
2.18.0

