Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BE95BE11F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95DF10E484;
	Tue, 20 Sep 2022 09:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F2510E484
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:01:42 +0000 (UTC)
X-UUID: 915ef9794fca4406956f390d7c161a43-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kjnQc2ji9IfXYKqhoT4lS5DRBS4AWBjjlo3MSv41gGM=; 
 b=oUlPj6BWVrWWG2TiNG5Etoh2vQ7pb8C5dlTFtcMDUB4exdiH1HTokW6CnffxIMQgu2Xmu3iksWuX0oPoLsG6Q1yq7yUllHe482YIgIkkYQaBLg0NCjYxxAyyPryvaqBL7hjSwdoYazCiFCiDU27TCs98jHDHFkhgcEpnpLNG6wg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:b588638f-6541-42db-9410-78bace2fc5f5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:9df103f7-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 915ef9794fca4406956f390d7c161a43-20220920
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 407756409; Tue, 20 Sep 2022 17:01:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:50 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 13/18] phy: mediatek: mipi: mt8173: use GENMASK to generate
 bits mask
Date: Tue, 20 Sep 2022 17:00:33 +0800
Message-ID: <20220920090038.15133-14-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use GENMASK() macro to generate bits mask

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 53 ++++++++++---------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 7a847954594f..5c257d67d7be 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -9,9 +9,9 @@
 #define MIPITX_DSI_CON		0x00
 #define RG_DSI_LDOCORE_EN		BIT(0)
 #define RG_DSI_CKG_LDOOUT_EN		BIT(1)
-#define RG_DSI_BCLK_SEL			(3 << 2)
-#define RG_DSI_LD_IDX_SEL		(7 << 4)
-#define RG_DSI_PHYCLK_SEL		(2 << 8)
+#define RG_DSI_BCLK_SEL			GENMASK(3, 2)
+#define RG_DSI_LD_IDX_SEL		GENMASK(6, 4)
+#define RG_DSI_PHYCLK_SEL		GENMASK(9, 8)
 #define RG_DSI_DSICLK_FREQ_SEL		BIT(10)
 #define RG_DSI_LPTX_CLMP_EN		BIT(11)
 
@@ -27,41 +27,46 @@
 #define RG_DSI_LNTx_LPTX_IMINUS		BIT(4)
 #define RG_DSI_LNTx_LPCD_IPLUS		BIT(5)
 #define RG_DSI_LNTx_LPCD_IMINUS		BIT(6)
-#define RG_DSI_LNTx_RT_CODE		(0xf << 8)
+#define RG_DSI_LNTx_RT_CODE		GENMASK(11, 8)
 
 #define MIPITX_DSI_TOP_CON	0x40
 #define RG_DSI_LNT_INTR_EN		BIT(0)
 #define RG_DSI_LNT_HS_BIAS_EN		BIT(1)
 #define RG_DSI_LNT_IMP_CAL_EN		BIT(2)
 #define RG_DSI_LNT_TESTMODE_EN		BIT(3)
-#define RG_DSI_LNT_IMP_CAL_CODE		(0xf << 4)
-#define RG_DSI_LNT_AIO_SEL		(7 << 8)
+#define RG_DSI_LNT_IMP_CAL_CODE		GENMASK(7, 4)
+#define RG_DSI_LNT_AIO_SEL		GENMASK(10, 8)
 #define RG_DSI_PAD_TIE_LOW_EN		BIT(11)
 #define RG_DSI_DEBUG_INPUT_EN		BIT(12)
-#define RG_DSI_PRESERVE			(7 << 13)
+#define RG_DSI_PRESERVE			GENMASK(15, 13)
 
 #define MIPITX_DSI_BG_CON	0x44
 #define RG_DSI_BG_CORE_EN		BIT(0)
 #define RG_DSI_BG_CKEN			BIT(1)
-#define RG_DSI_BG_DIV			(0x3 << 2)
+#define RG_DSI_BG_DIV			GENMASK(3, 2)
 #define RG_DSI_BG_FAST_CHARGE		BIT(4)
