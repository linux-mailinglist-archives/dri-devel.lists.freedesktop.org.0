Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC66A406CB4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 15:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405786EA00;
	Fri, 10 Sep 2021 13:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEB06E9F8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 13:09:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id B10742B012ED;
 Fri, 10 Sep 2021 09:09:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Sep 2021 09:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=FtHZI078C/VgC
 ILuM5ySV9+sM4uUlGpEEk7Loo+/Zdk=; b=UifnRQ+COqKdGQV08a2PaP9qrrBF9
 1Uj1q1D1iC29OWLCaCuYVMbPHr1J+rxMz+MyYeYrdksX4P82djOX6iXb7LTK2dfb
 FWfwq5AN5zPI1B+xQvg1+Bn+xwfcX3ay3VikQBmnvvEER1mQKUC9wW6W1sLuhSBg
 aOcwvub4WyyHvAeejBxuf57VfpeP77nG3LGShkV20/J4hSzEBnl8gcc/vZgyIAch
 gERF5nBpt8H/sdwkFtrNkIRQUqbq3RLYkEYlIpp0vyII75vRnRh8wGvPdFDQlxCk
 lheamJG716I+eXJhzzCeDIdS0PPc6xiwI8f0U1zDhhNJH+4xCsOUui3vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=FtHZI078C/VgCILuM5ySV9+sM4uUlGpEEk7Loo+/Zdk=; b=M9bl17Y3
 XGNLR2TVPfnoqSHUIkv1Ok4Ap2NoivacGj2OlJFuPwRK9MIAZIF3csVdLED57jvp
 Vn7F7YSqTctCOTD87MxkxRQAkGsfjVv/oqfR1lAHFPybQdX0rwGnou9c0JuwnFRg
 /2cGjG9ZwwOQRawsZMg4mWMwVFh+OtL75KAK6FJjnjyXZ83SyFqDH6rs6+A/QelX
 fsXxPwcNst0A/WAteVZJ7fVSO51A5RLNKaEH3iw5pBWilXa1NtPJy22UEY79JCiy
 04SoxwijiAaHhnrqjNyUaBwcWdLW+Gmkz5AT9OYk7G/8GLlCymkDBpdscrKe8rfR
 YGo6luX5tfiSHA==
X-ME-Sender: <xms:Jlk7YWRgPFoX_GlT_J1MOYijp8HMiNYO2skC-KejkreRcNQJkY4f0A>
 <xme:Jlk7Ybz-dIbl7F50Ge5oFFYzuGoi4VDN9_Utqg2r4Vv-EDdeptBZa3ZmWhiwRf7rG
 pxgXMpVid0YwegxPxM>
X-ME-Received: <xmr:Jlk7YT22XTEA_w5aIgcnrO9cwdLrf_BkdDM0GSnF-WX5TcEphvx_x3XP03JwZmAP6h4nJ4D5JOnGvWWPWa7c_a-zDOpv1UyVTvV_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Jlk7YSDSwGE22hnspw0j_lbYj1sL60i_5oZrfFmg7QGhltAiR_N0Pw>
 <xmx:Jlk7Yfj7pY12WK3_IUREMyrxyl0W_cTjt3mcO9ifzE4VzJpq2hdfuA>
 <xmx:Jlk7Yeq0k0kaEDz5chbwD1C8REM_iY0t3q5U5Dk6FflTeZeA7amw8Q>
 <xmx:Jlk7YUZ84__us1vVxqCcZ6yuToznOQha3DhfDLvbOLFoQtp2ZQp87KXlHLE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 09:09:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/vc4: dsi: Switch to devm_drm_of_get_bridge
Date: Fri, 10 Sep 2021 15:09:41 +0200
Message-Id: <20210910130941.1740182-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910130941.1740182-1-maxime@cerno.tech>
References: <20210910130941.1740182-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new devm_drm_of_get_bridge removes most of the boilerplate we
have to deal with. Let's switch to it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c |  2 ++
 drivers/gpu/drm/vc4/vc4_dsi.c | 28 ++++------------------------
 2 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 16abc3a3d601..96c526f1022e 100644
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
index a185027911ce..a229da58962a 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1497,7 +1497,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 	struct vc4_dsi_encoder *vc4_dsi_encoder;
-	struct drm_panel *panel;
 	const struct of_device_id *match;
 	dma_cap_mask_t dma_mask;
 	int ret;
@@ -1609,27 +1608,9 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
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
@@ -1667,8 +1648,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
-	if (dsi->bridge)
-		pm_runtime_disable(dev);
+	pm_runtime_disable(dev);
 
 	/*
 	 * Restore the bridge_chain so the bridge detach procedure can happen
-- 
2.31.1

