Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72D6823AB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 06:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0BE10E31D;
	Tue, 31 Jan 2023 05:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD5A10E31D;
 Tue, 31 Jan 2023 05:13:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30V30iL2031822; Tue, 31 Jan 2023 05:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dp6TaI6YOeHYSAAdNvyDIAfBqoqGpZgIN2szVnJWjZ0=;
 b=AbXMZ4OeRH3/9gYGjZbUStfdKE5duies+HmBUZ3uiK3mE3fwHCWZJr7t9yHDhePUXqFw
 FhIKVHEZthY4cYcbbWHeP3beocfmXDXUO0/kPxpinXOnbqhIrjyHs9Hida7BU8Uhj8iF
 rEIpLU3gqWI3T9ieJDPS25JUVHXRxyjZjAydzjdUWKmbqyj8x+ee5Nu4bPBMziBNuThL
 5mA0/wpGCEyJK03IY6QmU0DivrZbRL2LY1DAm92FQ98otiSAIkKDsKOvt5qtHU1sBC2U
 yjuDj7WMTVp8FjH+0QadEZvqUnzFLgmC5fx0ovE/r+p+AwwVFaUSLpPLNd0c5XzHC7qB jg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncsdpwmf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 05:13:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30V5D3va005838
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 05:13:04 GMT
Received: from [10.110.114.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 21:13:03 -0800
Message-ID: <bbb6ff43-a432-c0a6-e108-7bf8bc170f52@quicinc.com>
Date: Mon, 30 Jan 2023 21:13:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 10/27] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-11-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221229191856.3508092-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: d2dDPQzwp9jI8IOmiILJvdePENBI542T
X-Proofpoint-ORIG-GUID: d2dDPQzwp9jI8IOmiILJvdePENBI542T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310047
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



On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> There is no need to pass full dpu_hw_pipe_cfg instance to
> _dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 7 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
>   3 files changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index f7f81ab08fa2..176cd6dc9a69 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -415,19 +415,18 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>   }
>   
>   static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> -		struct dpu_hw_pipe_cfg *sspp,
> -		void *scaler_cfg)
> +		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> +		const struct dpu_format *format)
>   {
>   	u32 idx;
> -	struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
> +	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
>   		|| !scaler3_cfg)

Do we need to check for !format ?

>   		return;
>   
>   	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
>   			ctx->cap->sblk->scaler_blk.version,
> -			sspp->layout.format);
> +			format);
>   }
>   
>   static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index f5aae563741a..c713343378aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -317,13 +317,12 @@ struct dpu_hw_sspp_ops {
>   
>   	/**
>   	 * setup_scaler - setup scaler
> -	 * @ctx: Pointer to pipe context
> -	 * @pipe_cfg: Pointer to pipe configuration
>   	 * @scaler_cfg: Pointer to scaler configuration

This doc needs to be fixed from scaler_cfg to scaler3_cfg

> +	 * @format: pixel format parameters
>   	 */
>   	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
> -		struct dpu_hw_pipe_cfg *pipe_cfg,
> -		void *scaler_cfg);
> +		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> +		const struct dpu_format *format);
>   
>   	/**
>   	 * get_scaler_ver - get scaler h/w version
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 172a2c012917..cbff4dea8662 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -677,8 +677,8 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
>   	if (pipe_hw->ops.setup_scaler &&
>   			pipe->multirect_index != DPU_SSPP_RECT_1)
>   		pipe_hw->ops.setup_scaler(pipe_hw,
> -				pipe_cfg,
> -				&scaler3_cfg);
> +				&scaler3_cfg,
> +				fmt);
>   }
>   
>   /**
