Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A278CA9FAFA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E46B10EA34;
	Mon, 28 Apr 2025 20:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ORjTBV1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B781910EA37;
 Mon, 28 Apr 2025 20:57:03 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2264aefc45dso80231195ad.0; 
 Mon, 28 Apr 2025 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873823; x=1746478623; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=ORjTBV1nnDIsDfPESg9o8axLek6nCzJVQS8Sxqh08DtDZ94QO53iXpNmNP4ypjuKTV
 qtzSapA09ConO3tI/gkQXs7MKn5rk0kpSE0bhIM/djm48W0kaK68zKQeeIQgUKyWly30
 W8sOwBYSb0SdIZArCpFAcyWKQPesjgKWmeppkKGcubb6JvUyPM+4aKCEZcxJBc1BC+El
 EkBH0lyj0vLXL0xsoxDDmAZXa/0FqMakAuoeL6rUdyz6Sg0bQlyjSB+IGye8gP6iSO82
 QF0pl3XUK0EwlKJbGMRqjVXaxKRjEqe7imXrmVNr+YiHuToKyodQsmNNNyXyF63r9z4L
 Lc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873823; x=1746478623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=waw4w0Q/P9keedP7Ykz7fyMHfgHgVQWacH3yk9lXO5s=;
 b=F0RiU3jJF4LkQz1wwdcquiVK4VfRv4/aPDzUFVK/DkPeeRz1LH1XmtqRmZ0bLUX4LZ
 oK08S2ihMI8+4HPIHC1Zye3ZICNop3dPwoT1n2tHJkbhh1bEBAmDMZe5a4gZRJN5xAnx
 O+VE4ZtF3L9p41xb9m8XhUujy+0VG27NK2LRo2xUAHfXsQG0KJ+RScDZnHuPeXl+Nz7v
 qVmKnxZ8gOPlu0edz4sJeJHhkPDEPiTv3aGcd+rGOov+/uoiwXevTeyml018kYuey0W3
 PjqyyJ73zncIGhDK7Xk0OZBpFJJTUD2Bv41KjD+riRt6hczyruLecTSO61X3t8z/KRpw
 vTKQ==
X-Gm-Message-State: AOJu0YyVJ/KKnhGFRXmCTRORWefSrB1KrgujmtSfJ6zJsc+c9Eyd/3DA
 3Q1wnxP4Ijk/F8a7GhYGn80mtvR1GAWzsdazMQbEC5w6pYI+3XQf/YrkSA==
X-Gm-Gg: ASbGnctERZC/d4OKEDUHn1woUpZpMty5x0QHMp6StiTtqCALyyqzT4SCHxToL/X057l
 /mRjeq2H5mQEK9O2McqOlEzZn1otRtxqwXMpqsIdITE+AmsVecqNf1rESNT1Rgkw+FC7W1JL8JS
 StApfzcAzw1faezj6Hn9HCBQ0VKPFsc0wUftW52Tt6bN6ABmGe6hKGCh9PcNM5cPwyGEIUXzg8b
 IRJd+1BzsB1m2d+Ey3Rq49qA5Evw6cDHLTp0zJ/ge4byeRDsV+sgKpxVt36/qRlr2iGuoqPCVZi
 SN8D2Ipw/SPVphtsyZhdaWl2sHSaOAaIa7hlc0Dv7lc944B3FdA+8NMITGduMt6U2x/hQ0doJab
 R52cSuu08MYx4hOQ=
X-Google-Smtp-Source: AGHT+IE+nPnA5uSWbuDzPOfm9Hk6C6UvKRQoPLuOUHAT5l2tZMUHcvNbQ6XjKjabo4vFijxW6zfEfA==
X-Received: by 2002:a17:902:d582:b0:220:f59b:6e6 with SMTP id
 d9443c01a7336-22de5ebb98fmr13939615ad.8.1745873822844; 
 Mon, 28 Apr 2025 13:57:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ddf3c9d1dsm17245505ad.244.2025.04.28.13.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 09/33] drm/msm: Collapse vma close and delete
Date: Mon, 28 Apr 2025 13:54:16 -0700
Message-ID: <20250428205619.227835-10-robdclark@gmail.com>
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

