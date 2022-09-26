Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2C95E9AA0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 09:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A847710E63D;
	Mon, 26 Sep 2022 07:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A85F10E637
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 07:43:22 +0000 (UTC)
X-UUID: b86ef8f4dad74545ae9b26c51b58783b-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x2gGdvoD5teYjL98pU54T+cQk2ngxBwt+rNcl4zrPQI=; 
 b=tgX+W3Y4uhng1N3DiUF6XFlBoHbEIFPnDIRFZUa3dGlrU2JFwIuICiiz5KVL7l13bqg4ZBPvO9dmKVbGIjFCm+CfhS3evMkAqkrAlYx0BmgxcyR+Xt8bZSGUztm0dN4pH1vi1CXpK1+77YO6uUe6+a3qZYxYSQguSfe1Ye3K65o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:6e7dc779-25e7-4e70-acae-12a4f87c91c7, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:70
X-CID-INFO: VERSION:1.1.11, REQID:6e7dc779-25e7-4e70-acae-12a4f87c91c7, IP:0,
 URL
 :0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
 ON:quarantine,TS:70
X-CID-META: VersionHash:39a5ff1, CLOUDID:2b7638e4-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:2209261543186QR2OMSK,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:n
 il,COL:0
X-UUID: b86ef8f4dad74545ae9b26c51b58783b-20220926
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1517639888; Mon, 26 Sep 2022 15:43:17 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 15:43:16 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 26 Sep 2022 15:43:15 +0800
From: <xinlei.lee@mediatek.com>
To: <matthias.bgg@gmail.com>, <jason-jh.lin@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>, <rex-bc.chen@mediatek.com>,
 <ck.hu@mediatek.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH v11,
 1/3] soc: mediatek: Add all settings to mtk_mmsys_ddp_dpi_fmt_config
 func
Date: Mon, 26 Sep 2022 15:43:09 +0800
Message-ID: <1664178191-27964-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1664178191-27964-1-git-send-email-xinlei.lee@mediatek.com>
References: <1664178191-27964-1-git-send-email-xinlei.lee@mediatek.com>
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

The difference between MT8186 and other ICs is that when modifying the
output format, we need to modify the mmsys_base+0x400 register to take
effect.
So when setting the dpi output format, we need to call mmsys_func to set
it to MT8186 synchronously.
Adding mmsys all the settings that need to be modified with dpi are for
mt8186.

Fixes: a071e52f75d1 ("soc: mediatek: Add mmsys func to adapt to dpi
output for MT8186")

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/soc/mediatek/mt8186-mmsys.h    |  8 +++++---
 drivers/soc/mediatek/mtk-mmsys.c       | 27 ++++++++++++++++++++------
 include/linux/soc/mediatek/mtk-mmsys.h |  7 +++++++
 3 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
index 09b1ccbc0093..035aec1eb616 100644
--- a/drivers/soc/mediatek/mt8186-mmsys.h
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -5,9 +5,11 @@
 
 /* Values for DPI configuration in MMSYS address space */
 #define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
-#define DPI_FORMAT_MASK					0x1
-#define DPI_RGB888_DDR_CON				BIT(0)
-#define DPI_RGB565_SDR_CON				BIT(1)
+#define DPI_FORMAT_MASK					GENMASK(1, 0)
+#define DPI_RGB888_SDR_CON				0
+#define DPI_RGB888_DDR_CON				1
+#define DPI_RGB565_SDR_CON				2
+#define DPI_RGB565_DDR_CON				3
 
 #define MT8186_MMSYS_OVL_CON			0xF04
 #define MT8186_MMSYS_OVL0_CON_MASK			0x3
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 2e20b24da363..205f6de45851 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -238,12 +238,27 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 
 void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
 {
-	if (val)
-		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
-				      DPI_RGB888_DDR_CON, DPI_FORMAT_MASK);
-	else
-		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
-				      DPI_RGB565_SDR_CON, DPI_FORMAT_MASK);
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+
+	switch (val) {
+	case MTK_DPI_RGB888_SDR_CON:
+		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_FORMAT_MASK, DPI_RGB888_SDR_CON);
+		break;
+	case MTK_DPI_RGB565_SDR_CON:
+		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_FORMAT_MASK, DPI_RGB565_SDR_CON);
+		break;
+	case MTK_DPI_RGB565_DDR_CON:
+		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_FORMAT_MASK, DPI_RGB565_DDR_CON);
+		break;
+	case MTK_DPI_RGB888_DDR_CON:
+	default:
+		mtk_mmsys_update_bits(mmsys, MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_FORMAT_MASK, DPI_RGB888_DDR_CON);
+		break;
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index d2b02bb43768..b85f66db33e1 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -9,6 +9,13 @@
 enum mtk_ddp_comp_id;
 struct device;
 
+enum mtk_dpi_out_format_con {
+	MTK_DPI_RGB888_SDR_CON,
+	MTK_DPI_RGB888_DDR_CON,
+	MTK_DPI_RGB565_SDR_CON,
+	MTK_DPI_RGB565_DDR_CON
+};
+
 enum mtk_ddp_comp_id {
 	DDP_COMPONENT_AAL0,
 	DDP_COMPONENT_AAL1,
-- 
2.18.0

