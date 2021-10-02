Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AEE41FCD0
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572A26E852;
	Sat,  2 Oct 2021 15:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331C96E84F
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:52 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id r1so11905636qta.12
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yfwLzkt6Wj9LVEwuFs8Fztnt2JiRG84Pd19yKEZ5NUI=;
 b=RCjeOl3uXFKjeT5y8ChtMdFtoc/DemEDcrPtZjyyw3nZp9IvM0ANzEfPHeZ2+7hrde
 E2W3m+jQsxKA78uoct518AU8q7TcgqEzfsNwGbs1w95du2qCMiTiRHPTTMngFVVKvoIa
 /HMMWjTOSnTFyWq0cc8Ne2bbt6Vx6YQ3qJHoY9he8a9z6RCfrucHGqcNVv0/CjUf/Npn
 3SlhZry9Js4sVqJZDoXp/RhqxbzSElC/pVkAs05zy+9Kh0qP2ql40s8tgxPussID3TGB
 1NVHQ7hxMIPKRlT1hEAJoaYyb2OKrqAEQ/B4HnGNHAH/C1uPMkjfy9Au5G7xg6LnK1qE
 52mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yfwLzkt6Wj9LVEwuFs8Fztnt2JiRG84Pd19yKEZ5NUI=;
 b=RJbvQKFlQElFN+4Qlk1C8l34X0suXoZNj5vS8SAyj+e2MLxIwsl9lX2gMAL7Cvd3Qi
 Syar+Iz/QWj9gUgrcwIKk3p54Ex6j3x/BOEJrFljXtJZlUKalrr+XtiR43RFaGUyrUdK
 KG7WmYKhuuRg/RwpxMnB28um5nxv07JV2lZBWQXbTEiu9KwuM6vGgQ65f237b0y4RFR3
 55xfvF/6/gNZyNaPLonaXFEkD4FxB8OTjfLZS2jvH+XiB0Lgu0F9ccGFahsJx0gELI4J
 O/UpDoldOqvy2BjpNcTOJpdNDtUu0e5wBhgK4U171HAeBWfQduON6DlCrzeX/qOt/3EC
 R2jQ==
X-Gm-Message-State: AOAM533hLiAgBsgcxbJ5pqgD3mFytvu/LXLhcI6S2uaYpUWZ9hSv1hEN
 DL7cn+11T3pmwItnsbibR2GMjvPWTY2KuQ==
X-Google-Smtp-Source: ABdhPJz106eerF7z8gUKBA67+OS+VuQpCvzdGUO3aRd9DlN+U5+r0o9iIJcTO3vlaomxElGm4YZNJg==
X-Received: by 2002:ac8:514f:: with SMTP id h15mr2512036qtn.340.1633189551277; 
 Sat, 02 Oct 2021 08:45:51 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id f83sm4733612qke.79.2021.10.02.08.45.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:51 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 06/16] Revert "drm/msm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:32 -0400
Message-Id: <20211002154542.15800-6-sean@poorly.run>
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

This reverts commit fd49ef52e2db015ce69ad02bab0702489d141a41.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b89687074890..768012243b44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -18,7 +18,6 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_drv.h>
 
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
@@ -1173,15 +1172,14 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
 	struct drm_plane_state *state;
-	struct drm_modeset_acquire_ctx ctx;
 	struct dpu_crtc_state *cstate;
 
-	int i, out_width, ret;
+	int i, out_width;
 
 	dpu_crtc = s->private;
 	crtc = &dpu_crtc->base;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(crtc->dev, ctx, 0, ret);
+	drm_modeset_lock_all(crtc->dev);
 	cstate = to_dpu_crtc_state(crtc->state);
 
 	mode = &crtc->state->adjusted_mode;
@@ -1265,9 +1263,9 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		dpu_crtc->vblank_cb_time = ktime_set(0, 0);
 	}
 
-	DRM_MODESET_LOCK_ALL_END(crtc->dev, ctx, ret);
+	drm_modeset_unlock_all(crtc->dev);
 
-	return ret;
+	return 0;
 }
 
 DEFINE_SHOW_ATTRIBUTE(_dpu_debugfs_status);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

