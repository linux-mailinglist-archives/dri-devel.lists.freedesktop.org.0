Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90EAC655E
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57B910E5AE;
	Wed, 28 May 2025 09:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZNzNIht9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CB010E5B2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:13:22 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso34709335e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423601; x=1749028401; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+2yJB04g31aImN9kYR5m2tQHvzWGDu5CMhZSnchaeA=;
 b=ZNzNIht9SaM4P887e49QmKo+fjcorunc6XkJyDfZ8kE7MGxGA7CTVf9U41NujTyUgn
 Qrlo1YFKRWRFjKTyP/LIQQyrylXeZ/R3KiiL700D5PA6VSfqtIIHSJhnwQ1u16RhesmF
 EH899ZVwi8sRzJXYWB+tZb+AZyPB+hq4BXULQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423601; x=1749028401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o+2yJB04g31aImN9kYR5m2tQHvzWGDu5CMhZSnchaeA=;
 b=FrXntlEL8KQ0emAt4LLYy1CjerLL5BQBo0Kere9HpVrIU3JKD3lkOrX/L49WZxWEx9
 LTZMR6KJvCjT7x5ptUSECWHmgx6odJs5CISAEciObHoAyKu1iUqQ/Hc6X8kfvT0VxQ8/
 YYBwFiO/eqwWs0s5PTd3BiVjsq4MapfGrZAKjbSNiyljThBo9wLcG0JShWMXQLu5Hgw/
 29ef7eSbV4rTe3c1leilOeECFWv8h6rEG8YfDt6UuYeMT1jrWapagQTBeKRAG12aoMPk
 rnRUZiyhYtqq5JtH2woRLyys38s0Pe3MtBwlP1Jzk/WqGcAjqRL855lZsiZik8UD+mZ9
 +OWw==
X-Gm-Message-State: AOJu0YzSqwCGjfb2U2LOwHNBMACw/ZqyOUcu0MZykLe6ZJKXqNUXZuvA
 Akq4MRIhHwKIeYbfZgwockqLOKvt35CJcCloPa6KeHLsOM5pmjBKczTXKh8TLxysldipelGIZth
 /IxLY
X-Gm-Gg: ASbGnctYbsG8tdDMxVbRpEwX5By5+ZgKuhpPoSeix/vJfVQBkTas48Uh5bmNbY6qkSD
 Mf2VW3x/KU0kbRE95a9wLnxgiKuAjHReUKpgJC3arD5S/Rt/t/vImfp7TSW/GirrRJWbAObuhhK
 ykLKlYnfeZjd4Z1+eOflwj26q4PDP267UW1NrrdxLZLRfb0e5haq0QcHon/nTKKU+td674c8bUM
 KCGWpeAyLD5+eISUAOEw8JmmEhFmHqm5x83JU3rx1bzpJ2Rd1jVkWSJWRs/m+WrZddExmM8S5CY
 3psHa75ZgrRG1UbxTP8BSW4H9sG6JYGEOKNac1AcFf59CRV9BXLExxW8vjzP+J8=
X-Google-Smtp-Source: AGHT+IF+J9gs9Akej4NXfbvlZZ1XUk4UkDRdivSjnyJiYRklFqBZKmKqHXdSYCOnnomp4+/c/cb2rg==
X-Received: by 2002:a05:600c:1553:b0:43c:f513:958a with SMTP id
 5b1f17b1804b1-44c935ddb46mr149555705e9.13.1748423601141; 
 Wed, 28 May 2025 02:13:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:20 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, stable@vger.kernel.org,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 2/8] drm/fdinfo: Switch to idr_for_each() in
 drm_show_memory_stats()
Date: Wed, 28 May 2025 11:13:00 +0200
Message-ID: <20250528091307.1894940-3-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
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

Unlike idr_for_each_entry(), which terminates on the first NULL entry,
idr_for_each passes them through. This fixes potential issues with the
idr walk terminating prematurely due to transient NULL entries the
exist when creating and destroying a handle.

