Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CEFAB736F
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8074410E6E0;
	Wed, 14 May 2025 17:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jktiDPLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966D810E6E0;
 Wed, 14 May 2025 17:56:26 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b268e4bfd0dso4882538a12.2; 
 Wed, 14 May 2025 10:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245386; x=1747850186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=jktiDPLdC3+8qmK1BtTHIOacRiv1KZ6nlLsRUfhuWIfz8nePqpX5zS4uLR9ttCo1jT
 NVMIycpKwaku/79h7OPSU7keBjRUq+Vb3oCDQBGyXXoM7pZ2CB5Z3XqXFwInTpkUBvY4
 w8MKULmm+Iq1YQ3uzOabPAo75grr2aIbSr/JO90WrNBCXL8l9VHc0xZsI6Z0atGLWygA
 RDDrFqqveZSZ0iwM2KgZlY8cm/kwv2Az5qQHZtytgb+ZSGCvOvRlz7hP8ckuTwVnvDnq
 ehOlxYVPIBnphFbuteAsyTfHEtr8yPFWecGo9WzjNSWyGxyuRNaK4fekkMJERywqpeAq
 qdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245386; x=1747850186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=STSwH0iqoz5tEeoNmXo3C7aXJ37+qji0rPaPYXDN0zzM6iz8j6E2gWfvZiEQ2BooNW
 pPzpiJVaxVewr0n2gp8z0CUfrXcMB6vq0OGAmIFuo8yj+WBHqlqgLTaiD0376Ywsnys+
 F4omHcj/4tcPz0WKuxdA4HIWGE0LKcG/9K9XhIjoXzNHKqV1uNURz4IMKglEGTidJfKP
 fButBxTkYl6qV+wPxLdEsSkbdBoI32eMQW/74hJFblT9+B7udg0YzDKCmeDaGYHPUcmX
 +oxiK0S55lvRZX5K9qg9McgNPuxuDy68AB3YvTiLfNU+6PX2Jl/l7qhrbvwaXjV4mIGt
 dOKg==
X-Gm-Message-State: AOJu0YzhOnpjxxqmsZNzjI6FHpvn5wDaS1s49kk+PX71rk2WI5Cfr6Yr
 09s0ta6t5HmR6J8Dipwu1rqjbP8z/v3QVDaxugWrhQBNaiZ7pbtiv1w/JQ==
X-Gm-Gg: ASbGncvThIcESmqCRbjZCvvglM8lnuY7vGjrKzjVfKopiYY7WgARatoC/2ggJMkiaN/
 Nhw9eSphNbR8Wf9L4P1naU0xl8otaGZJW0MRbw4AYZBeNMnB2u2r/oJ45V/3L0npj6nr/dsY+tV
 NHdCcQQTqEdvun+eRq7GYlpJEfNApikYM0Rx/o9TPtwfK9QFBaw7JOxoYHW1bfXyVJOkzt1kEpM
 emZrYWrjZeIZdEz38iHPLzqT8/gQ2BJQVkIPzWivUeRvTKXtfszUExlOTvOMhzlIwLY8o9vf15l
 tKMZE+8SiPSHxqZIzM34yZtLs3iPRb+H0q1vcJvHqPAnJFCHnuy0UCvU0I0R/LNdO7e6CJYX/aw
 L4T+60eQa4BF8M3vLW6i/4zMmyw==
X-Google-Smtp-Source: AGHT+IGukWsez/rsnNsRGc5ErfHL8ASz0asvwHUiI36cNdrmCfNidsjmethOnVxzxVnZSHJPAPoZlg==
X-Received: by 2002:a17:903:1a44:b0:22e:50f6:b95b with SMTP id
 d9443c01a7336-2319810def5mr64036295ad.11.1747245385722; 
 Wed, 14 May 2025 10:56:25 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc828c630sm101206235ad.177.2025.05.14.10.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:56:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 11/40] drm/msm: Collapse vma close and delete
Date: Wed, 14 May 2025 10:53:25 -0700
Message-ID: <20250514175527.42488-12-robdclark@gmail.com>
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

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 29247911f048..4c10eca404e0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,15 +353,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -372,11 +363,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -395,7 +386,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -564,7 +555,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.49.0

