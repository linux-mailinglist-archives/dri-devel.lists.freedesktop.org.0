Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3208485547C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA9110E2E9;
	Wed, 14 Feb 2024 21:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="QkWozzsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2128810E2E9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 21:04:44 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6e0cc8d740cso187854b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 13:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1707944684; x=1708549484;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vfwet6EB+vL26EbiJj4m9rQ9S9dFN4776NRBHEGHCwY=;
 b=QkWozzsWt/fTOTYeyx6ykpVwNe/O7Q68ps5ibDC8H7emWN+D8RKvak98BcWF7qD5Pc
 a3ctGpp5KcaIiY/H1EAixGEt5EheylSgn9IXbVk8YhnW1w4gx5Ro+ER+17gELFSkqIqh
 iD/LkdgVDwbVDi7v12aWxd/tK56dLbeqAFw7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707944684; x=1708549484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vfwet6EB+vL26EbiJj4m9rQ9S9dFN4776NRBHEGHCwY=;
 b=TzfHmXJCU/y3xSqv6eGRbQcyS3Uca+Zl+rpt4OwRDTECui9Qn7bfBrI/nLkt4RQHRX
 OudscyvwElrYWcGUAzJmEFFy/26e9QMwPZLqPghsWcCUe/58+54rL/lz1dBl92PoeNg3
 sjmrvIvrTYn7u8XOnJdy44we84gN3kM+JIOLa79AMU92LNnT0yZwgMTGI98S5EH01oVf
 Nv8URgRBkBHsTjpeVJOp3vMIxbOSwbLBDCbdoaLR5pa2/YxutSRVRydwrVbxSOLRK7jV
 7kieCMA8OiD7FK54JprM5rzZx+mSxlT4BrNa98cnCQNRuJY5yCADDbjyZgoKKbu6XxBq
 N04g==
X-Gm-Message-State: AOJu0Yx7Y3JsfKzEF0uobMULg8REpCL/AVr6HWftWfSbYAbh3QDUq7fj
 0dZNZK+UzOyssPJCiWbS+sb9IyonIB19zZkSQM8Z1FKixk1o/O+EwA6cbpNUKm94zzfit1HjsT+
 S2KBx2eufIqjq+PTsFWU4rxUreysAW8cgHliq8kpe7kdr6riIxDY3ggS329YmFNbUy+sz/01sns
 zfjg62QbU+6u51NW5c1aicASfVgQjQZVob/LHGyGAIh3MQ7lNrvg==
X-Google-Smtp-Source: AGHT+IGNWD6yG1/lvrwjD00LNnq0uyKGB1rKwoGbYqmxqSJgWMSW0SQ/0duja/3HAJdOzd9+kgYaOQ==
X-Received: by 2002:a05:6a00:1798:b0:6e0:e3f7:7019 with SMTP id
 s24-20020a056a00179800b006e0e3f77019mr4143220pfg.27.1707944683980; 
 Wed, 14 Feb 2024 13:04:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX0Ox7UbdtsnEM1w21Oc9x5KdSrRJqf84oOh2nwiw1Kkj9qELgb1eYblYezd96qnSi8xDz6VFZTgMe1PmXaTnsqNqpLMXI7kfw5egDLGMkZ0RWLdmMKPP/MFRIOdS95thprXcfBGPY0oV0F2v9iqPfAngWddbt4uqnsjo8Ighhq3VXLds/hvg+BhS0s4ImE3ZvgGi8s6KR2uwfHe6A=
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 i66-20020a62c145000000b006e04f2a438bsm10225922pfg.105.2024.02.14.13.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 13:04:43 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, maaz.mombasawala@broadcom.com,
 martin.krastev@broadcom.com, zack.rusin@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Remove unused code
