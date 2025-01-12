Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F52A0A7DB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 10:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDB410E2F0;
	Sun, 12 Jan 2025 09:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="JIW7aYZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49213.qiye.163.com (mail-m49213.qiye.163.com
 [45.254.49.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E2910E2F7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 09:07:44 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 870092a3;
 Sun, 12 Jan 2025 17:07:40 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 2/6] phy: phy-rockchip-samsung-hdptx: Supplement some
 register names with their full version
Date: Sun, 12 Jan 2025 17:07:10 +0800
Message-Id: <20250112090714.1564158-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250112090714.1564158-1-damon.ding@rock-chips.com>
References: <20250112090714.1564158-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xMGFYaSkhIGB9CSh1DSxhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9459c4d94f03a3kunm870092a3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NQg6Hww6KjILAwNKPRgaIRIi
 HTBPCyJVSlVKTEhNTUxJQ01JSk9CVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSU5KNwY+
DKIM-Signature: a=rsa-sha256;
 b=JIW7aYZubryk6dp8N32zhxq+hs5ZBs/CgWIMBMayaY3tKkJpYGG97m9hDpctIGQsIunTnHsZabkFYEM0nmDqQRgnPhhy3jdkqzacS8c3ya576oMsg4ld3rzv1tEygtZUsY5oRr/6WSNu2jUZ8fLLnoRiLsu84khDxnSmob5lZHk=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=tywO7xGB2da8iEsHnvmYHdfB6wpe6ItXRYSerKfpSzc=;
 h=date:mime-version:subject:message-id:from;
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

Complete the register names of CMN_REG(0081) and CMN_REG(0087) to their
full version, and it can help to better match the datasheet.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index efbea5b67c89..423c61b7469f 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -82,14 +82,14 @@
 #define ROPLL_SSC_EN			BIT(0)
 /* CMN_REG(0081) */
 #define OVRD_PLL_CD_CLK_EN		BIT(8)
-#define PLL_CD_HSCLK_EAST_EN		BIT(0)
+#define ANA_PLL_CD_HSCLK_EAST_EN	BIT(0)
 /* CMN_REG(0086) */
 #define PLL_PCG_POSTDIV_SEL_MASK	GENMASK(7, 4)
 #define PLL_PCG_CLK_SEL_MASK		GENMASK(3, 1)
 #define PLL_PCG_CLK_EN			BIT(0)
 /* CMN_REG(0087) */
-#define PLL_FRL_MODE_EN			BIT(3)
-#define PLL_TX_HS_CLK_EN		BIT(2)
+#define ANA_PLL_FRL_MODE_EN		BIT(3)
+#define ANA_PLL_TX_HS_CLK_EN		BIT(2)
 /* CMN_REG(0089) */
 #define LCPLL_ALONE_MODE		BIT(1)
 /* CMN_REG(0097) */
-- 
2.34.1

