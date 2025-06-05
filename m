Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13352ACF6A1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 20:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A09E10E83D;
	Thu,  5 Jun 2025 18:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0iRk1uN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B0210E31C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55597JPf004137
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=iz489B2Vnt2
 sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=; b=F0iRk1uNT/wx0mzuCe7xK/aMnDy
 vhMRE7SuFAmZZQuUWa802yiJynMvI6vtkWKAefljtPIeMsJpEYEp6wUNCFhICZ36
 SYxZBJoBcQc9UoMlmDi/hOs3Rx66DBHahSAfucZso9Cu5MMr8/FImGGwwtZO0+gy
 0pjWyjr+ZqDsEPwtQOeT8aoEGluB82SJIseTJ2pxfKKve4eXCCwe64iSPfUexcX3
 gGsBjg+AOxJr4SZ2YYlBKpVrQxBBPxr9yPvYdcIKcKwFgasIiAqzDqjDFs1bct4R
 h68mp/8X1E//Yg4oh02W72BYXK/6/8emxlWAU+z5QH3VsRfWwyH3EcywW6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta9g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311f4f2e6baso1460707a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148332; x=1749753132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iz489B2Vnt2sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=;
 b=iH9v7rtGXqmSWGJ/qbVwokijbuAtZpdQU221n8wQ9629XYEkb9vZiEumGQBAeIU93f
 Qw0Z4YtDBUZCTYAl1URRsA0T45pDsXRO/0RiNcjDfmnjniDoLKUDfJ4zX1h+Qsh37QIz
 6Zgly+ALP9oDxeVXd9IVSQz6od7VWKBs9ypW6UkD8GNlHiAvztBhLOCb6gpa0t88XLKi
 oyP9eN8dZScC0ksH0JL6xooCtz+4ixkUpXB0bFmNhWyLnYiQU1X2rkMY6C9XcS01RVwE
 Ap5VFBEDzLZEvPRBZAzwYSvLfRiJ+CHuM5xMTFarC0k3UqW4MXkXmeQ7zgw+ZNB/CxkA
 2w9A==
X-Gm-Message-State: AOJu0YzVO4C45RLavQq2IXwU1EX2CZkj0+RH+nhcm8iQl09S5tZQ6494
 4GNHACPp7zcSjmP1RrYrn2Zvd2Vj50FlXkzCord5NkMrhmlpGcthiqmavg2h6447EzmJFjRt9i4
 gIxle8SKjTQY8Emc7HxoPuVTkQ1aGC/Jcw6+BvsVPcOT2NP9W+vacO/DZvqwaPx24+XksuIwAek
 Adcds=
X-Gm-Gg: ASbGnct/8QuahE46kttu81T/ol2Qyt4OkepWSL4oydg09FAXmgYWQS9aF/GcfPqJuik
 F/v/Tgr2zzsIsLc4lPtDl9cB7Fw7mOk407ZNeSSCaw5q6sb9cesjSfLDIFbH837TTvdvKWRjFTw
 ZktBUIsjbIrqX3QYv/hfeNaWhjSn2T0EdGAQq6JY16bqiq3XZy/orBTq/1VMn4m0m/7T6LOqoMJ
 dKCxvxhNURYDhIYx2GwwzEHz9x7lMzYoLDkteXo9dmt3ZvItg88oaNE3/ud4aHGd74IZ+DqP4At
 s4IyZwxhrNOLwpvK1tQuWA==
X-Received: by 2002:a17:90b:4b46:b0:312:b4a:6342 with SMTP id
 98e67ed59e1d1-3134788faefmr998035a91.33.1749148332195; 
 Thu, 05 Jun 2025 11:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiKBDew32EdipW62Q0cflXApQbfZYLbCKMDJJCflNU0zpokfB0+AAOj2B64JXMPgxhpvo9fg==
X-Received: by 2002:a17:90b:4b46:b0:312:b4a:6342 with SMTP id
 98e67ed59e1d1-3134788faefmr997991a91.33.1749148331774; 
 Thu, 05 Jun 2025 11:32:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3132ad9a4aasm1558718a91.1.2025.06.05.11.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 03/40] drm/msm: Improve msm_context comments
Date: Thu,  5 Jun 2025 11:28:48 -0700
Message-ID: <20250605183111.163594-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841e2ad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=t0yPb2BRG13ODCZxGvcA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: -gjOlfunZEyMWnR2JWh1CnKIwb8ggfrW
X-Proofpoint-GUID: -gjOlfunZEyMWnR2JWh1CnKIwb8ggfrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfX66wwnYFwFRzd
 Tt0WbQFK9p8+nk1Yhy/ESjS0BAyWXXv35n0y76v8v49TIZlrdkpL5dMN0f6xreIMTYa0DkNO9UU
 aioRwFEXuSwkn9zQA3xnV9OheOVUT5RiLQvloJ98HN6S9eXpV3fS3w0iU263BXIGj8nz16MHZ7n
 dsNlJZDK5wCvUAvMzccNz5HX+0xYGqTNxoKtiPBQpHDruLnv9weKyJGGPtT9fHljfAzfMyTy7sz
 K/+Qo4Uq5hqOzKe1j4ibAR90Bf4y/UzaDPqhCA/R9KJ+qXwaUzCEbmQz2qWlEZH/GTCAVVIXMpL
 Pt5HMo1qkR0chDpFiy4mblYR5S7XarzmuYzGQVTC5xzfMSG1Sk8KCLUnlYhQzsLwL0FkP4/F4v3
 eS4YnXVHUUvuRqXwpYK22k4cPqT7koolVcCWmmTi+6DECHOlhdmzrtVgvBlMtxmzoQdGzX1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163
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
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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

