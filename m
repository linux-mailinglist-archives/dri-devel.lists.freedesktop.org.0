Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B931B7DC124
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 21:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B3110E36D;
	Mon, 30 Oct 2023 20:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B01B10E103;
 Mon, 30 Oct 2023 20:24:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UJccM5001717; Mon, 30 Oct 2023 20:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8/IXR+VYH9jBgS7uk0V1hyfyZIQcMPYL0rNFFCg0wpQ=;
 b=ZJnim/B3SNYHc/Bxif5DMNbuIiH4cFJLQ0i6FMKP5Cj1PmqDzjAHm3n55HDXhiZwZ/vd
 w8xwAFLwvV0JwQorC99jI5F5KPa0037CYN8nv7E8VOWFz/RwSmRiB71xR8A4eyH32gmQ
 kLY1FcUQsbSMjyxCGgZOItsZGgGuHFBp1grR3DDC3I2BbWQGpHJx33146jI7LOBi4ovD
 d6wEJ8rtLvS5vxk7CuOccqFvPqdIiuaIX0mTT9JQ65AdNxDb6vgRARNdBXo9gL7GdFJm
 AoCz3eGBN1e+dWlE2aPWdgz/fEVnnU/JKXVbHDSaw+cIm2tfkjlvGuzcNP0r7SiHLEJ5 4A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2c4rs5ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 20:24:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UKO3tI019400
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 20:24:03 GMT
Received: from [10.110.97.66] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 13:24:02 -0700
Message-ID: <c2f7733b-bfa3-a8a6-6909-5da26cd513af@quicinc.com>
Date: Mon, 30 Oct 2023 13:24:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3,
 QSEED3LITE, QSEED4
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
 <20231006131450.2436688-10-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231006131450.2436688-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: miEcOsHpLciahJEJP2ARMpXzwpZS6yTp
X-Proofpoint-GUID: miEcOsHpLciahJEJP2ARMpXzwpZS6yTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 mlxscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300162
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/6/2023 6:14 AM, Dmitry Baryshkov wrote:
> Three different features, DPU_SSPP_SCALER_QSEED3, QSEED3LITE and QSEED4
> are all related to different versions of the same HW scaling block.
> Corresponding driver parts use scaler_blk.version to identify the
> correct way to program the hardware. In order to simplify the driver
> codepath, merge these three feature bits.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 +-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 9 ++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 3 +--
>   4 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 32c396abf877..eb867c8123d7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -31,10 +31,10 @@
>   	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>   
>   #define VIG_SC7180_MASK \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>   
>   #define VIG_SM6125_MASK \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>   

This merging is coming at a cost of inaccuracy. We are marking sc7180 
and sm6125 as scaler_qseed3. But they are not. Let me know what you 
think of below idea instead.

>   #define VIG_SC7180_MASK_SDMA \
>   	(VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index fc5027b0123a..ba262b3f0bdc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -51,9 +51,7 @@ enum {
>   /**
>    * SSPP sub-blocks/features
>    * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support
> - * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support
> - * @DPU_SSPP_SCALER_QSEED3LITE,  QSEED3 Lite alogorithm support
> - * @DPU_SSPP_SCALER_QSEED4,  QSEED4 algorithm support
> + * @DPU_SSPP_SCALER_QSEED3,  QSEED3 alogorithm support (also QSEED3LITE and QSEED4)
>    * @DPU_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
>    * @DPU_SSPP_CSC,            Support of Color space converion
>    * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
> @@ -72,8 +70,6 @@ enum {
>   enum {
>   	DPU_SSPP_SCALER_QSEED2 = 0x1,
>   	DPU_SSPP_SCALER_QSEED3,
> -	DPU_SSPP_SCALER_QSEED3LITE,
> -	DPU_SSPP_SCALER_QSEED4,
>   	DPU_SSPP_SCALER_RGB,
>   	DPU_SSPP_CSC,
>   	DPU_SSPP_CSC_10BIT,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 7e9c87088e17..d1b70cf72eef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -594,9 +594,7 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
>   		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
>   		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
>   
> -	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
> -			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
> -			test_bit(DPU_SSPP_SCALER_QSEED4, &features))
> +	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features))
>   		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;

Can we just do sblk->scaler_blk.version >= 0x3000 instead of this 
merging? That way you can still drop those enums without inaccuracy.

>   
>   	if (test_bit(DPU_SSPP_CDP, &features))
> @@ -629,10 +627,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>   			cfg->len,
>   			kms);
>   
> -	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> +	if (sblk->scaler_blk.len)

This part seems fine.

>   		dpu_debugfs_create_regset32("scaler_blk", 0400,
>   				debugfs_root,
>   				sblk->scaler_blk.base + cfg->base,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 43135894263c..ba3ee4ba25b3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -438,8 +438,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
>   			scale_cfg->src_height[i] /= chroma_subsmpl_v;
>   		}
>   
> -		if (pipe_hw->cap->features &
> -			BIT(DPU_SSPP_SCALER_QSEED4)) {
> +		if (pipe_hw->cap->sblk->scaler_blk.version >= 0x3000) {
This is fine too.
>   			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
>   			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
>   		} else {
