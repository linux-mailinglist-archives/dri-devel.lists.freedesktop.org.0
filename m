Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A33AC95B0
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 20:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418A110E869;
	Fri, 30 May 2025 18:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="cfIXcAlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE2210E1BF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 18:35:21 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-742c9563fd9so2006504b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 11:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1748630121; x=1749234921;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8AaxlXlgZypCpG4rNmdHDWY9ZtPpWzFhMu/+5WsTOyQ=;
 b=cfIXcAlfjcEtbnYMBY2PMF7DqR5JpMFGic2MImnm3ZgebnKj2tsqPnZZk1eHO7Qdt6
 92sWbtfmNiWyeemqrPqxRv+Gl69BJriqo7DNXvMEki68x6kmQodhhoud0vX77aKyqkpf
 wmiFvA+Te8DsFPEbNAqzGUeyjz/acT2ANAobU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748630121; x=1749234921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8AaxlXlgZypCpG4rNmdHDWY9ZtPpWzFhMu/+5WsTOyQ=;
 b=TpuxyfEBUPNL0rjpZnqVppJrrSrON5fZD9Fga7bK+60UtE+0Y3wPFttJoYekcPg0Cv
 NU46j5ZnKxHMCL+8T2eSqzuqxMZsnb0I1qTMiM+JsAIklB4f0PMpAH1adQxHJPb/D440
 bsrSedqlgs7DT0bqdvRliY18v3kbfCAfKm+8O1GrV8VKhXPRCmVEnUc+PQou9JQgYkeW
 sWGO5WzCGkSPJMI1c62Bd5007rtiyMLJo/R4vbC9BBdOTENOlzplS4eb6kALA7cx//L3
 HZrlqDJ/A8N5tJItACfI7XlxZWH8p8p9ktzJGNbTuhpHeblbGqYI/pdWpgke/fMUcu2Q
 zr5g==
X-Gm-Message-State: AOJu0YyAooWUByGhuR3phjE640ohP/wPk2zvupzU4RZnQizEeNN+UCW1
 5wtsRnei7MUK5MuQexUaldFmYo1d4pB7tEWs6JcrsVzARS/YnuBR9MDRhtxj/jmOOXqidogJkzT
 Sf/tCdEVQaYDhxUO8mBlbHKpRbShIhJldJ+Uw+N4kc9LgMjtfm7kt8YUOaZrtubq9G+Py4ffOdx
 7PMyct830QJWk0DCVoWK7fEqL1KWUaHLXMFifO448woxliz/mVYgMk2Q==
X-Gm-Gg: ASbGncue8szkvcS/lfrJs9S3LHrQ67EvVN4Dwbe/erBAtcnslbpNeraM67VcwJV8GOW
 Dsigtbt65iUVV6r54wwrTfUbJNS/XI/2gxNwSkv+/Vq45AJPAR+UtYeqn2gM/7Ugj/4bMeT81dP
 JMrjnwgCQvWzTwvDeLlmtBQZPyVzLEohhNEtG4aLr+F/cpJrrOkpuh3L2eyNJNSjvdeF4FjrGRb
 /kkyy8rThbPkebFJsrTtqxoRrNSo/hypllW1Lp917/nSGnWGeeBp5LVPWblM/uIKVxMKXPkYlib
 wgPvwvAv+F1EpY94NYp4Zqw2KBilvKM3w/PvuTjSiQtViLaEapuRuXkE5H13DMWr5Jo1Y6392N5
 JO/W3LtxPPYuLUm87HtlD
X-Google-Smtp-Source: AGHT+IG5m1incgpMd6OK2zpmtUdxNfuU6QbHOsntK5XsbfqhXADmOc7a4MyfPYanuiwfYQ5l+02uXA==
X-Received: by 2002:a05:6a00:8d2:b0:736:6ecd:8e34 with SMTP id
 d2e1a72fcca58-747c1c3da28mr4725090b3a.18.1748630121002; 
 Fri, 30 May 2025 11:35:21 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affafa42sm3464766b3a.92.2025.05.30.11.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 11:35:20 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 1/2] drm/vmwgfx: Update last_read_seqno under the fence lock
