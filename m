Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E0A9FB08
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32B310EA43;
	Mon, 28 Apr 2025 20:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RH4LChfQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4442C10EA40;
 Mon, 28 Apr 2025 20:57:22 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-af5139ad9a2so3557666a12.1; 
 Mon, 28 Apr 2025 13:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873841; x=1746478641; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
 b=RH4LChfQ7m/1kxzJjfuB7eokfDOxB6bSqeVyaGBExnvP/66Ftl0WBm/PPUSHk3jc5k
 uz9aFByTR4cagWtsh+SmH0Qzd2YrqSAgetGP70T870+7B5m8UNoBvACS3K5X1PD7xZCs
 ytNyvGLeII5axtxgkgj49QN3z622QO76UtSs3lBSAYXqVXLPjqOymKQuUGM46YAWL/cN
 rQ2zDeeQLKcZMpcrgYsnF/eNPJOfrIGDUzQlylLsRHiSDmGPJSaIOgF80dA54bRgdLKg
 KSsC/pWt0hZ0Do3VsVEKiyyBD5zqrIp7tPSVt//c1AAxynJ78+qNOl36FoXBZSRfq1FQ
 Ruhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873841; x=1746478641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CE8bm1yI4Co+r59z4DxIJS8QzIm3CXUngfsrCi9/5X4=;
 b=ZtHTLAHpszbQgsg8D1ZqwODb8bYVrkid51SDMGw9J1wDtnT8XKVpoBklE0zazBwMWE
 zr9MpsAsOf4xCYl7krkya78jsNFJ0QZCvsottIZq1o3ivRovXDtaxWtbNHPnpuBmJHSu
 FuYlKXGgKrQwIgSX9X8u5F9C4zcPvNpGVKSyaQF0+QBm/5G4xdQKQVEhsT3FTZ6YXV7W
 Rs7tdXsEnt9I7xadLj5ar43V7BEFoMetWi+ZqDL7EhU9lbjr8DN4bJLxRowT5NmIC/+p
 va89JLxBsQ0a1MUvBbL+fVc7dD2TuYKAF3NX+/CIjhhxxfQmTz3vDJLUgLpI3Jm13Ptq
 XeRA==
X-Gm-Message-State: AOJu0Yz2op1DbJvz0+vZ/kj71Xrdd3a0zqv2SkmWIyVdPpVj9brMUR34
 1X2fdJU2kBw6LbHJgh0bQbmMTgP/qyVdKs+rzo2nQj8pZ3NsmJxywsSvpA==
X-Gm-Gg: ASbGncvaZnkMlQDNrsJ/ufMgmGWBtOCl4kJXqFzqk2IRFRCpV5SPj3hWIGmKnqKdI6N
 wLe0L375MLucWkeV50Onf4QVTNmQB3lfJv0wPhBRNc+OoR1o36S5tRc3V3xLONYacfftyFU+fzt
 1KDNhF4izY9E+BwTVQubheZW+azBktbbhpsQIg+lTyfLq6xSeg9hltRevRpQ2FRqe7iZu/T2BQs
 xYXxParobGkGrLTD0vreAkEhgHjSxQmfX5/jsJr8pvTmaoo1f5GByh2rWhV60jAf3YY5G1rKINF
 3Qcn4Raa82PPS/JThfZuioTfOSNf0GW30YLz/C9n3uCE8P3YtwfZE5D0PXB+OkkP9MGOtQ/mBuY
 hIkN120ZpmNDZwmw=
X-Google-Smtp-Source: AGHT+IHxQHfLbpYMMID4G/yaYBcuP8BHgktCPUEf0XSxLZbBXews4TLwBKnt4XMr5XmQrJ4JbE6jnQ==
X-Received: by 2002:a05:6a20:7f87:b0:1f5:8072:d7f3 with SMTP id
 adf61e73a8af0-2093e724297mr1403977637.30.1745873841345; 
 Mon, 28 Apr 2025 13:57:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15faded634sm7797650a12.73.2025.04.28.13.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 14/33] drm/msm: Split out helper to get iommu prot flags
Date: Mon, 28 Apr 2025 13:54:21 -0700
Message-ID: <20250428205619.227835-15-robdclark@gmail.com>
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

