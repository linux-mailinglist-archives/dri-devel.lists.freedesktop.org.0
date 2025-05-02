Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B1AA7817
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D11310E96E;
	Fri,  2 May 2025 17:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P816Erdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F279210E966;
 Fri,  2 May 2025 17:08:13 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-22e033a3a07so25917035ad.0; 
 Fri, 02 May 2025 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205693; x=1746810493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=P816Erdy8dl5xj7FomvI8xKYu+Ww35ZcpKBbXggezC4qYqAsCd5mr2rdk71mvK2Aw9
 W/iFF8eJp7aT9gvfyQ5MuGQOm8DbNjx0r8Jcu7xzD8xnOLC2FcK8er3CytmEFOgBqeGn
 EeR99NTY6hmDjwE6JiHpenZhN5XWBG7zFi57rHbTTcCPJkIy3xiSsv43r0I3OYWGQnTr
 vYKg9Zh04QClp+OBc1Lu968obUXWVhRxuPp8Od+bBF1eXZJhBvgHwovAiMOXSSWnI/u4
 vACRaW/KIRpPUF08+YhugOo6SrRgSp/FdP4oN7L36WnFiwcwW57fv656uXqZS1nI2n+u
 6D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205693; x=1746810493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=p9kS2Q6F8GZmo7rxhd8BsGtzC6FTm7RrYFDXuyipzhn4nN9HDupvVYeVpOabbdrJZY
 GAQKcIvBD/BkgOzhP7TjLl2akJLQK3Xq+VFgq4IGP6YHRnIPnS3SRztgji9bzkBafLo5
 uh30P+8U39xyvJwST8J2zo+B//p2/GB3lXa/70KfpdjEI44YUyxJ0ZfWgKicUlYBm3vs
 EN9RqECIxFer98jh0mDLkS6px4LBx3jc5nqcMdEFaFY+jABa3PqngDASBV+0sFQb8MHj
 h6hRj86n/O0JRZOUUT9hxKE4+Pr2X/Bbju5znoJ9I0iFFs9nsN2qBDffiog12N9loys5
 queA==
X-Gm-Message-State: AOJu0YyrI7Jqzbmq2dBINaznE7kMMuJLebiKqWHwfXvaEUN+uK0H4x4d
 fOvmb2qQKYkto3HAvfhK5rNhZ/0NFkQpPUHe0s8B5SBjXlNUXEtNzeEvrg==
X-Gm-Gg: ASbGncvx7ZLX5qcWCn9bk53Z8h9NukDeSY/+EBvc/wBMBRy8YLNLMNB1y4JGxrJ98nP
 sTo2iz6e9nr76EhmjSDCEcB9agw2RMykSM+9tzdY1VSYEbwuOowd/IxvIksMHuAZxWg7+PHvny/
 921oSFLBCYVn+uCtIYvbAPVjqLmPFEC+Q+VFu1qg0H1EfS8vBRgT1Ed3nKKzKqC1Q5wm0q2ix7k
 BxLAH03w/6+mJuOla99k1XCXd1Ocej+Hi1up4Ytt0ej4TRm+jmICyGiVp2sHUpQVC+6Z3LkUm2x
 r1iaIk1pyzgEfkbH7tZYBJnbVQsJ6AMtg6lGEkvhP3/HIoH7hXcy19mVAy5gQC84YHKaEjqu5vv
 VmibT7IG+uw7WCrM=
X-Google-Smtp-Source: AGHT+IFin7vcvn6cE72mu5NHWdPdir/2ennFF/57da3rq+xksYALjf/lRnD0N7Fwn10FnKXzgkWy2w==
X-Received: by 2002:a17:90b:2ed0:b0:2fc:a3b7:108e with SMTP id
 98e67ed59e1d1-30a5adf7bc5mr79690a91.4.1746205693034; 
 Fri, 02 May 2025 10:08:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a3482a35csm5977636a91.44.2025.05.02.10.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:08:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 09/33] drm/msm: Collapse vma close and delete
Date: Fri,  2 May 2025 09:56:36 -0700
Message-ID: <20250502165831.44850-10-robdclark@gmail.com>
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

