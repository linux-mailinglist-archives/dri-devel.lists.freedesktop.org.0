Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E26296F88
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62586F877;
	Fri, 23 Oct 2020 12:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FD06F62C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:39:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n6so1615538wrm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WpciX4s5+nlfIa0YzJ767hWGBGfbGF0VES+27qIdEFs=;
 b=Lg09kVA/TC+phyXr2IX0mua8MRqPtBfIo4d5vLaqbdE0CpR493Sg+vFnN44aI8zDLV
 r+LxdCzq1LqcmApfKePQe1EkWIPSC/vRctPmgwARDwuz3Mdjau+2FFZzMxwOUGJ+BJPA
 TBRjJuPBwSQSN/ciEudftjDBPuln5kecKD7VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WpciX4s5+nlfIa0YzJ767hWGBGfbGF0VES+27qIdEFs=;
 b=nqCpkDwkw1T+urehS9f9VPUjpbqrOI9ZkBwfe6A0Cw2XasrvKBH5K8qA0EF3bQKcOp
 p3TMp/GWiI4hn1baXNaU3OhfOZfRsry5kVp7+wXuLdLDmX2giEdYd66LM1ly8W+7rs92
 8+L1Rzqd2jASuHoI0gwjV5O663P0lem4fplAgVx/fGlVOMngjVqJ00SxvXAlh5TViH+/
 dJ/6uAGi7JUsCOQUQd0B1GQu7q/KLZ8DHWKUe9ENe302IveiUa5lp7wGi745c61Mc+AI
 HpO+aingk1neOv+6lMv3mVcC/cl12XOV5gtG16EmOQfosz8OMV0UTQFOWzaUq2m/9jMz
 0sAQ==
X-Gm-Message-State: AOAM530o/uoSjYQutJ2Ax+6gdPzxoF7UIWaPAZhSm1+nadp9ESXkquUa
 rd9PBBPF+nH9kWg3sadT7axYa+V6MWHjaoPO
X-Google-Smtp-Source: ABdhPJxov/z9JGQ/goN+8gRvDUoKmux6Ei3d9p5hk15hz3ivj6QLwybQibyApQ/mMQ+0x+ehjWQl0A==
X-Received: by 2002:adf:f1c1:: with SMTP id z1mr2424340wro.331.1603456773008; 
 Fri, 23 Oct 2020 05:39:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 133sm3286462wmb.2.2020.10.23.05.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:39:32 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/doc: Document legacy_cursor_update better
Date: Fri, 23 Oct 2020 14:39:25 +0200
Message-Id: <20201023123925.2374863-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023123925.2374863-1-daniel.vetter@ffwll.ch>
References: <20201023123925.2374863-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's the horror and shouldn't be used. Realized we're not clear on
this in a discussion with Rob about what msm is doing to better
support async commits.

v2: Refine existing todo item to include this (Thomas)

Cc: Sean Paul <sean@poorly.run>
Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/todo.rst |  4 ++++
 include/drm/drm_atomic.h   | 12 +++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 700637e25ecd..6b224ef14455 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -105,6 +105,10 @@ converted over to the new infrastructure.
 One issue with the helpers is that they require that drivers handle completion
 events for atomic commits correctly. But fixing these bugs is good anyway.
 
+Somewhat related is the legacy_cursor_update hack, which should be replaced with
+the new atomic_async_check/commit functionality in the helpers in drivers that
+still look at that flag.
+
 Contact: Daniel Vetter, respective driver maintainers
 
 Level: Advanced
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index d07c851d255b..413fd0ca56a8 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -308,7 +308,6 @@ struct __drm_private_objs_state {
  * struct drm_atomic_state - the global state object for atomic updates
  * @ref: count of all references to this state (will not be freed until zero)
  * @dev: parent DRM device
- * @legacy_cursor_update: hint to enforce legacy cursor IOCTL semantics
  * @async_update: hint for asynchronous plane update
  * @planes: pointer to array of structures with per-plane data
  * @crtcs: pointer to array of CRTC pointers
@@ -336,6 +335,17 @@ struct drm_atomic_state {
 	 * drm_atomic_crtc_needs_modeset().
 	 */
 	bool allow_modeset : 1;
+	/**
+	 * @legacy_cursor_update:
+	 *
+	 * Hint to enforce legacy cursor IOCTL semantics.
+	 *
+	 * WARNING: This is thoroughly broken and pretty much impossible to
+	 * implement correctly. Drivers must ignore this and should instead
+	 * implement &drm_plane_helper_funcs.atomic_async_check and
+	 * &drm_plane_helper_funcs.atomic_async_commit hooks. New users of this
+	 * flag are not allowed.
+	 */
 	bool legacy_cursor_update : 1;
 	bool async_update : 1;
 	/**
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
