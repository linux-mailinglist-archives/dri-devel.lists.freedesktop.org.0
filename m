Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15BA5BE13A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCE110E497;
	Tue, 20 Sep 2022 09:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C8010E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:01:50 +0000 (UTC)
X-UUID: 422a5700b4d649e795b1b0b6e54663d4-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oD+Udm6jbro+HWMaZx++gezk561ohL6Fw5km/9fQXk8=; 
 b=q/wdKcz8EDeAowLm1YnAYbEbJgZoN81qHihtXvXYEFh2teEvqF6d+ENfgPXp8csLaceTKsYcr8lFZvnzSewuZbiOrr8s5M0l1iScJnHncy8m8TK+tTp16KH1ZfRzeefp3TBthOk2yz8GoAh3BmwYFjrPpMOf6EfgrGuhOk0AYeU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:c66ddc10-8613-47cd-9ea9-40867569bdaf, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:96f403f7-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 422a5700b4d649e795b1b0b6e54663d4-20220920
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 388253206; Tue, 20 Sep 2022 17:01:48 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:52 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 16/18] phy: mediatek: mipi: mt8183: use GENMASK to generate
 bits mask
Date: Tue, 20 Sep 2022 17:00:36 +0800
Message-ID: <20220920090038.15133-17-chunfeng.yun@mediatek.com>
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
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 99108426d57c..1ec71ba2407e 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -18,7 +18,7 @@
 #define RG_DSI_PAD_TIEL_SEL		BIT(8)
 
 #define MIPITX_VOLTAGE_SEL	0x0010
-#define RG_DSI_HSTX_LDO_REF_SEL		(0xf << 6)
+#define RG_DSI_HSTX_LDO_REF_SEL		GENMASK(9, 6)
 
 #define MIPITX_PLL_PWR		0x0028
 #define MIPITX_PLL_CON0		0x002c
@@ -26,7 +26,7 @@
 #define MIPITX_PLL_CON2		0x0034
 #define MIPITX_PLL_CON3		0x0038
 #define MIPITX_PLL_CON4		0x003c
-#define RG_DSI_PLL_IBIAS		(3 << 10)
+#define RG_DSI_PLL_IBIAS		GENMASK(11, 10)
 
 #define MIPITX_D2P_RTCODE	0x0100
 #define MIPITX_D2_SW_CTL_EN	0x0144
@@ -41,7 +41,7 @@
 #define AD_DSI_PLL_SDM_ISO_EN		BIT(1)
 
 #define RG_DSI_PLL_EN			BIT(4)
-#define RG_DSI_PLL_POSDIV		(0x7 << 8)
+#define RG_DSI_PLL_POSDIV		GENMASK(10, 8)
 
 static int mtk_mipi_tx_pll_enable(struct clk_hw *hw)
 {
-- 
2.18.0

