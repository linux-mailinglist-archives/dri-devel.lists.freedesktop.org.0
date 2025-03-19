Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE045A69171
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490C110E52D;
	Wed, 19 Mar 2025 14:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e9JUsbxw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D9710E532;
 Wed, 19 Mar 2025 14:55:47 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2235189adaeso17197635ad.0; 
 Wed, 19 Mar 2025 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396146; x=1743000946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTa88Wc1PRQnt0Bq+oT6ziGwXmxanAJ4pfowAqqd5w4=;
 b=e9JUsbxw7CISlWdDkoq6o72YOJlG3cz3c444ubB+Ha9FwfddjapmpxghW7tp5lSQ7D
 IBQqWhTFUFf0zogZqHAIPSxxwLKimXG6QXHi4kjJ99HnYq6gpSptsUP6Nt/LJ1aXPZ6q
 Pwq4dpRowlK6t+CZScz8Seg7j5XACcG6jTCyz1ilbgsJCEI37cGwMDefdpTDO37fTow2
 xWpkd6ATv41MNIwkeQjIJz5K3jIgMnccl9OQN2svkuE+L3w07cabVtjjFI0hX4g4M/1i
 tzFB5e+WjI5w/fijlLrMV5O2fNXvblXeOug9+m9hgpkZUJ6ohCrEqNV9Pl/z5yy1kEUk
 Nfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396146; x=1743000946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTa88Wc1PRQnt0Bq+oT6ziGwXmxanAJ4pfowAqqd5w4=;
 b=bgQtHCaht9MW6ONY0kFSIEnzUy0GgZbSF/2C45LettW2rhRiVxvGGl3UP9qz5wj1jY
 JLMWRgGuoMzqH8bbJyCOFzVZ81wlFqJQVIjo8Wc9VrVTdGQhhWaPamuZP/wmv0tyQhUT
 BmCzw6ZbjmceZ/2tTGDQ/xOGdejrejFrxC5BRl1a0P1y8rbG03MQynQhHE6ZsB12vKJ2
 bFL3w9PY+jyisE10W3/lNDC16f3EhRzEtBzlheNtFrt5xgq9hOVi06OMBOljQBjzXWla
 AadK5aqpJe9gLzswXFOhYRk70GKAiF4Cu4LkTp9TeLlwE48xpEyk/8gEETCF8J+DvMz4
 TAZw==
X-Gm-Message-State: AOJu0YzHvBKp7qwvjSsI/ZY1VIi2w05b6nKoRiIfOri/lzIj2ow0zoHo
 ZoPPFh8yU7FlzD7wRE3NzMIEVVMciAAAWTmXrGV6uW4V7bx9lYxf94QaRw==
X-Gm-Gg: ASbGncu5qyyc5QAyVPBcSHi4i/LaowBA11JSESfNJSZ1Mb3xaabBy4AsqyOaPaUMWcB
 lRwZj0HdaNiVhRll62uTtr5Okql1tE+4Kq+/Ompd05zKGeMlcgJ+xG5itEOO4qLafbAxomhwCO7
 kyfPdO5PKBuZL8y844OTZUBjjc/30sQ9SusjAW1qbtmFQH4UXR4gvFXN7Zdqi5Mqp0FMRZ5Mc9p
 MWvIzx3R1ERymo2a5cV9vZESfDDt586/3Xo/y8NIIKvyP+UrvhncvYjy09ezMwc1yn7xVt5pEgH
 PTAE6pbw7vRENTSdthOZ/07I8Hy82HBcOISOii87klZN0HgrqbYhvb/+gNaDtYK4ljKCKIvLv+u
 mSXQcM4HJis5T8E3RLBY=
X-Google-Smtp-Source: AGHT+IEYmBCck03qV4awJfglZ1ySlOg+TYRs9TrxTfus0jdkH3x90RPMTd9fqhOBmyksuKLy5IuLjw==
X-Received: by 2002:a17:902:e844:b0:224:3994:8a8c with SMTP id
 d9443c01a7336-2262c99f180mr124160545ad.8.1742396146125; 
 Wed, 19 Mar 2025 07:55:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbcba7sm115335995ad.173.2025.03.19.07.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 20/34] drm/msm: Split out helper to get iommu prot flags
Date: Wed, 19 Mar 2025 07:52:32 -0700
Message-ID: <20250319145425.51935-21-robdclark@gmail.com>
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

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9d4f7b76471f..632f560c81ec 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -450,10 +450,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -469,6 +468,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
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
index d427ead2dce0..7ccdf15476b9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -188,6 +188,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.48.1

