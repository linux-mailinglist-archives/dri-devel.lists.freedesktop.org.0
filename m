Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075005485E0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22E010E863;
	Mon, 13 Jun 2022 14:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480B510E861
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 08811320097C;
 Mon, 13 Jun 2022 10:49:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 13 Jun 2022 10:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131787; x=1655218187; bh=66
 39jScZlSSkOyLk+DX94oh9VF0J8BsOTvk9hbHAhEs=; b=NXaifQ5i6mxSB4dYtk
 g7Rr8T0sh0lpAJcsj8gD3PtXjqZYQdqZqFuiKdGykwB0kg6p07a8QZxjzpyt1h7P
 Ge4IPr8dY5BOdfU2WuhsYR22wEH+3bhv3vcOKwLYqBbS3QTpUruBaV3cW/GN+hDA
 5W9f9rURlPbVoMypZWpiGcBE0Wk5s2XcBWs2Gnfsldr88vL0BAFoh9TPgCX+hUYm
 L8KP8vqGeW2O5GrrmOOe8YNaYq/9WcHLLzVFdTSd9r+xIlnWlPbG3K+fpCtruQlE
 EOk8/0jaUW6NNHN1uw1gtMBfk1yOYbpC5gfiEnvD69BtpQCx4gNnLkLGceFlsZX5
 ZB6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131787; x=1655218187; bh=6639jScZlSSkO
 yLk+DX94oh9VF0J8BsOTvk9hbHAhEs=; b=FHVAboe4q8B8UVrE4rR4mvp2Vdw9l
 THr4x/JgorVqU8N1IMbZknZw6I/iMfor9hsrqS17aFhNsE7ZeL1VlU49Y1v98prS
 neqzbAGQ5oCjxlqU/O+9gx8iGEihnxQCxAOgq3gjr9w6FM3SYv3jkfrBjy3kHoCj
 Gof6ySzPacXrzDvuXOmkwtIBCbM2TrfgEZuLsJnZITQOiDFzDpasno7GLnxnTs2K
 qdePBbwD8N7y4rV0T1A/UlnXZ+Hu0hPtIoM9yqH4z190fa7i+g/kWxp7qyRU2GdU
 zweUWPu5h3yEFR5WT2wcLydLA0//bQvX1t/T4vV63DW3sDFEBK9ZiwKWA==
X-ME-Sender: <xms:i06nYoa0yFG2IgCLvdw4LqlYAVN4CEV2VQr-xF8i4QGEngG2oIQcgA>
 <xme:i06nYjZdIwwyqG0qri1_2l_l8v-ydSdBGXXvTgJxpvdpVG1EODw6q2j9MDIqxYnwH
 R7ZrCBnlDaUj60YAzs>
X-ME-Received: <xmr:i06nYi-M9ak6RwpWJatTM5aZgBu5GRPpJGRI2vBkf6oexLyM5icfl3Dvw8b7mabLPefifjvw2vb-ToFxxLhjcCiv_IMBduyZWgE3dZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:i06nYipWtjv6qPTBOcjdh6Sz5mJUeDWOIa-M72HZqrwThHsOco48Jg>
 <xmx:i06nYjowCFXnGdI1CxsdmcMfamqtf6oX-iZ7zXAyvQj5DKRDU5Kj5w>
 <xmx:i06nYgRBL9JldVPnGLIfr2rSHq6SeOepl0WRNN8DSV3Znsc1D3iFzw>
 <xmx:i06nYkAPsJaLNR8JDD-L_DWqUkZ0FVUWsMPRF9US8Ud1hrsyDzMyNw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 33/33] drm/vc4: hdmi: Move pixel doubling from Pixelvalve to
 HDMI block
Date: Mon, 13 Jun 2022 16:48:00 +0200
Message-Id: <20220613144800.326124-34-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

With the change to 2 pixels/clock, the pixel doubling in the PV
results in doubling each pair of pixels, ie ABABCDCD instead of
AABBCCDD.

