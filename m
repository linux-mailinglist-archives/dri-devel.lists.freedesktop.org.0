Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1281D546238
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4A311B284;
	Fri, 10 Jun 2022 09:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAC711B284
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:20 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E7005C01B7;
 Fri, 10 Jun 2022 05:30:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 10 Jun 2022 05:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853420; x=1654939820; bh=Tq
 SRNxX/CXE6YHNgWBy/emrVBbgg4D++gPON80ZWQj4=; b=L73SaoDkJcSFULPmGc
 RgqvmHBBZD0dIgILDlIP10WFAsHfk5OXKKtO91eyo6glXyffj8LnaXNRW8CS91mV
 yxqE6njDRv7gGbtFbdwviNaUhukvpOzkAg8XsTw23rr2BMMH+FurXBNO7p0pC7sg
 F/MjAfXDSiiIZnl2FRW6/JtymwMTUue3ILaYXU5Rmjh5bhqLgmloSazH3mUhcfJi
 s8xqtubw5ARHKOV2Tzid/z0WYlTXnwXxLyj0j4+Yv6HDWDYuAgFtR0tvSpYzYvU0
 2zs2D+NGaHEH+ydvu23j+cP1zKSduHbqwyQ0vs76xyQoGHOAcqWbLoxyjFNA8DM+
 f3Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853420; x=1654939820; bh=TqSRNxX/CXE6Y
 HNgWBy/emrVBbgg4D++gPON80ZWQj4=; b=p8ZTu+BBO6MAo/nT94c1HUFiG9hoJ
 +X+aRhR/a/fnQlmLNrXMdvOgF86ZnxTw7g42EeharFn7SGvzv2Eht4So0ueH3yNj
 dX7ZwMo1e5+hSN5elCVHo2hOxxTF/JP1bKBwyILdjidBGvTSdEsufS94fquaf/IY
 HpUe6wPf9txF9lTHptlcvoqDD1SNfSfcDBlZ+iI6wCHJXdlPA5dPBSzXtajb41lZ
 Q4LXFA4XwZb04ITEtTR2AbldbxsZuUpOamXc+4Gvsrtl8fai8zTxtyh4F4H4JQM3
 NIfQDA8CTlHID4QvHUe+s6JytVrkbq1RmdAUAdl89ztqP/AiAbI4OlOmg==
X-ME-Sender: <xms:Kw-jYjqlQDC2DvWggL6DXrvhZOc7cM3AuC0975FHE3chkUE5c4Hn4Q>
 <xme:Kw-jYtqRZoUsNdo0FBtdq4nWPgfXw27Sec1aK85uP5c6oLEuXIGJjxFr1lPwiTY4R
 nuZoASlLa0iEBdsRXk>
X-ME-Received: <xmr:Kw-jYgNODmwIxH3k-ufIbFL9SerEO5ESyBOgTpm9GATBvYkOd6ag7lX74MxmSK3ESgoOTN7IKB3mFMOPwqgQ771hE-3ZFM3llPR2XJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Kw-jYm5V1aUnI2bxlaYeU_mUE580bbv0AWOPY-mAjTRhN_xLTQpg4Q>
 <xmx:Kw-jYi74Qag6Nywt9qXr5B-ckYsK3jIbj2s4Ep6kB36kwDEAyZzkzg>
 <xmx:Kw-jYuibXhhytejPznPUDVERmfZtwHJWlR4379H6abQHGbrxs7rMjg>
 <xmx:LA-jYt3Nyd7iCpJWCvU87nw84oU-T5Oq2SYwdfKZonTp0BOPo92Y2A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 29/64] drm/vc4: dsi: Embed DRM structures into the private
 structure
Date: Fri, 10 Jun 2022 11:28:49 +0200
Message-Id: <20220610092924.754942-30-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

