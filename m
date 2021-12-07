Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359C46C3AF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 20:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6726EB51;
	Tue,  7 Dec 2021 19:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A736EA73;
 Tue,  7 Dec 2021 19:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638905443; x=1670441443;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2+8+9+n+/aGNN1L02U2FSrNSkxhVLZ6+6C8+ofOOfN4=;
 b=FAKdPqX7NbmXyPc6Vl0W8Tu3s+ZU44G8WXTDR9Kh7991IkqoSnV0uUm1
 7acliypz2Q1TLJ3HFY3sdXV601SJjRuIO3i/nWtoP0BSo7DMpX4ToeWa+
 X4/MyQN1OYUJAcvmvQtn9DOnK/ag1H1uUOWH/g0Hs8WoYoXbRP4qezCc0 E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 07 Dec 2021 11:30:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:30:42 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 11:30:42 -0800
Received: from [10.111.164.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 7 Dec 2021
 11:30:40 -0800
Message-ID: <9ca7a443-49ed-8eec-de0a-d95552988a0e@quicinc.com>
Date: Tue, 7 Dec 2021 11:30:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/4] drm/msm/dpu: drop scaler config from plane state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
 <20211201225140.2481577-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201225140.2481577-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/1/2021 2:51 PM, Dmitry Baryshkov wrote:
> Scaler and pixel_ext configuration does not contain a long living state,
> it is used only during plane update, so remove these two fiels from
> dpu_plane_state and allocate them on stack.
s/fiels/fields

apart from that,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 59 ++++++++++-------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ---
>   2 files changed, 26 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ca190d92f0d5..4c373abbe89c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -536,14 +536,12 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>   		struct dpu_plane_state *pstate,
>   		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>   		struct dpu_hw_scaler3_cfg *scale_cfg,
> +		struct dpu_hw_pixel_ext *pixel_ext,
>   		const struct dpu_format *fmt,
>   		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
>   {
>   	uint32_t i;
>   
> -	memset(scale_cfg, 0, sizeof(*scale_cfg));
> -	memset(&pstate->pixel_ext, 0, sizeof(struct dpu_hw_pixel_ext));
> -
>   	scale_cfg->phase_step_x[DPU_SSPP_COMP_0] =
>   		mult_frac((1 << PHASE_STEP_SHIFT), src_w, dst_w);
>   	scale_cfg->phase_step_y[DPU_SSPP_COMP_0] =
> @@ -582,9 +580,9 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>   			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
>   		}
>   
> -		pstate->pixel_ext.num_ext_pxls_top[i] =
> +		pixel_ext->num_ext_pxls_top[i] =
>   			scale_cfg->src_height[i];
> -		pstate->pixel_ext.num_ext_pxls_left[i] =
> +		pixel_ext->num_ext_pxls_left[i] =
>   			scale_cfg->src_width[i];
>   	}
>   	if (!(DPU_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
> @@ -662,6 +660,11 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   		struct dpu_hw_pipe_cfg *pipe_cfg)
>   {
>   	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
> +	struct dpu_hw_scaler3_cfg scaler3_cfg;
> +	struct dpu_hw_pixel_ext pixel_ext;
> +
> +	memset(&scaler3_cfg, 0, sizeof(scaler3_cfg));
> +	memset(&pixel_ext, 0, sizeof(pixel_ext));
>   
>   	/* don't chroma subsample if decimating */
>   	/* update scaler. calculate default config for QSEED3 */
> @@ -670,8 +673,23 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   			drm_rect_height(&pipe_cfg->src_rect),
>   			drm_rect_width(&pipe_cfg->dst_rect),
>   			drm_rect_height(&pipe_cfg->dst_rect),
> -			&pstate->scaler3_cfg, fmt,
> +			&scaler3_cfg, &pixel_ext, fmt,
>   			info->hsub, info->vsub);
> +
> +	if (pdpu->pipe_hw->ops.setup_pe)
> +		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
> +				&pixel_ext);
> +
> +	/**
> +	 * when programmed in multirect mode, scalar block will be
> +	 * bypassed. Still we need to update alpha and bitwidth
> +	 * ONLY for RECT0
> +	 */
> +	if (pdpu->pipe_hw->ops.setup_scaler &&
> +			pstate->multirect_index != DPU_SSPP_RECT_1)
> +		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
> +				pipe_cfg, &pixel_ext,
> +				&scaler3_cfg);
>   }
>   
>   /**
> @@ -712,7 +730,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   			drm_rect_width(&pipe_cfg.dst_rect);
>   		pipe_cfg.src_rect.y2 =
>   			drm_rect_height(&pipe_cfg.dst_rect);
> -		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
>   
>   		if (pdpu->pipe_hw->ops.setup_format)
>   			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
> @@ -724,15 +741,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   					&pipe_cfg,
>   					pstate->multirect_index);
>   
> -		if (pdpu->pipe_hw->ops.setup_pe)
> -			pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
> -					&pstate->pixel_ext);
> -
> -		if (pdpu->pipe_hw->ops.setup_scaler &&
> -				pstate->multirect_index != DPU_SSPP_RECT_1)
> -			pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
> -					&pipe_cfg, &pstate->pixel_ext,
> -					&pstate->scaler3_cfg);
> +		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
>   	}
>   
>   	return 0;
> @@ -1129,8 +1138,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   
>   	pipe_cfg.dst_rect = state->dst;
>   
> -	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
> -
>   	/* override for color fill */
>   	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>   		/* skip remaining processing on color fill */
> @@ -1143,21 +1150,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   				pstate->multirect_index);
>   	}
>   
> -	if (pdpu->pipe_hw->ops.setup_pe &&
> -			(pstate->multirect_index != DPU_SSPP_RECT_1))
> -		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
> -				&pstate->pixel_ext);
> -
> -	/**
> -	 * when programmed in multirect mode, scalar block will be
> -	 * bypassed. Still we need to update alpha and bitwidth
> -	 * ONLY for RECT0
> -	 */
> -	if (pdpu->pipe_hw->ops.setup_scaler &&
> -			pstate->multirect_index != DPU_SSPP_RECT_1)
> -		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
> -				&pipe_cfg, &pstate->pixel_ext,
> -				&pstate->scaler3_cfg);
> +	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
>   
>   	if (pdpu->pipe_hw->ops.setup_multirect)
>   		pdpu->pipe_hw->ops.setup_multirect(
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 52792526e904..1ee5ca5fcdf7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -23,8 +23,6 @@
>    * @multirect_index: index of the rectangle of SSPP
>    * @multirect_mode: parallel or time multiplex multirect mode
>    * @pending:	whether the current update is still pending
> - * @scaler3_cfg: configuration data for scaler3
> - * @pixel_ext: configuration data for pixel extensions
>    * @plane_fetch_bw: calculated BW per plane
>    * @plane_clk: calculated clk per plane
>    */
> @@ -37,10 +35,6 @@ struct dpu_plane_state {
>   	uint32_t multirect_mode;
>   	bool pending;
>   
> -	/* scaler configuration */
> -	struct dpu_hw_scaler3_cfg scaler3_cfg;
> -	struct dpu_hw_pixel_ext pixel_ext;
> -
>   	u64 plane_fetch_bw;
>   	u64 plane_clk;
>   };
> 
