Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351EA84D98
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E1E10EA63;
	Thu, 10 Apr 2025 19:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="PjVh4NZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE3610EA63
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 19:55:50 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-60219d9812bso338771eaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1744314949; x=1744919749;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kBrfOugctXy6HwOMPUyDNHojWILNeIi7xkPyFf2OQDg=;
 b=PjVh4NZVA2AM8BICB9YguuNar2AyM6k5egLLJ74oS6UnTySiImWCjQH+RarCktsF6W
 aOtbVfZtAm4992I5tw1+hKVaqml32FvxhJ7OQTfctvL/yd58jbyGrvHfSYA6w5vBd7G8
 qyIeBdKj3noW7b5rSk2A3aAdPbFZncwiBEIO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744314949; x=1744919749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kBrfOugctXy6HwOMPUyDNHojWILNeIi7xkPyFf2OQDg=;
 b=NrkbAK5NWOJWkAxmbppwhI5H6dS35rTKyGcs7YOPLzNkuecvq+ErgSKa5mqXHbTE3T
 8Hm0eyoKcAE71FSW3jjWwqDK3GIgx42wkqvaiJFYkOvo0I6KfE2e6k6IuvmrJHPPfTya
 xsGSOQRTZxj4JC4o3dYdZfLG8mGag8c8XzLXDI5r1IuPdIGqbzRgFVd5le+mOMxUmUPQ
 0lMo8F8NMmeKGshq//GpttR2Qfd+sa8A7KCVjFgQG31prPDwvPNR4bfiU/bHgulhBl1Q
 LOvg5D3R91NqgYoHeEQlUuV1kAinWiLU9BsGaABwVbtuSQV/IsjLWGRXh3PZ1juAd5xB
 ym2Q==
X-Gm-Message-State: AOJu0YwAzx8alw+hOXgsYW0GUyCJntTjPo0fafXJok9isr7yppCVcAnn
 IDG20gxDhpw94/tDkymBw2SP8Gkf6z71fKcbONXYuF0dNXBNjJd4QoCOcWwhobfd77oQygVYfB/
 Kyha41vnHRDnpDEw6jtvHL4gBpgXCZCrsdXgVw0hM/r8jXm3RmmqhJsGvn/Ii20/hZRurnkSu5D
 JNG5ZEPBdZQ+T9LdDl4IWSbzWMKXZLMnmPCTgXyjFaZBAGmJeDd7Ia
X-Gm-Gg: ASbGncsATFufq2eAQ4+ybSYih4p9Mjj9w3t73gT91bcUl+xjzcfD9PEtV6bzz6F95zE
 l9/1wAyZZXYqOJVCVvtYcjYZk7UWiQ4Ya+axJY5F+/dk12DJfySJL2BFRLPxRC/XH1tvE61HnTD
 WUFYR5coHtDW2ITOOzhhMavlLbksVw/HM2qXp5c1Nhk4MZzzR7xYl4w4A9w6JxvNw42BpgipGIn
 5J52hLB8Wrbac7eRzCWyJRP+DSKBsKDQNI9cJR4cdoIU2AGbeJNH/DZf9BHFkgk0TvbO0hv/dhH
 EduoWi2XdnmzslewywNtpf/MEPFUOjcGWd0YQ7nWYHfP9NNMB2zqPGHb6OftcPyoSEcADIivZjO
 CIAfa4WNE1g==
X-Google-Smtp-Source: AGHT+IEt4o+wCqHdBKMMgvWUHco7Esdo+mL14fwtvbA8FvLWQgUhcN7KDEyokxTWKEnoHBxm3fyJSw==
X-Received: by 2002:a05:6820:138c:b0:601:a927:351e with SMTP id
 006d021491bc7-6046f5abcf3mr14345eaf.7.1744314948814; 
 Thu, 10 Apr 2025 12:55:48 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6045f50eed4sm653599eaf.6.2025.04.10.12.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 12:55:47 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 2/2] drm/vmwgfx: Implement dma_fence_ops properly
Date: Thu, 10 Apr 2025 14:55:07 -0500
Message-ID: <20250410195508.233367-2-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410195508.233367-1-ian.forbes@broadcom.com>
References: <20250410195508.233367-1-ian.forbes@broadcom.com>
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

vmwgfx's fencing predates dma_fence and as a result dma_fence_ops was never
properly implemented, especially with respect to enabling signaling.

Because of this dma_fence callbacks don't work properly. This change
implements enable_signaling properly so that dma_fence callbacks now
work as expected.

