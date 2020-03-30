Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C2E197E07
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 16:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94656E3CB;
	Mon, 30 Mar 2020 14:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81CD6E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 14:12:36 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9682920842;
 Mon, 30 Mar 2020 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585577556;
 bh=LMgKTiMXsLLMrmXVZ091bFAZrp+yhoV6qstjfE/5HIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f26nLpQO479xcjUWfODTZQ3pj/cgQhrly9qQ4S1lHBd+9lt54XO+5dhZ5VmzSwbF0
 lNDIucwCPEeF4vOLehUS09Uc9dY4qzJZasiYZm62Jne/zdZycYVbguCxWyr3xI+pAY
 VQ/RDzzOuM/NsVfog/PLZqZs9D7RPVLWwCBoFrQs=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v2 3/4] drm/mediatek: Move mtk_hdmi_phy driver into
 drivers/phy/mediatek folder
Date: Mon, 30 Mar 2020 22:12:21 +0800
Message-Id: <20200330141222.17529-4-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330141222.17529-1-chunkuang.hu@kernel.org>
References: <20200330141222.17529-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CK Hu <ck.hu@mediatek.com>

mtk_hdmi_phy is currently placed inside mediatek drm driver, but it's
more suitable to place a phy driver into phy driver folder, so move
mtk_hdmi_phy driver into phy driver folder.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/Kconfig                           | 7 -------
 drivers/gpu/drm/mediatek/Makefile                          | 6 ------
 drivers/phy/mediatek/Kconfig                               | 7 +++++++
 drivers/phy/mediatek/Makefile                              | 7 +++++++
 .../mediatek/phy-mtk-hdmi-mt2701.c}                        | 2 +-
 .../mediatek/phy-mtk-hdmi-mt8173.c}                        | 2 +-
 .../mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c}         | 2 +-
 .../mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h}         | 0
 8 files changed, 17 insertions(+), 16 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index ff6a1eb4ae83..2427d5bf699d 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -26,10 +26,3 @@ config DRM_MEDIATEK_HDMI
 	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
-
-config PHY_MTK_HDMI
-    tristate "MediaTek HDMI-PHY Driver"
-    depends on ARCH_MEDIATEK && OF
-    select GENERIC_PHY
-    help
-          Enable this to support HDMI-PHY
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index fcbef23aa6ce..77b0fd86063d 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -22,9 +22,3 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
-
-phy-mtk-hdmi-drv-objs := mtk_hdmi_phy.o \
-			 mtk_mt2701_hdmi_phy.o \
-			 mtk_mt8173_hdmi_phy.o
-
-obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index dee757c957f2..10f0ec2d5b54 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -35,3 +35,10 @@ config PHY_MTK_XSPHY
 	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
 	  USB3.1 GEN2 controllers on MediaTek chips. The driver supports
 	  multiple USB2.0, USB3.1 GEN2 ports.
+
+config PHY_MTK_HDMI
+    tristate "MediaTek HDMI-PHY Driver"
+    depends on ARCH_MEDIATEK && OF
+    select GENERIC_PHY
+    help
+          Enable this to support HDMI-PHY
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index 08a8e6a97b1e..cda074c53235 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -6,3 +6,10 @@
 obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
 obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
 obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
+
+phy-mtk-hdmi-drv-objs := phy-mtk-hdmi.o \
+			 phy-mtk-hdmi-mt2701.o \
+			 phy-mtk-hdmi-mt8173.o
+
+obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
+
diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
rename to drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index 99fe05cd3598..a6cb1dea3d0c 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -4,7 +4,7 @@
  * Author: Chunhui Dai <chunhui.dai@mediatek.com>
  */
 
-#include "mtk_hdmi_phy.h"
+#include "phy-mtk-hdmi.h"
 
 #define HDMI_CON0	0x00
 #define RG_HDMITX_DRV_IBIAS		0
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
rename to drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index b55f51675205..3521c4893c53 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -4,7 +4,7 @@
  * Author: Jie Qiu <jie.qiu@mediatek.com>
  */
 
-#include "mtk_hdmi_phy.h"
+#include "phy-mtk-hdmi.h"
 
 #define HDMI_CON0		0x00
 #define RG_HDMITX_PLL_EN		BIT(31)
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
rename to drivers/phy/mediatek/phy-mtk-hdmi.c
index fe022acddbef..8fc83f01a720 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -4,7 +4,7 @@
  * Author: Jie Qiu <jie.qiu@mediatek.com>
  */
 
-#include "mtk_hdmi_phy.h"
+#include "phy-mtk-hdmi.h"
 
 static int mtk_hdmi_phy_power_on(struct phy *phy);
 static int mtk_hdmi_phy_power_off(struct phy *phy);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
rename to drivers/phy/mediatek/phy-mtk-hdmi.h
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
