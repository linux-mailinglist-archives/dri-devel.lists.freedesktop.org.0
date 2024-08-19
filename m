Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCA09575AC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742A510E36A;
	Mon, 19 Aug 2024 20:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GzZonBwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB68210E369;
 Mon, 19 Aug 2024 20:31:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JB3KSn014962;
 Mon, 19 Aug 2024 20:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0/qn9fbreLj8/Fht6Qgc1geh
 nYOKnwESuih/Qy7Hv5I=; b=GzZonBwdwlXYGNG75phFde+zfTMTTz9TNJkjnLxt
 vGORUtBvlxSvpqMupfI+8R6FUGhiBzFzisGmEETPoJ++rOcC/+2YJxlr8mihybfF
 omTIXlAt2mc13m2nBJdpTkcmIgSVQfoxA2ngrL/ghbuha17iHIDa4iQgiNIgpqFY
 2+GiKhafIfvlKjy4Mcu2ILftce2jygGWoJm0HhLtWDbRc4NlhQZlD2HeYcmsrHPj
 69aSf7VOIzJCo1jqwHLZgFWxCNShxV3WZ91l0VGp0pstKFK3yrSxau0C9K9YNrOs
 xclpdPltPmln81/M6hx6uTxL3+7cxaSAlOB6WfMFbILeKQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412h7n5qmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 20:31:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JKVaQv017247
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 20:31:36 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 13:31:32 -0700
Date: Tue, 20 Aug 2024 02:01:28 +0530
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
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
Message-ID: <20240819203128.hit2csdpbbsybkoq@hu-akhilpo-hyd.qualcomm.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sQywXLhbu8vBOwauaCgB6YKXhPCfxsdc
X-Proofpoint-GUID: sQywXLhbu8vBOwauaCgB6YKXhPCfxsdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190139
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

On Thu, Aug 15, 2024 at 08:26:16PM +0200, Antonino Maniscalco wrote:
> Some userspace changes are necessary so add a flag for userspace to
> advertise support for preemption.

So the intention is to fallback to level 0 preemption until user moves
to Mesa libs with level 1 support for each new GPU? Please elaborate a bit.

-Akhil.

> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
>  include/uapi/drm/msm_drm.h            |  5 ++++-
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 1a90db5759b8..86357016db8d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -453,8 +453,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	OUT_PKT7(ring, CP_SET_MARKER, 1);
>  	OUT_RING(ring, 0x101); /* IFPC disable */
>  
> -	OUT_PKT7(ring, CP_SET_MARKER, 1);
> -	OUT_RING(ring, 0x00d); /* IB1LIST start */
> +	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> +		OUT_PKT7(ring, CP_SET_MARKER, 1);
> +		OUT_RING(ring, 0x00d); /* IB1LIST start */
> +	}
>  
>  	/* Submit the commands */
>  	for (i = 0; i < submit->nr_cmds; i++) {
> @@ -485,8 +487,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  			update_shadow_rptr(gpu, ring);
>  	}
>  
> -	OUT_PKT7(ring, CP_SET_MARKER, 1);
> -	OUT_RING(ring, 0x00e); /* IB1LIST end */
> +	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> +		OUT_PKT7(ring, CP_SET_MARKER, 1);
> +		OUT_RING(ring, 0x00e); /* IB1LIST end */
> +	}
>  
>  	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
>  		rbmemptr_stats(ring, index, cpcycles_end));
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 3fca72f73861..f37858db34e6 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
>   * backwards compatibility as a "default" submitqueue
>   */
>  
> -#define MSM_SUBMITQUEUE_FLAGS (0)
> +#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
> +#define MSM_SUBMITQUEUE_FLAGS		    ( \
> +		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
> +		0)
>  
>  /*
>   * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
> 
> -- 
> 2.46.0
> 
> 
