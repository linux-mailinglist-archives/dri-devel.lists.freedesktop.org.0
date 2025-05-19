Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90006ABC61D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6FD10E4EE;
	Mon, 19 May 2025 17:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="glZwZN/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE74910E4E3;
 Mon, 19 May 2025 17:54:19 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-73972a54919so4496928b3a.3; 
 Mon, 19 May 2025 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677259; x=1748282059; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtcNSFug1MEkA4buKrnQDhhH7gHYNLRZJbU0s44kbqs=;
 b=glZwZN/SLsYk41ul3RVlz/RwoVEPQgwBehXPaBwb1+Fg7B8C0CTq1OR6NQDvPtlEhN
 QKDO1V5BryJrFOrZ1Wx5Tw4xPmrrIAGcgZ7lk4IUnNP3Bf5Gbew+20iK4Ym0+W20vKKS
 nfXuBgaxt9QRnt/7EBwO8o+CBLWhhxyl7z2ZZjDfNpsO/XNg73IslQs3eomF1jCYnHkg
 +L4Q+Z7X0oa84LUmX8FLCQSY7uwy2d8PPMUiXXcuyIL97wsozq3c7CmoIXhE7njF3UVG
 Yd/sFSJ3qQTsyYuHiASU1xUC/0ka+/6/vLBd2khh/ijPdvUmtVhPxKwJiyguCLL8uPqX
 iUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677259; x=1748282059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GtcNSFug1MEkA4buKrnQDhhH7gHYNLRZJbU0s44kbqs=;
 b=o5rBFTD9RoAwcUvCh49kwIWeTHSDq4EGf1H7Z16ngKpo6g2juZUM5zT5mL5IYzc3vZ
 qQsxgyBtk8fNkA8Tbj57V/DWLI4XDBbeyZ8MtMX2gocuulLhvCQxA5SJZhOr9tJgR8Oo
 WLwEf1IhnmLaIQCmPIQLNyJAOo1LeZ29Q3PlGsauCsDNgGU22otVYZhZ+FJdRseuEMgn
 luPyOiu5s549UAp0GpQ04kKGFwF+5bMZpQIKDKm1UkY2OJczffygoR0hckXh+poT0Y91
 v7F73WId+TwO6I1I2HpKu+fuQE+9hRz/M/Mtp7xiTQK/8pAO2pvmwMpqeG76aBjf30K+
 OADg==
X-Gm-Message-State: AOJu0YwfrrJNVRehfeyCW3r9K1fxWlSyRGHlcEPg5UJTa5SF5HI6bfJM
 G/BgyVWHERTN7MB2wp/N3ZReEeQOYgv3FPnh33yu4z812uozAqNR9j1ZADYBOg==
X-Gm-Gg: ASbGncu0tVRq+BNQMcZJ/TETmKF6wtYHPqVCrKnCfO28ApgOlY5IPAzI5ZD0WeIN8g+
 jeUWstO1//HWAEUNQnz5J4eBU/DUae8x2GiGAj932kTLzZdyY5Z3gsLFm36N0STFfg6Rk/5RibK
 QMENHWAS2RfdIzRbc1iVSsEVtVEyG+vVfFq251xv2NEvdVHjgGDu6lf+b2DSb3lNlQU/Nq3GU/R
 ibYDdpLJjx+/l0Z0QprIu4u2fFuy6+TWoYImcYHIocvSHMMGflQC4T1nqmqS4X30KPLXVkJm91Z
 Y1uoPBvfgYkDrdg28VG+l8SildIJsbL8lE5+5o6lEuIiHcE3ulEw8A+zh2YuwxY97TcR7iLs6bI
 yUheu/jEuneGJQZO4XFRYmPZL3g==
X-Google-Smtp-Source: AGHT+IGLGnR2gjVBiS7uWt9d8fdk1foprJrMCPDgzog9mB8/+ApvxdoVytfH9URIqIITFimmH1FxGA==
X-Received: by 2002:a05:6a21:3289:b0:1f5:8220:7452 with SMTP id
 adf61e73a8af0-216219356ddmr20309299637.24.1747677258870; 
 Mon, 19 May 2025 10:54:18 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb08450csm6611996a12.55.2025.05.19.10.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:54:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 02/40] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Mon, 19 May 2025 10:51:25 -0700
Message-ID: <20250519175348.11924-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Eases migration for drivers where VAs don't hold hard references to
their associated BO, avoiding reference loops.

In particular, msm uses soft references to optimistically keep around
mappings until the BO is distroyed.  Which obviously won't work if the
VA (the mapping) is holding a reference to the BO.

