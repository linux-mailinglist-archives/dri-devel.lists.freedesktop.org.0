Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A701F82B1
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9386E41B;
	Sat, 13 Jun 2020 10:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A29A6E90B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 13:38:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 96D8C5801B1;
 Thu, 11 Jun 2020 09:38:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Jun 2020 09:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=v+f7mOUJH3EMC
 m+y6xPjTwB4ZHoavvHvnR9dUpV55Gg=; b=QHUSHs+j5p8PQb6pdAKrXxmiZNIA9
 GjfViThgpEylKtP+EpRo9vCRunon/H85EPsnuv82BjaBXUKAuoeaWIoUObCMokAa
 0HZs7+W4Deax6XMV9WGgFbIuGK2bzc9CUz8+VY/F9uEX8YEYGj2Mohbc7s0TsKal
 ikuXH5R1W5d36KxNNUoXJSGWX3nuSOdTsZi1n+GIZjNK4oSvN75VdnTdoWxh8Gqb
 3v7KWeRiv+YIUhUlDkstA7dOfirr2cqMwQdnZJegFfjO3CEaRSL0hbkvdG2VtuU1
 YHkkHf2MrMw1psT7ETiiVHRrgUy01T6NeL9AaJxMd/+Jr+UJN2d2cnsvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=v+f7mOUJH3EMCm+y6xPjTwB4ZHoavvHvnR9dUpV55Gg=; b=JWuZRUL7
 s9d+7PUSQFbd7Lg9a5bNIbEuQnXVbunzQisYBQ2eMQ1D/iYlra2wC29J78Z/agwU
 xlzFnm6CVR40q0UprDX2Pj7TjIUKJVQH168VMo2ShXIDP5H57wo908wRXWKhkvYm
 VVetqbg6NjLbrpFjAt/8v8sxjUBY4R2TD0tQlFO03Tfdw/DoCNsr07HiLeNUNyZF
 7IescWBakGCisdtw8oK2SI48HCX+3G0tyMQgJpvaxvLkyevl5oo1wMtvhGFtHSUK
 NDJvTva3BrPCwdPGVOvBYmkBd4xfV22L4eZuB72IlOg5Vb6prfqs9wlLgxXU8Hv5
 lscFL2sm5Nrk2Q==
X-ME-Sender: <xms:3DPiXm8ysZBdDET2Lj7lK4apJ89Uh6wR3I9I5GzEaQ6-SxWE0fk39A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehledggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3DPiXmtPDNdPpgt8EO2yFs3PbX7_2cvN_ibbE5p2Qm2wyA5V1dPCuQ>
 <xmx:3DPiXsBKnJfLY5NMU-cY6lRydCzED1W1xqSAQP_VoACt4djltJAwEw>
 <xmx:3DPiXue_l6YKO2QxS0i66wWjmrV2HUNltzWG0mszbu0jy1u1-7iyHg>
 <xmx:3DPiXmeKpMHbdzRcsfOjooRqCmhtAwE5FgcQiFNI8jxnvcL5OfZ6FQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A40F130665EC;
 Thu, 11 Jun 2020 09:37:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 2/9] drm/vc4: crtc: Move HVS setup code to the HVS driver
Date: Thu, 11 Jun 2020 15:36:47 +0200
Message-Id: <96443394e81429ee38f070cfe231701b07e56d69.1591882579.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
References: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CRTC in vc4 is backed by two devices, the HVS that does the composition
and the PixelValve that does the timing generation.

The writeback is kind of a special case since it doesn't have an associated
pixelvalve but goes straight from the HVS to the TXP. Therefore, it makes
sense to move out the HVS setup code into helpers so that we can also reuse
them from the TXP driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 256 +------------------------------
 drivers/gpu/drm/vc4/vc4_drv.h  |   5 +-
 drivers/gpu/drm/vc4/vc4_hvs.c  | 291 ++++++++++++++++++++++++++++++++++-
 3 files changed, 302 insertions(+), 250 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 29131409a4de..879161841628 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -189,47 +189,6 @@ static void vc4_crtc_destroy(struct drm_crtc *crtc)
 	drm_crtc_cleanup(crtc);
 }
 
