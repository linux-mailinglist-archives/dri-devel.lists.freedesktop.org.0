Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B280B6F9134
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 12:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B19B10E259;
	Sat,  6 May 2023 10:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C4710E642;
 Fri,  5 May 2023 17:21:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345HHl8P023400; Fri, 5 May 2023 17:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tloJv3xSkll9xruPg3xCFEZbbeAzqSo/z06cEy0c7Fs=;
 b=AjWw2GGlLXKziLKzjqf5zSIygFf4C8Q+pAD3LtoN0XiiawswPLg4Vd3viLV4D3i2snsr
 vl3s62FqfCXA4c/OANMFp0JAb/oRIV9JZlVvc5lPFB5y04Euy7JpRA7lYJqDq3AT19xn
 v7UEy7baAXaATbAWnyepaHQumsEkfQ2xHVxFyE1do5XP4qkhkSrNX28QXZqYoZokTGPv
 VFRBD0NXiL2oPdF0bSqmXfl5+O8MDc3F7HoiWSqQE+xnBpt6Eepo5Mge+JydlGLntj8T
 iTyHnYlUaLCfSID7B8g6Uq6mQGUQZuTwzh+YlFGxA1ZqYsKe6qePAzDAAU1aU2RneQco ag== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qckf72aah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 17:21:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345HLl8Z011599
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 May 2023 17:21:47 GMT
Received: from [10.110.37.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 10:21:46 -0700
Message-ID: <6f11d686-5e00-0e14-2cae-71e9e509b3eb@quicinc.com>
Date: Fri, 5 May 2023 10:21:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 8/9] drm/msm/dpu: remove struct
 dpu_hw_pipe_qos_cfg
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
 <20230502150533.3672840-9-dmitry.baryshkov@linaro.org>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230502150533.3672840-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: o7NjnjHSi5P3Pi8iCBjZoTPRzSB2J1cI
X-Proofpoint-ORIG-GUID: o7NjnjHSi5P3Pi8iCBjZoTPRzSB2J1cI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050143
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
> Now as the struct dpu_hw_pipe_qos_cfg consists of only one bool field,
> drop the structure and use corresponding bool directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 +++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 13 ++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 11 +++--------
>   3 files changed, 8 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 341e3a8fc927..2533c4629021 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -568,17 +568,13 @@ static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
>   }
>   
>   static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
> -		struct dpu_hw_pipe_qos_cfg *cfg)
> +				       bool danger_safe_en)
>   {
> -	u32 qos_ctrl = 0;
> -
>   	if (!ctx)
>   		return;
>   
> -	if (cfg->danger_safe_en)
> -		qos_ctrl |= SSPP_QOS_CTRL_DANGER_SAFE_EN;
> -
> -	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL, qos_ctrl);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL,
> +		      danger_safe_en ? SSPP_QOS_CTRL_DANGER_SAFE_EN : 0);
>   }
>   
>   static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index aaf6f41d546c..4278c421b6ac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -163,14 +163,6 @@ struct dpu_sw_pipe_cfg {
>   	struct drm_rect dst_rect;
>   };
>   
> -/**
> - * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
> - * @danger_safe_en: enable danger safe generation
> - */
> -struct dpu_hw_pipe_qos_cfg {
> -	bool danger_safe_en;
> -};
> -
>   /**
>    * struct dpu_hw_pipe_ts_cfg - traffic shaper configuration
>    * @size: size to prefill in bytes, or zero to disable
> @@ -285,11 +277,10 @@ struct dpu_hw_sspp_ops {
>   	/**
>   	 * setup_qos_ctrl - setup QoS control
>   	 * @ctx: Pointer to pipe context
> -	 * @cfg: Pointer to pipe QoS configuration
> -	 *
> +	 * @danger_safe_en: flags controlling enabling of danger/safe QoS/LUT
>   	 */
>   	void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
> -			struct dpu_hw_pipe_qos_cfg *cfg);
> +			       bool danger_safe_en);
>   
>   	/**
>   	 * setup_histogram - setup histograms
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d1443c4b2915..c8837d0aa0c3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -343,22 +343,17 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>   	bool enable)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
> -
> -	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
> -
> -	pipe_qos_cfg.danger_safe_en = enable;
>   
>   	if (!pdpu->is_rt_pipe)
> -		pipe_qos_cfg.danger_safe_en = false;
> +		enable = false;
>   
>   	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
>   		pdpu->pipe - SSPP_VIG0,
> -		pipe_qos_cfg.danger_safe_en,
> +		enable,
>   		pdpu->is_rt_pipe);
>   
>   	pipe->sspp->ops.setup_qos_ctrl(pipe->sspp,
> -			&pipe_qos_cfg);
> +				       enable);
>   }
>   
>   /**
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
