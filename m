Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C10AEA811
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 22:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A491F10E91B;
	Thu, 26 Jun 2025 20:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="cymBMb7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140DE10E91B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 20:12:58 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-747e41d5469so1597969b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 13:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1750968777; x=1751573577;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZBCPPhVxHEEpUbnaeSUPx9+rULxkduQ+I2YqTShTzA=;
 b=cymBMb7xf3xtnaVzjN1sNXjG2iP1zoiYiXu4tHAMlOHn8+wbNwPV5cd/ceXOKrgKYo
 nnb1yTp7Mu0osqW5evgGW/c7ILhqNCEE8jAfiY8BM4GwbMzOiY2fb4QBh3Al5TH5vzeP
 mQS6RXuLGhXCOyISpwgjcuDCK2kD8nj1uODSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750968777; x=1751573577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xZBCPPhVxHEEpUbnaeSUPx9+rULxkduQ+I2YqTShTzA=;
 b=hKrlzigOn1etePeANGVadEVXSLQ6m6jKQdg804e+mE0L6XASbIJPEAoqE4QQHYr88E
 MvEe4+xXT0U6dUK0bC3dfUzgqfldoa9VImNCutAce7wy6pjQlnmm1Els/nrOjFRyNx5Q
 opwpgy0ypuAomMMeezLTA+ZZnDc8y7JGyMeoaguA9e9OZApKuUeB/9Tt1Eqcezh+4Vuv
 CCHMN2CZ0uzmmoVTiAvoiVoFjPjooaDxMtQZRipOtB3gHvVj3fKf64nAoJ+1P10j52Tr
 /XRHCK1aCPj0OBsdcKZACkQa4/Mpom1/Q9L4MXWbR6bKJ6iO3NJuqZ3vuFzP8d+btomz
 CQaw==
X-Gm-Message-State: AOJu0Yyo4/LBJF316zqTJVOVayUzm1p/BrbRU2DEoW+E4hoRapiw9nIs
 AkaIGSm4jtLzD9dkzfEmsHF8g894hRgoCu4Vrq9ZqZd/NwJKhDu7piVurHd6iKTCD+XHaQq+s73
 Np9rtW2xCyNUYRl0WGu170QnYeBpFOW4rBXZG6sq0zo2Vs3e1C5/s0qF0jpW96XNbiT2Ryt5UwG
 iMUY2VJguCSXtIBLyGUlzXu3oPWq3VxRoFNVi6i3H7+rP8ruu1WNY1xQ==
X-Gm-Gg: ASbGncuvaZ9K2OWzjX+RJj2XXBP1TPdiAY24iQ244reC6PQ+y1D1V5zAROV/h7X0Ey9
 T1fAyPi+Hs41uoXaFtF4IrlMnzeMvDndRBqZ7SQ8QTrgQcQE7hWtuEiN451FIK0tjY/Er+SOu3w
 aitSo3zP/cg5Qp2Igc9ZTZdaKpembi5NEkxIxiGlvn/WHHxZc942hFxBQH6kiZ7/n/pyIGDYqcV
 B1OtH0XUNWZvaqvglXxrFl9Ba9nR7Yv45nDV9wmslNzY/yKKndslr9xgO9RNbu5wwEOeoOwh9Rj
 i57Si6Xm9OWCqTnwJyoy8XlVVu+MNgwlHMyCf0/Lid4QOqw/ekg8Wieod/gC4mMSEr6vXMFm/bj
 wEpKRXLiExpqnuXnZAOo1lMm2nd3d5+o=
X-Google-Smtp-Source: AGHT+IHlbyolJB3k7nm97OYXiUVdnHehjmsR0qgkvKPCbPW5oLAXPVcyQV8uTmGdoaDJoxa8grvjsg==
X-Received: by 2002:a05:6a00:997:b0:730:95a6:3761 with SMTP id
 d2e1a72fcca58-74af6e3f46amr722748b3a.3.1750968777092; 
 Thu, 26 Jun 2025 13:12:57 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5574390sm517434b3a.90.2025.06.26.13.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 13:12:56 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 2/2] drm/vmwgfx: Implement DRIVER_SYNCOBJ
Date: Thu, 26 Jun 2025 15:11:53 -0500
Message-ID: <20250626201153.1714590-2-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626201153.1714590-1-ian.forbes@broadcom.com>
References: <20250626201153.1714590-1-ian.forbes@broadcom.com>
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