-static void
-vc4_crtc_lut_load(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	u32 i;
-
-	/* The LUT memory is laid out with each HVS channel in order,
-	 * each of which takes 256 writes for R, 256 for G, then 256
-	 * for B.
-	 */
-	HVS_WRITE(SCALER_GAMADDR,
-		  SCALER_GAMADDR_AUTOINC |
-		  (vc4_crtc->channel * 3 * crtc->gamma_size));
-
-	for (i = 0; i < crtc->gamma_size; i++)
-		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_r[i]);
-	for (i = 0; i < crtc->gamma_size; i++)
-		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_g[i]);
-	for (i = 0; i < crtc->gamma_size; i++)
-		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_b[i]);
-}
-
-static void
-vc4_crtc_update_gamma_lut(struct drm_crtc *crtc)
-{
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct drm_color_lut *lut = crtc->state->gamma_lut->data;
-	u32 length = drm_color_lut_size(crtc->state->gamma_lut);
-	u32 i;
-
-	for (i = 0; i < length; i++) {
-		vc4_crtc->lut_r[i] = drm_color_lut_extract(lut[i].red, 8);
-		vc4_crtc->lut_g[i] = drm_color_lut_extract(lut[i].green, 8);
-		vc4_crtc->lut_b[i] = drm_color_lut_extract(lut[i].blue, 8);
-	}
-
-	vc4_crtc_lut_load(crtc);
-}
-
 static u32 vc4_get_fifo_full_level(u32 format)
 {
 	static const u32 fifo_len_bytes = 64;
@@ -363,12 +322,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc)
 
 static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
-	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
 	bool debug_dump_regs = false;
 
 	if (debug_dump_regs) {
@@ -378,42 +333,10 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		drm_print_regset32(&p, &vc4_crtc->regset);
 	}
 
-	if (vc4_crtc->channel == 2) {
-		u32 dispctrl;
-		u32 dsp3_mux;
-
-		/*
-		 * SCALER_DISPCTRL_DSP3 = X, where X < 2 means 'connect DSP3 to
-		 * FIFO X'.
-		 * SCALER_DISPCTRL_DSP3 = 3 means 'disable DSP 3'.
-		 *
-		 * DSP3 is connected to FIFO2 unless the transposer is
-		 * enabled. In this case, FIFO 2 is directly accessed by the
-		 * TXP IP, and we need to disable the FIFO2 -> pixelvalve1
-		 * route.
-		 */
-		if (vc4_state->feed_txp)
-			dsp3_mux = VC4_SET_FIELD(3, SCALER_DISPCTRL_DSP3_MUX);
-		else
-			dsp3_mux = VC4_SET_FIELD(2, SCALER_DISPCTRL_DSP3_MUX);
-
-		dispctrl = HVS_READ(SCALER_DISPCTRL) &
-			   ~SCALER_DISPCTRL_DSP3_MUX_MASK;
-		HVS_WRITE(SCALER_DISPCTRL, dispctrl | dsp3_mux);
-	}
-
 	if (!vc4_state->feed_txp)
 		vc4_crtc_config_pv(crtc);
 
