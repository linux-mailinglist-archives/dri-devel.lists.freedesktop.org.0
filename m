Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 262AD296E8E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3B26E50E;
	Fri, 23 Oct 2020 12:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170BC6E528
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 13so1238742wmf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WpciX4s5+nlfIa0YzJ767hWGBGfbGF0VES+27qIdEFs=;
 b=J9sWFy2gzJ1Dok7rcOH6CNe0XN20KAII9MafGe1PS+QJmPZvoSHXniU88wRvt7gw4q
 /1cE/6KF46gTruQUayS7I3BHvSWFM0icO32sKC2GbWQGx1ocVE5DxbzQT/ArCpDCbK2I
 /1ODjBl7GbjcZUBqLnrhaeo8JYHiJBIdd69Qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WpciX4s5+nlfIa0YzJ767hWGBGfbGF0VES+27qIdEFs=;
 b=q04xJVvEQQZQqwvu2WgcXo/V3i4b6hjfjqcgT5ufM4n/DfZq/jE+ew6/HALGsWIDyW
 RD/SDntz0gEblm3KT5WFtGd94irB6D9JS+3mCcN5mP8QjDi+vxbtlha5PfC8qH5/J6OV
 ZYnOyX7CU58PGiMEulpX2sfCGr+Irwfx6yjz7WM5N+nvPuTbYrB7Dw4du2cgsSbMKoMM
 1LT7ozAlK1vRb0sj2siVIHdS3XJQy/VL2CC9mRKh8/DtyBIaR1a7gZY5kFO1NfD10AQx
 lVeqyDMZz6gJbVQV8DvOiS3IldG4JZUArHhEKIgXd89aXaOXnG1xQEpIzHfJjTutRWFb
 H9sg==
X-Gm-Message-State: AOAM530x68I8SJ+rfqD32Tahj4ANugAMD5UagoBW0Z3EFA5HYEL6+vcK
 QQ7ujz7qDQlKIawlGqyrKhjUsTn8RzNYN0Rp
X-Google-Smtp-Source: ABdhPJxlg1hFdch0AxpXEOvF8l5c3kKvsMw0loEoF9U2y4zvlEd/eoB0b+NxK96R9voKKR7YBwl9GQ==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr1992355wmh.94.1603455743250;
 Fri, 23 Oct 2020 05:22:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/65] drm/doc: Document legacy_cursor_update better
Date: Fri, 23 Oct 2020 14:21:13 +0200
Message-Id: <20201023122216.2373294-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
