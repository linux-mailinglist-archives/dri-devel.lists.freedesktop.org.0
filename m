Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F186BAA780B
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D7210E960;
	Fri,  2 May 2025 17:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hTV+1fsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595CD10E94A;
 Fri,  2 May 2025 17:07:36 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22e15aea506so8204455ad.1; 
 Fri, 02 May 2025 10:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205655; x=1746810455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=hTV+1fsulUYx7bvPCdt028BMTxqa/6maD2+CTZ96eLTWFb41fLUVttOFNmZC2pTbna
 XRl+GovrRIJNuRQiYB8hEJp17eB76DahP7eOlywXpyCMzW0sjOMB5YC/0Btz495g9MSm
 YT5//zGcAJVd13dw6D8DpCOCtFJ3RbqZX9cdviEaOB230Evzjg0qc/ruTKCmJObCSl+E
 6JHbYQt6A6mGXFHXu57fkiatljpo7S8tZRt8u8JGPZY0ZB9pTBcIG6f3/NBYP0/R/k1U
 Qmy92hUGhVZaAhqREUXFnYpFNFB2of0xrx3ck2FfbjAI8/foKwwjGatDdBKbY68J5M6h
 F2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205655; x=1746810455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=B0ZhWlHOlRoq4MYS7gMQQFwcwhkzOk1Si/rDT5+NjeElKiuTa91+EbzBp7ufy1cVB1
 P5cCfzsVg1j8Enu5EElwY+dd9zN+bvPhl+g4qYU9EV7fGaLYlw912+95E+8fwLVMX+d3
 +OUnMrwflmGoL6xRpwdLr5+FxCf7S8hsjkFHn1aqQmM/WzECP2PDIKhHEjzkCWqe4GNN
 v8PYvadZHofMy9owBhPltmDfyOP9EzDrxLwg7elbPrtu9i1jC2Db1+cQN09S+Z1SW2kj
 L5LWNKdWEIrNySAp7ZxJTqDLdHeOp9GN4j/xvs4LhRV+OxYvxUpw6UCHrULN/lkVKUOR
 g2pA==
X-Gm-Message-State: AOJu0YyE4I6YUVPjGLVRxoNxjZv9a+HYh5IjNYgl2zlW3UXocu8XqQlS
 c0kK/NckCKYc5LsWRnSrw6jh4ZpFVUH++KmverEtJiLrHmxLdnc0bKycHA==
X-Gm-Gg: ASbGnctc0NImXoQ75fZBzoewWM7hiMzcNbuRLiVhlwb2fDo0fKiZ60K2xAj53kiwuXs
 +tnXHTx8G78dF82U7d2PCSmdtqX+jou+hHiAPgCApIhVs70F+8obNxNHRXnGfaPpMDj7LH5KUDL
 4VBf7jhT7c8Mumj2Lb//RHwmJNU3zTIw6IZy8riQrRgkY+ewCcTq2q+bCrmP8teaw45jYa6VugV
 08LxfiLpFskBwH47R8DWqC3guhqCCWhQsYgRt46dLEBkaSwsaC5wEENkzc/RsKzG9njWII7k6Ah
 vXm8sIyL2L9fGEc1aIsMH09Ya7RUgXM9Yel5hvjqf5rHRjRwlyyjEf/wWfEZ/ci2a8x63hw7div
 NroOp6dK2KoEleoc=
X-Google-Smtp-Source: AGHT+IHEDwjYJZYF3Fkd4w8lssKXGRFffmmotqq/5XEF7NClh0BLMgFzf8nD6r96V1pE/TdnhcUY1A==
X-Received: by 2002:a17:902:f650:b0:223:2aab:4626 with SMTP id
 d9443c01a7336-22e102b5f15mr53388395ad.11.1746205655219; 
 Fri, 02 May 2025 10:07:35 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e151e93a4sm10229705ad.58.2025.05.02.10.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:07:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 05/33] drm/msm: Improve msm_context comments
Date: Fri,  2 May 2025 09:56:32 -0700
Message-ID: <20250502165831.44850-6-robdclark@gmail.com>
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

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 957d6fb3469d..c699ce0c557b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -348,25 +348,39 @@ struct msm_gpu_perfcntr {
 
 /**
  * struct msm_context - per-drm_file context
- *
- * @queuelock:    synchronizes access to submitqueues list
- * @submitqueues: list of &msm_gpu_submitqueue created by userspace
- * @queueid:      counter incremented each time a submitqueue is created,
- *                used to assign &msm_gpu_submitqueue.id
- * @aspace:       the per-process GPU address-space
- * @ref:          reference count
- * @seqno:        unique per process seqno
  */
 struct msm_context {
+	/** @queuelock: synchronizes access to submitqueues list */
 	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
 	int queueid;
+
+	/** @aspace: the per-process GPU address-space */
 	struct msm_gem_address_space *aspace;
+
+	/** @kref: the reference count */
 	struct kref ref;
+
+	/**
+	 * @seqno:
+	 *
+	 * A unique per-process sequence number.  Used to detect context
+	 * switches, without relying on keeping a, potentially dangling,
+	 * pointer to the previous context.
+	 */
 	int seqno;
 
 	/**
-	 * sysprof:
+	 * @sysprof:
 	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
@@ -384,21 +398,21 @@ struct msm_context {
 	int sysprof;
 
 	/**
-	 * comm: Overridden task comm, see MSM_PARAM_COMM
+	 * @comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *comm;
 
 	/**
-	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
+	 * @cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *cmdline;
 
 	/**
-	 * elapsed:
+	 * @elapsed:
 	 *
 	 * The total (cumulative) elapsed time GPU was busy with rendering
 	 * from this context in ns.
@@ -406,7 +420,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -414,7 +428,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -427,7 +441,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.49.0