-	HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel),
-		  SCALER_DISPBKGND_AUTOHS |
-		  SCALER_DISPBKGND_GAMMA |
-		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
-
-	/* Reload the LUT, since the SRAMs would have been disabled if
-	 * all CRTCs had SCALER_DISPBKGND_GAMMA unset at once.
-	 */
-	vc4_crtc_lut_load(crtc);
+	vc4_hvs_mode_set_nofb(crtc);
 
 	if (debug_dump_regs) {
 		struct drm_printer p = drm_info_printer(&vc4_crtc->pdev->dev);
@@ -435,10 +358,9 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 				    struct drm_crtc_state *old_state)
 {
 	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	u32 chan = vc4_crtc->channel;
 	int ret;
+
 	require_hvs_enabled(dev);
 
 	/* Disable vblank irq handling before crtc is disabled. */
@@ -449,28 +371,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
 	WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
 
-	if (HVS_READ(SCALER_DISPCTRLX(chan)) &
-	    SCALER_DISPCTRLX_ENABLE) {
-		HVS_WRITE(SCALER_DISPCTRLX(chan),
-			  SCALER_DISPCTRLX_RESET);
-
-		/* While the docs say that reset is self-clearing, it
-		 * seems it doesn't actually.
-		 */
-		HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
-	}
-
-	/* Once we leave, the scaler should be disabled and its fifo empty. */
-
-	WARN_ON_ONCE(HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_RESET);
-
-	WARN_ON_ONCE(VC4_GET_FIELD(HVS_READ(SCALER_DISPSTATX(chan)),
-				   SCALER_DISPSTATX_MODE) !=
-		     SCALER_DISPSTATX_MODE_DISABLED);
-
-	WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
-		      (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
-		     SCALER_DISPSTATX_EMPTY);
+	vc4_hvs_atomic_disable(crtc, old_state);
 
 	/*
 	 * Make sure we issue a vblank event after disabling the CRTC if
@@ -493,42 +394,10 @@ void vc4_crtc_txp_armed(struct drm_crtc_state *state)
 	vc4_state->txp_armed = true;
 }
 
-static void vc4_crtc_update_dlist(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
-
-	if (crtc->state->event) {
-		unsigned long flags;
-
-		crtc->state->event->pipe = drm_crtc_index(crtc);
-
-		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
-
-		spin_lock_irqsave(&dev->event_lock, flags);
-
-		if (!vc4_state->feed_txp || vc4_state->txp_armed) {
-			vc4_crtc->event = crtc->state->event;
-			crtc->state->event = NULL;
-		}
-
-		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
-			  vc4_state->mm.start);
-
-		spin_unlock_irqrestore(&dev->event_lock, flags);
-	} else {
-		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
-			  vc4_state->mm.start);
-	}
-}
-
 static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 				   struct drm_crtc_state *old_state)
 {
 	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
@@ -539,18 +408,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * drm_crtc_get_vblank() fails in vc4_crtc_update_dlist().
 	 */
 	drm_crtc_vblank_on(crtc);
-	vc4_crtc_update_dlist(crtc);
 
-	/* Turn on the scaler, which will wait for vstart to start
-	 * compositing.
-	 * When feeding the transposer, we should operate in oneshot
-	 * mode.
-	 */
-	HVS_WRITE(SCALER_DISPCTRLX(vc4_crtc->channel),
-		  VC4_SET_FIELD(mode->hdisplay, SCALER_DISPCTRLX_WIDTH) |
-		  VC4_SET_FIELD(mode->vdisplay, SCALER_DISPCTRLX_HEIGHT) |
-		  SCALER_DISPCTRLX_ENABLE |
-		  (vc4_state->feed_txp ? SCALER_DISPCTRLX_ONESHOT : 0));
+	vc4_hvs_atomic_enable(crtc, old_state);
 
 	/* When feeding the transposer block the pixelvalve is unneeded and
 	 * should not be enabled.
@@ -608,31 +467,11 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 				 struct drm_crtc_state *state)
 {
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(state);
-	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_plane *plane;
-	unsigned long flags;
-	const struct drm_plane_state *plane_state;
 	struct drm_connector *conn;
 	struct drm_connector_state *conn_state;
-	u32 dlist_count = 0;
 	int ret, i;
 
-	/* The pixelvalve can only feed one encoder (and encoders are
-	 * 1:1 with connectors.)
-	 */
-	if (hweight32(state->connector_mask) > 1)
-		return -EINVAL;
-
-	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state)
-		dlist_count += vc4_plane_dlist_size(plane_state);
-
-	dlist_count++; /* Account for SCALER_CTL0_END. */
-
-	spin_lock_irqsave(&vc4->hvs->mm_lock, flags);
-	ret = drm_mm_insert_node(&vc4->hvs->dlist_mm, &vc4_state->mm,
-				 dlist_count);
-	spin_unlock_irqrestore(&vc4->hvs->mm_lock, flags);
+	ret = vc4_hvs_atomic_check(crtc, state);
 	if (ret)
 		return ret;
 
