Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DF278135
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75346EC11;
	Fri, 25 Sep 2020 07:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820DE6EB41
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 15:31:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1CD35E0B;
 Thu, 24 Sep 2020 11:31:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 24 Sep 2020 11:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Xh239QvpYm7Go
 p+FR+WFSIFvmFbE5OsMamJC3a9/Ios=; b=MjXkUSRsYKLscwoeW7i6ZXpkpNc2l
 tGgoBGybVR4KQXiJWlm+XqDKfaNOGqdQ8hbqRPvwd6htIgEkHnUxqX349pXBim1h
 CAn+fAX6NAiIEMzYaamodthCX+P1A3Df6YRC2JmZVt0+cXflWHb/8xc7s+B/BnpA
 lkxfN+hwgc7P+UFhE6KQV+0w0MBWKaQGRH1odF5j7BdLQ9+NOdVC0P/uWJcVPxdH
 zNudPJ+Z5FZQ+bPTH61AnHpNPdHpfe/HOGMZh7WfdEiaGMnYZSACzqdItS4kuT9W
 er8/k3UdPcYjJeJxPYuv8sMAciYXqmLuZiz0YCa5Q9DuxzHsv0Hg3b4xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Xh239QvpYm7Gop+FR+WFSIFvmFbE5OsMamJC3a9/Ios=; b=g8q/hUGg
 FYTawaHzvY+RXEyds+iaUh7RUmGq5ejuGnA1vdyBlkJOUUNthWZcohtgxD/14ci1
 XXHJLFj8BNBz9kaVsJEyNcXjopXibKqPDCuYqV+QH5HvjWjQDlUlU80bIC8Xghfs
 BIaNKl4RVYGzIINqO9LXGUY2GPNDHJG6/PAhsjOzafGea5afwHWYB6EyMkV3pk1x
 konUDe7jDe4qruZKkykpyxFMIyrE1fShbZlYm8EuFdY/ZcVSIwc8Ye2hco3cjdk4
 fhae9Y25ZjnrgQ1u1bHbmBbsfvdUN+N/OcZ73ovsEA941hwLrEHin5J1RwpHZ7CM
 3Wh1GyhePO8jsQ==
X-ME-Sender: <xms:vLtsX5G20sAmSd2PPHZNbD8dAvJDug8IllN0C9GjsB-Fd_T70uKtZA>
 <xme:vLtsX-UdYL3UtlvRiigjWkcRz0PCpkvt8x3riNm1vMPZa0YFAkMEdqzC1vg4A3JNZ
 fT7oiJZMCtIPXPY35c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vLtsX7LQRBmPf2Hs8CUNC8KatsySeA8GO-xElDRYryMsVXN7sLTSHQ>
 <xmx:vLtsX_EzyJrfGrYbekDFUZg1SQnCScuPxdaF2nIOcO0zSA3kItqy9w>
 <xmx:vLtsX_VnWOKw7uJZPHFQj6wOoRS4XANdOAxk-RLlfHQkXr9IvqSH2g>
 <xmx:vLtsX4PhrLQiWEzTlk0Oy4p46JsDDMP-H-z_j1sqN9hjUq3HeylR_6zaSC0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4FDF83064674;
 Thu, 24 Sep 2020 11:31:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 3/6] drm/vc4: Pass the atomic state to encoder hooks
Date: Thu, 24 Sep 2020 17:30:58 +0200
Message-Id: <f2107dad244c788e0726d1d44584a41e46bb9cab.1600961400.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.0400f261220da59b7ef16523e267aeaa5e06b648.1600961400.git-series.maxime@cerno.tech>
References: <cover.0400f261220da59b7ef16523e267aeaa5e06b648.1600961400.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to access the connector state in our encoder setup, so let's
just pass the whole DRM state to our private encoder hooks.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 18 ++++++++++--------
 drivers/gpu/drm/vc4/vc4_drv.h  | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++++++++-----
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 878718b8836e..17a4427bd899 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -403,7 +403,9 @@ static void require_hvs_enabled(struct drm_device *dev)
 		     SCALER_DISPCTRL_ENABLE);
 }
 
