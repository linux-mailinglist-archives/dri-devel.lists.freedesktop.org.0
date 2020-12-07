Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891542D2638
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C26E6E0AD;
	Tue,  8 Dec 2020 08:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6153689933
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:57:24 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D2560580329;
 Mon,  7 Dec 2020 10:57:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Dec 2020 10:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+01DJwoEQNNw5
 YsZOfiBDcnSz/PBdPCnwrpSMAx4XXs=; b=cA4mvSvcQmVJqhz2zoGMDC6CkojD/
 qAHCqNHjbWZwGE0YzBU/s4NDopOGPDawiukC+eStXOHtVEA8YBLQOTem8tKZSKGE
 fKvH+bi2pcJl4RBl+vCQQlx0DGhupNo5YkwVT/LxCzMy/3j40S/sB6PSGh13dHNw
 DDfrOT8cHAMqM4f8mj8SooorIGM4emr+kBVPDzhHNj9psY5vGxHI+ESU+SiAviSj
 Phmm2IO93ySVQcm5uvvmbciqKrLcGz/KBzDUabfg8omYzlRNbnQ49VyAV/bfGfnp
 OfcSUtFSY61Mo9sVR0eoKSgwtNpbLUWOdjLtY6gWDpgqpJvrNzNRrPEsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+01DJwoEQNNw5YsZOfiBDcnSz/PBdPCnwrpSMAx4XXs=; b=f7yttiEu
 5tGWX05M7HSY507oUE+WfgxOWejLFWGrrwBxSPSHdxHnI+q0lmKEKd2dMqoUVcD5
 xcX2tTrLipB8gacX5Hu+kcypvKUXvRVnp3bawgKgsH6N39NskSZcygO3yxxrLWxe
 Ttp1BD5PPQ30Rr/IrlGIoiJttFWkSSTkvO3wv/wq7Pz7CMgKAH2933pFyJDXc6hw
 vzO5nRtiLFAaHlBwgNNqT/ZBGhZo6Vhr8RY//qxFjDprXIC1rJf7HJbOC6BxHqrX
 e1yFMqROfRUnQ3eqHA9BiLYTFL2MXPyEFl0rW3J+nuv1YQ/wQzS7Lcp2rYvQBE1Y
 khPlYPsAjvC05Q==
X-ME-Sender: <xms:41DOX8OLYRQRrozhIbJVJW3OhZp4ljXReQcMj-_fLhMgRHTNbBkF1A>
 <xme:41DOXy41U6uT2t3oYIDJg_bqW93dWb5iNTLTrtXwzjndLmshp3VxdbTd-jaI9QnSi
 VFCwjfu4iEgtGZ3Vig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:41DOXwLuwT_SuDrQ1K1XDjPTJtaCVRYaTgl_zCg4y_pez8VXFT-pQw>
 <xmx:41DOX8cP60haFgmwXVAYvBpW3PrQ2Se726Q7kLoKgteRmaKcT1JaPQ>
 <xmx:41DOXzeLtWj76Agdk5_wt4diMxlXTFDRrDRe0UJgZU2mtk2fD24v8Q>
 <xmx:41DOX3GXLB-PBjGmd2E2JnVHvWale6geBGlOU6QWVfqY0_2G1reokA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 829EC1080064;
 Mon,  7 Dec 2020 10:57:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 2/9] drm/vc4: Pass the atomic state to encoder hooks
Date: Mon,  7 Dec 2020 16:57:12 +0100
Message-Id: <20201207155719.17149-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207155719.17149-1-maxime@cerno.tech>
References: <20201207155719.17149-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
