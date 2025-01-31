Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B2A243A3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 21:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1908010E438;
	Fri, 31 Jan 2025 20:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="KW3TM2kD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF1610E437
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 20:04:05 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5fc0c7b391fso610987eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 12:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1738353844; x=1738958644;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zz6de3VjFGImmeOpm7y2sZGCGqihYYYJORuAJZ5ALmE=;
 b=KW3TM2kD+88wSGuUc3KrzkSpTPggugiCQVuxDQpT7X9e3/WsORPYtC7+8o70oJ8WlT
 rvbi0O7Ir28bM2ClAFJyJiXxLx172JCQjmyNFDas8nh62txuLsk8hN25n9SLupDl0ce8
 TQg45WUNdTKfK7em/EuLqYmv1MLJ+6KBDLvxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738353844; x=1738958644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zz6de3VjFGImmeOpm7y2sZGCGqihYYYJORuAJZ5ALmE=;
 b=PagebeRxvpJVejzGImwa5Eidb4BrtwdFgJMScbckUEMnZ6KTs6kI9HfdFRv8KvkLOc
 sZi7m2GQqDbhTuKC9k1HfXDyoo0hYPR799P2jKwMHO1eZmmyV+r8i1yWsqnAam2kUu+w
 VSOW4HeubVspP8rAXpmB+rXA2fSCGCzi/yFKdF5rKZFCLoGh1QtES+nxU+o5sIp5MhjN
 3wG8YkGcwbsQYakqKce1EcWppAG0mU28C+O8BYjiDosIf90JtlL5p2SyM5llDfSoGF21
 b+g9n6sYcOsWqU13eDlukd8sL8H4O+0HKDvRq/X1pVNH0bBBtN8Igf1KeINGjQQqvA45
 bfcg==
X-Gm-Message-State: AOJu0YyUTeeB8Kv/UmWenVk9dG/71RHKsCQJ3MPLF9ssKTDEx++Wnayx
 2tU7yFTxED1RnbAooesQbL7kk/3hXJwD/1bKUG9IXslypnMVS1YtMgXY+tzWX1tcDliYS5Qr2SG
 2cIKAkPoGh/WBJiA8GolOaY5SzRPG1tKG55OBghLkOhqEsb6xQ6YMCUmBjU53NHvLIRo1CnAWbg
 hfYOHSHkSPCnHqtTLVMjsRZi44MT3OzIoB+tXQsCw/DwRbLPzAcw==
X-Gm-Gg: ASbGnct9TXYpE8YBfzNjzYt6jSkaxEJlGFirq+OMXpcFNenwuvYk2ZjFHlrbjW1zaeX
 7ngCone7w14HEz5piH/udPgWMBujHgjeQuT7O191zSTBtclIYBu5tgwI6G9xQM1ADOWGY3BCKBt
 rN9u+Il95CEtD3Mkxqsbxa69CYPv9LBa7lvaS3++ZeSCn0Gg5KHkhIrl6jh52NCbgHZNUNc4EZR
 WP7Rlf4rT27IhyirTKYOf5r0Ztg1861btRuK/RrpCBH4NaQS/9NmP8DpowhKbmkGNfvoCywF2aF
 AWFiNkAUzjPU+HlHZE4R3nToVWLrK3rH4ZO33vl6L1+CBv5yF3z95kW9dLoN6ZyNrC8=
X-Google-Smtp-Source: AGHT+IFY2MIhNcN218vASLidoZsYq79MzXldHOae1Ivgq0N5Kno8zfGR87YWAceOw2sW9RIlnzekEA==
X-Received: by 2002:a05:6871:8013:b0:29e:5de2:cffb with SMTP id
 586e51a60fabf-2b32f0cd0efmr7180403fac.17.1738353843910; 
 Fri, 31 Jan 2025 12:04:03 -0800 (PST)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b3565b64d1sm1389483fac.40.2025.01.31.12.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 12:04:03 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/vmwgfx: Switch to exclusively using GEM references