-static int vc4_crtc_disable(struct drm_crtc *crtc, unsigned int channel)
+static int vc4_crtc_disable(struct drm_crtc *crtc,
+			    struct drm_atomic_state *state,
+			    unsigned int channel)
 {
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
@@ -435,13 +437,13 @@ static int vc4_crtc_disable(struct drm_crtc *crtc, unsigned int channel)
 	mdelay(20);
 
 	if (vc4_encoder && vc4_encoder->post_crtc_disable)
-		vc4_encoder->post_crtc_disable(encoder);
+		vc4_encoder->post_crtc_disable(encoder, state);
 
 	vc4_crtc_pixelvalve_reset(crtc);
 	vc4_hvs_stop_channel(dev, channel);
 
 	if (vc4_encoder && vc4_encoder->post_crtc_powerdown)
-		vc4_encoder->post_crtc_powerdown(encoder);
+		vc4_encoder->post_crtc_powerdown(encoder, state);
 
 	return 0;
 }
@@ -468,7 +470,7 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
 	if (channel < 0)
 		return 0;
 
-	return vc4_crtc_disable(crtc, channel);
+	return vc4_crtc_disable(crtc, NULL, channel);
 }
 
 static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -484,7 +486,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	/* Disable vblank irq handling before crtc is disabled. */
 	drm_crtc_vblank_off(crtc);
 
-	vc4_crtc_disable(crtc, old_vc4_state->assigned_channel);
+	vc4_crtc_disable(crtc, state, old_vc4_state->assigned_channel);
 
 	/*
 	 * Make sure we issue a vblank event after disabling the CRTC if
@@ -518,14 +520,14 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	vc4_hvs_atomic_enable(crtc, state);
 
 	if (vc4_encoder->pre_crtc_configure)
-		vc4_encoder->pre_crtc_configure(encoder);
+		vc4_encoder->pre_crtc_configure(encoder, state);
 
 	vc4_crtc_config_pv(crtc);
 
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
 	if (vc4_encoder->pre_crtc_enable)
-		vc4_encoder->pre_crtc_enable(encoder);
+		vc4_encoder->pre_crtc_enable(encoder, state);
 
 	/* When feeding the transposer block the pixelvalve is unneeded and
 	 * should not be enabled.
@@ -534,7 +536,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 		   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
 
 	if (vc4_encoder->post_crtc_enable)
-		vc4_encoder->post_crtc_enable(encoder);
+		vc4_encoder->post_crtc_enable(encoder, state);
 }
 
 static enum drm_mode_status vc4_crtc_mode_valid(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 232da0f50aa1..89e36da5043d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -442,12 +442,12 @@ struct vc4_encoder {
 	enum vc4_encoder_type type;
 	u32 clock_select;
 
-	void (*pre_crtc_configure)(struct drm_encoder *encoder);
-	void (*pre_crtc_enable)(struct drm_encoder *encoder);
-	void (*post_crtc_enable)(struct drm_encoder *encoder);
+	void (*pre_crtc_configure)(struct drm_encoder *encoder, struct drm_atomic_state *state);
+	void (*pre_crtc_enable)(struct drm_encoder *encoder, struct drm_atomic_state *state);
+	void (*post_crtc_enable)(struct drm_encoder *encoder, struct drm_atomic_state *state);
 
-	void (*post_crtc_disable)(struct drm_encoder *encoder);
-	void (*post_crtc_powerdown)(struct drm_encoder *encoder);
+	void (*post_crtc_disable)(struct drm_encoder *encoder, struct drm_atomic_state *state);
+	void (*post_crtc_powerdown)(struct drm_encoder *encoder, struct drm_atomic_state *state);
 };
 
 static inline struct vc4_encoder *
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 03825596a308..7d2593398094 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -357,7 +357,8 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 		vc4_hdmi_set_audio_infoframe(encoder);
 }
 
-static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
+					       struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
@@ -370,7 +371,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder)
 		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
 }
 
-static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
+						 struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	int ret;
@@ -584,7 +586,8 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
 }
 
-static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
+						struct drm_atomic_state *state)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
@@ -676,7 +679,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
 		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
 }
 
-static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
+					     struct drm_atomic_state *state)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
@@ -698,7 +702,8 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder)
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 }
 
-static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
+					      struct drm_atomic_state *state)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
