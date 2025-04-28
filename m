Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727DBA9FAEE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8805410EA29;
	Mon, 28 Apr 2025 20:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jnj0o0+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20E110EA27;
 Mon, 28 Apr 2025 20:56:35 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-224191d92e4so58450805ad.3; 
 Mon, 28 Apr 2025 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873795; x=1746478595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
 b=Jnj0o0+Q4HTbph20lg2n0n28sJgCPWGkxfIG/Om4kA+0rH2ynx328iw4eCCMsAFjMi
 Gp02ns3C4ZNCB+wgsJzWTLi29dz4m+ENpRtQcvDwfIwdkuR/waikWrRMQnpK77yPRarZ
 IrE/TNPIkkh4OFTAYaK4Q5iTYM9Uedjw7pRqHhKIRgvexD5RQ/JV+hdQPQRooI3kq2Ay
 h2UrGU/cnu1DBtHEa9lc9uYyc4tn/UKf8RioThoRS8Zww44xFv0fAFuef+hOYU6axXCq
 OQ9S9WSm/mbeyN/bXNDjtknCwUIOmd9Z3D6asOYt4JMmtlywpXud/o2yQI0pFg1e9ati
 Qtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873795; x=1746478595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erym78Mhl39hRTn49O0kNbTLtbQnHd2bEe+DJwYFpbg=;
 b=vVIp1EpUS+/GaRU+jBbVCbrWzUeefztxXA/eF5qQw+VCKd0CIZVkPRyGOIHozbSOP1
 lde62RkUYxaYsJhRZtO1Rvnhz2E422B8bq5PiYqvFf1EIUFtOpS2YbwavNQ1BfcMhnyR
 IIEfP8nYox7NxKM1+SiQDFqWfMYdng6I0dvYRK8UHaj4QqGkPMP4bVoAVzuC1VnPQd0b
 +QexgTUGHgGB++VkWYsiO2YdFM5QAIs4UKDcJHLWOi3KaWLOBbXDt5rUO71oKW7ljmUm
 DEeUDlnUzWVfBONkNtPMsCo66PTb1mKYXKbSEN0isWjWOlqQrlHZzGVEqnwOQHW7l57/
 /6XQ==
X-Gm-Message-State: AOJu0Yxy2i9KWc5dwCoRRofyaz7AAdd2+eHD1Zt20ItaMACVDf6Koc15
 zm6UnLpuIOmWxY1qwymnRyFhSEqBQWadvmWUQu4QPjB1BiJ1c7EurBHUuw==
X-Gm-Gg: ASbGncsLSQlgnRawtWr6Y13piYdHxVeXcsAZuGrcji/ZPG4NDBopo1vrPWW6G7zUE8w
 19KjuKr6CY2XwIj7kt8Gq2g+Os4FRLLLpNaB48I0OXQ/DlyCtShh3F0r6DnnkXR3bd/3SRawYzZ
 ijgwlKP3iHQutRZQ3bIL5QfjUS8cgZxA9K6BsvVyAOoZh/x9y1EDxJxJbdkqO3Xhh0f3Um+a3dM
 wxDMhHWuiC9cIBK3H5LBlxVOegr9d1I769pBzh9WNjYpNa3atzZvUuKaTWBQTNoK0N9xFAmDSF5
 BWqVpItZha56Iu8jxKnfPYfqaoKXoBMY3CvEmnQjP+Bp8LOJVoqtjveMPvBsrhp8IJQAx+3YDZJ
 Lk18130wH125qzcY=
X-Google-Smtp-Source: AGHT+IGHS/bF9Co5qgug/OnqPeg4Arjq6RJlRxQJskHgD/bjb7pncc78mBfMXMNijqkOO7FjoxdxRA==
X-Received: by 2002:a17:903:228a:b0:223:4d5e:789d with SMTP id
 d9443c01a7336-22dc6a0013dmr161266665ad.19.1745873794730; 
 Mon, 28 Apr 2025 13:56:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db5101636sm87952955ad.180.2025.04.28.13.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:56:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 02/33] drm/gpuvm: Allow VAs to hold soft reference to BOs
Date: Mon, 28 Apr 2025 13:54:09 -0700
Message-ID: <20250428205619.227835-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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