It also removes vmwgfx's custom implementation of fence callbacks
and removes vmwgfx's custom dma_fence_ops::wait function which is no
longer necessary now that enable_signaling works.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  26 --
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   | 479 ++++--------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h   |  19 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c     |  44 ++-
 5 files changed, 99 insertions(+), 485 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 6d4a68f0ae37..6df61c22d442 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1006,14 +1006,14 @@ extern int vmw_fallback_wait(struct vmw_private *dev_priv,
 			     uint32_t seqno,
 			     bool interruptible,
 			     unsigned long timeout);
-extern void vmw_seqno_waiter_add(struct vmw_private *dev_priv);
-extern void vmw_seqno_waiter_remove(struct vmw_private *dev_priv);
-extern void vmw_goal_waiter_add(struct vmw_private *dev_priv);
-extern void vmw_goal_waiter_remove(struct vmw_private *dev_priv);
-extern void vmw_generic_waiter_add(struct vmw_private *dev_priv, u32 flag,
-				   int *waiter_count);
-extern void vmw_generic_waiter_remove(struct vmw_private *dev_priv,
-				      u32 flag, int *waiter_count);
+bool vmw_seqno_waiter_add(struct vmw_private *dev_priv);
+bool vmw_seqno_waiter_remove(struct vmw_private *dev_priv);
+bool vmw_goal_waiter_add(struct vmw_private *dev_priv);
+bool vmw_goal_waiter_remove(struct vmw_private *dev_priv);
+bool vmw_generic_waiter_add(struct vmw_private *dev_priv, u32 flag,
+			    int *waiter_count);
+bool vmw_generic_waiter_remove(struct vmw_private *dev_priv,
+			       u32 flag, int *waiter_count);
 
 /**
  * Kernel modesetting - vmwgfx_kms.c
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 90ce5372343b..819704ac675d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4067,23 +4067,6 @@ static int vmw_execbuf_tie_context(struct vmw_private *dev_priv,
 	return 0;
 }
 
-/*
- * DMA fence callback to remove a seqno_waiter
- */
-struct seqno_waiter_rm_context {
-	struct dma_fence_cb base;
-	struct vmw_private *dev_priv;
-};
-
-static void seqno_waiter_rm_cb(struct dma_fence *f, struct dma_fence_cb *cb)
-{
-	struct seqno_waiter_rm_context *ctx =
-		container_of(cb, struct seqno_waiter_rm_context, base);
-
-	vmw_seqno_waiter_remove(ctx->dev_priv);
-	kfree(ctx);
-}
-
 int vmw_execbuf_process(struct drm_file *file_priv,
 			struct vmw_private *dev_priv,
 			void __user *user_commands, void *kernel_commands,
@@ -4264,15 +4247,6 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 		} else {
 			/* Link the fence with the FD created earlier */
 			fd_install(out_fence_fd, sync_file->file);
-			struct seqno_waiter_rm_context *ctx =
-				kmalloc(sizeof(*ctx), GFP_KERNEL);
-			ctx->dev_priv = dev_priv;
-			vmw_seqno_waiter_add(dev_priv);
-			if (dma_fence_add_callback(&fence->base, &ctx->base,
-						   seqno_waiter_rm_cb) < 0) {
-				vmw_seqno_waiter_remove(dev_priv);
-				kfree(ctx);
-			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 9d1465558839..a0c64de31bb9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2011-2023 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2011-2025 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -25,8 +26,6 @@
  *
  **************************************************************************/
 
-#include <linux/sched/signal.h>
-
 #include "vmwgfx_drv.h"
 
 #define VMW_FENCE_WRAP (1 << 31)
@@ -35,14 +34,7 @@ struct vmw_fence_manager {
 	struct vmw_private *dev_priv;
 	spinlock_t lock;
 	struct list_head fence_list;
-	struct work_struct work;
 	bool fifo_down;
-	struct list_head cleanup_list;
-	uint32_t pending_actions[VMW_ACTION_MAX];
-	struct mutex goal_irq_mutex;
-	bool goal_irq_on; /* Protected by @goal_irq_mutex */
-	bool seqno_valid; /* Protected by @lock, and may not be set to true
-			     without the @goal_irq_mutex held. */
 	u64 ctx;
 };
 
@@ -52,12 +44,10 @@ struct vmw_user_fence {
 };
 
 /**
- * struct vmw_event_fence_action - fence action that delivers a drm event.
+ * struct vmw_event_fence_action - fence callback that delivers a DRM event.
  *
- * @action: A struct vmw_fence_action to hook up to a fence.
+ * @base:  For use with dma_fence_add_callback(...)
  * @event: A pointer to the pending event.
- * @fence: A referenced pointer to the fence to keep it alive while @action
- * hangs on it.
  * @dev: Pointer to a struct drm_device so we can access the event stuff.
  * @tv_sec: If non-null, the variable pointed to will be assigned
  * current time tv_sec val when the fence signals.
@@ -65,10 +55,9 @@ struct vmw_user_fence {
  * be assigned the current time tv_usec val when the fence signals.
  */
 struct vmw_event_fence_action {
-	struct vmw_fence_action action;
+	struct dma_fence_cb base;
 
 	struct drm_pending_event *event;
-	struct vmw_fence_obj *fence;
 	struct drm_device *dev;
 
 	uint32_t *tv_sec;
@@ -81,44 +70,6 @@ fman_from_fence(struct vmw_fence_obj *fence)
 	return container_of(fence->base.lock, struct vmw_fence_manager, lock);
 }
 
-static u32 vmw_fence_goal_read(struct vmw_private *vmw)
-{
-	if ((vmw->capabilities2 & SVGA_CAP2_EXTRA_REGS) != 0)
-		return vmw_read(vmw, SVGA_REG_FENCE_GOAL);
-	else
-		return vmw_fifo_mem_read(vmw, SVGA_FIFO_FENCE_GOAL);
-}
-
-static void vmw_fence_goal_write(struct vmw_private *vmw, u32 value)
-{
-	if ((vmw->capabilities2 & SVGA_CAP2_EXTRA_REGS) != 0)
-		vmw_write(vmw, SVGA_REG_FENCE_GOAL, value);
-	else
-		vmw_fifo_mem_write(vmw, SVGA_FIFO_FENCE_GOAL, value);
-}
-
-/*
- * Note on fencing subsystem usage of irqs:
- * Typically the vmw_fences_update function is called
- *
- * a) When a new fence seqno has been submitted by the fifo code.
- * b) On-demand when we have waiters. Sleeping waiters will switch on the
- * ANY_FENCE irq and call vmw_fences_update function each time an ANY_FENCE
- * irq is received. When the last fence waiter is gone, that IRQ is masked
- * away.
- *
- * In situations where there are no waiters and we don't submit any new fences,
- * fence objects may not be signaled. This is perfectly OK, since there are
- * no consumers of the signaled data, but that is NOT ok when there are fence
- * actions attached to a fence. The fencing subsystem then makes use of the
- * FENCE_GOAL irq and sets the fence goal seqno to that of the next fence
- * which has an action attached, and each time vmw_fences_update is called,
- * the subsystem makes sure the fence goal seqno is updated.
- *
- * The fence goal seqno irq is on as long as there are unsignaled fence
- * objects with actions attached to them.
- */
-
 static void vmw_fence_obj_destroy(struct dma_fence *f)
 {
 	struct vmw_fence_obj *fence =
@@ -126,8 +77,21 @@ static void vmw_fence_obj_destroy(struct dma_fence *f)
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 
 	if (!list_empty(&fence->head)) {
+		/* The fence manager still has an implicit reference to this
+		 * fence via the fence list if head is set. Because the lock is
+		 * required to be held when the fence manager updates the fence
+		 * list either the fence will have been removed after we get
+		 * the lock below or we can safely remove it and the fence
+		 * manager will never see it. This implies the fence is being
+		 * deleted without being signaled which is dubious but valid
+		 * if there are no callbacks. The dma_fence code that calls
+		 * this hook will warn about deleted unsignaled with callbacks
+		 * so no need to warn again here.
+		 */
 		spin_lock(&fman->lock);
 		list_del_init(&fence->head);
+		if (fence->waiter_added)
+			vmw_seqno_waiter_remove(fman->dev_priv);
 		spin_unlock(&fman->lock);
 	}
 	fence->destroy(fence);
@@ -143,6 +107,13 @@ static const char *vmw_fence_get_timeline_name(struct dma_fence *f)
 	return "svga";
 }
 
+/* When we toggle signaling for the SVGA device there is a race period from
+ * the time we first read the fence seqno to the time we enable interrupts.
+ * If we miss the interrupt for a fence during this period its likely the driver
+ * will stall. As a result we need to re-read the seqno after interrupts are
+ * enabled. If interrupts were already enabled we just increment the number of
+ * seqno waiters.
+ */
 static bool vmw_fence_enable_signaling(struct dma_fence *f)
 {
 	struct vmw_fence_obj *fence =
@@ -150,158 +121,31 @@ static bool vmw_fence_enable_signaling(struct dma_fence *f)
 
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
 	struct vmw_private *dev_priv = fman->dev_priv;
-
+check_for_race:
 	u32 seqno = vmw_fence_read(dev_priv);
-	if (seqno - fence->base.seqno < VMW_FENCE_WRAP)
+	if (seqno - fence->base.seqno < VMW_FENCE_WRAP) {
+		if (fence->waiter_added) {
+			vmw_seqno_waiter_remove(dev_priv);
+			fence->waiter_added = false;
+		}
 		return false;
-
+	} else if (!fence->waiter_added) {
+		fence->waiter_added = true;
+		if (vmw_seqno_waiter_add(dev_priv))
+			goto check_for_race;
+	}
 	return true;
 }
 
-struct vmwgfx_wait_cb {
-	struct dma_fence_cb base;
-	struct task_struct *task;
-};
-
-static void
-vmwgfx_wait_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
-{
-	struct vmwgfx_wait_cb *wait =
-		container_of(cb, struct vmwgfx_wait_cb, base);
-
-	wake_up_process(wait->task);
-}
-
 static u32 __vmw_fences_update(struct vmw_fence_manager *fman);
 
-static long vmw_fence_wait(struct dma_fence *f, bool intr, signed long timeout)
-{
-	struct vmw_fence_obj *fence =
-		container_of(f, struct vmw_fence_obj, base);
-
-	struct vmw_fence_manager *fman = fman_from_fence(fence);
-	struct vmw_private *dev_priv = fman->dev_priv;
-	struct vmwgfx_wait_cb cb;
-	long ret = timeout;
-
-	if (likely(vmw_fence_obj_signaled(fence)))
-		return timeout;
-
-	vmw_seqno_waiter_add(dev_priv);
-
-	spin_lock(f->lock);
-
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &f->flags))
-		goto out;
-
-	if (intr && signal_pending(current)) {
-		ret = -ERESTARTSYS;
-		goto out;
-	}
-
-	cb.base.func = vmwgfx_wait_cb;
-	cb.task = current;
-	list_add(&cb.base.node, &f->cb_list);
-
-	for (;;) {
-		__vmw_fences_update(fman);
-
-		/*
-		 * We can use the barrier free __set_current_state() since
-		 * DMA_FENCE_FLAG_SIGNALED_BIT + wakeup is protected by the
-		 * fence spinlock.
-		 */
-		if (intr)
-			__set_current_state(TASK_INTERRUPTIBLE);
-		else
-			__set_current_state(TASK_UNINTERRUPTIBLE);
-
-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &f->flags)) {
-			if (ret == 0 && timeout > 0)
-				ret = 1;
-			break;
-		}
-
-		if (intr && signal_pending(current)) {
-			ret = -ERESTARTSYS;
-			break;
-		}
-
-		if (ret == 0)
-			break;
-
-		spin_unlock(f->lock);
-
-		ret = schedule_timeout(ret);
-
-		spin_lock(f->lock);
-	}
-	__set_current_state(TASK_RUNNING);
-	if (!list_empty(&cb.base.node))
-		list_del(&cb.base.node);
-
-out:
-	spin_unlock(f->lock);
-
-	vmw_seqno_waiter_remove(dev_priv);
-
-	return ret;
-}
-
 static const struct dma_fence_ops vmw_fence_ops = {
 	.get_driver_name = vmw_fence_get_driver_name,
 	.get_timeline_name = vmw_fence_get_timeline_name,
 	.enable_signaling = vmw_fence_enable_signaling,
-	.wait = vmw_fence_wait,
 	.release = vmw_fence_obj_destroy,
 };
 
