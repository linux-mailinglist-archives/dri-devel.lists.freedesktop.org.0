Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558ADA69144
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB7810E512;
	Wed, 19 Mar 2025 14:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CPVBeJXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C12710E51F;
 Wed, 19 Mar 2025 14:54:58 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-223fb0f619dso120179465ad.1; 
 Wed, 19 Mar 2025 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396098; x=1743000898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EO2+o/bsNNfbxQWZXTYcMl0sTaN+Gj3FBJ3RecW0vNY=;
 b=CPVBeJXiJoWYhoOFoE+Xh/EQjAeO2iDQFQGOf9vLmfHWfJ/O399ExwpG82mBIwk8oN
 2PLUll/0b5ujFSI7/+fLDZugMXJWsT0HBmbRV61ouoqGuUC/YAHQrWbyJHvHARCtMnfp
 IqPFVhPYfpLAl16PA6LbjwcHNfR4Ig2hxuSHhkQfl1ZVSYVOhZ789jnQDimTvrbHYscX
 4gG4483WQJCZLbyA/mKqKAmTZ6c2kFVrgukfxn/7AM9w/R4Jzl+wk3n4WW1RJnHkVcHc
 +ke2yRS8978Pke4UPJSut6ISu111eG9KuKBbfVbssuE6kkcl6kvTtzxXTUrjn/nwgXWf
 uNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396098; x=1743000898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EO2+o/bsNNfbxQWZXTYcMl0sTaN+Gj3FBJ3RecW0vNY=;
 b=eJQk7hnU79MONHAPyRS5P/SbWQHeYe6b+5rmQgpfqcvZryU0BlTw4jllq0+8CBNGr5
 TkblebBq9RhpHchwjvWqUBf0IOxSFlfhYeASdr0yjdmjR+vhwGcz+/E8kk0PS5eGQZE8
 F1aL/+tem/efv2DJqHrTtHlbZ7NdNRQJprdjLm95yXzXzTx//crswfGrGrCFwTVpGmKj
 7WjZuZSo7vZNbIBR1xdXwgT/fB5p+6zoLJQWF52AIUXgiwUBnSledI/qrT7xkPm9mh2o
 gE8raEJNFhAiIL+ch0huq+p3dCpkxFdfWUDUCvzoThnSh4ksTrnsLb6ouaO7vm7aullP
 0RQg==
X-Gm-Message-State: AOJu0YxdFpkdskkSqMLCzOqHA/cxcKKlEM3V1utAF1vBh4i+FNMtw919
 FGMD1SeeDsDim2ptkUdT0pFWl98CK2bG/C4EqCyu0/kO/otQZaBcK4LRzQ==
X-Gm-Gg: ASbGncuDFjdfIeqd6Hh2/zxRiTeEpulBtH75SQM5Bn4wQcW1k3ElBfFXi6XXd483n/W
 XNlvFhz98n98pb6dSI5TrfI4xprOtJnHJqxy3Q+whaxQ7rvbd7XvB5EgVOY0RfUhEgm0U9aWWXu
 hA8Ys+FpcDHugqZYyKZalrFvF5hZxm1rPqrEAdTZ3JUhhag5+MRDtD6e2clEbdD8KXpglYUEmvD
 jldF5nVqwIb0O3aUIDFOT+DadUcVDRSNwafXHobOhlCMRto6ATjjF8NxaaODilvjHGRYcS3d70Z
 04SLYJtGS60CTKyzCOIEbfnHC3An3JjwcAZfsp4nCSBuZjNgLzpzRWe7fagowbHdqWn3S6Rsz9I
 +9V3/24xDw1uyHbgW3YU=
X-Google-Smtp-Source: AGHT+IEIogLZO/OYsi4tDswh4850btgV4QdRo63x6gQecFtgoLCxLPv2jMPjlPAUKRtjjDj1a74OzQ==
X-Received: by 2002:a17:903:1ce:b0:221:78a1:27fb with SMTP id
 d9443c01a7336-2264981b453mr42186515ad.11.1742396097638; 
 Wed, 19 Mar 2025 07:54:57 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c688d9eesm115018435ad.35.2025.03.19.07.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:54:56 -0700 (PDT)
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
Subject: [PATCH v2 06/34] drm/msm: Improve msm_context comments
Date: Wed, 19 Mar 2025 07:52:18 -0700
Message-ID: <20250319145425.51935-7-robdclark@gmail.com>
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

Just some tidying up.

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
2.48.1

