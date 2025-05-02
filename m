Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1100AA7839
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE1810E97B;
	Fri,  2 May 2025 17:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eM1wk89y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970E910E97A;
 Fri,  2 May 2025 17:09:04 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-22e033a3a07so25927745ad.0; 
 Fri, 02 May 2025 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205744; x=1746810544; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
 b=eM1wk89yvHmKrYKSvepb5M0n9mLEzPJrQZExcjrb31YZcxHDf4eXWzCF3/O1PGFjVS
 DM/Q7GN02jsdEXLNbLgw3llJPIyqAbJJhSBfJVrztTqJaTpPvdd9oDgMS0pEl916UgdT
 tCK1Cev//yznWo8sPQA5rHBxu2B++6gpvWqALT8JNQh+zjRfxrdS/9bdJoLB4Ucr0chn
 BR1YgT4Nd4lwmy1zFKh4OjtPIdJzQKWtvBKpuk1RQEeFMBZ+30CEIsjkpwOUI5GorL9/
 ilMwEFmqa3G3TJOHsH4oRMcDWvtzBmm6FOUZSKQKnXqaAq8mITgoYYadtzwzuG9MbTXU
 J4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205744; x=1746810544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
 b=ZblGuX6aqeKEcAe0XAVc9quuDNjyl6tN9Ox93R1/5khwP6+BZ3DlKP0jfB/FozW1X8
 mB2UnxzbzpqrZSncc+5KatJKbuOAmlcEm2UozogG1uOHzyTpytq0QCt3qCbFYuMGqKog
 zTj0HcOErt/6T9Q01e49IJtx6IqBSMJJv4X2n9OtSvT+hnJCcOL3e93Y4OE/cjU1djTu
 1opF+gCwcSNIn2FBZGE1TcNfjSzCNbSqIsFX/UreYRCgdQhVEF427uReiCcbb9WJ3tR1
 63RQMQnd+1+v5oLigQN46C3ydMRTLs4R3yepnACVxQBcAaST6MRwFBwD0LFBrMoq4A4/
 +4Uw==
X-Gm-Message-State: AOJu0Yz8QEMzHW4GYFSMB2suwHNNzkVs1djSBMpLf7DgWCuv9hi9Lb5s
 h50jBwjbdUdIiNrFOVJZR7HQIsH9s14sdrjb0YW8c04bVwvav/mxbgwYjw==
X-Gm-Gg: ASbGncv4K8wed1ogMj/zZpusrrunftVvvNKyuK+Z2Mazju6oqZKdKiv3ZtMb8PTwxYr
 FH9OEFJB56DZ99pOBOrazjj68ECLnYCJzhWR5FNSEUTEun7h+mZvPqNVt7sqn7+W5I8ppzUn3yF
 nCvgT783qJxeR8bADjxf/ezsZq2DWPQw2fg7j4Ja3yx8HppYPbjMSb6A3sWmdjd8nOyBa7k/gjD
 Jbft7U2AVmAXTme7Gm5wYo/LTcKeCLH0lB7Iia7SalnTYKVnZ4WK7VxW8IsbhrkqFFCd7qlZuxi
 WeNTotpWu8JFXd7Hc3Aj9Po0FIAmjtb4jrZN7tJXsXUo8RqJS9g3X6ytBNTxO8Btv4qwEumYFrx
 CxgaNzZNHB4kU2vI=
X-Google-Smtp-Source: AGHT+IFt0hJ0TFReRcQprtgIUwIHV5gv96kJ2x1/zd91bJ5uzVT1QVa2F1GOV3CmBQedUOyrodGMRA==
X-Received: by 2002:a17:903:1904:b0:223:f408:c3cf with SMTP id
 d9443c01a7336-22e102e2c23mr59200455ad.21.1746205743576; 
 Fri, 02 May 2025 10:09:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a34748914sm6008563a91.11.2025.05.02.10.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:09:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 22/33] drm/msm: Crashdump prep for sparse mappings
Date: Fri,  2 May 2025 09:56:49 -0700
Message-ID: <20250502165831.44850-23-robdclark@gmail.com>
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

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6503ce655b10..2eaca2a22de9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -219,13 +219,14 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct drm_gem_object *obj, u64 iova, bool full)
+				      struct drm_gem_object *obj, u64 iova,
+				      bool full, size_t offset, size_t size)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
-	state_bo->size = obj->size;
+	state_bo->size = size;
 	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
@@ -236,7 +237,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	if (full) {
 		void *ptr;
 
-		state_bo->data = kvmalloc(obj->size, GFP_KERNEL);
+		state_bo->data = kvmalloc(size, GFP_KERNEL);
 		if (!state_bo->data)
 			goto out;
 
@@ -249,7 +250,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 			goto out;
 		}
 
-		memcpy(state_bo->data, ptr, obj->size);
+		memcpy(state_bo->data, ptr + offset, size);
 		msm_gem_put_vaddr(obj);
 	}
 out:
@@ -279,6 +280,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->fault_info = gpu->fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -294,9 +296,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-						  submit->bos[i].iova,
-						  should_dump(submit, i));
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
 		}
 	}
 
-- 
2.49.0

