Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0906457D0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AE110E398;
	Wed,  7 Dec 2022 10:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECCA10E392
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 10:27:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7830D5C00EF;
 Wed,  7 Dec 2022 05:27:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Dec 2022 05:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670408844; x=
 1670495244; bh=+wYLphAQDm0Qe9AV/NNK/4x7FAZwLgHWOx+tfp6bL30=; b=h
 FBRFs3+RDobnRgfUGch5JiYRWBqvHSiSTjcciv0Yum0NGqXJqPyP6Gv5ySdppQMt
 rwcjTk5dhsirA9ppK1OgVGqMkVlmW+9Gl/dzwNT2L9iFG96wPjTzYR7KWgdetPRM
 zDY1klfxuAa3IjceqtbWfE9xfQuGSwOa9iMTNsMd0+Y3PNCaw82TbnwouwesEiTg
 eMs/bces5MRlWR/lBtnsjveep/7yOOLlBHN+NNsEKYzMp5TXE5K+SSCGwWR/hz7e
 VpvWQV/TznMEkq93Y9rRShhPVIl10OhPIeuZC36CXJn4sFbQr0hE1IIg4vw7+62+
 sEo6ycnHOPqIIeOeP7LHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670408844; x=
 1670495244; bh=+wYLphAQDm0Qe9AV/NNK/4x7FAZwLgHWOx+tfp6bL30=; b=N
 ZNPQZOfNvlI+nArPW2oO6GQWl6FRZz98nAjQkrZJr6b3tJcHdrLLS7zM+3DbgEpS
 I+jMPTouALnc2LFjF2Bt/VpxWi1sINXwYv5HWFn4rDqb1h71/VRE3hBsJpoKN4ib
 eQn0NgkWSMshE/8G7jzL9VPC8v0MJ3YLl9u3YqbJxTYKJzfviG1/+unYbyFVcd0W
 H2T2hO56lsUOIAqCCC3AP5rDmBpeG8DQAhjG82zyZVA6bb0S8GEtQafsSJYTud9t
 fkKXKyde3ee+uRO8K0PefqObbs1M269uxcZA9eULCW/+8vQ1oWNzD+WV3mCz2Ef3
 tTiMuBjAEF8jOvZOxbTnA==
X-ME-Sender: <xms:jGqQYwpGh2v4e2DhTznVyxliqmu47ne90SZuf80dGrjiLHTrwqR_iw>
 <xme:jGqQY2rqs9YJHKgu4z4PEWFb0nCqFpzlUjbMBmCu3h_i5tJfqev3e6CopXvq4dNCB
 Z8UX44TTvsVf8iqGvE>
X-ME-Received: <xmr:jGqQY1NjTgynqaUq1wsUbvRh4kJpokxcQLOhM1GSvicQTnwlS8NUZrpTBQ8VR5VMN_Nf2aI6Qp2SEtpZogZ9nZduBvzQbOMO33PzheTg-jFhAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jGqQY35IBHrSwviQylXY6b5pYnrDx9VBujVsfTiYzXRR-Qk5-MPLEg>
 <xmx:jGqQY_7VXyGdNnrQigH8ACpSjmxnOBRU4BrPjynmLzuJMUmrnkPXTg>
 <xmx:jGqQY3jtHlueXvdiU52pxFw1a9GAU8ltybbCvBk3IKXA6OSAZxI58g>
 <xmx:jGqQY-R3SVPK6fS40DwfFZopjLz-0rWcoD--AXiy1NVilVzRJKWfyw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 05:27:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 11:22:48 +0100
Subject: [PATCH 5/6] drm/vc4: dsi: Convert to using a bridge instead of encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-dsi-bridge-v1-5-8f68ee0b0adb@cerno.tech>
References: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
In-Reply-To: <20221207-rpi-dsi-bridge-v1-0-8f68ee0b0adb@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=9201; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sS0nffUEMdzevHmlYA6fk8WS+z9I0/zZLGW2+XZSbos=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTMksPp3GJvHv16nLAl7VhC/672LSq/Z+rLigwP0JEs+/D
 +474jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExk62lGhu2/32zlSr7kvP7cyhCXpY
 FGQk7mFocfx3qzLlqd9q965zKG/441qToeHbPmSXtom9wS+LBay8Lhr+S5R7ZxdtWF+66LswIA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Remove the encoder functions, and create a bridge attached to
