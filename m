Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6038655AD14
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D467010E97A;
	Sat, 25 Jun 2022 22:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4CB10E97A;
 Sat, 25 Jun 2022 22:55:17 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so6043495pjz.1; 
 Sat, 25 Jun 2022 15:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxFT+vmlgH8OMaHZf0MGM1sQcdQOD7qQazzf52IZIdo=;
 b=SrSp3snXs0pK5mdm23qDw9AEOirWroW+OI7UXjNb32EksivAx79AdLoB5oK0MkDDjR
 YbjthKdN+bYDvOC0ds1PUimv+YinYSVg5F5CYdOElJl+/SuxTzoJ9//7y2YAWIhCAiYo
 x6X9yQcbAP7deozdGdurCRza18wqBxQso10Fub8cyR1txrvbkjr7/H7qODDPyDMqYsEM
 InEBuyaU+Fz2XZrnuBshy+raVq51J16T56l0VYkCXMKKN0uv5al3kIgGYXXGveFVMnwA
 YMV3j4AswqGKsOxyeIo1oMLoL6Ztn7HYvnkrg46GQw5nOiAVPh9xT2lECwS7qVQ4ZduD
 UFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mxFT+vmlgH8OMaHZf0MGM1sQcdQOD7qQazzf52IZIdo=;
 b=V/3IgNixQpYkRYhfq+WqubVGNqifSpJHObu3vwpfThkfxhpn6W4NgaecRI6VyScLHY
 Asi/nG79K7ep6InbNeLfghJCexAviF0UMo7jYLHtGNAfR2QFfRFnrns72vnHyiLLsKBz
 EfFOJ/1HiRJHTchOLUiDTIOt1lWr9UYXpL8oeRPe2j2MlJDYDTZla10rjE/5Oih2RjcW
 AG+89OSjGDruQu0w4bMkl7+RnYnDPkg0jBPfbBn04CzncbdGNrv26G9SyPg87PkjRAQy
 mPxlJkHZatQqP7Q2l5M3z25+uo8lj0QxQIp8Zp9du4vQEmQtK8cFest0mTgPD4luxwCx
 0n9Q==
X-Gm-Message-State: AJIora9o7BBRNVXUB7MoDqY7Gh2Zk1pqnTF1ECkxxkR/bVqkHxk7d7ZX
 pVqwFXhc4KBCp+1fuAy6Ii5oBSmoz5g=
X-Google-Smtp-Source: AGRyM1uKXZy+zqzm5xAuTM9oZrssykuV7f/ZFNRCHd/yi6B1VGx7yRW2GbsY3C+0S7YzScee+WKgaQ==
X-Received: by 2002:a17:90b:4c4c:b0:1ed:41ec:599d with SMTP id
 np12-20020a17090b4c4c00b001ed41ec599dmr4801210pjb.202.1656197716188; 
 Sat, 25 Jun 2022 15:55:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 s144-20020a632c96000000b003c265b7d4f6sm4022256pgs.44.2022.06.25.15.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:55:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/15] drm/msm/gem: Rename update_inactive
Date: Sat, 25 Jun 2022 15:54:42 -0700
Message-Id: <20220625225454.81039-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625225454.81039-1-robdclark@gmail.com>
References: <20220625225454.81039-1-robdclark@gmail.com>
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

