Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 490CC1E5993
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196396E46D;
	Thu, 28 May 2020 07:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CFA6E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 55FD8582061;
 Wed, 27 May 2020 11:50:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=tHJXz9GdDFM+q
 UJata9Tm38G+CLhTfZgLA2Sjesw0QU=; b=xNwLjLDaxz0Tnx29E4R1BLEZ45kPP
 Y4SV69XW1QCYLJ8NM/v9TY3XLy63sQmPXn8fhpTJmCynpDvK/Hbf7+mNQLsYbNk5
 TwqYyzMop+xSaWciJKfKQyF+5pBC/TxiGJYAc2IapPiOSjDvf/d2YW5ay/dqYbHe
 btxcltsLazunaicmaPy6KAT2dRe/YwvNB3pz8XQaQXDAYev7mMnF6Krl/XFzfbTn
 1ulJLv0yShSNgx5Ri7cFh+IvLxn1BMTjaavdDz8a2DZ3NRQuWe01XVamcCeA/gJo
 WS1Z1fznfW8I//9dtWVwFZGNzCU9f4THifcbW5ygc/G1jjCTcvG0y87OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=tHJXz9GdDFM+qUJata9Tm38G+CLhTfZgLA2Sjesw0QU=; b=AuwLu1pR
 NGQRwuoPIfQW7rMpAAylQrlZ3P7j4U0nhYNaghPMZgmVV3laZb3ITlpde/XVRFbq
 txX9izBjjchH/D1tOnMhw3WXYmE7oaa4eGtDoyBbCyHKS7YrTB9a+eIHKcUZff0p
 ciJDBVf02RG6eThwz5mhxwMNop7EDCphblex7qTYv8vGQM1FnFhKDI7yTkvDVYHD
 pM+fjh4jPcb3w/UOwPZ90KSD1CH3n62KtLr7HJ/PpnL7pQU9f67GKWTMDxP/qC9Z
 tM0su9GTjfwCI93nloYsIcPOPJvZ0Twx8u64nN6ZeI/GHjhF9VSkqj0SAFIdQ+ZZ
 985oz6xWSYpVtw==
X-ME-Sender: <xms:MozOXmzYN2rwZtcc8uD_ex8BbJmrGm4Z7nOdZS_8uZibqrNSb7mGDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MozOXiRKvtmcmhE9eOnemvXq199fTF4VOCXArAg4gPcHrqGpAWO_wQ>
 <xmx:MozOXoVBMjUdNMWIhl1E5BBo1fIP9Pf_tAapnKTtoOYhAm3SLGQKxw>
 <xmx:MozOXsjPws6pRqv67-lgpE7nslvdoQ8fi2d_Sxse0SS6K1fEJLm1YQ>
 <xmx:MozOXmClntAIo240Juncf-ELB_fgjEVsxnfaU7kNYGAXudSkGcAx5w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E97F430624E4;
 Wed, 27 May 2020 11:50:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 033/105] drm/vc4: crtc: Assign output to channel
 automatically
Date: Wed, 27 May 2020 17:48:03 +0200
Message-Id: <5186409a2b5d290b78f6b518a2eb8e407bf1e83e.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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

The HVS found in the BCM2711 has 6 outputs and 3 FIFOs, with each output
being connected to a pixelvalve, and some muxing between the FIFOs and
outputs.

Any output cannot feed from any FIFO though, and they all have a bunch of
constraints.

In order to support this, let's store the possible FIFOs each output can be
assigned to in the vc4_crtc_data, and use that information at atomic_check
time to iterate over all the CRTCs enabled and assign them FIFOs.

The channel assigned is then set in the vc4_crtc_state so that the rest of
the driver can use it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  37 +++++----
 drivers/gpu/drm/vc4/vc4_drv.h  |   7 +-
 drivers/gpu/drm/vc4/vc4_kms.c  | 142 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_regs.h |  10 ++-
 4 files changed, 172 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 580b37ad514d..a6c3f2f907bd 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -88,6 +88,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
 	unsigned int cob_size;
 	u32 val;
 	int fifo_lines;
