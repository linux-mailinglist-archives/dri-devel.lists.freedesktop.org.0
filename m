Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7DE1B7FDC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971666EB1D;
	Fri, 24 Apr 2020 20:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796A289F38
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 7DA97143F;
 Fri, 24 Apr 2020 11:37:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dA0KGhhN9Fnl6
 AR6UfE1zwW68VxpNN/Mox/iSeKssT0=; b=UeQqtpK/FB1aSwsnMvF18fSiiLQzi
 L02glKNAa4ntYg+uEkBuGQScrasK6j30o0sgVp7WZjlidIF1emQtyfraxdO2Jp5W
 ALjNlHdpiX3hZ47qNjcdgCQ3a6l7fKiBg7bSxXN21sqrxQAbGg1fx0xQMldhdOHM
 h0lodCWcSBiL6oD5PHtmIGOeXgMeLj12rthx3ycz/4Gy+nqrqhx+0uHQ/ZEvwNCk
 4vJlhepR/SepvEeO1jY0b5Y/Nc+FAKFiBokgXZilApa4METKIVyTRH4X1cGWuCr0
 0R4Erc7PuqREIvodAWer2cHYUClSoCbR3vamRaS/aN8N5BgRTHj2iCRYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dA0KGhhN9Fnl6AR6UfE1zwW68VxpNN/Mox/iSeKssT0=; b=cRn8k2OI
 dveckqzm+JPttANfYXvEz5wDPbaVhtgSRhklTJrNoutlcC9IUmlwlB6NLfZHX24T
 J4aTA97iWTAQtoSvQ8Qo+T/kQJUuvg3q78P8fCF03/Xnqjp8IyLgVVzYdC8r3+Jt
 ZMhqL7ib/iml94eZr5/30v7AJIkpQ7hkNP3NsdjGLCxTIGFWBk6oRq51rTHi3btH
 hOkICcggnm/e1oMVe+DK6iUpJ5/FIV/NyPDnsaxM6dNf3dCzqyKIEBBQAJjPRg5S
 R6LdbT4xTVVBbD8rNpl5cWHo6lPcP6IP83+pbmUpg8N7DbtoIKBn+oOixqBZqgYG
 GoxcD26S97V/XA==
X-ME-Sender: <xms:pQejXkrGH-oWhFNO2TSY_SbNoNDqTXYslPLzYVx7e9OMuPmn5n1zMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeeiheenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pQejXu7eCtWRKv9iupN8fRMlm5Fx9YIsdXTvJId5edNWm8e4eD1qSQ>
 <xmx:pQejXkOs_SLnUahWapLW-xjTgU2f8onR4LHj97EWqZmd7dCSVk3pZg>
 <xmx:pQejXgOUicW1dNesuKGMfo4LPxrL3PkyEI87uAGumFc_fJdmtIohaw>
 <xmx:pgejXl2bg0O336rgg5eG_dxi3fxq8T1Um6bTomGtHVB2BzsiPhbM2vZFv6I>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACAC33065CDA;
 Fri, 24 Apr 2020 11:37:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 77/91] drm/vc4: hdmi: Add a CSC setup callback
Date: Fri, 24 Apr 2020 17:34:58 +0200
Message-Id: <0cbfd36e8134b11a92688b969ce73297b01d8dbb.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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

Similarly to the previous patches, the CSC setup is slightly different in
the BCM2711 than in the previous generations. Let's add a callback for it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 142 +++++++++++++++++++---------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |   7 ++-
 2 files changed, 89 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 189c88d3b06e..b3a98a17f8f8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -336,12 +336,44 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 		DRM_ERROR("Failed to release power domain: %d\n", ret);
 }
 