Date: Fri, 31 Jan 2025 14:03:21 -0600
Message-Id: <20250131200321.193939-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Currently we use a combination of TTM and GEM reference counting which is
cumbersome. TTM references are used for kernel internal BOs and operations
like validation. Simply switching the ttm_bo_(get|put) calls to their
GEM equivalents is insufficient as not all BOs are GEM BOs so we must set
the GEM vtable for all BOs even if they are not exposed to userspace.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c    |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  4 +---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        | 18 ++----------------
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c        |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c   |  8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    |  4 +---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c |  7 +++----
 10 files changed, 18 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 676fd84f35cc..609bf4067b07 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -36,8 +36,7 @@ static void vmw_bo_release(struct vmw_bo *vbo)
 {
 	struct vmw_resource *res;
 
-	WARN_ON(vbo->tbo.base.funcs &&
-		kref_read(&vbo->tbo.base.refcount) != 0);
+	WARN_ON(kref_read(&vbo->tbo.base.refcount) != 0);
 	vmw_bo_unmap(vbo);
 
 	xa_destroy(&vbo->detached_resources);
@@ -469,6 +468,7 @@ int vmw_bo_create(struct vmw_private *vmw,
 	if (unlikely(ret != 0))
 		goto out_error;
 
+	(*p_bo)->tbo.base.funcs = &vmw_gem_object_funcs;
 	return ret;
 out_error:
 	*p_bo = NULL;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index e97cae2365c8..791951fe019c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -204,12 +204,12 @@ static inline void vmw_bo_unreference(struct vmw_bo **buf)
 
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
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index a7c07692262b..98331c4c0335 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -432,7 +432,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 	 * for the new COTable. Initially pin the buffer object to make sure
 	 * we can use tryreserve without failure.
 	 */
-	ret = vmw_gem_object_create(dev_priv, &bo_params, &buf);
+	ret = vmw_bo_create(dev_priv, &bo_params, &buf);
 	if (ret) {
 		DRM_ERROR("Failed initializing new cotable MOB.\n");
 		goto out_done;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 5c1d82a73c32..81382cd58ba2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -843,9 +843,7 @@ static inline bool vmw_resource_mob_attached(const struct vmw_resource *res)
  * GEM related functionality - vmwgfx_gem.c
  */
 struct vmw_bo_params;
-int vmw_gem_object_create(struct vmw_private *vmw,
-			  struct vmw_bo_params *params,
-			  struct vmw_bo **p_vbo);
+extern const struct drm_gem_object_funcs vmw_gem_object_funcs;
 extern int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
 					     struct drm_file *filp,
 					     uint32_t size,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index ed5015ced392..026c9b699604 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -140,7 +140,7 @@ static const struct vm_operations_struct vmw_vm_ops = {
 	.close = ttm_bo_vm_close,
 };
 
-static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
+const struct drm_gem_object_funcs vmw_gem_object_funcs = {
 	.free = vmw_gem_object_free,
 	.open = vmw_gem_object_open,
 	.close = vmw_gem_object_close,
@@ -154,20 +154,6 @@ static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
 	.vm_ops = &vmw_vm_ops,
 };
 
-int vmw_gem_object_create(struct vmw_private *vmw,
-			  struct vmw_bo_params *params,
-			  struct vmw_bo **p_vbo)
-{
-	int ret = vmw_bo_create(vmw, params, p_vbo);
-
-	if (ret != 0)
-		goto out_no_bo;
-
-	(*p_vbo)->tbo.base.funcs = &vmw_gem_object_funcs;
-out_no_bo:
-	return ret;
-}
-
 int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
 				      struct drm_file *filp,
 				      uint32_t size,
@@ -183,7 +169,7 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
 		.pin = false
 	};
 
-	ret = vmw_gem_object_create(dev_priv, &params, p_vbo);
+	ret = vmw_bo_create(dev_priv, &params, p_vbo);
 	if (ret != 0)
 		goto out_no_bo;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index 7055cbefc768..d8204d4265d3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -282,8 +282,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
 	}
 
 	vmw_bo_unpin_unlocked(&batch->otable_bo->tbo);
-	ttm_bo_put(&batch->otable_bo->tbo);
-	batch->otable_bo = NULL;
+	vmw_bo_unreference(&batch->otable_bo);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index c4d5fe5f330f..388011696941 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -347,7 +347,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource *res,
 		return 0;
 	}
 
