Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD159502D4D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 17:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD3E10E221;
	Fri, 15 Apr 2022 15:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2772810E204
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 15:47:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u3so11104956wrg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 08:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z3NAus3DBQ3rA5abnaly1KYO3d+31BXc2jT1/06zaWU=;
 b=gMVKNG8Sn7N8Cr8qoxwKxQEKVfdJZOjuX2zRtTioOhvs0ImnH98R2BnSStp58MnElU
 xU/rsr8ge2E733Mmqp7rU5uPl09/PmmY1PGllmUdILYJIIEUhsBFePA1jE4pUxwMen1U
 nXZWPrXahH1TwZ7LhU1BmHrDGHPMtYCt0p/Ndft70fMuyrKWJhR6O25NqXObJKrM52Dq
 AYzHhOfe4aLMZgD9D7aR2DY4KAC2rQFYjlhuhj5PG8PbfkNdtLDGCX1z2vWI1S2NTZ2N
 cUtpopQ1gU/hSKPaf7f8viiwkxxaX74ED9fon5Y5alcWwdJZUMEdh93XkuxiWiUmxTRk
 qWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z3NAus3DBQ3rA5abnaly1KYO3d+31BXc2jT1/06zaWU=;
 b=rTbX0slpVpmRFhtgDW2QdFfPhS0KznfzJFeXOGHYNo5WNkyhCOaTwbvAvx1/KBM6n4
 juem232Qdn35al6Ae+028XEix1eWLgR67ySc8hbFghyRz8A5Ziqw9hd0sCcLH8Qr7D8s
 t0/7AS/VAPjnNie8xvpM+U5GyX1Qnl0RHev/e6olAhqLuw5S3nViypdW/fMPCC3SLARA
 kI0Kz1tvn7sTuOtrptcTu5cGIhtaNZY9GDkz+yUpAEOlrV9TWpZGJOg2NnQB2BKzL/K8
 6Q5auhyhkkXHysGrCTW0lZH6QAnu8mrO0z2OMiBXZgZtKzq2Nx9ARIN4nqiSbT483u8i
 c5hg==
X-Gm-Message-State: AOAM530Dy9mPgR7H7PxiIqJWokWLwLFX3TzSEGgtV3wzfjBJf6c7qDuw
 frFvVG3bg77KbcTb6iATSps=
X-Google-Smtp-Source: ABdhPJyW2x2EFgqpv5A2q/Gy87tMC0ikN/Nmxu3gJ86Y5Z1liA26skS+/lodxtTsH/reQnsjkBwVFw==
X-Received: by 2002:adf:cc88:0:b0:207:a46c:ad8d with SMTP id
 p8-20020adfcc88000000b00207a46cad8dmr5699598wrj.95.1650037674611; 
 Fri, 15 Apr 2022 08:47:54 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adffb87000000b00207982c7f4dsm4349655wrr.67.2022.04.15.08.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:47:54 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: emma@anholt.net
Subject: [PATCH v2 2/2] drm/vc4: hdmi: Remove vc4_hdmi_encoder.hdmi_monitor
Date: Fri, 15 Apr 2022 17:47:45 +0200
Message-Id: <20220415154745.170597-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415154745.170597-1-jose.exposito89@gmail.com>
References: <20220415154745.170597-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_hdmi_encoder.hdmi_monitor field was used to cache the value
returned by drm_detect_hdmi_monitor() in order to avoid calling it
multiple times.

Now that drm_detect_hdmi_monitor() has been replaced with
drm_display_info.is_hdmi, there is no need to cache it in the driver
encoder struct.

Remove vc4_hdmi_encoder.hdmi_monitor and use drm_display_info.is_hdmi
instead.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++-----------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ecdb1ffc2023..9c73a211ae80 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -107,9 +107,9 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode)
 static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
 				       const struct drm_display_mode *mode)
 {
-	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
-	return !vc4_encoder->hdmi_monitor ||
+	return !display->is_hdmi ||
 		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
 }
 
@@ -216,7 +216,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 			if (edid) {
 				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
-				vc4_hdmi->encoder.hdmi_monitor = connector->display_info.is_hdmi;
 				kfree(edid);
 			}
 		}
@@ -242,7 +241,6 @@ static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
-	struct vc4_hdmi_encoder *vc4_encoder = &vc4_hdmi->encoder;
 	int ret = 0;
 	struct edid *edid;
 
@@ -255,8 +253,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 		goto out;
 	}
 
-	vc4_encoder->hdmi_monitor = connector->display_info.is_hdmi;
-
 	drm_connector_update_edid_property(connector, edid);
 	ret = drm_add_edid_modes(connector, edid);
 	kfree(edid);
@@ -578,13 +574,12 @@ static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
 static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 					 struct drm_display_mode *mode)
 {
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	if (!vc4_encoder->hdmi_monitor)
+	if (!display->is_hdmi)
 		return false;
 
 	if (!display->hdmi.scdc.supported ||
@@ -1147,7 +1142,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
+	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
 	unsigned long flags;
@@ -1168,7 +1163,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_BLANKPIX);
 
-	if (vc4_encoder->hdmi_monitor) {
+	if (display->is_hdmi) {
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 			   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
 			   VC4_HDMI_SCHEDULER_CONTROL_MODE_HDMI);
@@ -1195,7 +1190,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 			  "!VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE\n");
 	}
 
-	if (vc4_encoder->hdmi_monitor) {
+	if (display->is_hdmi) {
 		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 		WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 1076faeab616..44977002445f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -11,7 +11,6 @@
 /* VC4 HDMI encoder KMS struct */
 struct vc4_hdmi_encoder {
 	struct vc4_encoder base;
-	bool hdmi_monitor;
 };
 
 static inline struct vc4_hdmi_encoder *
-- 
2.25.1

