Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B69B31E90
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3010610EB57;
	Fri, 22 Aug 2025 15:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD3310EB56;
 Fri, 22 Aug 2025 15:29:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3b9d41d2a5cso1863112f8f.0; 
 Fri, 22 Aug 2025 08:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755876563; x=1756481363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gJgKLDUPdXVCUlCaSiGVYunhzBERjuDsUpRK5nlbwuM=;
 b=ml3VSLVQS9z0LNyySRoLaNbwaevpJ1fLqfH86UpFbU4950WyV9DJLGMZKN6k9BHXS5
 RyOgHw/tNauVXG8j8Z5v0TivH33HJp3TnBrrmS0EtDfnti/om5LVw63TFQEEJS7K0Snt
 BrHj+Wme5q83yIDE97biGiKwjSRC95Ydt5GxU0oXRHb5+8j/v+nk+BuNaDPpAdcD7zI5
 VTRGhRRB48q3OkuQbO7skJFP5x6jsy5zG035gG6romtJgT34YaV6Yk/GXbGICkjRO7L8
 EsQGwteP8OQc7CXduspC24+RsRmtCWFPHN5ZIhJQyHlxZqiHXzKMCEuzKTSjm/7FwDTe
 3Pzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU24iAdK+x0YuhX8ghoL/Ss7HdQ4stdE/Piit9RvCqZBmPkcadLP1/nJx3YfZbVgZKlHa2TLQ48BdsP@lists.freedesktop.org,
 AJvYcCWC7qFnxkpN/fAYaeNgfiQ6gb5+ci7yw/tdv2EvvC+csWnWU7wKz33oxoeVRBgtkGQ0Sy5RzqVA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG98cJHdzCJBgRTPoCyle0OIiML+mYqiZH7zuha6aajqNuV4B/
 W7yWVFN4nK3j5mAus26Fsg583lIa+DmNMUuX7ZKHEsgXChmK92O5qYkIovDV/IOT
X-Gm-Gg: ASbGncsiS46vppiFXFk7WUE4g5bRy4nZe6HrndHjaX4e9FyQ0JU2Z7qbSmqWrdFnAQM
 i+PswgMUOnfyuCZrbYvUSof+DZJb7bjcRe6pizk7fjmSz6Lxky2D6zH5MW42upuCJHSYe1ncXcn
 JyIsHrVH8eHbwZGczu7Ae9IqQ8LKMHrDPAbEQF3aAw/ldc5odN/jB9c7aN86fR8kpIVSrJ1EHp0
 ldAO+BJ1NiG6+G7VA5voHF94cU8Y1CGSwjLAi+eVApg49IDugDDLhzi+DTmF2FKlypHgFg2CPuS
 TuP3j82y3785u4zkHnFaHvJoZ56k5XSV7pA1Gqj74PAOS5cWXmIbif/yxo0mP+WPkhqWynewmlB
 beYhgAUik5ChtYtzqQ89xzwv+kAs/X3ijdFOyNvVPeA==
X-Google-Smtp-Source: AGHT+IEZeUqnk+C2nBdmGBlUSORXPpPFtZzw9ZapY7b13xyWG8wBDtZLMVt/coy2IqS3RfPDnB6WNg==
X-Received: by 2002:a05:6000:430b:b0:3c6:9e21:f61b with SMTP id
 ffacd0b85a97d-3c69e21f717mr1243368f8f.3.1755876562803; 
 Fri, 22 Aug 2025 08:29:22 -0700 (PDT)
Received: from xavers-framework.fritz.box
 ([2a04:7d84:aac8:dfc0:164b:fd3:2e86:21ca])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c684524163sm1661402f8f.61.2025.08.22.08.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:29:22 -0700 (PDT)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: andrealmeid@igalia.com, chris@kode54.net, naveen1.kumar@intel.com,
 ville.syrjala@linux.intel.com, mdaenzer@redhat.com,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexdeucher@gmail.com, arun.r.murthy@intel.com,
 Xaver Hugl <xaver.hugl@kde.org>
Subject: [PATCH v5] drm: re-allow no-op changes on non-primary planes in async
 flips
Date: Fri, 22 Aug 2025 17:28:49 +0200
Message-ID: <20250822152849.87843-1-xaver.hugl@kde.org>
X-Mailer: git-send-email 2.50.1
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

Commit fd40a63c63a1 unintentionally disallowed no-op changes on non-primary
planes that the driver doesn't allow async flips on. This broke async flips
for compositors that disable the cursor plane in every async atomic commit.
To fix that, change drm_atomic_set_property to again only run atomic_async_check
if the plane would actually be changed by the atomic commit.

Fixes: fd40a63c63a1 ("drm/atomic: Let drivers decide which planes to async flip")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4263

Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c2726af6698e..317303cf5b8c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1077,19 +1077,20 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		}
 
 		if (async_flip) {
-			/* check if the prop does a nop change */
-			if ((prop != config->prop_fb_id &&
-			     prop != config->prop_in_fence_fd &&
-			     prop != config->prop_fb_damage_clips)) {
-				ret = drm_atomic_plane_get_property(plane, plane_state,
-								    prop, &old_val);
-				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-			}
+			/* no-op changes are always allowed */
+			ret = drm_atomic_plane_get_property(plane, plane_state,
+							    prop, &old_val);
+			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
 
-			/* ask the driver if this non-primary plane is supported */
-			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
-				ret = -EINVAL;
+			/* fail everything that isn't no-op or a pure flip */
+			if (ret && prop != config->prop_fb_id &&
+			    prop != config->prop_in_fence_fd &&
+			    prop != config->prop_fb_damage_clips) {
+				break;
+			}
 
+			if (ret && plane->type != DRM_PLANE_TYPE_PRIMARY) {
+				/* ask the driver if this non-primary plane is supported */
 				if (plane_funcs && plane_funcs->atomic_async_check)
 					ret = plane_funcs->atomic_async_check(plane, state, true);
 
-- 
2.50.1

