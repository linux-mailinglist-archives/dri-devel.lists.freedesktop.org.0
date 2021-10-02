Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7201641FCD2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479AC6E854;
	Sat,  2 Oct 2021 15:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED7F6E854
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:53 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id a14so1161821qvb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a2Ksl/yOoIp9d1OfmREGTxDmv9OxtwgpQYto7KkqAUE=;
 b=cIObE4WkWyD8pPouOTW7Iw4yBHSPfpFXolJD4oWmPX2SabK/TngeUSnmXuUzie2Ws6
 PAEu3B1TSEfKcnoe3SumgabPHNulKxHtSZ6pzaX3PuX8nGujccW8KFicWnf1ptp0k9Pa
 QHJQK+zM2pUEUochw4JdQNr2GUn3TolUHB8ThWboDyGXD2iOtgNzRNiNE2gSS3XWwHWm
 W9hja7+e33tYNqW/IVUTbjn6aZTXYp4TDO0KCjz6lAQ5zh43Mjw4N7PxlL9pv6bTVZu0
 Disu0j1a+oC9Tts6d3MI58csxwjD6MIB2fEuq+/nZeG/I+FRj3PxYschZSZer3zrBS65
 mvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a2Ksl/yOoIp9d1OfmREGTxDmv9OxtwgpQYto7KkqAUE=;
 b=cFio5c/EgL3UJAh77P+6MRhwTQAiLbKEePyQcsyOWR3QPHKUZOVkw5JctmAgwlyYUv
 0D+0l8x0kzPNFw2GL85J76xeNiQ+a1nsoQUE0UjblnXKFjZONjjZdcIXUvv8bWz8xcFB
 SDEwPEWDe6ztqWwy5ww9z+BvhYo6626QdH820B26GOgQx/8lHEHX4WwPLp2AWLHnbZF0
 oZ84M/CaNqArJiBo18PJgNu8WxIAZW9EWyR99VHsdvcKLU6Ilbck+EK8Biy8RR+kLLll
 uJkbBrp5Ie4dLsz0zugvfVMQD9VV1KXpsJJAba5isoMRrdyU0K90eHko9EzAtkYTntIw
 idIQ==
X-Gm-Message-State: AOAM533TZ5HP5PZeZAbaQ8C3G5ePhtG0EkxdxXz7e+JR3phkTwnfW9LT
 l3GuXjWu+CJtHO7b6dvi6EDY9wgHUk40XQ==
X-Google-Smtp-Source: ABdhPJwS3cW7UXVVWqb4PZ/fMf6T6X9i1JVY0Hu/v/MPOjMbgD4vl1KrHfRmDch3jRF/8GmfZtxQHQ==
X-Received: by 2002:ad4:4a32:: with SMTP id n18mr8135938qvz.29.1633189552821; 
 Sat, 02 Oct 2021 08:45:52 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id a2sm4683296qkk.53.2021.10.02.08.45.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:52 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 07/16] Revert "drm/nouveau: cleanup: drm_modeset_lock_all()
 --> DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:33 -0400
Message-Id: <20211002154542.15800-7-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211002154542.15800-1-sean@poorly.run>
References: <20211002154542.15800-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This reverts commit 6aa2daae589b63e8b39fe6f7f2b59fb3063efa05.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 86e18a844953..d7b9f7f8c9e3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -42,7 +42,6 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_scdc_helper.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_drv.h>
 
 #include <nvif/push507c.h>
 
@@ -668,18 +667,16 @@ nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
 
 	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
+	drm_modeset_lock_all(drm_dev);
 	acomp->ops = &nv50_audio_component_ops;
 	acomp->dev = kdev;
 	drm->audio.component = acomp;
-	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
-	return ret;
+	drm_modeset_unlock_all(drm_dev);
+	return 0;
 }
 
 static void
@@ -689,14 +686,12 @@ nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
+	drm_modeset_lock_all(drm_dev);
 	drm->audio.component = NULL;
 	acomp->ops = NULL;
 	acomp->dev = NULL;
-	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
+	drm_modeset_unlock_all(drm_dev);
 }
 
 static const struct component_ops nv50_audio_component_bind_ops = {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

