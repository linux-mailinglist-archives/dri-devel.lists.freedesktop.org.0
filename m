Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA7354853C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DDF10E771;
	Mon, 13 Jun 2022 12:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF86210E75A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:59 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id be31so8586036lfb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3DP4FwykHC1KRxxon4hPWqgxyZqCTbKsM3OsMeS/jg=;
 b=danrjCZR/Y8aA+S7RQWJWN65FHJBbqdyhHP/v2w0c3CQG5nwsbM1/d7tuKInCgV3ab
 wkVOUDoOob/fVgTcGipvQ996NAQA6KuT/xNdo6OLNAn7SqLS7OY1FvVdRFccMAMVRvpV
 9xFzxuLKLi8AWvH+ztUR+05BBRrBL7O8YyZx0vNww+72dJRuKOZcw1cxR/qQ+mbt92xR
 8/s/Q0v3WGXs8XFO/xpkDRkKr9L6J93WmqJJW8xnLs/sH3U3T1rmQ9Cw37YwpjaY1/ST
 GMaP1YTJsOZ3LTVYQvcdbAp0zYTolZpVqjKPyy62USs+6YIjLoK3KNMSmW4L2NrDbCBn
 AHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3DP4FwykHC1KRxxon4hPWqgxyZqCTbKsM3OsMeS/jg=;
 b=x7irgNBqGvGFrm0r+/CFDCxgASrGFYe5zDS79YPr5vA38I/opD+1x0v2Uov17rireY
 hgB3tkPED6dQzzPjt58++G3jssLDwZSuO45E6WglGa5Saj5MaWj4sxWA9pLMsoe6fjRI
 D9C4ORyNvUZU65X7LD3zutbrevWe7czCNFcSRO84Zp7aAAH+dvDBnrNDfXSf6jqfdSms
 zrffD6wwg6kUzWOpu+7J5AY8Abbr07MSqS9V0XkgYdf858nK4EuAcd1QmvKfBDvlNF9D
 r23a5msT3z3zu/mGUd+ie7IWjJEMRz280VVB15o3uAT1Ro5I7uuJ7DDlHk9p4KjW9Wi/
 ccNw==
X-Gm-Message-State: AOAM530EcjNb/+pc8fKqanqE4ZySHe4FHT2ZbIWiYfceuDqWhrROiPCS
 dqf10mZaWSgZFAvGvg4dgmS5zgiAQUw=
X-Google-Smtp-Source: ABdhPJwEq0N3ZEgHPn/2lDOmwOCk+V5/HCadU9pn9Ro077u3X60qWuDM5Fp8Xgc2hLCrXUjsiErzhQ==
X-Received: by 2002:a05:6512:b14:b0:479:626e:f13f with SMTP id
 w20-20020a0565120b1400b00479626ef13fmr19353903lfu.607.1655123698890; 
 Mon, 13 Jun 2022 05:34:58 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:58 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/19] drm/gma500: Unify struct
 *_intel_lvds_connector_helper_funcs
Date: Mon, 13 Jun 2022 14:34:32 +0200
Message-Id: <20220613123436.15185-16-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These now only contains generic gma functions so create
gma_lvds_connector_helper_funcs that all chips can use.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 10 +---------
 drivers/gpu/drm/gma500/gma_lvds.c       | 12 +++++++++---
 drivers/gpu/drm/gma500/gma_lvds.h       |  4 +---
 drivers/gpu/drm/gma500/oaktrail_lvds.c  |  3 +--
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 10 +---------
 5 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index a6f94572baaf..2ba635513401 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -111,13 +111,6 @@ static int cdv_intel_lvds_set_property(struct drm_connector *connector,
 	return 0;
 }
 
-static const struct drm_connector_helper_funcs
-				cdv_intel_lvds_connector_helper_funcs = {
-	.get_modes = gma_lvds_get_modes,
-	.mode_valid = gma_lvds_mode_valid,
-	.best_encoder = gma_best_encoder,
-};
-
 static const struct drm_connector_funcs cdv_intel_lvds_connector_funcs = {
 	.dpms = drm_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -253,8 +246,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
 
 	drm_encoder_helper_add(encoder, &gma_lvds_helper_funcs);
-	drm_connector_helper_add(connector,
-				 &cdv_intel_lvds_connector_helper_funcs);
+	drm_connector_helper_add(connector, &gma_lvds_connector_helper_funcs);
 	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 49c11b5337cb..3b48999105d1 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -94,8 +94,8 @@ static void gma_lvds_set_power(struct drm_device *dev, bool on)
 	gma_power_end(dev);
 }
 
-enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
-					 struct drm_display_mode *mode)
+static enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
+						struct drm_display_mode *mode)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -345,7 +345,7 @@ const struct drm_encoder_helper_funcs gma_lvds_helper_funcs = {
 /*
  * Return the list of DDC modes if available, or the BIOS fixed mode otherwise.
  */
-int gma_lvds_get_modes(struct drm_connector *connector)
+static int gma_lvds_get_modes(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -368,3 +368,9 @@ int gma_lvds_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+const struct drm_connector_helper_funcs gma_lvds_connector_helper_funcs = {
+	.get_modes = gma_lvds_get_modes,
+	.mode_valid = gma_lvds_mode_valid,
+	.best_encoder = gma_best_encoder,
+};
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 70c416d8b7a7..5c7da22400fb 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -24,8 +24,6 @@ struct gma_lvds_priv {
 };
 
 u32 gma_lvds_get_max_backlight(struct drm_device *dev);
-enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
-					 struct drm_display_mode *mode);
 void gma_lvds_encoder_dpms(struct drm_encoder *encoder, int mode);
 void gma_lvds_save(struct drm_connector *connector);
 void gma_lvds_restore(struct drm_connector *connector);
@@ -34,8 +32,8 @@ bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 			 struct drm_display_mode *adjusted_mode);
 void gma_lvds_prepare(struct drm_encoder *encoder);
 void gma_lvds_commit(struct drm_encoder *encoder);
-int gma_lvds_get_modes(struct drm_connector *connector);
 
 extern const struct drm_encoder_helper_funcs gma_lvds_helper_funcs;
+extern const struct drm_connector_helper_funcs gma_lvds_connector_helper_funcs;
 
 #endif
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 85cab0f7028a..7724ebd71aa8 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -230,8 +230,7 @@ void oaktrail_lvds_init(struct drm_device *dev,
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
 
 	drm_encoder_helper_add(encoder, &oaktrail_lvds_helper_funcs);
-	drm_connector_helper_add(connector,
-				 &psb_intel_lvds_connector_helper_funcs);
+	drm_connector_helper_add(connector, &gma_lvds_connector_helper_funcs);
 	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 4ef0150c6a03..f129e53f0233 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -210,13 +210,6 @@ int psb_intel_lvds_set_property(struct drm_connector *connector,
 	return -1;
 }
 
-const struct drm_connector_helper_funcs
-				psb_intel_lvds_connector_helper_funcs = {
-	.get_modes = gma_lvds_get_modes,
-	.mode_valid = gma_lvds_mode_valid,
-	.best_encoder = gma_best_encoder,
-};
-
 const struct drm_connector_funcs psb_intel_lvds_connector_funcs = {
 	.dpms = drm_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -296,8 +289,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
 
 	drm_encoder_helper_add(encoder, &gma_lvds_helper_funcs);
-	drm_connector_helper_add(connector,
-				 &psb_intel_lvds_connector_helper_funcs);
+	drm_connector_helper_add(connector, &gma_lvds_connector_helper_funcs);
 	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
-- 
2.36.1