-/*
- * Execute signal actions on fences recently signaled.
- * This is done from a workqueue so we don't have to execute
- * signal actions from atomic context.
- */
-
-static void vmw_fence_work_func(struct work_struct *work)
-{
-	struct vmw_fence_manager *fman =
-		container_of(work, struct vmw_fence_manager, work);
-	struct list_head list;
-	struct vmw_fence_action *action, *next_action;
-	bool seqno_valid;
-
-	do {
-		INIT_LIST_HEAD(&list);
-		mutex_lock(&fman->goal_irq_mutex);
-
-		spin_lock(&fman->lock);
-		list_splice_init(&fman->cleanup_list, &list);
-		seqno_valid = fman->seqno_valid;
-		spin_unlock(&fman->lock);
-
-		if (!seqno_valid && fman->goal_irq_on) {
-			fman->goal_irq_on = false;
-			vmw_goal_waiter_remove(fman->dev_priv);
-		}
-		mutex_unlock(&fman->goal_irq_mutex);
-
-		if (list_empty(&list))
-			return;
-
-		/*
-		 * At this point, only we should be able to manipulate the
-		 * list heads of the actions we have on the private list.
-		 * hence fman::lock not held.
-		 */
-
-		list_for_each_entry_safe(action, next_action, &list, head) {
-			list_del_init(&action->head);
-			if (action->cleanup)
-				action->cleanup(action);
-		}
-	} while (1);
-}
-
 struct vmw_fence_manager *vmw_fence_manager_init(struct vmw_private *dev_priv)
 {
 	struct vmw_fence_manager *fman = kzalloc(sizeof(*fman), GFP_KERNEL);
@@ -312,10 +156,7 @@ struct vmw_fence_manager *vmw_fence_manager_init(struct vmw_private *dev_priv)
 	fman->dev_priv = dev_priv;
 	spin_lock_init(&fman->lock);
 	INIT_LIST_HEAD(&fman->fence_list);
-	INIT_LIST_HEAD(&fman->cleanup_list);
-	INIT_WORK(&fman->work, &vmw_fence_work_func);
 	fman->fifo_down = true;
-	mutex_init(&fman->goal_irq_mutex);
 	fman->ctx = dma_fence_context_alloc(1);
 
 	return fman;
@@ -325,11 +166,8 @@ void vmw_fence_manager_takedown(struct vmw_fence_manager *fman)
 {
 	bool lists_empty;
 
-	(void) cancel_work_sync(&fman->work);
-
 	spin_lock(&fman->lock);
-	lists_empty = list_empty(&fman->fence_list) &&
-		list_empty(&fman->cleanup_list);
+	lists_empty = list_empty(&fman->fence_list);
 	spin_unlock(&fman->lock);
 
 	BUG_ON(!lists_empty);
@@ -344,7 +182,6 @@ static int vmw_fence_obj_init(struct vmw_fence_manager *fman,
 
 	dma_fence_init(&fence->base, &vmw_fence_ops, &fman->lock,
 		       fman->ctx, seqno);
-	INIT_LIST_HEAD(&fence->seq_passed_actions);
 	fence->destroy = destroy;
 
 	spin_lock(&fman->lock);
@@ -352,6 +189,11 @@ static int vmw_fence_obj_init(struct vmw_fence_manager *fman,
 		ret = -EBUSY;
 		goto out_unlock;
 	}
+	/* This creates an implicit reference to the fence from the fence
+	 * manager. It will be dropped when the fence is signaled which is
+	 * expected to happen before deletion. The dtor has code to catch
+	 * the rare deletion before signaling case.
+	 */
 	list_add_tail(&fence->head, &fman->fence_list);
 
 out_unlock:
@@ -360,141 +202,24 @@ static int vmw_fence_obj_init(struct vmw_fence_manager *fman,
 
 }
 
-static void vmw_fences_perform_actions(struct vmw_fence_manager *fman,
-				struct list_head *list)
-{
-	struct vmw_fence_action *action, *next_action;
-
-	list_for_each_entry_safe(action, next_action, list, head) {
-		list_del_init(&action->head);
-		fman->pending_actions[action->type]--;
-		if (action->seq_passed != NULL)
-			action->seq_passed(action);
-
-		/*
-		 * Add the cleanup action to the cleanup list so that
-		 * it will be performed by a worker task.
-		 */
-
-		list_add_tail(&action->head, &fman->cleanup_list);
-	}
-}
-
-/**
- * vmw_fence_goal_new_locked - Figure out a new device fence goal
- * seqno if needed.
- *
- * @fman: Pointer to a fence manager.
- * @passed_seqno: The seqno the device currently signals as passed.
- *
- * This function should be called with the fence manager lock held.
- * It is typically called when we have a new passed_seqno, and
- * we might need to update the fence goal. It checks to see whether
- * the current fence goal has already passed, and, in that case,
- * scans through all unsignaled fences to get the next fence object with an
- * action attached, and sets the seqno of that fence as a new fence goal.
- *
- * returns true if the device goal seqno was updated. False otherwise.
- */
-static bool vmw_fence_goal_new_locked(struct vmw_fence_manager *fman,
-				      u32 passed_seqno)
-{
-	u32 goal_seqno;
-	struct vmw_fence_obj *fence, *next_fence;
-
-	if (likely(!fman->seqno_valid))
-		return false;
-
-	goal_seqno = vmw_fence_goal_read(fman->dev_priv);
-	if (likely(passed_seqno - goal_seqno >= VMW_FENCE_WRAP))
-		return false;
-
-	fman->seqno_valid = false;
-	list_for_each_entry_safe(fence, next_fence, &fman->fence_list, head) {
-		if (!list_empty(&fence->seq_passed_actions)) {
-			fman->seqno_valid = true;
-			vmw_fence_goal_write(fman->dev_priv,
-					     fence->base.seqno);
-			break;
-		}
-	}
-
-	return true;
-}
-
-
-/**
- * vmw_fence_goal_check_locked - Replace the device fence goal seqno if
- * needed.
- *
- * @fence: Pointer to a struct vmw_fence_obj the seqno of which should be
- * considered as a device fence goal.
- *
- * This function should be called with the fence manager lock held.
- * It is typically called when an action has been attached to a fence to
- * check whether the seqno of that fence should be used for a fence
- * goal interrupt. This is typically needed if the current fence goal is
- * invalid, or has a higher seqno than that of the current fence object.
- *
- * returns true if the device goal seqno was updated. False otherwise.
- */
-static bool vmw_fence_goal_check_locked(struct vmw_fence_obj *fence)
-{
-	struct vmw_fence_manager *fman = fman_from_fence(fence);
-	u32 goal_seqno;
-
-	if (dma_fence_is_signaled_locked(&fence->base))
-		return false;
-
-	goal_seqno = vmw_fence_goal_read(fman->dev_priv);
-	if (likely(fman->seqno_valid &&
-		   goal_seqno - fence->base.seqno < VMW_FENCE_WRAP))
-		return false;
-
-	vmw_fence_goal_write(fman->dev_priv, fence->base.seqno);
-	fman->seqno_valid = true;
-
-	return true;
-}
-
 static u32 __vmw_fences_update(struct vmw_fence_manager *fman)
 {
 	struct vmw_fence_obj *fence, *next_fence;
-	struct list_head action_list;
-	bool needs_rerun;
-	uint32_t seqno, new_seqno;
+	const bool cookie = dma_fence_begin_signalling();
+	const u32 seqno = vmw_fence_read(fman->dev_priv);
 
-	seqno = vmw_fence_read(fman->dev_priv);
-rerun:
 	list_for_each_entry_safe(fence, next_fence, &fman->fence_list, head) {
 		if (seqno - fence->base.seqno < VMW_FENCE_WRAP) {
 			list_del_init(&fence->head);
+			if (fence->waiter_added) {
+				vmw_seqno_waiter_remove(fman->dev_priv);
+				fence->waiter_added = false;
+			}
 			dma_fence_signal_locked(&fence->base);
-			INIT_LIST_HEAD(&action_list);
-			list_splice_init(&fence->seq_passed_actions,
-					 &action_list);
-			vmw_fences_perform_actions(fman, &action_list);
 		} else
 			break;
 	}
-
-	/*
-	 * Rerun if the fence goal seqno was updated, and the
-	 * hardware might have raced with that update, so that
-	 * we missed a fence_goal irq.
-	 */
-
-	needs_rerun = vmw_fence_goal_new_locked(fman, seqno);
-	if (unlikely(needs_rerun)) {
-		new_seqno = vmw_fence_read(fman->dev_priv);
-		if (new_seqno != seqno) {
-			seqno = new_seqno;
-			goto rerun;
-		}
-	}
-
-	if (!list_empty(&fman->cleanup_list))
-		(void) schedule_work(&fman->work);
+	dma_fence_end_signalling(cookie);
 	return (fman->dev_priv->last_read_seqno = seqno);
 }
 
@@ -542,14 +267,13 @@ int vmw_fence_create(struct vmw_fence_manager *fman,
 		     struct vmw_fence_obj **p_fence)
 {
 	struct vmw_fence_obj *fence;
- 	int ret;
+	int ret;
 
 	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
 	if (unlikely(!fence))
 		return -ENOMEM;
 
-	ret = vmw_fence_obj_init(fman, fence, seqno,
-				 vmw_fence_destroy);
+	ret = vmw_fence_obj_init(fman, fence, seqno, vmw_fence_destroy);
 	if (unlikely(ret != 0))
 		goto out_err_init;
 
@@ -641,7 +365,6 @@ int vmw_user_fence_create(struct drm_file *file_priv,
 
 void vmw_fence_fifo_down(struct vmw_fence_manager *fman)
 {
-	struct list_head action_list;
 	int ret;
 
 	/*
@@ -664,10 +387,6 @@ void vmw_fence_fifo_down(struct vmw_fence_manager *fman)
 		if (unlikely(ret != 0)) {
 			list_del_init(&fence->head);
 			dma_fence_signal(&fence->base);
-			INIT_LIST_HEAD(&action_list);
-			list_splice_init(&fence->seq_passed_actions,
-					 &action_list);
-			vmw_fences_perform_actions(fman, &action_list);
 		}
 
 		BUG_ON(!list_empty(&fence->head));
@@ -813,19 +532,20 @@ int vmw_fence_obj_unref_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * vmw_event_fence_action_seq_passed
+ * vmw_event_fence_action_seq_passed - dma_fence callback for
+ * vmw_event_fence_action_queue.
  *
- * @action: The struct vmw_fence_action embedded in a struct
- * vmw_event_fence_action.
+ * @f:  The vmw_fence_obj upon which this callback was queued.
+ * @cb: The vmw_event_fence_action callback context object.
  *
  * This function is called when the seqno of the fence where @action is
  * attached has passed. It queues the event on the submitter's event list.
- * This function is always called from atomic context.
  */
-static void vmw_event_fence_action_seq_passed(struct vmw_fence_action *action)
+static void vmw_event_fence_action_seq_passed(struct dma_fence *f,
+					      struct dma_fence_cb *cb)
 {
 	struct vmw_event_fence_action *eaction =
-		container_of(action, struct vmw_event_fence_action, action);
+		container_of(cb, struct vmw_event_fence_action, base);
 	struct drm_device *dev = eaction->dev;
 	struct drm_pending_event *event = eaction->event;
 
@@ -835,9 +555,7 @@ static void vmw_event_fence_action_seq_passed(struct vmw_fence_action *action)
 	spin_lock_irq(&dev->event_lock);
 
 	if (likely(eaction->tv_sec != NULL)) {
-		struct timespec64 ts;
-
-		ktime_get_ts64(&ts);
+		struct timespec64 ts = ktime_to_timespec64(f->timestamp);
 		/* monotonic time, so no y2038 overflow */
 		*eaction->tv_sec = ts.tv_sec;
 		*eaction->tv_usec = ts.tv_nsec / NSEC_PER_USEC;
@@ -846,75 +564,10 @@ static void vmw_event_fence_action_seq_passed(struct vmw_fence_action *action)
 	drm_send_event_locked(dev, eaction->event);
 	eaction->event = NULL;
 	spin_unlock_irq(&dev->event_lock);
-}
-
-/**
- * vmw_event_fence_action_cleanup
- *
- * @action: The struct vmw_fence_action embedded in a struct
- * vmw_event_fence_action.
- *
- * This function is the struct vmw_fence_action destructor. It's typically
- * called from a workqueue.
- */
-static void vmw_event_fence_action_cleanup(struct vmw_fence_action *action)
-{
-	struct vmw_event_fence_action *eaction =
-		container_of(action, struct vmw_event_fence_action, action);
-
-	vmw_fence_obj_unreference(&eaction->fence);
+	dma_fence_put(f);
 	kfree(eaction);
 }
 
-
-/**
- * vmw_fence_obj_add_action - Add an action to a fence object.
- *
- * @fence: The fence object.
- * @action: The action to add.
- *
- * Note that the action callbacks may be executed before this function
- * returns.
- */
-static void vmw_fence_obj_add_action(struct vmw_fence_obj *fence,
-			      struct vmw_fence_action *action)
-{
-	struct vmw_fence_manager *fman = fman_from_fence(fence);
-	bool run_update = false;
-
-	mutex_lock(&fman->goal_irq_mutex);
-	spin_lock(&fman->lock);
-
-	fman->pending_actions[action->type]++;
-	if (dma_fence_is_signaled_locked(&fence->base)) {
-		struct list_head action_list;
-
-		INIT_LIST_HEAD(&action_list);
-		list_add_tail(&action->head, &action_list);
-		vmw_fences_perform_actions(fman, &action_list);
-	} else {
-		list_add_tail(&action->head, &fence->seq_passed_actions);
-
-		/*
-		 * This function may set fman::seqno_valid, so it must
-		 * be run with the goal_irq_mutex held.
-		 */
-		run_update = vmw_fence_goal_check_locked(fence);
-	}
-
-	spin_unlock(&fman->lock);
-
-	if (run_update) {
-		if (!fman->goal_irq_on) {
-			fman->goal_irq_on = true;
-			vmw_goal_waiter_add(fman->dev_priv);
-		}
-		vmw_fences_update(fman);
-	}
-	mutex_unlock(&fman->goal_irq_mutex);
-
-}
-
 /**
  * vmw_event_fence_action_queue - Post an event for sending when a fence
  * object seqno has passed.
@@ -949,18 +602,14 @@ int vmw_event_fence_action_queue(struct drm_file *file_priv,
 		return -ENOMEM;
 
 	eaction->event = event;
-
-	eaction->action.seq_passed = vmw_event_fence_action_seq_passed;
-	eaction->action.cleanup = vmw_event_fence_action_cleanup;
-	eaction->action.type = VMW_ACTION_EVENT;
-
-	eaction->fence = vmw_fence_obj_reference(fence);
 	eaction->dev = &fman->dev_priv->drm;
 	eaction->tv_sec = tv_sec;
 	eaction->tv_usec = tv_usec;
 
-	vmw_fence_obj_add_action(fence, &eaction->action);
-
+	vmw_fence_obj_reference(fence); // Dropped in CB
+	if (dma_fence_add_callback(&fence->base, &eaction->base,
+				   vmw_event_fence_action_seq_passed) < 0)
+		vmw_event_fence_action_seq_passed(&fence->base, &eaction->base);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
index 10264dab5f6a..e897cccae1ae 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
@@ -39,27 +39,10 @@ struct drm_pending_event;
 struct vmw_private;
 struct vmw_fence_manager;
 
-/**
- *
- *
- */
-enum vmw_action_type {
-	VMW_ACTION_EVENT = 0,
-	VMW_ACTION_MAX
-};
-
-struct vmw_fence_action {
-	struct list_head head;
-	enum vmw_action_type type;
-	void (*seq_passed) (struct vmw_fence_action *action);
-	void (*cleanup) (struct vmw_fence_action *action);
-};
-
 struct vmw_fence_obj {
 	struct dma_fence base;
-
+	bool   waiter_added;
 	struct list_head head;
-	struct list_head seq_passed_actions;
 	void (*destroy)(struct vmw_fence_obj *fence);
 };
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index 548ef2f86508..6830394c3f74 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -229,51 +229,59 @@ int vmw_fallback_wait(struct vmw_private *dev_priv,
 	return ret;
 }
 
-void vmw_generic_waiter_add(struct vmw_private *dev_priv,
+bool vmw_generic_waiter_add(struct vmw_private *dev_priv,
 			    u32 flag, int *waiter_count)
 {
-	spin_lock_bh(&dev_priv->waiter_lock);
+	bool hw_programmed = false;
+
+	spin_lock(&dev_priv->waiter_lock);
 	if ((*waiter_count)++ == 0) {
 		vmw_irq_status_write(dev_priv, flag);
 		dev_priv->irq_mask |= flag;
 		vmw_write(dev_priv, SVGA_REG_IRQMASK, dev_priv->irq_mask);
+		hw_programmed = true;
 	}
-	spin_unlock_bh(&dev_priv->waiter_lock);
+	spin_unlock(&dev_priv->waiter_lock);
+	return hw_programmed;
 }
 
-void vmw_generic_waiter_remove(struct vmw_private *dev_priv,
+bool vmw_generic_waiter_remove(struct vmw_private *dev_priv,
 			       u32 flag, int *waiter_count)
 {
-	spin_lock_bh(&dev_priv->waiter_lock);
+	bool hw_programmed = false;
+
+	spin_lock(&dev_priv->waiter_lock);
 	if (--(*waiter_count) == 0) {
 		dev_priv->irq_mask &= ~flag;
 		vmw_write(dev_priv, SVGA_REG_IRQMASK, dev_priv->irq_mask);
+		hw_programmed = true;
 	}
-	spin_unlock_bh(&dev_priv->waiter_lock);
+	spin_unlock(&dev_priv->waiter_lock);
+	return hw_programmed;
 }
 
-void vmw_seqno_waiter_add(struct vmw_private *dev_priv)
+bool vmw_seqno_waiter_add(struct vmw_private *dev_priv)
 {
-	vmw_generic_waiter_add(dev_priv, SVGA_IRQFLAG_ANY_FENCE,
-			       &dev_priv->fence_queue_waiters);
+	return vmw_generic_waiter_add(dev_priv, SVGA_IRQFLAG_ANY_FENCE,
+					&dev_priv->fence_queue_waiters);
 }
 
-void vmw_seqno_waiter_remove(struct vmw_private *dev_priv)
+bool vmw_seqno_waiter_remove(struct vmw_private *dev_priv)
 {
-	vmw_generic_waiter_remove(dev_priv, SVGA_IRQFLAG_ANY_FENCE,
-				  &dev_priv->fence_queue_waiters);
+	return vmw_generic_waiter_remove(dev_priv, SVGA_IRQFLAG_ANY_FENCE,
+					&dev_priv->fence_queue_waiters);
 }
 
-void vmw_goal_waiter_add(struct vmw_private *dev_priv)
+bool vmw_goal_waiter_add(struct vmw_private *dev_priv)
 {
-	vmw_generic_waiter_add(dev_priv, vmw_irqflag_fence_goal(dev_priv),
-			       &dev_priv->goal_queue_waiters);
+	return vmw_generic_waiter_add(dev_priv, vmw_irqflag_fence_goal(dev_priv),
+					&dev_priv->goal_queue_waiters);
 }
 
-void vmw_goal_waiter_remove(struct vmw_private *dev_priv)
+bool vmw_goal_waiter_remove(struct vmw_private *dev_priv)
 {
-	vmw_generic_waiter_remove(dev_priv, vmw_irqflag_fence_goal(dev_priv),
-				  &dev_priv->goal_queue_waiters);
+	return vmw_generic_waiter_remove(dev_priv, vmw_irqflag_fence_goal(dev_priv),
+					&dev_priv->goal_queue_waiters);
 }
 
 static void vmw_irq_preinstall(struct drm_device *dev)
-- 
2.49.0