@@ -661,89 +500,6 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static void vc4_crtc_atomic_flush(struct drm_crtc *crtc,
-				  struct drm_crtc_state *old_state)
-{
-	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
-	struct drm_plane *plane;
-	struct vc4_plane_state *vc4_plane_state;
-	bool debug_dump_regs = false;
-	bool enable_bg_fill = false;
-	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
-	u32 __iomem *dlist_next = dlist_start;
-
-	if (debug_dump_regs) {
-		DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
-		vc4_hvs_dump_state(dev);
-	}
-
-	/* Copy all the active planes' dlist contents to the hardware dlist. */
-	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		/* Is this the first active plane? */
-		if (dlist_next == dlist_start) {
-			/* We need to enable background fill when a plane
-			 * could be alpha blending from the background, i.e.
-			 * where no other plane is underneath. It suffices to
-			 * consider the first active plane here since we set
-			 * needs_bg_fill such that either the first plane
-			 * already needs it or all planes on top blend from
-			 * the first or a lower plane.
-			 */
-			vc4_plane_state = to_vc4_plane_state(plane->state);
-			enable_bg_fill = vc4_plane_state->needs_bg_fill;
-		}
-
-		dlist_next += vc4_plane_write_dlist(plane, dlist_next);
-	}
-
-	writel(SCALER_CTL0_END, dlist_next);
-	dlist_next++;
-
-	WARN_ON_ONCE(dlist_next - dlist_start != vc4_state->mm.size);
-
-	if (enable_bg_fill)
-		/* This sets a black background color fill, as is the case
-		 * with other DRM drivers.
-		 */
-		HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel),
-			  HVS_READ(SCALER_DISPBKGNDX(vc4_crtc->channel)) |
-			  SCALER_DISPBKGND_FILL);
-
-	/* Only update DISPLIST if the CRTC was already running and is not
-	 * being disabled.
-	 * vc4_crtc_enable() takes care of updating the dlist just after
-	 * re-enabling VBLANK interrupts and before enabling the engine.
-	 * If the CRTC is being disabled, there's no point in updating this
-	 * information.
-	 */
-	if (crtc->state->active && old_state->active)
-		vc4_crtc_update_dlist(crtc);
-
-	if (crtc->state->color_mgmt_changed) {
-		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(vc4_crtc->channel));
-
-		if (crtc->state->gamma_lut) {
-			vc4_crtc_update_gamma_lut(crtc);
-			dispbkgndx |= SCALER_DISPBKGND_GAMMA;
-		} else {
-			/* Unsetting DISPBKGND_GAMMA skips the gamma lut step
-			 * in hardware, which is the same as a linear lut that
-			 * DRM expects us to use in absence of a user lut.
-			 */
-			dispbkgndx &= ~SCALER_DISPBKGND_GAMMA;
-		}
-		HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel), dispbkgndx);
-	}
-
-	if (debug_dump_regs) {
-		DRM_INFO("CRTC %d HVS after:\n", drm_crtc_index(crtc));
-		vc4_hvs_dump_state(dev);
-	}
-}
-
 static int vc4_enable_vblank(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
@@ -1019,7 +775,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 	.mode_set_nofb = vc4_crtc_mode_set_nofb,
 	.mode_valid = vc4_crtc_mode_valid,
 	.atomic_check = vc4_crtc_atomic_check,
-	.atomic_flush = vc4_crtc_atomic_flush,
+	.atomic_flush = vc4_hvs_atomic_flush,
 	.atomic_enable = vc4_crtc_atomic_enable,
 	.atomic_disable = vc4_crtc_atomic_disable,
 	.get_scanout_position = vc4_crtc_get_scanout_position,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 9866d61bfa88..7912445dffe5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -857,6 +857,11 @@ void vc4_irq_reset(struct drm_device *dev);
 
 /* vc4_hvs.c */
 extern struct platform_driver vc4_hvs_driver;
+int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *state);
+void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
+void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_state *old_state);
+void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_state *state);
+void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc);
 void vc4_hvs_dump_state(struct drm_device *dev);
 void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel);
 void vc4_hvs_mask_underrun(struct drm_device *dev, int channel);
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 5a43659da319..a16affc8b741 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "vc4_drv.h"
 #include "vc4_regs.h"
@@ -154,6 +155,296 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
 	return 0;
 }
 
