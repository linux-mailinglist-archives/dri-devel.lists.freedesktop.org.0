Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52426BE35F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0383910EE94;
	Fri, 17 Mar 2023 08:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1E910EE97
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:23:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDF4F6223A;
 Fri, 17 Mar 2023 08:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3AEC433A0;
 Fri, 17 Mar 2023 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041433;
 bh=ok0j9ISAJdgCP3cxdqxCuQtsbBTIBD8uq8kYJDLeLlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wf4WNk2z6Cs+Ut5ipokBOtyNqRyMdQYzuDp6IJy3neIagKzefvfGjmGE0ZUm3ydt4
 JoZ4J9umpVgdxT5g66M9CMphDih/HDxxTCC1ILisDgjqzv7RcEhhi2Cs8AfZTcqVh6
 gHtERvl2mK9emMQloOTrY/bIxVSgMbWj9/xiSFNXN+N4txGsY43/07YElbKgoAJNjZ
 GPIc+vs+BIpNS0gQbfJV7b3q1PdtJW9NAiRfvrWushCGPE1VBDcmVwYTlP4qn/CSe6
 PAjRezZ9q3x7KVQV76+3FV5mJHQOIf1A0dNNKhdVC+kicPPcmXzNeuuhOOf0+AFNoQ
 wpbCrW+/lXgoQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 37/37] drm/bridge/imx/Kconfig: Prevent imx-ldb-helper from
 appearing in 2 separate modules
Date: Fri, 17 Mar 2023 08:17:18 +0000
Message-Id: <20230317081718.2650744-38-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 scripts/Makefile.build:252: drivers/gpu/drm/bridge/imx/Makefile: imx-ldb-helper.o is added to multiple modules: imx8qm-ldb imx8qxp-ldb

Cc: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/bridge/imx/Kconfig          |  7 +++++++
 drivers/gpu/drm/bridge/imx/Makefile         |  7 +++++--
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 13 +++++++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 608f47f41bcd1..97018dcd078d0 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -1,10 +1,16 @@
 if ARCH_MXC || COMPILE_TEST
 
+config DRM_IMX8_LIB
+	tristate
+	help
+	  Common helper functions used by some of the drivers below.
+
 config DRM_IMX8QM_LDB
 	tristate "Freescale i.MX8QM LVDS display bridge"
 	depends on OF
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
+	select DRM_IMX8_LIB
 	help
 	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
 	  Freescale i.MX8qm processor.  Official name of LDB is pixel mapper.
@@ -14,6 +20,7 @@ config DRM_IMX8QXP_LDB
 	depends on OF
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
+	select DRM_IMX8_LIB
 	help
 	  Choose this to enable the internal LVDS Display Bridge(LDB) found in
 	  Freescale i.MX8qxp processor.  Official name of LDB is pixel mapper.
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index aa90ec8d54336..e1146b0347014 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,7 +1,10 @@
-imx8qm-ldb-objs := imx-ldb-helper.o imx8qm-ldb-drv.o
+imx-ldb-lib-objs := imx-ldb-helper.o
+obj-$(CONFIG_DRM_IMX8_LIB) += imx-ldb-lib.o
+
+imx8qm-ldb-objs := imx8qm-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
 
-imx8qxp-ldb-objs := imx-ldb-helper.o imx8qxp-ldb-drv.o
+imx8qxp-ldb-objs := imx8qxp-ldb-drv.o
 obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
 
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 7338b84bc83d2..4cd570947b093 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -19,12 +19,14 @@ bool ldb_channel_is_single_link(struct ldb_channel *ldb_ch)
 {
 	return ldb_ch->link_type == LDB_CH_SINGLE_LINK;
 }
+EXPORT_SYMBOL_GPL(ldb_channel_is_single_link);
 
 bool ldb_channel_is_split_link(struct ldb_channel *ldb_ch)
 {
 	return ldb_ch->link_type == LDB_CH_DUAL_LINK_EVEN_ODD_PIXELS ||
 	       ldb_ch->link_type == LDB_CH_DUAL_LINK_ODD_EVEN_PIXELS;
 }
+EXPORT_SYMBOL_GPL(ldb_channel_is_split_link);
 
 int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
 				   struct drm_bridge_state *bridge_state,
@@ -38,6 +40,7 @@ int ldb_bridge_atomic_check_helper(struct drm_bridge *bridge,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_atomic_check_helper);
 
 void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
 				const struct drm_display_mode *mode,
@@ -69,6 +72,7 @@ void ldb_bridge_mode_set_helper(struct drm_bridge *bridge,
 		break;
 	}
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_mode_set_helper);
 
 void ldb_bridge_enable_helper(struct drm_bridge *bridge)
 {
@@ -81,6 +85,7 @@ void ldb_bridge_enable_helper(struct drm_bridge *bridge)
 	 */
 	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_enable_helper);
 
 void ldb_bridge_disable_helper(struct drm_bridge *bridge)
 {
@@ -95,6 +100,7 @@ void ldb_bridge_disable_helper(struct drm_bridge *bridge)
 
 	regmap_write(ldb->regmap, ldb->ctrl_reg, ldb->ldb_ctrl);
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_disable_helper);
 
 int ldb_bridge_attach_helper(struct drm_bridge *bridge,
 			     enum drm_bridge_attach_flags flags)
@@ -117,6 +123,7 @@ int ldb_bridge_attach_helper(struct drm_bridge *bridge,
 				ldb_ch->next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
+EXPORT_SYMBOL_GPL(ldb_bridge_attach_helper);
 
 int ldb_init_helper(struct ldb *ldb)
 {
@@ -157,6 +164,7 @@ int ldb_init_helper(struct ldb *ldb)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ldb_init_helper);
 
 int ldb_find_next_bridge_helper(struct ldb *ldb)
 {
@@ -184,6 +192,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ldb_find_next_bridge_helper);
 
 void ldb_add_bridge_helper(struct ldb *ldb,
 			   const struct drm_bridge_funcs *bridge_funcs)
@@ -204,6 +213,7 @@ void ldb_add_bridge_helper(struct ldb *ldb,
 		drm_bridge_add(&ldb_ch->bridge);
 	}
 }
+EXPORT_SYMBOL_GPL(ldb_add_bridge_helper);
 
 void ldb_remove_bridge_helper(struct ldb *ldb)
 {
@@ -219,3 +229,6 @@ void ldb_remove_bridge_helper(struct ldb *ldb)
 		drm_bridge_remove(&ldb_ch->bridge);
 	}
 }
+EXPORT_SYMBOL_GPL(ldb_remove_bridge_helper);
+
+MODULE_LICENSE("GPL v2");
-- 
2.40.0.rc1.284.g88254d51c5-goog

