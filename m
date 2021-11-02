Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEFA44311E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3F072E85;
	Tue,  2 Nov 2021 15:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3B272E7B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 15:00:09 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D9E8580741;
 Tue,  2 Nov 2021 11:00:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 02 Nov 2021 11:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=3eG2T/ZDokB4s
 YOC9c7k3Fec48n49TbhwUBUZtcN8G4=; b=H0iGn8ByqYHmUv8PHUrabQOb4ERs+
 R3/HghgAPjyNUIWr+Jr7zpNUVYAfXEcH7UCvuyqXTl1kh21IvQtV9Gw+4V+aWXlo
 Zy0mdUrsneh/LyYl+h1WvcFhh2B01AZMXEYguJHuVukdlwDPfUoMxfIRE5TEsk8y
 +kIXoGJDFyDTLzZQsIdhuNG/akBsOPcEg1zXPLrGwAwpX0u24Jw8hPUr3vNmhoVj
 BITywkyq0rkDRFTejApyszgjohzpT4U/xFHc6BD0y5sNv1VswBI0qRq7hyF/HVCB
 Emrv+SmbiokGpYek4zdKUftmBQMBs4heeeNl6S4TcgAcxwizyejKFpb7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3eG2T/ZDokB4sYOC9c7k3Fec48n49TbhwUBUZtcN8G4=; b=OABp2CqE
 AGNow/mcv9j+DL4XItaLkoxxQ0OfEBtW0wWJxf14Z02W/Mwr9ntxgd73UR66CxVy
 xpGgOtI1Y1E0Erv1ApdedlkS3nW52tDiX2QCjBVjAt8EUhJDCCP1/8NMuT1IjmxH
 l84YkUeJjm/9IX6+3Nock7OfNY2YFYG2ve39dB10IxD+6WwtUvNZsZL49yuwClKn
 ijps0GYdOKRGjZucbT8Kwz2RjE5t3N+fEh63NgsBdIogXIIR32PoFVQOvaeqpr3s
 AlEWpQyxsugkwpXoEV998VXUavRz2bwQs9HYI2TZvYq4Vze4UyGfop2boAI8EDTa
 QVTF2zbtUvSJ0w==
X-ME-Sender: <xms:eVKBYYptu238BvnVg2_hSeIHf3B1UfdsaKrPvPppgIySKKW8RokIUg>
 <xme:eVKBYeq7ZQyndtoBY7g7hG_qPnOwknq6JPLB1JlGLUZvQQL98LfqY1QoWmXeyu9e7
 jpV5BoNz-yqJRVW_vg>
X-ME-Received: <xmr:eVKBYdOWPc005bKze_c3xbRGCMxk_NPtgNejFBXi6WQIi6Nbpo1KZEEBcrBboojb8W_NqQyLu9BDdXREOLwUIBqDqyjrWDg_ExI8C2dZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eVKBYf41IgIZh208m1KBo5MLy6qXlzgcZPd_GAv2cLbLTubcy0aBuQ>
 <xmx:eVKBYX71fuu1Tlwig9tsvlChaeTGa5Uuqap9CzdJoGiaF-Bjb6BlSw>
 <xmx:eVKBYfhWrGrSdV0OVWwqgdn0Ox4K5jt-OrX09XTr-0IF46niA28Hyg>
 <xmx:eVKBYUHSSKNdmVi95QYOtn8XxhXPjmM90SAYCiInoNzELbByMBJH3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 11:00:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 08/13] drm/vc4: hdmi: Remove HDMI flag from encoder
Date: Tue,  2 Nov 2021 15:59:39 +0100
Message-Id: <20211102145944.259181-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102145944.259181-1-maxime@cerno.tech>
References: <20211102145944.259181-1-maxime@cerno.tech>
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
index 826ca7aaf8d7..288c2bfbf88b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -217,7 +217,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 			if (edid) {
 				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-				vc4_hdmi->encoder.hdmi_monitor = drm_detect_hdmi_monitor(edid);
 				kfree(edid);
 			}
 		}
@@ -241,7 +240,6 @@ static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
-	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
 	int ret = 0;
 	struct edid *edid;
 
@@ -261,8 +259,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return -ENODEV;
 
-	vc4_encoder->hdmi_monitor = drm_detect_hdmi_monitor(edid);
-
 	drm_connector_update_edid_property(connector, edid);
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
@@ -581,13 +577,12 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 
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
@@ -1120,11 +1115,12 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	unsigned long flags;
 
 	mutex_lock(&vc4_hdmi->mutex);
 
-	if (vc4_encoder->hdmi_monitor &&
+	if (display->is_hdmi &&
 	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
 		if (vc4_hdmi->variant->csc_setup)
 			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
@@ -1149,7 +1145,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	unsigned long flags;
@@ -1170,7 +1166,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_BLANKPIX);
 
-	if (vc4_encoder->hdmi_monitor) {
+	if (display->is_hdmi) {
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 			   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
 			   VC4_HDMI_SCHEDULER_CONTROL_MODE_HDMI);
@@ -1197,7 +1193,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 			  "!VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE\n");
 	}
 
-	if (vc4_encoder->hdmi_monitor) {
+	if (display->is_hdmi) {
 		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 		WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 32b0aa447717..460112d68948 100644
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
2.32.0

