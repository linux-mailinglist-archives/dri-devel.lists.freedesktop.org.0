Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48678A69190
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DE410E53E;
	Wed, 19 Mar 2025 14:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ThcoeLja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D594510E535;
 Wed, 19 Mar 2025 14:56:03 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-225a28a511eso122597155ad.1; 
 Wed, 19 Mar 2025 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396163; x=1743000963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGMUbTt7iIqwEBWWKqeJyEV7/9JgbkufipFOA1ELWGU=;
 b=ThcoeLjayyza/SpaDo8aTGpOhNXTYNXqSm2rSicIlaTIzIlfNSMPlIn8pv6FHhrx3p
 PlSv/6bHitRgcvhrXoF8XkueWUM8YUxOJo+JFVpSN7K7GVlFsdipvWuap6LlAPL+Kpma
 l7GotQfHv2P7MG/dUXSRidHXrUyD/B5wj/xqJWeX7MUCestTz7gtfoRe01ppd11MS0uk
 09ogRt7NxEvHj/iIxvFHT2MHJsdCwWt0QmI9VhpAUIQAX7D3N2iAbxRPs3S/ny3W4mnH
 wPZ/Xlllqg+U1DRoB1jf3InJj8omawhfeL+zL1w3Bbg9ud9qSvyHsI1+VHfvK5I2HtwS
 V/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396163; x=1743000963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QGMUbTt7iIqwEBWWKqeJyEV7/9JgbkufipFOA1ELWGU=;
 b=gx6moS+i915JFhrKSU81vxdX0l5Hao+NFkNcU0ACfyqnfDX+sEK7WIfDCPMoU8MEcZ
 sKXzOCGh+EcN9BLm2Ipyy8O4r2/EZmwIAbUcnABGV+dLzBRgIo7feZQICsR9+YnTBGkj
 I8XbwfN1VC1379yLOh70+s+pVn8SX+SupqmS+pNvNNLBZt/opZGDO22nVfr2VuWtJRiz
 bxglZBW0Gls3UmWHvG/auL3Ij23yHGrre0TLC1u/W4v8PromTjwrPGze/RkCx5Lm4oEY
 KMLHK9T4AZFpuLf0/HaNI8gaQXfgGGwY1e6q5ZdFViD/xeFcsWGL7L0cX+5kpGII1FFC
 liFQ==
X-Gm-Message-State: AOJu0YzXnjBPqL4egjDyrPw+jk9QnFOlAl1afgJMF38HrToYUIV6C5a3
 a+/TyaUHugUxfeeQxJfL97CMStL3N1b0Ng1XIdHjAhJzBCApSKgOlKDQBg==
X-Gm-Gg: ASbGncv6mryUxG3n/9v7IL3iBPq6sYYVZS+ev7tBik1tTZA247vPSVW83V3P1PBUgRE
 ylvI4IhA8+5VtWxCz8gXNF0k1+zrk7Cxy5CTdFMtbosNND6XqpP5wzDxzKtli/GPyvZnV8GDE34
 551XU3F/rNaUXh0kfhJz989MFZi0kVdf7gpIryp0nUiQTyUtV+U2Cq+58LvRFRCLj0/+PSZJAMm
 t+mwbqK2CliuRbztmaYFEDcYkMaoUKgvhhwsTd6x9pASDcnY+z+9ZzU4TCK9BR1h93xJEY96Lr5
 7Tdc++WMNNx2iiWHRfjnDB7LqO+0DTa03EasEM/oI7u6ZNF7lNqhhMQmt7JKDnreUGHrhOZYP5R
 XyXQJS0cGmG3L8GVQPbE=
X-Google-Smtp-Source: AGHT+IG6C1ekOTiy5yIDQoedqM/ij3ZtXbk1UlaxZBxrq32/wNuQ95sjJnGINydt9NUsDyFDytlCeg==
X-Received: by 2002:a17:902:ea10:b0:21f:768:cced with SMTP id
 d9443c01a7336-226499284e2mr32985575ad.8.1742396163076; 
 Wed, 19 Mar 2025 07:56:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-737116973easm11691119b3a.153.2025.03.19.07.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:56:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 30/34] drm/msm: Crashdump prep for sparse mappings
Date: Wed, 19 Mar 2025 07:52:42 -0700
Message-ID: <20250319145425.51935-31-robdclark@gmail.com>
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

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 4831f4e42fd9..e35125d88466 100644
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
2.48.1

