Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F895BE11E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E4310E487;
	Tue, 20 Sep 2022 09:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10C310E487
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:01:42 +0000 (UTC)
X-UUID: 31f59e3acd7b4c44b6ca5af430fee34b-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ytrQnG/V2K/tHDXLg23WgbWOqrdF6GfQmTo0wBuNhXg=; 
 b=c+4Xc8c8BALLKRwjzzdrOYQ/fmvBy79nnt4H32mOgXnMN7vHnr3bkW/9c9cG/2hiMYntuJCQ65EJLMW276m1r+jyMR5I8bvXWPMZRuteX/eZ5fwqC9Ggz1KKfgtf4dFcmo0ptwTkYNG6zkLLO6WUpJ82aGTrYTdgryWQrVO30fc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:07b0ca8b-706b-4868-8717-82fc3967b6f5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:fbc76670-dafa-4a42-b716-cf2cd4845592,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 31f59e3acd7b4c44b6ca5af430fee34b-20220920
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1750902661; Tue, 20 Sep 2022 17:01:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 09/18] phy: mediatek: hdmi: mt8173: use GENMASK to generate
 bits mask
Date: Tue, 20 Sep 2022 17:00:29 +0800
Message-ID: <20220920090038.15133-10-chunfeng.yun@mediatek.com>
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 88 +++++++++++-----------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index 6cdfdf5a698a..55fe97f5465d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -8,38 +8,38 @@
 
 #define HDMI_CON0		0x00
 #define RG_HDMITX_PLL_EN		BIT(31)
-#define RG_HDMITX_PLL_FBKDIV		(0x7f << 24)
+#define RG_HDMITX_PLL_FBKDIV		GENMASK(30, 24)
 #define PLL_FBKDIV_SHIFT		24
-#define RG_HDMITX_PLL_FBKSEL		(0x3 << 22)
+#define RG_HDMITX_PLL_FBKSEL		GENMASK(23, 22)
 #define PLL_FBKSEL_SHIFT		22
-#define RG_HDMITX_PLL_PREDIV		(0x3 << 20)
+#define RG_HDMITX_PLL_PREDIV		GENMASK(21, 20)
 #define PREDIV_SHIFT			20
-#define RG_HDMITX_PLL_POSDIV		(0x3 << 18)
+#define RG_HDMITX_PLL_POSDIV		GENMASK(19, 18)
 #define POSDIV_SHIFT			18
-#define RG_HDMITX_PLL_RST_DLY		(0x3 << 16)
-#define RG_HDMITX_PLL_IR		(0xf << 12)
+#define RG_HDMITX_PLL_RST_DLY		GENMASK(17, 16)
+#define RG_HDMITX_PLL_IR		GENMASK(15, 12)
 #define PLL_IR_SHIFT			12
-#define RG_HDMITX_PLL_IC		(0xf << 8)
+#define RG_HDMITX_PLL_IC		GENMASK(11, 8)
 #define PLL_IC_SHIFT			8
-#define RG_HDMITX_PLL_BP		(0xf << 4)
+#define RG_HDMITX_PLL_BP		GENMASK(7, 4)
 #define PLL_BP_SHIFT			4
-#define RG_HDMITX_PLL_BR		(0x3 << 2)
+#define RG_HDMITX_PLL_BR		GENMASK(3, 2)
 #define PLL_BR_SHIFT			2
-#define RG_HDMITX_PLL_BC		(0x3 << 0)
+#define RG_HDMITX_PLL_BC		GENMASK(1, 0)
 #define PLL_BC_SHIFT			0
 #define HDMI_CON1		0x04
-#define RG_HDMITX_PLL_DIVEN		(0x7 << 29)
+#define RG_HDMITX_PLL_DIVEN		GENMASK(31, 29)
 #define PLL_DIVEN_SHIFT			29
 #define RG_HDMITX_PLL_AUTOK_EN		BIT(28)
