Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3216A2CA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561816E3E3;
	Mon, 24 Feb 2020 09:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9686E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:10:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 4493764A;
 Mon, 24 Feb 2020 04:10:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=f23s5LtUPpWk9
 1fNarGn9mwa2qYlTUm0iFAnmaL3yBc=; b=sA8Fvznc57wpG+poIynFpxciivib4
 WOWNyUEAveG92r9FkUDkuBZ2+d9BN21ewCZPoZItfRRTOc7Iv24rnqNt4d3ffXXu
 OeBNQXTR2w25mnhTfhMh6Gn3PtSWIPJhbWZwwIxZRoEiL+MY5NGHL4mCUP2Bq43u
 YOB70CQ0/nI3gDJHLmRNgnx95REF1E29E2PwWoRrA3XZZX/7kHiwA79OkfqONq9d
 ACQpRw6gkz8lVygQWOXTAeIm4SdgGCuyrdNXEzcJrf2CXf3ZZqal8dpmJbFjM90J
 iBfcQcPrbN+xm4DibSuhyeZchKWGfp0UaQ7NiG0y9wEcHWWSfIWZAJ3Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=f23s5LtUPpWk91fNarGn9mwa2qYlTUm0iFAnmaL3yBc=; b=L7nAKSp3
 Ov5VTao6YYh9VzLM4uFw0JnK8s1fsVJjv2gObz2AIuZYeLmvlkC9QMBmb1mYht1u
 E9kHxvE8h0nN4e3DdqlO5Nn3v7sngMefoCnbBfT08A2ku1HxBMAMd4a2UB4ms4dm
 batXIQpxdrfO8RHU1o6ZbSnsnJs8Ren7ukEYeT/eKeRha++n9EE51HQROqQmOXUT
 /lQ8pbK2Q1VxYUJvMFzaSFekpZs2UrgSnaTVVGtRZ0b+s6lfipowmM4jmb/WpJTC
 rLWtvXzjRLvSyhfs21HruBaEeVdNuGvjt0DGG0AWEaJXfZGU1dZL99cXCU8G0O77
 RyBBeR2mvfVhrg==
X-ME-Sender: <xms:EZNTXsjOv40Pj0gSpdNXK6kSUYVgY5Jckfsbfp1TAjwFPAWlqaj4DA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepudegnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EZNTXmm32Yc12LVtZqZp-C8n4Ni_R1t8bENxYspHWceDcqDyX8-kDg>
 <xmx:EZNTXqZUEw0TMy-EtMw4ONSLt5e2Kh1_L15aWM_huHUvr_kbkj1vqw>
 <xmx:EZNTXpFn9l8_oVVgMO-Z_49TGCNW1YhROfp910c8gzjx0_lk2zb4YA>
 <xmx:EZNTXg9iQQcRbtvqXcC0sDsVOoZqWzVHH46GgaqQj1_dh6VXbXGd9Yy-tGE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 80161328005A;
 Mon, 24 Feb 2020 04:10:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 78/89] drm/vc4: hdmi: Add a set_timings callback
Date: Mon, 24 Feb 2020 10:07:20 +0100
Message-Id: <a07716498186ab32e26c6f918ee7f9dbf84d1025.1582533919.git-series.maxime@cerno.tech>
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
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similarly to the previous patches, the timings setup in the HDMI controller
of the BCM2711 is slightly different, mostly because it supports higher
resolutions and thus needed more spaces for the various timings, resulting
in the register layout changing.

Let's add a callback for that as well.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 71 +++++++++++++++++++----------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  4 ++-
 2 files changed, 44 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 405019118a20..98198ece8db8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -371,12 +371,9 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
 }
 
-static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
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
@@ -394,6 +391,41 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
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
+		 (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
+		 (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
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
@@ -437,32 +469,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
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
-		 (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
-		 (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
+	if (vc4_hdmi->variant->set_timings)
+		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
 
 	if (vc4_encoder->hdmi_monitor &&
 	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
@@ -1425,6 +1433,7 @@ struct vc4_hdmi_variant bcm2835_variant = {
 	.init_resources		= vc4_hdmi_init_resources,
 	.csc_setup		= vc4_hdmi_csc_setup,
 	.reset			= vc4_hdmi_reset,
+	.set_timings		= vc4_hdmi_set_timings,
 	.phy_init		= vc4_hdmi_phy_init,
 	.phy_disable		= vc4_hdmi_phy_disable,
 	.phy_rng_enable		= vc4_hdmi_phy_rng_enable,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 22669e07b22e..4a67d62aef53 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -44,6 +44,10 @@ struct vc4_hdmi_variant {
 	/* Callback to enable / disable the CSC */
 	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
 
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
