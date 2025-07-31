Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A7BB173D3
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450DF10E7B4;
	Thu, 31 Jul 2025 15:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1095510E042;
 Thu, 31 Jul 2025 15:17:37 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso4829395e9.2; 
 Thu, 31 Jul 2025 08:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753975055; x=1754579855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vG9n71NDhvvhpS5AF7y2C5d06t++b4vuCCmviXKpMXI=;
 b=HTMFOK71smMdI/lOXNi/Hr4ktK+TaIG6ZsEvt3KTXidDR46uEP3nMcNI4Zips7eOQc
 EGSsaBDvhKNQcqSVrrkkis+QeaC9XUpdtMze4oeXFKR8I6VgqhI8YhuPwwyiwNkvWckq
 S68sWOcbA1EAgy2V7kvq6ElD9EcH52cpstes6R2vpaLKud5UFNG6JrjA5YJZC9ixuW18
 XN/fQJEfbgQ9ayhVzbFYXB+NT641x5yOc7DMg+bDGS3NmaUjDOmMnWHa8x6onCfdQns+
 BCrHS3/A2AZdgWAmvgKf6xylktUpptjihKBxAT2SUgygcajhCKlyW2nu7mgZ318Txzok
 JRXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx+MifmkeI2PzBlChJrRYOL3doFB+LlqLPoqS76adkRz4EQyH6ntmGyEbk2efnSUXEOcE+8IpTgb3/@lists.freedesktop.org,
 AJvYcCXyypwoXs1QbHM1ekwLWv/ij6W/NN6WmjLtGmhQOJooJy9bkFpGliyDRSLi4R8jkg7RMQ9hiyJw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo+WXHTXvY3q7O0a5YkCLvatDp4RmHno5dQ/yFulA6DatMWFqt
 g/v7F6W5M6kUF7eByOMAdxbS8u5tiixo6o+mX7wCWTAV0XJFuKIpVXJe0K6cg8vKn90=
X-Gm-Gg: ASbGncuAXSwWVPA2VCSvjf2UL9TZqWbQ4mfMsN8xBdnEawsM/1rgYFrJ/Qg4wrCJTtf
 fXQrIeuTegwB2TdhM5pMCKRYn+Tv0P6cuKvp8QSs/htGrU2br47gHqtzp2mycZJ/V8DiJGdr6jL
 qVNKtDpWvhpnw3oP4Dbv+/YGpqtCpQpmMNNV0P/SRHzcaSxjg/unpA3HiAcYlawdXiKLroYFd2Y
 JuExHzKcbmjP/XPtlWCxrK1SPif/wtOzqy2NHRJCDtfnEp64th/0kYdl9akiQiXXQEOYB9ooHXn
 M0u3L2f6CLJyPpDvuy4a7xteuZWoLe1hdwZAybwb94VPW5k5F+SsjmnugGdgiP7H/Lr7c7Rf+zR
 gAX8xmEj3HUydyg14MEr297RjO5A0s/KE9+kqW9nf9Hiv
X-Google-Smtp-Source: AGHT+IFLGMykw8L7Mi6+jHo4qQa+KzbEszEWWNjWZr6/HQ6oWJ9JrG/AadoKcKApGnU4fzd7e0ti+Q==
X-Received: by 2002:a05:600c:1da8:b0:456:1006:5415 with SMTP id
 5b1f17b1804b1-45892b92eb2mr65403925e9.6.1753975055303; 
 Thu, 31 Jul 2025 08:17:35 -0700 (PDT)