-static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
+static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
+{
+	u32 csc_ctl;
+
+	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
+				VC4_HD_CSC_CTL_ORDER);
+
+	if (enable) {
+		/* CEA VICs other than #1 requre limited range RGB
+		 * output unless overridden by an AVI infoframe.
+		 * Apply a colorspace conversion to squash 0-255 down
+		 * to 16-235.  The matrix here is:
+		 *
+		 * [ 0      0      0.8594 16]
+		 * [ 0      0.8594 0      16]
+		 * [ 0.8594 0      0      16]
+		 * [ 0      0      0       1]
+		 */
+		csc_ctl |= VC4_HD_CSC_CTL_ENABLE;
+		csc_ctl |= VC4_HD_CSC_CTL_RGB2YCC;
+		csc_ctl |= VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
+					 VC4_HD_CSC_CTL_MODE);
+
+		HDMI_WRITE(HDMI_CSC_12_11, (0x000 << 16) | 0x000);
+		HDMI_WRITE(HDMI_CSC_14_13, (0x100 << 16) | 0x6e0);
+		HDMI_WRITE(HDMI_CSC_22_21, (0x6e0 << 16) | 0x000);
+		HDMI_WRITE(HDMI_CSC_24_23, (0x100 << 16) | 0x000);
+		HDMI_WRITE(HDMI_CSC_32_31, (0x000 << 16) | 0x6e0);
+		HDMI_WRITE(HDMI_CSC_34_33, (0x100 << 16) | 0x000);
+	}
+
+	/* The RGB order applies even when CSC is disabled. */
+	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
+}
+
+static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
+				 struct drm_display_mode *mode)
 {
-	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
-	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
-	bool debug_dump_regs = false;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
@@ -359,7 +391,41 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
-	u32 csc_ctl;
+
+	HDMI_WRITE(HDMI_HORZA,
+		   (vsync_pos ? VC4_HDMI_HORZA_VPOS : 0) |
+		   (hsync_pos ? VC4_HDMI_HORZA_HPOS : 0) |
+		   VC4_SET_FIELD(mode->hdisplay * pixel_rep,
+				 VC4_HDMI_HORZA_HAP));
+
+	HDMI_WRITE(HDMI_HORZB,
+		   VC4_SET_FIELD((mode->htotal -
+				  mode->hsync_end) * pixel_rep,
+				 VC4_HDMI_HORZB_HBP) |
+		   VC4_SET_FIELD((mode->hsync_end -
+				  mode->hsync_start) * pixel_rep,
+				 VC4_HDMI_HORZB_HSP) |
+		   VC4_SET_FIELD((mode->hsync_start -
+				  mode->hdisplay) * pixel_rep,
+				 VC4_HDMI_HORZB_HFP));
+
+	HDMI_WRITE(HDMI_VERTA0, verta);
+	HDMI_WRITE(HDMI_VERTA1, verta);
+
+	HDMI_WRITE(HDMI_VERTB0, vertb_even);
+	HDMI_WRITE(HDMI_VERTB1, vertb);
+
+	HDMI_WRITE(HDMI_VID_CTL,
+		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
+		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
+}
+
+static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
+{
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	bool debug_dump_regs = false;
 	int ret;
 
 	ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
@@ -403,68 +469,22 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 		   VC4_HDMI_SCHEDULER_CONTROL_MANUAL_FORMAT |
 		   VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
 
-	HDMI_WRITE(HDMI_HORZA,
-		   (vsync_pos ? VC4_HDMI_HORZA_VPOS : 0) |
-		   (hsync_pos ? VC4_HDMI_HORZA_HPOS : 0) |
-		   VC4_SET_FIELD(mode->hdisplay * pixel_rep,
-				 VC4_HDMI_HORZA_HAP));
-
-	HDMI_WRITE(HDMI_HORZB,
-		   VC4_SET_FIELD((mode->htotal -
-				  mode->hsync_end) * pixel_rep,
-				 VC4_HDMI_HORZB_HBP) |
-		   VC4_SET_FIELD((mode->hsync_end -
-				  mode->hsync_start) * pixel_rep,
-				 VC4_HDMI_HORZB_HSP) |
-		   VC4_SET_FIELD((mode->hsync_start -
-				  mode->hdisplay) * pixel_rep,
-				 VC4_HDMI_HORZB_HFP));
-
-	HDMI_WRITE(HDMI_VERTA0, verta);
-	HDMI_WRITE(HDMI_VERTA1, verta);
-
-	HDMI_WRITE(HDMI_VERTB0, vertb_even);
-	HDMI_WRITE(HDMI_VERTB1, vertb);
-
-	HDMI_WRITE(HDMI_VID_CTL,
-		   (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
-		   (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
-
-	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
-				VC4_HD_CSC_CTL_ORDER);
+	if (vc4_hdmi->variant->set_timings)
+		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
 
 	if (vc4_encoder->hdmi_monitor &&
-	    drm_default_rgb_quant_range(mode) ==
-	    HDMI_QUANTIZATION_RANGE_LIMITED) {
-		/* CEA VICs other than #1 requre limited range RGB
-		 * output unless overridden by an AVI infoframe.
-		 * Apply a colorspace conversion to squash 0-255 down
-		 * to 16-235.  The matrix here is:
-		 *
-		 * [ 0      0      0.8594 16]
-		 * [ 0      0.8594 0      16]
-		 * [ 0.8594 0      0      16]
-		 * [ 0      0      0       1]
-		 */
-		csc_ctl |= VC4_HD_CSC_CTL_ENABLE;
-		csc_ctl |= VC4_HD_CSC_CTL_RGB2YCC;
-		csc_ctl |= VC4_SET_FIELD(VC4_HD_CSC_CTL_MODE_CUSTOM,
-					 VC4_HD_CSC_CTL_MODE);
+	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
+		if (vc4_hdmi->variant->csc_setup)
+			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
 
-		HDMI_WRITE(HDMI_CSC_12_11, (0x000 << 16) | 0x000);
-		HDMI_WRITE(HDMI_CSC_14_13, (0x100 << 16) | 0x6e0);
-		HDMI_WRITE(HDMI_CSC_22_21, (0x6e0 << 16) | 0x000);
-		HDMI_WRITE(HDMI_CSC_24_23, (0x100 << 16) | 0x000);
-		HDMI_WRITE(HDMI_CSC_32_31, (0x000 << 16) | 0x6e0);
-		HDMI_WRITE(HDMI_CSC_34_33, (0x100 << 16) | 0x000);
 		vc4_encoder->limited_rgb_range = true;
 	} else {
+		if (vc4_hdmi->variant->csc_setup)
+			vc4_hdmi->variant->csc_setup(vc4_hdmi, false);
+
 		vc4_encoder->limited_rgb_range = false;
 	}
 
-	/* The RGB order applies even when CSC is disabled. */
-	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
-
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 
 	if (debug_dump_regs) {
@@ -1423,7 +1443,9 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
 	.init_resources		= vc4_hdmi_init_resources,
+	.csc_setup		= vc4_hdmi_csc_setup,
 	.reset			= vc4_hdmi_reset,
+	.set_timings		= vc4_hdmi_set_timings,
 	.phy_init		= vc4_hdmi_phy_init,
 	.phy_disable		= vc4_hdmi_phy_disable,
 	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 9ae4d2c5a4f0..4a67d62aef53 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -41,6 +41,13 @@ struct vc4_hdmi_variant {
 	/* Callback to reset the HDMI block */
 	void (*reset)(struct vc4_hdmi *vc4_hdmi);
 
+	/* Callback to enable / disable the CSC */
+	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
+
+	/* Callback to configure the video timings in the HDMI block */
+	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
+			    struct drm_display_mode *mode);
+
 	/* Callback to initialize the PHY according to the mode */
 	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
 			 struct drm_display_mode *mode);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