Date: Fri, 30 May 2025 13:35:08 -0500
Message-ID: <20250530183510.733175-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was a possible race in vmw_update_seqno. Because of this race it
was possible for last_read_seqno to go backwards. Remove this function
and replace it with vmw_update_fences which now sets and returns the
last_read_seqno while holding the fence lock. This serialization via the
fence lock ensures that last_read_seqno is monotonic again.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---

v2:
 - Rebase
 - Made last_read_seqno atomic

 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c     |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  8 +++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   | 18 +++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h   |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c     | 17 ++++-------------
 7 files changed, 22 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index dd4ca6a9c690..8fe02131a6c4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -544,7 +544,7 @@ int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *seqno)
 	cmd_fence = (struct svga_fifo_cmd_fence *) fm;
 	cmd_fence->fence = *seqno;
 	vmw_cmd_commit_flush(dev_priv, bytes);
-	vmw_update_seqno(dev_priv);
+	vmw_fences_update(dev_priv->fman);
 
 out_err:
 	return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 37b832e552a4..bc0342c58b4b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -440,8 +440,10 @@ static int vmw_device_init(struct vmw_private *dev_priv)
 		vmw_write(dev_priv, SVGA_REG_CONFIG_DONE, 1);
 	}
 
-	dev_priv->last_read_seqno = vmw_fence_read(dev_priv);
-	atomic_set(&dev_priv->marker_seq, dev_priv->last_read_seqno);
+	u32 seqno = vmw_fence_read(dev_priv);
+
+	atomic_set(&dev_priv->last_read_seqno, seqno);
+	atomic_set(&dev_priv->marker_seq, seqno);
 	return 0;
 }
 
@@ -454,7 +456,7 @@ static void vmw_device_fini(struct vmw_private *vmw)
 	while (vmw_read(vmw, SVGA_REG_BUSY) != 0)
 		;
 
-	vmw->last_read_seqno = vmw_fence_read(vmw);
+	atomic_set(&vmw->last_read_seqno, vmw_fence_read(vmw));
 
 	vmw_write(vmw, SVGA_REG_CONFIG_DONE,
 		  vmw->config_done_state);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 594af8eb04c6..19565e4aa59c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -522,7 +522,7 @@ struct vmw_private {
 	int cmdbuf_waiters; /* Protected by waiter_lock */
 	int error_waiters; /* Protected by waiter_lock */
 	int fifo_queue_waiters; /* Protected by waiter_lock */
-	uint32_t last_read_seqno;
+	atomic_t last_read_seqno;
 	struct vmw_fence_manager *fman;
 	uint32_t irq_mask; /* Updates protected by waiter_lock */
 
@@ -1006,7 +1006,6 @@ extern int vmw_fallback_wait(struct vmw_private *dev_priv,
 			     uint32_t seqno,
 			     bool interruptible,
 			     unsigned long timeout);
-extern void vmw_update_seqno(struct vmw_private *dev_priv);
 extern void vmw_seqno_waiter_add(struct vmw_private *dev_priv);
 extern void vmw_seqno_waiter_remove(struct vmw_private *dev_priv);
 extern void vmw_goal_waiter_add(struct vmw_private *dev_priv);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index e831e324e737..90ce5372343b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3878,8 +3878,7 @@ vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
 
 		fence_rep.handle = fence_handle;
 		fence_rep.seqno = fence->base.seqno;
-		vmw_update_seqno(dev_priv);
-		fence_rep.passed_seqno = dev_priv->last_read_seqno;
+		fence_rep.passed_seqno = vmw_fences_update(dev_priv->fman);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 588d50ababf6..136f6b816795 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -172,7 +172,7 @@ vmwgfx_wait_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	wake_up_process(wait->task);
 }
 
-static void __vmw_fences_update(struct vmw_fence_manager *fman);
+static u32 __vmw_fences_update(struct vmw_fence_manager *fman);
 
 static long vmw_fence_wait(struct dma_fence *f, bool intr, signed long timeout)
 {
@@ -457,7 +457,7 @@ static bool vmw_fence_goal_check_locked(struct vmw_fence_obj *fence)
 	return true;
 }
 
