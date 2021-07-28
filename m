Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC0E3D8F2A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD98D6EA23;
	Wed, 28 Jul 2021 13:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39616EA23
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:32:52 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3AB42580B85;
 Wed, 28 Jul 2021 09:32:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 28 Jul 2021 09:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Y/RFajgQTdM2f
 0RaknpC8EEIRDdwxRYMg7nhQGMQRD8=; b=bkgBFNOESyrfQhfpKofvLRUMejBiU
 II0CIzryDOcoXFpKs+GON8rF5egyv3xmtgsvvvjqVJReEspZaNS/QfvfR/rL6rD6
 IGetJbj+RqlsZ4wSC/BFGQLVOS291XrhyRmBSCcLReJeJEllZJwT0mt2whojhcBl
 h5gTwXZCUTtKTCRLkNGmEJtJ4gZyK5qXhtNYbVkTmGk7hY9HZ+h1KFMEVu2bgb10
 Gca1oE1Dby0TFsunU6sndWpWJj+ZJQrX5ID4GEy+rOO82Z+qEk297MfRGLlVpDJm
 EK+WD2n0qoWAHg7Z37Hy64TP7adk+rhZi7kJpCU4cZFDRwcJc4IN+CXMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Y/RFajgQTdM2f0RaknpC8EEIRDdwxRYMg7nhQGMQRD8=; b=f4M3NRAn
 BMqW2UF9N9ZSx6wQOUUqLIVIxjzo5tsR6aX+beKJdtaG0lsRuxU7t5A0N5YYYM1B
 vT+CoOxAp1IJE/0JfRf4BWmXWXaAH8iFO9DLr5M9w1BX6oROhY+aziyikH+0LZpd
 +wLUCVU28/lFWRP/x9vMFqmAvosuI2QtuA5PIZGHgAASyK272o8lIBo6bc3NLZw3
 R+exokOYUjm9bbuRbLUq7Po2lP/PzWj6+06jLk/WO2bE1JgDFgxUguk04IISmwwZ
 AKM5cDyKmTxFQzfLynOZnXJzKfFXDosWM15QKqtUoBKn2IrecMb2lYkrawVC65r1
 uJyYENOl0LlQMA==
X-ME-Sender: <xms:hFwBYaUClrq_tPSqnI7PkgJCHZAlMxj8Hdr4zd1ahW4Hfiz4gskOZg>
 <xme:hFwBYWl6UQZHsz0hWJQNASFIIwPKueDHjUNsCjCor6rT3B-MdhRwD7MgjG_CVdv6e
 r-YZLd4-_UdDk7YToY>
X-ME-Received: <xmr:hFwBYebM18JC1PsPmZcoBvCEJB0f1jHFhyxq6oFgeisJPTk15SVAKyZL5azxiw64lU_wMBLALTUw4zNK_cPaNH_gDQ-63MQZ-7Q0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hFwBYRVO5HQcQj6ST1-qO7poM-6W3uNsJmEUGnZBKKxLXaUxSbumDA>
 <xmx:hFwBYUnh-1D72HzxKJ3dxiaqIUqMcNmDEIBCRCRSADOgrsW8L7Qqfw>
 <xmx:hFwBYWce2UX8vE3-QlsM7M4h5HmSJeOvlHDoWvyJoQj3iY6d_DlE_Q>
 <xmx:hFwBYSmdHxnDmHZqmHvsNXblFx1V3oAIxAIVjtAULvp3WGU8K8kEIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:32:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 6/8] drm/vc4: dsi: Switch to drm_of_get_bridge
Date: Wed, 28 Jul 2021 15:32:27 +0200
Message-Id: <20210728133229.2247965-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728133229.2247965-1-maxime@cerno.tech>
References: <20210728133229.2247965-1-maxime@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new drm_of_get_bridge removes most of the boilerplate we have to deal
with. Let's switch to it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

fixup! drm/vc4: dsi: Switch to drm_of_get_bridge
---
 drivers/gpu/drm/vc4/vc4_drv.c |  2 ++
 drivers/gpu/drm/vc4/vc4_dsi.c | 28 ++++------------------------
 2 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 73335feb712f..ff056ee8bc4b 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -25,7 +25,9 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 6dfcbd9e234e..3db03c95707f 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1489,7 +1489,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct vc4_dsi_encoder *vc4_dsi_encoder;
-	struct drm_panel *panel;
 	const struct of_device_id *match;
 	dma_cap_mask_t dma_mask;
 	int ret;
@@ -1601,27 +1600,9 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &dsi->bridge);
-	if (ret) {
-		/* If the bridge or panel pointed by dev->of_node is not
-		 * enabled, just return 0 here so that we don't prevent the DRM
-		 * dev from being registered. Of course that means the DSI
-		 * encoder won't be exposed, but that's not a problem since
-		 * nothing is connected to it.
-		 */
-		if (ret == -ENODEV)
-			return 0;
-
-		return ret;
-	}
-
-	if (panel) {
-		dsi->bridge = devm_drm_panel_bridge_add_typed(dev, panel,
-							      DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(dsi->bridge))
-			return PTR_ERR(dsi->bridge);
-	}
+	dsi->bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dsi->bridge))
+		return PTR_ERR(dsi->bridge);
 
 	/* The esc clock rate is supposed to always be 100Mhz. */
 	ret = clk_set_rate(dsi->escape_clock, 100 * 1000000);
@@ -1661,8 +1642,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
-	if (dsi->bridge)
-		pm_runtime_disable(dev);
+	pm_runtime_disable(dev);
 
 	/*
 	 * Restore the bridge_chain so the bridge detach procedure can happen
-- 
2.31.1