-	ret = vmw_gem_object_create(res->dev_priv, &bo_params, &gbo);
+	ret = vmw_bo_create(res->dev_priv, &bo_params, &gbo);
 	if (unlikely(ret != 0))
 		goto out_no_bo;
 
@@ -531,9 +531,9 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 	}
 
 	INIT_LIST_HEAD(&val_list);
-	ttm_bo_get(&res->guest_memory_bo->tbo);
 	val_buf->bo = &res->guest_memory_bo->tbo;
 	val_buf->num_shared = 0;
+	drm_gem_object_get(&val_buf->bo->base);
 	list_add_tail(&val_buf->head, &val_list);
 	ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
 	if (unlikely(ret != 0))
@@ -557,7 +557,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 out_no_validate:
 	ttm_eu_backoff_reservation(ticket, &val_list);
 out_no_reserve:
-	ttm_bo_put(val_buf->bo);
+	drm_gem_object_put(&val_buf->bo->base);
 	val_buf->bo = NULL;
 	if (guest_memory_dirty)
 		vmw_user_bo_unref(&res->guest_memory_bo);
@@ -619,7 +619,7 @@ vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
 	INIT_LIST_HEAD(&val_list);
 	list_add_tail(&val_buf->head, &val_list);
 	ttm_eu_backoff_reservation(ticket, &val_list);
-	ttm_bo_put(val_buf->bo);
+	drm_gem_object_put(&val_buf->bo->base);
 	val_buf->bo = NULL;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index cee2dc70cf8c..23dc404ad623 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -445,7 +445,7 @@ vmw_sou_primary_plane_prepare_fb(struct drm_plane *plane,
 	 * resume the overlays, this is preferred to failing to alloc.
 	 */
 	vmw_overlay_pause_all(dev_priv);
-	ret = vmw_gem_object_create(dev_priv, &bo_params, &vps->uo.buffer);
+	ret = vmw_bo_create(dev_priv, &bo_params, &vps->uo.buffer);
 	vmw_overlay_resume_all(dev_priv);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 896f171f8093..bc7e522d336e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -850,9 +850,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 			.pin = false
 		};
 
-		ret = vmw_gem_object_create(dev_priv,
-					    &params,
-					    &res->guest_memory_bo);
+		ret = vmw_bo_create(dev_priv, &params, &res->guest_memory_bo);
 		if (unlikely(ret != 0)) {
 			vmw_resource_unreference(&res);
 			goto out_unlock;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index e7625b3f71e0..7ee93e7191c7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -262,9 +262,8 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
 				bo_node->hash.key);
 		}
 		val_buf = &bo_node->base;
-		val_buf->bo = ttm_bo_get_unless_zero(&vbo->tbo);
-		if (!val_buf->bo)
-			return -ESRCH;
+		vmw_bo_reference(vbo);
+		val_buf->bo = &vbo->tbo;
 		val_buf->num_shared = 0;
 		list_add_tail(&val_buf->head, &ctx->bo_list);
 	}
@@ -656,7 +655,7 @@ void vmw_validation_unref_lists(struct vmw_validation_context *ctx)
 	struct vmw_validation_res_node *val;
 
 	list_for_each_entry(entry, &ctx->bo_list, base.head) {
-		ttm_bo_put(entry->base.bo);
+		drm_gem_object_put(&entry->base.bo->base);
 		entry->base.bo = NULL;
 	}
 
-- 
2.45.2

