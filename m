Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF12495133
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE2710E44D;
	Thu, 20 Jan 2022 15:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C5310E45B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:16:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 1FE412B00152;
 Thu, 20 Jan 2022 10:16:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 20 Jan 2022 10:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=U3J0SybpKtOZw03xDnAVRbLnAEO0ON
 omsSWMPDZwMps=; b=UP7as1p6TmSb7fHWRx3l6HGPcR5lY8NVGIRAeJk5s07d21
 kZEz7rPpfttIYpZOZN/L9vE+/SS80NNG/r+jcEkUW7hhROJWV4NEl8bQAIDvL8vT
 5+7DlBfMitllBkzs/ejZpKD1hzbhuI6ShPeBIzmHxpl29qZiU2j1pEqNOGFeIkhN
 g4x9npUREbQFGAXLpUUVDlk1qZEFqJ8zzO/QbClCmf6vNLq0J6mrsBiej26hEDLC
 h3Sltu+Qk0hu1429VTNW0hveJD09nWv48K3C+VvJTbyHet29+0N0tv9Zc8fSlJg9
 MwxLVwyGwjkHjPyzjzGItSVG9QbfQqfDRRm1DuzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=U3J0Sy
 bpKtOZw03xDnAVRbLnAEO0ONomsSWMPDZwMps=; b=hKw5WbGP5CMe+Xh73/Ltqz
 aDzL2CZ2wlw8kPjjTF1WUhgiTDYvtFykT8CXTzKnOvMgMXLWk89AiZBmHPUs9nI7
 zsZM17ZRrbek/EiCvSbIfUFms4AWqptsApHqbddL41az8tXcueov/DHHjP+7WgO3
 8GT1mjYolzgoTfQrlGpMXX6jsoYgoCmH5XuEHIGglatL0X0glGQ36H0NZzCvfVMF
 rTwnk3kQclUflCFx5wdYiKIwuMYAQrmXiwGWnmr580qhPhKgKMj/msERxOx8qW0l
 68DjkBo7O/T7dDn6AJ7h5sPKX7F2qU0ZmvWYFJrShoNdbYr+1te5ToqZbgIC1zVA
 ==
X-ME-Sender: <xms:5HzpYT1T4RyIv8KsxzF_DIazQIqfdF10GJrTTlpgvcAdhacVnKU7dg>
 <xme:5HzpYSFb66a6bKxLiaKaXtBLsfVgYbNDDASNFWtxPhylXcPcBVnQTBuweLHtAbqLh
 _p2G1aV0t_iYMBCWCg>
X-ME-Received: <xmr:5HzpYT7L4R376tozBIUTQbIOJHPuIwJlmo9K31wyPSowZrsJM8vRqIVPUXUKmVzdlGwTVZMX6MCj8U5-T_lHweGkOrLAfeljZzw9idY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5HzpYY2pyPtSh93zfGHf_A8rXxS1AcGhdNlR6sw6-Y-F4e0_gPIr5g>
 <xmx:5HzpYWGjBE0CYn_r_jKIgR_fhF_Y7WHt1XY-PoX2Z17V9sekumAElw>
 <xmx:5HzpYZ9SFTLSkDh7ZYPHh5QnYQiR58mppfFgZ6ofKVENOIEENVuHQw>
 <xmx:5HzpYe_Pzo-eVV6gdg7gYuX3ab6SZk2QjC72hASrjFZw6WNXD9is-Hecw-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:16:52 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 06/16] drm/vc4: hdmi: Use full range helper in csc functions
Date: Thu, 20 Jan 2022 16:16:15 +0100
Message-Id: <20220120151625.594595-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
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

