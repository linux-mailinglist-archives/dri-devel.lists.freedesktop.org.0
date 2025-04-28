Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7571A9FAF2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF8310EA31;
	Mon, 28 Apr 2025 20:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d2vCIHLP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522C610EA29;
 Mon, 28 Apr 2025 20:56:42 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-227d6b530d8so57562615ad.3; 
 Mon, 28 Apr 2025 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873801; x=1746478601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=d2vCIHLPTLArBpKgE7sg6Z1tnTpwLVYfYsZfcUuprygZUdzTCfHH6TN/xTqAJ2Au6s
 lahKHtSqzh/1twLNZ8ePH5GIIcXaV1BJxJMp++9w/GlYyM88isvqhJs1He1zSP8N+iNf
 2ERoy0r+zvhtgBGaHJvKofF3268AZ6u7fpTR4K5XbsEbnkZpZ6uhYHfsj/x9gMzeJk/r
 BzkvhkN5tcvw45qBObRpwDjUlf6wMKbsoMa5kQrXz+LGfiJ8rF0STOUyH8iKSwthBpQM
 /z02/i97xKEIZq27aT96qtrZCQmy7o96mY2qJoKqDIo2M458YyH5JhJQURyinFv5edQW
 sL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873801; x=1746478601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=qv6l/J0KExQEYh6aTTbmP79axwno+5Y3/0ZepTH2oEs2A3UKKENIDmJzKmBKg0nH6F
 l+F6qM2Hv5XJG8+yfWvUKqMsGCtBaaelLTdQfOgX1kF02+79csxim8NNQgnlzuPLMRng
 ffNU+sPoGc/Dcl3oTMhT2z3TaaRQGfCJqZJ7VEGz2l3mHkG3YYJpWE/IIIwVYVf4OWoM
 3Qh6prS2TBHv2Dgy/5AbsldCxnb0dMBgUz/m5aLytDoq9V01W+NF3YFQvPXWSKp7l9AO
 +/WH5A1PNrR5Wxag7IZYh1PTpaj0kTJwGFRiRmC9jNUTtt/WyNbATUYaXkKqRdec44QN
 6hYQ==
X-Gm-Message-State: AOJu0Yyr80f6v6mum6IoBhZ+y7iXixAAwJNO3I6hSKKKP3j/QElQgA/q
 KWMWinfef5nvy73pAi04vGRNgdJmq8OEZTbxaam2U7ywuegpSdsK+TcF/Q==
X-Gm-Gg: ASbGnct3vJhXiBuTyT5q2uScBrZP0dMtq1LEBPY/eDQOCH0fvmusI8dfdsVECQsndZ+
 BmlxE1PNX7kSKFvzsD8agJ2WYSZDLUN+Jvubx+as0g/XUfSQMQO7r7g05V1pZczMZq9+47pFhmC
 5EugOPItluEfvbsA0oMppkPoVDETz+GFk+gukLMdY9JNI2SGxD5iMgb/FHQKEstfKfs49ePx20c
 S7ami7FkGkPMFyIUM3NTqPj126tEimRgFK9w5cmhfwnTQ1fXHecNuat+4eVb/zrnAGjw0tcP6eA
 MJJu2qyGQkrzAYc7TCq0NCK+0q+7kL4TJ+R3IjyY1BFYcH6dNa5THnEGfNnUNLWD/ErgEp7JBhR
 lQUvQPEQBBAUbE4c=
X-Google-Smtp-Source: AGHT+IEYlF/hNqQrFTfpBoNpweh9xryEMmimNBOhG4fWdyuCklvbsZ/dxNPV1dYaSw0ArXAE3IBjuw==
X-Received: by 2002:a17:903:98d:b0:223:653e:eb09 with SMTP id
 d9443c01a7336-22de6e93a1cmr7904965ad.7.1745873801387; 
 Mon, 28 Apr 2025 13:56:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4d76fc0sm88021445ad.27.2025.04.28.13.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:56:40 -0700 (PDT)
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
Subject: [PATCH v3 05/33] drm/msm: Improve msm_context comments
Date: Mon, 28 Apr 2025 13:54:12 -0700
Message-ID: <20250428205619.227835-6-robdclark@gmail.com>
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