this dumb encoder which implements the same functionality.

As a bridge has state which an encoder doesn't, we need to
add the state management functions as well.

As there is no bridge atomic_mode_set, move the initialisation
code that was in mode_set into _pre_enable.
The code to actually enable and disable sending video are split
from the general control into _enable and _disable.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 121 +++++++++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index b90186f38749..a7b8ffd995b0 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -557,6 +557,7 @@ struct vc4_dsi {
 	struct platform_device *pdev;
 
 	struct drm_bridge *out_bridge;
+	struct drm_bridge bridge;
 
 	void __iomem *regs;
 
@@ -608,6 +609,12 @@ to_vc4_dsi(struct drm_encoder *encoder)
 	return container_of(encoder, struct vc4_dsi, encoder.base);
 }
 
+static inline struct vc4_dsi *
+bridge_to_vc4_dsi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct vc4_dsi, bridge);
+}
+
 static inline void
 dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 {
@@ -789,10 +796,21 @@ dsi_esc_timing(u32 ns)
 	return DIV_ROUND_UP(ns, ESC_TIME_NS);
 }
 
-static void vc4_dsi_encoder_disable(struct drm_encoder *encoder,
-				    struct drm_atomic_state *state)
+static void vc4_dsi_bridge_disable(struct drm_bridge *bridge,
+				   struct drm_bridge_state *state)
 {
-	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
+	u32 disp0_ctrl;
+
+	disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
+	disp0_ctrl &= ~DSI_DISP0_ENABLE;
+	DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
+}
+
+static void vc4_dsi_bridge_post_disable(struct drm_bridge *bridge,
+					struct drm_bridge_state *state)
+{
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	struct device *dev = &dsi->pdev->dev;
 
 	vc4_dsi_ulps(dsi, true);
@@ -817,11 +835,11 @@ static void vc4_dsi_encoder_disable(struct drm_encoder *encoder,
  * higher-than-expected clock rate to the panel, but that's what the
  * firmware does too.
  */
-static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
+static bool vc4_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
+				      const struct drm_display_mode *mode,
+				      struct drm_display_mode *adjusted_mode)
 {
-	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	struct clk *phy_parent = clk_get_parent(dsi->pll_phy_clock);
 	unsigned long parent_rate = clk_get_rate(phy_parent);
 	unsigned long pixel_clock_hz = mode->clock * 1000;
@@ -853,15 +871,18 @@ static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
 	return true;
 }
 
-static void vc4_dsi_encoder_mode_set(struct drm_encoder *encoder,
-				     struct drm_crtc_state *crtc_state,
-				     struct drm_connector_state *conn_state)
+static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_state)
 {
-	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
+	struct drm_atomic_state *state = old_state->base.state;
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
+	const struct drm_crtc_state *crtc_state;
 	struct device *dev = &dsi->pdev->dev;
 	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
 	bool debug_dump_regs = false;
 	unsigned long hs_clock;
+	struct drm_crtc *crtc;
 	u32 ui_ns;
 	/* Minimum LP state duration in escape clock cycles. */
 	u32 lpx = dsi_esc_timing(60);
@@ -882,6 +903,14 @@ static void vc4_dsi_encoder_mode_set(struct drm_encoder *encoder,
 		drm_print_regset32(&p, &dsi->regset);
 	}
 
+	/*
+	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
+	 * from the bridge to the encoder, to the connector and to the CRTC.
+	 */
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	mode = &crtc_state->adjusted_mode;
 
 	pixel_clock_hz = mode->clock * 1000;
@@ -1096,13 +1125,6 @@ static void vc4_dsi_encoder_mode_set(struct drm_encoder *encoder,
 		       ~DSI_PORT_BIT(PHY_AFEC0_RESET));
 
 	vc4_dsi_ulps(dsi, false);
-}
-
-static void vc4_dsi_encoder_enable(struct drm_encoder *encoder,
-				   struct drm_atomic_state *state)
-{
-	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
-	bool debug_dump_regs = false;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		DSI_PORT_WRITE(DISP0_CTRL,
@@ -1111,13 +1133,23 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder,
 			       VC4_SET_FIELD(dsi->format, DSI_DISP0_PFORMAT) |
 			       VC4_SET_FIELD(DSI_DISP0_LP_STOP_PERFRAME,
 					     DSI_DISP0_LP_STOP_CTRL) |
-			       DSI_DISP0_ST_END |
-			       DSI_DISP0_ENABLE);
+			       DSI_DISP0_ST_END);
 	} else {
 		DSI_PORT_WRITE(DISP0_CTRL,
-			       DSI_DISP0_COMMAND_MODE |
-			       DSI_DISP0_ENABLE);
+			       DSI_DISP0_COMMAND_MODE);
 	}
