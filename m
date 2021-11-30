Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95AE462F65
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 10:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69876FBB1;
	Tue, 30 Nov 2021 09:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658B26FBAE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:16:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o29so16807653wms.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 01:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=THPOmKC29m1M2x4j4RtrTBi3JEhZ3Zk2dJl3LbX3h70=;
 b=OYUYyW7knuaphscSal0kEdhZcQ+p7wK0cHHrvUF3uNIrgCgCB5TGzIDkBp6zD/ZcQj
 yVo7GCBlPrhZ5VOgtigdR9RbfdvaNfHyKSINQV0nc3T4HtSFyKFcBRubk5ITDFYgH+rV
 FAShbodVqriwYs9NmhZnQm7D/kTxKgJV7Du8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=THPOmKC29m1M2x4j4RtrTBi3JEhZ3Zk2dJl3LbX3h70=;
 b=kh9CtQbbVW3/gwaAPFf2dI+pfCxoEkK3UbJuoChhkUmCAMMvYcqb1moQY4wC18RCvY
 aODBda1TJkICbePnGgP4XzjGvYLI9m+2sDy3Hefv7nVYTpM8ep3KG0iqgvdqHgACtq4u
 QAe0F0nlE3yx6K+uDSLrkYC4JlrFbXFnajxMEtA0puNrd3XInDdd1ySs6lW0bLQSiCY7
 jn3dRq/RDkFmYscMkqq/OOaes8PiU3y6O3qDYMpVqxRjIPV0tpSrP/5KbIXf/Vgthx/G
 EoLVCXAW8pCQCZ4eLShs4agZzZgGdmx8aCiktHJrIseIdK114aIXOApz9Ys3bqZp0XOV
 94ZQ==
X-Gm-Message-State: AOAM531/jiQLPzlSY1GGn5akxQEojEOVVe6UNm0GzXyUYGx3fPA1hL2o
 LUAJV8mE871ItrPaIzBIHpCnigXKggtHAA==
X-Google-Smtp-Source: ABdhPJzBNTxsopCYkVjad6W98z/udcUcxp0cXaiqFkf5rpQ50R01ROCHdtyPnn1wvbf8njny+N5tdQ==
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr3514694wmq.63.1638263774971; 
 Tue, 30 Nov 2021 01:16:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u13sm2009551wmq.14.2021.11.30.01.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:16:14 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] dma-resv: some doc polish for iterators
Date: Tue, 30 Nov 2021 10:16:09 +0100
Message-Id: <20211130091609.1335915-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hammer it a bit more in that iterators can be restarted and when that
matters, plus suggest to prefer the locked version whenver.

Also delete the two leftover kerneldoc for static functions plus
sprinkle some more links while at it.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-resv.c | 26 ++++++++++++--------------
 include/linux/dma-resv.h   | 13 ++++++++++++-
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 9eb2baa387d4..1453b664c405 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -323,12 +323,6 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
-/**
- * dma_resv_iter_restart_unlocked - restart the unlocked iterator
- * @cursor: The dma_resv_iter object to restart
- *
- * Restart the unlocked iteration by initializing the cursor object.
- */
 static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
 {
 	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
@@ -344,14 +338,6 @@ static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
 	cursor->is_restarted = true;
 }
 
-/**
- * dma_resv_iter_walk_unlocked - walk over fences in a dma_resv obj
- * @cursor: cursor to record the current position
- *
- * Return all the fences in the dma_resv object which are not yet signaled.
- * The returned fence has an extra local reference so will stay alive.
- * If a concurrent modify is detected the whole iteration is started over again.
- */
 static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
 {
 	struct dma_resv *obj = cursor->obj;
@@ -387,6 +373,12 @@ static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
  * dma_resv_iter_first_unlocked - first fence in an unlocked dma_resv obj.
  * @cursor: the cursor with the current position
  *
+ * Subsequent fences are iterated with dma_resv_iter_next_unlocked().
+ *
+ * Beware that the iterator can be restarted.  Code which accumulates statistics
+ * or similar needs to check for this with dma_resv_iter_is_restarted(). For
+ * this reason prefer the locked dma_resv_iter_first() whenver possible.
+ *
  * Returns the first fence from an unlocked dma_resv obj.
  */
 struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter *cursor)
@@ -406,6 +398,10 @@ EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
  * dma_resv_iter_next_unlocked - next fence in an unlocked dma_resv obj.
  * @cursor: the cursor with the current position
  *
+ * Beware that the iterator can be restarted.  Code which accumulates statistics
+ * or similar needs to check for this with dma_resv_iter_is_restarted(). For
+ * this reason prefer the locked dma_resv_iter_next() whenver possible.
+ *
  * Returns the next fence from an unlocked dma_resv obj.
  */
 struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter *cursor)
@@ -431,6 +427,8 @@ EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
  * dma_resv_iter_first - first fence from a locked dma_resv object
  * @cursor: cursor to record the current position
  *
+ * Subsequent fences are iterated with dma_resv_iter_next_unlocked().
+ *
  * Return the first fence in the dma_resv object while holding the
  * &dma_resv.lock.
  */
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index dbd235ab447f..ebe908592ac3 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -153,6 +153,13 @@ struct dma_resv {
  * struct dma_resv_iter - current position into the dma_resv fences
  *
  * Don't touch this directly in the driver, use the accessor function instead.
+ *
+ * IMPORTANT
+ *
+ * When using the lockless iterators like dma_resv_iter_next_unlocked() or
+ * dma_resv_for_each_fence_unlocked() beware that the iterator can be restarted.
+ * Code which accumulates statistics or similar needs to check for this with
+ * dma_resv_iter_is_restarted().
  */
 struct dma_resv_iter {
 	/** @obj: The dma_resv object we iterate over */
@@ -243,7 +250,11 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
  * &dma_resv.lock and using RCU instead. The cursor needs to be initialized
  * with dma_resv_iter_begin() and cleaned up with dma_resv_iter_end(). Inside
  * the iterator a reference to the dma_fence is held and the RCU lock dropped.
- * When the dma_resv is modified the iteration starts over again.
+ *
+ * Beware that the iterator can be restarted when the struct dma_resv for
+ * @cursor is modified. Code which accumulates statistics or similar needs to
+ * check for this with dma_resv_iter_is_restarted(). For this reason prefer the
+ * lock iterator dma_resv_for_each_fence() whenever possible.
  */
 #define dma_resv_for_each_fence_unlocked(cursor, fence)			\
 	for (fence = dma_resv_iter_first_unlocked(cursor);		\
-- 
2.33.0

