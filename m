Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D836A69152
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7491F10E306;
	Wed, 19 Mar 2025 14:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KULzCmlb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65ACC10E521;
 Wed, 19 Mar 2025 14:55:18 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22435603572so115442425ad.1; 
 Wed, 19 Mar 2025 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396117; x=1743000917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ORYD9iaEUBX1OwggPqr2MympMuauxETKP2Qdij/1u8=;
 b=KULzCmlbIWEYe0VstIsxn5CVWIDGHzUuCEn51+KlD0X+XlGvcssGIN7s6/P3WnEP1O
 6Us/1ysUCM8OEyNfzP82rp/1NrCcuDaBW9JAjbogDsy3ejrOG6q8bj+q8lalTgo4k2Tz
 mgQV61/yIbpGHC5uNENEF+XLmGBxI52TpKFFM3IuK+KmrRqrfsGmLYTYIHKpDlNuJ4oc
 OHF+IMBpf30Zj0VebPx/+yNUu/yIhtVPEhqVBL0CYzOX26OGMbmd7wG3SXAN7Hb9D8bN
 +bnIg9oBHoQfYUT5bBcXkiKjXICtfVHNdgcoYWBlgo+tqZUyxVE2CfnZO+t6cq+8dOQi
 7C5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396117; x=1743000917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ORYD9iaEUBX1OwggPqr2MympMuauxETKP2Qdij/1u8=;
 b=paLX2JsF5KnYNcvON21di+G+1LKJsCUiT1w76urKdyZE2Q2BbK9pj7b76rYAqz3z8l
 /G/gcbd8sU2nmnjykq2psQc16XVx9YRYGx/nbCinyJyN0QfbOw1aH5cEL981sQdWw3y2
 6Be2U8+HBhxOP/d54R0TMADuNzEj5SEUrsazryf6DVWwHMWB1N7gv2gcK3z0+kEdaI7j
 Rhz4INRyRVFeA/A6jXNLx7camj6YEe7i3li5sxK/DET2sLtts1ZoL2rzMPIzaQqFG0AO
 tZXZ9XbhWQH8rKQs3+LtZVm3+JztDEHLsZ7wnUUQHyt/t9biyOYfNJNqqiuxYtMNop1v
 VJCg==
X-Gm-Message-State: AOJu0YxhWwHkpmq+sX9TvEW8BEIJk+AziDxlVlwdAZuqufHjeRlAdpND
 hjTw9mlcthRjqj9WiKGGP0BVHasOM9MPMi5HsNGpjSTxj6Z/ezRLVBMkzQ==
X-Gm-Gg: ASbGncuvB6gTUmCZGGk5NKPIWxcgAS6Oy2pSVHBD2FuMvUj9QrhfMN3GjePl5UliGVK
 iHwKYvxIEZA3pfyKFr+XEMlQu9d+6A1XkM9mccFq5hQs1/72KPL71QGxJO/Ao/r/leQdBHJjSG1
 5JgkHPVQFM+1Jw6aCLveqH/bvCrulpJGAuOW7GDCRMdKwRHFgs5Kf9qRcBbxk9T76OtmbTBWLI4
 /3P8vnvf5RGzbOCge4ShgXoI7QAy7kCaTDx2MoCMGQnG9MfuUqGUAa9zX/tY8fOlh7BGdZ3TRfF
 wc+VeqSDrpDMLzgGvRx075vg6Gz8A32ba/ZzSWzNV4F5YBM7d9riahKPVaJ7I0gbIrIODHFtP5N
 +sMWCDZDapxLWhzPd23o=
X-Google-Smtp-Source: AGHT+IGBQPof1dc3QJbf5dt4IlT1bch2AgO2nshefyb0Q5O8dbBqD+rh4NuLDoB1B3ixTUcjZPE6rw==
X-Received: by 2002:a17:903:228a:b0:223:5c33:56a2 with SMTP id
 d9443c01a7336-2264992e142mr51954485ad.28.1742396117467; 
 Wed, 19 Mar 2025 07:55:17 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6ba6f64sm115536485ad.127.2025.03.19.07.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 10/34] drm/msm: Collapse vma close and delete
Date: Wed, 19 Mar 2025 07:52:22 -0700
Message-ID: <20250319145425.51935-11-robdclark@gmail.com>
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
2.48.1