+}
+
+static void vc4_dsi_bridge_enable(struct drm_bridge *bridge,
+				  struct drm_bridge_state *old_state)
+{
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
+	bool debug_dump_regs = false;
+	u32 disp0_ctrl;
+
+	disp0_ctrl = DSI_PORT_READ(DISP0_CTRL);
+	disp0_ctrl |= DSI_DISP0_ENABLE;
+	DSI_PORT_WRITE(DISP0_CTRL, disp0_ctrl);
 
 	if (debug_dump_regs) {
 		struct drm_printer p = drm_info_printer(&dsi->pdev->dev);
@@ -1126,6 +1158,16 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder,
 	}
 }
 
+static int vc4_dsi_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
+
+	/* Attach the panel or bridge to the dsi bridge */
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge,
+				 &dsi->bridge, flags);
+}
+
 static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 				     const struct mipi_dsi_msg *msg)
 {
@@ -1302,6 +1344,7 @@ static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 			       struct mipi_dsi_device *device)
 {
 	struct vc4_dsi *dsi = host_to_dsi(host);
+	int ret;
 
 	dsi->lanes = device->lanes;
 	dsi->channel = device->channel;
@@ -1336,7 +1379,15 @@ static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 		return 0;
 	}
 
-	return component_add(&dsi->pdev->dev, &vc4_dsi_ops);
+	drm_bridge_add(&dsi->bridge);
+
+	ret = component_add(&dsi->pdev->dev, &vc4_dsi_ops);
+	if (ret) {
+		drm_bridge_remove(&dsi->bridge);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int vc4_dsi_host_detach(struct mipi_dsi_host *host,
@@ -1345,6 +1396,7 @@ static int vc4_dsi_host_detach(struct mipi_dsi_host *host,
 	struct vc4_dsi *dsi = host_to_dsi(host);
 
 	component_del(&dsi->pdev->dev, &vc4_dsi_ops);
+	drm_bridge_remove(&dsi->bridge);
 	return 0;
 }
 
@@ -1354,11 +1406,16 @@ static const struct mipi_dsi_host_ops vc4_dsi_host_ops = {
 	.transfer = vc4_dsi_host_transfer,
 };
 
-static const struct drm_encoder_helper_funcs vc4_dsi_encoder_helper_funcs = {
-	.atomic_disable = vc4_dsi_encoder_disable,
-	.atomic_enable = vc4_dsi_encoder_enable,
-	.mode_fixup = vc4_dsi_encoder_mode_fixup,
-	.atomic_mode_set = vc4_dsi_encoder_mode_set,
+static const struct drm_bridge_funcs vc4_dsi_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = vc4_dsi_bridge_pre_enable,
+	.atomic_enable = vc4_dsi_bridge_enable,
+	.atomic_disable = vc4_dsi_bridge_disable,
+	.atomic_post_disable = vc4_dsi_bridge_post_disable,
+	.attach = vc4_dsi_bridge_attach,
+	.mode_fixup = vc4_dsi_bridge_mode_fixup,
 };
 
 static int vc4_dsi_late_register(struct drm_encoder *encoder)
@@ -1733,13 +1790,11 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
-
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	ret = drm_bridge_attach(encoder, dsi->out_bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
 	if (ret)
 		return ret;
 
@@ -1761,7 +1816,11 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dsi);
 
 	kref_init(&dsi->kref);
+
 	dsi->pdev = pdev;
+	dsi->bridge.funcs = &vc4_dsi_bridge_funcs;
+	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 	dsi->dsi_host.ops = &vc4_dsi_host_ops;
 	dsi->dsi_host.dev = dev;
 	mipi_dsi_host_register(&dsi->dsi_host);

-- 
2.38.1
