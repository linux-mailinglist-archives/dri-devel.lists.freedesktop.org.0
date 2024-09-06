Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DB96FC72
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 21:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6352310E0DA;
	Fri,  6 Sep 2024 19:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZAX9IDts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D2D10E0DA;
 Fri,  6 Sep 2024 19:59:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868bKrS032623;
 Fri, 6 Sep 2024 19:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Zt507ZHFDfzedyXzu22TpCuT
 P2uqvDlAPwSVymVUgFE=; b=ZAX9IDtsSWIzgZVn5RtEqHViqW2xh2302vFWAli5
 yH8jccYbE2yoT56Wzrx2Aiu33/tM2y5/QeqLUAvvagNIv/HZ1LPBPFyPRHTmh91n
 8bJthYkW0lA/Irf1PFVAKARjtlox6o59hX0JRHDgIln8AiIcu6aKicydRYnla+Mu
 FA6WA69ug91Xkk0bfaahoEvzeLtv0VllIBubpmv37mJQQ7ZsVtNsVRHIm6U1k7xb
 oGTJzl5VSf+PtnqpIzTfhZs7Ro1vRdQcB9GB/f12XcNzUsQXPqilOCAZjPUsfrK4
 qm6s+ZddLwOen1rKgBjjdb7knbQ9nCNQYur9++i9z1N5ig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwtbd1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2024 19:58:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486Jwbq1013137
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Sep 2024 19:58:37 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Sep 2024 12:58:31 -0700
Date: Sat, 7 Sep 2024 01:28:27 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Antonino Maniscalco <antomani103@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH v3 00/10] Preemption support for A7XX
Message-ID: <20240906195827.at7tgesx55xt6k5o@hu-akhilpo-hyd.qualcomm.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hoGYOpE9cYrrEVUyexwaPX9pxulLSWf-
X-Proofpoint-ORIG-GUID: hoGYOpE9cYrrEVUyexwaPX9pxulLSWf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_05,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060147
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

On Thu, Sep 05, 2024 at 04:51:18PM +0200, Antonino Maniscalco wrote:
> This series implements preemption for A7XX targets, which allows the GPU to
> switch to an higher priority ring when work is pushed to it, reducing latency
> for high priority submissions.
> 
> This series enables L1 preemption with skip_save_restore which requires
> the following userspace patches to function:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> 
> A flag is added to `msm_submitqueue_create` to only allow submissions
> from compatible userspace to be preempted, therefore maintaining
> compatibility.
> 
> Preemption is currently only enabled by default on A750, it can be
> enabled on other targets through the `enable_preemption` module
> parameter. This is because more testing is required on other targets.
> 
> For testing on other HW it is sufficient to set that parameter to a
> value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
> allows to run any application as high priority therefore preempting
> submissions from other applications.
> 
> The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
> added in this series can be used to observe preemption's behavior as
> well as measuring preemption latency.
> 
> Some commits from this series are based on a previous series to enable
> preemption on A6XX targets:
> 
> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>

Antonino, can you please test this once with per-process pt disabled to
ensure that is not broken? It is handy sometimes while debugging.
We just need to remove "adreno-smmu" compatible string from gpu smmu
node in DT.

-Akhil.

> ---
> Changes in v3:
> - Added documentation about preemption
> - Use quirks to determine which target supports preemption
> - Add a module parameter to force disabling or enabling preemption
> - Clear postamble when profiling
> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
> - Make preemption records MAP_PRIV
> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
>   anymore
> - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com
> 
> Changes in v2:
> - Added preept_record_size for X185 in PATCH 3/7
> - Added patches to reset perf counters
> - Dropped unused defines
> - Dropped unused variable (fixes warning)
> - Only enable preemption on a750
> - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
> - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
> - Added Neil's Tested-By tags
> - Added explanation for UAPI changes in commit message
> - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com
> 
> ---
> Antonino Maniscalco (10):
>       drm/msm: Fix bv_fence being used as bv_rptr
>       drm/msm: Add a `preempt_record_size` field
>       drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
>       drm/msm/A6xx: Implement preemption for A7XX targets
>       drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
>       drm/msm/A6xx: Use posamble to reset counters on preemption
>       drm/msm/A6xx: Add traces for preemption
>       drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>       drm/msm/A6xx: Enable preemption for A750
>       Documentation: document adreno preemption
> 
>  Documentation/gpu/msm-preemption.rst               |  98 +++++
>  drivers/gpu/drm/msm/Makefile                       |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 331 +++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 166 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 430 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
>  drivers/gpu/drm/msm/msm_drv.c                      |   4 +
>  drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
>  drivers/gpu/drm/msm/msm_ringbuffer.h               |   8 +
>  drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
>  .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
>  include/uapi/drm/msm_drm.h                         |   5 +-
>  14 files changed, 1094 insertions(+), 42 deletions(-)
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240815-preemption-a750-t-fcee9a844b39
> 
> Best regards,
> -- 
> Antonino Maniscalco <antomani103@gmail.com>
> 
