Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181DF587F60
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 17:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598E510EE67;
	Tue,  2 Aug 2022 15:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ECF8D8EC;
 Tue,  2 Aug 2022 15:51:32 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id b4so3813692pji.4;
 Tue, 02 Aug 2022 08:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mxFT+vmlgH8OMaHZf0MGM1sQcdQOD7qQazzf52IZIdo=;
 b=WN+R3EX30Oabvdp1q7dZCqfGguppdYSI4OwmuufkGnHDq2mRy4WcoOGHk63Zj8uGVv
 BMncLyRJeFdmKS+j1O0CiGCa3yZVVru13iDEQKGjvusLjaxi4dehJMcY5j0AN747MhS/
 FtaY50KoEXxF0riKhylVa4yF7/tNv9ZLyUDqoFULnqtiEJYJZbxemb/SaflrZTC6upC0
 xw82VGZlbO8bYPREZvAAI9Z//xn5akLF6lMZrou4Eldc/zvpXFlKXDaEdOG+tpTpooeP
 5al8QBx/WTUTbwVhLTtfHOJ9ir2BhsZj8ViV0f9nhYuW7cNvHhquBnOe6E8MB/Ihab3R
 Rk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mxFT+vmlgH8OMaHZf0MGM1sQcdQOD7qQazzf52IZIdo=;
 b=d5qgOkwRrWwzGrENCnsj0LW9okHZs5onb+da+twgbVaIZDkZ59DxkdKJTT+IdWt1ya
 iU6Ltb4iAjl2dzdyYzFQWX9Rbd8VYe3wiWUWj86w+otZVcuYoTR2R4MyhbnHekjub1VI
 SaubuU3xIGbUS/itJzvWUv/yd3eoiCLVw3pn+99+DPIyeWd4zs8f+H2roON/2/PMz2QC
 yvNmBRUFAj1weUQDgIIEnjSvnsYBCyaQZC8uOwkJrbk6oeeCoidUSZ7yAvmc7yE5MWZN
 hqWBHuLjylYjlhNagzG6sYkbu0o7lxLNkFZM3CtMOXPbLoL8NhBXCqNfiAB8bQtlhfEs
 J9HA==
X-Gm-Message-State: ACgBeo2qo4eZIMZQazzri4jR/raOVU13tJIJoh1rnRjBo8g90/ItbQFV
 uO8M8EAl9TPSnCdDt/dGUhHrJ3QkW5M=
X-Google-Smtp-Source: AA6agR7pFLKO2uUqgp9rOlOUlR1Ah2c0yTxM50D66GE+OjvyQPhVV2ETDK0/78IyRlsx9x0Cxt8rvg==
X-Received: by 2002:a17:90a:4291:b0:1f2:2a19:fc95 with SMTP id
 p17-20020a17090a429100b001f22a19fc95mr114509pjg.29.1659455491353; 
 Tue, 02 Aug 2022 08:51:31 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170903120500b0016d62ba5665sm12235660plh.254.2022.08.02.08.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 08:51:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/15] drm/msm/gem: Rename update_inactive
Date: Tue,  2 Aug 2022 08:51:38 -0700
Message-Id: <20220802155152.1727594-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220802155152.1727594-1-robdclark@gmail.com>
References: <20220802155152.1727594-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Really what this is doing is updating various LRU lists.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b55d252aef17..97467364dc0a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -19,7 +19,7 @@
 #include "msm_gpu.h"
 #include "msm_mmu.h"
 
-static void update_inactive(struct msm_gem_object *msm_obj);
+static void update_lru(struct drm_gem_object *obj);
 
 static dma_addr_t physaddr(struct drm_gem_object *obj)
 {
@@ -132,7 +132,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		if (msm_obj->flags & MSM_BO_WC)
 			sync_for_device(msm_obj);
 
-		update_inactive(msm_obj);
+		update_lru(obj);
 	}
 
 	return msm_obj->pages;
@@ -193,7 +193,7 @@ struct page **msm_gem_get_pages(struct drm_gem_object *obj)
 
 	if (!IS_ERR(p)) {
 		msm_obj->pin_count++;
-		update_inactive(msm_obj);
+		update_lru(obj);
 	}
 
 	msm_gem_unlock(obj);
@@ -207,7 +207,7 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
 	msm_gem_lock(obj);
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
-	update_inactive(msm_obj);
+	update_lru(obj);
 	msm_gem_unlock(obj);
 }
 
@@ -449,7 +449,7 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
 
-	update_inactive(msm_obj);
+	update_lru(obj);
 }
 
 struct msm_gem_vma *msm_gem_get_vma_locked(struct drm_gem_object *obj,
@@ -658,7 +658,7 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 			goto fail;
 		}
 
-		update_inactive(msm_obj);
+		update_lru(obj);
 	}
 
 	return msm_obj->vaddr;
@@ -730,7 +730,7 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	 * between inactive lists
 	 */
 	if (msm_obj->active_count == 0)
-		update_inactive(msm_obj);
+		update_lru(obj);
 
 	msm_gem_unlock(obj);
 
@@ -757,7 +757,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	put_iova_vmas(obj);
 
 	msm_obj->madv = __MSM_MADV_PURGED;
-	update_inactive(msm_obj);
+	update_lru(obj);
 
 	drm_gem_free_mmap_offset(obj);
 
@@ -792,7 +792,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 
 	put_pages(obj);
 
-	update_inactive(msm_obj);
+	update_lru(obj);
 }
 
 void msm_gem_vunmap(struct drm_gem_object *obj)
@@ -835,13 +835,14 @@ void msm_gem_active_put(struct drm_gem_object *obj)
 	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	if (--msm_obj->active_count == 0) {
-		update_inactive(msm_obj);
+		update_lru(obj);
 	}
 }
 
-static void update_inactive(struct msm_gem_object *msm_obj)
+static void update_lru(struct drm_gem_object *obj)
 {
-	struct msm_drm_private *priv = msm_obj->base.dev->dev_private;
+	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	GEM_WARN_ON(!msm_gem_is_locked(&msm_obj->base));
 
-- 
2.36.1

