Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F4B2E04A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 17:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5D810E778;
	Wed, 20 Aug 2025 15:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LUz1U9LO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1BC10E778
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 15:09:25 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-24457f47000so56104625ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 08:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755702565; x=1756307365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSgIm4/H7Yu+PP0A4Akgz8hg8ykeT23+87+VAQDW1aE=;
 b=LUz1U9LOuia75NsheIKp2a+bBeC2ZBqOSJGycksdknWQNqYCHrNSEMgCVBU/2+cU1K
 cPJ6BMh8sfFCtz9ilJFVHPKzncD37gU3B9V5uEio1+EmMSGyhLB/3TIpo5mcTyTWOl/o
 OlGj5B/lz2rrV+/AA0SKks0ZFo3UULUFqybwFG2DdtVXSTRFyaKMceejXSyBH61bhhFD
 GgFtEztfnDQYmUSp+dDFE+rMEoOVV8L+GNj5y5PeFdged6YDG4aZGIRauALmhZLDbntR
 ECdGFVLjwceYjlCuOLyY0CjAadt7ZZghaqsTdftGD2rivHS2odwFck3fu7qglb5gmFFm
 iqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755702565; x=1756307365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dSgIm4/H7Yu+PP0A4Akgz8hg8ykeT23+87+VAQDW1aE=;
 b=Dg4vPW2iq1UALWa5J4uA18qR/Fc67CRJbE/SKIUcL9OytcREqAMvBozU8C/m6jvaq8
 qujHFdJKPq63EWuukjyd2ZRne3hYYbnybkD/8q7ErOwrPMCd9rgMsYlDpoDnSAb0aQuO
 BKGF0EzdxGlwyv5PDSLlZzxqZj4OauzPlJyqeetyxOfc8pcshABZlRWuWY9g2utp8nNC
 k6pb1kcoMpNG6GljLljufiZw38sDAM377u0jlWxtfrBQMFgHCR1SPiJC7xJozY3egD7Q
 E98JAE+3UgCbwHeAbNvs7Cv98+XxYETMnhojygeN5fFKt6wKK9V13Cx8LuoEASrwx2zB
 CmTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS1VnkIuEdUmdpdTpLXG379x34kk3y3WaqG9DDP9NTtjWmPJOszlk6C2u/YceSlgYlpHATvX1wm1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4qw+Yc263NF3vQG0GxmyogAEnQZHVKuTOjXmS8ZMffyQN9J8x
 W3vA2+svAr0R05rcmA1qYc9PNA6rXRoWVUDU2hLLwFXwBqNLemgvhncj
X-Gm-Gg: ASbGncuuXWNSLGasrvhZmcv1W3/btkTKBGOp34cMtawP2c2RwDNg4Bm4XRe3G/+lxi8
 fvZYY9aCN8Qumu+PdVzSbHoF8rcKlaERBCweANSeQk8YbOHpAVmLJ2G19QfxHZyuOchVgAmu4yf
 Pz32sVMSEb5w3Eoa7D8nF907vDOYlkYb19yTn3bujN7vBkk2gj4UF679i7STup4852cAHnV4rVt
 7wBmdp8BZXRvXaU3L6UWIbjD2a/6MZLWjYSr89iuq8cD3ZBOqJ/Gaa0EC6ZLqiiGPQa6o7vsuzb
 FrDBTZcsRPopo9WBcfqsMgAF7SbMRg+4j/BrsXUXBmlER1KSSSphpCd+aXblLHP6odvX90Pigxd
 IMucLE9TjXsW6ke8KZw==
X-Google-Smtp-Source: AGHT+IFeesZgKogpEkYmKt7j1jigdbSSubJrkxWpbElJ8Gev87fyWh8qORnnDmjou3DFP1PVwDj13g==
X-Received: by 2002:a17:902:ce83:b0:243:3da:17bb with SMTP id
 d9443c01a7336-245ef228930mr46362245ad.32.1755702564482; 
 Wed, 20 Aug 2025 08:09:24 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c7494sm29526165ad.99.2025.08.20.08.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 08:09:24 -0700 (PDT)
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: michal.wajdeczko@intel.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, krathul3152@gmail.com,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, tzimmermann@suse.de
Subject: [PATCH v4] drm: Replace the deprecated DRM_* logging macros in gem
 helper files
Date: Wed, 20 Aug 2025 20:34:25 +0530
Message-ID: <20250820150829.4312-2-krathul3152@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <a5d58430-1ae7-4b7e-8275-dad09a5c8cae@intel.com>
References: <a5d58430-1ae7-4b7e-8275-dad09a5c8cae@intel.com>
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

Replace the DRM_* logging macros used in gem helper files with the
appropriate ones specified in /include/drm/drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
Changes in v4:
    - Some codestyle corrections.
    - Remove OOM error logging in drm_gem_init().

Changes in v3:
    - Revert all changes to drm_gem_objects_lookup()
    - Use drm_device as suggested in the discussion [1]. 

Changes in v2:
    - Change drm_gem_objects_lookup() to take a drm_device* argument.
    - Make appropriate changes to all calls of drm_gem_objects_lookup().
---
 drivers/gpu/drm/drm_gem.c            | 13 +++++++------
 drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..dc3d6cfa692b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -102,7 +102,6 @@ drm_gem_init(struct drm_device *dev)
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
 	if (!vma_offset_manager) {
-		DRM_ERROR("out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -783,9 +782,10 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 			   int count, struct drm_gem_object ***objs_out)
 {
-	int ret;
-	u32 *handles;
+	struct drm_device *dev = filp->minor->dev;
 	struct drm_gem_object **objs;
+	u32 *handles;
+	int ret;
 
 	if (!count)
 		return 0;
@@ -805,7 +805,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
@@ -853,12 +853,13 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
 long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 				    bool wait_all, unsigned long timeout)
 {
-	long ret;
+	struct drm_device *dev = filep->minor->dev;
 	struct drm_gem_object *obj;
+	long ret;
 
 	obj = drm_gem_object_lookup(filep, handle);
 	if (!obj) {
-		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
+		drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 4f0320df858f..a507cf517015 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
 
 	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
 	if (ret) {
-		DRM_ERROR("Failed to vmap PRIME buffer\n");
+		drm_err(dev, "Failed to vmap PRIME buffer\n");
 		return ERR_PTR(ret);
 	}
 
-- 
2.50.1

