Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B75ACB5CD3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB0710E7E9;
	Thu, 11 Dec 2025 12:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gt+S4Xes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A3410E7E9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso84085e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455854; x=1766060654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J8jXAWobBK8lmzqtWAfGt3fFqrY73+n7TmYwmeiH5sg=;
 b=Gt+S4XesRdorg13TNd3SXtGlZZsniAd6mfSIQlMxf2pZoSXKhJi4J6S1NHHPGRhIme
 yDq23X+wOC3UOCzPoIP2t05tUYGzc7yeR1EreSAruWaC1R6JTdAxcBIFdQuDiFiBKp+/
 Zecc/ztKDsJaYah8WJkSukWalsrCxw1KdYT32nMhUdJ5mdy3xFLOFnyg+jm1I3h0SHBV
 9S7hd/mpPEuIKW1s3asaJTgzXCDtUQyzmjQfT2eDWAIB8thOuV7RKi1TUnO5fJuOkCh5
 PHTSP/0WrMX0+Z2L7+G0ZzFwmbfPa4p5cxB0SAmgj3GuSRnXQsPbM39kkF1Scgi30Zgm
 Mqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455854; x=1766060654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J8jXAWobBK8lmzqtWAfGt3fFqrY73+n7TmYwmeiH5sg=;
 b=J6sLFCC5ut9WzGWigylRQo2v+LlcGtOLtNQEF896t6XeVc4g8o1db6Ax/m5MMFeBdY
 +RilaEbjYDgKNYgUVc9Ej3ejFtm3QhNAmRzvevKcBfSHMwZtQkNqcTESRxD3HssnnkZ2
 KeuB4Q9yRsMpOjyQp7ZRwoooloRcCEoPksdYlG41U5L4ggmnPLDif371sQdDGVncBdI6
 J+LVp/QrdXbX1nuYHLoMbloG+THfu3sHrWtzrK0+BUuoWzKjjP8ZynHzLev4T6dmslf1
 b0nA/OBVulgRL6+BhozIeGD9QaG5Y0uCM9ZW0ooxqneMlgWZWCc1r6w/JcjiA/JQT6u3
 PDHg==
X-Gm-Message-State: AOJu0YzRvKEH1ipVAIynxy2okMknlqvIWA40pfhK9BXrFjDlLX2jemlG
 neOcxoYKT7uVtPntqYw8qw/VEZUfrXdX4LEC90or8FnrrdzHEU6PYdbd
X-Gm-Gg: AY/fxX6InzmBef7IvSnWkt+1hut8s/ifiTH2sz2CL3XZgrHY0merpfaUiU2ujNkaSYe
 razE0ud0SKvBkeuvxkKUNmVkHQ1rYdJjJ1f9+gGiWCIW9g7VIzy5NMEe/PaqhcBfnNFIm+YN7Sc
 6RwZpAiQz+JrLZ2TwJ4gcZ1jiUXLgs0W3jOa5EgAMRVXLqbdHLYUBTOzvHrK3wofGJ64mNo9cQg
 skcx1U9HFxaDf4XwslpvQEEaQoPVymLwX3ij6blWATCskhbeET6PRo6vy0wKGs4AZZO9ShjDNuC
 VMoR/QLSaML6hOL7+FUBeKKAXQP4LL0ykc8u3jni2a2pRiTq1URplQe9w7yU317avmoPyP2iuB0
 QwxTlzLmzdA5uOYTCBfAZ4QDS+Cx3mQSzownIN1bE6Kg68N9nbh5BUGz+webxe+tY4366hc3qwt
 atPisdZFwjscdLFhWHfobUbbW1
X-Google-Smtp-Source: AGHT+IGanhxv+rE041hNFLEsidCULWlUDVkaof3bXZYKcx7EcSCAIfz0xo1NC2o1UUjT6LmSeA+v/A==
X-Received: by 2002:a05:600c:3e1a:b0:477:afc5:fb02 with SMTP id
 5b1f17b1804b1-47a83790571mr60868735e9.21.1765455853623; 
 Thu, 11 Dec 2025 04:24:13 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:13 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 04/19] dma-buf/selftests: drop the mock_wait implementation
Date: Thu, 11 Dec 2025 13:16:35 +0100
Message-ID: <20251211122407.1709-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

Actually test the documented expectation of dma_fence_wait() instead of
comming up with a mock_wait implementation which uses undocumented
and non standard return codes and behavior.

Additional to that increase the timeout to one second, otherwise the
test case is a bit unreliable.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence.c | 51 ++++------------------------------
 1 file changed, 5 insertions(+), 46 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 5cb8f90a7448..5d0d9abc6e21 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -33,50 +33,9 @@ static void mock_fence_release(struct dma_fence *f)
 	kmem_cache_free(slab_fences, to_mock_fence(f));
 }
 
-struct wait_cb {
-	struct dma_fence_cb cb;
-	struct task_struct *task;
-};
-
-static void mock_wakeup(struct dma_fence *f, struct dma_fence_cb *cb)
-{
-	wake_up_process(container_of(cb, struct wait_cb, cb)->task);
-}
-
-static long mock_wait(struct dma_fence *f, bool intr, long timeout)
-{
-	const int state = intr ? TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
-	struct wait_cb cb = { .task = current };
-
-	if (dma_fence_add_callback(f, &cb.cb, mock_wakeup))
-		return timeout;
-
-	while (timeout) {
-		set_current_state(state);
-
-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &f->flags))
-			break;
-
-		if (signal_pending_state(state, current))
-			break;
-
-		timeout = schedule_timeout(timeout);
-	}
-	__set_current_state(TASK_RUNNING);
-
-	if (!dma_fence_remove_callback(f, &cb.cb))
-		return timeout;
-
-	if (signal_pending_state(state, current))
-		return -ERESTARTSYS;
-
-	return -ETIME;
-}
-
 static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
-	.wait = mock_wait,
 	.release = mock_fence_release,
 };
 
@@ -349,14 +308,14 @@ static int test_wait(void *arg)
 
 	dma_fence_enable_sw_signaling(f);
 
-	if (dma_fence_wait_timeout(f, false, 0) != -ETIME) {
+	if (dma_fence_wait_timeout(f, false, 0) != 0) {
 		pr_err("Wait reported complete before being signaled\n");
 		goto err_free;
 	}
 
 	dma_fence_signal(f);
 
-	if (dma_fence_wait_timeout(f, false, 0) != 0) {
+	if (dma_fence_wait_timeout(f, false, 0) != 1) {
 		pr_err("Wait reported incomplete after being signaled\n");
 		goto err_free;
 	}
@@ -393,16 +352,16 @@ static int test_wait_timeout(void *arg)
 
 	dma_fence_enable_sw_signaling(wt.f);
 
-	if (dma_fence_wait_timeout(wt.f, false, 1) != -ETIME) {
+	if (dma_fence_wait_timeout(wt.f, false, 1) != 0) {
 		pr_err("Wait reported complete before being signaled\n");
 		goto err_free;
 	}
 
 	mod_timer(&wt.timer, jiffies + 1);
 
-	if (dma_fence_wait_timeout(wt.f, false, 2) == -ETIME) {
+	if (dma_fence_wait_timeout(wt.f, false, HZ) == 0) {
 		if (timer_pending(&wt.timer)) {
-			pr_notice("Timer did not fire within the jiffy!\n");
+			pr_notice("Timer did not fire within one HZ!\n");
 			err = 0; /* not our fault! */
 		} else {
 			pr_err("Wait reported incomplete after timeout\n");
-- 
2.43.0