Move the pixel doubling to the HDMI block, however this means
that DBLCLK modes now fall foul of requiring even values for
all the horizontal timing parameters.
As both 480i and 576i fail this, attempt to fix up DBLCLK modes
that have odd timings values.

Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  4 +++-
 drivers/gpu/drm/vc4/vc4_hdmi.c | 34 ++++++++++++++++++++++++++++------
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e4e8c8a4c804..bf8f84b87580 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -316,7 +316,9 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
-	u32 pixel_rep = (mode->flags & DRM_MODE_FLAG_DBLCLK) ? 2 : 1;
+	bool is_hdmi = vc4_encoder->type == VC4_ENCODER_TYPE_HDMI0 ||
+		       vc4_encoder->type == VC4_ENCODER_TYPE_HDMI1;
+	u32 pixel_rep = ((mode->flags & DRM_MODE_FLAG_DBLCLK) && !is_hdmi) ? 2 : 1;
 	bool is_dsi = (vc4_encoder->type == VC4_ENCODER_TYPE_DSI0 ||
 		       vc4_encoder->type == VC4_ENCODER_TYPE_DSI1);
 	bool is_dsi1 = vc4_encoder->type == VC4_ENCODER_TYPE_DSI1;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 75cba7edaf51..5075f9cbab02 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -78,6 +78,8 @@
 #define VC5_HDMI_VERTB_VSPO_SHIFT		16
 #define VC5_HDMI_VERTB_VSPO_MASK		VC4_MASK(29, 16)
 
+#define VC4_HDMI_MISC_CONTROL_PIXEL_REP_SHIFT	0
+#define VC4_HDMI_MISC_CONTROL_PIXEL_REP_MASK	VC4_MASK(3, 0)
 #define VC5_HDMI_MISC_CONTROL_PIXEL_REP_SHIFT	0
 #define VC5_HDMI_MISC_CONTROL_PIXEL_REP_MASK	VC4_MASK(3, 0)
 
@@ -991,6 +993,7 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					mode->crtc_vsync_end,
 					VC4_HDMI_VERTB_VBP));
 	unsigned long flags;
+	u32 reg;
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
@@ -1017,6 +1020,11 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
 
+	reg = HDMI_READ(HDMI_MISC_CONTROL);
+	reg &= ~VC4_HDMI_MISC_CONTROL_PIXEL_REP_MASK;
+	reg |= VC4_SET_FIELD(pixel_rep - 1, VC4_HDMI_MISC_CONTROL_PIXEL_REP);
+	HDMI_WRITE(HDMI_MISC_CONTROL, reg);
+
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
@@ -1117,7 +1125,7 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 	reg = HDMI_READ(HDMI_MISC_CONTROL);
 	reg &= ~VC5_HDMI_MISC_CONTROL_PIXEL_REP_MASK;
-	reg |= VC4_SET_FIELD(0, VC5_HDMI_MISC_CONTROL_PIXEL_REP);
+	reg |= VC4_SET_FIELD(pixel_rep - 1, VC5_HDMI_MISC_CONTROL_PIXEL_REP);
 	HDMI_WRITE(HDMI_MISC_CONTROL, reg);
 
 	HDMI_WRITE(HDMI_CLOCK_STOP, 0);
@@ -1616,11 +1624,25 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	unsigned long long tmds_bit_rate;
 	int ret;
 
-	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
-	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
-	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
-	     (mode->hsync_end % 2) || (mode->htotal % 2)))
-		return -EINVAL;
+	if (vc4_hdmi->variant->unsupported_odd_h_timings) {
+		if (mode->flags & DRM_MODE_FLAG_DBLCLK) {
+			/* Only try to fixup DBLCLK modes to get 480i and 576i
+			 * working.
+			 * A generic solution for all modes with odd horizontal
+			 * timing values seems impossible based on trying to
+			 * solve it for 1366x768 monitors.
+			 */
+			if ((mode->hsync_start - mode->hdisplay) & 1)
+				mode->hsync_start--;
+			if ((mode->hsync_end - mode->hsync_start) & 1)
+				mode->hsync_end--;
+		}
+
+		/* Now check whether we still have odd values remaining */
+		if ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
+		    (mode->hsync_end % 2) || (mode->htotal % 2))
+			return -EINVAL;
+	}
 
 	/*
 	 * The 1440p@60 pixel rate is in the same range than the first
-- 
2.36.1

