Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4B554D3B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7136113395;
	Wed, 22 Jun 2022 14:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C5A1126E0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:33:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 959333200094;
 Wed, 22 Jun 2022 10:33:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908432; x=1655994832; bh=Tq
 SRNxX/CXE6YHNgWBy/emrVBbgg4D++gPON80ZWQj4=; b=nU0f3oUPmgoSMZNr7T
 wUWkZfhdVDcxajJ+8uMjnbMlgjrtZ2N2pPtIEC2FKSLeiqK56Bo9fAzGDod4ul/A
 Iuy4ZANJCTZjBjYwFNtAveIwHt9XKL935h59HFj9VJmRIL/y9Moa6ZSS0cI8x6Jw
 eyIWdyzTaY3WZK4XMuot+9bpp3cw7IvDJtZfjy5eHv4B4OTaXMrUjfcQbXDWJMaK
 9qkaHVObGiypf2fkzR4+/aKgWme4w6uH0LpFT/HZdzewTdhBWjSN7MoyvEcF+HxE
 dI9SGfrNj+LyJECtHUxQ6PVy7mb4BF0GpTMjj/6VXLQXSrS9ZceANVTUpnlqii4H
 JEag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908432; x=1655994832; bh=TqSRNxX/CXE6Y
 HNgWBy/emrVBbgg4D++gPON80ZWQj4=; b=u+FVsSAD4WGwcUmgsULT7UWpU10Jx
 5HB0T0FFpIawpYGDr2AIMSE+RC/2TQmQCF+5G+dqZx2wSY2OT0lZVFw0EXmeCNm1
 o01moKnRrb826TUurYLJShoOhdSKuUwATw+m8hzZks4MrfXXv9EFRW+mpiqurxUZ
 9ssDkLPCTy7kiN+sL9yIWDDbe8JTr5ev4dsSQU/V0xEkDvhY0nwhmwYznnyvOWym
 5g9MGXInWJlUMHPsTclYMDqpjJ3NGlpy2rWv5Uq/zLPExO/tURdj7MWY6ab9wzUf
 Ioe+T7nR3ZEC31C4rJ8PlJMkqyHONMaj3OAI4r/7UDkE5dy3uwtmkbp8Q==
X-ME-Sender: <xms:TyizYpeX0xihDOwOkI7t5B5hZrdxZWU1qnXC6wXc2DlgF2n5LMnf7g>
 <xme:TyizYnNRc6VT1kkxVRvcT9McAb1Xj0LYXxUZ_lFQd4jq6V3u3ZdPV1TALbhKqLsy_
 o9rLWpdnJeURix81aY>
X-ME-Received: <xmr:TyizYihYq9Q8TUmZ6FP1p6lG2wQXI1ucHUHSiPs7fF_onAHLQUc442_JkwJjsZlj6zJ2FsDjhnpg2vKU_cb-3POWkZCobVR-s23A4fY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TyizYi_l67eyak4WjKpgczWBnWlLWLeKQmSGOD6Jb-ref01Gm1PLyA>
 <xmx:TyizYluT8IScWTuICvNHjkV0-z5GLNXHUHsRE18tk-vghHzJviN3TQ>
 <xmx:TyizYhEcnQEt6hua-RWA1EqrJUmb8y0XNoxIAe3y2pKktiC1AXV3qQ>
 <xmx:UCizYvLOLs1nubbJ7zWenptflkEJCtzDVZnTQw7u4W67ROzn3rGupg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:33:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 31/68] drm/vc4: dsi: Embed DRM structures into the private
 structure
Date: Wed, 22 Jun 2022 16:31:32 +0200
Message-Id: <20220622143209.600298-32-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VC4 DSI driver private structure contains only a pointer to the
encoder it implements. This makes the overall structure somewhat
inconsistent with the rest of the driver, and complicates its
initialisation without any apparent gain.

