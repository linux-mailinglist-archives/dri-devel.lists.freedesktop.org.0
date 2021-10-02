Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C81641FCDA
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18536F4B3;
	Sat,  2 Oct 2021 15:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760E76F4B3
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:46:04 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id j13so11952213qtq.6
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGu7HS3q7vp4215UEX9eUXFM4TcIudbW7tcMBeFTMTk=;
 b=OiuRE/Ldo7Sd00BHfv4yswSuYIra/5ssuWXmZ08qWBEe5v4/rvaMh2/dnRsQzPbtu3
 UaKegs/sVIlqdIC52+ckyvYEVHr2vWysIEqW/VmXDr11uqc0p/Kz+OPI1Y0SAaKxSu+s
 AoQaZfzxyezhLCVmmTyXoxQeu/gaOSLF0Y128nzlMkGQI3hhj/B/IKg56PD0rzzlI73c
 IVyR+EgMN1nYHtB7qWX6TBL3uAE4BT+kzuZPshUL3D8SqpDpQRr4nM3iq8dyI+bTgrq2
 dV82pev/vtQesJG9VirdiXPTRAu3DaxVvrAn3bdZ0afh8kv3hkGOPY3yE3Dp/tdyKnxp
 S1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGu7HS3q7vp4215UEX9eUXFM4TcIudbW7tcMBeFTMTk=;
 b=z7yLH+3kUyJudKJhwRXiAbZo+PjkAzBdjDeYVrSpNFSOAMQ6m9P6+IBquVd52xTtnF
 1zMFgvTAl4cNQYrAUjtx7saTZmWvjmHZxDwpt2MSQyYuZc3mUOJ/cpZ01oEqzbm0Zzhk
 r01GEZWbkyopBP69InI1IpPEE9oRnIEpzEmyXeHc0OgfggZ6U+xAynE1xvzUshz/AnRW
 RmmyYkcQIeTwxlZbYeaoNseVxrX1GG9ZmtHVg2JV61SEsP0Jv6RXqtJiVFx0LZa0Bw0g
 m/eyQ6We4z/M7TdVhqh3BouMTbJehZU9I3VJrRiq+51EgnPRuLc6kebfc88xR0Lv426B
 0dcg==
X-Gm-Message-State: AOAM530QPwLIs9Ne42Cknu1sqV7uiuvCG7SJ6COKmFH7O/GtkVzLOrgd
 3fOc93keEbYC6uZz64ezqtv8rBkFztGLEw==
X-Google-Smtp-Source: ABdhPJyllzgtupSol7d1am+p/lwxqMzKKFuFG6BCrF9JhkWq+0Hc0Qlqw217LTXy6Qg0tWjQLwd2FQ==
X-Received: by 2002:ac8:4248:: with SMTP id r8mr4091878qtm.288.1633189563563; 
 Sat, 02 Oct 2021 08:46:03 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id v201sm4836651qkb.29.2021.10.02.08.46.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:46:03 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 15/16] Revert "drm/i915: cleanup: drm_modeset_lock_all_ctx()
 --> DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:41 -0400
Message-Id: <20211002154542.15800-15-sean@poorly.run>
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

This reverts commit 399190e70816886e2bca1f3f3bc3d9c544af88e7.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2bf01416d656..134a6acbd8fb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -43,7 +43,6 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
-#include <drm/drm_drv.h>
 
 #include "display/intel_audio.h"
 #include "display/intel_crt.h"
@@ -13477,13 +13476,22 @@ void intel_display_resume(struct drm_device *dev)
 	if (state)
 		state->acquire_ctx = &ctx;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	drm_modeset_acquire_init(&ctx, 0);
 
-	ret = __intel_display_resume(dev, state, &ctx);
+	while (1) {
+		ret = drm_modeset_lock_all_ctx(dev, &ctx);
+		if (ret != -EDEADLK)
+			break;
 
-	intel_enable_ipc(dev_priv);
+		drm_modeset_backoff(&ctx);
+	}
+
+	if (!ret)
+		ret = __intel_display_resume(dev, state, &ctx);
 
-	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+	intel_enable_ipc(dev_priv);
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
 
 	if (ret)
 		drm_err(&dev_priv->drm,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