+static void vc4_hvs_lut_load(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	u32 i;
+
+	/* The LUT memory is laid out with each HVS channel in order,
+	 * each of which takes 256 writes for R, 256 for G, then 256
+	 * for B.
+	 */
+	HVS_WRITE(SCALER_GAMADDR,
+		  SCALER_GAMADDR_AUTOINC | 
+		  (vc4_crtc->channel * 3 * crtc->gamma_size));
+
+	for (i = 0; i < crtc->gamma_size; i++)
+		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_r[i]);
+	for (i = 0; i < crtc->gamma_size; i++)
+		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_g[i]);
+	for (i = 0; i < crtc->gamma_size; i++)
+		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_b[i]);
+}
+
+static void vc4_hvs_update_gamma_lut(struct drm_crtc *crtc)
+{
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct drm_color_lut *lut = crtc->state->gamma_lut->data;
+	u32 length = drm_color_lut_size(crtc->state->gamma_lut);
+	u32 i;
+
+	for (i = 0; i < length; i++) {
+		vc4_crtc->lut_r[i] = drm_color_lut_extract(lut[i].red, 8);
+		vc4_crtc->lut_g[i] = drm_color_lut_extract(lut[i].green, 8);
+		vc4_crtc->lut_b[i] = drm_color_lut_extract(lut[i].blue, 8);
+	}
+
+	vc4_hvs_lut_load(crtc);
+}
+
+int vc4_hvs_atomic_check(struct drm_crtc *crtc,
+			 struct drm_crtc_state *state)
+{
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(state);
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct drm_plane *plane;
+	unsigned long flags;
+	const struct drm_plane_state *plane_state;
+	u32 dlist_count = 0;
+	int ret;
+
+	/* The pixelvalve can only feed one encoder (and encoders are
+	 * 1:1 with connectors.)
+	 */
+	if (hweight32(state->connector_mask) > 1)
+		return -EINVAL;
+
+	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state)
+		dlist_count += vc4_plane_dlist_size(plane_state);
+
+	dlist_count++; /* Account for SCALER_CTL0_END. */
+
+	spin_lock_irqsave(&vc4->hvs->mm_lock, flags);
+	ret = drm_mm_insert_node(&vc4->hvs->dlist_mm, &vc4_state->mm,
+				 dlist_count);
+	spin_unlock_irqrestore(&vc4->hvs->mm_lock, flags);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+
+	if (crtc->state->event) {
+		unsigned long flags;
+
+		crtc->state->event->pipe = drm_crtc_index(crtc);
+
+		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+		spin_lock_irqsave(&dev->event_lock, flags);
+
+		if (!vc4_state->feed_txp || vc4_state->txp_armed) {
+			vc4_crtc->event = crtc->state->event;
+			crtc->state->event = NULL;
+		}
+
+		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
+			  vc4_state->mm.start);
+
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	} else {
+		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
+			  vc4_state->mm.start);
+	}
+}
+
+void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
+			   struct drm_crtc_state *old_state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	bool oneshot = vc4_state->feed_txp;
+	u32 dispctrl;
+
+	vc4_hvs_update_dlist(crtc);
+
+	/* Turn on the scaler, which will wait for vstart to start
+	 * compositing.
+	 * When feeding the transposer, we should operate in oneshot
+	 * mode.
+	 */
+	dispctrl = SCALER_DISPCTRLX_ENABLE;
+	dispctrl |= VC4_SET_FIELD(mode->hdisplay,
+				  SCALER_DISPCTRLX_WIDTH) |
+		    VC4_SET_FIELD(mode->vdisplay,
+				  SCALER_DISPCTRLX_HEIGHT) |
+		    (oneshot ? SCALER_DISPCTRLX_ONESHOT : 0);
+
+	HVS_WRITE(SCALER_DISPCTRLX(vc4_crtc->channel), dispctrl);
+}
+
+void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
+			    struct drm_crtc_state *old_state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	u32 chan = vc4_crtc->channel;
+
+	if (HVS_READ(SCALER_DISPCTRLX(chan)) &
+	    SCALER_DISPCTRLX_ENABLE) {
+		HVS_WRITE(SCALER_DISPCTRLX(chan),
+			  SCALER_DISPCTRLX_RESET);
+
+		/* While the docs say that reset is self-clearing, it
+		 * seems it doesn't actually.
+		 */
+		HVS_WRITE(SCALER_DISPCTRLX(chan), 0);
+	}
+
+	/* Once we leave, the scaler should be disabled and its fifo empty. */
+
+	WARN_ON_ONCE(HVS_READ(SCALER_DISPCTRLX(chan)) & SCALER_DISPCTRLX_RESET);
+
+	WARN_ON_ONCE(VC4_GET_FIELD(HVS_READ(SCALER_DISPSTATX(chan)),
+				   SCALER_DISPSTATX_MODE) !=
+		     SCALER_DISPSTATX_MODE_DISABLED);
+
+	WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
+		      (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
+		     SCALER_DISPSTATX_EMPTY);
+}
+
+void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
+			  struct drm_crtc_state *old_state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	struct drm_plane *plane;
+	struct vc4_plane_state *vc4_plane_state;
+	bool debug_dump_regs = false;
+	bool enable_bg_fill = false;
+	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
+	u32 __iomem *dlist_next = dlist_start;
+
+	if (debug_dump_regs) {
+		DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
+		vc4_hvs_dump_state(dev);
+	}
+
+	/* Copy all the active planes' dlist contents to the hardware dlist. */
+	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		/* Is this the first active plane? */
+		if (dlist_next == dlist_start) {
+			/* We need to enable background fill when a plane
+			 * could be alpha blending from the background, i.e.
+			 * where no other plane is underneath. It suffices to
+			 * consider the first active plane here since we set
+			 * needs_bg_fill such that either the first plane
+			 * already needs it or all planes on top blend from
+			 * the first or a lower plane.
+			 */
+			vc4_plane_state = to_vc4_plane_state(plane->state);
+			enable_bg_fill = vc4_plane_state->needs_bg_fill;
+		}
+
+		dlist_next += vc4_plane_write_dlist(plane, dlist_next);
+	}
+
+	writel(SCALER_CTL0_END, dlist_next);
+	dlist_next++;
+
+	WARN_ON_ONCE(dlist_next - dlist_start != vc4_state->mm.size);
+
+	if (enable_bg_fill)
+		/* This sets a black background color fill, as is the case
+		 * with other DRM drivers.
+		 */
+		HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel),
+			  HVS_READ(SCALER_DISPBKGNDX(vc4_crtc->channel)) |
+			  SCALER_DISPBKGND_FILL);
+
+	/* Only update DISPLIST if the CRTC was already running and is not
+	 * being disabled.
+	 * vc4_crtc_enable() takes care of updating the dlist just after
+	 * re-enabling VBLANK interrupts and before enabling the engine.
+	 * If the CRTC is being disabled, there's no point in updating this
+	 * information.
+	 */
+	if (crtc->state->active && old_state->active)
+		vc4_hvs_update_dlist(crtc);
+
+	if (crtc->state->color_mgmt_changed) {
+		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(vc4_crtc->channel));
+
+		if (crtc->state->gamma_lut) {
+			vc4_hvs_update_gamma_lut(crtc);
+			dispbkgndx |= SCALER_DISPBKGND_GAMMA;
+		} else {
+			/* Unsetting DISPBKGND_GAMMA skips the gamma lut step
+			 * in hardware, which is the same as a linear lut that
+			 * DRM expects us to use in absence of a user lut.
+			 */
+			dispbkgndx &= ~SCALER_DISPBKGND_GAMMA;
+		}
+		HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel), dispbkgndx);
+	}
+
+	if (debug_dump_regs) {
+		DRM_INFO("CRTC %d HVS after:\n", drm_crtc_index(crtc));
+		vc4_hvs_dump_state(dev);
+	}
+}
+
+void vc4_hvs_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
+
+	if (vc4_crtc->data->hvs_channel == 2) {
+		u32 dispctrl;
+		u32 dsp3_mux;
+
+		/*
+		 * SCALER_DISPCTRL_DSP3 = X, where X < 2 means 'connect DSP3 to
+		 * FIFO X'.
+		 * SCALER_DISPCTRL_DSP3 = 3 means 'disable DSP 3'.
+		 *
+		 * DSP3 is connected to FIFO2 unless the transposer is
+		 * enabled. In this case, FIFO 2 is directly accessed by the
+		 * TXP IP, and we need to disable the FIFO2 -> pixelvalve1
+		 * route.
+		 */
+		if (vc4_state->feed_txp)
+			dsp3_mux = VC4_SET_FIELD(3, SCALER_DISPCTRL_DSP3_MUX);
+		else
+			dsp3_mux = VC4_SET_FIELD(2, SCALER_DISPCTRL_DSP3_MUX);
+
+		dispctrl = HVS_READ(SCALER_DISPCTRL) &
+			   ~SCALER_DISPCTRL_DSP3_MUX_MASK;
+		HVS_WRITE(SCALER_DISPCTRL, dispctrl | dsp3_mux);
+	}
+
+	HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel),
+		  SCALER_DISPBKGND_AUTOHS |
+		  SCALER_DISPBKGND_GAMMA |
+		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
+
+	/* Reload the LUT, since the SRAMs would have been disabled if
+	 * all CRTCs had SCALER_DISPBKGND_GAMMA unset at once.
+	 */
+	vc4_hvs_lut_load(crtc);
+}
+
 void vc4_hvs_mask_underrun(struct drm_device *dev, int channel)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
