Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5799BCEB9E5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA2010E0D4;
	Wed, 31 Dec 2025 08:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="Gl5b+nSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F1210E83B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 05:51:16 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2a355c8b808so7976325ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 21:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1767160276; x=1767765076;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ox1sScn4c4CV8wT4gbWelZga9X+ZR/e5mSgfUmub5LY=;
 b=Gl5b+nScrnMRu6SLZFRGCrqNHs8dZcWuUYj/6QqDzWsfAIf+zrQCl/AYNmzhVjxTM/
 dZmoi8VEz3cpaNpXDpAKTlbGczCjA804a0bMVLAkQTpfWxU0y3WLvyP5ZfuCiZO9hDfB
 4oEG32g+5b+I6QtYX+lOx3B2HEmywSixTFOKx9E9JPShNqsa8/OOPuiZjGgSrm67p/2O
 CjawRGiwK0yg3LzFr3izqP2jbX7Uhqv8jQN/Oz2o0Kioh4btl/H60jFLIk52rMRHvQvD
 IuD8EiSwVWuFwCvlWT91+ZlsoQtjUK92e0bLiDU94n5b4A7OJXUV1CxbtdI1sG0s+pWW
 kreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767160276; x=1767765076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ox1sScn4c4CV8wT4gbWelZga9X+ZR/e5mSgfUmub5LY=;
 b=HKWG7JIdeRdZk6ecWwQhFFs2xLPY2ZFsmoud9CWpfDqoYh+IJlTfs+VLIPGkodWeLJ
 1+X2safOOC5hHtZ+B80jGqnt30s4Dt2HDE+125ItnI2+VfAqx5RJNUAFo+Q8XzOOds89
 DyCx2v3UQIXdYiN1OSXDuMnwQjMCT5fJwTcJ1zSmYfyY8MzLOcI10DwyVk6UvBAt0iTy
 gaWnmg9pYMHD/hpJFp3MzFkPGhcqktVltM1mMNVvrk1ImGFYCeRvlI8RWWQtxGZazUO/
 SemW11KR8BcbOaprdtqDtaHFG6s534oiEE4ZJs3Eg/66GQcOPJjfqYzwhEtWzxp3BxeA
 /gHw==
X-Gm-Message-State: AOJu0YyFYoE5svThY6dZ8GDlwhsw/HQO47R+7AHBw3xQNsQ8nxXilB/F
 cSX8i6kUMOW0Q5IPYqbqruDKpnrylWQ0c45Z63yQ0dGhg7ZqVyVpvtvsrJCWRv2+r5o=
X-Gm-Gg: AY/fxX46/rMyJzPtl/n8FuydLYOTcA7j22r3gnHwy2wNYSqo9ILNxLNzgXtk4DLA8Nh
 /Fy+5w+ALm4esUvzaXQMnOry/G5VgGExsH/d/4HZMVQpP4D9L3CACvkVB09cLfvY84ZJx0EhIom
 SAxjyr2d6+4DNOe6KMRGcUmk1UomGS18+WwDLC6Ggo6ISJSTBy9uv6EtHLo4ou4qYyfd7+JVYfu
 gqpIYHNOX+qqaoKamwdViXisuq1w9LJJXCKLhG9nxEjDToNZNI0WT6UsA6JwnzrHbOcIC8UO3Ib
 xRus/KNctC02cDuIc58LDebFyPy/+g+GzKk/dnKMpXXix+DS5Ayl0bGFyoi6xtK8Vk6S3gGgORc
 mAhlf2aHuv1y00vPdyjr8To+MAJCm/LnZcNp5s/b2lsMb0CgCbiKm5kh1YmDGgQmUNbA8GuKMzF
 hgP7n7qnpb
X-Google-Smtp-Source: AGHT+IH+SJCLRGbFnHD/9ov5lxSc2acUFHvTWvu9Zh+w1Qf+XfCP+KEdc52eyzfiW6cDM59bSGcPFA==
X-Received: by 2002:a17:902:c405:b0:297:df7c:ed32 with SMTP id
 d9443c01a7336-2a2f1f7c269mr251956935ad.0.1767160275921; 
 Tue, 30 Dec 2025 21:51:15 -0800 (PST)
Received: from localhost ([132.147.84.99]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2a2f3c6b7b0sm318073125ad.16.2025.12.30.21.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 21:51:15 -0800 (PST)
From: Shenghao Yang <me@shenghaoyang.info>
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shenghao Yang <me@shenghaoyang.info>, stable@vger.kernel.org
Subject: [PATCH] drm/gud: fix NULL fb and crtc dereferences on USB disconnect
Date: Wed, 31 Dec 2025 13:50:26 +0800
Message-ID: <20251231055039.44266-1-me@shenghaoyang.info>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 31 Dec 2025 08:54:47 +0000
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

On disconnect drm_atomic_helper_disable_all() is called which
sets both the fb and crtc for a plane to NULL before invoking a commit.

This causes a kernel oops on every display disconnect.

Add guards for those dereferences.

Cc: <stable@vger.kernel.org> # 6.18.x
Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
---
 drivers/gpu/drm/gud/gud_pipe.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 76d77a736d84..4b77be94348d 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -457,27 +457,20 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc *crtc = new_plane_state->crtc;
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *crtc_state = NULL;
 	const struct drm_display_mode *mode;
 	struct drm_framebuffer *old_fb = old_plane_state->fb;
 	struct drm_connector_state *connector_state = NULL;
 	struct drm_framebuffer *fb = new_plane_state->fb;
-	const struct drm_format_info *format = fb->format;
+	const struct drm_format_info *format;
 	struct drm_connector *connector;
 	unsigned int i, num_properties;
 	struct gud_state_req *req;
 	int idx, ret;
 	size_t len;
 
-	if (drm_WARN_ON_ONCE(plane->dev, !fb))
-		return -EINVAL;
-
-	if (drm_WARN_ON_ONCE(plane->dev, !crtc))
-		return -EINVAL;
-
-	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-
-	mode = &crtc_state->mode;
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,
@@ -492,6 +485,9 @@ int gud_plane_atomic_check(struct drm_plane *plane,
 	if (old_plane_state->rotation != new_plane_state->rotation)
 		crtc_state->mode_changed = true;
 
+	mode = &crtc_state->mode;
+	format = fb->format;
+
 	if (old_fb && old_fb->format != format)
 		crtc_state->mode_changed = true;
 
@@ -598,7 +594,7 @@ void gud_plane_atomic_update(struct drm_plane *plane,
 	struct drm_atomic_helper_damage_iter iter;
 	int ret, idx;
 
-	if (crtc->state->mode_changed || !crtc->state->enable) {
+	if (!crtc || crtc->state->mode_changed || !crtc->state->enable) {
 		cancel_work_sync(&gdrm->work);
 		mutex_lock(&gdrm->damage_lock);
 		if (gdrm->fb) {
-- 
2.52.0

