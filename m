Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01B5E77D3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FACA10E824;
	Fri, 23 Sep 2022 09:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B1110E800
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:58:35 +0000 (UTC)
X-UUID: cc89cf1ee48944ac8e78746bddd8e231-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vmuZDbbUSrIW12Davd+hAaH3uSu4UB7rC4929vf2Gk4=; 
 b=TL//+/ao778QBNiKd5w5v8+yLRANhy9HCsgNayXrPuoSTUqeCjlnfgsvHFZYEBPE+g/nlsb/ngTh9hJ3XEjHecMmIy4IJVFmUKz7yirKMZCHZB2QvQIwHoBsRYR3UHKJcNZvxz+2H2y90GQeR8wl1BG+lSmHScu69zeqFbYNZP8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:5f841aad-634a-4849-8ad3-0b5ba51a4f78, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:70
X-CID-INFO: VERSION:1.1.11, REQID:5f841aad-634a-4849-8ad3-0b5ba51a4f78, IP:0,
 URL
 :0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
 ON:quarantine,TS:70
X-CID-META: VersionHash:39a5ff1, CLOUDID:6b9101e4-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:22092317583206BB3TE2,BulkQuantity:0,Recheck:0,SF:28|17|19|48|823|824
 ,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL
 :0
X-UUID: cc89cf1ee48944ac8e78746bddd8e231-20220923
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 943835122; Fri, 23 Sep 2022 17:58:31 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 17:58:30 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Sep 2022 17:58:29 +0800
From: <xinlei.lee@mediatek.com>
To: <matthias.bgg@gmail.com>, <jason-jh.lin@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <rex-bc.chen@mediatek.com>,
 <ck.hu@mediatek.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH v10, 2/3] drm: mediatek: Adjust the dpi output format to MT8186
Date: Fri, 23 Sep 2022 17:58:23 +0800
Message-ID: <1663927104-15506-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1663927104-15506-1-git-send-email-xinlei.lee@mediatek.com>
References: <1663927104-15506-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, Xinlei Lee <xinlei.lee@mediatek.com>,
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
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 630a4e301ef6..ad87ecddf58d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -15,6 +15,7 @@
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/types.h>
 
 #include <video/videomode.h>
@@ -30,6 +31,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_dpi_regs.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 enum mtk_dpi_out_bit_num {
 	MTK_DPI_OUT_BIT_NUM_8BITS,
@@ -67,6 +69,7 @@ struct mtk_dpi {
 	struct drm_connector *connector;
 	void __iomem *regs;
 	struct device *dev;
+	struct device *mmsys_dev;
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
 	struct clk *tvd_clk;
@@ -135,6 +138,7 @@ struct mtk_dpi_yc_limit {
  * @yuv422_en_bit: Enable bit of yuv422.
  * @csc_enable_bit: Enable bit of CSC.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
+ * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
  */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
@@ -153,6 +157,7 @@ struct mtk_dpi_conf {
 	u32 yuv422_en_bit;
 	u32 csc_enable_bit;
 	u32 pixels_per_iter;
+	bool edge_cfg_in_mmsys;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -449,8 +454,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
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
 
@@ -778,8 +787,10 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
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

