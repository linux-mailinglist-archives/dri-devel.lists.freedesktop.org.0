Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC49ABC620
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3514610E50B;
	Mon, 19 May 2025 17:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JJSbRklS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5242F10E487;
 Mon, 19 May 2025 17:54:29 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2322dc5c989so10686525ad.3; 
 Mon, 19 May 2025 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677268; x=1748282068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=JJSbRklS3LURuNSrW2SaEALPG1OwM9h0moRJsfvvDkSpkyYExXxaMpmbRIAZkM0jXo
 g1c7E4WwUswaVTjbBPzQ3HP1yUaXPbTJauYBrP9fxLlIbgTzvPnavv7q/gWtIYBTD3h7
 DNMt2uP4iJb70sD8PwUicnaqDcknQXlNWAjQmxNJp3d1yO80qX7F9/6X8ncNORQFYXAx
 EHm5Bm4daVUJQI2nvFT7huzS/6W4EElnpgX2FlXKjRenykCdqXYaXLaNq73i4MzPX4b2
 TWdh5jNeCxtucKEQEEjfE8bv1kCl6Mb+n+1jd9vVag+jbLBEjf0LmBzCfiTFua6BfZ4J
 F4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677268; x=1748282068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=KlVlSXkEBi9q3D3uZpy8ctOhjl1ys5t8POkqqI0kO3JoV1+/DrbLmnoi+kaObQPBOv
 yMiBYwZanE7CRM3Wb128beGJwT0Avokmzp3w9vYSvPZyZoKOpN2h9EgPc8DVAaPBcA4X
 6MvLeUinCFXpG0d8NleyDSWm/2E8fV//g5ypcF3GauN5UZ6V9+JGQcQ4UY/V1ZLFp0HU
 Hk4Ds/lOdbUHcQKxf3NyljPHOpFx0HjkrRnarAxD0vdnaNh5VpMjQ6/BesNxCkd8LgsW
 tbvqgXN9fryjY225w9IcnjF3cSAPc5aE7kz38YrRRCkHAjwcvz1bM62e4vGHHeeq7pmZ
 Qw1A==
X-Gm-Message-State: AOJu0Yx2NjuVL5b0F22oZfZ15aKiYYmYCcrdx1G4/r0eTwWQgn6n2JSB
 /rS1LjPviHzbncYVkHXiTp1BEFG1eC0iHRLe+mj2/PbBpQMbf79WtYlXZm047w==
X-Gm-Gg: ASbGncsw2pQLMk16BjQmjWiylx+p1NtvMEFveesRPji6/SWZ9dVW3MkQ3ijj8eUf8i4
 da9vICp9PylRCG1AgvakgWMJ4jBdKi2xE5NdiVUSsV3VWHlozNOAMe6uS7TR6ws4iJqOyMbKTsn
 3JYm3tqBEQQM7kQw+Z/oG3xs16cycuWQ2fFj/MwvhjzXwe9GLZxjAm6vDCQtdzky4NElvJPS1jH
 UJZ1hwfzGWOr5YmCYtY+7aFW4SAGHtwpVcgWdlZTH0lX/yTWmxC4o/SbfAwpJkuWULR78ntgVq5
 +9ANK36DxJtNoeb4mqUIFK9+uoaddDG03UroFJyQnUSy0ruVJTKzE0fy/Q+RtjrEnaX37CV8zP5
 vjO5RVOI/st6Ks2yw5Jz8o8jwhQ==
X-Google-Smtp-Source: AGHT+IHetx6JhjKJiiXTN6lkyo+n0uqidqeO6FYdb9monpI6GoV1ZNjHZwQtDbvkDnweEzmVsK67rQ==
X-Received: by 2002:a17:903:11c6:b0:21f:7880:8472 with SMTP id
 d9443c01a7336-231de370156mr200750455ad.35.1747677268469; 
 Mon, 19 May 2025 10:54:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4e971cdsm62879295ad.134.2025.05.19.10.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:54:27 -0700 (PDT)
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
Subject: [PATCH v5 07/40] drm/msm: Improve msm_context comments
Date: Mon, 19 May 2025 10:51:30 -0700
Message-ID: <20250519175348.11924-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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

