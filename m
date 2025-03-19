Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC347A6919D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2C710E528;
	Wed, 19 Mar 2025 14:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hl8HYEL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7ED10E532;
 Wed, 19 Mar 2025 14:55:56 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-22548a28d0cso37614615ad.3; 
 Wed, 19 Mar 2025 07:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396156; x=1743000956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D08iU4HNjMQuncNoMHRtvLgm/o9EB4ZZJ6auL8xvp2Q=;
 b=hl8HYEL33+YxmtzBPbfo6PNZYZByrKB16y5NbwMi0aO5J49JDT2InG3BovZQawW9Yh
 KBKIPLWRUP+uz+qsiVh+KGs4oexea7KcXNq5P6p0HC4EPIkO1wNd//8BphfpszlwKtHM
 +QIJ375MjZhSiyNJSQC01Fg5c88ZvLyDJ4K1Lc64rias0efFoENxxQUWfDzkjARKlTp1
 fRi7Vs95KxWUx132gKvS7UzmThABTOmcOilFDa6EvedoqIa+UQ1P4/VYsh+R1alQY/fU
 Hq3Sd2U7o6lnd/sbB8un0DUFRQD85W9bF6FM46mHGf0MobaLSoc/Rf2DrmBP1yXNUS0l
 U9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396156; x=1743000956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D08iU4HNjMQuncNoMHRtvLgm/o9EB4ZZJ6auL8xvp2Q=;
 b=N1uw7EuMLDmhLbF6u2cIZR9ZeyKhcCh7By+gk5PYnzOAS74xnoHopa3G7URx2xvtJF
 7nuTlQ/mil9CdzkQOMlHEvEXRDtc8KfoLE56zy0JOxd6pyIcnaYfkFcnA/Ga9z7s5Qdn
 3El4aazPtJwRNB11PXmPkDnfkjxnp4VQYIcB1sev/CgTID6GHzRi5hfFEqKlj6JqDYxV
 PZWuu4YOACwnjEd2ck8qavSIWjAJIrCqv2oZ3xUO6WGu9DQb2yDC4Y66hCDMC9Xsd12w
 +fVALAXnIUq6P/9XkTkw0MlZv2lojN/gIGXl6iWsp0bR/bVjCAxA6j5BGO+G8ytL/msQ
 aSyg==
X-Gm-Message-State: AOJu0Yz/JLKrnoLfCiRhCD+kFZpy2jMRptCnVIjbk0mb2DULQjI2sRnJ
 azYwTKb6EPBUZ8Wx1QEEr+NrKF81svtC2Bk6I1sJtt90GxW+ygaQU9vLPQ==
X-Gm-Gg: ASbGnctv7QwYiiK6mhtoHyZwJH+cEwU1t+u6AI4lfHt3LyvcbAFUqltKYmbGQpAcU7K
 1fviZHFr5dbLAanDKgr+QG4nrRYJKUoToQZ1ArC20qJw+Zwyqs979i5X8eJbhCnTUJLnj3Hq5w3
 R+aRBXInJ8aR8z2cvlU8kuIuvjxOOSRY4UIHmm9g79ubE8gyudyWH8i5+VpSrB0ab2rNegOCrsE
 ygXbqJlXhTk8MjTeuOuuRFMxGCej+gaRaSpOm/nXj9d11DoEJylBgpF4kW1RIS3ONhdvYHYmMqT
 yrqMD+5IYE4aqqWvlbq9TGIqqzKSrHFVAOLXF07p70uJoITAfsjACyx997Wklq1Jg3huw7cp4UV
 lyNtiCjPph4nAEoAT4VKt6Vfske2gVw==
X-Google-Smtp-Source: AGHT+IHr7J/3njBmlr1aPAWAlW7J4WxSjPaEbuE4k28sara3wMuWM/iCK9GgeAO5Qywl3XyBMlZ91A==
X-Received: by 2002:a05:6a00:2341:b0:736:ab49:a6e4 with SMTP id
 d2e1a72fcca58-7376d5f1844mr4191055b3a.1.1742396156063; 
 Wed, 19 Mar 2025 07:55:56 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea9724esm11057137a12.74.2025.03.19.07.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 26/34] drm/msm: Pre-allocate vm_bo objects
Date: Wed, 19 Mar 2025 07:52:38 -0700
Message-ID: <20250319145425.51935-27-robdclark@gmail.com>
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

Use drm_gpuvm_bo_obtain() in the synchronous part of the VM_BIND submit,
to hold a reference to the vm_bo for the duration of the submit.  This
ensures that the vm_bo already exists before the async part of the job,
which is in the fence signalling path (and therefore cannot allocate
memory).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h     |  1 +
 drivers/gpu/drm/msm/msm_gem_vma.c | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index cb76959fa8a8..d2ffaa11ec1a 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -369,6 +369,7 @@ struct msm_gem_submit {
 		uint32_t flags;
 		uint32_t handle;
 		struct drm_gem_object *obj;
+		struct drm_gpuvm_bo *vm_bo;
 		uint64_t iova;
 		uint64_t bo_offset;
 		uint64_t range;
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 5c7d44b004fb..b1808d95002f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -278,8 +278,18 @@ msm_vma_job_prepare(struct msm_gem_submit *submit)
 	for (int i = 0; i < submit->nr_bos; i++) {
 		unsigned op = submit->bos[i].flags & MSM_SUBMIT_BO_OP_MASK;
 
-		if (submit->bos[i].obj)
-			msm_gem_assert_locked(submit->bos[i].obj);
+		if (submit->bos[i].obj) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+
+			msm_gem_assert_locked(obj);
+
+			/*
+			 * Ensure the vm_bo is already allocated by
+			 * holding a ref until the submit is retired
+			 */
+			submit->bos[i].vm_bo =
+				drm_gpuvm_bo_obtain(submit->vm, obj);
+		}
 
 		/*
 		 * OP_MAP/OP_MAP_NULL has one new VMA for the new mapping,
@@ -309,6 +319,11 @@ msm_vma_job_cleanup(struct msm_gem_submit *submit)
 {
 	struct drm_gpuva *vma;
 
+	for (int i = 0; i < submit->nr_bos; i++) {
+		/* If we're holding an extra ref to the vm_bo, drop it now: */
+		drm_gpuvm_bo_put(submit->bos[i].vm_bo);
+	}
+
 	while (!list_empty(&submit->preallocated_vmas)) {
 		vma = list_first_entry(&submit->preallocated_vmas,
 				       struct drm_gpuva,
-- 
2.48.1