-#define RG_DSI_VOUT_MSK			(0x3ffff << 5)
-#define RG_DSI_V12_SEL			(7 << 5)
-#define RG_DSI_V10_SEL			(7 << 8)
-#define RG_DSI_V072_SEL			(7 << 11)
-#define RG_DSI_V04_SEL			(7 << 14)
-#define RG_DSI_V032_SEL			(7 << 17)
-#define RG_DSI_V02_SEL			(7 << 20)
-#define RG_DSI_BG_R1_TRIM		(0xf << 24)
-#define RG_DSI_BG_R2_TRIM		(0xf << 28)
+
+#define RG_DSI_V12_SEL			GENMASK(7, 5)
+#define RG_DSI_V10_SEL			GENMASK(10, 8)
+#define RG_DSI_V072_SEL			GENMASK(13, 11)
+#define RG_DSI_V04_SEL			GENMASK(16, 14)
+#define RG_DSI_V032_SEL			GENMASK(19, 17)
+#define RG_DSI_V02_SEL			GENMASK(22, 20)
+#define RG_DSI_VOUT_MSK			\
+		(RG_DSI_V12_SEL | RG_DSI_V10_SEL | RG_DSI_V072_SEL | \
+		 RG_DSI_V04_SEL | RG_DSI_V032_SEL | RG_DSI_V02_SEL)
+#define RG_DSI_BG_R1_TRIM		GENMASK(27, 24)
+#define RG_DSI_BG_R2_TRIM		GENMASK(31, 28)
 
 #define MIPITX_DSI_PLL_CON0	0x50
 #define RG_DSI_MPPLL_PLL_EN		BIT(0)
-#define RG_DSI_MPPLL_DIV_MSK		(0x1ff << 1)
-#define RG_DSI_MPPLL_PREDIV		(3 << 1)
-#define RG_DSI_MPPLL_TXDIV0		(3 << 3)
-#define RG_DSI_MPPLL_TXDIV1		(3 << 5)
-#define RG_DSI_MPPLL_POSDIV		(7 << 7)
+#define RG_DSI_MPPLL_PREDIV		GENMASK(2, 1)
+#define RG_DSI_MPPLL_TXDIV0		GENMASK(4, 3)
+#define RG_DSI_MPPLL_TXDIV1		GENMASK(6, 5)
+#define RG_DSI_MPPLL_POSDIV		GENMASK(9, 7)
+#define RG_DSI_MPPLL_DIV_MSK		\
+		(RG_DSI_MPPLL_PREDIV | RG_DSI_MPPLL_TXDIV0 | \
+		 RG_DSI_MPPLL_TXDIV1 | RG_DSI_MPPLL_POSDIV)
 #define RG_DSI_MPPLL_MONVC_EN		BIT(10)
 #define RG_DSI_MPPLL_MONREF_EN		BIT(11)
 #define RG_DSI_MPPLL_VOD_EN		BIT(12)
@@ -70,12 +75,12 @@
 #define RG_DSI_MPPLL_SDM_FRA_EN		BIT(0)
 #define RG_DSI_MPPLL_SDM_SSC_PH_INIT	BIT(1)
 #define RG_DSI_MPPLL_SDM_SSC_EN		BIT(2)
-#define RG_DSI_MPPLL_SDM_SSC_PRD	(0xffff << 16)
+#define RG_DSI_MPPLL_SDM_SSC_PRD	GENMASK(31, 16)
 
 #define MIPITX_DSI_PLL_CON2	0x58
 
 #define MIPITX_DSI_PLL_TOP	0x64
-#define RG_DSI_MPPLL_PRESERVE		(0xff << 8)
+#define RG_DSI_MPPLL_PRESERVE		GENMASK(15, 8)
 
 #define MIPITX_DSI_PLL_PWR	0x68
 #define RG_DSI_MPPLL_SDM_PWR_ON		BIT(0)
-- 
2.18.0

