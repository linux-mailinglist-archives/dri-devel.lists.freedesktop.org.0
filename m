Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0076AB7353
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513A010E6CF;
	Wed, 14 May 2025 17:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NEf4LCqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAB610E6CC;
 Wed, 14 May 2025 17:55:57 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso180388b3a.0; 
 Wed, 14 May 2025 10:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245356; x=1747850156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
 b=NEf4LCqOmdiFx3gJ1SYTzR/SMXo7aaR24Nv62jAQ83o1cyhF3lstrl4myCiIo6IPcz
 gvLKyXZEYcE57BYAPgr+InGlMOxeVVvimNzVRbEMMRrGiqDPa4zWUs6KONsJ52z4Q/sZ
 kwJNlM8uNLBNecB97a/C6ZuetQHuvQFYsvEWBJ8i1jmDT24W6ykg2GTzvlnFlQstcG4D
 SuuKAarilVh4XKHwrM2+epKTXPeKkmgigXmJS3+pB+DbWtJglhL2ALaVkm8POmTriEug
 l+9Qsi3EqbpUVE2y7VCra6WibTjDfi/mQc5MD6pgo/ewik5g+vxGvcwsfPQ4sFv6sGkt
 5KVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245356; x=1747850156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
 b=mOV8dSE0jsxE43cKfBQWDHjEnXN03547/t7i8iwMl2PlTn3sAALM3AjD8At/97wiE4
 nhIpljXymtwo8qVXVMG40w5T2dyGFL0RD2nUEHARfmffFPykiMVNKHiqQM+dUY3D7hqJ
 OEbOe5bgwHgC4+g1yvHU0yyrWdLVfiZnPLN8TLs/tHIwIuyYY2SxG7xDvY7hbR9QEKQR
 SkaHt8qaZaO9I7p93v806dLmfsRgcQ34Az1MGAZmxX+BF/kT+JjCH8/9zWCP2eN2NkIk
 dqEJcKgVEjNaR76DbI6pDebayvS2Uu9gBKo0/ZPHWrMPvp+nVowyZG/qbYhIGpe7ude9
 leJw==
X-Gm-Message-State: AOJu0YwaxH9s4ZUXlPj2HIC/lAyzF0GUrgpSpqwmBahTrHP/t8TaQBfw
 9u6Q//Ytn1/7V8xQ075F6pFylBgnRXQmF/oqFbEiRiLq0KoNAZiEIzRmZpzb4w==
X-Gm-Gg: ASbGnctIli1k2sI3i5Y0rwvA6p0Uqd65Mw4jIDXT7EaVS5nu7VBj/iyzSSxE/bnFbML
 hEk8K8HfHy1qgZ+h9h3Hs/4T+WSXjGSdtL88xkPYKRjUajleRBLvWQa7CLGfvtLlQYoW9beKH30
 nFD02JadfU0O0yIcTT73Sg6lMOoBTQWK+w0rwhJEZqui7VqByX92CtYIIJ7DSovPZXZKZ1kCZNn
 sw/n29cz5iYCNIgKQRGqD7bGcKQxZecFQi/wBglI4/Ud803hDUybExZ9sqajhvSqCW38H8DXYAz
 7xdabhVoJRPTrLVi2mqihoGpP/eOvxf2uLrzkydpcu13E1dVwBwVzHiI8oNUsPNGJjtkGvLsZef
 zcB7rHVI53vYJR16b9Ozrfs6dng==
X-Google-Smtp-Source: AGHT+IHjF82FgDHpaZyfZ0mh0WyzjGVyaIiByKx50y4IkVOdD/N+GORUPRIwiVFdseTs+TiJRwcj2g==
X-Received: by 2002:a05:6a00:2986:b0:732:706c:c4ff with SMTP id
 d2e1a72fcca58-7429625def6mr688672b3a.7.1747245356164; 
 Wed, 14 May 2025 10:55:56 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a4997dsm9853111b3a.150.2025.05.14.10.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:55:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor path
Date: Wed, 14 May 2025 10:53:15 -0700
Message-ID: <20250514175527.42488-2-robdclark@gmail.com>
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

See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
msm_gem_free_object()") for justification.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..1e89a98caad4 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
+
 	list_del(&vm_bo->list.entry.gem);
 
 	if (ops && ops->vm_bo_free)
@@ -1871,7 +1873,8 @@ drm_gpuva_unlink(struct drm_gpuva *va)
 	if (unlikely(!obj))
 		return;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
 	list_del_init(&va->gem.entry);
 
 	va->vm_bo = NULL;
-- 
2.49.0