@@ -104,7 +105,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	 * Read vertical scanline which is currently composed for our
 	 * pixelvalve by the HVS, and also the scaler status.
 	 */
-	val = HVS_READ(SCALER_DISPSTATX(vc4_crtc->channel));
+	val = HVS_READ(SCALER_DISPSTATX(vc4_crtc_state->assigned_channel));
 
 	/* Get optional system timestamp after query. */
 	if (etime)
@@ -124,7 +125,7 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 			*hpos += mode->crtc_htotal / 2;
 	}
 
-	cob_size = vc4_crtc_get_cob_allocation(vc4, vc4_crtc->channel);
+	cob_size = vc4_crtc_get_cob_allocation(vc4, vc4_crtc_state->assigned_channel);
 	/* This is the offset we need for translating hvs -> pv scanout pos. */
 	fifo_lines = cob_size / mode->crtc_hdisplay;
 
@@ -211,6 +212,7 @@ vc4_crtc_lut_load(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
 	u32 i;
 
 	/* The LUT memory is laid out with each HVS channel in order,
@@ -219,7 +221,7 @@ vc4_crtc_lut_load(struct drm_crtc *crtc)
 	 */
 	HVS_WRITE(SCALER_GAMADDR,
 		  SCALER_GAMADDR_AUTOINC |
-		  (vc4_crtc->channel * 3 * crtc->gamma_size));
+		  (vc4_crtc_state->assigned_channel * 3 * crtc->gamma_size));
 
 	for (i = 0; i < crtc->gamma_size; i++)
 		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_r[i]);
@@ -392,7 +394,7 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		drm_print_regset32(&p, &vc4_crtc->regset);
 	}
 
-	if (vc4_crtc->channel == 2) {
+	if (vc4_crtc->data->hvs_output == 2) {
 		u32 dispctrl;
 		u32 dsp3_mux;
 
@@ -419,7 +421,7 @@ static void vc4_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	if (!vc4_state->feed_txp)
 		vc4_crtc_config_pv(crtc);
 
-	HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel),
+	HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
 		  SCALER_DISPBKGND_AUTOHS |
 		  SCALER_DISPBKGND_GAMMA |
 		  (interlace ? SCALER_DISPBKGND_INTERLACE : 0));
@@ -451,7 +453,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
-	u32 chan = vc4_crtc->channel;
+	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(old_state);
+	u32 chan = vc4_crtc_state->assigned_channel;
 	int ret;
 	require_hvs_enabled(dev);
 
@@ -530,12 +533,12 @@ static void vc4_crtc_update_dlist(struct drm_crtc *crtc)
 			crtc->state->event = NULL;
 		}
 
-		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
+		HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
 			  vc4_state->mm.start);
 
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 	} else {
-		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
+		HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
 			  vc4_state->mm.start);
 	}
 }
@@ -584,7 +587,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 			    (vc4_state->feed_txp ?
 					SCALER5_DISPCTRLX_ONESHOT : 0);
 
-	HVS_WRITE(SCALER_DISPCTRLX(vc4_crtc->channel), dispctrl);
+	HVS_WRITE(SCALER_DISPCTRLX(vc4_state->assigned_channel), dispctrl);
 
 	/* When feeding the transposer block the pixelvalve is unneeded and
 	 * should not be enabled.
@@ -700,7 +703,6 @@ static void vc4_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	struct drm_plane *plane;
 	struct vc4_plane_state *vc4_plane_state;
@@ -742,8 +744,8 @@ static void vc4_crtc_atomic_flush(struct drm_crtc *crtc,
 		/* This sets a black background color fill, as is the case
 		 * with other DRM drivers.
 		 */