By making this a per-VM flag, we can use normal hard-references for
mappings in a "VM_BIND" managed VM, but soft references in other cases,
such as kernel-internal VMs (for display scanout, etc).

Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 37 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_gpuvm.h     | 19 +++++++++++++++++--
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1e89a98caad4..892b62130ff8 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1125,6 +1125,8 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
 	LIST_HEAD(extobjs);
 	int ret = 0;
 
+	WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
+
 	for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
 		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
 		if (ret)
@@ -1145,6 +1147,8 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
 	struct drm_gpuvm_bo *vm_bo;
 	int ret = 0;
 
+	WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
+
 	drm_gpuvm_resv_assert_held(gpuvm);
 	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
 		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
@@ -1386,6 +1390,7 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
 	struct drm_gpuvm_bo *vm_bo, *next;
 	int ret = 0;
 
+	WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
 	drm_gpuvm_resv_assert_held(gpuvm);
 
 	list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
@@ -1482,7 +1487,9 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 
 	vm_bo->vm = drm_gpuvm_get(gpuvm);
 	vm_bo->obj = obj;
-	drm_gem_object_get(obj);
+
+	if (!(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF))
+		drm_gem_object_get(obj);
 
 	kref_init(&vm_bo->kref);
 	INIT_LIST_HEAD(&vm_bo->list.gpuva);
@@ -1504,16 +1511,22 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
+	bool unref = !(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
 
 	if (!lock)
 		drm_gpuvm_resv_assert_held(gpuvm);
 
+	if (kref_read(&obj->refcount) > 0) {
+		drm_gem_gpuva_assert_lock_held(obj);
+	} else {
+		WARN_ON(!(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF));
+		WARN_ON(!list_empty(&vm_bo->list.entry.evict));
+		WARN_ON(!list_empty(&vm_bo->list.entry.extobj));
+	}
+
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-	if (kref_read(&obj->refcount) > 0)
-		drm_gem_gpuva_assert_lock_held(obj);
-
 	list_del(&vm_bo->list.entry.gem);
 
 	if (ops && ops->vm_bo_free)
@@ -1522,7 +1535,8 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 		kfree(vm_bo);
 
 	drm_gpuvm_put(gpuvm);
-	drm_gem_object_put(obj);
+	if (unref)
+		drm_gem_object_put(obj);
 }
 
 /**
@@ -1678,6 +1692,12 @@ drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo)
 	if (!lock)
 		drm_gpuvm_resv_assert_held(gpuvm);
 
+	/* If the vm_bo doesn't hold a hard reference to the obj, then the
+	 * driver is responsible for object tracking.
+	 */
+	if (gpuvm->flags & DRM_GPUVM_VA_WEAK_REF)
+		return;
+
 	if (drm_gpuvm_is_extobj(gpuvm, vm_bo->obj))
 		drm_gpuvm_bo_list_add(vm_bo, extobj, lock);
 }
@@ -1699,6 +1719,13 @@ drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
 
 	dma_resv_assert_held(obj->resv);
+
+	/* If the vm_bo doesn't hold a hard reference to the obj, then the
+	 * driver must track evictions on it's own.
+	 */
+	if (gpuvm->flags & DRM_GPUVM_VA_WEAK_REF)
+		return;
+
 	vm_bo->evicted = evict;
 
 	/* Can't add external objects to the evicted list directly if not using
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..652e0fb66413 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -205,10 +205,25 @@ enum drm_gpuvm_flags {
 	 */
 	DRM_GPUVM_RESV_PROTECTED = BIT(0),
 
+	/**
+	 * @DRM_GPUVM_VA_WEAK_REF:
+	 *
+	 * Flag indicating that the &drm_gpuva (or more correctly, the
+	 * &drm_gpuvm_bo) only holds a weak reference to the &drm_gem_object.
+	 * This mode is intended to ease migration to drm_gpuvm for drivers
+	 * where the GEM object holds a referece to the VA, rather than the
+	 * other way around.
+	 *
+	 * In this mode, drm_gpuvm does not track evicted or external objects.
+	 * It is intended for legacy mode, where the needed objects are attached
+	 * to the command submission ioctl, therefore this tracking is unneeded.
+	 */
+	DRM_GPUVM_VA_WEAK_REF = BIT(1),
+
 	/**
 	 * @DRM_GPUVM_USERBITS: user defined bits
 	 */
-	DRM_GPUVM_USERBITS = BIT(1),
+	DRM_GPUVM_USERBITS = BIT(2),
 };
 
 /**
@@ -651,7 +666,7 @@ struct drm_gpuvm_bo {
 
 	/**
 	 * @obj: The &drm_gem_object being mapped in @vm. This is a reference
-	 * counted pointer.
+	 * counted pointer, unless the &DRM_GPUVM_VA_WEAK_REF flag is set.
 	 */
 	struct drm_gem_object *obj;
 
-- 
2.49.0

