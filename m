Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C395628839B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC3F6EC64;
	Fri,  9 Oct 2020 07:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8846E3D8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 12:44:35 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 670C8B64;
 Thu,  8 Oct 2020 08:44:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 08 Oct 2020 08:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ALl/fjJQpZNsd
 RdIR4o5ayqbTl5GP2VDA3xHKuBSJ1w=; b=SM2wWkxng9aGZpg2e8jB93VEN+Miq
 ckoEj/VV5K1opW20Pv/GwBE9R2tW96JCylM9VLfuxMdk/wdBeu5ca3II5Y9uJfOC
 ai7wQsbeeqbr9AaIwA9LDN447LxGpG4J8dLqMepg4YVhhsqsi1MceEZVenQwVOuy
 AD1qIyr3wU48Q2J49PlACmsr/pt677JT6F3MTxIlPGBpTx6poow2fBqwNdkXZ5GB
 2iDb79U8zMgGJzNYHFj78ekHjmlKl9Dg1mTrtpBr1lByk5AoKomAs1KlNejQf9K8
 7tZZOV/T65Havos1SN5SBcbAg6zzddKZx9ShwokeMLMBYGeHmr5y2zjcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ALl/fjJQpZNsdRdIR4o5ayqbTl5GP2VDA3xHKuBSJ1w=; b=dLljkaMf
 lr3Jz+hAcDgdnefhmdBUr+VZ/W7n16oe8ndkjYZMAhcbWiy5KMeDT9u4B7GrzoWm
 7JM/4n5LDMGZbyUVA8WGPgHWqc6XPiVwpUZy/l5pvz8i0m0qq0NdR65l2x/qLaUx
 GMsGa2j1r1KbG7hjnKvV2NwAQbVNjwWGqJullvyXQeRPLAf2BFEq2fM2T0BL7g3j
 AlVtxmoyuc+90yUC3g/JreJlgiT261bHcn6+Z2A/dyutAlsewlfXf4REMDWSClOd
 eA1kvDSTWZxSuymI/nuhwODnBhceMcnxMjsAExkWa0u1I9wKowM7KzNw8RvLUGu5
 MtaC0+MaGmnEYA==
X-ME-Sender: <xms:sQl_X4XyTBTXPvFoY8EtoTHzpjPy2xxlmPeCh49GqgdkBPghl11oYA>
 <xme:sQl_X8ncOPfXemnPCGDJ8Sg7wSDrj09zRMImh8x9PgqwHCKJyVkwqZNnQZMq-8xe4
 E6YiQbX0nZRPgYrxJM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sQl_X8bvPijeC9012i9Hfk78b7dgomnNXhAuWWjXpKqmM1fOUDA_3A>
 <xmx:sQl_X3Vno7GAd96FWd0VoYi7VDwTGlMWa-ELhngVEtBheh34QyWO_w>
 <xmx:sQl_XynvpYPPfs025H71RiaYb25HgExPbsRV_WUBrRRXkjwDVqcVmA>
 <xmx:sQl_X7ed-gcPrVHZacFI62FkO-SRLGTwlHGGmsRyMRsOAYyYCJZ7iy2SA3w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 706E23064674;
 Thu,  8 Oct 2020 08:44:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 3/6] drm/vc4: Pass the atomic state to encoder hooks
Date: Thu,  8 Oct 2020 14:44:10 +0200
Message-Id: <0dff5ec6d8f91a7e8cf16ed314f44102ac762c60.1602161031.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.647a5105d069cdcf8545555d1c381c233675a289.1602161031.git-series.maxime@cerno.tech>
References: <cover.647a5105d069cdcf8545555d1c381c233675a289.1602161031.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
index b5deacfe16cd..4204c5e37ffe 100644
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
index 92996c99600d..30dfe113dfd0 100644
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
