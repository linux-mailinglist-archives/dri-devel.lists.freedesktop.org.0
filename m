Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732E093A070
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 14:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A508B10E5A3;
	Tue, 23 Jul 2024 12:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CW50qzpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D824310E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:17:57 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ef2cce8c08so25867851fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721737076; x=1722341876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/nLTjr7fb6DgnhhY7kToe/OCx9NZ3ieJ1ZNo1Hokts=;
 b=CW50qzpaPKzIOzA6iaNqTtUDgiI6cBwsX2ICacmk8OfdmkV3elVWlv5MPkqJFfE9n1
 fuQAz+0QW+/rty6oMc3v18NizDwpnr22Wcd+av1BRBe01WUgD7LufOihzhO6A8C0+YDj
 lyNOsARyqr7wKT+YbOtf6c+xxv5GzPSElo6hgcb5+Ht+jQDEii3Rv0/t83PBykllCdEw
 GLYsVUYuma2+fRP1BztHaOgdGVnSg6vAhK46aOjjqOHC0ajSxe7UlovNub7cFky6Z6br
 T/3q4MSSA1Flynm2pzBDKHQAskr7/9vM49JJADsm4AfX0uNCG776HHY4i4O+Lf7iREPw
 5mag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721737076; x=1722341876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/nLTjr7fb6DgnhhY7kToe/OCx9NZ3ieJ1ZNo1Hokts=;
 b=ux5r+xk/Y/iR0BZ0nvgN9dWkylwmecUVKHHz1FTJf3TDCRVcCEakg238ggs0xGHx5e
 ZGUW3PuxqrsVTM8MVHHLmeN6xt4XmddEDPTyPtloP98dr7bArKD8q1oYqHURwHeuqKMo
 NSAbFEVFhszCZjq4Ma8lLqsDDsdplBTbeaI0U7Wplbj+W8YwWsTP04P9Tf7DxZmY2buN
 CuBhdZK6unuNWAgLYbngCWtoFkYDfk85sa3iREhsYCl7ZnrKCwzzmQnRjaAIBfbNNaQD
 WzQKHXtQR+A4TLDDRJLvt74sya9z6lih1j4XiFYQtxvya3sxb+wCk23lL7aswg06LXdJ
 bUnw==
X-Gm-Message-State: AOJu0Yxj+1AcIkeBOG0UgA3asYAWE2do4DnXO5wJMw2iCpGdcO8eoFMV
 NjJt5WtZ1heQ0buz3JEEQYw30xM+g9BHKSHKZd10aUY9VC3VeSpVJj/udwd3
X-Google-Smtp-Source: AGHT+IFML0EofgGv7Zi1t4YegfpzPHZCkJ8GHouTLQ+ZBQmRhMFDyPlbCvVml4aiT2hiY+W2/uL5GA==
X-Received: by 2002:a05:651c:50d:b0:2ef:17ee:62b0 with SMTP id
 38308e7fff4ca-2ef17ee6747mr78529431fa.2.1721737075253; 
 Tue, 23 Jul 2024 05:17:55 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1540:9700:699c:86ac:5633:2a7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427db2a4e3bsm138119595e9.44.2024.07.23.05.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 05:17:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/vmwgfx: use GEM references instead of TTMs
Date: Tue, 23 Jul 2024 14:17:46 +0200
Message-Id: <20240723121750.2086-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723121750.2086-1-christian.koenig@amd.com>
References: <20240723121750.2086-1-christian.koenig@amd.com>
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

Instead of a TTM reference grab a GEM reference whenever necessary.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h       | 19 ++-----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c  |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c  |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c      |  6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c  |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 16 ++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c   |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c  |  2 +-
 9 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 00144632c600..3caaacb124ec 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -501,7 +501,7 @@ static int vmw_user_bo_synccpu_release(struct drm_file *filp,
 		if (!(flags & drm_vmw_synccpu_allow_cs)) {
 			atomic_dec(&vmw_bo->cpu_writers);
 		}
-		vmw_user_bo_unref(&vmw_bo);
+		vmw_bo_unreference(&vmw_bo);
 	}
 
 	return ret;
