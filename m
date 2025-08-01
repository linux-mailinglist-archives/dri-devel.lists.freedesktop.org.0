Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33CB1822C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6667710E848;
	Fri,  1 Aug 2025 13:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461F10E847;
 Fri,  1 Aug 2025 13:11:06 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so1251513f8f.3; 
 Fri, 01 Aug 2025 06:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754053865; x=1754658665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WU58hiZv14QoAb2coHWJzb0B6YUhtUSyBlxR4s/xk3Y=;
 b=jcaZcq1dhEizPE7EOS6pAWB2A9tByYa5o26EpkDc4clwYnNyp80aMCfPNoV9a9aIf2
 1eK+Yv2F0TDXmRcBr+TSRzrWucuIUmr+oAAgWgSAD1L6j1o/gZX9YHaCL+OAo5YAe2tV
 Ww4CLhHhDOUwTScNsmAxx0wZO5U/j3/AAYVMD6yTwbk3Zzt5NGeMAlJKfIysm6Qq0vgC
 E+2uDL7rBETYRnyPUG2xnkAYzcXeKA2Xuo+EouvavluQCmMvKfhSnicE4Fx/gHfMtAE7
 So8goNcD3dTOKEB9rmlJkKY9OteZoxfbXkP1wsCs9Ofp0SsRsLKS7k5HsEjln1+zsHwn
 SbUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYhziri16hpW7siyFcmNsoze/Mlku6MlO4OLVcMjnjUxb/aQsZtWqcpNrP5fVEhbrWsKfscRJT@lists.freedesktop.org,
 AJvYcCW1hPLQjCuolcO0cnQ30LxLkPPfL+sjZcHyNq0p4qGmMRsfKzD5vAe0emdEhdIhVSHuRGpBAagrlJju@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ9+ua99wARCDKSdiQxr+hsW/X08NmbjpYok3jKA0WjFGTN0d7
 zS2hwrbcgHar2mecvjGdJYnOwbLpwC6X7EyAZs3+7b9JGuvhb/rH4ceTiPXdEHrGaLc=
X-Gm-Gg: ASbGncvW05vxprGKEwLCgafGhHiarUEqelHeS+gSl8SojUF4qaBCO7NZ1RGe7UEIIt2
 o5NxK94RxNE3n8siWPz1yu3UxqE5Yq6dqX3Rpy3EZ/QUjn+B6Ohm2LmqZIb9Vy7Y6QQouARCGHY
 CpuxwvYl1EftZr0xNPQ+RtSKQ78WPm1U+XUBswzfwUja8KzMVMh+GfLwhOHMMANchTT8DjybKJ0
 7iRf39TqIZIO2Ka6dS+DXBP37Rx/INgHrjK20cDRdRuYxAiwP/B+DsVrmGjv1Vh1cdWy7hBTTE/
 TQVb//4EqxGobh8HPXEMMVKB2TR5hMttkDP5CqM9f5UG0JbBAAdN4yyaBws/SD36NjixPZ6dDwv
 jH+ULUEtIEsZyak09qlNb/v08wO+EGfPQ8J+Xyk/oMSj+uK/+bJtQ79w=
X-Google-Smtp-Source: AGHT+IH1aibYc/RancdGBgJIc2PbDVdcjUdNJ0HKf9lkBt5l67CDRMmhfSnUiSN/5c9Ucyn6dxgPHg==
X-Received: by 2002:a05:6000:2890:b0:3b7:7cb5:a539 with SMTP id
 ffacd0b85a97d-3b794fed101mr9316042f8f.18.1754053865135; 
 Fri, 01 Aug 2025 06:11:05 -0700 (PDT)
Received: from xavers-framework.fritz.box
 ([2a04:7d84:aacc:d4a0:5576:52b6:171a:57c8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589536bc34sm103315635e9.2.2025.08.01.06.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:11:04 -0700 (PDT)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: andrealmeid@igalia.com, chris@kode54.net, naveen1.kumar@intel.com,
 ville.syrjala@linux.intel.com, mdaenzer@redhat.com,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexdeucher@gmail.com, arun.r.murthy@intel.com,
 Xaver Hugl <xaver.hugl@kde.org>
Subject: [PATCH v3] drm: don't run atomic_async_check for disabled planes
Date: Fri,  1 Aug 2025 15:10:53 +0200
Message-ID: <20250801131053.6730-1-xaver.hugl@kde.org>
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
 drivers/gpu/drm/drm_atomic_uapi.c | 51 +++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c2726af6698e..2ae41a522e92 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1068,7 +1068,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		struct drm_plane *plane = obj_to_plane(obj);
 		struct drm_plane_state *plane_state;
 		struct drm_mode_config *config = &plane->dev->mode_config;
-		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
 
 		plane_state = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state)) {
@@ -1084,21 +1083,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 				ret = drm_atomic_plane_get_property(plane, plane_state,
 								    prop, &old_val);
 				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			}
-
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
+				if (ret)
+				    break;
 			}
 		}
 
@@ -1394,6 +1380,10 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	int ret = 0;
 	unsigned int i, j, num_fences;
 	bool async_flip = false;
+	struct drm_plane *plane;
+	struct drm_plane_state *old_plane_state = NULL;
+	struct drm_plane_state *new_plane_state = NULL;
+	u64 fb_id = 0;
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
@@ -1521,6 +1511,35 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			copied_props++;
 		}
 
+		if (async_flip && obj->type == DRM_MODE_OBJECT_PLANE &&
+		    obj_to_plane(obj)->type != DRM_PLANE_TYPE_PRIMARY) {
+			/* need to ask the driver if this plane is supported */
+			plane = obj_to_plane(obj);
+			old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+			new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+			ret = drm_atomic_plane_get_property(plane, new_plane_state,
+							    dev->mode_config.prop_fb_id,
+							    &fb_id);
+			if (ret)
+				break;
+			/*
+			 * Only do the check if the plane was or is enabled.
+			 * Note that the new state doesn't have "visible" set yet,
+			 * so this uses fb_id instead.
+			 */
+			if (old_plane_state->visible || fb_id)
+				ret = -EINVAL;
+			if (ret && plane->helper_private &&
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
 
-- 
2.50.1

