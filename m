Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09FAB721A
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C685E10E6A4;
	Wed, 14 May 2025 17:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PPGogIjJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D63610E6A3;
 Wed, 14 May 2025 17:03:14 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b0db0b6a677so6322340a12.2; 
 Wed, 14 May 2025 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747242193; x=1747846993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
 b=PPGogIjJOMQvd5zl7F1VvCOS0Kvi0OZCCDyCDdN2hJa72QnTAPWS7ttDf2SwDaIj1F
 JqVTUcpj5vZSWfnt64k7lq3cFFTs98+Dec8MpbgzKTh2svdCnTW0AjosBdXecsb+FmIV
 GWzDdWUYCIbH9vp+ni4ZPTbeCmb8atZAJyx59divLLlpwSZ/auL82Lk63rSwWihUn30x
 l0c5GRAyaBUENm1w9SmCSTq/JvCXKfbI6Mb1Pl0xxlj6WMElFHPJ+fXVjj8dtLp0gIst
 TTsooKhEtqpGnx5V/tXa/Gy/trpR8e9EDPGd0R/z9ZPBP/H8AOJf7lP5q8FkJ2D80KL3
 1HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747242193; x=1747846993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
 b=gLEM9LJpShe6OtxfISwbMQbNosIO0s+8YeRYjDt/pTW9W5df6xdS4OaiG2lIFL8MvN
 YRMj7Iat6+G/bfYSOp/CT4MEuFPWSlBYuqEYf61FLanw0kohZ0SV0+eZX1hUccN4cOIe
 Qn3UpsgLiPCpsdb4tbHnTxRofDPOAG+0gQ/KqiyhlB6UwMUCz4s1TlyWOjyVOFiNqZiD
 fLiFqAmDB/fUCddXaifSgAn+lqp9OFe9y1oHPjpwoHCWH2RgdqoJX4lmboWdXr9jDcvq
 ZTdtgFxU3z+7EkvvETtLZknpk9j9+BHByFTllQB3P8iN+atst18U/NN7J2tcJcoj38bk
 A/Kg==
X-Gm-Message-State: AOJu0YwxHvdjmj0a6CfzHsy6YKki8u45bodHJ7YqG2A74JsdmI7HQSTA
 S2iVoJSjowPyVqR3a9p5AV0uSkI2U0iWh1aT8Rw1tFm9CkpO21PDi52mmg==
X-Gm-Gg: ASbGncv7DtTBp3P7D4XfSOCjnxFRW/xXJ8Zi1vASBnqi1yvzdIjsYe2vRzIkvF2ZUQ+
 JCCAZd6fgNxF/SdNq+MDFDOpbKmT5FczBl+u6F6E0JcJDdejtnvhnYjrP34bm4orVWNVIXsGO03
 vD2p+63nLYvqdyG5Ut2ZWBDAjgjsWUl4pmmlrYuysuzu59JXkItGWsvJSYgIJYx7W6kYD1TRNj/
 ai82qiSfCqp2tYWHNj7lxXgCGWnAyyg3Dc191RkcyplEwcD7Dpdqdqd3yDuzd+LI2VcZluxhdFK
 WPav4Dfh9ox9hPfCReBb2qOEz3v3uBDEYDPNgP1/6kdVlurrPClFlDoj8UbwhOyt9DEmPxO0kKz
 s2WQ3kZ1Ejgusg5vYrhxahvmaUrGTXxG107Cy
X-Google-Smtp-Source: AGHT+IGP0e/1t+rY7vKORMPwfWNUz/Uslz1/hDTpvMSA09KmiV/ipKMfDI5ZIDJPsIMFdNfzOhK20w==
X-Received: by 2002:a17:903:2d0:b0:215:a179:14ca with SMTP id
 d9443c01a7336-231980bbf6fmr61743115ad.2.1747242193168; 
 Wed, 14 May 2025 10:03:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc7548d29sm101268635ad.35.2025.05.14.10.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:03:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 02/40] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Wed, 14 May 2025 09:59:01 -0700
Message-ID: <20250514170118.40555-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
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

