Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC00B0F68A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 17:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC4210E17D;
	Wed, 23 Jul 2025 15:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F1510E17D;
 Wed, 23 Jul 2025 15:08:35 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso4119088f8f.2; 
 Wed, 23 Jul 2025 08:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753283314; x=1753888114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JlKXDF6nWZ/vsyDYBF/wvr2qpbqXxVXgrfljy3StO68=;
 b=j5gXI6U472hI/S9122jT/Bpoxk31+JJHPpbGPDgR6jJTHsOzenB9VtWNqSPc9KPi6o
 2/T4Zm0jas5qK7suxakvST0NcQurBaYSi4oDZLXWRd1ohW14NjPZFXLt6jfNO2zvyt0t
 j/8COkqR0lttD3Ur9b9XyPo/fL7xfwhOUcI/II3xAwLUtsC/tG+rVJjO7yOqCXTOBqaj
 t5LBDLx4rZ4C4NGKV7UCxjyzSC0ZjMJmtSvcjUkdttzM8iB6qYnL9reOjxr15juCHUHu
 GE/J+KjePHLeC7qiI0I5e7hdc55JK9or36/Ydjzat8efFd2T2rudl9N/2O/yMb9uUf1J
 VkZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAkfWGZ1ewh0mm35xjRwiOy3gh+owJepfJks9rBjFuSr7zSdeVvd7Kc0Ol8CPMqNda5x8Yx92y@lists.freedesktop.org,
 AJvYcCX+D1WIhchkBKAAsAd5/H3l79fXtSrQV63qzRaCK6S6upSjdUi8mVm7kDHt9SgcEn+ERAOBz204oZE0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL37xPxoxxj7FJPD4v/qpLssAYMTLVNARpU5NVtBHmU6lHaulp
 BMQ5ZbEZ+myPoYckJrO7VAPxR2F3bt2jTKyMhb42woC43Ry9j7y8X7Zim0kStpRxpBg=
X-Gm-Gg: ASbGnct00vd5oxkLAs6EZEr8f9CBIuwdz4bIFSkcEC4IrejGgOoWNIchLSu0u7lgnro
 ehouWEs8u8mUQju391WBEWfrx4vLQE5VJU21i4AiszsHUmQSTtQUJ2NJRsZcbMLoQqPvzP0Ckf+
 UZAaE3BnIADwT/SXxNGCAAObeSjgGVtzazhbtUh3+fPgeA+gBgFw1WrokvZm2fali4swQRib3xh
 z5g1Zjm9VJIpu/fkP2vhkNikRfMHRxlYtSZj7Ox/c1cr5ERn2gSDHbLDmozEDCWWZF/lApOT8F5
 VLG9uHDjh4fqmuU8aEXqx8BLi/lIsKTYlUQLSH5hLdO6X/F8Hut+ROYq5b1pPi4Ke/IMh/z/c/T
 7ABGN7jFd7/Nub8t/uxkm/oSHQttaE1tTEbFOSkYdi0dz
X-Google-Smtp-Source: AGHT+IFG22TEKJRsKCGmKJcD+w2qG7oznQaAuASUBW+hlSzkC2HlAMEa0E9gkEgT/2Ow83R50FxoSQ==
X-Received: by 2002:a05:6000:24ca:b0:3a4:e4ee:4ca9 with SMTP id
 ffacd0b85a97d-3b768cac943mr3029047f8f.23.1753283313725; 
 Wed, 23 Jul 2025 08:08:33 -0700 (PDT)
Received: from xavers-framework.fritz.box
 ([2a04:7d84:aacf:a9d0:bd85:56a9:7a6b:c1cb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca2bfafsm16748800f8f.34.2025.07.23.08.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 08:08:33 -0700 (PDT)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: xaver.hugl@kde.org, andrealmeid@igalia.com, chris@kode54.net,
 naveen1.kumar@intel.com, ville.syrjala@linux.intel.com,
 mdaenzer@redhat.com, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm: don't run atomic_async_check for disabled planes
Date: Wed, 23 Jul 2025 17:04:13 +0200
Message-ID: <20250723150413.18445-1-xaver.hugl@kde.org>
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
flips from working. To fix that, this commit skips the async checks
if the plane was and still is not visible.

Fixes: fd40a63c drm/atomic: Let drivers decide which planes to async flip
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4263

Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c2726af6698e..2e62561fd94d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1066,6 +1066,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 	}
 	case DRM_MODE_OBJECT_PLANE: {
 		struct drm_plane *plane = obj_to_plane(obj);
+		struct drm_plane_state *old_plane_state;
 		struct drm_plane_state *plane_state;
 		struct drm_mode_config *config = &plane->dev->mode_config;
 		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
@@ -1086,8 +1087,15 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
 			}
 
+			old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+			if (IS_ERR(old_plane_state)) {
+				ret = PTR_ERR(plane_state);
+				break;
+			}
+
 			/* ask the driver if this non-primary plane is supported */
-			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+			if (plane->type != DRM_PLANE_TYPE_PRIMARY &&
+					(plane_state->visible || old_plane_state->visible)) {
 				ret = -EINVAL;
 
 				if (plane_funcs && plane_funcs->atomic_async_check)
-- 
2.50.1

