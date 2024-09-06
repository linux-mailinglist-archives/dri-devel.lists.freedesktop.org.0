Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D996FC8C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 22:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D7E10EAF1;
	Fri,  6 Sep 2024 20:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KYrdCm+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F5510EAEF;
 Fri,  6 Sep 2024 20:11:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868WQbk021072;
 Fri, 6 Sep 2024 20:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EV6+EYvyqVo/NojOhxcmhL9I
 LHynzi+QXQw6XNlyCPc=; b=KYrdCm+kBaNWiSJX0iHfvgColBj0TbjcmkL2jJba
 3MghOmMYWU566eJm/9KXAlOvkW4tdG4WqqyGfgFbT0FSMhrg0qZsVHtf+fHbXR5d
 WNM5Mze9HC4mifspTp9hKNyUfBtGCs3lZtkUqNimvOhBwpla9FRauJfMtvSi+WUQ
 t2vJuTf0vAh9D6II3B0K6tF3goO6lROu7c7P6f0jvkiIodYVwt9AC7d7j3UEzLi5
 aLvqmun1a0aB+tIEqOzR6okfl4sBdb83LqGD09ztMWrwVSkF5EcBTHGNnshVfgHB
 ZJWCW+G6s2axmg1g2fiVoLNCKsoHbPB89i4GtU17quXpyQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhws3ajw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2024 20:11:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486KBA8f009365
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Sep 2024 20:11:10 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Sep 2024 13:11:04 -0700
Date: Sat, 7 Sep 2024 01:41:01 +0530
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
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 07/10] drm/msm/A6xx: Add traces for preemption
Message-ID: <20240906201101.vccq54s4nmlmgeoz@hu-akhilpo-hyd.qualcomm.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-7-fd947699f7bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-preemption-a750-t-v3-7-fd947699f7bc@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sPdJv4uGTuf7V4czPRRw5RfKz49spxFu
X-Proofpoint-GUID: sPdJv4uGTuf7V4czPRRw5RfKz49spxFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_05,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060149
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

On Thu, Sep 05, 2024 at 04:51:25PM +0200, Antonino Maniscalco wrote:
> Add trace points corresponding to preemption being triggered and being
> completed for latency measurement purposes.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  7 +++++++
>  drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 ++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index ec44f44d925f..ca9d36c107f2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -7,6 +7,7 @@
>  #include "a6xx_gpu.h"
>  #include "a6xx_gmu.xml.h"
>  #include "msm_mmu.h"
> +#include "msm_gpu_trace.h"
>  
>  /*
>   * Try to transition the preemption state from old to new. Return
> @@ -143,6 +144,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> +	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
> +
>  	/*
>  	 * Retrigger preemption to avoid a deadlock that might occur when preemption
>  	 * is skipped due to it being already in flight when requested.
> @@ -264,6 +267,10 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  	 */
>  	ring->skip_inline_wptr = false;
>  
> +	trace_msm_gpu_preemption_trigger(
> +		a6xx_gpu->cur_ring ? a6xx_gpu->cur_ring->id : -1,

Can't we avoid this check?

-Akhil.

> +		ring ? ring->id : -1);
> +
>  	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>  
>  	gpu_write64(gpu,
> diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
> index ac40d857bc45..7f863282db0d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_trace.h
> +++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
> @@ -177,6 +177,34 @@ TRACE_EVENT(msm_gpu_resume,
>  		TP_printk("%u", __entry->dummy)
>  );
>  
> +TRACE_EVENT(msm_gpu_preemption_trigger,
> +		TP_PROTO(int ring_id_from, int ring_id_to),
> +		TP_ARGS(ring_id_from, ring_id_to),
> +		TP_STRUCT__entry(
> +			__field(int, ring_id_from)
> +			__field(int, ring_id_to)
> +			),
> +		TP_fast_assign(
> +			__entry->ring_id_from = ring_id_from;
> +			__entry->ring_id_to = ring_id_to;
> +			),
> +		TP_printk("preempting %u -> %u",
> +			  __entry->ring_id_from,
> +			  __entry->ring_id_to)
> +);
> +
> +TRACE_EVENT(msm_gpu_preemption_irq,
> +		TP_PROTO(u32 ring_id),
> +		TP_ARGS(ring_id),
> +		TP_STRUCT__entry(
> +			__field(u32, ring_id)
> +			),
> +		TP_fast_assign(
> +			__entry->ring_id = ring_id;
> +			),
> +		TP_printk("preempted to %u", __entry->ring_id)
> +);
> +
>  #endif
>  
>  #undef TRACE_INCLUDE_PATH
> 
> -- 
> 2.46.0
> 
