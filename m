Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E551AB7355
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6B110E6D2;
	Wed, 14 May 2025 17:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a9ZbdeMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FBF10E6CE;
 Wed, 14 May 2025 17:55:59 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-22e70a9c6bdso1462915ad.3; 
 Wed, 14 May 2025 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245358; x=1747850158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
 b=a9ZbdeMAY6hOYTbCerKYi6t+7kQnfzwP5DFfFGRHWdHnCZ7zbQqjy8J+Tf98TJp048
 jVaYLIXvaEKG1kfqvvQWWWbtoq/llSaovgTOunRoOVhz3ATfzhkuJPN0V4iVD9ojANtr
 2cJhPuPzbE2vk8Ol+Mpl6AWsyRgAxX5kiDIac4t8xPY94ju9SZXcZl+7q3+w0kkflQC+
 Hsv1HYWl6fNck0dGSKkngh4nnTRhvXklkqi564J0oAmT0DmjtdjlSsT1X8qEFy1I79kv
 h2A1ROHVbG8Th5XHs9gHZ+YFmdyHWAnDK8BngNaG/ATTbuRx2Q57WfsgEhezAGa0tROd
 O+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245358; x=1747850158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
 b=Pv/x0WqEcphjc6YDkAZfztcDtuBHD/7vJ2KS+TGGQdV8GW/1Lu3rrsbOV7n185mPtb
 hHacnslJNc8JPq39xwFpfshB9nmS0okQ3uRq3V8QUBzhOIylYwSR0CUa6MJmN657RdA9
 adcArnEKoHEMqXYuiHKH34r28aXpQ+BuZ8rwpHTcFPiiuQVZa/fS3viKZmeHivTUSOrZ
 z27DpeYmfUbA+/CXCi/8WH5ZUr9RJp4ModwdtD2uAsEBGcWZYAfMhLdg/JNa0aDujIo+
 e8b3YRAAruVwsMxqgllwM99T3ShtwPxOpdWFqYQqRuAH269oPJN7K7/j1BLYSkPEF6tO
 5Lew==
X-Gm-Message-State: AOJu0Yzisfy67OEi0gZku3ZS/7Q2zshH6wOXx7cQPT2f2ekBgM274N3d
 Jl7xlt1Zrq941ZYooKU9tsOEyQilcVy9CNYSeGUr7svELnulISe4YTmM0g==
X-Gm-Gg: ASbGncvgU0lJ21YW6IyUCNztdVWxUwZieYmUrW6s6JBA9d0ZsIhXqaXMy69jooGlmwV
 WBmZzzd7k4rhxvHEBPMm3h5i3uanFJgECvlbUj4yVeumvAmLUbNfXn5Z5qgWCM8l0+Z5piaREYv
 r4Y+AgZvorRmADMmbHUhqpbA1mzNC3KoNMIGol7mUg/4ks0LoD7IUzAOUMpxQgzbxhEXbA1gCa/
 2Pau1FuLG4hry/cQOp239deC0+ZpVot2yjnir3I8golMj6Y5EChrsWnErRHhi4/KX01fymCVRWK
 KuYoV+SysCkz+L8Xfu8H2LSUoVgKBbTIheph06BLCJOzw7CKjBqCbjNcauaWeP96zmik2zMdCy4
 hBvs+UzCg3ZMlB2BQ1e35Fp3Qbw==
X-Google-Smtp-Source: AGHT+IGeuIwlbLn4XSxLpvIuoUnC0w4rSWmWToXdiOncPq/WSXq4zazqkKCjHZ74BIGTTVRJb4K3Mw==
X-Received: by 2002:a17:903:32c6:b0:22e:7c70:ed12 with SMTP id
 d9443c01a7336-231981521a7mr75758905ad.48.1747245358265; 
 Wed, 14 May 2025 10:55:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc82c3063sm101844285ad.244.2025.05.14.10.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:55:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 02/40] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Wed, 14 May 2025 10:53:16 -0700
Message-ID: <20250514175527.42488-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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
index 1e89a98caad4..f1d521dc1fb0 100644
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
 
 	if (!lock)
 		drm_gpuvm_resv_assert_held(gpuvm);
@@ -1522,7 +1525,8 @@ drm_gpuvm_bo_destroy(struct kref *kref)
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
2.49.0

