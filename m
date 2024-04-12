Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8253E8A367B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 21:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F110910E182;
	Fri, 12 Apr 2024 19:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EdnGm+7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D7510E182;
 Fri, 12 Apr 2024 19:47:32 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43CEMj2o007544; Fri, 12 Apr 2024 19:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=IZzstnZgSRevNWo7tzbcR4Kxui1W803aC8fJ7RM9t48=; b=Ed
 nGm+7OH5Tboq7imjGb0JjNSJtIyeqls73F6quVVAP2aM7fZfevUjvj1sjhnDfiHl
 8si0zG4bfrkSVKK4YFvSmbK7PmL6HhaIv8aOBLXO2iVBw6aBtxwBcm7DuwCW/iTs
 9j9sm30OPpgKRRGKThSJf5y5oFFLgKe4CWozH6hFS9tCUJfYG5G2kfRCkVh1fgdI
 jPUzaW8fWJlvWWfaQp2oHwulq2TyppV8gssWZ3x8wsnSqDkG6YA5Iv/IMdMoBcLC
 fo+YHie+ystyiZ22hU/r5AZ750LEUcf0MZl4GZzh5OH3gc9r97Rv41WFOXPQ/v+P
 oURs523qOE9B+Grc5iKg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xf0uw1st7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Apr 2024 19:47:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43CJlOHf019498
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Apr 2024 19:47:24 GMT
Received: from [10.110.81.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 12:47:23 -0700
Message-ID: <6ed5bb25-979e-bb48-3dfe-4af581bb5dd1@quicinc.com>
Date: Fri, 12 Apr 2024 12:47:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 11/12] drm/msm: merge dpu format database to MDP formats
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-12-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BFZqlp-R-AUWSzvUyHSXAl5PRCmRCWsT
X-Proofpoint-ORIG-GUID: BFZqlp-R-AUWSzvUyHSXAl5PRCmRCWsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_16,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120144
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



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> Finally remove duplication between DPU and generic MDP code by merging
> DPU format lists to the MDP format database.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   2 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 602 ------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  23 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  10 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   3 +-
>   drivers/gpu/drm/msm/disp/mdp_format.c         | 595 +++++++++++++++--
>   drivers/gpu/drm/msm/disp/mdp_kms.h            |   2 -
>   drivers/gpu/drm/msm/msm_drv.h                 |  12 +
>   10 files changed, 549 insertions(+), 706 deletions(-)
> 

I cross-checked a few macros visually (not each one) and it LGTM in 
terms of just moving it from dpu_formats.c to mdp_format.c

Even in this change I had the same concern about whether to use MDP for 
dpu formats.

But I think even if we make it MSM_*** then we will have to keep them in 
some msm_** header and not mdp_format.c

So lets go ahead with the MDP naming which you have. If we see its not 
working out later on, please be open to a mass renaming that time.

<snip>

> index dea6d47854fe..e7651a0e878c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -267,6 +267,16 @@ enum msm_format_flags {
>   #define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
>   #define MSM_FORMAT_FLAG_ALPHA_ENABLE	BIT(MSM_FORMAT_FLAG_ALPHA_ENABLE_BIT)
>   
> +/**
> + * DPU HW,Component order color map
> + */
> +enum {
> +	C0_G_Y = 0,
> +	C1_B_Cb = 1,
> +	C2_R_Cr = 2,
> +	C3_ALPHA = 3
> +};
> +
>   /**
>    * struct msm_format: defines the format configuration
>    * @pixel_format: format fourcc
> @@ -305,6 +315,8 @@ struct msm_format {
>   	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
>   	 ((X)->flags & MSM_FORMAT_FLAG_COMPRESSED))
>   
> +const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
> +
>   struct msm_pending_timer;
>   
>   int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,

I am now thinking that do you think it makes sense to move all 
MDP_FORMAT macros to a new mdp_formats.h including the RGB/YUV bitfield 
macros (even though I already acked that change).

Instead of bloating msm_drv.h even more?
