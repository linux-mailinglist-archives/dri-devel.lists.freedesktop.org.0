Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B61ABC64B
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD78010E3EB;
	Mon, 19 May 2025 17:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WcF6pz0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7774110E31B;
 Mon, 19 May 2025 17:58:16 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b1fde81de05so3036767a12.1; 
 Mon, 19 May 2025 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677495; x=1748282295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSQkQS6gUCueUQ4Hx1PQ5yLuWwzx74JFyGcJ6vU2NiI=;
 b=WcF6pz0hydnokdUOYFPrXPUSGSarJNsmjOu7YF7a01tzt5MZbOB2t6ExYLfSZOHq31
 rTTVmElKQNtitCIwsyvAzcHVsVdTMtT3ZB6mYWlq1xzSia4vs6LJ4Bx7Bt3JCQM+XgJU
 gpTiWR5l+eO/Xlc5AOne1xpWCWCbWeyY+ZOA0qcKeYC2tY0Bds2MH8LsCWZOBmLYST7F
 NVD6+ZzrGJfkL1pR73aa18V14tIqKjGnUiyBmLtfcvkCB1w21o75oBb+jPWIZYOz6IYV
 /8OZLa1vozOdO8u9Ls+X/JA+ULUStj5XXf6eGpR/rmp2GDT3Kc0jnTIBgtHHYscoyNkG
 LWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677495; x=1748282295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSQkQS6gUCueUQ4Hx1PQ5yLuWwzx74JFyGcJ6vU2NiI=;
 b=NQGF5A1p7vmM/zfvakjSw9rEO5aSacB2o2hBc/CmkLufWD69e3TPs3gb1wBha6W5/G
 nyPXuKB8NHRNAsoj3Nbyr0TktK2bW+ze2ay5hm6du8IMBZy2jYX+/rOLdQ604r9Sxa2y
 xEyrDBhvN6s3AjIFKWhy7h9AVm1P0aRMOZAL0UQtKqqmI0jCmXLoVtZN9u9fOt+iwS1n
 YL9l2OBAu+OK0ACRLbvIGYsjjZQjEZmfQusWwSPd3Lq+FoHeHoPXOKFm/EDiIJCyhZKY
 bXwDDcm3PiveNvilNegeLzs8oPBSlO4uAa9xeafyJYIpPhGZBIWzAzZiZhdhhlu9LsCr
 0GRg==
X-Gm-Message-State: AOJu0Yz+zA8cJOF5CXEMknw+iAbf1Urzls6cHCkVR4dqXgbNJ/0nTgSi
 0T4SQw2Wbgl547GP+DjiPYZy6PVeo1Xnd9JZr1wUYG+sDdXbIy+m5MUyIHrJOg==
X-Gm-Gg: ASbGncveSnHJh6tSCtkUUwXfA16m4ga+rOSwkbm/6dBjRSLzgx2tmS82vra7vsGxYcN
 juWlY3XX+hSzXgzmRDbMctSCAxbT8eu2dRYUDgDEv6Oa0nQ4Kf2jK82+zF4qCxQBeKy8LEOGxKs
 cLK4pdCApxpoIVoL7vrDUTYnIEIf8YD55QHTXraFMOC3WFW6Lg+ose8NEkmqEFtyzqxq6izyOIy
 fzcbL6UPYmYwRieFAD/8nVfTX7GagMOu9lnxrPqhaKnGKVWtqZazhvMNAjg5P7cdp3VjPVylT6M
 ghg4f9/+PYikj0Ra5x/aFctM9qaPQKxy1m8YiqVdCnWL21a2L5wlRp11lMot1d63YqipgVmdIHZ
 rUmR6m7qLlAR4vS71SeAbkUu4DA==
X-Google-Smtp-Source: AGHT+IFd9XZtWJ8GT07VyLdYZzMpDphs3K+QujX8XgAxBMMoKxGzCGJZYFE+xZNJPKrHrsqet7BTEw==
X-Received: by 2002:a17:902:ce87:b0:223:653e:eb09 with SMTP id
 d9443c01a7336-231d438a294mr182426675ad.7.1747677495374; 
 Mon, 19 May 2025 10:58:15 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4adbf5esm62981905ad.64.2025.05.19.10.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 16/40] drm/msm: Split out helper to get iommu prot flags
Date: Mon, 19 May 2025 10:57:13 -0700
Message-ID: <20250519175755.13037-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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
index 81500066369f..5b8b9c1d6c74 100644
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