Replace vmwgfx's ad hoc userspace fence tracking with drm_syncobj.
They are nearly identical and it is possible to maintain compatibility
with the old IOCTLs.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   | 230 ++++++------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h   |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     |   2 +-
 6 files changed, 67 insertions(+), 183 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index bc0342c58b4b..33e5e90ce63d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1582,7 +1582,8 @@ static const struct file_operations vmwgfx_driver_fops = {
 
 static const struct drm_driver driver = {
 	.driver_features =
-	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_CURSOR_HOTSPOT,
+	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC |
+	DRIVER_GEM | DRIVER_CURSOR_HOTSPOT | DRIVER_SYNCOBJ,
 	.ioctls = vmw_ioctls,
 	.num_ioctls = ARRAY_SIZE(vmw_ioctls),
 	.master_set = vmw_master_set,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index eda5b6f8f4c4..6df5f66aecf7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -983,7 +983,7 @@ extern int vmw_execbuf_fence_commands(struct drm_file *file_priv,
 				      struct vmw_fence_obj **p_fence,
 				      uint32_t *p_handle);
 extern int vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
-					struct vmw_fpriv *vmw_fp,
+					struct drm_file *,
 					int ret,
 					struct drm_vmw_fence_rep __user
 					*user_fence_rep,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 819704ac675d..f83c35861bf7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -14,6 +14,7 @@
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/drm_syncobj.h>
 
 #include <linux/sync_file.h>
 #include <linux/hashtable.h>
@@ -3859,7 +3860,7 @@ int vmw_execbuf_fence_commands(struct drm_file *file_priv,
  */
 int
 vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
-			    struct vmw_fpriv *vmw_fp, int ret,
+			    struct drm_file *file_priv, int ret,
 			    struct drm_vmw_fence_rep __user *user_fence_rep,
 			    struct vmw_fence_obj *fence, uint32_t fence_handle,
 			    int32_t out_fence_fd)
@@ -3894,7 +3895,7 @@ vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
 	 * handle.
 	 */
 	if (unlikely(ret != 0) && (fence_rep.error == 0)) {
-		ttm_ref_object_base_unref(vmw_fp->tfile, fence_handle);
+		drm_syncobj_destroy(file_priv, fence_handle);
 		VMW_DEBUG_USER("Fence copy error. Syncing.\n");
 		(void) vmw_fence_obj_wait(fence, false, false,
 					  VMW_FENCE_WAIT_TIMEOUT);
@@ -4236,8 +4237,9 @@ int vmw_execbuf_process(struct drm_file *file_priv,
 		}
 	}
 
-	ret = vmw_execbuf_copy_fence_user(dev_priv, vmw_fpriv(file_priv), ret,
-				    user_fence_rep, fence, handle, out_fence_fd);
+	ret = vmw_execbuf_copy_fence_user(dev_priv, file_priv, ret,
+					  user_fence_rep, fence, handle,
+					  out_fence_fd);
 
 	if (sync_file) {
 		if (ret) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index c2294abbe753..de81d95268c3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -7,6 +7,7 @@
  **************************************************************************/
 
 #include "vmwgfx_drv.h"
+#include <drm/drm_syncobj.h>
 
 #define VMW_FENCE_WRAP (1 << 31)
 
@@ -18,11 +19,6 @@ struct vmw_fence_manager {
 	u64 ctx;
 };
 
-struct vmw_user_fence {
-	struct ttm_base_object base;
-	struct vmw_fence_obj fence;
-};
-
 /**
  * struct vmw_event_fence_action - fence callback that delivers a DRM event.
  *
@@ -74,7 +70,7 @@ static void vmw_fence_obj_destroy(struct dma_fence *f)
 			vmw_seqno_waiter_remove(fman->dev_priv);
 		spin_unlock(&fman->lock);
 	}
-	fence->destroy(fence);
+	dma_fence_free(f);
 }
 
 static const char *vmw_fence_get_driver_name(struct dma_fence *f)
@@ -156,14 +152,12 @@ void vmw_fence_manager_takedown(struct vmw_fence_manager *fman)
 }
 
 static int vmw_fence_obj_init(struct vmw_fence_manager *fman,
-			      struct vmw_fence_obj *fence, u32 seqno,
-			      void (*destroy) (struct vmw_fence_obj *fence))
+			      struct vmw_fence_obj *fence, u32 seqno)
 {
 	int ret = 0;
 
 	dma_fence_init(&fence->base, &vmw_fence_ops, &fman->lock,
 		       fman->ctx, seqno);
-	fence->destroy = destroy;
 
 	spin_lock(&fman->lock);
 	if (unlikely(fman->fifo_down)) {
@@ -239,11 +233,6 @@ int vmw_fence_obj_wait(struct vmw_fence_obj *fence, bool lazy,
 		return ret;
 }
 
-static void vmw_fence_destroy(struct vmw_fence_obj *fence)
-{
-	dma_fence_free(&fence->base);
-}
-
 int vmw_fence_create(struct vmw_fence_manager *fman,
 		     uint32_t seqno,
 		     struct vmw_fence_obj **p_fence)
@@ -255,7 +244,7 @@ int vmw_fence_create(struct vmw_fence_manager *fman,
 	if (unlikely(!fence))
 		return -ENOMEM;
 
-	ret = vmw_fence_obj_init(fman, fence, seqno, vmw_fence_destroy);
+	ret = vmw_fence_obj_init(fman, fence, seqno);
 	if (unlikely(ret != 0))
 		goto out_err_init;
 
@@ -267,77 +256,31 @@ int vmw_fence_create(struct vmw_fence_manager *fman,
 	return ret;
 }
 
-
-static void vmw_user_fence_destroy(struct vmw_fence_obj *fence)
-{
-	struct vmw_user_fence *ufence =
-		container_of(fence, struct vmw_user_fence, fence);
-
-	ttm_base_object_kfree(ufence, base);
-}
-
-static void vmw_user_fence_base_release(struct ttm_base_object **p_base)
-{
-	struct ttm_base_object *base = *p_base;
-	struct vmw_user_fence *ufence =
-		container_of(base, struct vmw_user_fence, base);
-	struct vmw_fence_obj *fence = &ufence->fence;
-
-	*p_base = NULL;
-	vmw_fence_obj_unreference(&fence);
-}
-
 int vmw_user_fence_create(struct drm_file *file_priv,
 			  struct vmw_fence_manager *fman,
 			  uint32_t seqno,
 			  struct vmw_fence_obj **p_fence,
 			  uint32_t *p_handle)
 {
-	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
-	struct vmw_user_fence *ufence;
+	struct drm_syncobj *ufence;
 	struct vmw_fence_obj *tmp;
 	int ret;
 
-	ufence = kzalloc(sizeof(*ufence), GFP_KERNEL);
-	if (unlikely(!ufence)) {
-		ret = -ENOMEM;
-		goto out_no_object;
-	}
-
-	ret = vmw_fence_obj_init(fman, &ufence->fence, seqno,
-				 vmw_user_fence_destroy);
-	if (unlikely(ret != 0)) {
-		kfree(ufence);
-		goto out_no_object;
-	}
-
-	/*
-	 * The base object holds a reference which is freed in
-	 * vmw_user_fence_base_release.
-	 */
-	tmp = vmw_fence_obj_reference(&ufence->fence);
-
-	ret = ttm_base_object_init(tfile, &ufence->base, false,
-				   VMW_RES_FENCE,
-				   &vmw_user_fence_base_release);
-
+	ret = vmw_fence_create(fman, seqno, &tmp);
+	if (ret != 0)
+		return ret;
 
-	if (unlikely(ret != 0)) {
-		/*
-		 * Free the base object's reference
-		 */
+	ret = drm_syncobj_create(&ufence, 0, &tmp->base);
+	if (ret != 0) {
 		vmw_fence_obj_unreference(&tmp);
-		goto out_err;
+		return ret;
 	}
 
-	*p_fence = &ufence->fence;
-	*p_handle = ufence->base.handle;
-
-	return 0;
-out_err:
-	tmp = &ufence->fence;
-	vmw_fence_obj_unreference(&tmp);
-out_no_object:
+	ret = drm_syncobj_get_handle(file_priv, ufence, p_handle);
+	drm_syncobj_put(ufence);
+	if (ret != 0)
+		vmw_fence_obj_unreference(&tmp);
+	*p_fence = tmp;
 	return ret;
 }
 
@@ -385,51 +328,13 @@ void vmw_fence_fifo_up(struct vmw_fence_manager *fman)
 	spin_unlock(&fman->lock);
 }
 
-
-/**
- * vmw_fence_obj_lookup - Look up a user-space fence object
- *
- * @tfile: A struct ttm_object_file identifying the caller.
- * @handle: A handle identifying the fence object.
- * @return: A struct vmw_user_fence base ttm object on success or
- * an error pointer on failure.
- *
- * The fence object is looked up and type-checked. The caller needs
- * to have opened the fence object first, but since that happens on
- * creation and fence objects aren't shareable, that's not an
- * issue currently.
- */
-static struct ttm_base_object *
-vmw_fence_obj_lookup(struct ttm_object_file *tfile, u32 handle)
-{
-	struct ttm_base_object *base = ttm_base_object_lookup(tfile, handle);
-
-	if (!base) {
-		pr_err("Invalid fence object handle 0x%08lx.\n",
-		       (unsigned long)handle);
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (base->refcount_release != vmw_user_fence_base_release) {
-		pr_err("Invalid fence object handle 0x%08lx.\n",
-		       (unsigned long)handle);
-		ttm_base_object_unref(&base);
-		return ERR_PTR(-EINVAL);
-	}
-
-	return base;
-}
-
-
 int vmw_fence_obj_wait_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file_priv)
 {
 	struct drm_vmw_fence_wait_arg *arg =
 	    (struct drm_vmw_fence_wait_arg *)data;
 	unsigned long timeout;
-	struct ttm_base_object *base;
 	struct vmw_fence_obj *fence;
-	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
 	int ret;
 	uint64_t wait_timeout = ((uint64_t)arg->timeout_us * HZ);
 
@@ -446,11 +351,10 @@ int vmw_fence_obj_wait_ioctl(struct drm_device *dev, void *data,
 		arg->kernel_cookie = jiffies + wait_timeout;
 	}
 
-	base = vmw_fence_obj_lookup(tfile, arg->handle);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	fence = &(container_of(base, struct vmw_user_fence, base)->fence);
+	ret = drm_syncobj_find_fence(file_priv, arg->handle, 0, 0,
+				     (struct dma_fence **)&fence);
+	if (ret != 0)
+		return ret;
 
 	timeout = jiffies;
 	if (time_after_eq(timeout, (unsigned long)arg->kernel_cookie)) {
@@ -464,14 +368,14 @@ int vmw_fence_obj_wait_ioctl(struct drm_device *dev, void *data,
 	ret = vmw_fence_obj_wait(fence, arg->lazy, true, timeout);
 
 out:
-	ttm_base_object_unref(&base);
+	vmw_fence_obj_unreference(&fence); // from find_fence
 
 	/*
 	 * Optionally unref the fence object.
 	 */
 
 	if (ret == 0 && (arg->wait_options & DRM_VMW_WAIT_OPTION_UNREF))
-		return ttm_ref_object_base_unref(tfile, arg->handle);
+		ret = drm_syncobj_destroy(file_priv, arg->handle);
 	return ret;
 }
 
@@ -480,36 +384,33 @@ int vmw_fence_obj_signaled_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_vmw_fence_signaled_arg *arg =
 		(struct drm_vmw_fence_signaled_arg *) data;
-	struct ttm_base_object *base;
 	struct vmw_fence_obj *fence;
-	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
 	struct vmw_private *dev_priv = vmw_priv(dev);
 
-	base = vmw_fence_obj_lookup(tfile, arg->handle);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	int ret = drm_syncobj_find_fence(file_priv, arg->handle, 0, 0,
+					 (struct dma_fence **)&fence);
+	if (ret != 0)
+		return ret;
 
-	fence = &(container_of(base, struct vmw_user_fence, base)->fence);
 
 	arg->signaled = vmw_fence_obj_signaled(fence);
 
 	arg->signaled_flags = arg->flags;
 	arg->passed_seqno = atomic_read_acquire(&dev_priv->last_read_seqno);
 
-	ttm_base_object_unref(&base);
+	vmw_fence_obj_unreference(&fence); // from find_fence
 
 	return 0;
 }
 
 
 int vmw_fence_obj_unref_ioctl(struct drm_device *dev, void *data,
-			      struct drm_file *file_priv)
+				struct drm_file *file_priv)
 {
 	struct drm_vmw_fence_arg *arg =
 		(struct drm_vmw_fence_arg *) data;
 
-	return ttm_ref_object_base_unref(vmw_fpriv(file_priv)->tfile,
-					 arg->handle);
+	return drm_syncobj_destroy(file_priv, arg->handle);
 }
 
 /**
@@ -660,50 +561,34 @@ int vmw_fence_event_ioctl(struct drm_device *dev, void *data,
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	struct drm_vmw_fence_event_arg *arg =
 		(struct drm_vmw_fence_event_arg *) data;
+	struct drm_syncobj  *ufence = NULL;
 	struct vmw_fence_obj *fence = NULL;
-	struct vmw_fpriv *vmw_fp = vmw_fpriv(file_priv);
-	struct ttm_object_file *tfile = vmw_fp->tfile;
 	struct drm_vmw_fence_rep __user *user_fence_rep =
-		(struct drm_vmw_fence_rep __user *)(unsigned long)
-		arg->fence_rep;
-	uint32_t handle;
+		(struct drm_vmw_fence_rep __user *)(unsigned long)arg->fence_rep;
+	u32 handle = 0;
 	int ret;
 
 	/*
-	 * Look up an existing fence object,
-	 * and if user-space wants a new reference,
-	 * add one.
+	 * Look up an existing fence object and if user-space
+	 * wants a new reference add one.
 	 */
 	if (arg->handle) {
-		struct ttm_base_object *base =
-			vmw_fence_obj_lookup(tfile, arg->handle);
+		ufence = drm_syncobj_find(file_priv, arg->handle);
+		if (!ufence)
+			return -ENOENT;
 
-		if (IS_ERR(base))
-			return PTR_ERR(base);
-
-		fence = &(container_of(base, struct vmw_user_fence,
-				       base)->fence);
-		(void) vmw_fence_obj_reference(fence);
+		fence = container_of(drm_syncobj_fence_get(ufence),
+				     typeof(*fence), base);
 
 		if (user_fence_rep != NULL) {
-			ret = ttm_ref_object_add(vmw_fp->tfile, base,
-						 NULL, false);
-			if (unlikely(ret != 0)) {
-				DRM_ERROR("Failed to reference a fence "
-					  "object.\n");
-				goto out_no_ref_obj;
+			ret = drm_syncobj_get_handle(file_priv, ufence, &handle);
+			if (ret != 0) {
+				DRM_ERROR("Failed to get a fence handle.\n");
+				goto out_err;
 			}
-			handle = base->handle;
 		}
-		ttm_base_object_unref(&base);
-	}
-
-	/*
-	 * Create a new fence object.
-	 */
-	if (!fence) {
-		ret = vmw_execbuf_fence_commands(file_priv, dev_priv,
-						 &fence,
+	} else {
+		ret = vmw_execbuf_fence_commands(file_priv, dev_priv, &fence,
 						 (user_fence_rep) ?
 						 &handle : NULL);
 		if (unlikely(ret != 0)) {
@@ -714,24 +599,21 @@ int vmw_fence_event_ioctl(struct drm_device *dev, void *data,
 
 	BUG_ON(fence == NULL);
 
-	ret = vmw_event_fence_action_create(file_priv, fence,
-					    arg->flags,
-					    arg->user_data,
-					    true);
-	if (unlikely(ret != 0)) {
+	ret = vmw_event_fence_action_create(file_priv, fence, arg->flags,
+					    arg->user_data, true);
+	if (ret != 0) {
 		if (ret != -ERESTARTSYS)
 			DRM_ERROR("Failed to attach event to fence.\n");
-		goto out_no_create;
+		if (handle)
+			drm_syncobj_destroy(file_priv, handle);
+		goto out_err;
 	}
 
-	vmw_execbuf_copy_fence_user(dev_priv, vmw_fp, 0, user_fence_rep, fence,
-				    handle, -1);
-	vmw_fence_obj_unreference(&fence);
-	return 0;
-out_no_create:
-	if (user_fence_rep != NULL)
-		ttm_ref_object_base_unref(tfile, handle);
-out_no_ref_obj:
+	ret = vmw_execbuf_copy_fence_user(dev_priv, file_priv, 0, user_fence_rep,
+					  fence, handle, -1);
+out_err:
 	vmw_fence_obj_unreference(&fence);
+	if (ufence)
+		drm_syncobj_put(ufence);
 	return ret;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
index e897cccae1ae..971fea9c9cad 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
@@ -41,9 +41,8 @@ struct vmw_fence_manager;
 
 struct vmw_fence_obj {
 	struct dma_fence base;
-	bool   waiter_added;
 	struct list_head head;
-	void (*destroy)(struct vmw_fence_obj *fence);
+	bool   waiter_added;
 };
 
 extern struct vmw_fence_manager *
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 05b1c54a070c..468ae4fa7103 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1626,7 +1626,7 @@ void vmw_kms_helper_validation_finish(struct vmw_private *dev_priv,
 						 file_priv ? &handle : NULL);
 	vmw_validation_done(ctx, fence);
 	if (file_priv)
-		vmw_execbuf_copy_fence_user(dev_priv, vmw_fpriv(file_priv),
+		vmw_execbuf_copy_fence_user(dev_priv, file_priv,
 					    ret, user_fence_rep, fence,
 					    handle, -1);
 	if (out_fence)
-- 
2.50.0

