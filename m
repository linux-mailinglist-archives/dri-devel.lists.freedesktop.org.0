Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162E09D4AE0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 11:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE6810E8D5;
	Thu, 21 Nov 2024 10:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WjaRVcyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5114410E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 10:27:34 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so6254745e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 02:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732184852; x=1732789652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETDe7un/JWIbuM3P/iFQm3j6qLUZiVYIWE/wIZIF+UQ=;
 b=WjaRVcyDDg0r3z2/4J/XmTuJZ/Znyyv626SmPUgoRDVPkO7LvRBl7Ci4G4s7+ncMAZ
 zwjvPjcd58vO1gZf3Y/6WfIMWTRG0QVlk1Go9JMsNdKRChZJoeDyRc0Xl3cvFYd7aQu9
 FXlNRSzrDQBRjtrCRR7RvwqtFhN6prvM5txQGWkSZXuP0OrMHS49tc5AhjK9tm5uWOsp
 ay50pVIX5f3fED34N/fHI4C+SiVp3E3XVionmDbi/j5PstBuXpRWVG8cKxVut6HIlBei
 RSbLhJshybzcxEBcwH91y70yEQpy2slHhL5UrApSfuhWPAmrZlaIJc6Xm7yHuGuMD/Eo
 7GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732184852; x=1732789652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETDe7un/JWIbuM3P/iFQm3j6qLUZiVYIWE/wIZIF+UQ=;
 b=EufbDtyxdZNG9SILQeDqT2kZx2LX+ks21VjpJPmpYjLP9+o7h6Stf8LHBZjeGrQy8G
 Q6PHREsLwl5zKl+b18LxDv1pyvTW2+bmRzy1p0QzboZO5b4bqPxh0AkaT1PzcHbBc0a5
 pg7ihzWExtHlwpi+2qsEljECYiOti70FUO/tUIcNtCfZWKIKvri9CpchAxh6z3RZK6tL
 AgiLnk3N954EjXkF+5vePRL9uEtQskv8nKBv+ruaWAxnkSC0wr6ywWg7T6hcPG3aATGt
 irHkxnyb0EuDfVv/GaCKh9PIkbKjs6aEWPSr+rVGAugV8pMRuwRqvOi0iQ1b30qv9yh7
 dN3w==
X-Gm-Message-State: AOJu0Ywi2j8ZzCG46pz8l5M0jK6G/Ne/JxRuMdpntJxcHgVbv+rhCdG7
 AvkFiEK4LV+6nn6qTMUIgnXT6T3KRCxQ9eRxkCSxGTN8kR7Q6yK6z6Dh+5WKTfY=
X-Gm-Gg: ASbGnctTqbXsSYZm0+bK1c/fWUxqFFqRJk2o8UJUqcDuxDYdvfqNQHYB2H6vLoty3K2
 Raelr9qnBUPqr8jcPkQg7o438hUBhLyfCzQkln8gwbQ+icO/ZOECvfzytTycUHeO3yt+xpL8MPm
 FvY7UpqKUNkLq5BpaZo6HVyVAcd7EcXH9mI0G8cf24sBn/JYfENy9aBJjN2CLqTH7LR2/XS5CTN
 dKN2hgCQZpLbaTPtjX6q1WJ+NktLBXZniHUaqvDsWXuRkPLn0HV7k380wdPeg==
X-Google-Smtp-Source: AGHT+IGXA/+mcIJaoEwFfDHSfe2OCn7hM4js3SpD/iGDIhd9SdjZizJ/yu+8/GlaJXxHCZF4+LTyLw==
X-Received: by 2002:a05:600c:444f:b0:42c:b4f2:7c30 with SMTP id
 5b1f17b1804b1-4334f017137mr46609585e9.23.1732184852451; 
 Thu, 21 Nov 2024 02:27:32 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1564:d000:2ed:2997:a6e4:61cb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d17ccsm52533165e9.6.2024.11.21.02.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 02:27:32 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: zack.rusin@broadcom.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/ttm: remove ttm_execbug_util
Date: Thu, 21 Nov 2024 11:27:25 +0100
Message-Id: <20241121102725.4195-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121102725.4195-1-christian.koenig@amd.com>
References: <20241121102725.4195-1-christian.koenig@amd.com>
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

