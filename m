Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654CD2CB6C9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B7F6EA2D;
	Wed,  2 Dec 2020 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600306E52A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 13:12:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id CB1A35804FA;
 Tue,  1 Dec 2020 08:12:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 01 Dec 2020 08:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+01DJwoEQNNw5
 YsZOfiBDcnSz/PBdPCnwrpSMAx4XXs=; b=Lc4oXO73Q9XUH5g4wMFdOCI+GWayo
 sx9+YkXzIBe35y/MLN18DUszC8ffQsyfFL1cUvhcpwTBUbTcmZTcmdIFl/NS5i/A
 ky2Dd/Fpm89WdYA2qEYiFr3DVx9/a47nMudT63lMR3+ze8NCe2u5Ay6/d+1mzVjO
 69TjU69sKEAYegq3WsrQDMcjS6fBwDFgBziK0FDcBrlmSPRWx1zt6yEKU0L1CHHk
 BmMcGCFXue3y2Py/snFYydXt8Mx+KyzQiTvb3FgLTNbP64yK/ABlSKAtdjCGdM9B
 FgPJll7aZXjqpuCIg+6rfWkM+nA20oURghFLeaecR8YqmI9t9rO9rlVzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+01DJwoEQNNw5YsZOfiBDcnSz/PBdPCnwrpSMAx4XXs=; b=mb6fS46Q
 sU6fE7LC7brP+1ntUXrjOIkNHjoi3bNB1YZKIHfQf2+wuP2e0C/9fBo+/bdqcGpM
 UmBrtuWGL+DW2tVpoPDrcdX5VPPBcd64s5POcaAZ+ResSiju0tuCZZtPiJ4bq5an
 Uzfx/4w3jj2tNyAkYiYIknqfWbq+HJaTH/oNaT0BfHriI1w7dzQEhiVn02zEfM4/
 ZbXNJkdhbzzw1g9VEKa+sJLl/7Oq+1wnX6A0aFpa9zqq5IiEAjxwQHOn8shzCcZG
 tsMKaTMkyxctcRHZ4cVGNuubk6bgY03WR1laYhzD6408Qnwo0onYjpx9HOPvM2Fq
 1TE+W5Nt4Z5esg==
X-ME-Sender: <xms:VkHGX9diBIfsuMvu3NxbSG41jAtxwoK15H6syGJcUu8ymsTjJrbQEw>
 <xme:VkHGX_gqd5tFVK_UtAbimTo98c4U0zerTC8Cr5o-lgeqDKz-TOvu-c8Fji5h5DvkA
 qIUNfW8TybWbOQfhhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VkHGX1rOjMq6ql-BVnLiO89kiLyRqdTwGDF54plGuXWbgIphV9RWBw>
 <xmx:VkHGX_GvIrhmFRA-GxhgHopoMO5cfMUd1T6pWfzrZsyYwIybU7e8TA>
 <xmx:VkHGX_l3gfXFIXzvFaEe8hLxQKgJMuVd89jhm7U-_a5irsBuqzOAIg>
 <xmx:VkHGX0XHiXHVM2FZy0nXcW0okjHA53hKReqrc4f2ax3ml-79CrYo2w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F0BDB1080057;
 Tue,  1 Dec 2020 08:12:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 2/7] drm/vc4: Pass the atomic state to encoder hooks
Date: Tue,  1 Dec 2020 14:12:44 +0100
Message-Id: <20201201131249.438273-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201131249.438273-1-maxime@cerno.tech>
References: <20201201131249.438273-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
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
index e02e499885ed..a3439756594c 100644
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
index c47c85533805..b404cd3ab0d8 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -444,12 +444,12 @@ struct vc4_encoder {
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
index afc178b0d89f..5a608ed1d75e 100644
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
