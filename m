Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCA98C4495
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40F910E6CA;
	Mon, 13 May 2024 15:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ePbWHC9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD4C10E368;
 Mon, 13 May 2024 15:51:55 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5ff57410ebbso3648887a12.1; 
 Mon, 13 May 2024 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715615514; x=1716220314; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1wioqfQiuQuCuNYwlP+E5Wyu8F6jbMqAw/h0oL3eqU=;
 b=ePbWHC9ZQ7sFN4lMVGabjVpdgSkZR4gSVHphio2hNC1YwroymVGNYoK0WcEiMsf/Mv
 D52eUli88gwNcP/6Z81st5M+PgMYaRvDUZwiLQBhshCOFofeEMv/pbvhdO9JhiCWCdC1
 QgPN05B4LO9fPhMz2VNDn3YyqCKFelOwpEk/tYEWY0Np/M9/fEA8cOOatHSAdUaShATo
 lqKlE2fLIS1EKEHj/9A/vC6ioNNAhCfa8HM/JX51KP6gpoulvVszJwv9QuaYOGBwcBCO
 nTYe15BBXctXQbaoZC9ALGu3DgrJzpU7WagkZU6bp2wqtqyX/etNCpokOrBHWjCFxy4Q
 gWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715615514; x=1716220314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C1wioqfQiuQuCuNYwlP+E5Wyu8F6jbMqAw/h0oL3eqU=;
 b=uy6X7aVVodScwucAh2xaGd2Y3CPxOxFLcII80TQICr/S+anIiuwMKp59TgkD6pe3gU
 FptW3g/2M8u+pe11AKdCJNVBTkPw3VeTVGGEhbxFQi10IGFOuW9k+d1OWrDj9iHYf+Bw
 E7tJ4TlTrEYNFn5Uqk7fy/dCS61e1wK5a+ZvP16P+/9MOzJroZCk7DKK4ep3+Ersw6Jv
 +mdm/XRsn+blOQhOcVtmIbWbVFKWA0qlMrIP69xAr15j+ly1bj7n/ABw6wUf3V/LKcbB
 xyAm1+iRQSgQTa95+p93j0Lm8eT+4SHO35Wnt6p3bK+L3hnveTED1E6aHVAiFj0R6Ywi
 v7Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw5vRmoLX9yc1iHzYneWtPueetAUvZHb5bmczCkFgTUP4Z1rSgHQcKxw48iZl2CNdcUFTDq4Wd6tiXK1X6nUQ5Pnr+S8k47CO5w/2NOaA8
X-Gm-Message-State: AOJu0Yxa4U7t8e/VvsJUYXDH50jSa3W9eyKedXr1pvN3oc0cuTq3oPL5
 EOwVuMh58ypK0/PvgEDwpL6/kAHJE8ekyGOTqw0sxLCiRjt40TVBmCAo1Q==
X-Google-Smtp-Source: AGHT+IEDqMYogdWr3XOXh22OTvx+Uw4uVC3Zk4ODbviWxNXuhd9FThKOLXrM7kC6578pgduyhtA/Fw==
X-Received: by 2002:a17:90a:d714:b0:2b8:f7c6:1581 with SMTP id
 98e67ed59e1d1-2b8f7c615d5mr2619575a91.23.1715615514501; 
 Mon, 13 May 2024 08:51:54 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b628ea6ae7sm9906113a91.51.2024.05.13.08.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 08:51:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Add obj flags to gpu devcoredump
Date: Mon, 13 May 2024 08:51:47 -0700
Message-ID: <20240513155150.166924-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.0
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

When debugging faults, it is useful to know how the BO is mapped (cached
vs WC, gpu readonly, etc).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 6 ++++--
 drivers/gpu/drm/msm/msm_gpu.h           | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b7bbef2eeff4..d9ea15994ae9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -887,6 +887,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			drm_printf(p, "  - iova: 0x%016llx\n",
 				state->bos[i].iova);
 			drm_printf(p, "    size: %zd\n", state->bos[i].size);
+			drm_printf(p, "    flags: 0x%x\n", state->bos[i].flags);
 			drm_printf(p, "    name: %-32s\n", state->bos[i].name);
 
 			adreno_show_object(p, &state->bos[i].data,
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d14ec058906f..ceaee23a4d22 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -222,14 +222,16 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		struct drm_gem_object *obj, u64 iova, bool full)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
 	state_bo->size = obj->size;
+	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
-	BUILD_BUG_ON(sizeof(state_bo->name) != sizeof(to_msm_bo(obj)->name));
+	BUILD_BUG_ON(sizeof(state_bo->name) != sizeof(msm_obj->name));
 
-	memcpy(state_bo->name, to_msm_bo(obj)->name, sizeof(state_bo->name));
+	memcpy(state_bo->name, msm_obj->name, sizeof(state_bo->name));
 
 	if (full) {
 		void *ptr;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 685470b84708..05bb247e7210 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -527,6 +527,7 @@ struct msm_gpu_submitqueue {
 struct msm_gpu_state_bo {
 	u64 iova;
 	size_t size;
+	u32 flags;
 	void *data;
 	bool encoded;
 	char name[32];
-- 
2.45.0