@@ -543,7 +543,7 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
 			return ret;
 
 		ret = vmw_user_bo_synccpu_grab(vbo, arg->flags);
-		vmw_user_bo_unref(&vbo);
+		vmw_bo_unreference(&vbo);
 		if (unlikely(ret != 0)) {
 			if (ret == -ERESTARTSYS || ret == -EBUSY)
 				return -EBUSY;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index f349642e6190..42a58d57409d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -188,30 +188,15 @@ static inline void vmw_bo_unreference(struct vmw_bo **buf)
 
 	*buf = NULL;
 	if (tmp_buf)
-		ttm_bo_put(&tmp_buf->tbo);
+		drm_gem_object_put(&tmp_buf->tbo.base);
 }
 
 static inline struct vmw_bo *vmw_bo_reference(struct vmw_bo *buf)
 {
-	ttm_bo_get(&buf->tbo);
+	drm_gem_object_get(&buf->tbo.base);
 	return buf;
 }
 
-static inline struct vmw_bo *vmw_user_bo_ref(struct vmw_bo *vbo)
-{
-	drm_gem_object_get(&vbo->tbo.base);
-	return vbo;
-}
-
-static inline void vmw_user_bo_unref(struct vmw_bo **buf)
-{
-	struct vmw_bo *tmp_buf = *buf;
-
-	*buf = NULL;
-	if (tmp_buf)
-		drm_gem_object_put(&tmp_buf->tbo.base);
-}
-
 static inline struct vmw_bo *to_vmw_bo(struct drm_gem_object *gobj)
 {
 	return container_of((gobj), struct vmw_bo, tbo.base);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index a7c07692262b..6b700ebd71b1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -502,7 +502,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 
 	vmw_resource_mob_attach(res);
 	/* Let go of the old mob. */
-	vmw_user_bo_unref(&old_buf);
+	vmw_bo_unreference(&old_buf);
 	res->id = vcotbl->type;
 
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
@@ -521,7 +521,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 out_wait:
 	ttm_bo_unpin(bo);
 	ttm_bo_unreserve(bo);
-	vmw_user_bo_unref(&buf);
+	vmw_bo_unreference(&buf);
 
 out_done:
 	MKS_STAT_TIME_POP(MKSSTAT_KERN_COTABLE_RESIZE);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 2e52d73eba48..be29b9ff8901 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1166,7 +1166,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_MOB, VMW_BO_DOMAIN_MOB);
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
 	tmp_bo = vmw_bo;
-	vmw_user_bo_unref(&tmp_bo);
+	vmw_bo_unreference(&tmp_bo);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -1223,7 +1223,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
 			     VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM);
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
 	tmp_bo = vmw_bo;