-#define RG_HDMITX_PLL_AUTOK_KF		(0x3 << 26)
-#define RG_HDMITX_PLL_AUTOK_KS		(0x3 << 24)
+#define RG_HDMITX_PLL_AUTOK_KF		GENMASK(27, 26)
+#define RG_HDMITX_PLL_AUTOK_KS		GENMASK(25, 24)
 #define RG_HDMITX_PLL_AUTOK_LOAD	BIT(23)
-#define RG_HDMITX_PLL_BAND		(0x3f << 16)
+#define RG_HDMITX_PLL_BAND		GENMASK(21, 16)
 #define RG_HDMITX_PLL_REF_SEL		BIT(15)
 #define RG_HDMITX_PLL_BIAS_EN		BIT(14)
 #define RG_HDMITX_PLL_BIAS_LPF_EN	BIT(13)
 #define RG_HDMITX_PLL_TXDIV_EN		BIT(12)
-#define RG_HDMITX_PLL_TXDIV		(0x3 << 10)
+#define RG_HDMITX_PLL_TXDIV		GENMASK(11, 10)
 #define PLL_TXDIV_SHIFT			10
 #define RG_HDMITX_PLL_LVROD_EN		BIT(9)
 #define RG_HDMITX_PLL_MONVC_EN		BIT(8)
@@ -47,64 +47,64 @@
 #define RG_HDMITX_PLL_MONREF_EN		BIT(6)
 #define RG_HDMITX_PLL_TST_EN		BIT(5)
 #define RG_HDMITX_PLL_TST_CK_EN		BIT(4)
-#define RG_HDMITX_PLL_TST_SEL		(0xf << 0)
+#define RG_HDMITX_PLL_TST_SEL		GENMASK(3, 0)
 #define HDMI_CON2		0x08
-#define RGS_HDMITX_PLL_AUTOK_BAND	(0x7f << 8)
+#define RGS_HDMITX_PLL_AUTOK_BAND	GENMASK(14, 8)
 #define RGS_HDMITX_PLL_AUTOK_FAIL	BIT(1)
 #define RG_HDMITX_EN_TX_CKLDO		BIT(0)
 #define HDMI_CON3		0x0c
-#define RG_HDMITX_SER_EN		(0xf << 28)
-#define RG_HDMITX_PRD_EN		(0xf << 24)
-#define RG_HDMITX_PRD_IMP_EN		(0xf << 20)
-#define RG_HDMITX_DRV_EN		(0xf << 16)
-#define RG_HDMITX_DRV_IMP_EN		(0xf << 12)
+#define RG_HDMITX_SER_EN		GENMASK(31, 28)
+#define RG_HDMITX_PRD_EN		GENMASK(27, 24)
+#define RG_HDMITX_PRD_IMP_EN		GENMASK(23, 20)
+#define RG_HDMITX_DRV_EN		GENMASK(19, 16)
+#define RG_HDMITX_DRV_IMP_EN		GENMASK(15, 12)
 #define DRV_IMP_EN_SHIFT		12
 #define RG_HDMITX_MHLCK_FORCE		BIT(10)
 #define RG_HDMITX_MHLCK_PPIX_EN		BIT(9)
 #define RG_HDMITX_MHLCK_EN		BIT(8)
-#define RG_HDMITX_SER_DIN_SEL		(0xf << 4)
+#define RG_HDMITX_SER_DIN_SEL		GENMASK(7, 4)
 #define RG_HDMITX_SER_5T1_BIST_EN	BIT(3)
 #define RG_HDMITX_SER_BIST_TOG		BIT(2)
 #define RG_HDMITX_SER_DIN_TOG		BIT(1)
 #define RG_HDMITX_SER_CLKDIG_INV	BIT(0)
 #define HDMI_CON4		0x10
