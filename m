Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D952DBD12
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF298910C;
	Wed, 16 Dec 2020 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2C6E3F9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 34833762;
 Tue, 15 Dec 2020 10:42:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 15 Dec 2020 10:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=EI+9SFa1tK+tH
 XkJF6VDVZ8zOaE3gLI+cYwU1gNhVCY=; b=uWo1bfW/n3xXxWmnha9BU8zh4TAxc
 X0M6bl3Q3lNZjX6dr5RFKsyFcEjQdo2ORI61svNu1+u49SQsLxlreUbjSgmOb103
 Tvz9OmxS1+yfbLOYSMXKamNOWwZ2/SyhkAbQwGoGZiHBL2OyybB0XmRdSYFSStw7
 CzvW7VzhT1lD9x6VXfSxkQYEa5bEF3OhTCfkqnc797tvOHiMkVNq/nts7tpEeUM2
 kdj27tvzsa1hIUTEvAYeuUKUhWq7sfjL2pjowRPP1RV9g/OPfSZk4yl/efdMza+e
 2tv+4ON5t7zzxrCYdBS+Zif3jBRCc5RgkXzKrqawtwv38rGel4aabAhRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=EI+9SFa1tK+tHXkJF6VDVZ8zOaE3gLI+cYwU1gNhVCY=; b=eg1Ln1fW
 5tjpTbXIx7dMTYuqbj3q238sT3KXL0HUgJiKKhVSHPn6jqZg6TfOQr3QKcLgigTd
 dOxbmCqIDhy7lcwAzFrcUGa5hNhw6h4uXJ5AernvtgSEJugyIqwIWiWSx4pEoVq9
 9FaRQ+sdlAE1fu0xYoa1i/BM7bM4p/Yv5SESvUjK2G/f+68BCjMkpue0jfJx9Ja9
 nUhI4T7L2NhG7I8T5Ets0dlOVwb8X+pdfK3JEaK6CPNAdZxNooLkAEt4/1K++wdn
 orfhUNBp+inYrvWS4nzHoYOy9Ivbl3Jb9dfx+SJqNrjhi3xld2fwSAYtnMed1mKr
 tIjjzrMOtn+i+w==
X-ME-Sender: <xms:eNnYXyQ5mKqMD4UqMl3GxYA2uBLH-teAEpNAFy9hbCO-xz_sez-eXw>
 <xme:eNnYX3zITJOSHfclb07RhWB6herqIzfTsHO2kqC9QjZxcuUt6dtNlAeAmSBTPQnJr
 8eH350AIwukqWWnGik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eNnYX_0cgQV00i2Ct5mBtmwmlqNM-RJiksZ-6lqiUpiNkMFqRcSC5g>
 <xmx:eNnYX-ARJLzDiula37VvJ9m8VKixplmEEDtHa7qCbuZGn4Xn89W9zA>
 <xmx:eNnYX7igLnombAZSAva4rCqxd2EAVquo9s163Ow89Rxc_fviOxo9Fw>
 <xmx:eNnYX8U-VaKjbzN_jLlgGCmEvJt-z5nJGFFOugs41eZrl8XaWh6WUbdeLlM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3E25F240062;
 Tue, 15 Dec 2020 10:42:48 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 2/9] drm/vc4: Pass the atomic state to encoder hooks
Date: Tue, 15 Dec 2020 16:42:36 +0100
Message-Id: <20201215154243.540115-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215154243.540115-1-maxime@cerno.tech>
References: <20201215154243.540115-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to access the connector state in our encoder setup, so let's
just pass the whole DRM state to our private encoder hooks.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 18 ++++++++++--------
 drivers/gpu/drm/vc4/vc4_drv.h  | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++++++++-----
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 95b2dd9d7a38..0fef45b93ba1 100644
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
index 5a115bc62cc8..051ad4e31e52 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -441,12 +441,12 @@ struct vc4_encoder {
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
index 9f8d74e32355..8ce5dd65f6e4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -360,7 +360,8 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 		vc4_hdmi_set_audio_infoframe(encoder);
 }
 
-static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
+					       struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
@@ -373,7 +374,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder)
 		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
 }
 
-static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
+						 struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	int ret;
@@ -587,7 +589,8 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
 }
 
-static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
+						struct drm_atomic_state *state)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
@@ -679,7 +682,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
 		vc4_hdmi->variant->set_timings(vc4_hdmi, mode);
 }
 
-static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
+					     struct drm_atomic_state *state)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
@@ -701,7 +705,8 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder)
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
 }
 
-static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
+static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
+					      struct drm_atomic_state *state)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
