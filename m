Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE6BAB722A
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E12010E6AC;
	Wed, 14 May 2025 17:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IiGRFnap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D62210E6B4;
 Wed, 14 May 2025 17:03:29 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7390d21bb1cso107409b3a.2; 
 Wed, 14 May 2025 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747242208; x=1747847008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=IiGRFnapC9FBwdG+DauKYwa3G7uG/2FgGJFDqYViXzcOj3LcQDTd6J4Uf2/U+NLurG
 KIT9JOxhV4IU2MIY9Vt/qfQhkis61UOZm9qLTYUy2+oR7DbWTz3B7mkaPsGrinKa826C
 KbCx6Oon8jKH8vrj/7beuHfKEH8mcDIaZyKDt6AyXDkDDmFLmEoOolRqhDU79K7jMnX4
 Bsnmap/41aOoe1Ds32lwcxll8AGb+bFgtc9PPVV9odY5G4VHc9Fg5cvQNleEaJWhpume
 TNfbpWbq7CoNjl3Gal4MBQX8oGG1whlPrD8t/SpBOm85rW8Lfqnp18ID0tnxSlzYUcP4
 2WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747242208; x=1747847008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
 b=lE3sIl8VtpB4P7yFIbaKN2aij6S+vNaO/0rYGro5UWKZP0dlGRjz7YTymJdjrSbitU
 yRVAKYfL5rUi99/TOslNM8KrBgaDUbmtkm4pGm192/cNI5oK3om0cfwZct4OqogROtDb
 0AXvz4a+C4bbA6wEXbMwdtJZ8ZdP5aNhxLjH5JcFrBffVlzWysHuTfdsn4elgF+ZZUbQ
 +K/bW0hU2B3Zvez0uZhIhsUvsIROqDKy17YtCQVv4vWDCT4KaEeHF90xRt7Lz282f7iL
 tcVnZlvkF1QtNr19WxmGhaxFP8jmzS2iTHJEiJ4hxSBWdj0UbFooagq590tU21c1zwFx
 c/+w==
X-Gm-Message-State: AOJu0Yyg+IdO67YECoSpvyYzIzOYf8FL2w8npFHGsUwEEknEJuNRWbVL
 MD3VbLeASVHmd+aPtSEpHFtcWECLrTapWU6gn52iGmt8Vee4e8i+ZX97Ew==
X-Gm-Gg: ASbGnctkhEvxqe/KN3KVGREp9Pqvqm6ec1mteez/2JcB6zf6wnFhWPPUXSyg0+CBapx
 CN67gQiUZUKE4OTH9PZ6j7kN6gtjvPrBhFQ7znTnKc11SgYi8K6UB2mVBnbNZ3ZULwQ/r7QJCdQ
 HHav9l5w9tCjz/2cghk6QyTat+NzMJ4vRM+tBL4FdhgUUQSZKfgTLGmt1PDOPPk9ZDZTSYsAj7S
 ezT2zrJfQdw1pZLRjycM4qA3+cLbwtX6hpOkouob0z7OMccKCtCjrs44rNFOL859636+RyDoyfY
 pco/HvVuLsSYmxNVpov10zEai+vXOemR8t9Jz8nLYWHkPz3M1hmziMgBJ8WCSlYFJGi8fAVqskO
 NRVFGq704RAl31ZPqnZcPJbdrCQ==
X-Google-Smtp-Source: AGHT+IGyGypLDfWhQ9d87DuR+AeAXFJ8JA+bXc2NjVqwTDBTjF5ZuSSNFOGM71st0gVYaB1usT12QA==
X-Received: by 2002:a05:6a21:398c:b0:1f3:3ca3:8216 with SMTP id
 adf61e73a8af0-215ff0abd4bmr6121172637.5.1747242208106; 
 Wed, 14 May 2025 10:03:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b234af2bf21sm8009353a12.42.2025.05.14.10.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:03:27 -0700 (PDT)
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
Date: Wed, 14 May 2025 09:59:06 -0700
Message-ID: <20250514170118.40555-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
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

