Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E90A69137
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDEF10E518;
	Wed, 19 Mar 2025 14:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ARLmFlJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CB210E512;
 Wed, 19 Mar 2025 14:54:53 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-223fd89d036so140707705ad.1; 
 Wed, 19 Mar 2025 07:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396093; x=1743000893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=536eHDinsv2rHSZhePOzHHVrQvHoKFomdEbAY4A5Vvs=;
 b=ARLmFlJz+4Z2nOnJEGSrr0PThORBSjqf7B+lsEsCXaKQZchLygAq2ssUTPXVguQ5q2
 aZpBWIYjC6Q/m7FsDtL0YWG438OifhiOwv5zXJG4mG/Y1C36W4mlogp86gDBSdgTmQ4w
 xB6uC6z1a+WFW64Mh+B8hdMOpQdUGZsKgk/INcowqjkthHg/Dww/LR4VICDxgO6eo+ay
 64BXfvSotbgOioCWAj603OYUCgf4uiq1YFylx1dWP4L3ilaLnPBaXcUY3As7RKe5w7C4
 YEV0KcvxspmxN5JR8n2K2g/SWj9dp7jwEJ5TiJA1RB7TDsgPnmVVx6IfJNbjUo3HR8u7
 4Nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396093; x=1743000893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=536eHDinsv2rHSZhePOzHHVrQvHoKFomdEbAY4A5Vvs=;
 b=Q7Ajn5mwWiyNt+QOO9LP+Ds7T6vaG915WZZ1/rIsbhrjvGI54a5F59Al2e6xSPdd+B
 SIRBuWQQ0tmmLw/IVjIseJdaHTUzqw+nqC+DMg0yBBeYRHzKQ3iwW8K4TPZHP0mOKuME
 jM5s5WCnka4mDXwgzZRyXPEmZxp1Nth8hQYkCMSvR9nFgJeM5fMrC6waftzTUdeckin1
 6bIXNT5kW2EJt0lmc41R5CFMo0UydabJ98DNA4yiYMUEHlTD1kX080bDKhZJ7xy9MWe2
 +7/ET11v9oUzXN6Mrh9v11Bsgxo0QFLZljw5BHHNZLAq3CrPhHS4Luzzn7VUIiSATGML
 rGtA==
X-Gm-Message-State: AOJu0YyBHqpgGyIguv24TfZXsly8uX+YaiahkRfRUzcOVdj4cfpmy8D5
 SbWgNUAu9gC09n2TwP07XRKdO1u4DLXnOKiOzpyhsb22RDU6uApDYJBL1Q==
X-Gm-Gg: ASbGncuyp9ipcDxUa+ErhaneruU7sY8dSrHB8HLAZgaoiNryqdNA9I72QfXGHLz9aWY
 qtynsHhE+j66VS0deNcbKrcdMRoqBVyd9dbQxBuWUfQZKnBsbuYty/PkwYqM7Nb1BnTJ9sIPvBL
 FMSinYRYG4Z8mQqyOtz425zuMTNpIkeO0d4jsy0SN4pbHX8x8CK1B4th105h5bYWvRKcCy1tqju
 YYSdPKVfZhF5zVqM3OrfegjgQA74IDKPR+bfRJCq17FOsHCeLPcTQNb4Pnysw3xewr4u0YBlatN
 1OXJkSjrWJJ62a9wznvdXiOqWVML/L2BJ3WEy1QkuboWx2nhxvYSCFA7yQfcMZS1vyVihxk4kBw
 YxAXnm/VXNDwf/LUjJ+k=
X-Google-Smtp-Source: AGHT+IHjbDJd+YwV/LQ8c+2MFP6BWpYrXhPpV6rGxA6gur8Vc2Grke7zFns7JUKb3AONdquwD1Yzig==
X-Received: by 2002:a05:6a20:2d23:b0:1f5:93cd:59b5 with SMTP id
 adf61e73a8af0-1fbecd481ebmr5327032637.28.1742396092914; 
 Wed, 19 Mar 2025 07:54:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9e5d47sm10937642a12.32.2025.03.19.07.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:54:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 03/34] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Wed, 19 Mar 2025 07:52:15 -0700
Message-ID: <20250319145425.51935-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c |  8 ++++++--
 include/drm/drm_gpuvm.h     | 12 ++++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index c9bf18119a86..681dc58e9160 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1482,7 +1482,9 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 
 	vm_bo->vm = drm_gpuvm_get(gpuvm);
 	vm_bo->obj = obj;
-	drm_gem_object_get(obj);
+
+	if (!(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF))
+		drm_gem_object_get(obj);
 
 	kref_init(&vm_bo->kref);
 	INIT_LIST_HEAD(&vm_bo->list.gpuva);
@@ -1504,6 +1506,7 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
+	bool unref = !(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);
 
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
@@ -1519,7 +1522,8 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 		kfree(vm_bo);
 
 	drm_gpuvm_put(gpuvm);
-	drm_gem_object_put(obj);
+	if (unref)
+		drm_gem_object_put(obj);
 }
 
 /**
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 00d4e43b76b6..13ab087a45fa 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -205,10 +205,18 @@ enum drm_gpuvm_flags {
 	 */
 	DRM_GPUVM_RESV_PROTECTED = BIT(0),
 
+	/**
+	 * @DRM_GPUVM_VA_WEAK_REF:
+	 *
+	 * Flag indicating that the &drm_gpuva (or more correctly, the
+	 * &drm_gpuvm_bo) only holds a weak reference to the &drm_gem_object.
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
@@ -651,7 +659,7 @@ struct drm_gpuvm_bo {
 
 	/**
 	 * @obj: The &drm_gem_object being mapped in @vm. This is a reference
-	 * counted pointer.
+	 * counted pointer, unless the &DRM_GPUVM_VA_WEAK_REF flag is set.
 	 */
 	struct drm_gem_object *obj;
 
-- 
2.48.1

