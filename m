Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9504016A290
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BDB6E31C;
	Mon, 24 Feb 2020 09:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC996E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:09:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id F0B41611;
 Mon, 24 Feb 2020 04:09:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ciyFBYdAXfsbe
 i6D1Q86G4PN3H2CDATiGTG/PNzVWEs=; b=OdCvLl+7VT5WhboiylmEB7wlPl329
 bAiElGiDb1iBZ70h9kbDLzc3pi4SBCFCLYdLMGfZlL8MTZ7GzRdCBxuCGcmI1WRB
 ypHtXD9bx33ueiPwN3vEtgIV4BQk9FZYhQPcvLsK+DoaMMHQj8SO3m8E5Anh0dww
 1KjxXkaWQ7bPyMoB/vhRnOycMBH01sDIwGnX/x6mS5J5D7ofTgpqf5LOZRYXZT69
 nQ1BDMOfp3sjhfOQecEpbLwUe8WrPrwCxRemXMHzlqDrTyp+9wlMGaJiY0r3/deh
 6PT9ttyqCC8RBIJYjaWaQ2gCIxrtKc3KD1/h5KFSQbPK5YXeKC6sDBU+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ciyFBYdAXfsbei6D1Q86G4PN3H2CDATiGTG/PNzVWEs=; b=aKtl+Ub6
 yv8oMKF4hoVKHUXcnIbL68qtGsgMh8qO8Eur9U79NK0zw3Xnw9GWh3rCfhATovCW
 gryslxnGYBCPuPq/U06vyJaJxTqCCx7JW0SUBBh/DRS0jx6d+rfLdXZ1b8HPtJqD
 ywEnOO3/E9vQfgSot0bedtUy9HUDnMtQsJzYhVPXwGHDTD0UaH4QDEiKeHDsJpoC
 dul1bYzxPc6oFA5TgwYYSRxV6w+iuKIL0U4DVWdt4PZI1CIe0VzL1vCOJ+MlalFs
 6Z1FLjndiqyv7AlGopQHQX7J3EP4W0Yc2eUsJLwOr2t9kWTv2E/qb4QgirGQkkUf
 QC12FtlWO0gV5g==
X-ME-Sender: <xms:1ZJTXnszpqJeVX_h3G9bv07Amh1kS5decOke9Mt37M4VEJwoS_QZTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepvdejnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1ZJTXhp3GQLGpnXcpm8Ze_lkopRg9pmrhmZKbnS1KV24QlRcAn78Ow>
 <xmx:1ZJTXk7zfhs7vGsL_uh_ZDXg2lGPDM5XERwl9TZ4cESiKc5MWLu_fg>
 <xmx:1ZJTXnH_sPC72pGAst8ofsWKs-QGSd1mfEbQY7UyleY3C6783GtZ1w>
 <xmx:1ZJTXo0Poqr96VjQEMlE0VOwQmNrOEIveRzSGqpHpFbKSC9HBcNBoBJQulw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 23BEE3280063;
 Mon, 24 Feb 2020 04:09:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 36/89] drm/vc4: drv: Add support for the BCM2711 HVS5
Date: Mon, 24 Feb 2020 10:06:38 +0100
Message-Id: <ec0e8641c1c988e3b7badb2219eefe3db84b686e.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.org>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The HVS found in the BCM2711 is slightly different from the previous
generations.

Most notably, the display list layout changes a bit, the LBM doesn't have
the same size and the formats ordering for some formats is swapped.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  24 +++-
 drivers/gpu/drm/vc4/vc4_drv.h   |   4 +-
 drivers/gpu/drm/vc4/vc4_hvs.c   |  17 ++-
 drivers/gpu/drm/vc4/vc4_plane.c | 194 ++++++++++++++++++++++++---------
 drivers/gpu/drm/vc4/vc4_regs.h  |  67 +++++++++++-
 5 files changed, 247 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index b00e20f5ce05..381702b9f057 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -550,6 +550,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	u32 dispctrl;
 
 	require_hvs_enabled(dev);
 
@@ -564,11 +565,24 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * When feeding the transposer, we should operate in oneshot
 	 * mode.
 	 */
