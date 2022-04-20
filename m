Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 356EF508749
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 13:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6C710E5E3;
	Wed, 20 Apr 2022 11:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36B910E5E3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 11:45:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so3480871wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lFCKgPdJ/CCqTu3x/1Yy2jf+PG8b00IGqwXiUi0yBIA=;
 b=GXNF/fFbx9d6DuyiAMIllf2dfw0igvuN4n6cSYK5HEVSZ9Fu49GJl9W68c5f3BLVqI
 0IfqhTFSjoK+Rw3wvl6N/Ca+dotjOcYSkaRiIJZkU3fv9C9u6fm7JzHTv5P2h8Xhn1lB
 bNabk8Mnoy3OhlN7bZdPxhz5p3HGJ9GTVh0zoghFFu9z9pb/P02Diuow4ilWP4eZmFiB
 g3tsZWBBO5vBUEzPPq1yKSp85A8a4LMPFjNRDBLNziyjXhtqqDWqq1/u3Szjnk9Zeka4
 AL0mz460HRrdMlxPDSd+VeeSdfiBbynFLVCezYe1RVLccYnmmY3VCZIFsrxzvNuBUqq6
 BpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lFCKgPdJ/CCqTu3x/1Yy2jf+PG8b00IGqwXiUi0yBIA=;
 b=ah8bVWgxIG4+J4iMklc7VZydSEkbiEEHPw96WkbkITQnjc8b74kNkIkbpg5nFPQ1S0
 5rYb+3yMXlc7lzYvfQ1mZ8e8n+75RJPlE+pKioxreuFoDc4MV4STr/T7zG4Ltrm36Oa8
 wFYzPn6WXg5zlDVZGnAzD+WJLs73dee+Q5AI0biUNIr3U4yz2fN9AcfNCDKVMXfXc/9h
 pWg5ubh7vpUWi6dQUx6Rz0C66yHsFWISxU0QGPA4j4eQz9q9vmBWXKwnXkFY7uJY00jD
 dmPXMYZXOaBd27tLtb59iilxNNfFoE9XrB1zPH9br2112Y9TAJY7KVLsuRXibP3GzuIb
 peYQ==
X-Gm-Message-State: AOAM5301S0yuKqklVRLxXemODlj8J5UJBDym5ear8v08RfIMV7r0OtTm
 LgRY/zSFQLypiDT9jSpOHkc=
X-Google-Smtp-Source: ABdhPJxp2lXZMiX4io4AGVzFr7xka+KP2mq55THxYO6xGRXowX9g0V8G+19xuvrq8yDlfolUQx2n1A==
X-Received: by 2002:a1c:6a02:0:b0:38b:3661:47f1 with SMTP id
 f2-20020a1c6a02000000b0038b366147f1mr3211899wmc.5.1650455143489; 
 Wed, 20 Apr 2022 04:45:43 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm17798204wri.0.2022.04.20.04.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:45:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: emma@anholt.net
Subject: [PATCH v3 2/2] drm/vc4: hdmi: Remove vc4_hdmi_encoder
Date: Wed, 20 Apr 2022 13:45:00 +0200
Message-Id: <20220420114500.187664-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420114500.187664-1-jose.exposito89@gmail.com>
References: <20220420114500.187664-1-jose.exposito89@gmail.com>
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

The vc4_hdmi_encoder struct was used exclusively to cache the value
returned by drm_detect_hdmi_monitor() in order to avoid calling it
multiple times.

Now that drm_detect_hdmi_monitor() has been replaced with
drm_display_info.is_hdmi, there is no need to have an extra struct.

Remove vc4_hdmi_encoder.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 ++++++++++++------------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 16 ++--------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9c73a211ae80..f8d662fde5e0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -220,7 +220,7 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 			}
 		}
 
-		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
+		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base);
 		pm_runtime_put(&vc4_hdmi->pdev->dev);
 		mutex_unlock(&vc4_hdmi->mutex);
 		return connector_status_connected;
@@ -357,7 +357,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 				   struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	int ret;
 
 	drm_connector_init_with_ddc(dev, connector,
@@ -1463,7 +1463,7 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 
 static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 {
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	unsigned long flags;
 	int ret;
@@ -1553,7 +1553,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 				  struct hdmi_codec_params *params)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
 	unsigned long flags;
@@ -2506,13 +2506,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
 
 	dev_set_drvdata(dev, vc4_hdmi);
-	encoder = &vc4_hdmi->encoder.base.base;
-	vc4_hdmi->encoder.base.type = variant->encoder_type;
-	vc4_hdmi->encoder.base.pre_crtc_configure = vc4_hdmi_encoder_pre_crtc_configure;
-	vc4_hdmi->encoder.base.pre_crtc_enable = vc4_hdmi_encoder_pre_crtc_enable;
-	vc4_hdmi->encoder.base.post_crtc_enable = vc4_hdmi_encoder_post_crtc_enable;
-	vc4_hdmi->encoder.base.post_crtc_disable = vc4_hdmi_encoder_post_crtc_disable;
-	vc4_hdmi->encoder.base.post_crtc_powerdown = vc4_hdmi_encoder_post_crtc_powerdown;
+	encoder = &vc4_hdmi->encoder.base;
+	vc4_hdmi->encoder.type = variant->encoder_type;
+	vc4_hdmi->encoder.pre_crtc_configure = vc4_hdmi_encoder_pre_crtc_configure;
+	vc4_hdmi->encoder.pre_crtc_enable = vc4_hdmi_encoder_pre_crtc_enable;
+	vc4_hdmi->encoder.post_crtc_enable = vc4_hdmi_encoder_post_crtc_enable;
+	vc4_hdmi->encoder.post_crtc_disable = vc4_hdmi_encoder_post_crtc_disable;
+	vc4_hdmi->encoder.post_crtc_powerdown = vc4_hdmi_encoder_post_crtc_powerdown;
 	vc4_hdmi->pdev = pdev;
 	vc4_hdmi->variant = variant;
 
@@ -2674,7 +2674,7 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
 	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
-	drm_encoder_cleanup(&vc4_hdmi->encoder.base.base);
+	drm_encoder_cleanup(&vc4_hdmi->encoder.base);
 
 	pm_runtime_disable(dev);
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 44977002445f..71768915cc4b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -8,17 +8,6 @@
 
 #include "vc4_drv.h"
 
-/* VC4 HDMI encoder KMS struct */
-struct vc4_hdmi_encoder {
-	struct vc4_encoder base;
-};
-
-static inline struct vc4_hdmi_encoder *
-to_vc4_hdmi_encoder(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct vc4_hdmi_encoder, base.base);
-}
-
 struct vc4_hdmi;
 struct vc4_hdmi_register;
 struct vc4_hdmi_connector_state;
@@ -127,7 +116,7 @@ struct vc4_hdmi {
 	struct platform_device *pdev;
 	const struct vc4_hdmi_variant *variant;
 
-	struct vc4_hdmi_encoder encoder;
+	struct vc4_encoder encoder;
 	struct drm_connector connector;
 
 	struct delayed_work scrambling_work;
@@ -230,8 +219,7 @@ connector_to_vc4_hdmi(struct drm_connector *connector)
 static inline struct vc4_hdmi *
 encoder_to_vc4_hdmi(struct drm_encoder *encoder)
 {
-	struct vc4_hdmi_encoder *_encoder = to_vc4_hdmi_encoder(encoder);
-
+	struct vc4_encoder *_encoder = to_vc4_encoder(encoder);
 	return container_of(_encoder, struct vc4_hdmi, encoder);
 }
 
-- 
2.25.1

