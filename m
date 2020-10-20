Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B98293EE3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 16:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C260E6ECDB;
	Tue, 20 Oct 2020 14:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DAB6ECD1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 14:39:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e2so2201255wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+5oyjWFNJLLIgICGFFIyWwAg8GW7cmkYboY6N0kNZho=;
 b=i1BOkcgyr+olUM/WgT2oOcUoViGdX7PArVEJ/FgppYmwLSska/8WGOqVXFco05yey3
 ipwY6B6NrEzYygzVnYqWuts4pKwBU11yIVUvYkbDNdFmwza5mNaM6htWXCjVgrWADmW8
 tXBoeukNhu7yeHIHSNX/3yVnKhYyd9ncs3AS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+5oyjWFNJLLIgICGFFIyWwAg8GW7cmkYboY6N0kNZho=;
 b=dTEKlkqFQOafpa5iIuDuPDrNeslqE9B9wGITa9VF5fNPKwK4WLy3N2aX+v/vtlwY8e
 7mw+3vAmn1W1t3XrsY813EiRyFGXOXQDl6UUJAzcLG37jSoRrJkUWAfeKL1DHI2H3yxP
 wFlCtCJ85wHU2BMAU2EfrZ5lrq96fqNV40YIlJKbsA0TSlQKzbAeT9WQESaBKs63Y+Tz
 +nw8Zc0a+MOyabKrtMLJHihU8usR/hTqr6O9oCC9i1f/4+PaQtIbW4wSSPtbx12nGVbi
 Uh7SZT2W5u/ewna2V9Ib2Sh00Y3yb9QGlGnqG/LFP/UU7VfIp2w4/qIdWfWRizCCsSyf
 XoSw==
X-Gm-Message-State: AOAM5326gVS5svxMIKDnSKDZTN3SjfUqBVpydvXZC7X3YMHihH1DVt7v
 Pd9paTWG3FRegZ2WweNh9DTuc80gKo41LF5j
X-Google-Smtp-Source: ABdhPJzn8lbAN8bitPZxq9k92FD46KP+Yuaq1K+kT+CHW8m4M9XG0tz+nZ9XdLzh/Ko/LiL4TGHugA==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr3447769wmi.175.1603204784483; 
 Tue, 20 Oct 2020 07:39:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 32sm3458272wro.31.2020.10.20.07.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 07:39:43 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: Document legacy_cursor_update better
Date: Tue, 20 Oct 2020 16:39:36 +0200
Message-Id: <20201020143936.1089259-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's the horror and shouldn't be used. Realized we're not clear on
this in a discussion with Rob about what msm is doing to better
support async commits.

Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_atomic.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

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