-	vmw_user_bo_unref(&tmp_bo);
+	vmw_bo_unreference(&tmp_bo);
 	if (unlikely(ret != 0))
 		return ret;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 13b2820cae51..f8158b8d2843 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1476,8 +1476,8 @@ static int vmw_create_bo_proxy(struct drm_device *dev,
 	/* Reserve and switch the backing mob. */
 	mutex_lock(&res->dev_priv->cmdbuf_mutex);
 	(void) vmw_resource_reserve(res, false, true);
-	vmw_user_bo_unref(&res->guest_memory_bo);
-	res->guest_memory_bo = vmw_user_bo_ref(bo_mob);
+	vmw_bo_unreference(&res->guest_memory_bo);
+	res->guest_memory_bo = vmw_bo_reference(bo_mob);
 	res->guest_memory_offset = 0;
 	vmw_resource_unreserve(res, false, false, false, NULL, 0);
 	mutex_unlock(&res->dev_priv->cmdbuf_mutex);
@@ -1670,7 +1670,7 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 err_out:
 	/* vmw_user_lookup_handle takes one ref so does new_fb */
 	if (bo)
-		vmw_user_bo_unref(&bo);
+		vmw_bo_unreference(&bo);
 	if (surface)
 		vmw_surface_unreference(&surface);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index c45b4724e414..c5860f62ec53 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -451,7 +451,7 @@ int vmw_overlay_ioctl(struct drm_device *dev, void *data,
 
 	ret = vmw_overlay_update_stream(dev_priv, buf, arg, true);
 
-	vmw_user_bo_unref(&buf);
+	vmw_bo_unreference(&buf);
 
 out_unlock:
 	mutex_unlock(&overlay->mutex);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 848dba09981b..cb786da99fd3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -141,7 +141,7 @@ static void vmw_resource_release(struct kref *kref)
 		if (res->coherent)
 			vmw_bo_dirty_release(res->guest_memory_bo);
 		ttm_bo_unreserve(bo);
-		vmw_user_bo_unref(&res->guest_memory_bo);
+		vmw_bo_unreference(&res->guest_memory_bo);
 	}
 
 	if (likely(res->hw_destroy != NULL)) {
@@ -457,11 +457,11 @@ void vmw_resource_unreserve(struct vmw_resource *res,
 			vmw_resource_mob_detach(res);
 			if (res->coherent)
 				vmw_bo_dirty_release(res->guest_memory_bo);
-			vmw_user_bo_unref(&res->guest_memory_bo);
+			vmw_bo_unreference(&res->guest_memory_bo);
 		}
 
 		if (new_guest_memory_bo) {
-			res->guest_memory_bo = vmw_user_bo_ref(new_guest_memory_bo);
+			res->guest_memory_bo = vmw_bo_reference(new_guest_memory_bo);
 
 			/*
 			 * The validation code should already have added a
@@ -522,7 +522,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 	}
 
 	INIT_LIST_HEAD(&val_list);
-	ttm_bo_get(&res->guest_memory_bo->tbo);
+	drm_gem_object_get(&res->guest_memory_bo->tbo.base);
 	val_buf->bo = &res->guest_memory_bo->tbo;
 	val_buf->num_shared = 0;
 	list_add_tail(&val_buf->head, &val_list);
@@ -548,10 +548,10 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 out_no_validate:
 	ttm_eu_backoff_reservation(ticket, &val_list);
 out_no_reserve:
-	ttm_bo_put(val_buf->bo);
+	drm_gem_object_put(&val_buf->bo->base);
 	val_buf->bo = NULL;
 	if (guest_memory_dirty)
-		vmw_user_bo_unref(&res->guest_memory_bo);
+		vmw_bo_unreference(&res->guest_memory_bo);
 
 	return ret;
 }
@@ -610,7 +610,7 @@ vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
 	INIT_LIST_HEAD(&val_list);
 	list_add_tail(&val_buf->head, &val_list);
 	ttm_eu_backoff_reservation(ticket, &val_list);
-	ttm_bo_put(val_buf->bo);
+	drm_gem_object_put(&val_buf->bo->base);
 	val_buf->bo = NULL;
 }
 
@@ -727,7 +727,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
 		goto out_no_validate;
 	else if (!res->func->needs_guest_memory && res->guest_memory_bo) {
 		WARN_ON_ONCE(vmw_resource_mob_attached(res));
-		vmw_user_bo_unref(&res->guest_memory_bo);
+		vmw_bo_unreference(&res->guest_memory_bo);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index a01ca3226d0a..6b8e984695ed 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -180,7 +180,7 @@ static int vmw_gb_shader_init(struct vmw_private *dev_priv,
 
 	res->guest_memory_size = size;
 	if (byte_code) {
-		res->guest_memory_bo = vmw_user_bo_ref(byte_code);
+		res->guest_memory_bo = vmw_bo_reference(byte_code);
 		res->guest_memory_offset = offset;
 	}
 	shader->size = size;
@@ -809,7 +809,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
 				    shader_type, num_input_sig,
 				    num_output_sig, tfile, shader_handle);
 out_bad_arg:
-	vmw_user_bo_unref(&buffer);
+	vmw_bo_unreference(&buffer);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index e7a744dfcecf..c275bb074a60 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1505,7 +1505,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 		if (ret == 0) {
 			if (res->guest_memory_bo->tbo.base.size < res->guest_memory_size) {
 				VMW_DEBUG_USER("Surface backup buffer too small.\n");
-				vmw_user_bo_unref(&res->guest_memory_bo);
+				vmw_bo_unreference(&res->guest_memory_bo);
 				ret = -EINVAL;
 				goto out_unlock;
 			} else {
-- 
2.34.1