Let's embed the drm_encoder structure (through the vc4_encoder one) into
struct vc4_dsi to fix both issues.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 58 +++++++++++++----------------------
 1 file changed, 22 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 98308a17e4ed..dbb3f6fb39b4 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -507,10 +507,11 @@ struct vc4_dsi_variant {
 
 /* General DSI hardware state. */
 struct vc4_dsi {
-	struct platform_device *pdev;
-
+	struct vc4_encoder encoder;
 	struct mipi_dsi_host dsi_host;
-	struct drm_encoder *encoder;
+
+	struct platform_device *pdev;
+
 	struct drm_bridge *bridge;
 	struct list_head bridge_chain;
 
@@ -558,6 +559,12 @@ struct vc4_dsi {
 
 #define host_to_dsi(host) container_of(host, struct vc4_dsi, dsi_host)
 
+static inline struct vc4_dsi *
+to_vc4_dsi(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct vc4_dsi, encoder.base);
+}
+
 static inline void
 dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 {
@@ -602,18 +609,6 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 	DSI_WRITE(dsi->variant->port ? DSI1_##offset : DSI0_##offset, val)
 #define DSI_PORT_BIT(bit) (dsi->variant->port ? DSI1_##bit : DSI0_##bit)
 
-/* VC4 DSI encoder KMS struct */
-struct vc4_dsi_encoder {
-	struct vc4_encoder base;
-	struct vc4_dsi *dsi;
-};
-
-static inline struct vc4_dsi_encoder *
-to_vc4_dsi_encoder(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_dsi_encoder, base.base);
-}
-
 static const struct debugfs_reg32 dsi0_regs[] = {
 	VC4_REG32(DSI0_CTRL),
 	VC4_REG32(DSI0_STAT),
@@ -753,8 +748,7 @@ dsi_esc_timing(u32 ns)
 
 static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
 {
-	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
-	struct vc4_dsi *dsi = vc4_encoder->dsi;
+	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct device *dev = &dsi->pdev->dev;
 	struct drm_bridge *iter;
 
@@ -794,8 +788,7 @@ static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
 				       const struct drm_display_mode *mode,
 				       struct drm_display_mode *adjusted_mode)
 {
-	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
-	struct vc4_dsi *dsi = vc4_encoder->dsi;
+	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct clk *phy_parent = clk_get_parent(dsi->pll_phy_clock);
 	unsigned long parent_rate = clk_get_rate(phy_parent);
 	unsigned long pixel_clock_hz = mode->clock * 1000;
@@ -832,8 +825,7 @@ static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
 static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
-	struct vc4_dsi *dsi = vc4_encoder->dsi;
+	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 	struct device *dev = &dsi->pdev->dev;
 	bool debug_dump_regs = false;
 	struct drm_bridge *iter;
@@ -1492,21 +1484,14 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
-	struct vc4_dsi_encoder *vc4_dsi_encoder;
+	struct drm_encoder *encoder = &dsi->encoder.base;
 	dma_cap_mask_t dma_mask;
 	int ret;
 
 	dsi->variant = of_device_get_match_data(dev);
 
-	vc4_dsi_encoder = devm_kzalloc(dev, sizeof(*vc4_dsi_encoder),
-				       GFP_KERNEL);
-	if (!vc4_dsi_encoder)
-		return -ENOMEM;
-
 	INIT_LIST_HEAD(&dsi->bridge_chain);
-	vc4_dsi_encoder->base.type = VC4_ENCODER_TYPE_DSI1;
-	vc4_dsi_encoder->dsi = dsi;
-	dsi->encoder = &vc4_dsi_encoder->base.base;
+	dsi->encoder.type = VC4_ENCODER_TYPE_DSI1;
 
 	dsi->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(dsi->regs))
@@ -1614,10 +1599,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, dsi->encoder, DRM_MODE_ENCODER_DSI);
-	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
+	drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
 
-	ret = drm_bridge_attach(dsi->encoder, dsi->bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
 	if (ret)
 		return ret;
 	/* Disable the atomic helper calls into the bridge.  We
@@ -1625,7 +1610,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	 * from our driver, since we need to sequence them within the
 	 * encoder's enable/disable paths.
 	 */
-	list_splice_init(&dsi->encoder->bridge_chain, &dsi->bridge_chain);
+	list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 
 	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
 
@@ -1638,6 +1623,7 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_encoder *encoder = &dsi->encoder.base;
 
 	pm_runtime_disable(dev);
 
@@ -1645,8 +1631,8 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
 	 * Restore the bridge_chain so the bridge detach procedure can happen
 	 * normally.
 	 */
-	list_splice_init(&dsi->bridge_chain, &dsi->encoder->bridge_chain);
-	drm_encoder_cleanup(dsi->encoder);
+	list_splice_init(&dsi->bridge_chain, &encoder->bridge_chain);
+	drm_encoder_cleanup(encoder);
 }
 
 static const struct component_ops vc4_dsi_ops = {
-- 
2.36.1

