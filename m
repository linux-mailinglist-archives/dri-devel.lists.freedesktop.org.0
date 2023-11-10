Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042517E7B87
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1974110E922;
	Fri, 10 Nov 2023 10:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E3A10E922;
 Fri, 10 Nov 2023 10:58:22 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6b5cac99cfdso1717198b3a.2; 
 Fri, 10 Nov 2023 02:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699613902; x=1700218702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w5IUeWekHfreeoT4d6rzGP0QBd9dD1NqeQcWvgmcT6s=;
 b=HdCH+tq3/YE4JEjSIBGi5oP1GdqZILmYK5AsD3sEsQ6EoBAIlUAED8KJHRJlESe9d9
 9OqNAd7IZXW3cStrFKVIVNnxPci5ccUNmB+huDg3V1Uza4IkOaCYi5gCyNjhMqFHpuXB
 1I0H7xJJZ/CwtK9ftFBwPyeSIK9jIeYlgLVb1+Kd63eQa25apcDiueg9lnDIpLHHs/x+
 LwgoAqZqEFWiqBxxBNwLJ6Znryb/COsSW6fEM3TKJ7Oaz7fzfPu5wckft+OwWO3KZcHK
 +1qhAZYT6qhkXdD4maAXAK9jcM4n45sfaB6dR94Xl1QGDpaeymiKXjsPEqodckziKozi
 lLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699613902; x=1700218702;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w5IUeWekHfreeoT4d6rzGP0QBd9dD1NqeQcWvgmcT6s=;
 b=VIZ1n6J4Fc+TaBMuIubp5C9u64F5BUmW8UbPSND9Hl/k+rAKrMlFtD8xMFnzsSDts3
 FspVUzqCP5wJB9hUihDvDs0qGcmQNAshzS2B/HWGTECNoe+u8Oqx04sLi1bhr7kYKTzz
 prSqHwQZ7lkrQLSLcUBIRKBuqEr1dw7hBnxBmsc9ktlSloHesY8hkGzhn063EKCRfTfK
 dRKyeHEFsGqY4AZa7irZiAimYgKh/UQMoMKfs1D0lMVX2cei4Uk+fnE0wlfvk0UIKKGt
 ObGveLeOBuBEC7LYABfnaSytNqZKS1AQ322BUlMFWyAJAYzFb7SdRZXcMDsx5SfnACxo
 1JTw==
X-Gm-Message-State: AOJu0YwSJ5XvDxo2PccFcn7Z615s5OF1DHLFYuj+mzvCJukTk/oNVgcG
 jD1FHkQk0PJOObgf9rbh2Rw=
X-Google-Smtp-Source: AGHT+IG6aZsLMX7XHC7FMoJY28qDjYKmoVJwl7FdMYZxT4Mf1xNfM2KWIQDP6hlhCCL74Xm3jdldtw==
X-Received: by 2002:a05:6a20:a4a5:b0:17f:d42e:202c with SMTP id
 y37-20020a056a20a4a500b0017fd42e202cmr5312588pzk.49.1699613902213; 
 Fri, 10 Nov 2023 02:58:22 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.gateway.iitmandi.ac.in
 ([14.139.34.101]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090a178700b00277337818afsm1469131pja.0.2023.11.10.02.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 02:58:21 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: jani.nikula@linux.intel.com
Subject: [PATCH] Remove custom dumb_map_offset implementations in i915 driver
Date: Fri, 10 Nov 2023 16:28:11 +0530
Message-Id: <20231110105811.380646-1-dipamt1729@gmail.com>
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
Cc: tvrtko.ursulin@linux.intel.com, Dipam Turkar <dipamt1729@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Making i915 use drm_gem_create_mmap_offset() instead of its custom
implementations for associating GEM object with a fake offset.

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 192 -----------------------
 drivers/gpu/drm/i915/gem/i915_gem_mman.h |   4 -
 drivers/gpu/drm/i915/i915_driver.c       |   3 +-
 3 files changed, 2 insertions(+), 197 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index aa4d842d4c5a..6b73fe509270 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -600,198 +600,6 @@ void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj)
 	spin_unlock(&obj->mmo.lock);
 }
 