-#define RG_HDMITX_PRD_IBIAS_CLK		(0xf << 24)
-#define RG_HDMITX_PRD_IBIAS_D2		(0xf << 16)
-#define RG_HDMITX_PRD_IBIAS_D1		(0xf << 8)
-#define RG_HDMITX_PRD_IBIAS_D0		(0xf << 0)
+#define RG_HDMITX_PRD_IBIAS_CLK		GENMASK(27, 24)
+#define RG_HDMITX_PRD_IBIAS_D2		GENMASK(19, 16)
+#define RG_HDMITX_PRD_IBIAS_D1		GENMASK(11, 8)
+#define RG_HDMITX_PRD_IBIAS_D0		GENMASK(3, 0)
 #define PRD_IBIAS_CLK_SHIFT		24
 #define PRD_IBIAS_D2_SHIFT		16
 #define PRD_IBIAS_D1_SHIFT		8
 #define PRD_IBIAS_D0_SHIFT		0
 #define HDMI_CON5		0x14
-#define RG_HDMITX_DRV_IBIAS_CLK		(0x3f << 24)
-#define RG_HDMITX_DRV_IBIAS_D2		(0x3f << 16)
-#define RG_HDMITX_DRV_IBIAS_D1		(0x3f << 8)
-#define RG_HDMITX_DRV_IBIAS_D0		(0x3f << 0)
+#define RG_HDMITX_DRV_IBIAS_CLK		GENMASK(29, 24)
+#define RG_HDMITX_DRV_IBIAS_D2		GENMASK(21, 16)
+#define RG_HDMITX_DRV_IBIAS_D1		GENMASK(13, 8)
+#define RG_HDMITX_DRV_IBIAS_D0		GENMASK(5, 0)
 #define DRV_IBIAS_CLK_SHIFT		24
 #define DRV_IBIAS_D2_SHIFT		16
 #define DRV_IBIAS_D1_SHIFT		8
 #define DRV_IBIAS_D0_SHIFT		0
 #define HDMI_CON6		0x18
-#define RG_HDMITX_DRV_IMP_CLK		(0x3f << 24)
-#define RG_HDMITX_DRV_IMP_D2		(0x3f << 16)
-#define RG_HDMITX_DRV_IMP_D1		(0x3f << 8)
-#define RG_HDMITX_DRV_IMP_D0		(0x3f << 0)
+#define RG_HDMITX_DRV_IMP_CLK		GENMASK(29, 24)
+#define RG_HDMITX_DRV_IMP_D2		GENMASK(21, 16)
+#define RG_HDMITX_DRV_IMP_D1		GENMASK(13, 8)
+#define RG_HDMITX_DRV_IMP_D0		GENMASK(5, 0)
 #define DRV_IMP_CLK_SHIFT		24
 #define DRV_IMP_D2_SHIFT		16
 #define DRV_IMP_D1_SHIFT		8
 #define DRV_IMP_D0_SHIFT		0
 #define HDMI_CON7		0x1c
-#define RG_HDMITX_MHLCK_DRV_IBIAS	(0x1f << 27)
-#define RG_HDMITX_SER_DIN		(0x3ff << 16)
-#define RG_HDMITX_CHLDC_TST		(0xf << 12)
-#define RG_HDMITX_CHLCK_TST		(0xf << 8)
-#define RG_HDMITX_RESERVE		(0xff << 0)
+#define RG_HDMITX_MHLCK_DRV_IBIAS	GENMASK(31, 27)
+#define RG_HDMITX_SER_DIN		GENMASK(25, 16)
+#define RG_HDMITX_CHLDC_TST		GENMASK(15, 12)
+#define RG_HDMITX_CHLCK_TST		GENMASK(11, 8)
+#define RG_HDMITX_RESERVE		GENMASK(7, 0)
 #define HDMI_CON8		0x20
-#define RGS_HDMITX_2T1_LEV		(0xf << 16)
-#define RGS_HDMITX_2T1_EDG		(0xf << 12)
-#define RGS_HDMITX_5T1_LEV		(0xf << 8)
-#define RGS_HDMITX_5T1_EDG		(0xf << 4)
+#define RGS_HDMITX_2T1_LEV		GENMASK(19, 16)
+#define RGS_HDMITX_2T1_EDG		GENMASK(15, 12)
+#define RGS_HDMITX_5T1_LEV		GENMASK(11, 8)
+#define RGS_HDMITX_5T1_EDG		GENMASK(7, 4)
 #define RGS_HDMITX_PLUG_TST		BIT(0)
 
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
-- 
2.18.0

