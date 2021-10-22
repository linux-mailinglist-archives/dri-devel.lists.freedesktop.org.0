Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A847C43739E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 10:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168986E8FC;
	Fri, 22 Oct 2021 08:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEED6E8FC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 08:22:07 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p21so2076269wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 01:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXdqibzVXher+yn0TaEWhAcS+yma3hpFltnOTWJOHb4=;
 b=luxQVj+Y+au3KKD+pRom/5q8nAXuBjQOJPYvu3ax2A2Dv0J9vSwbWdjQfdqNJNY4dl
 rwu5+aVIUVfP2Y/4aTXu4j2Qbb5sBTUnmEoza4+BuscuKcQzZvjBUkfm8p1aPXZiKTKC
 X263jgbqXCX15TTPlHsFPbEYoOxhVopD3d3V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXdqibzVXher+yn0TaEWhAcS+yma3hpFltnOTWJOHb4=;
 b=Ed0Z30I3UGTw652GhfEO63DBjI5A2eJXv8hqCoiFF0sK14Y+5tlqudZ4V0YT4AIwEL
 PZKb/FzC06un4OhbQoxnomwklNz1Ukwr3tcaCZQZYmVCHgdGg7wmpsYxIn2hSObhmruO
 DJrQVFQkgSt+9mQwPlEBwopg6R+jhbc2U0neNE6ZzN+gE8bOTJ9NHWfXUnN2XVjn1RbR
 uipfbhuNmKta4yqvdNzkosibSW9ygGf3wSLfSKwxGlExL7bsz08mBBkg2G9HsRvt/rxJ
 /qAXTumJMA8J+83ISomyPQdonm0nUKRdRXYvEUXRxbkaC4SfhioD7JfyySPO+/ewDoVa
 9/9A==
X-Gm-Message-State: AOAM532dnbwlz/jh2Ks9sASzpdGpr4IAZ3ajRY6cGBpTEbWMP2HdCXe7
 jrLGw7ExI2JOTAbFWIsDe39n3A==
X-Google-Smtp-Source: ABdhPJzvvCWQwKZ+gAugDFHt0eaCYsjdldultXdVLKGy6clofiFbbVIwlejncaVB+Oy+ynBOoQeRAQ==
X-Received: by 2002:a1c:1f0e:: with SMTP id f14mr12369556wmf.65.1634890926112; 
 Fri, 22 Oct 2021 01:22:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z2sm6988169wrh.44.2021.10.22.01.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 01:22:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/i195: Remove some dead struct fwd decl from i915_drv.h
Date: Fri, 22 Oct 2021 10:22:00 +0200
Message-Id: <20211022082200.2684194-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gone with userptr rewrite by Maarten in ed29c2691188 ("drm/i915: Fix
userptr so we do not have to worry about obj->mm.lock, v7.")

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 12256218634f..2321f895cdea 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -191,8 +191,6 @@ struct i915_hotplug {
 	 I915_GEM_DOMAIN_VERTEX)
 
 struct drm_i915_private;
-struct i915_mm_struct;
-struct i915_mmu_object;
 
 struct drm_i915_file_private {
 	struct drm_i915_private *dev_priv;
-- 
2.33.0

