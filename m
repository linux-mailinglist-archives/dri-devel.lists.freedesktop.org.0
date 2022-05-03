Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C0F5183FF
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CA810F8B4;
	Tue,  3 May 2022 12:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D261610F90B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:13:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 864D0320098E;
 Tue,  3 May 2022 08:13:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 03 May 2022 08:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580035; x=1651666435; bh=Sl
 n0wFPkuz87EsHbN/jRAYCh1VowTozQqZjP9n9EXzQ=; b=xrzbBTJkEIbk2JvWP7
 d535w7GVW30K0HRbAhCcmEXFGWzhu6SLtNTPIaZlx8nYSSw2/tqUKhUgBgZVxkcY
 FASN+0i9WheNDu0SMquC2/AmSv8rLgkWXKqchmFFsrzKQfMaZWaaB2YpUXkRXn83
 /iL+hfsDrRntGmraZP86cBp6y0cI6nWRMsn+q/p6obqe7kOH+qLztFmhpcqtXbKp
 IZSkL7tBSk/FmcXX9kZoHCgHVfQAH5hp4xR9tyXJ1WWGSGZ+/gcrmNsCyI4Hi1Tr
 bb5gpCF4/Xxx4BWC5B3HhcfSa3TBN5g+ru6Ml4vNjDDoT/oGIvFHSAduv05ZgkLq
 DLpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580035; x=1651666435; bh=Sln0wFPkuz87EsHbN/jRAYCh1VowTozQqZj
 P9n9EXzQ=; b=hb/GKctkBzO3JbMEciWVHA871h2U1qbyHZnhjFvwWAm0Kt4UNaR
 C3aeUYOUi0uQs6FvloQfMCJqQUzzeO2cozi7MARC6bSmDFjYzh98rMYADyyO+Xvt
 xvUFs4vAaUig40A0X0MFo4/KTopxJ6Pulf6cuvkbmvVajL05XsZdNx9n1tN8tBnD
 2V6PM167ZsuZSSc3KXSXvFOzb33C9rfZvbBiflrPTVamUng6frJ80k6qV/UkMrUV
 W5vI6Vepyd0YVF3TLkSQZYdEW+MhSBoSFS1F7ZhEx8S/dE22/c8jZKzRFkgffGq3
 0ktMjmYuDGusa3bvjIRcm2Qi1xcLng/hCAg==
X-ME-Sender: <xms:ghxxYlHR2IcyBRAmFB1md-ZtowYB8Ai7P8Wqz58bIOVYqt8Gy9njwA>
 <xme:ghxxYqUBAiDIpHKnOZ3LjLOCt3TUslsXCykgxxi74pIQTsnZLlq7fa8v1nhPxsJYS
 Lov5oiSmpYZNjQckkI>
X-ME-Received: <xmr:ghxxYnJJ0f-yUxev-RZ4QoNwu_Chk1lBonhGWviTgz5dFNYGQ_G3GSQELzdluKGEOeyavsdtRxEnTuyHtwOPkkEZpejKGFXTRzY5acA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ghxxYrEdFMrB4EqskBVb3d7lNFo5v4JarbdWhGjQSOdn8GRLWj9fog>
 <xmx:ghxxYrVurTYg0545ZWqltnVTZknQkxiMx4Zoj5FzNOvLyB-xMK5D_Q>
 <xmx:ghxxYmNdEZ-o280507BnGKvVzsrKRIYfLC3Dl6ACz8LUexpMheHQqA>
 <xmx:gxxxYhfwSDZhxsffoPopeaBwltRL5MctJE6IFl0z-hWFgL1haEnGug>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:13:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 02/14] drm/vc4: Consolidate Hardware Revision Check
Date: Tue,  3 May 2022 14:13:29 +0200
Message-Id: <20220503121341.983842-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
References: <20220503121341.983842-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A new generation of controller has been introduced with the
BCM2711/RaspberryPi4. This generation needs a bunch of quirks, and over
time we've piled on a number of checks in most parts of the drivers.

All these checks are performed several times, and are not always
consistent. Let's create a single, global, variable to hold it and use
it everywhere.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  6 +++---
 drivers/gpu/drm/vc4/vc4_drv.c   |  4 ++++
 drivers/gpu/drm/vc4/vc4_drv.h   |  6 +++---
 drivers/gpu/drm/vc4/vc4_hvs.c   | 18 +++++++++---------
 drivers/gpu/drm/vc4/vc4_kms.c   | 12 +++++-------
 drivers/gpu/drm/vc4/vc4_plane.c | 13 ++++++-------
 6 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 59b20c8f132b..dd5fb25d0f43 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -256,7 +256,7 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 		 * Removing 1 from the FIFO full level however
 		 * seems to completely remove that issue.
 		 */
-		if (!vc4->hvs->hvs5)
+		if (!vc4->is_vc5)
 			return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX - 1;
 
 		return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX;
@@ -389,7 +389,7 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	if (is_dsi)
 		CRTC_WRITE(PV_HACT_ACT, mode->hdisplay * pixel_rep);
 
