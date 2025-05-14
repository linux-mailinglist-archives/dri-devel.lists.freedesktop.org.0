Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2590BAB7377
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADB310E6D6;
	Wed, 14 May 2025 17:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VEiOqLyy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CE110E6CD;
 Wed, 14 May 2025 17:56:47 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-74251cb4a05so216920b3a.3; 
 Wed, 14 May 2025 10:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245407; x=1747850207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
 b=VEiOqLyyBZaxDJrazYkRpa/599J+eIh0ct/EqhjwYV/0ixz/aMgzUaJB0Iw771saTu
 aPUu1Iq8spPBjz1ULm2vM6m5kIvk62cs3oOd4vsHpYMvlR3gPmnGkRNDFg6Vv5BYl3sv
 P/9D/o6sTxaVVZ1b5pfvlbu3IO1AkscF06tykcPtROiAC4ZVgyv+2fC/bHbU7uIGS0mX
 EbJeFF07t3mcckgKAdAlzYej12dA1dsWwdF+jBqGYwRE7i0VbXHMlqfq7FVdCGyItK53
 N0Gmmx/KmGdjX/WZh6zrl1PD8bqj0zLmHSVhgIgPqijHz91bNwMDDVoI0y4d+wg/bwPC
 uDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245407; x=1747850207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
 b=iIHgMBmcDsm4oTOaN2OKOp0/TDXbSCtPwDeFkY5u2pSm2DAGnRtWYn31NsbLfW9SLC
 53WLEN6X8K19alYvKIETwtkErsGlYoGC8eTnVTEjYuuV/mz8y6zREax/0fZ+KW5IbmnI
 7wn7JCQzanwdSZ7QYaU9KnLDmImP8LG5PRjma/KYzPupdTWviAjjnEPpWljnvyDh8pQt
 rPk6/B8MIdUAmSpbglmiIp5n2hHJBW6QW2Z9wiMIcv278M8wPGDFGU3jEJ4e4dR6VpL9
 naYjJDygIegEp3qozcpBWff5mn44/sNIBVd7ck/4XRwf3FTKdNGNFaNv9QvO4x7n15DK
 J9wg==
X-Gm-Message-State: AOJu0Yy0WpaDX2A5Him/yiad8TyXbgd4GGn1+Dq6rPTI7IRRAlhiQ5Z9
 TPe832xkfeMOqdOg/7WI+CWM3sLxrhuq8wwfJT3xpAU8EVqNEf88DPhaPw==
X-Gm-Gg: ASbGncvcqAzjHv3y+dZ/kO+BHNCWeiCOx5hL58bmyChWRyyI+hjGUwKiAA7vyFrRMDU
 +P8weKBPDuNfqjJTKt5eNsWKBnX1sTbUlwAgKlgwtvPpSM8ySs7W3MLKH/BK8z7zXgRV2gldsd9
 Rws2hITqgrkmVLvRdwIp/a9za8o36KTtBLN8KxPFgtEZxPA5Z5SqTjmlTAvJhtntqz03ES2J2eU
 HeXTeAcLw57KZ4i0+nBEv1KEVrbiUuhLXQqwhP8lid3Eg0P1k3xfY5SuOyOkfguXFBTGdpfODbc
 W3L6BuytrH/XJlMdVw3ZMh3EpHveolFE1BQ/ENVld+sQ6HUDFfX+v0tlYA6tHUIucIBHGS5zUtQ
 H18vYZv5KqgFwLqhuiJcW1eAn+g==
X-Google-Smtp-Source: AGHT+IGvT0KfqENcMsfBkLxNixt2TdQoBi77lNCgZoguJRXA/um6A4bYZJkQAiQ3DVSn4X/7aNvwEA==
X-Received: by 2002:a05:6a20:a110:b0:1f5:70d8:6a98 with SMTP id
 adf61e73a8af0-215fee2d730mr6344770637.0.1747245406866; 
 Wed, 14 May 2025 10:56:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b251957fef4sm8216499a12.75.2025.05.14.10.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:56:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 16/40] drm/msm: Split out helper to get iommu prot flags
Date: Wed, 14 May 2025 10:53:30 -0700
Message-ID: <20250514175527.42488-17-robdclark@gmail.com>
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

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 688b0c4e2a3f..ecafc6b4a6b4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -444,10 +444,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -463,6 +462,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	else if (prot == 2)
 		prot |= IOMMU_USE_LLC_NWA;
 
+	return prot;
+}
+
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
+	int prot = msm_gem_prot(obj);
+
 	msm_gem_assert_locked(obj);
 
 	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 813e886bc43f..3a853fcb8944 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,6 +158,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.49.0

