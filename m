Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034979E809E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7215B10E418;
	Sat,  7 Dec 2024 16:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vb2aBq+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9515010E321;
 Sat,  7 Dec 2024 16:17:24 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-21631789fcdso2085795ad.1; 
 Sat, 07 Dec 2024 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588244; x=1734193044; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/byccYmBx9GqheY7o02LLjac0bcvN34+HChoq7opjUQ=;
 b=Vb2aBq+xMqi8SODGlHRxOvBF9nGc21q+6xfRpB1gRXKt+LIgI+NCvBoNQdC4o1eYIN
 USwg2+UFuHL4LAf7iNdVYZaOoR0U8xSzU/5d5tSdxnBq4LjsBWDNKd5Hx/M2RP6XPV+Y
 lwbEd++xYqzpntuIKDWLQW2XNlx34nbC27prDKlisQlTCluZPIjv7wKAihHrn6ueEKyu
 0GfNp7WhShsacy0p4aAC/DmuwoZVJT2bvLitFInkn82L2qKi+ImZMUn2uOG7Gia2l3y4
 n3Z8w7oddo4qHYFP6qCbKfn05/ceEfPEuandZ0KDvRgHibPxQMJch48kZqgliKn71ADQ
 Ijsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588244; x=1734193044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/byccYmBx9GqheY7o02LLjac0bcvN34+HChoq7opjUQ=;
 b=GbvTNPYVaz86tbJGy0CnHHZdgjvOo7/oXm6XC++kEgYgzhYQn4gqfpIhy2N291kZuG
 0tNld0Xw0i1stL3yE02BkwWyHt10BVr7edXIFQz4of874dSMxrS4HychDTjGWy+d98sC
 S6M/T5CMtS7MzoA3rgnKQ9rHIktq1Q2mZd3vZKeMO+/AX8PH1bky50ByXrqb6A5Qc8xY
 OkNuE0s0ByDileJgkBAgGT8TL4aYHozYGYeZ6UvcuD2D9Jg2vl7qsQW36GmWupUhNqrK
 dVFFwem0grocqC0L4N2oQoQU/WbAMEXFveVVt9QscUEsrW4zjNgfMjEYPxfFCyzEQlG1
 gxGA==
X-Gm-Message-State: AOJu0YwtxCitV/ZuE/ZXOGO7VmikPnebw7+5gpq4hCFibDPLCjIgMUFo
 EVnwtnjXYEEgsqKxQuJ1LbyYx8rMd/cFZrjm1m/K0IdNCHk0dZshK8IRhA==
X-Gm-Gg: ASbGncuC1JDMETI5b5HwD5dhheTeUcuPwE2wh2P7+Dfa+sN/Jyn6lPCJGqGVd/ZeEHk
 Pl/TA3YTgpw2+CzSvq5/vl5H4jpFQQ/IVcjDtVytY+9Nklau9Ekeb5XifstnNSCNm2CMoEqd+nJ
 0JvZn/Eq1TefJhfkDKG8jSSVUjhCyfU0GOucrqhaNyqCXSaG19zHWRCbtnTx9bLZE8kExbcwTOG
 R6WUyfMQ2ox0oK9nGjfK13XhGvkukcJOJAlKhJfoJO+5ByxMRG7ytgWRFUmzUPKSHXSmUkLbw1/
 Khh7ncD1
X-Google-Smtp-Source: AGHT+IHf3FRKOfTROzUO93B5FqsgYxWePs7Ij4IlbmL7knPOJXeOyJEigaHOrxxp4IxYJ4ZweYxOCQ==
X-Received: by 2002:a17:902:da8f:b0:215:8847:4377 with SMTP id
 d9443c01a7336-216112fb5e7mr114122425ad.15.1733588243660; 
 Sat, 07 Dec 2024 08:17:23 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21631bd2c2dsm9974905ad.263.2024.12.07.08.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:17:23 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC 05/24] drm/msm: Improve msm_context comments
Date: Sat,  7 Dec 2024 08:15:05 -0800
Message-ID: <20241207161651.410556-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 76ad75f06706..01a3b2770d71 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -340,25 +340,39 @@ struct msm_gpu_perfcntr {
 
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
@@ -376,21 +390,21 @@ struct msm_context {
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
@@ -398,7 +412,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -406,7 +420,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -419,7 +433,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.47.1

