Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567706F9133
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 12:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D439810E25A;
	Sat,  6 May 2023 10:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AA510E642;
 Fri,  5 May 2023 17:19:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345DGtRO020948; Fri, 5 May 2023 17:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eXnTumCmKaBiYSzWdNEO0Czg2jm7I1DEk+7Ee/MO6gI=;
 b=RmLXcf/AxSvosLH2j2xcL6gXzKlKzXJHPgVkDKmq9HZSEG4X9qw5NsKaTMgN95RxRt0B
 vV6LGQu4x2MoHVkC8cIfi7tVbJMXEnycHOhhHkWLqD3DdMwr38zVSEEQ0mYttFOBjthN
 MW8qqlWNf5VRilfvdnsX2f5FVi6Rqa5dOKTeTPK2nmB2mEnURJ2vDVOPeEtyNMtmlj7y
 SVWcYBGp3TjMG4tG4QNkZ8b0vllWXq5kUju0vT03vBtNhmIo2Xiw2yiWPoiFBmfsv2jf
 XV1zOlEvxSbQ/HsK888/PK2CyKE6DFFvvcVBxide+a2CC1nFB6QvAzfnsnnqOk0PJtFa mQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qcsa9hr8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 17:19:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345HJD1o023332
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 May 2023 17:19:13 GMT
Received: from [10.110.37.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 10:19:13 -0700
Message-ID: <1620d378-dab2-355b-8699-83700df3fb82@quicinc.com>
Date: Fri, 5 May 2023 10:19:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 5/9] drm/msm/dpu: drop
 DPU_PLANE_QOS_VBLANK_CTRL
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
 <20230502150533.3672840-6-dmitry.baryshkov@linaro.org>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230502150533.3672840-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FfmIHUbEw-jKw7ZYrVIrWVbdeWLYTieE
X-Proofpoint-GUID: FfmIHUbEw-jKw7ZYrVIrWVbdeWLYTieE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050142
X-Mailman-Approved-At: Sat, 06 May 2023 10:33:25 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn
 Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/2/2023 8:05 AM, Dmitry Baryshkov wrote:
> Drop support for DPU_PLANE_QOS_VBLANK_CTRL flag. It is not used both
> in upstream driver and in vendor SDE driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  8 --------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 10 ----------
>   3 files changed, 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index b2831b45ac64..d47e7061a36b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -371,8 +371,6 @@ struct dpu_caps {
>   /**
>    * struct dpu_sspp_sub_blks : SSPP sub-blocks
>    * common: Pointer to common configurations shared by sub blocks
> - * @creq_vblank: creq priority during vertical blanking
> - * @danger_vblank: danger priority during vertical blanking
>    * @maxdwnscale: max downscale ratio supported(without DECIMATION)
>    * @maxupscale:  maxupscale ratio supported
>    * @smart_dma_priority: hw priority of rect1 of multirect pipe
> @@ -387,8 +385,6 @@ struct dpu_caps {
>    * @dpu_rotation_cfg: inline rotation configuration
>    */
>   struct dpu_sspp_sub_blks {
> -	u32 creq_vblank;
> -	u32 danger_vblank;
>   	u32 maxdwnscale;
>   	u32 maxupscale;
>   	u32 smart_dma_priority;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 731199030336..b198def5534b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -697,14 +697,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>   			0400,
>   			debugfs_root,
>   			(u32 *) &cfg->clk_ctrl);
> -	debugfs_create_x32("creq_vblank",
> -			0600,
> -			debugfs_root,
> -			(u32 *) &sblk->creq_vblank);
> -	debugfs_create_x32("danger_vblank",
> -			0600,
> -			debugfs_root,
> -			(u32 *) &sblk->danger_vblank);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 586f089756fa..3cb891917b65 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -73,13 +73,11 @@ static const uint32_t qcom_compressed_supported_formats[] = {
>   /**
>    * enum dpu_plane_qos - Different qos configurations for each pipe
>    *
> - * @DPU_PLANE_QOS_VBLANK_CTRL: Setup VBLANK qos for the pipe.
>    * @DPU_PLANE_QOS_VBLANK_AMORTIZE: Enables Amortization within pipe.
>    *	this configuration is mutually exclusive from VBLANK_CTRL.
>    * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
>    */
>   enum dpu_plane_qos {
> -	DPU_PLANE_QOS_VBLANK_CTRL = BIT(0),
>   	DPU_PLANE_QOS_VBLANK_AMORTIZE = BIT(1),
>   	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
>   };
> @@ -361,15 +359,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>   
>   	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
>   
> -	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
> -		pipe_qos_cfg.creq_vblank = pipe->sspp->cap->sblk->creq_vblank;
> -		pipe_qos_cfg.danger_vblank =
> -				pipe->sspp->cap->sblk->danger_vblank;
> -		pipe_qos_cfg.vblank_en = enable;
> -	}
> -
>   	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
> -		/* this feature overrules previous VBLANK_CTRL */
>   		pipe_qos_cfg.vblank_en = false;
>   		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
>   	}
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