Replaced by drm_exec and not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/Makefile           |   4 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c | 161 -------------------------
 include/drm/ttm/ttm_execbuf_util.h     | 119 ------------------
 3 files changed, 2 insertions(+), 282 deletions(-)
 delete mode 100644 drivers/gpu/drm/ttm/ttm_execbuf_util.c
 delete mode 100644 include/drm/ttm/ttm_execbuf_util.h

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index dad298127226..25937e4ad91a 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -3,8 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 
 ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
-	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
-	ttm_device.o ttm_sys_manager.o
+	ttm_range_manager.o ttm_resource.o ttm_pool.o ttm_device.o \
+	ttm_sys_manager.o
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 obj-$(CONFIG_DRM_TTM) += ttm.o
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
deleted file mode 100644
index f1c60fa80c2d..000000000000
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ /dev/null
@@ -1,161 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR MIT */
-/**************************************************************************
- *
- * Copyright (c) 2006-2009 VMware, Inc., Palo Alto, CA., USA
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- **************************************************************************/
-
-#include <drm/ttm/ttm_execbuf_util.h>
-#include <drm/ttm/ttm_bo.h>
-
-static void ttm_eu_backoff_reservation_reverse(struct list_head *list,
-					      struct ttm_validate_buffer *entry)
-{
-	list_for_each_entry_continue_reverse(entry, list, head) {
-		struct ttm_buffer_object *bo = entry->bo;
-
-		dma_resv_unlock(bo->base.resv);
-	}
-}
-
-void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
-				struct list_head *list)
-{
-	struct ttm_validate_buffer *entry;
-
-	if (list_empty(list))
-		return;
-
-	list_for_each_entry(entry, list, head) {
-		struct ttm_buffer_object *bo = entry->bo;
-
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-		dma_resv_unlock(bo->base.resv);
-	}
-
-	if (ticket)
-		ww_acquire_fini(ticket);
-}
-EXPORT_SYMBOL(ttm_eu_backoff_reservation);
-
-/*
- * Reserve buffers for validation.
- *
- * If a buffer in the list is marked for CPU access, we back off and
- * wait for that buffer to become free for GPU access.
- *
- * If a buffer is reserved for another validation, the validator with
- * the highest validation sequence backs off and waits for that buffer
- * to become unreserved. This prevents deadlocks when validating multiple
- * buffers in different orders.
- */
-
-int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
-			   struct list_head *list, bool intr,
-			   struct list_head *dups)
-{
-	struct ttm_validate_buffer *entry;
-	int ret;
-
-	if (list_empty(list))
-		return 0;
-
-	if (ticket)
-		ww_acquire_init(ticket, &reservation_ww_class);
-
-	list_for_each_entry(entry, list, head) {
-		struct ttm_buffer_object *bo = entry->bo;
-		unsigned int num_fences;
-
-		ret = ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
-		if (ret == -EALREADY && dups) {
-			struct ttm_validate_buffer *safe = entry;
-			entry = list_prev_entry(entry, head);
-			list_del(&safe->head);
-			list_add(&safe->head, dups);
-			continue;
-		}
-
-		num_fences = max(entry->num_shared, 1u);
-		if (!ret) {
-			ret = dma_resv_reserve_fences(bo->base.resv,
-						      num_fences);
-			if (!ret)
-				continue;
-		}
-
-		/* uh oh, we lost out, drop every reservation and try
-		 * to only reserve this buffer, then start over if
-		 * this succeeds.
-		 */
-		ttm_eu_backoff_reservation_reverse(list, entry);
-
-		if (ret == -EDEADLK) {
-			ret = ttm_bo_reserve_slowpath(bo, intr, ticket);
-		}
-
-		if (!ret)
-			ret = dma_resv_reserve_fences(bo->base.resv,
-						      num_fences);
-
-		if (unlikely(ret != 0)) {
-			if (ticket) {
-				ww_acquire_done(ticket);
-				ww_acquire_fini(ticket);
-			}
-			return ret;
-		}
-
-		/* move this item to the front of the list,
-		 * forces correct iteration of the loop without keeping track
-		 */
-		list_del(&entry->head);
-		list_add(&entry->head, list);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(ttm_eu_reserve_buffers);
-
-void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
-				 struct list_head *list,
-				 struct dma_fence *fence)
-{
-	struct ttm_validate_buffer *entry;
-
-	if (list_empty(list))
-		return;
-
-	list_for_each_entry(entry, list, head) {
-		struct ttm_buffer_object *bo = entry->bo;
-
-		dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
-				   DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
-		ttm_bo_move_to_lru_tail_unlocked(bo);
-		dma_resv_unlock(bo->base.resv);
-	}
-	if (ticket)
-		ww_acquire_fini(ticket);
-}
-EXPORT_SYMBOL(ttm_eu_fence_buffer_objects);
diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
deleted file mode 100644
index fac1e3e57ebd..000000000000
--- a/include/drm/ttm/ttm_execbuf_util.h
+++ /dev/null
@@ -1,119 +0,0 @@
-/**************************************************************************
- *
- * Copyright (c) 2006-2009 VMware, Inc., Palo Alto, CA., USA
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- **************************************************************************/
-/*
- * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
- */
-
-#ifndef _TTM_EXECBUF_UTIL_H_
-#define _TTM_EXECBUF_UTIL_H_
-
-#include <linux/list.h>
-
-struct ww_acquire_ctx;
-struct dma_fence;
-struct ttm_buffer_object;
-
-/**
- * struct ttm_validate_buffer
- *
- * @head:           list head for thread-private list.
- * @bo:             refcounted buffer object pointer.
- * @num_shared:     How many shared fences we want to add.
- */
-
-struct ttm_validate_buffer {
-	struct list_head head;
-	struct ttm_buffer_object *bo;
-	unsigned int num_shared;
-};
-
-/**
- * ttm_eu_backoff_reservation
- *
- * @ticket:   ww_acquire_ctx from reserve call
- * @list:     thread private list of ttm_validate_buffer structs.
- *
- * Undoes all buffer validation reservations for bos pointed to by
- * the list entries.
- */
-void ttm_eu_backoff_reservation(struct ww_acquire_ctx *ticket,
-				struct list_head *list);
-
-/**
- * ttm_eu_reserve_buffers
- *
- * @ticket:  [out] ww_acquire_ctx filled in by call, or NULL if only
- *           non-blocking reserves should be tried.
- * @list:    thread private list of ttm_validate_buffer structs.
- * @intr:    should the wait be interruptible
- * @dups:    [out] optional list of duplicates.
- *
- * Tries to reserve bos pointed to by the list entries for validation.
- * If the function returns 0, all buffers are marked as "unfenced",
- * taken off the lru lists and are not synced for write CPU usage.
- *
- * If the function detects a deadlock due to multiple threads trying to
- * reserve the same buffers in reverse order, all threads except one will
- * back off and retry. This function may sleep while waiting for
- * CPU write reservations to be cleared, and for other threads to
- * unreserve their buffers.
- *
- * If intr is set to true, this function may return -ERESTARTSYS if the
- * calling process receives a signal while waiting. In that case, no
- * buffers on the list will be reserved upon return.
- *
- * If dups is non NULL all buffers already reserved by the current thread
- * (e.g. duplicates) are added to this list, otherwise -EALREADY is returned
- * on the first already reserved buffer and all buffers from the list are
- * unreserved again.
- *
- * Buffers reserved by this function should be unreserved by
- * a call to either ttm_eu_backoff_reservation() or
- * ttm_eu_fence_buffer_objects() when command submission is complete or
- * has failed.
- */
-int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
-			   struct list_head *list, bool intr,
-			   struct list_head *dups);
-
-/**
- * ttm_eu_fence_buffer_objects
- *
- * @ticket:      ww_acquire_ctx from reserve call
- * @list:        thread private list of ttm_validate_buffer structs.
- * @fence:       The new exclusive fence for the buffers.
- *
- * This function should be called when command submission is complete, and
- * it will add a new sync object to bos pointed to by entries on @list.
- * It also unreserves all buffers, putting them on lru lists.
- *
- */
-void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
-				 struct list_head *list,
-				 struct dma_fence *fence);
-
-#endif
-- 
2.34.1