Date: Wed, 14 Feb 2024 15:04:40 -0600
Message-Id: <20240214210440.26167-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Remove unused structs, members, and file. Many of these are written but
never read.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/ttm_object.c        |   4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  27 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        |  12 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h        |  16 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |   3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   | 110 ---------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c |  19 +---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.h |   7 --
 8 files changed, 1 insertion(+), 197 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 6806c05e57f6..3353e97687d1 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -87,14 +87,11 @@ struct ttm_object_file {
  *
  * @object_lock: lock that protects idr.
  *
- * @object_count: Per device object count.
- *
  * This is the per-device data structure needed for ttm object management.
  */
 
 struct ttm_object_device {
 	spinlock_t object_lock;
-	atomic_t object_count;
 	struct dma_buf_ops ops;
 	void (*dmabuf_release)(struct dma_buf *dma_buf);
 	struct idr idr;
@@ -431,7 +428,6 @@ ttm_object_device_init(const struct dma_buf_ops *ops)
 		return NULL;
 
 	spin_lock_init(&tdev->object_lock);
-	atomic_set(&tdev->object_count, 0);
 
 	/*
 	 * Our base is at VMWGFX_NUM_MOB + 1 because we want to create
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 12efecc17df6..01f41fbb9c3b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -117,25 +117,8 @@ struct vmwgfx_hash_item {
 	unsigned long key;
 };
 
-
-/**
- * struct vmw_validate_buffer - Carries validation info about buffers.
- *
- * @base: Validation info for TTM.
- * @hash: Hash entry for quick lookup of the TTM buffer object.
- *
- * This structure contains also driver private validation info
- * on top of the info needed by TTM.
- */
-struct vmw_validate_buffer {
-	struct ttm_validate_buffer base;
-	struct vmwgfx_hash_item hash;
-	bool validate_as_mob;
-};
-
 struct vmw_res_func;
 
-
 /**
  * struct vmw-resource - base class for hardware resources
  *
@@ -445,15 +428,6 @@ struct vmw_sw_context{
 struct vmw_legacy_display;
 struct vmw_overlay;
 
-struct vmw_vga_topology_state {
-	uint32_t width;
-	uint32_t height;
-	uint32_t primary;
-	uint32_t pos_x;
-	uint32_t pos_y;
-};
-
-
 /*
  * struct vmw_otable - Guest Memory OBject table metadata
  *
@@ -501,7 +475,6 @@ struct vmw_private {
 	struct drm_device drm;
 	struct ttm_device bdev;
 
-	struct drm_vma_offset_manager vma_manager;
 	u32 pci_id;
 	resource_size_t io_start;
 	resource_size_t vram_start;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index cd4925346ed4..09214f9339b2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -775,7 +775,6 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	hotspot_y = du->hotspot_y + new_state->hotspot_y;
 
 	du->cursor_surface = vps->surf;
-	du->cursor_bo = vps->bo;
 
 	if (!vps->surf && !vps->bo) {
 		vmw_cursor_update_position(dev_priv, false, 0, 0);
@@ -858,15 +857,6 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
 						  false, true);
-
-	if (!ret && new_fb) {
-		struct drm_crtc *crtc = new_state->crtc;
-		struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
-
-		vmw_connector_state_to_vcs(du->connector.state);
-	}
-
-
 	return ret;
 }
 
@@ -1361,7 +1351,6 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 
 	drm_helper_mode_fill_fb_struct(dev, &vfbs->base.base, mode_cmd);
 	vfbs->surface = vmw_surface_reference(surface);
-	vfbs->base.user_handle = mode_cmd->handles[0];
 	vfbs->is_bo_proxy = is_bo_proxy;
 
 	*out = &vfbs->base;
@@ -1529,7 +1518,6 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 	drm_helper_mode_fill_fb_struct(dev, &vfbd->base.base, mode_cmd);
 	vfbd->base.bo = true;
 	vfbd->buffer = vmw_bo_reference(bo);
-	vfbd->base.user_handle = mode_cmd->handles[0];
 	*out = &vfbd->base;
 
 	ret = drm_framebuffer_init(dev, &vfbd->base.base,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index a94947b588e8..4a2e3cac1c22 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -217,21 +217,11 @@ struct vmw_kms_dirty {
 struct vmw_framebuffer {
 	struct drm_framebuffer base;
 	bool bo;
-	uint32_t user_handle;
-};
-
-/*
- * Clip rectangle
- */
-struct vmw_clip_rect {
-	int x1, x2, y1, y2;
 };
 
 struct vmw_framebuffer_surface {
 	struct vmw_framebuffer base;
 	struct vmw_surface *surface;
-	struct vmw_bo *buffer;
-	struct list_head head;
 	bool is_bo_proxy;  /* true if this is proxy surface for DMA buf */
 };
 
@@ -359,7 +349,6 @@ struct vmw_display_unit {
 	struct vmw_cursor_plane cursor;
 
 	struct vmw_surface *cursor_surface;
-	struct vmw_bo *cursor_bo;
 	size_t cursor_age;
 
 	int cursor_x;
@@ -389,11 +378,6 @@ struct vmw_display_unit {
 	int set_gui_y;
 };
 
-struct vmw_validation_ctx {
-	struct vmw_resource *res;
-	struct vmw_bo *buf;
-};
-
 #define vmw_crtc_to_du(x) \
 	container_of(x, struct vmw_display_unit, crtc)
 #define vmw_connector_to_du(x) \
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 30c3ad27b662..c6e646895f9e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -89,7 +89,6 @@ struct vmw_kms_sou_define_gmrfb {
 struct vmw_screen_object_unit {
 	struct vmw_display_unit base;
 
-	unsigned long buffer_size; /**< Size of allocated buffer */
 	struct vmw_bo *buffer; /**< Backing store buffer */
 
 	bool defined;
@@ -240,7 +239,6 @@ static void vmw_sou_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		int x, y;
 
 		sou->buffer = vps->bo;
-		sou->buffer_size = vps->bo_size;
 
 		conn_state = sou->base.connector.state;
 		vmw_conn_state = vmw_connector_state_to_vcs(conn_state);
@@ -255,7 +253,6 @@ static void vmw_sou_crtc_mode_set_nofb(struct drm_crtc *crtc)
 
 	} else {
 		sou->buffer = NULL;
-		sou->buffer_size = 0;
 	}
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
deleted file mode 100644
index 90097d04b45f..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ /dev/null
@@ -1,110 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR MIT
-/**************************************************************************
- *
- * Copyright 2009-2011 VMware, Inc., Palo Alto, CA., USA
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
-#include "vmwgfx_drv.h"
-
-static int vmw_bo_vm_lookup(struct ttm_device *bdev,
-				   struct drm_file *filp,
-				   unsigned long offset,
-				   unsigned long pages,
-				   struct ttm_buffer_object **p_bo)
-{
-	struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
-	struct drm_device *drm = &dev_priv->drm;
-	struct drm_vma_offset_node *node;
-	int ret;
-
-	*p_bo = NULL;
-
-	drm_vma_offset_lock_lookup(bdev->vma_manager);
-
-	node = drm_vma_offset_lookup_locked(bdev->vma_manager, offset, pages);
-	if (likely(node)) {
-		*p_bo = container_of(node, struct ttm_buffer_object,
-				  base.vma_node);
-		*p_bo = ttm_bo_get_unless_zero(*p_bo);
-	}
-
-	drm_vma_offset_unlock_lookup(bdev->vma_manager);
-
-	if (!*p_bo) {
-		drm_err(drm, "Could not find buffer object to map\n");
-		return -EINVAL;
-	}
-
-	if (!drm_vma_node_is_allowed(node, filp)) {
-		ret = -EACCES;
-		goto out_no_access;
-	}
-
-	return 0;
-out_no_access:
-	ttm_bo_put(*p_bo);
-	return ret;
-}
-
-int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	static const struct vm_operations_struct vmw_vm_ops = {
-		.pfn_mkwrite = vmw_bo_vm_mkwrite,
-		.page_mkwrite = vmw_bo_vm_mkwrite,
-		.fault = vmw_bo_vm_fault,
-		.open = ttm_bo_vm_open,
-		.close = ttm_bo_vm_close,
-	};
-	struct drm_file *file_priv = filp->private_data;
-	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
-	struct ttm_device *bdev = &dev_priv->bdev;
-	struct ttm_buffer_object *bo;
-	int ret;
-
-	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET_START))
-		return -EINVAL;
-
-	ret = vmw_bo_vm_lookup(bdev, file_priv, vma->vm_pgoff, vma_pages(vma), &bo);
-	if (unlikely(ret != 0))
-		return ret;
-
-	ret = ttm_bo_mmap_obj(vma, bo);
-	if (unlikely(ret != 0))
-		goto out_unref;
-
-	vma->vm_ops = &vmw_vm_ops;
-
-	/* Use VM_PFNMAP rather than VM_MIXEDMAP if not a COW mapping */
-	if (!is_cow_mapping(vma->vm_flags))
-		vm_flags_mod(vma, VM_PFNMAP, VM_MIXEDMAP);
-
-	ttm_bo_put(bo); /* release extra ref taken by ttm_bo_mmap_obj() */
-
-	return 0;
-
-out_unref:
-	ttm_bo_put(bo);
-	return ret;
-}
-
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index aaacbdcbd742..e7625b3f71e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -32,9 +32,6 @@
 
 #include <linux/slab.h>
 
-
-#define VMWGFX_VALIDATION_MEM_GRAN (16*PAGE_SIZE)
-
 /**
  * struct vmw_validation_bo_node - Buffer object validation metadata.
  * @base: Metadata used for TTM reservation- and validation.
@@ -112,20 +109,10 @@ void *vmw_validation_mem_alloc(struct vmw_validation_context *ctx,
 		return NULL;
 
 	if (ctx->mem_size_left < size) {
-		struct page *page;
-
-		if (ctx->vm && ctx->vm_size_left < PAGE_SIZE) {
-			ctx->vm_size_left += VMWGFX_VALIDATION_MEM_GRAN;
-			ctx->total_mem += VMWGFX_VALIDATION_MEM_GRAN;
-		}
-
-		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
 		if (!page)
 			return NULL;
 
-		if (ctx->vm)
-			ctx->vm_size_left -= PAGE_SIZE;
-
 		list_add_tail(&page->lru, &ctx->page_list);
 		ctx->page_address = page_address(page);
 		ctx->mem_size_left = PAGE_SIZE;
@@ -155,10 +142,6 @@ static void vmw_validation_mem_free(struct vmw_validation_context *ctx)
 	}
 
 	ctx->mem_size_left = 0;
-	if (ctx->vm && ctx->total_mem) {
-		ctx->total_mem = 0;
-		ctx->vm_size_left = 0;
-	}
 }
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
index 240ee0c4ebfd..353d837907d8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
@@ -52,10 +52,6 @@
  * buffer objects
  * @mem_size_left: Free memory left in the last page in @page_list
  * @page_address: Kernel virtual address of the last page in @page_list
- * @vm: A pointer to the memory reservation interface or NULL if no
- * memory reservation is needed.
- * @vm_size_left: Amount of reserved memory that so far has not been allocated.
- * @total_mem: Amount of reserved memory.
  */
 struct vmw_validation_context {
 	struct vmw_sw_context *sw_context;
@@ -68,9 +64,6 @@ struct vmw_validation_context {
 	unsigned int merge_dups;
 	unsigned int mem_size_left;
 	u8 *page_address;
-	struct vmw_validation_mem *vm;
-	size_t vm_size_left;
-	size_t total_mem;
 };
 
 struct vmw_bo;
-- 
2.34.1