-		HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel),
-			  HVS_READ(SCALER_DISPBKGNDX(vc4_crtc->channel)) |
+		HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
+			  HVS_READ(SCALER_DISPBKGNDX(vc4_state->assigned_channel)) |
 			  SCALER_DISPBKGND_FILL);
 
 	/* Only update DISPLIST if the CRTC was already running and is not
@@ -757,7 +759,7 @@ static void vc4_crtc_atomic_flush(struct drm_crtc *crtc,
 		vc4_crtc_update_dlist(crtc);
 
 	if (crtc->state->color_mgmt_changed) {
-		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(vc4_crtc->channel));
+		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(vc4_state->assigned_channel));
 
 		if (crtc->state->gamma_lut) {
 			vc4_crtc_update_gamma_lut(crtc);
@@ -769,7 +771,7 @@ static void vc4_crtc_atomic_flush(struct drm_crtc *crtc,
 			 */
 			dispbkgndx &= ~SCALER_DISPBKGND_GAMMA;
 		}
-		HVS_WRITE(SCALER_DISPBKGNDX(vc4_crtc->channel), dispbkgndx);
+		HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel), dispbkgndx);
 	}
 
 	if (debug_dump_regs) {
@@ -800,7 +802,7 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
-	u32 chan = vc4_crtc->channel;
+	u32 chan = vc4_state->assigned_channel;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -999,6 +1001,7 @@ static struct drm_crtc_state *vc4_crtc_duplicate_state(struct drm_crtc *crtc)
 	old_vc4_state = to_vc4_crtc_state(crtc->state);
 	vc4_state->feed_txp = old_vc4_state->feed_txp;
 	vc4_state->margins = old_vc4_state->margins;
+	vc4_state->assigned_channel = old_vc4_state->assigned_channel;
 
 	__drm_atomic_helper_crtc_duplicate_state(crtc, &vc4_state->base);
 	return &vc4_state->base;
@@ -1060,6 +1063,7 @@ static const struct drm_crtc_helper_funcs vc4_crtc_helper_funcs = {
 };
 
 static const struct vc4_crtc_data bcm2835_pv0_data = {
+	.hvs_available_channels = BIT(0),
 	.hvs_output = 0,
 	.debugfs_name = "crtc0_regs",
 	.pixels_per_clock = 1,
@@ -1070,6 +1074,7 @@ static const struct vc4_crtc_data bcm2835_pv0_data = {
 };
 
 static const struct vc4_crtc_data bcm2835_pv1_data = {
+	.hvs_available_channels = BIT(2),
 	.hvs_output = 2,
 	.debugfs_name = "crtc1_regs",
 	.pixels_per_clock = 1,
@@ -1080,6 +1085,7 @@ static const struct vc4_crtc_data bcm2835_pv1_data = {
 };
 
 static const struct vc4_crtc_data bcm2835_pv2_data = {
+	.hvs_available_channels = BIT(1),
 	.hvs_output = 1,
 	.debugfs_name = "crtc2_regs",
 	.pixels_per_clock = 1,
@@ -1171,7 +1177,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
 				  &vc4_crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, &vc4_crtc_helper_funcs);
-	vc4_crtc->channel = vc4_crtc->data->hvs_output;
 	drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
 	drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 9d120aae4af9..73156a53822f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -450,6 +450,9 @@ to_vc4_encoder(struct drm_encoder *encoder)
 }
 
 struct vc4_crtc_data {
+	/* Which channels of the HVS can the output source from */
+	unsigned int hvs_available_channels;
+
 	/* Which output of the HVS this pixelvalve sources from. */
 	int hvs_output;
 
@@ -469,9 +472,6 @@ struct vc4_crtc {
 	/* Timestamp at start of vblank irq - unaffected by lock delays. */
 	ktime_t t_vblank;
 
-	/* Which HVS channel we're using for our CRTC. */
-	int channel;
-
 	u8 lut_r[256];
 	u8 lut_g[256];
 	u8 lut_b[256];
@@ -493,6 +493,7 @@ struct vc4_crtc_state {
 	struct drm_mm_node mm;
 	bool feed_txp;
 	bool txp_armed;
+	unsigned int assigned_channel;
 
 	struct {
 		unsigned int left;
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 29b75b60d858..db00625c61dd 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -11,6 +11,8 @@
  * crtc, HDMI encoder).
  */
 
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 
 #include <drm/drm_atomic.h>
@@ -146,6 +148,72 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 		  VC4_SET_FIELD(ctm_state->fifo, SCALER_OLEDOFFS_DISPFIFO));
 }
 
+static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
+				     struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned char dsp2_mux = 0;
+	unsigned char dsp3_mux = 3;
+	unsigned char dsp4_mux = 3;
+	unsigned char dsp5_mux = 3;
+	unsigned int i;
+	u32 reg;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
+		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+
+		if (!crtc_state->active)
+			continue;
+
+		switch (vc4_crtc->data->hvs_output) {
+		case 2:
+			dsp2_mux = (vc4_state->assigned_channel == 2) ? 0 : 1;
+			break;
+
+		case 3:
+			dsp3_mux = vc4_state->assigned_channel;
+			break;
+
+		case 4:
+			dsp4_mux = vc4_state->assigned_channel;
+			break;
+
+		case 5:
+			dsp5_mux = vc4_state->assigned_channel;
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	reg = HVS_READ(SCALER_DISPECTRL);
+	if (FIELD_GET(SCALER_DISPECTRL_DSP2_MUX_MASK, reg) != dsp2_mux)
+		HVS_WRITE(SCALER_DISPECTRL,
+			  (reg & ~SCALER_DISPECTRL_DSP2_MUX_MASK) |
+			  VC4_SET_FIELD(dsp2_mux, SCALER_DISPECTRL_DSP2_MUX));
+
+	reg = HVS_READ(SCALER_DISPCTRL);
+	if (FIELD_GET(SCALER_DISPCTRL_DSP3_MUX_MASK, reg) != dsp3_mux)
+		HVS_WRITE(SCALER_DISPCTRL,
+			  (reg & ~SCALER_DISPCTRL_DSP3_MUX_MASK) |
+			  VC4_SET_FIELD(dsp3_mux, SCALER_DISPCTRL_DSP3_MUX));
+
+	reg = HVS_READ(SCALER_DISPEOLN);
+	if (FIELD_GET(SCALER_DISPEOLN_DSP4_MUX_MASK, reg) != dsp4_mux)
+		HVS_WRITE(SCALER_DISPEOLN,
+			  (reg & ~SCALER_DISPEOLN_DSP4_MUX_MASK) |
+			  VC4_SET_FIELD(dsp4_mux, SCALER_DISPEOLN_DSP4_MUX));
+
+	reg = HVS_READ(SCALER_DISPDITHER);
+	if (FIELD_GET(SCALER_DISPDITHER_DSP5_MUX_MASK, reg) != dsp5_mux)
+		HVS_WRITE(SCALER_DISPDITHER,
+			  (reg & ~SCALER_DISPDITHER_DSP5_MUX_MASK) |
+			  VC4_SET_FIELD(dsp5_mux, SCALER_DISPDITHER_DSP5_MUX));
+}
+
 static void
 vc4_atomic_complete_commit(struct drm_atomic_state *state)
 {
@@ -156,11 +224,15 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 	int i;
 
 	for (i = 0; i < dev->mode_config.num_crtc; i++) {
-		if (!state->crtcs[i].ptr || !state->crtcs[i].commit)
+		struct __drm_crtcs_state *_state = &state->crtcs[i];
+		struct vc4_crtc_state *vc4_crtc_state;
+
+		if (!_state->ptr || !_state->commit)
 			continue;
 
-		vc4_crtc = to_vc4_crtc(state->crtcs[i].ptr);
-		vc4_hvs_mask_underrun(dev, vc4_crtc->channel);
+		vc4_crtc = to_vc4_crtc(_state->ptr);
+		vc4_crtc_state = to_vc4_crtc_state(_state->state);
+		vc4_hvs_mask_underrun(dev, vc4_crtc_state->assigned_channel);
 	}
 
 	clk_set_rate(hvs->core_clk, 500000000);
@@ -172,6 +244,7 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	vc4_ctm_commit(vc4, state);
+	vc4_hvs_pv_muxing_commit(vc4, state);
 
 	drm_atomic_helper_commit_planes(dev, state, 0);
 
@@ -381,8 +454,11 @@ vc4_ctm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 
 		/* CTM is being enabled or the matrix changed. */
 		if (new_crtc_state->ctm) {
+			struct vc4_crtc_state *vc4_crtc_state =
+				to_vc4_crtc_state(new_crtc_state);
+
 			/* fifo is 1-based since 0 disables CTM. */
-			int fifo = to_vc4_crtc(crtc)->channel + 1;
+			int fifo = vc4_crtc_state->assigned_channel + 1;
 
 			/* Check userland isn't trying to turn on CTM for more
 			 * than one CRTC at a time.
@@ -495,10 +571,66 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 	.atomic_destroy_state = vc4_load_tracker_destroy_state,
 };
 
+#define NUM_OUTPUTS  6
+#define NUM_CHANNELS 3
+
 static int
 vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
-	int ret;
+	unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	int i, ret;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct vc4_crtc_state *vc4_crtc_state =
+			to_vc4_crtc_state(crtc_state);
+		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+		bool is_assigned = false;
+		unsigned int channel;
+
+		if (!crtc_state->active)
+			continue;
+
+		/*
+		 * The problem we have to solve here is that we have
+		 * up to 7 encoders, connected to up to 6 CRTCs.
+		 *
+		 * Those CRTCs, depending on the instance, can be
+		 * routed to 1, 2 or 3 HVS FIFOs, and we need to set
+		 * the change the muxing between FIFOs and outputs in
+		 * the HVS accordingly.
+		 *
+		 * It would be pretty hard to come up with an
+		 * algorithm that would generically solve
+		 * this. However, the current routing trees we support
+		 * allow us to simplify a bit the problem.
+		 *
+		 * Indeed, with the current supported layouts, if we
+		 * try to assign in the ascending crtc index order the
+		 * FIFOs, we can't fall into the situation where an
+		 * earlier CRTC that had multiple routes is assigned
+		 * one that was the only option for a later CRTC.
+		 *
+		 * If the layout changes and doesn't give us that in
+		 * the future, we will need to have something smarter,
+		 * but it works so far.
+		 */
+		for_each_set_bit(channel, &unassigned_channels,
+				 sizeof(unassigned_channels)) {
+
+			if (!(BIT(channel) & vc4_crtc->data->hvs_available_channels))
+				continue;
+
+			vc4_crtc_state->assigned_channel = channel;
+			unassigned_channels &= ~BIT(channel);
+			is_assigned = true;
+			break;
+		}
+
+		if (!is_assigned)
+			return -EINVAL;
+	}
 
 	ret = vc4_ctm_atomic_check(dev, state);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 8a51baf681fe..b96ebbb1354b 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -287,9 +287,19 @@
 
 #define SCALER_DISPID                           0x00000008
 #define SCALER_DISPECTRL                        0x0000000c
+# define SCALER_DISPECTRL_DSP2_MUX_SHIFT	31
+# define SCALER_DISPECTRL_DSP2_MUX_MASK		VC4_MASK(31, 31)
+
 #define SCALER_DISPPROF                         0x00000010
+
 #define SCALER_DISPDITHER                       0x00000014
+# define SCALER_DISPDITHER_DSP5_MUX_SHIFT	30
+# define SCALER_DISPDITHER_DSP5_MUX_MASK	VC4_MASK(31, 30)
+
 #define SCALER_DISPEOLN                         0x00000018
+# define SCALER_DISPEOLN_DSP4_MUX_SHIFT		30
+# define SCALER_DISPEOLN_DSP4_MUX_MASK		VC4_MASK(31, 30)
+
 #define SCALER_DISPLIST0                        0x00000020
 #define SCALER_DISPLIST1                        0x00000024
 #define SCALER_DISPLIST2                        0x00000028
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
