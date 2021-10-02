Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6710341FCD3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3BC6F4A7;
	Sat,  2 Oct 2021 15:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F1C6E850
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:55 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id p4so12198005qki.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42uv3L3+Ft+iMj4lATxwGma/xF0ysXtqjFk2cOsXKzw=;
 b=USciYRwisAW766sCM0TG7kNejDCcbPuyt/AWuTa0YYjn2Vnde3TEhVZVJhwsyK7qGJ
 xfO3YyoCyBEgaeS4A12T5yuMlcTwWuP3frEVFJ6SDuFWpL5XZFuosKIFm6fKAT1m2xaS
 IcLoVgrYr/CfevmvXUtRO8nWFCe2WjHPsq7sV+Ub9FxU6BmZUA7G9HLEF21hvRQO97R8
 JUSInSk2wNNVLQTuE/coD43ssb1Tkg5usxggc5eiw80M2ZO+VNEuAsdHj50/S3qJy3Ld
 khwnreHNXLlkNccNyuldPF4rb7rkVjlvwKZAq3JNIDaMcgboC4KPnOyr5RkOkGurZ3sL
 w3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42uv3L3+Ft+iMj4lATxwGma/xF0ysXtqjFk2cOsXKzw=;
 b=C+9Sgt2445hmS3cItXemtOD9nVO+TmOYyHLzyob820dGZC5Ale1IU4aVgt6Al6a+ga
 TkkJHBgK5W454rsqghPjvM7hT9sbevR4ZQFpDgNQPJJRyLepBicETeDuns/TvKBTzCmL
 y/JYEg++1XuCtHIs/Yjbag5zN30sDR/7fLLCB1tSH0oryZm6hIrh9ZQhfGwZs8tjhZbJ
 JS78dzyJMfeoBLSX/BcXUK+k072xgCTkwmxbl6C6sOSu7YOWsPp3yngQE6f30FzE3eyz
 0r5gEGPrEbHQdUengee/ky1zEAIVLTFDKv7zHSl9BfCSqNhZ8SVc3uOhmje5BJTowTTT
 vTfA==
X-Gm-Message-State: AOAM533SUIBFCZXyr2oHM8wgv9oKJWu3zY5dFimf9SelH4T54x3/TziX
 6blm3wmIgFAWPhXWKuEdbKWIfktLbknvMA==
X-Google-Smtp-Source: ABdhPJyFswN/003RNNRts2+Fs2np3FpnafbL9bH2BV2kFj+nR4cbXLKqTvdpw2suQnTcJJVKOOnKtw==
X-Received: by 2002:ae9:ed82:: with SMTP id c124mr2918341qkg.275.1633189554141; 
 Sat, 02 Oct 2021 08:45:54 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id v17sm5225833qkp.75.2021.10.02.08.45.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:53 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 08/16] Revert "drm/omapdrm: cleanup: drm_modeset_lock_all()
 --> DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:34 -0400
Message-Id: <20211002154542.15800-8-sean@poorly.run>
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

This reverts commit 6067fddc1a4fdf155787ab6182c192e4b360b73c.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/omapdrm/omap_fb.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index fa7636c13c19..190afc564914 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -9,7 +9,6 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_drv.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
@@ -63,17 +62,15 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
 				  unsigned num_clips)
 {
 	struct drm_crtc *crtc;
-	struct drm_modeset_acquire_ctx ctx;
-	int ret;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, 0, ret);
+	drm_modeset_lock_all(fb->dev);
 
 	drm_for_each_crtc(crtc, fb->dev)
 		omap_crtc_flush(crtc);
 
-	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
+	drm_modeset_unlock_all(fb->dev);
 
-	return ret;
+	return 0;
 }
 
 static const struct drm_framebuffer_funcs omap_framebuffer_funcs = {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