-static void __vmw_fences_update(struct vmw_fence_manager *fman)
+static u32 __vmw_fences_update(struct vmw_fence_manager *fman)
 {
 	struct vmw_fence_obj *fence, *next_fence;
 	struct list_head action_list;
@@ -495,13 +495,17 @@ static void __vmw_fences_update(struct vmw_fence_manager *fman)
 
 	if (!list_empty(&fman->cleanup_list))
 		(void) schedule_work(&fman->work);
+	atomic_set_release(&fman->dev_priv->last_read_seqno, seqno);
+	return seqno;
 }
 
-void vmw_fences_update(struct vmw_fence_manager *fman)
+u32 vmw_fences_update(struct vmw_fence_manager *fman)
 {
+	u32 seqno;
 	spin_lock(&fman->lock);
-	__vmw_fences_update(fman);
+	seqno = __vmw_fences_update(fman);
 	spin_unlock(&fman->lock);
+	return seqno;
 }
 
 bool vmw_fence_obj_signaled(struct vmw_fence_obj *fence)
@@ -778,7 +782,6 @@ int vmw_fence_obj_signaled_ioctl(struct drm_device *dev, void *data,
 		(struct drm_vmw_fence_signaled_arg *) data;
 	struct ttm_base_object *base;
 	struct vmw_fence_obj *fence;
-	struct vmw_fence_manager *fman;
 	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
 	struct vmw_private *dev_priv = vmw_priv(dev);
 
@@ -787,14 +790,11 @@ int vmw_fence_obj_signaled_ioctl(struct drm_device *dev, void *data,
 		return PTR_ERR(base);
 
 	fence = &(container_of(base, struct vmw_user_fence, base)->fence);
-	fman = fman_from_fence(fence);
 
 	arg->signaled = vmw_fence_obj_signaled(fence);
 
 	arg->signaled_flags = arg->flags;
-	spin_lock(&fman->lock);
-	arg->passed_seqno = dev_priv->last_read_seqno;
-	spin_unlock(&fman->lock);
+	arg->passed_seqno = atomic_read_acquire(&dev_priv->last_read_seqno);
 
 	ttm_base_object_unref(&base);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
index a7eee579c76a..10264dab5f6a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
@@ -86,7 +86,7 @@ vmw_fence_obj_reference(struct vmw_fence_obj *fence)
 	return fence;
 }
 
-extern void vmw_fences_update(struct vmw_fence_manager *fman);
+u32 vmw_fences_update(struct vmw_fence_manager *fman);
 
 extern bool vmw_fence_obj_signaled(struct vmw_fence_obj *fence);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index 086e69a130d4..592cd78e10e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -123,26 +123,17 @@ static bool vmw_fifo_idle(struct vmw_private *dev_priv, uint32_t seqno)
 	return (vmw_read(dev_priv, SVGA_REG_BUSY) == 0);
 }
 
-void vmw_update_seqno(struct vmw_private *dev_priv)
-{
-	uint32_t seqno = vmw_fence_read(dev_priv);
-
-	if (dev_priv->last_read_seqno != seqno) {
-		dev_priv->last_read_seqno = seqno;
-		vmw_fences_update(dev_priv->fman);
-	}
-}
-
 bool vmw_seqno_passed(struct vmw_private *dev_priv,
 			 uint32_t seqno)
 {
 	bool ret;
+	u32 last_read_seqno = atomic_read_acquire(&dev_priv->last_read_seqno);
 
-	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
+	if (last_read_seqno - seqno < VMW_FENCE_WRAP)
 		return true;
 
-	vmw_update_seqno(dev_priv);
-	if (likely(dev_priv->last_read_seqno - seqno < VMW_FENCE_WRAP))
+	last_read_seqno = vmw_fences_update(dev_priv->fman);
+	if (last_read_seqno - seqno < VMW_FENCE_WRAP)
 		return true;
 
 	if (!vmw_has_fences(dev_priv) && vmw_fifo_idle(dev_priv, seqno))
-- 
2.49.0