Received: from xavers-framework.fritz.box
 ([2a04:7d84:aac9:db50:f8c3:4ba6:f1c6:fef5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee4f089sm33092425e9.20.2025.07.31.08.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:17:34 -0700 (PDT)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: xaver.hugl@kde.org, andrealmeid@igalia.com, chris@kode54.net,
 naveen1.kumar@intel.com, ville.syrjala@linux.intel.com,
 mdaenzer@redhat.com, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexdeucher@gmail.com,
 arun.r.murthy@intel.com
Subject: [PATCH v2] drm: don't run atomic_async_check for disabled planes
Date: Thu, 31 Jul 2025 17:17:32 +0200
Message-ID: <20250731151732.9295-1-xaver.hugl@kde.org>
X-Mailer: git-send-email 2.50.1
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

It's entirely valid and correct for compositors to include disabled
planes in the atomic commit, and doing that should not prevent async
flips from working. To fix that, this commit moves the plane check
to after all the properties of the object have been set, and skips
the async checks if the plane was and still is not visible.

Fixes: fd40a63c drm/atomic (Let drivers decide which planes to async flip)
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4263

Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
---
 drivers/gpu/drm/drm_atomic_uapi.c   | 51 +++++++++++++++++++----------
 drivers/gpu/drm/drm_crtc_internal.h |  3 +-
 drivers/gpu/drm/drm_mode_object.c   |  3 +-
 3 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c2726af6698e..df298ac49dcd 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1011,7 +1011,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			    struct drm_mode_object *obj,
 			    struct drm_property *prop,
 			    u64 prop_value,
-			    bool async_flip)
+			    bool async_flip,
+			    bool *needs_async_plane_check)
 {
 	struct drm_mode_object *ref;
 	u64 old_val;
@@ -1068,7 +1069,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		struct drm_plane *plane = obj_to_plane(obj);
 		struct drm_plane_state *plane_state;
 		struct drm_mode_config *config = &plane->dev->mode_config;
-		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
 
 		plane_state = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state)) {
@@ -1084,22 +1084,14 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 				ret = drm_atomic_plane_get_property(plane, plane_state,
 								    prop, &old_val);
 				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+				if (ret)
+				    break;
 			}
 
-			/* ask the driver if this non-primary plane is supported */
-			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
-				ret = -EINVAL;
-
-				if (plane_funcs && plane_funcs->atomic_async_check)
-					ret = plane_funcs->atomic_async_check(plane, state, true);
-
-				if (ret) {
-					drm_dbg_atomic(prop->dev,
-						       "[PLANE:%d:%s] does not support async flips\n",
-						       obj->id, plane->name);
-					break;
-				}
-			}
+			/* Need to ask the driver if this non-primary plane is supported.
+			 * Note that this can't happen here, as the full state of the plane
+			 * is not known yet */
+			*needs_async_plane_check |= plane->type != DRM_PLANE_TYPE_PRIMARY;
 		}
 
 		ret = drm_atomic_plane_set_property(plane,
@@ -1394,6 +1386,10 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	int ret = 0;
 	unsigned int i, j, num_fences;
 	bool async_flip = false;
+	bool needs_async_plane_check = false;
+	struct drm_plane *plane;
+	struct drm_plane_state *old_plane_state;
+	struct drm_plane_state *new_plane_state;
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
@@ -1450,6 +1446,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	copied_props = 0;
 	fence_state = NULL;
 	num_fences = 0;
+	needs_async_plane_check = false;
 
 	for (i = 0; i < arg->count_objs; i++) {
 		uint32_t obj_id, count_props;
@@ -1512,7 +1509,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			}
 
 			ret = drm_atomic_set_property(state, file_priv, obj,
-						      prop, prop_value, async_flip);
+						      prop, prop_value, async_flip,
+						      &needs_async_plane_check);
 			if (ret) {
 				drm_mode_object_put(obj);
 				goto out;
@@ -1521,6 +1519,25 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			copied_props++;
 		}
 
+		if (needs_async_plane_check) {
+			plane = obj_to_plane(obj);
+			old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+			new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+			/* only do the check if the plane was or is enabled */
+			if (old_plane_state->visible || new_plane_state->visible)
+			    ret = -EINVAL;
+			if (ret &&
+			    plane->helper_private &&
+			    plane->helper_private->atomic_async_check) {
+				ret = plane->helper_private->atomic_async_check(plane, state, true);
+			}
+			if (ret) {
+				drm_dbg_atomic(dev, "[PLANE:%d:%s] does not support async flips\n",
+						obj->id, plane->name);
+				break;
+			}
+		}
+
 		drm_mode_object_put(obj);
 	}
 
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 89706aa8232f..111907a55d9b 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -260,7 +260,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			    struct drm_file *file_priv,
 			    struct drm_mode_object *obj,
 			    struct drm_property *prop,
-			    u64 prop_value, bool async_flip);
+			    u64 prop_value, bool async_flip,
+			    bool *needs_async_plane_check);
 int drm_atomic_get_property(struct drm_mode_object *obj,
 			    struct drm_property *property, uint64_t *val);
 
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index e943205a2394..ec471536cfbc 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -540,7 +540,8 @@ static int set_property_atomic(struct drm_mode_object *obj,
 						       obj_to_connector(obj),
 						       prop_value);
 	} else {
-		ret = drm_atomic_set_property(state, file_priv, obj, prop, prop_value, false);
+		ret = drm_atomic_set_property(state, file_priv, obj, prop, prop_value,
+					      false, NULL);
 		if (ret)
 			goto out;
 		ret = drm_atomic_commit(state);
-- 
2.50.1

