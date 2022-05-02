Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2F251746E
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B67610F065;
	Mon,  2 May 2022 16:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8F310F065
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t6so20268727wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ztozpp4Hd7P88p5EylObdLnFFM2e9No0uy0uVps0Q4o=;
 b=l8cnH0/oWnlGs4iC9nSE0GWCX5g6JqtmjJMCjqSOAwOlKROP5Dav+7qr2vV22I5AyR
 P29H9FiZL0l2XMAOD39ti1qK7CTYjhCfhB/1+yXOLeBeRWny9/cVyMmgwWfoI/s/Irld
 ZRtRAzcb0kVhafr3YK4q7sAqJH9N878z6sN9gTuvwmb5v79Q5utfbdU/1lMGWZC9QQFQ
 UNgGqrfbGFfgl4WqqTb8n9jL+C74NUCcdbKkwWbHWD8HODMIuK3SPi81YaAuOHrXN9cS
 2i0O0Ls4YIs41WHjk2OSpRFoFPhhX0T09C3YwERYz33I3c2eqkXCNeI1/XrcKaWKZgfC
 uTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ztozpp4Hd7P88p5EylObdLnFFM2e9No0uy0uVps0Q4o=;
 b=wi4TLC3OzOBLmWlq/qL0FGsVHcMYLokAJCdjT9WlkLkTPPkg4BxDRBZft/MAE1tZXo
 SQ2yYh7SWfdo+T1kaSSFW5kHwDB0lOzUwkIo4Cjsb36g3eW9Ye81a5Mbc4DriuxnW0uO
 kGZqBh48/6QSZ00KcCnEMC9PO736JedKyRpbeJlzMR7t5dnaNrYe2B0SDhu1M5mR/ovZ
 T76p9BN/M/Yhp7qk7QNEV4iDdXf0Do+HKDxTn5KpfADf7sVDEcmR5aEtB/WztW9b4al7
 6iD98lUkqf/STmCi/FVNdjcNlYHuc3A4M5NLPyM/Hcy5hRwoFXqKPu8hP8y1QFi8vXEA
 o/mA==
X-Gm-Message-State: AOAM533cSlQnS+WDt/D7THSewMbj80xsterWXjyD4LHeAtUUBmxR4Zm/
 aH+/mm7o78CaLg99s8oHnV5VwZLhZRA=
X-Google-Smtp-Source: ABdhPJz2JXWWJflLQjuCGIgmn7WtX7jC1WTxfxIIZ7Mwf9txYB3Hit3CNEpghfRADVo4PLGr1oZzVg==
X-Received: by 2002:a05:6000:c:b0:20a:df2e:2c38 with SMTP id
 h12-20020a056000000c00b0020adf2e2c38mr9823627wrx.481.1651509448873; 
 Mon, 02 May 2022 09:37:28 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/15] dma-buf: rename DMA_FENCE_FLAG_USER_BITS to _DEVICE
Date: Mon,  2 May 2022 18:37:08 +0200
Message-Id: <20220502163722.3957-2-christian.koenig@amd.com>
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

This is supposed to be used by device drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_request.h       | 2 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.h | 2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c   | 4 ++--
 include/linux/dma-fence.h                 | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 28b1f9db5487..716c8c413cc4 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -80,7 +80,7 @@ enum {
 	 *
 	 * See i915_request_is_active()
 	 */
-	I915_FENCE_FLAG_ACTIVE = DMA_FENCE_FLAG_USER_BITS,
+	I915_FENCE_FLAG_ACTIVE = DMA_FENCE_FLAG_DRIVER,
 
 	/*
 	 * I915_FENCE_FLAG_PQUEUE - this request is ready for execution
diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.h b/drivers/gpu/drm/i915/i915_sw_fence_work.h
index d56806918d13..ece0a06e598c 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.h
@@ -33,7 +33,7 @@ struct dma_fence_work {
 };
 
 enum {
-	DMA_FENCE_WORK_IMM = DMA_FENCE_FLAG_USER_BITS,
+	DMA_FENCE_WORK_IMM = DMA_FENCE_FLAG_DRIVER,
 };
 
 void dma_fence_work_init(struct dma_fence_work *f,
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7f01dcf81fab..e2f61b34cc1e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -61,7 +61,7 @@ nouveau_fence_signal(struct nouveau_fence *fence)
 	list_del(&fence->head);
 	rcu_assign_pointer(fence->channel, NULL);
 
-	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
+	if (test_bit(DMA_FENCE_FLAG_DRIVER, &fence->base.flags)) {
 		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 		if (!--fctx->notify_ref)
@@ -510,7 +510,7 @@ static bool nouveau_fence_enable_signaling(struct dma_fence *f)
 
 	ret = nouveau_fence_no_signaling(f);
 	if (ret)
-		set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
+		set_bit(DMA_FENCE_FLAG_DRIVER, &fence->base.flags);
 	else if (!--fctx->notify_ref)
 		nvif_notify_put(&fctx->notify);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..afea82ec5946 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -49,7 +49,7 @@ struct dma_fence_cb;
  * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
  * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
  * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
- * DMA_FENCE_FLAG_USER_BITS - start of the unused bits, can be used by the
+ * DMA_FENCE_FLAG_DRIVER - start of the unused bits, can be used by the
  * implementer of the fence for its own purposes. Can be used in different
  * ways by different fence implementers, so do not rely on this.
  *
@@ -99,7 +99,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
+	DMA_FENCE_FLAG_DRIVER, /* must always be last member */
 };
 
 typedef void (*dma_fence_func_t)(struct dma_fence *fence,
-- 
2.25.1

