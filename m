Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAAF57A4E4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF51990FC8;
	Tue, 19 Jul 2022 17:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F9890F97;
 Tue, 19 Jul 2022 17:18:52 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id c3so13255660pfb.13;
 Tue, 19 Jul 2022 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxFT+vmlgH8OMaHZf0MGM1sQcdQOD7qQazzf52IZIdo=;
 b=pX4QvSF8ZvLQfdCSHWZFZOvchRVu8kUZ1QMPP7yZODkgH5UK+sel9ep8wsSSRKqBVu
 kkUzH0kUx+RsndmqlXKGHLDHa43r56upHNqdkktnGdEAXjsvQoF88U163YSB8mPZNsaA
 g72Z2BKhq4CZFUt88MnUCGEUdBGNjhVYHa2Ne3g/p4QmcMKP4RQ/myuRHO2+8yk0bd5i
 MXb4HV5FT4SsbaeAp8QAiL/4alU4jjJaoV2S1rKWp4Y5Qt5w5Rqe4wMcX/FB7JUcg/Rs
 0iQd8Ty+/4fX9XJYndL0gpFROt0MtQoB4N2LhJIS8mp0lCFRJGsOQ9LfKxABQ74KcXaU
 ODEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mxFT+vmlgH8OMaHZf0MGM1sQcdQOD7qQazzf52IZIdo=;
 b=rTDFYgGFBZ/fOvAWHwqcHtgnXAhy0ZarILMnr2dbrXxuiexmjsJ9Lo0eZKGGrSYGQc
 3skxfMA4nVuXgR1SaimSOZXgaP1S5iV75myYuMQjhVqs6Pbwgvouf3LZ1Qj5u62Mhots
 sUF/+ZESOEC+CNORyB+iFJ/k/D82AyUWkRHHKvpSBHJbpDCBx70ZQszTgAhIMRnlJg5a
 /4o/va1vSyXrew8lvRsEVfkshM1t7LhRHBm7WvQ1+C7+BVCsA4xS9KOgifQMQWEe+rw1
 NHJMiEg3/AkhTs/DeQnL3pOhE2cXvLq3V97j3f119awIxRUiZrF39vaUgtN07qZyEj0f
 y4QQ==
X-Gm-Message-State: AJIora8atNW/f203h8kv6ccIkottVd7heyLpDZ4yVJSOuwUJJaD3q7us
 UwK/rpEDfBesjh9l+pTklYi5ExO02xM=
X-Google-Smtp-Source: AGRyM1sH6WAjdZeZjLMvuCM6e9KbQu41Poi6tjCVuZpE2gcICGHekqRPSyGoItba8tKCDP/vrjKfgQ==
X-Received: by 2002:a05:6a00:14c5:b0:52b:8877:8263 with SMTP id
 w5-20020a056a0014c500b0052b88778263mr6313813pfu.1.1658251132049; 
 Tue, 19 Jul 2022 10:18:52 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b0016a4f3ca28bsm12070284plf.274.2022.07.19.10.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:18:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/13] drm/msm/gem: Rename update_inactive
Date: Tue, 19 Jul 2022 10:18:49 -0700
Message-Id: <20220719171900.289265-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719171900.289265-1-robdclark@gmail.com>
References: <20220719171900.289265-1-robdclark@gmail.com>
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