-	if (vc4->hvs->hvs5)
+	if (vc4->is_vc5)
 		CRTC_WRITE(PV_MUX_CFG,
 			   VC4_SET_FIELD(PV_MUX_CFG_RGB_PIXEL_MUX_MODE_NO_SWAP,
 					 PV_MUX_CFG_RGB_PIXEL_MUX_MODE));
@@ -1149,7 +1149,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 				  crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, crtc_helper_funcs);
 
-	if (!vc4->hvs->hvs5) {
+	if (!vc4->is_vc5) {
 		drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
 
 		drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 162bc18e7497..53067525b586 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -217,10 +217,13 @@ static int vc4_drm_bind(struct device *dev)
 	struct vc4_dev *vc4;
 	struct device_node *node;
 	struct drm_crtc *crtc;
+	bool is_vc5;
 	int ret = 0;
 
 	dev->coherent_dma_mask = DMA_BIT_MASK(32);
 
+	is_vc5 = of_device_is_compatible(dev->of_node, "brcm,bcm2711-vc5");
+
 	/* If VC4 V3D is missing, don't advertise render nodes. */
 	node = of_find_matching_node_and_match(NULL, vc4_v3d_dt_match, NULL);
 	if (!node || !of_device_is_available(node))
@@ -230,6 +233,7 @@ static int vc4_drm_bind(struct device *dev)
 	vc4 = devm_drm_dev_alloc(dev, &vc4_drm_driver, struct vc4_dev, base);
 	if (IS_ERR(vc4))
 		return PTR_ERR(vc4);
+	vc4->is_vc5 = is_vc5;
 
 	drm = &vc4->base;
 	platform_set_drvdata(pdev, drm);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 15e0c2ac3940..82453a3bcffe 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -74,6 +74,8 @@ struct vc4_perfmon {
 struct vc4_dev {
 	struct drm_device base;
 
+	bool is_vc5;
+
 	unsigned int irq;
 
 	struct vc4_hvs *hvs;
@@ -316,6 +318,7 @@ struct vc4_v3d {
 };
 
 struct vc4_hvs {
+	struct vc4_dev *vc4;
 	struct platform_device *pdev;
 	void __iomem *regs;
 	u32 __iomem *dlist;
@@ -333,9 +336,6 @@ struct vc4_hvs {
 	struct drm_mm_node mitchell_netravali_filter;
 
 	struct debugfs_regset32 regset;
-
-	/* HVS version 5 flag, therefore requires updated dlist structures */
-	bool hvs5;
 };
 
 struct vc4_plane {
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2a58fc421cf6..ba2c8e5a9b64 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -220,10 +220,11 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 
 int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 {
+	struct vc4_dev *vc4 = hvs->vc4;
 	u32 reg;
 	int ret;
 
-	if (!hvs->hvs5)
+	if (!vc4->is_vc5)
 		return output;
 
 	switch (output) {
@@ -273,6 +274,7 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 				struct drm_display_mode *mode, bool oneshot)
 {
+	struct vc4_dev *vc4 = hvs->vc4;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
 	unsigned int chan = vc4_crtc_state->assigned_channel;
@@ -291,7 +293,7 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	 */
 	dispctrl = SCALER_DISPCTRLX_ENABLE;
 
-	if (!hvs->hvs5)
+	if (!vc4->is_vc5)
 		dispctrl |= VC4_SET_FIELD(mode->hdisplay,
 					  SCALER_DISPCTRLX_WIDTH) |
 			    VC4_SET_FIELD(mode->vdisplay,
@@ -312,7 +314,7 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 
 	HVS_WRITE(SCALER_DISPBKGNDX(chan), dispbkgndx |
 		  SCALER_DISPBKGND_AUTOHS |
-		  ((!hvs->hvs5) ? SCALER_DISPBKGND_GAMMA : 0) |
+		  ((!vc4->is_vc5) ? SCALER_DISPBKGND_GAMMA : 0) |
 		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
 
 	/* Reload the LUT, since the SRAMs would have been disabled if
@@ -617,11 +619,9 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (!hvs)
 		return -ENOMEM;
 
+	hvs->vc4 = vc4;
 	hvs->pdev = pdev;
 
-	if (of_device_is_compatible(pdev->dev.of_node, "brcm,bcm2711-hvs"))
-		hvs->hvs5 = true;
-
 	hvs->regs = vc4_ioremap_regs(pdev, 0);
 	if (IS_ERR(hvs->regs))
 		return PTR_ERR(hvs->regs);
@@ -630,7 +630,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	hvs->regset.regs = hvs_regs;
 	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
 
-	if (hvs->hvs5) {
+	if (vc4->is_vc5) {
 		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
 		if (IS_ERR(hvs->core_clk)) {
 			dev_err(&pdev->dev, "Couldn't get core clock\n");
@@ -644,7 +644,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		}
 	}
 
-	if (!hvs->hvs5)
+	if (!vc4->is_vc5)
 		hvs->dlist = hvs->regs + SCALER_DLIST_START;
 	else
 		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
@@ -665,7 +665,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	 * between planes when they don't overlap on the screen, but
 	 * for now we just allocate globally.
 	 */
-	if (!hvs->hvs5)
+	if (!vc4->is_vc5)
 		/* 48k words of 2x12-bit pixels */
 		drm_mm_init(&hvs->lbm_mm, 0, 48 * 1024);
 	else
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index c169bd72e53b..3c232d85ab85 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -393,7 +393,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		old_hvs_state->fifo_state[channel].pending_commit = NULL;
 	}
 
-	if (vc4->hvs->hvs5) {
+	if (vc4->is_vc5) {
 		unsigned long state_rate = max(old_hvs_state->core_clock_rate,
 					       new_hvs_state->core_clock_rate);
 		unsigned long core_rate = max_t(unsigned long,
@@ -412,7 +412,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 
 	vc4_ctm_commit(vc4, state);
 
-	if (vc4->hvs->hvs5)
+	if (vc4->is_vc5)
 		vc5_hvs_pv_muxing_commit(vc4, state);
 	else
 		vc4_hvs_pv_muxing_commit(vc4, state);
@@ -430,7 +430,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 
 	drm_atomic_helper_cleanup_planes(dev, state);
 
-	if (vc4->hvs->hvs5) {
+	if (vc4->is_vc5) {
 		drm_dbg(dev, "Running the core clock at %lu Hz\n",
 			new_hvs_state->core_clock_rate);
 
@@ -1000,8 +1000,6 @@ static const struct drm_mode_config_funcs vc4_mode_funcs = {
 int vc4_kms_load(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	bool is_vc5 = of_device_is_compatible(dev->dev->of_node,
-					      "brcm,bcm2711-vc5");
 	int ret;
 
 	/*
@@ -1009,7 +1007,7 @@ int vc4_kms_load(struct drm_device *dev)
 	 * the BCM2711, but the load tracker computations are used for
 	 * the core clock rate calculation.
 	 */
-	if (!is_vc5) {
+	if (!vc4->is_vc5) {
 		/* Start with the load tracker enabled. Can be
 		 * disabled through the debugfs load_tracker file.
 		 */
@@ -1025,7 +1023,7 @@ int vc4_kms_load(struct drm_device *dev)
 		return ret;
 	}
 
-	if (is_vc5) {
+	if (vc4->is_vc5) {
 		dev->mode_config.max_width = 7680;
 		dev->mode_config.max_height = 7680;
 	} else {
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 811a2d004cc4..ba7359516d75 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -489,10 +489,10 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
 	}
 
 	/* Align it to 64 or 128 (hvs5) bytes */
-	lbm = roundup(lbm, vc4->hvs->hvs5 ? 128 : 64);
+	lbm = roundup(lbm, vc4->is_vc5 ? 128 : 64);
 
 	/* Each "word" of the LBM memory contains 2 or 4 (hvs5) pixels */
-	lbm /= vc4->hvs->hvs5 ? 4 : 2;
+	lbm /= vc4->is_vc5 ? 4 : 2;
 
 	return lbm;
 }
@@ -608,7 +608,7 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 		ret = drm_mm_insert_node_generic(&vc4->hvs->lbm_mm,
 						 &vc4_state->lbm,
 						 lbm_size,
-						 vc4->hvs->hvs5 ? 64 : 32,
+						 vc4->is_vc5 ? 64 : 32,
 						 0, 0);
 		spin_unlock_irqrestore(&vc4->hvs->mm_lock, irqflags);
 
@@ -917,7 +917,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	mix_plane_alpha = state->alpha != DRM_BLEND_ALPHA_OPAQUE &&
 			  fb->format->has_alpha;
 
-	if (!vc4->hvs->hvs5) {
+	if (!vc4->is_vc5) {
 	/* Control word */
 		vc4_dlist_write(vc4_state,
 				SCALER_CTL0_VALID |
@@ -1457,14 +1457,13 @@ static const struct drm_plane_funcs vc4_plane_funcs = {
 struct drm_plane *vc4_plane_init(struct drm_device *dev,
 				 enum drm_plane_type type)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane = NULL;
 	struct vc4_plane *vc4_plane;
 	u32 formats[ARRAY_SIZE(hvs_formats)];
 	int num_formats = 0;
 	int ret = 0;
 	unsigned i;
-	bool hvs5 = of_device_is_compatible(dev->dev->of_node,
-					    "brcm,bcm2711-vc5");
 	static const uint64_t modifiers[] = {
 		DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED,
 		DRM_FORMAT_MOD_BROADCOM_SAND128,
@@ -1480,7 +1479,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
-		if (!hvs_formats[i].hvs5_only || hvs5) {
+		if (!hvs_formats[i].hvs5_only || vc4->is_vc5) {
 			formats[num_formats] = hvs_formats[i].drm;
 			num_formats++;
 		}
-- 
2.35.1

