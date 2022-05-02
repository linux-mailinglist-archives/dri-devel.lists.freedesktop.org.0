Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C814517482
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4C010F0CF;
	Mon,  2 May 2022 16:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C98810F0CC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q23so20264309wra.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ANagkIapfhSoILXgRSazGJNpDPTeoeZ/i/DcazZHEZQ=;
 b=bTOuNbcCcpWCjHPdLC317BrGpkkTWG9yauH9kogTYDUS11gKUb/mgOriNiNu5FbMvh
 LAemZaOirJJUTzK3l2TFLtT8rRLpJvT7BZfdmi8xJtNUvDM/vFRM8b5haRUFr6Y1+4MC
 qCKqOvdTddBF7iTIx2hrrK3YFoDENFIjRM7SFF17g1uVfGU//XWTc8I0OyxhXUnfX96I
 8uHIPUuJmFcLDSrWHLzz2KRoGB52or1JhX5W0KPckcLJO6LOVnmxfQCirdxkWAXiCOoS
 b2OuUlzj4WKBC2Mr8e27FrWEEW5t0RhonknV7AExdcqkeJi7rBjBtbm8ey43b2ZNpyHP
 lxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ANagkIapfhSoILXgRSazGJNpDPTeoeZ/i/DcazZHEZQ=;
 b=AN4GPUG22GSKaTBSUH7CGc/+nc4npU/EsSKEmCbSmtp/qTDxnfRMaJ+9tWxK3MSl6f
 kncJV87x4/+KUAMaJnZCXMcu8DlMCVc8AjAfovn+rzyRtUMcnRAcLCLRHNQKeATZE3Yz
 a5wNn+7Hz4KQFGxdzPmcH7RhPTDYGzbsmcX5biW/fLzTZZoyH4wCMtaT/EJK/TU2faWM
 YmazQvXN5pF1pZKOu0+Db0qzMj7MsenGND3ulo8bGt1tESOsE8pYRemptIhzDMwcvekF
 Sm9sKRRdzisjcOyMWjROB1zwe3iXGPXrO0L/MqCcKt60oUb1mJ9Z5te6yggtmCAJyEGZ
 cS9Q==
X-Gm-Message-State: AOAM533WSCedby3afR9eX9Y/G3kvBxmxYS7+kpihR0nKo2+ejn7DMysB
 KuE+ME8tHArAnjmrDQOJ5gs=
X-Google-Smtp-Source: ABdhPJxUDlk3kbTFRN1X2D1q1vvW3bPqNNYNXQ7eHBEpgoyEe35FHldqGH1tFKFmx0FwRPQczX4rgA==
X-Received: by 2002:a5d:5749:0:b0:20a:ce36:b29 with SMTP id
 q9-20020a5d5749000000b0020ace360b29mr9849647wrw.559.1651509464807; 
 Mon, 02 May 2022 09:37:44 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 12/15] drm: add user fence support to
 drm_gem_plane_helper_prepare_fb
Date: Mon,  2 May 2022 18:37:19 +0200
Message-Id: <20220502163722.3957-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just handle them the same way as fences with the DMA_RESV_USAGE_WRITE
flag when the DRIVER_USER_FENCE flag is set.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 68 ++++++++++++++++---------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index a5026f617739..75d04333ff2e 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -121,6 +122,40 @@
  * Plane Helpers
  */
 
+static int chain_fb_fences(struct drm_framebuffer *fb,
+			   enum dma_resv_usage usage,
+			   struct dma_fence **fence)
+{
+	size_t i;
+	int ret;
+
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		struct drm_gem_object *obj = drm_gem_fb_get_obj(fb, i);
+		struct dma_fence *new;
+
+		if (WARN_ON_ONCE(!obj))
+			continue;
+
+		ret = dma_resv_get_singleton(obj->resv, usage, &new);
+		if (ret)
+			return ret;
+
+		if (new && *fence) {
+			struct dma_fence_chain *chain = dma_fence_chain_alloc();
+
+			if (!chain)
+				return -ENOMEM;
+
+			dma_fence_chain_init(chain, *fence, new, 1);
+			*fence = &chain->base;
+
+		} else if (new) {
+			*fence = new;
+		}
+	}
+	return 0;
+}
+
 /**
  * drm_gem_plane_helper_prepare_fb() - Prepare a GEM backed framebuffer
  * @plane: Plane
@@ -143,8 +178,6 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
 				    struct drm_plane_state *state)
 {
 	struct dma_fence *fence = dma_fence_get(state->fence);
-	enum dma_resv_usage usage;
-	size_t i;
 	int ret;
 
 	if (!state->fb)
@@ -163,32 +196,21 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
 	 * obeys both implicit and explicit fences for plane updates, then it
 	 * will break all the benefits of explicit fencing.
 	 */
-	usage = fence ? DMA_RESV_USAGE_KERNEL : DMA_RESV_USAGE_WRITE;
-
-	for (i = 0; i < state->fb->format->num_planes; ++i) {
-		struct drm_gem_object *obj = drm_gem_fb_get_obj(state->fb, i);
-		struct dma_fence *new;
-
-		if (WARN_ON_ONCE(!obj))
-			continue;
-
-		ret = dma_resv_get_singleton(obj->resv, usage, &new);
+	if (fence) {
+		ret = chain_fb_fences(state->fb, DMA_RESV_USAGE_KERNEL, &fence);
 		if (ret)
 			goto error;
 
-		if (new && fence) {
-			struct dma_fence_chain *chain = dma_fence_chain_alloc();
+	} else {
+		ret = chain_fb_fences(state->fb, DMA_RESV_USAGE_WRITE, &fence);
+		if (ret)
+			goto error;
 
-			if (!chain) {
-				ret = -ENOMEM;
+		if (drm_core_check_feature(plane->dev, DRIVER_USER_FENCE)) {
+			ret = chain_fb_fences(state->fb, DMA_RESV_USAGE_USER,
+					      &fence);
+			if (ret)
 				goto error;
-			}
-
-			dma_fence_chain_init(chain, fence, new, 1);
-			fence = &chain->base;
-
-		} else if (new) {
-			fence = new;
 		}
 	}
 
-- 
2.25.1