-static struct i915_mmap_offset *
-lookup_mmo(struct drm_i915_gem_object *obj,
-	   enum i915_mmap_type mmap_type)
-{
-	struct rb_node *rb;
-
-	spin_lock(&obj->mmo.lock);
-	rb = obj->mmo.offsets.rb_node;
-	while (rb) {
-		struct i915_mmap_offset *mmo =
-			rb_entry(rb, typeof(*mmo), offset);
-
-		if (mmo->mmap_type == mmap_type) {
-			spin_unlock(&obj->mmo.lock);
-			return mmo;
-		}
-
-		if (mmo->mmap_type < mmap_type)
-			rb = rb->rb_right;
-		else
-			rb = rb->rb_left;
-	}
-	spin_unlock(&obj->mmo.lock);
-
-	return NULL;
-}
-
-static struct i915_mmap_offset *
-insert_mmo(struct drm_i915_gem_object *obj, struct i915_mmap_offset *mmo)
-{
-	struct rb_node *rb, **p;
-
-	spin_lock(&obj->mmo.lock);
-	rb = NULL;
-	p = &obj->mmo.offsets.rb_node;
-	while (*p) {
-		struct i915_mmap_offset *pos;
-
-		rb = *p;
-		pos = rb_entry(rb, typeof(*pos), offset);
-
-		if (pos->mmap_type == mmo->mmap_type) {
-			spin_unlock(&obj->mmo.lock);
-			drm_vma_offset_remove(obj->base.dev->vma_offset_manager,
-					      &mmo->vma_node);
-			kfree(mmo);
-			return pos;
-		}
-
-		if (pos->mmap_type < mmo->mmap_type)
-			p = &rb->rb_right;
-		else
-			p = &rb->rb_left;
-	}
-	rb_link_node(&mmo->offset, rb, p);
-	rb_insert_color(&mmo->offset, &obj->mmo.offsets);
-	spin_unlock(&obj->mmo.lock);
-
-	return mmo;
-}
-
-static struct i915_mmap_offset *
-mmap_offset_attach(struct drm_i915_gem_object *obj,
-		   enum i915_mmap_type mmap_type,
-		   struct drm_file *file)
-{
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	struct i915_mmap_offset *mmo;
-	int err;
-
-	GEM_BUG_ON(obj->ops->mmap_offset || obj->ops->mmap_ops);
-
-	mmo = lookup_mmo(obj, mmap_type);
-	if (mmo)
-		goto out;
-
-	mmo = kmalloc(sizeof(*mmo), GFP_KERNEL);
-	if (!mmo)
-		return ERR_PTR(-ENOMEM);
-
-	mmo->obj = obj;
-	mmo->mmap_type = mmap_type;
-	drm_vma_node_reset(&mmo->vma_node);
-
-	err = drm_vma_offset_add(obj->base.dev->vma_offset_manager,
-				 &mmo->vma_node, obj->base.size / PAGE_SIZE);
-	if (likely(!err))
-		goto insert;
-
-	/* Attempt to reap some mmap space from dead objects */
-	err = intel_gt_retire_requests_timeout(to_gt(i915), MAX_SCHEDULE_TIMEOUT,
-					       NULL);
-	if (err)
-		goto err;
-
-	i915_gem_drain_freed_objects(i915);
-	err = drm_vma_offset_add(obj->base.dev->vma_offset_manager,
-				 &mmo->vma_node, obj->base.size / PAGE_SIZE);
-	if (err)
-		goto err;
-
-insert:
-	mmo = insert_mmo(obj, mmo);
-	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
-out:
-	if (file)
-		drm_vma_node_allow_once(&mmo->vma_node, file);
-	return mmo;
-
-err:
-	kfree(mmo);
-	return ERR_PTR(err);
-}
-
-static int
-__assign_mmap_offset(struct drm_i915_gem_object *obj,
-		     enum i915_mmap_type mmap_type,
-		     u64 *offset, struct drm_file *file)
-{
-	struct i915_mmap_offset *mmo;
-
-	if (i915_gem_object_never_mmap(obj))
-		return -ENODEV;
-
-	if (obj->ops->mmap_offset)  {
-		if (mmap_type != I915_MMAP_TYPE_FIXED)
-			return -ENODEV;
-
-		*offset = obj->ops->mmap_offset(obj);
-		return 0;
-	}
-
-	if (mmap_type == I915_MMAP_TYPE_FIXED)
-		return -ENODEV;
-
-	if (mmap_type != I915_MMAP_TYPE_GTT &&
-	    !i915_gem_object_has_struct_page(obj) &&
-	    !i915_gem_object_has_iomem(obj))
-		return -ENODEV;
-
-	mmo = mmap_offset_attach(obj, mmap_type, file);
-	if (IS_ERR(mmo))
-		return PTR_ERR(mmo);
-
-	*offset = drm_vma_node_offset_addr(&mmo->vma_node);
-	return 0;
-}
-
-static int
-__assign_mmap_offset_handle(struct drm_file *file,
-			    u32 handle,
-			    enum i915_mmap_type mmap_type,
-			    u64 *offset)
-{
-	struct drm_i915_gem_object *obj;
-	int err;
-
-	obj = i915_gem_object_lookup(file, handle);
-	if (!obj)
-		return -ENOENT;
-
-	err = i915_gem_object_lock_interruptible(obj, NULL);
-	if (err)
-		goto out_put;
-	err = __assign_mmap_offset(obj, mmap_type, offset, file);
-	i915_gem_object_unlock(obj);
-out_put:
-	i915_gem_object_put(obj);
-	return err;
-}
-
-int
-i915_gem_dumb_mmap_offset(struct drm_file *file,
-			  struct drm_device *dev,
-			  u32 handle,
-			  u64 *offset)
-{
-	struct drm_i915_private *i915 = to_i915(dev);
-	enum i915_mmap_type mmap_type;
-
-	if (HAS_LMEM(to_i915(dev)))
-		mmap_type = I915_MMAP_TYPE_FIXED;
-	else if (pat_enabled())
-		mmap_type = I915_MMAP_TYPE_WC;
-	else if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
-		return -ENODEV;
-	else
-		mmap_type = I915_MMAP_TYPE_GTT;
-
-	return __assign_mmap_offset_handle(file, handle, mmap_type, offset);
-}
-
 /**
  * i915_gem_mmap_offset_ioctl - prepare an object for GTT mmap'ing
  * @dev: DRM device
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
index 196417fd0f5c..253435795caf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
@@ -20,10 +20,6 @@ struct mutex;
 int i915_gem_mmap_gtt_version(void);
 int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 
-int i915_gem_dumb_mmap_offset(struct drm_file *file_priv,
-			      struct drm_device *dev,
-			      u32 handle, u64 *offset);
-
 void __i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d50347e5773a..a18a33896ba4 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -42,6 +42,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
@@ -1826,7 +1827,7 @@ static const struct drm_driver i915_drm_driver = {
 	.gem_prime_import = i915_gem_prime_import,
 
 	.dumb_create = i915_gem_dumb_create,
-	.dumb_map_offset = i915_gem_dumb_mmap_offset,
+	.dumb_map_offset = drm_gem_dumb_mmap_offset,
 
 	.ioctls = i915_ioctls,
 	.num_ioctls = ARRAY_SIZE(i915_ioctls),
-- 
2.34.1