Note that transient NULL pointers in drm_file.object_idr have been a
thing since f6cd7daecff5 ("drm: Release driver references to handle
before making it available again"), this is a really old issue.

Aside from temporarily inconsistent fdinfo statistic there's no other
impact of this issue.

Fixes: 686b21b5f6ca ("drm: Add fdinfo memory stats")
Cc: Rob Clark <robdclark@chromium.org>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: <stable@vger.kernel.org> # v6.5+
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_file.c | 95 ++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 246cf845e2c9..428a4eb85e94 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -892,6 +892,58 @@ void drm_print_memory_stats(struct drm_printer *p,
 }
 EXPORT_SYMBOL(drm_print_memory_stats);
 
+struct drm_bo_print_data {
+	struct drm_memory_stats status;
+	enum drm_gem_object_status supported_status;
+};
+
+static int
+drm_bo_memory_stats(int id, void *ptr, void *data)
+{
+	struct drm_bo_print_data *drm_data;
+	struct drm_gem_object *obj = ptr;
+	enum drm_gem_object_status s = 0;
+	size_t add_size;
+
+	if (!obj)
+		return 0;
+
+	add_size = (obj->funcs && obj->funcs->rss) ?
+		obj->funcs->rss(obj) : obj->size;
+
+	if (obj->funcs && obj->funcs->status) {
+		s = obj->funcs->status(obj);
+		drm_data->supported_status |= s;
+	}
+
+	if (drm_gem_object_is_shared_for_memory_stats(obj))
+		drm_data->status.shared += obj->size;
+	else
+		drm_data->status.private += obj->size;
+
+	if (s & DRM_GEM_OBJECT_RESIDENT) {
+		drm_data->status.resident += add_size;
+	} else {
+		/* If already purged or not yet backed by pages, don't
+		 * count it as purgeable:
+		 */
+		s &= ~DRM_GEM_OBJECT_PURGEABLE;
+	}
+
+	if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
+		drm_data->status.active += add_size;
+		drm_data->supported_status |= DRM_GEM_OBJECT_ACTIVE;
+
+		/* If still active, don't count as purgeable: */
+		s &= ~DRM_GEM_OBJECT_PURGEABLE;
+	}
+
+	if (s & DRM_GEM_OBJECT_PURGEABLE)
+		drm_data->status.purgeable += add_size;
+
+	return 0;
+}
+
 /**
  * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
  * @p: the printer to print output to
@@ -902,50 +954,13 @@ EXPORT_SYMBOL(drm_print_memory_stats);
  */
 void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_gem_object *obj;
-	struct drm_memory_stats status = {};
-	enum drm_gem_object_status supported_status = 0;
-	int id;
+	struct drm_bo_print_data data = {};
 
 	spin_lock(&file->table_lock);
-	idr_for_each_entry (&file->object_idr, obj, id) {
-		enum drm_gem_object_status s = 0;
-		size_t add_size = (obj->funcs && obj->funcs->rss) ?
-			obj->funcs->rss(obj) : obj->size;
-
-		if (obj->funcs && obj->funcs->status) {
-			s = obj->funcs->status(obj);
-			supported_status |= s;
-		}
-
-		if (drm_gem_object_is_shared_for_memory_stats(obj))
-			status.shared += obj->size;
-		else
-			status.private += obj->size;
-
-		if (s & DRM_GEM_OBJECT_RESIDENT) {
-			status.resident += add_size;
-		} else {
-			/* If already purged or not yet backed by pages, don't
-			 * count it as purgeable:
-			 */
-			s &= ~DRM_GEM_OBJECT_PURGEABLE;
-		}
-
-		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
-			status.active += add_size;
-			supported_status |= DRM_GEM_OBJECT_ACTIVE;
-
-			/* If still active, don't count as purgeable: */
-			s &= ~DRM_GEM_OBJECT_PURGEABLE;
-		}
-
-		if (s & DRM_GEM_OBJECT_PURGEABLE)
-			status.purgeable += add_size;
-	}
+	idr_for_each(&file->object_idr, &drm_bo_memory_stats, &data);
 	spin_unlock(&file->table_lock);
 
-	drm_print_memory_stats(p, &status, supported_status, "memory");
+	drm_print_memory_stats(p, &data.status, data.supported_status, "memory");
 }
 EXPORT_SYMBOL(drm_show_memory_stats);
 
-- 
2.49.0

