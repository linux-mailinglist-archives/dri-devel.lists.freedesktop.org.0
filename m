Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F648D96F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43DA10E381;
	Thu, 13 Jan 2022 14:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0D410E381
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C04AD5807F9;
 Thu, 13 Jan 2022 09:07:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 13 Jan 2022 09:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=U3J0SybpKtOZw
 03xDnAVRbLnAEO0ONomsSWMPDZwMps=; b=lCIfeQ/B3nRxog+dTuDW82fDTtBAj
 YBm36/+tMIaxLsF4ipA2x0/RY8X9KIsNbEs2Yv/n5kdc/Na0yKT7m9i6HgJL7qrL
 WkTZM0cryzJnkMdxkTXbOVUBxDgiEDcP3lbP+8Y6JC/D0sMIlYeHuXk6djS/Izxx
 0atVrYcZ8/Tm44+SN2WO15vTehxabREld2nF6Si49b9Ikf67+1VRWeGrm3sDA04+
 j0lHKH1wBk7zlND9FqRuPPEfdlaGx9cImGOOsKK9Pdnaxz67VvelP1/UjP9lxc4Z
 8Z2TcRiByLIkbY3ZHWVazf39yBW5r2eIhLj2d7f+184LQZbN2MQWPDsOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=U3J0SybpKtOZw03xDnAVRbLnAEO0ONomsSWMPDZwMps=; b=YGw3dWEx
 RXGy8tXQE3U+ut8OOG3OGXe5j0aDpI/zz5Irh4+0MDYjmlyKIfBpZFdcjcvJcGlm
 ErtEzdt8mZyiORjWC5Q/R6UZZzUsXgchOIdcp5J1rrTQTNWss5ehL1StCY4h+krG
 aConbYlsMhBuOW3YAuPatXZQHvle2VjVoJDJOl/jrmxqog54lEhaONDwd9IW72ty
 uGj5voF7UZicyCArbDu0fpFO9/+tx6ZZku179s5M7+DM+GBNwMVDpXSpuOmkNKry
 daezZJcqSUjE+CPur0emwbca0H138KDhCUphORFDDOJTrPptcW4044Z5uAwWjDYj
 qg8nuhALxMwigg==
X-ME-Sender: <xms:KjLgYYm_aDWWgRFw-XfbI48DoQpj_Kfw3_BpgV1ThGFSimj42NTLzg>
 <xme:KjLgYX2_8IHLvrAxrEYQMdcbiEd1IeW727aVxNLq22Y10WNlaUG_zFGAzO1WBRN1y
 m4ycLFfml-eA1sfNes>
X-ME-Received: <xmr:KjLgYWouKITIPZtCnpuxbslNTXfefJnEfgEL_Ud9Cjx0ZfvOlkGNwu_pOeBbOMHNFFzYJu_pV9XGt_Qmw_lSCSFjCXC47RQHJgYrab8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KjLgYUlrallkYDL2dWfrFVoyrFcPtuGWbPHIPjodHTzafHWFGTex5Q>
 <xmx:KjLgYW0IQyB-VTQ1y5T46ToMMNvgtu79AoAzqhYk02iUVr0jMzIarA>
 <xmx:KjLgYbsgf8FulGkLjK0RFLdvA3Gw-IvtRYcFYU1bs88ncmuawPDn7g>
 <xmx:KjLgYfuP4PjqfmYqG4gpHUnTk8Ap5lQV59KWKH7RZf3YO2sGFp2uQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 06/16] drm/vc4: hdmi: Use full range helper in csc functions
Date: Thu, 13 Jan 2022 15:07:10 +0100
Message-Id: <20220113140720.1678907-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CSC callbacks takes a boolean as an argument to tell whether we're
using the full range or limited range RGB.

However, with the upcoming YUV support, the logic will be a bit more
complex. In order to address this, let's make the callbacks take the
entire mode, and call our new helper to tell whether the full or limited
range RGB should be used.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 31 +++++++++++--------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  4 ++--
 2 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7966e3b00332..47ff4507f017 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -490,7 +490,6 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *cstate = connector->state;
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
@@ -508,9 +507,9 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
 
 	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
 					   connector, mode,
-					   vc4_encoder->limited_rgb_range ?
-					   HDMI_QUANTIZATION_RANGE_LIMITED :
-					   HDMI_QUANTIZATION_RANGE_FULL);
+					   vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) ?
+					   HDMI_QUANTIZATION_RANGE_FULL :
+					   HDMI_QUANTIZATION_RANGE_LIMITED);
 	drm_hdmi_avi_infoframe_colorimetry(&frame.avi, cstate);
 	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
 
@@ -735,7 +734,8 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
-static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
+static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
 	u32 csc_ctl;
@@ -745,7 +745,7 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
-	if (enable) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -775,7 +775,8 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
-static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
+static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
+			       const struct drm_display_mode *mode)
 {
 	unsigned long flags;
 	u32 csc_ctl;
@@ -784,7 +785,7 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
-	if (enable) {
+	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
 		 * Apply a colorspace conversion to squash 0-255 down
@@ -1123,22 +1124,12 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	unsigned long flags;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
-	if (!vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
-		if (vc4_hdmi->variant->csc_setup)
-			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
-
-		vc4_encoder->limited_rgb_range = true;
-	} else {
-		if (vc4_hdmi->variant->csc_setup)
-			vc4_hdmi->variant->csc_setup(vc4_hdmi, false);
-
-		vc4_encoder->limited_rgb_range = false;
-	}
+	if (vc4_hdmi->variant->csc_setup)
+		vc4_hdmi->variant->csc_setup(vc4_hdmi, mode);
 
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 36c0b082a43b..4a5536975bf6 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -12,7 +12,6 @@
 struct vc4_hdmi_encoder {
 	struct vc4_encoder base;
 	bool hdmi_monitor;
-	bool limited_rgb_range;
 };
 
 static inline struct vc4_hdmi_encoder *
@@ -77,7 +76,8 @@ struct vc4_hdmi_variant {
 	void (*reset)(struct vc4_hdmi *vc4_hdmi);
 
 	/* Callback to enable / disable the CSC */
-	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi, bool enable);
+	void (*csc_setup)(struct vc4_hdmi *vc4_hdmi,
+			  const struct drm_display_mode *mode);
 
 	/* Callback to configure the video timings in the HDMI block */
 	void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
-- 
2.34.1

