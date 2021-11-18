Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C7C455936
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415756EA22;
	Thu, 18 Nov 2021 10:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE476E9F5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 463CC580916;
 Thu, 18 Nov 2021 05:38:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 18 Nov 2021 05:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=tdSWUQaX18Szc
 werwGlLiCnxMnicZEkyPuytvFVReCU=; b=C+r6WOlojduk3z+woBfzhQ4sQNTw2
 4LSlVKF/9+w0c2KnsV0VdR0oFo6zFyjmoxb6H2QOkheH0JJo1WK1nHN8jdP1nKfk
 883/hMeqOoKmWWPjwYP97beXYDCp8bt9JIRTaW8hDXYlElt3qHkpm+vvpYbFTPYr
 AyyvB85F8YCc7Y6g4bD/PUBGH5cmwAczM9TcGVf5IQnVX2gX/FTaxkrHaDYfpjf6
 dvyXDCEdu/6FAhUYLIvoP9Jd7JxyOzOP94skbHPpIMBbsvKPCkea7bjzQACq04DB
 OFDmfpt3Q/rK1ORY+xHvfHO+j5pRYJaTYVQLpkzxSPFNHRxhaYwMKP6Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=tdSWUQaX18SzcwerwGlLiCnxMnicZEkyPuytvFVReCU=; b=in8PSN+3
 UeSJbH0ANpdyTBXc5omXC4tECZFZQdv7djnskIKRaams/U1Edxv/k2J/pfPV9qRV
 FANPaKOvLkf8amGrUqZ0dto7Ao1w42QrtxxFZaNYeZjDkLyEirRXlmbxxVvyLb5f
 eH0GLP0HyiWQNL1cbEfRFRO5h5PT0PbHx7SdQHSLEuD5OG16hjDLBgS/V5CZ1I7V
 +ZSmGnp08to8GaoaAEoXrGB1MswtpBBvWbEuuRQl4by5IAH2l0PTSL9GQ27h4Jk5
 ppVs2SPcIMaeFj5Fshgql8wggHk4IN+07EU0zYYa8kGVhx52ysb8u/JfztkbbNEm
 hMWAYeJ8IqtFrQ==
X-ME-Sender: <xms:Ky2WYWVc4HTJMPnLr-jtCzZm-aI4ceSHcd3C1Drl-a7r_rpugV7mtQ>
 <xme:Ky2WYSkxnGEdPqZ76MlEcdKIZO3BrPDvowpxBLsW_s2hGYBqgOvavuDIahItuJ73t
 ofsLOTeCqhSjlfALvs>
X-ME-Received: <xmr:Ky2WYaYc2LoLSacvNDhaoz9RRqNaEmfACFG4I-PZEfE8BUQ0xr3qfa9QARodlZsbvHoF8kf9rq9Am0VSldjoWRVy6CjHSVigKkMXtxuuk1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ky2WYdXCrFniD41-gTOejPdKCUcs52XM4hk6QctmbioMwH-EFyu4eQ>
 <xmx:Ky2WYQkXOvTj8trUdmG2a-MzYAJHq2GZpdGwftMa2crM8cGCvnyaGg>
 <xmx:Ky2WYSeBoLjwrxq5bpGqB5WsGC2rE7M9aM2FsPDCAhs4lfjywmc9LQ>
 <xmx:Ky2WYdhC_GPiWKM6x8DBiYaT_YT5G-rvdQaXDymx5Y088fpOf_RUow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:34 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 08/13] drm/vc4: hdmi: Remove HDMI flag from encoder
Date: Thu, 18 Nov 2021 11:38:09 +0100
Message-Id: <20211118103814.524670-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211118103814.524670-1-maxime@cerno.tech>
References: <20211118103814.524670-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hdmi_monitor flag in the vc4_hdmi_encoder structure is redundant
with the is_hdmi flag in the drm_display_info structure.

Let's convert all the users.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 16 ++++++----------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e0b30c9e9559..98f15b11f135 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -222,7 +222,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 			if (edid) {
 				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-				vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
 				kfree(edid);
 			}
 		}
@@ -246,7 +245,6 @@ static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
-	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
 	int ret = 0;
 	struct edid *edid;
 
@@ -266,8 +264,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return -ENODEV;
 
-	vc4_encoder->hdmi_monitor = drm_detect_hdmi_monitor(edid);
-
 	drm_connector_update_edid_property(connector, edid);
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
@@ -586,13 +582,12 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 
 static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder)
 {
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_encoder->hdmi_monitor)
+	if (!display->is_hdmi)
 		return false;
 
 	if (!display->hdmi.scdc.supported ||
@@ -1125,11 +1120,12 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	const struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	unsigned long flags;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
-	if (vc4_encoder->hdmi_monitor &&
+	if (display->is_hdmi &&
 	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
 		if (vc4_hdmi->variant->csc_setup)
 			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
@@ -1154,7 +1150,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	const struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	unsigned long flags;
@@ -1175,7 +1171,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_BLANKPIX);
 
-	if (vc4_encoder->hdmi_monitor) {
+	if (display->is_hdmi) {
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 			   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
 			   VC4_HDMI_SCHEDULER_CONTROL_MODE_HDMI);
@@ -1202,7 +1198,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 			  "!VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE\n");
 	}
 
-	if (vc4_encoder->hdmi_monitor) {
+	if (display->is_hdmi) {
 		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 		WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 85bf25824832..4b9175f8aaaf 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -11,7 +11,6 @@
 /* VC4 HDMI encoder KMS struct */
 struct vc4_hdmi_encoder {
 	struct vc4_encoder base;
-	bool hdmi_monitor;
 	bool limited_rgb_range;
 };
 
-- 
2.33.1

