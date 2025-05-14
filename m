Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349A1AB7362
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CA610E6DC;
	Wed, 14 May 2025 17:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ihRKsoZ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DB010E6DF;
 Wed, 14 May 2025 17:56:08 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7410c18bb00so205481b3a.3; 
 Wed, 14 May 2025 10:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245368; x=1747850168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=ihRKsoZ6jolX+DiEADOMJrq5v0gSy3A2UH/BsZfImYQUFXUZqahVl4ncHOYFZXp9mq
 mq2ZXOw4RvPwDonVy9q/h6x73iT0ZtTf0ADQXyb0brr9pPxHwdyw+61jlTq3ro7RyyBJ
 RhX/IZOGHiXf3c3qNy/DaAbHdN+6PDcfa0q2kG7mLrUpCIBf4SLrbF8AHk3GaJdk3RFT
 SFatfLa/e5PWpmk1osKO3icMpagdKjhdfwMMo81pmHw46vHgSBjmb2CIRFghIX0I5zcD
 +Do06BJY3dzaG8LsAhy8CSYr2bLdvngusLKSzZt9YrfL88LK9bSfxrZWuYAzWnAxGxsZ
 ZjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245368; x=1747850168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=hAhanFIT4rjcY9z6lRZ9i0kNrBj/SVjHQ1de95tnNxsgh45P66IyWdeKKsDDlTc3oE
 zbChNtWnj0eDR0l73NEhvIm3oJHOcBfbLbiShXm6FlAKXtK3b6vkP+Rolz9v1eRpfmZr
 G80Zla7/IaVn0GA6eULdCYJGDF//eYg0nwT+kxFaPr4WZW2sqtjNMXOj04gWSWAbtcXX
 a8vDsY6esAnKY+hPOjCfYL+jr1XslTqH4x3knqKsbHL38DgL4JGKKFgW+i6poqY36tHs
 5+HQF0lS2ikwCRhdGSB5+4TDsB1PYDx89kMqngVcu7AVYy4+pzsiC+m6C00cSJKggyTz
 PVdA==
X-Gm-Message-State: AOJu0YxVJTaP/17pUJ/CPW0aWvNsFVi6ChW2JbNe+6HoL6o7HoaeQocU
 cJwfu6k5zmKWI/AE4e9t8vbB2rX2vjlyyOdbEUhTCatcC6KzXb1b2NEYIw==
X-Gm-Gg: ASbGncsh1kEyDj95n60qegFMnMFLRmm5DGQO458xHloka7wKxd/lNLvZ8uv8+x9Qwk4
 H2b+mlex1qoeTKizMABe8eAZuZzyq9DgcS87pJ5mS1jIu1F+bttHhfWOA18Yx9IYzyIqd64hUNO
 Py7JSe7Wcc1uVIjdhCly4zolEHGa8H4GID9bbadhfiaMNAhVTWjrrWiF6guakT6UpzmsFO+pXwV
 CaW/WyyVLazZod8m38Gh1iWuTCIaFtKkAV91ThUiHr+LqE7qImSiBe1ociTlN5nHhREr5uRfpqe
 XXu/jJApoNkpHAusTQ/mtNo65uO+jVTQfx/lrXbCmhfry8l/ug2IobHfWNbe8KVZCHQ/xSKdGmH
 SgNmG6VBglhnU29j/ohwZ7nPisQ==
X-Google-Smtp-Source: AGHT+IE7n0jebqOlgwRPE2LUvYLUPAwTqXWpIJ7ipoSw5YEY/SB87+s03wgUzFLD+0FVJpu56LFyoQ==
X-Received: by 2002:a05:6a00:3311:b0:740:9e87:9625 with SMTP id
 d2e1a72fcca58-742892415ecmr6676004b3a.4.1747245367546; 
 Wed, 14 May 2025 10:56:07 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a8972asm9672212b3a.157.2025.05.14.10.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:56:06 -0700 (PDT)
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
Subject: [PATCH v4 07/40] drm/msm: Improve msm_context comments
Date: Wed, 14 May 2025 10:53:21 -0700
Message-ID: <20250514175527.42488-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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

