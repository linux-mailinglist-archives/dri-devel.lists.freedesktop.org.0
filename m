Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885433CFB0A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FE66E328;
	Tue, 20 Jul 2021 13:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388916E328
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:46:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id B8ABF2B000FA;
 Tue, 20 Jul 2021 09:46:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 20 Jul 2021 09:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/nJufUMnp88VZ
 Vd3czIYa6D3EC6WnnQ6c7BA6KgXV7Y=; b=aMvqStTXWSlDNDdbIa0UPHH7qrn5P
 dRLMKxmVYSLc/PtVY2OLYCLkxc3bfkkjHvkpoTXCPIHXoy2vKeAWjYJnCObWCDpz
 /9LfEHAP1IttUKYECwZsnyTNl1qN+skB/O8+pXBzEflGCephCkLPr4Vz230f/n9G
 u1QRARL2FFWYuVcTBS5SQZnD3DHCpBh5wyhsJvhIVh4hvOE3XX/5m5ytgSbw0BQE
 fQOpLsQBUUKArpY/iD9eF74+AydNMf8mxgz8N1JbUz2I7udZwCbITC810HLVzA8F
 jwCuoY3rPqusrjWYX0a332dHmiiOPdrsE/+2/6SkDu0vYgznEUJxv0hmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/nJufUMnp88VZVd3czIYa6D3EC6WnnQ6c7BA6KgXV7Y=; b=FEp2SJGr
 2Bq/SQF8U3ROqm5OdZ78XR11EzJgVR2ZCR5VhJrjX92yAASZQJ5D1nu3jsuck+VD
 Xj5/GvmHyisCAc6M2lFr/Kl9rUg3E10+5ZA2opblHiP6Dy7IeY6D9AjsaK8SQYz3
 orMNecvj8prD7fJjdFPZowKLlcs37u+X74qxwBiS2Wn+ZNqmRLipkXxR/am1hZ93
 RJ0CRTxfNAsqhDT7XixJr27kdALbhHB7q/aSq2ckY4SzOyIqL3Vx3NI3IpvU58WI
 Nlo2iuhqQKgTLD73Dh9zlzlRgUBVHQbBmEcR7w6TKaNxaxOrcdPy8e2lRfdziErk
 M90Yw9Ow7PiX3g==
X-ME-Sender: <xms:mdP2YLNY1lQKjBNFaDHtmnpWXCoUJKdOoXBQHXFXQlK43f383otXig>
 <xme:mdP2YF-y7vmRM3MeVMsrDXnTzkz1Ik0xXM6JdcD_xXQZpzIZpeQbl8WMNEZI46skF
 zy49dqp35f9XhIh1w0>
X-ME-Received: <xmr:mdP2YKSk16egtl1MYkREjvNj8L47szr2cy7lp5NRRjxVqCx83dzBiMtMCn7b4hr74AvZMs1iCS93vRQCsNyTSFl9K3Hsf7Q4lX80>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mdP2YPvdz3gxf4PirqUw85eibSPlGlPEAytfIkc8HFr5cMz-ddcU3w>
 <xmx:mdP2YDfKmLur3vX5xsdWP_WzLTzHKWH-zMvuxzKCf0YiRN-3fe4zRg>
 <xmx:mdP2YL0fVsO60T-HqyuSCngruCTJhciWrBmb7yemb11qDQZ8K88h3A>
 <xmx:mdP2YO8i9bVepAM91zmuESR5Tm6znN3KCYf-N6tTdJzIuzD3w2twjtm9BOc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:46:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 07/10] drm/vc4: dsi: Switch to drm_of_get_next
Date: Tue, 20 Jul 2021 15:45:22 +0200
Message-Id: <20210720134525.563936-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720134525.563936-1-maxime@cerno.tech>
References: <20210720134525.563936-1-maxime@cerno.tech>
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

The new drm_of_get_next removes most of the boilerplate we have to deal
with. Let's switch to it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
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
index 6dfcbd9e234e..f51ce8db0f4e 100644
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
+	dsi->bridge = devm_drm_of_get_next(dev, dev->of_node, 0, 0);
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

