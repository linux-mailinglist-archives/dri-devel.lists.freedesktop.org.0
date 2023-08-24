Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E230778660C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 05:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD2410E4D6;
	Thu, 24 Aug 2023 03:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54AC10E4D6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 03:46:44 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68a56ed12c0so756083b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 20:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692848804; x=1693453604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwx31tS90WjUWjp0SbR9DGcZF77FU28axltzBJRt4c4=;
 b=M9ObRuet+5GPiY4quY2/78PUkAPB1JrjsB2ESQr8Kn2AmS/yGh61g1cECo/MnMph8R
 EgvmGO9xW7uKzxLJT1EsEhHFDVz8SieDFzxIQZ3yZqdTck2102eAJRDpa6WGxOX6HJI1
 oyAm+jxYdRzKYJXtVMNWxIgInu8jTEmDbViIVQNnJb+aKHQ+v1QOZyzn/AqSRnLbLycj
 6PdLlHtIT8mann8zWwocxLvjESk9x7768MCHxVbB1agjjmBEVTFCGSB2g8quENDN22nn
 MxJ8OICOclnmIuKfUmbWULuOfFSwJIbwJlmI9aW5sqnhTe26+jLXnkYaLv9NGdlm90ol
 LaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692848804; x=1693453604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwx31tS90WjUWjp0SbR9DGcZF77FU28axltzBJRt4c4=;
 b=NakXTvxId4qM9dmzJL1GuBf/KorNaXhq2x21u2ZmVatYoVF0Cqrr8MplMlpw8u8gW2
 0uKFvrMmbA/nypI/T7k17SQ99IM6+5FandDsgm6WvdiauAW0x4YJrxu+wgiFsmUjmjc9
 7xkNDO2cTyW4+LkZX69GtfTtWi1PAHa3mNNQI2OQfADkxYw6gIm+Ar1UaJ/PSA2W8Gmf
 4iCo3ebYTR956svnZFF5UFG7WguSfb8QnnMZUkbrfUPRqD3E8jojoriBMyKd/ZAAWnfL
 XyTw5Tl5O+MkAUo5/ADkKPuUSqMtsi5Hem0p2Td/tQv6YhfvgM/Zf8gXnCqlY7RTDrdX
 Yk5Q==
X-Gm-Message-State: AOJu0YxJb/34cfJnHI33+9aO6AjVuZ/MOWHX0pFL0G7HUMguSwI52K3B
 e75TV9F2UaDLfPp4M3dMA/5zUg==
X-Google-Smtp-Source: AGHT+IEwX5EZusqZS4WDTl8vi+i2E+fjUU28VXYK2I5UDaIClqUUGhB9bFuORRwXdWrDnPbD98IZBQ==
X-Received: by 2002:a05:6a00:1791:b0:68a:42d0:6b9b with SMTP id
 s17-20020a056a00179100b0068a42d06b9bmr11892145pfg.3.1692848804382; 
 Wed, 23 Aug 2023 20:46:44 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a63b246000000b005579f12a238sm10533157pgo.86.2023.08.23.20.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 20:46:43 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Subject: [PATCH v5 20/45] drm/i915: dynamically allocate the i915_gem_mm
 shrinker
Date: Thu, 24 Aug 2023 11:42:39 +0800
Message-Id: <20230824034304.37411-21-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
References: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-mm@kvack.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the i915_gem_mm shrinker, so that it can be freed
asynchronously via RCU. Then it doesn't need to wait for RCU read-side
critical section when releasing the struct drm_i915_private.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
CC: David Airlie <airlied@gmail.com>
CC: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 30 +++++++++++---------
 drivers/gpu/drm/i915/i915_drv.h              |  2 +-
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 214763942aa2..4504eb4f31d5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -284,8 +284,7 @@ unsigned long i915_gem_shrink_all(struct drm_i915_private *i915)
 static unsigned long
 i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct drm_i915_private *i915 =
-		container_of(shrinker, struct drm_i915_private, mm.shrinker);
+	struct drm_i915_private *i915 = shrinker->private_data;
 	unsigned long num_objects;
 	unsigned long count;
 
@@ -302,8 +301,8 @@ i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	if (num_objects) {
 		unsigned long avg = 2 * count / num_objects;
 
-		i915->mm.shrinker.batch =
-			max((i915->mm.shrinker.batch + avg) >> 1,
+		i915->mm.shrinker->batch =
+			max((i915->mm.shrinker->batch + avg) >> 1,
 			    128ul /* default SHRINK_BATCH */);
 	}
 
@@ -313,8 +312,7 @@ i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 static unsigned long
 i915_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct drm_i915_private *i915 =
-		container_of(shrinker, struct drm_i915_private, mm.shrinker);
+	struct drm_i915_private *i915 = shrinker->private_data;
 	unsigned long freed;
 
 	sc->nr_scanned = 0;
@@ -422,12 +420,18 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 
 void i915_gem_driver_register__shrinker(struct drm_i915_private *i915)
 {
-	i915->mm.shrinker.scan_objects = i915_gem_shrinker_scan;
-	i915->mm.shrinker.count_objects = i915_gem_shrinker_count;
-	i915->mm.shrinker.seeks = DEFAULT_SEEKS;
-	i915->mm.shrinker.batch = 4096;
-	drm_WARN_ON(&i915->drm, register_shrinker(&i915->mm.shrinker,
-						  "drm-i915_gem"));
+	i915->mm.shrinker = shrinker_alloc(0, "drm-i915_gem");
+	if (!i915->mm.shrinker) {
+		drm_WARN_ON(&i915->drm, 1);
+	} else {
+		i915->mm.shrinker->scan_objects = i915_gem_shrinker_scan;
+		i915->mm.shrinker->count_objects = i915_gem_shrinker_count;
+		i915->mm.shrinker->seeks = DEFAULT_SEEKS;
+		i915->mm.shrinker->batch = 4096;
+		i915->mm.shrinker->private_data = i915;
+
+		shrinker_register(i915->mm.shrinker);
+	}
 
 	i915->mm.oom_notifier.notifier_call = i915_gem_shrinker_oom;
 	drm_WARN_ON(&i915->drm, register_oom_notifier(&i915->mm.oom_notifier));
@@ -443,7 +447,7 @@ void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915)
 		    unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
 	drm_WARN_ON(&i915->drm,
 		    unregister_oom_notifier(&i915->mm.oom_notifier));
-	unregister_shrinker(&i915->mm.shrinker);
+	shrinker_free(i915->mm.shrinker);
 }
 
 void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 7a8ce7239bc9..f2f21da4d7f9 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -163,7 +163,7 @@ struct i915_gem_mm {
 
 	struct notifier_block oom_notifier;
 	struct notifier_block vmap_notifier;
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 #ifdef CONFIG_MMU_NOTIFIER
 	/**
-- 
2.30.2

