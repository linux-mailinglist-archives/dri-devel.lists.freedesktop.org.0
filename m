Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43805B1F144
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 01:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CE110E09B;
	Fri,  8 Aug 2025 23:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2F110E09B;
 Fri,  8 Aug 2025 23:22:47 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso17175485e9.0; 
 Fri, 08 Aug 2025 16:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754695366; x=1755300166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S7hoQOlH8hdbY5KjsDkardvJrN7xlW830kjw5KEZnS4=;
 b=Rzq38VD9NNjafZryimk3Kh/qOQBFM9v2sh4sucgJirlVRuumr2ljpzAPQ5kDsBGHIq
 APa+NbfiFWCedcCazu8SljT6om6X4ZcEkJxHVgt0qHTEChPGl8Y9srK7XnAQi+utgUZf
 EVXueAxhRIzY3nHQemr7zvfK6lJtfn60d+qDF6zJSuTlWK9GEgLjLyfhNXHFu5xUAaDk
 LsJBVrYP6qfsVOnt0IuDDKcAVazlb7vOPDSlEq3FY4n+FawT0O6hvQeqQBj4+sl6Toyu
 3x+XKHjCSCZkhiY3NYxl8zzrYBC4hZtukRqIZBfDiBUKQmfLyy8ZLPIYaG7uRoJrUEuG
 9erg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhMWGBjY86t+2ZrQWqFldjg8HecKNgqFWZHqvy17h4YOPCgn+INiuC7mF3GUxnOkOOO81rNT/Uywi7@lists.freedesktop.org,
 AJvYcCVa//PWLKBc8HDQhYwtdANBUBRD0KaZyu4iogROy587eEBQ5mpyoUIZ8E5jKMwuh1hACsDuv/Nm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC/G2QsSS6fTDnwW17qJUP5CV8Jd9lcthMARzptL/+vf1U2I/q
 89sDtrL3zGJm0Qx1OQrgyH+gAaeL2INBS42xJ7fBQyc+LSglkMGeY4isQiRHiIG6fCs=
X-Gm-Gg: ASbGncvRQmOb2WjzzDIVsSc3T89M/9L0QDl4yV0JR643CsMOVXCsTTHr0t4AsRGp18h
 RTqzOESIYiAt7bj8y1TYUMqSmPz9QJp3EMe5jEA+QPVCvCLoKUB2PNqJriHv8bqQfRAZKLcZhGG
 ZtJK99BriSnCoIO4qHD1UgYVV53r8odrVwG/pJPKNixxYOP6u7GsO7Am24pPjZV4auj7yccujlz
 i+MxCHdXCNYhUU2pYni5W+heXtC1oNIcUwIThTezRgvrUjAvofjQM59kpmzhXPhQ/Z8cUoZirGl
 cEPve3Xs1aqtrmfL4DWBfTiD06brP+JtH+V1fYR9UXNAHVX0TxWBAGWmHphtsllNYfgk1qCgxPl
 pjCFOcwC2VhXCX50HwAcE1tZLcTo0VRQZ8novxipPFuk=
X-Google-Smtp-Source: AGHT+IGQMTo9SwesgTmq9YDU6U+20iLE8/0wLNPQ4nhjBDpCA5mQSaBryPBHNrEIgJou1IL0pvh8dw==
X-Received: by 2002:a5d:5d0c:0:b0:3b8:b33c:b8b0 with SMTP id
 ffacd0b85a97d-3b90092c9d2mr3675591f8f.7.1754695365632; 
 Fri, 08 Aug 2025 16:22:45 -0700 (PDT)
Received: from xavers-framework.fritz.box
 ([2a04:7d84:aac5:f6d0:e6bd:56ed:1a58:b83])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abf0csm31142512f8f.14.2025.08.08.16.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 16:22:45 -0700 (PDT)
From: Xaver Hugl <xaver.hugl@kde.org>
To: dri-devel@lists.freedesktop.org
Cc: andrealmeid@igalia.com, chris@kode54.net, naveen1.kumar@intel.com,
 ville.syrjala@linux.intel.com, mdaenzer@redhat.com,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexdeucher@gmail.com, arun.r.murthy@intel.com,
 Xaver Hugl <xaver.hugl@kde.org>
Subject: [PATCH v4] drm: re-allow no-op changes on non-primary planes in async
 flips
Date: Sat,  9 Aug 2025 01:22:08 +0200
Message-ID: <20250808232208.7764-1-xaver.hugl@kde.org>
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

Commit fd40a63c63a1 unintentionally disallowed no-op changes on non-primary
planes that the driver doesn't allow async flips on. This broke async flips
for compositors that disable the cursor plane in every async atomic commit.
This changes drm_atomic_set_property to again only run atomic_async_check
if the plane would actually be changed by the atomic commit.

Fixes: fd40a63c63a1 ("drm/atomic: Let drivers decide which planes to async flip")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4263

Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
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