-	HVS_WRITE(SCALER_DISPCTRLX(vc4_crtc->channel),
-		  VC4_SET_FIELD(mode->hdisplay, SCALER_DISPCTRLX_WIDTH) |
-		  VC4_SET_FIELD(mode->vdisplay, SCALER_DISPCTRLX_HEIGHT) |
-		  SCALER_DISPCTRLX_ENABLE |
-		  (vc4_state->feed_txp ? SCALER_DISPCTRLX_ONESHOT : 0));
+	dispctrl = SCALER_DISPCTRLX_ENABLE;
+
+	if (!vc4->hvs->hvs5)
+		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
+					  SCALER_DISPCTRLX_WIDTH) |
+			    VC4_SET_FIELD(mode->vdisplay,
+					  SCALER_DISPCTRLX_HEIGHT) |
+			    (vc4_state->feed_txp ?
+					SCALER_DISPCTRLX_ONESHOT : 0);
+	else
+		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
+					  SCALER5_DISPCTRLX_WIDTH) |
+			    VC4_SET_FIELD(mode->vdisplay,
+					  SCALER5_DISPCTRLX_HEIGHT) |
+			    (vc4_state->feed_txp ?
+					SCALER5_DISPCTRLX_ONESHOT : 0);
+
+	HVS_WRITE(SCALER_DISPCTRLX(vc4_crtc->channel), dispctrl);
 
 	/* When feeding the transposer block the pixelvalve is unneeded and
 	 * should not be enabled.
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c8dc04183c7b..63c05c764942 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -332,7 +332,11 @@ struct vc4_hvs {
 	spinlock_t mm_lock;
 
 	struct drm_mm_node mitchell_netravali_filter;
+
 	struct debugfs_regset32 regset;
+
+	/* HVS version 5 flag, therefore requires updated dlist structures */
+	bool hvs5;
 };
 
 struct vc4_plane {
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 5a43659da319..4ca831414c5e 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -223,6 +223,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_hvs *hvs = NULL;
 	int ret;
 	u32 dispctrl;
+	unsigned int hvs_version;
 
 	hvs = devm_kzalloc(&pdev->dev, sizeof(*hvs), GFP_KERNEL);
 	if (!hvs)
@@ -238,7 +239,14 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	hvs->regset.regs = hvs_regs;
 	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
 
-	hvs->dlist = hvs->regs + SCALER_DLIST_START;
+	hvs_version = readl(hvs->regs + SCALER_DISPLSTAT) >> 24;
+	if (hvs_version >= 0x40)
+		hvs->hvs5 = true;
+
+	if (!hvs->hvs5)
+		hvs->dlist = hvs->regs + SCALER_DLIST_START;
+	else
+		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
 
 	spin_lock_init(&hvs->mm_lock);
 
@@ -256,7 +264,12 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	 * between planes when they don't overlap on the screen, but
 	 * for now we just allocate globally.
 	 */
-	drm_mm_init(&hvs->lbm_mm, 0, 96 * 1024);
+	if (!hvs->hvs5)
+		/* 96kB */
+		drm_mm_init(&hvs->lbm_mm, 0, 96 * 1024);
+	else
+		/* 70k words */
+		drm_mm_init(&hvs->lbm_mm, 0, 70 * 2 * 1024);
 
 	/* Upload filter kernels.  We only have the one for now, so we
 	 * keep it around for the lifetime of the driver.
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 07a145e286f7..0b8309247dec 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -32,45 +32,60 @@ static const struct hvs_format {
 	u32 drm; /* DRM_FORMAT_* */
 	u32 hvs; /* HVS_FORMAT_* */
 	u32 pixel_order;
+	u32 pixel_order_hvs5;
 } hvs_formats[] = {
 	{
-		.drm = DRM_FORMAT_XRGB8888, .hvs = HVS_PIXEL_FORMAT_RGBA8888,
+		.drm = DRM_FORMAT_XRGB8888,
+		.hvs = HVS_PIXEL_FORMAT_RGBA8888,
 		.pixel_order = HVS_PIXEL_ORDER_ABGR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
 	},
 	{
-		.drm = DRM_FORMAT_ARGB8888, .hvs = HVS_PIXEL_FORMAT_RGBA8888,
+		.drm = DRM_FORMAT_ARGB8888,
+		.hvs = HVS_PIXEL_FORMAT_RGBA8888,
 		.pixel_order = HVS_PIXEL_ORDER_ABGR,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ARGB,
 	},
 	{
-		.drm = DRM_FORMAT_ABGR8888, .hvs = HVS_PIXEL_FORMAT_RGBA8888,
+		.drm = DRM_FORMAT_ABGR8888,
+		.hvs = HVS_PIXEL_FORMAT_RGBA8888,
 		.pixel_order = HVS_PIXEL_ORDER_ARGB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
 	},
 	{
-		.drm = DRM_FORMAT_XBGR8888, .hvs = HVS_PIXEL_FORMAT_RGBA8888,
+		.drm = DRM_FORMAT_XBGR8888,
+		.hvs = HVS_PIXEL_FORMAT_RGBA8888,
 		.pixel_order = HVS_PIXEL_ORDER_ARGB,
+		.pixel_order_hvs5 = HVS_PIXEL_ORDER_ABGR,
 	},
 	{
-		.drm = DRM_FORMAT_RGB565, .hvs = HVS_PIXEL_FORMAT_RGB565,
+		.drm = DRM_FORMAT_RGB565,
+		.hvs = HVS_PIXEL_FORMAT_RGB565,
 		.pixel_order = HVS_PIXEL_ORDER_XRGB,
 	},
 	{
-		.drm = DRM_FORMAT_BGR565, .hvs = HVS_PIXEL_FORMAT_RGB565,
+		.drm = DRM_FORMAT_BGR565,
+		.hvs = HVS_PIXEL_FORMAT_RGB565,
 		.pixel_order = HVS_PIXEL_ORDER_XBGR,
 	},
 	{
-		.drm = DRM_FORMAT_ARGB1555, .hvs = HVS_PIXEL_FORMAT_RGBA5551,
+		.drm = DRM_FORMAT_ARGB1555,
+		.hvs = HVS_PIXEL_FORMAT_RGBA5551,
 		.pixel_order = HVS_PIXEL_ORDER_ABGR,
 	},
 	{
-		.drm = DRM_FORMAT_XRGB1555, .hvs = HVS_PIXEL_FORMAT_RGBA5551,
+		.drm = DRM_FORMAT_XRGB1555,
+		.hvs = HVS_PIXEL_FORMAT_RGBA5551,
 		.pixel_order = HVS_PIXEL_ORDER_ABGR,
 	},
 	{
-		.drm = DRM_FORMAT_RGB888, .hvs = HVS_PIXEL_FORMAT_RGB888,
+		.drm = DRM_FORMAT_RGB888,
+		.hvs = HVS_PIXEL_FORMAT_RGB888,
 		.pixel_order = HVS_PIXEL_ORDER_XRGB,
 	},
 	{
-		.drm = DRM_FORMAT_BGR888, .hvs = HVS_PIXEL_FORMAT_RGB888,
+		.drm = DRM_FORMAT_BGR888,
+		.hvs = HVS_PIXEL_FORMAT_RGB888,
 		.pixel_order = HVS_PIXEL_ORDER_XBGR,
 	},
 	{
@@ -781,35 +796,6 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	/* Control word */
-	vc4_dlist_write(vc4_state,
-			SCALER_CTL0_VALID |
-			(rotation & DRM_MODE_REFLECT_X ? SCALER_CTL0_HFLIP : 0) |
-			(rotation & DRM_MODE_REFLECT_Y ? SCALER_CTL0_VFLIP : 0) |
-			VC4_SET_FIELD(SCALER_CTL0_RGBA_EXPAND_ROUND, SCALER_CTL0_RGBA_EXPAND) |
-			(format->pixel_order << SCALER_CTL0_ORDER_SHIFT) |
-			(hvs_format << SCALER_CTL0_PIXEL_FORMAT_SHIFT) |
-			VC4_SET_FIELD(tiling, SCALER_CTL0_TILING) |
-			(vc4_state->is_unity ? SCALER_CTL0_UNITY : 0) |
-			VC4_SET_FIELD(scl0, SCALER_CTL0_SCL0) |
-			VC4_SET_FIELD(scl1, SCALER_CTL0_SCL1));
-
-	/* Position Word 0: Image Positions and Alpha Value */
-	vc4_state->pos0_offset = vc4_state->dlist_count;
-	vc4_dlist_write(vc4_state,
-			VC4_SET_FIELD(state->alpha >> 8, SCALER_POS0_FIXED_ALPHA) |
-			VC4_SET_FIELD(vc4_state->crtc_x, SCALER_POS0_START_X) |
-			VC4_SET_FIELD(vc4_state->crtc_y, SCALER_POS0_START_Y));
-
-	/* Position Word 1: Scaled Image Dimensions. */
-	if (!vc4_state->is_unity) {
-		vc4_dlist_write(vc4_state,
-				VC4_SET_FIELD(vc4_state->crtc_w,
-					      SCALER_POS1_SCL_WIDTH) |
-				VC4_SET_FIELD(vc4_state->crtc_h,
-					      SCALER_POS1_SCL_HEIGHT));
-	}
-
 	/* Don't waste cycles mixing with plane alpha if the set alpha
 	 * is opaque or there is no per-pixel alpha information.
 	 * In any case we use the alpha property value as the fixed alpha.
@@ -817,20 +803,120 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	mix_plane_alpha = state->alpha != DRM_BLEND_ALPHA_OPAQUE &&
 			  fb->format->has_alpha;
 
-	/* Position Word 2: Source Image Size, Alpha */
-	vc4_state->pos2_offset = vc4_state->dlist_count;
-	vc4_dlist_write(vc4_state,
-			VC4_SET_FIELD(fb->format->has_alpha ?
-				      SCALER_POS2_ALPHA_MODE_PIPELINE :
-				      SCALER_POS2_ALPHA_MODE_FIXED,
-				      SCALER_POS2_ALPHA_MODE) |
-			(mix_plane_alpha ? SCALER_POS2_ALPHA_MIX : 0) |
-			(fb->format->has_alpha ? SCALER_POS2_ALPHA_PREMULT : 0) |
-			VC4_SET_FIELD(vc4_state->src_w[0], SCALER_POS2_WIDTH) |
-			VC4_SET_FIELD(vc4_state->src_h[0], SCALER_POS2_HEIGHT));
+	if (!vc4->hvs->hvs5) {
+	/* Control word */
+		vc4_dlist_write(vc4_state,
+				SCALER_CTL0_VALID |
+				(rotation & DRM_MODE_REFLECT_X ? SCALER_CTL0_HFLIP : 0) |
+				(rotation & DRM_MODE_REFLECT_Y ? SCALER_CTL0_VFLIP : 0) |
+				VC4_SET_FIELD(SCALER_CTL0_RGBA_EXPAND_ROUND, SCALER_CTL0_RGBA_EXPAND) |
+				(format->pixel_order << SCALER_CTL0_ORDER_SHIFT) |
+				(hvs_format << SCALER_CTL0_PIXEL_FORMAT_SHIFT) |
+				VC4_SET_FIELD(tiling, SCALER_CTL0_TILING) |
+				(vc4_state->is_unity ? SCALER_CTL0_UNITY : 0) |
+				VC4_SET_FIELD(scl0, SCALER_CTL0_SCL0) |
+				VC4_SET_FIELD(scl1, SCALER_CTL0_SCL1));
+
+		/* Position Word 0: Image Positions and Alpha Value */
+		vc4_state->pos0_offset = vc4_state->dlist_count;
+		vc4_dlist_write(vc4_state,
+				VC4_SET_FIELD(state->alpha >> 8, SCALER_POS0_FIXED_ALPHA) |
+				VC4_SET_FIELD(vc4_state->crtc_x, SCALER_POS0_START_X) |
+				VC4_SET_FIELD(vc4_state->crtc_y, SCALER_POS0_START_Y));
+
+		/* Position Word 1: Scaled Image Dimensions. */
+		if (!vc4_state->is_unity) {
+			vc4_dlist_write(vc4_state,
+					VC4_SET_FIELD(vc4_state->crtc_w,
+						      SCALER_POS1_SCL_WIDTH) |
+					VC4_SET_FIELD(vc4_state->crtc_h,
+						      SCALER_POS1_SCL_HEIGHT));
+		}
+
+		/* Position Word 2: Source Image Size, Alpha */
+		vc4_state->pos2_offset = vc4_state->dlist_count;
+		vc4_dlist_write(vc4_state,
+				VC4_SET_FIELD(fb->format->has_alpha ?
+					      SCALER_POS2_ALPHA_MODE_PIPELINE :
+					      SCALER_POS2_ALPHA_MODE_FIXED,
+					      SCALER_POS2_ALPHA_MODE) |
+				(mix_plane_alpha ? SCALER_POS2_ALPHA_MIX : 0) |
+				(fb->format->has_alpha ?
+						SCALER_POS2_ALPHA_PREMULT : 0) |
+				VC4_SET_FIELD(vc4_state->src_w[0],
+					      SCALER_POS2_WIDTH) |
+				VC4_SET_FIELD(vc4_state->src_h[0],
+					      SCALER_POS2_HEIGHT));
+
+		/* Position Word 3: Context.  Written by the HVS. */
+		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
+
+	} else {
+		u32 hvs_pixel_order = format->pixel_order;
 
-	/* Position Word 3: Context.  Written by the HVS. */
-	vc4_dlist_write(vc4_state, 0xc0c0c0c0);
+		if (format->pixel_order_hvs5)
+			hvs_pixel_order = format->pixel_order_hvs5;
+
+		/* Control word */
+		vc4_dlist_write(vc4_state,
+				SCALER_CTL0_VALID |
+				(hvs_pixel_order << SCALER_CTL0_ORDER_SHIFT) |
+				(hvs_format << SCALER_CTL0_PIXEL_FORMAT_SHIFT) |
+				VC4_SET_FIELD(tiling, SCALER_CTL0_TILING) |
+				(vc4_state->is_unity ?
+						SCALER5_CTL0_UNITY : 0) |
+				VC4_SET_FIELD(scl0, SCALER_CTL0_SCL0) |
+				VC4_SET_FIELD(scl1, SCALER_CTL0_SCL1) |
+				SCALER5_CTL0_ALPHA_EXPAND |
+				SCALER5_CTL0_RGB_EXPAND);
+
+		/* Position Word 0: Image Positions and Alpha Value */
+		vc4_state->pos0_offset = vc4_state->dlist_count;
+		vc4_dlist_write(vc4_state,
+				(rotation & DRM_MODE_REFLECT_Y ?
+						SCALER5_POS0_VFLIP : 0) |
+				VC4_SET_FIELD(vc4_state->crtc_x,
+					      SCALER_POS0_START_X) |
+				(rotation & DRM_MODE_REFLECT_X ?
+					      SCALER5_POS0_HFLIP : 0) |
+				VC4_SET_FIELD(vc4_state->crtc_y,
+					      SCALER5_POS0_START_Y)
+			       );
+
+		/* Control Word 2 */
+		vc4_dlist_write(vc4_state,
+				VC4_SET_FIELD(state->alpha >> 4,
+					      SCALER5_CTL2_ALPHA) |
+				fb->format->has_alpha ?
+					SCALER5_CTL2_ALPHA_PREMULT : 0 |
+				(mix_plane_alpha ?
+					SCALER5_CTL2_ALPHA_MIX : 0) |
+				VC4_SET_FIELD(fb->format->has_alpha ?
+				      SCALER5_CTL2_ALPHA_MODE_PIPELINE :
+				      SCALER5_CTL2_ALPHA_MODE_FIXED,
+				      SCALER5_CTL2_ALPHA_MODE)
+			       );
+
+		/* Position Word 1: Scaled Image Dimensions. */
+		if (!vc4_state->is_unity) {
+			vc4_dlist_write(vc4_state,
+					VC4_SET_FIELD(vc4_state->crtc_w,
+						      SCALER_POS1_SCL_WIDTH) |
+					VC4_SET_FIELD(vc4_state->crtc_h,
+						      SCALER_POS1_SCL_HEIGHT));
+		}
+
+		/* Position Word 2: Source Image Size */
+		vc4_state->pos2_offset = vc4_state->dlist_count;
+		vc4_dlist_write(vc4_state,
+				VC4_SET_FIELD(vc4_state->src_w[0],
+					      SCALER5_POS2_WIDTH) |
+				VC4_SET_FIELD(vc4_state->src_h[0],
+					      SCALER5_POS2_HEIGHT));
+
+		/* Position Word 3: Context.  Written by the HVS. */
+		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
+	}
 
 
 	/* Pointer Word 0/1/2: RGB / Y / Cb / Cr Pointers
@@ -1208,6 +1294,10 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
 		default:
 			return false;
 		}
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_BGRX1010102:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_BGRA1010102:
 	case DRM_FORMAT_YUV422:
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YUV420:
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index b5a6b4cdd332..8a51baf681fe 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -328,6 +328,20 @@
 # define SCALER_DISPCTRLX_HEIGHT_MASK		VC4_MASK(11, 0)
 # define SCALER_DISPCTRLX_HEIGHT_SHIFT		0
 
+# define SCALER5_DISPCTRLX_WIDTH_MASK		VC4_MASK(28, 16)
+# define SCALER5_DISPCTRLX_WIDTH_SHIFT		16
+/* Generates a single frame when VSTART is seen and stops at the last
+ * pixel read from the FIFO.
+ */
+# define SCALER5_DISPCTRLX_ONESHOT		BIT(15)
+/* Processes a single context in the dlist and then task switch,
+ * instead of an entire line.
+ */
+# define SCALER5_DISPCTRLX_ONECTX_MASK		VC4_MASK(14, 13)
+# define SCALER5_DISPCTRLX_ONECTX_SHIFT		13
+# define SCALER5_DISPCTRLX_HEIGHT_MASK		VC4_MASK(12, 0)
+# define SCALER5_DISPCTRLX_HEIGHT_SHIFT		0
+
 #define SCALER_DISPBKGND0                       0x00000044
 # define SCALER_DISPBKGND_AUTOHS		BIT(31)
 # define SCALER_DISPBKGND_INTERLACE		BIT(30)
@@ -461,6 +475,8 @@
 #define SCALER_DLIST_START                      0x00002000
 #define SCALER_DLIST_SIZE                       0x00004000
 
+#define SCALER5_DLIST_START			0x00004000
+
 #define VC4_HDMI_CORE_REV			0x000
 
 #define VC4_HDMI_SW_RESET_CONTROL		0x004
@@ -826,6 +842,8 @@ enum hvs_pixel_format {
 	HVS_PIXEL_FORMAT_PALETTE = 13,
 	HVS_PIXEL_FORMAT_YUV444_RGB = 14,
 	HVS_PIXEL_FORMAT_AYUV444_RGB = 15,
+	HVS_PIXEL_FORMAT_RGBA1010102 = 16,
+	HVS_PIXEL_FORMAT_YCBCR_10BIT = 17,
 };
 
 /* Note: the LSB is the rightmost character shown.  Only valid for
@@ -880,6 +898,10 @@ enum hvs_pixel_format {
 #define SCALER_CTL0_RGBA_EXPAND_MSB		2
 #define SCALER_CTL0_RGBA_EXPAND_ROUND		3
 
+#define SCALER5_CTL0_ALPHA_EXPAND		BIT(12)
+
+#define SCALER5_CTL0_RGB_EXPAND			BIT(11)
+
 #define SCALER_CTL0_SCL1_MASK			VC4_MASK(10, 8)
 #define SCALER_CTL0_SCL1_SHIFT			8
 
@@ -897,10 +919,13 @@ enum hvs_pixel_format {
 
 /* Set to indicate no scaling. */
 #define SCALER_CTL0_UNITY			BIT(4)
+#define SCALER5_CTL0_UNITY			BIT(15)
 
 #define SCALER_CTL0_PIXEL_FORMAT_MASK		VC4_MASK(3, 0)
 #define SCALER_CTL0_PIXEL_FORMAT_SHIFT		0
 
+#define SCALER5_CTL0_PIXEL_FORMAT_MASK		VC4_MASK(4, 0)
+
 #define SCALER_POS0_FIXED_ALPHA_MASK		VC4_MASK(31, 24)
 #define SCALER_POS0_FIXED_ALPHA_SHIFT		24
 
@@ -910,12 +935,48 @@ enum hvs_pixel_format {
 #define SCALER_POS0_START_X_MASK		VC4_MASK(11, 0)
 #define SCALER_POS0_START_X_SHIFT		0
 
+#define SCALER5_POS0_START_Y_MASK		VC4_MASK(27, 16)
+#define SCALER5_POS0_START_Y_SHIFT		16
+
+#define SCALER5_POS0_START_X_MASK		VC4_MASK(13, 0)
+#define SCALER5_POS0_START_X_SHIFT		0
+
+#define SCALER5_POS0_VFLIP			BIT(31)
+#define SCALER5_POS0_HFLIP			BIT(15)
+
+#define SCALER5_CTL2_ALPHA_MODE_MASK		VC4_MASK(31, 30)
+#define SCALER5_CTL2_ALPHA_MODE_SHIFT		30
+#define SCALER5_CTL2_ALPHA_MODE_PIPELINE		0
+#define SCALER5_CTL2_ALPHA_MODE_FIXED		1
+#define SCALER5_CTL2_ALPHA_MODE_FIXED_NONZERO	2
+#define SCALER5_CTL2_ALPHA_MODE_FIXED_OVER_0x07	3
+
+#define SCALER5_CTL2_ALPHA_PREMULT		BIT(29)
+
+#define SCALER5_CTL2_ALPHA_MIX			BIT(28)
+
+#define SCALER5_CTL2_ALPHA_LOC			BIT(25)
+
+#define SCALER5_CTL2_MAP_SEL_MASK		VC4_MASK(18, 17)
+#define SCALER5_CTL2_MAP_SEL_SHIFT		17
+
+#define SCALER5_CTL2_GAMMA			BIT(16)
+
+#define SCALER5_CTL2_ALPHA_MASK			VC4_MASK(15, 4)
+#define SCALER5_CTL2_ALPHA_SHIFT		4
+
 #define SCALER_POS1_SCL_HEIGHT_MASK		VC4_MASK(27, 16)
 #define SCALER_POS1_SCL_HEIGHT_SHIFT		16
 
 #define SCALER_POS1_SCL_WIDTH_MASK		VC4_MASK(11, 0)
 #define SCALER_POS1_SCL_WIDTH_SHIFT		0
 
+#define SCALER5_POS1_SCL_HEIGHT_MASK		VC4_MASK(28, 16)
+#define SCALER5_POS1_SCL_HEIGHT_SHIFT		16
+
+#define SCALER5_POS1_SCL_WIDTH_MASK		VC4_MASK(12, 0)
+#define SCALER5_POS1_SCL_WIDTH_SHIFT		0
+
 #define SCALER_POS2_ALPHA_MODE_MASK		VC4_MASK(31, 30)
 #define SCALER_POS2_ALPHA_MODE_SHIFT		30
 #define SCALER_POS2_ALPHA_MODE_PIPELINE		0
@@ -931,6 +992,12 @@ enum hvs_pixel_format {
 #define SCALER_POS2_WIDTH_MASK			VC4_MASK(11, 0)
 #define SCALER_POS2_WIDTH_SHIFT			0
 
+#define SCALER5_POS2_HEIGHT_MASK		VC4_MASK(28, 16)
+#define SCALER5_POS2_HEIGHT_SHIFT		16
+
+#define SCALER5_POS2_WIDTH_MASK			VC4_MASK(12, 0)
+#define SCALER5_POS2_WIDTH_SHIFT		0
+
 /* Color Space Conversion words.  Some values are S2.8 signed
  * integers, except that the 2 integer bits map as {0x0: 0, 0x1: 1,
  * 0x2: 2, 0x3: -1}
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
