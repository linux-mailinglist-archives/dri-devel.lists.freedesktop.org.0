Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99768A31C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 20:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184E10E8C0;
	Fri,  3 Feb 2023 19:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C722A10E8C0;
 Fri,  3 Feb 2023 19:36:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313HHZU5004180; Fri, 3 Feb 2023 19:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=U+l6XvY8Sv6LBc/lsrZT/qfdMdz8wzvZ6e1i6WKpvWI=;
 b=onLsp7B6/al4dU1MBdRs2WNDUYvTQ5bnOcGLGfPrD+Boj6nZ9EJuzYK2CVa3dLaDMA94
 3NgAs8JauThojlMkD1Zr1aZwruMSZx/JGZPiDebHhT0hnncw99bHqaHkULQovn70+Seq
 JfdLwOuU/P/btCh736fYv/AisoFlEKEDP7iDT3fHrMiE2hylYMhW2ikzu0G1G2JgPzWQ
 ITB3iPqOQ6+G6P9q+gYH0APcr4nG6xxdnecgDUVH+sUkAyUqDlPY+pV1HxjYcGpxGbp5
 WGD2Qhr2WWnvqLCCRUkY70vpu7Ru/ty0ZtPi6EZbnMO1ij1WZJrCm7vKpO2MBM7t/ZGU Qg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngahqv2ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 19:36:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313Ja4rL022120
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Feb 2023 19:36:04 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 11:36:03 -0800
Message-ID: <7150e075-cbe3-710b-1afd-b4a54aae35df@quicinc.com>
Date: Fri, 3 Feb 2023 11:36:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 09/27] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-10-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: STHmCUeE1x5JJDTxvh3uXYZ743RiMKPE
X-Proofpoint-GUID: STHmCUeE1x5JJDTxvh3uXYZ743RiMKPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302030179
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



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> There is no need to pass full dpu_hw_sspp_cfg instance to
> _dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

LGTM now,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 9 ++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
>   3 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 4d3ca8532563..abf499275242 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -419,19 +419,18 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>   }
>   
>   static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
> -		struct dpu_hw_sspp_cfg *sspp,
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
> index 8d566ad1877e..5e9b07090a21 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -317,13 +317,12 @@ struct dpu_hw_sspp_ops {
>   
>   	/**
>   	 * setup_scaler - setup scaler
> -	 * @ctx: Pointer to pipe context
> -	 * @pipe_cfg: Pointer to pipe configuration
> -	 * @scaler_cfg: Pointer to scaler configuration
> +	 * @scaler3_cfg: Pointer to scaler configuration
> +	 * @format: pixel format parameters
>   	 */
>   	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
> -		struct dpu_hw_sspp_cfg *pipe_cfg,
> -		void *scaler_cfg);
> +		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> +		const struct dpu_format *format);
>   
>   	/**
>   	 * get_scaler_ver - get scaler h/w version
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 8f1767619d06..4f5c44d78332 100644
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
