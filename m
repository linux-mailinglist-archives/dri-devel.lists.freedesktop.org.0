Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE4629EFC2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 16:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4E06ECE8;
	Thu, 29 Oct 2020 15:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0626ECE8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 15:27:59 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 792CC2076B;
 Thu, 29 Oct 2020 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603985279;
 bh=h3+mUtrGjgFWVd51cekdL8zKtNdHp5fXFTRrikmF17Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xwuKwUx9pXdAS0iHuDICUdzYNGLUk5LOtcVQ3c43w0SIy6sLHJ/387gExFuIEtmDl
 xzRlGcWru8RQSMIy8GcvJ70Ey1cwAeNuZ6OkwaYTq0k8CfbLUVdTGEdYwMxqI3DU7x
 EZ3G5p1Ad8kLsBipdYDwSnM6lgDjJwj+BKEtt598=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver into
 drivers/phy/mediatek folder
Date: Thu, 29 Oct 2020 23:27:01 +0800
Message-Id: <20201029152702.533-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201029152702.533-1-chunkuang.hu@kernel.org>
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
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

mtk_mipi_dsi_phy is currently placed inside mediatek drm driver, but it's
more suitable to place a phy driver into phy driver folder, so move
mtk_mipi_dsi_phy driver into phy driver folder.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/Kconfig                           | 7 -------
 drivers/gpu/drm/mediatek/Makefile                          | 6 ------
 drivers/phy/mediatek/Kconfig                               | 7 +++++++
 drivers/phy/mediatek/Makefile                              | 5 +++++
 .../mediatek/phy-mtk-mipi-dsi-mt8173.c}                    | 2 +-
 .../mediatek/phy-mtk-mipi-dsi-mt8183.c}                    | 2 +-
 .../mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c}      | 2 +-
 .../mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h}      | 0
 8 files changed, 15 insertions(+), 16 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mt8173_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8173.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mt8183_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8183.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 24c4890a6e65..2976d21e9a34 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -28,10 +28,3 @@ config DRM_MEDIATEK_HDMI
 	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
-
-config PHY_MTK_MIPI_DSI
-	tristate "Mediatek MIPI-DSI-PHY Driver"
-	depends on ARCH_MEDIATEK && OF
-	select GENERIC_PHY
-	help
-	  Support MIPI DSI PHY for Mediatek SoCs.
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index baa188000543..a892edec5563 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -19,9 +19,3 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi_ddc.o
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
-
-phy-mtk-mipi-dsi-drv-objs := mtk_mipi_tx.o \
-			     mtk_mt8173_mipi_tx.o \
-			     mtk_mt8183_mipi_tx.o
-
-obj-$(CONFIG_PHY_MTK_MIPI_DSI) += phy-mtk-mipi-dsi-drv.o
diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 50c5e9306e19..574b8e6398d2 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -42,3 +42,10 @@ config PHY_MTK_HDMI
 	select GENERIC_PHY
 	help
 	  Support HDMI PHY for Mediatek SoCs.
+
+config PHY_MTK_MIPI_DSI
+	tristate "MediaTek MIPI-DSI Driver"
+	depends on ARCH_MEDIATEK && OF
+	select GENERIC_PHY
+	help
+	  Support MIPI DSI for Mediatek SoCs.
diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index 6325e38709ed..ace660fbed3a 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -11,3 +11,8 @@ phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
 phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt2701.o
 phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8173.o
 obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
+
+phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
+phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8173.o
+phy-mtk-mipi-dsi-drv-y			+= phy-mtk-mipi-dsi-mt8183.o
+obj-$(CONFIG_PHY_MTK_MIPI_DSI)		+= phy-mtk-mipi-dsi-drv.o
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_mipi_tx.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_mt8173_mipi_tx.c
rename to drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index f18db14d8b63..7a847954594f 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8173_mipi_tx.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -4,7 +4,7 @@
  * Author: jitao.shi <jitao.shi@mediatek.com>
  */
 
-#include "mtk_mipi_tx.h"
+#include "phy-mtk-mipi-dsi.h"
 
 #define MIPITX_DSI_CON		0x00
 #define RG_DSI_LDOCORE_EN		BIT(0)
diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
rename to drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 9f3e55aeebb2..99108426d57c 100644
--- a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -4,7 +4,7 @@
  * Author: jitao.shi <jitao.shi@mediatek.com>
  */
 
-#include "mtk_mipi_tx.h"
+#include "phy-mtk-mipi-dsi.h"
 
 #define MIPITX_LANE_CON		0x000c
 #define RG_DSI_CPHY_T1DRV_EN		BIT(0)
diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_mipi_tx.c
rename to drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index f2a892e16c27..18c481251f04 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
-#include "mtk_mipi_tx.h"
+#include "phy-mtk-mipi-dsi.h"
 
 inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw)
 {
diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_mipi_tx.h
rename to drivers/phy/mediatek/phy-mtk-mipi-dsi.h
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
