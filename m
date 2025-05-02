Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F4AA77FF
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E7B10E92C;
	Fri,  2 May 2025 17:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DbAdtPvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDFE10E92C;
 Fri,  2 May 2025 17:07:21 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7370a2d1981so2069825b3a.2; 
 Fri, 02 May 2025 10:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205640; x=1746810440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
 b=DbAdtPvz+8d4Ou4UwnATOvoFyxJKe00gWBXwfKg/a1Mil/ScBQRcFiTKerRX5Iwfjg
 GcIkLny+P5lYvQthoyhJd4sPTcFY6TMF5+3+o07Cyj67qnaRsrRUc9e1h1H3yArc2i/E
 8p7FWpDwPkfNcGMU2g1PYEB6ZvXFRJ6MRTap114KrlZDHYpVyFNCtyFXx0Cu8mi865fx
 JhyBxvZIBh3C3enHtZ+w+MtMA1X9NpM2r0XM4aFHYXvhzTVM1KWZmbvZbmWepiztJt91
 7z2elVMs2yv1N0L0sXqUEn34AnGLceadkYTjHvumxkGpd9QHOctFMfqEwOsAQTycv38P
 A9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205640; x=1746810440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
 b=TzHySEYK2JPJ3DDZ3cKS4rV7PWItczbOtbZsBfibZKJxwK9qRT7fGoUJEKdTNF06MX
 crcDrMso2qzsPPorbjKjsd0+7nj0sOC/mbByBVN4g3mYajXOg8cbdRQT/rGWCSHuIO/s
 Lw5AkzbrtRSS3kO/lDIw0ym21MhTN3m8PiF6ObwixKDciwoe4NkiBLiAXTjQ89vJI7el
 MUKw3F0mpSL4KYJDoTc3pcZKD93g/0EueXXdAxY2HiM/zEV3uNBUn5uxf/71P0C5ezA/
 j9o1LXPp7MshLg2sOIIFQJqyuSG++PHBps4DH3JjH6D8eRhoBvQz1oMLbIIVw2vXVn+f
 kjhg==
X-Gm-Message-State: AOJu0Yy/vcswOTwchdhgqte4U/O/DIP2BDpYpvwIq0bQJ4g6eSW6szGU
 XtMlqPvyPcwGkeqyfdmOjziBxUFSewuqdesYPQtM6sMPXEUZ08Y7n3MGGA==
X-Gm-Gg: ASbGncs3ZbCzEf2SiIAqrmKUbuBe02WWrkLejuhy4xFmEQc2SbsjOMSYe//FWRohejA
 ST9GqSQu5PjFaidAlZiko5/O7dd/W63ooQhG2XOK+QvaEbwWdWq888tRyNxGZ0IrCTDIPD8CFcX
 O78iTcddhenmD/636BulEAMT8Vc/bJjo6ubCHjbo3IDMj9MhB8S+jZSVrb9jHuNiCjj2cbg7Jgn
 GbYsMSFfkzCOkJ4pHxsY7wI0WD7qzwtftWDIxWD0ubPlctxNop+ZAEcBAM15l6CgGPbwMYh7x9G
 Ybene/hMq7iKxc6N5mh+k7bLSG7/lHIylyE8ZGs6sNnpHhpeZTBPvManhfP8rdCKBnJTuGCJaI5
 t/PSJVXbVZ4M9jU7Oa86D3xge/g==
X-Google-Smtp-Source: AGHT+IFEeJZ3EnWiuIxmkOqDMcisii9mSXm0kF7CDAycTQSMIVM4WTw7dB+vLcm9L8fcoKnbJ4xMUA==
X-Received: by 2002:a05:6a21:c91:b0:1f5:8e94:2e81 with SMTP id
 adf61e73a8af0-20cde56a4abmr5248023637.9.1746205640139; 
 Fri, 02 May 2025 10:07:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b1fb3924df3sm911815a12.3.2025.05.02.10.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:07:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 02/33] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Fri,  2 May 2025 09:56:29 -0700
Message-ID: <20250502165831.44850-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
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

