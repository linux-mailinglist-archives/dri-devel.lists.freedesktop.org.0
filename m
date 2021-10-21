Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5D436DA6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 00:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CAD6E4E8;
	Thu, 21 Oct 2021 22:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C316E4E8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 22:41:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634856087; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UTRK+asHkVmSaVJYYfLMtmmtXWUM2tAIeK5G9Vjm9lI=;
 b=T+z4ucPpmfgjVny5wY1GA3Mi61FG+qo5mh1DlCKMojlzVweNjkO0kfXq0iXbbA4YYFHI0Qmt
 gqOMFOIecXVSz0mBxPYXTJ9zG74eKod1FLyGeggWsC2kqySEm+Z9PIAz2/ey1tHA3FU73K/n
 by0AeMI2MrQ+GcR2ltey5V123g4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6171ec945ca800b6c185deab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 22:41:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8817C4360C; Thu, 21 Oct 2021 22:41:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 72F07C4338F;
 Thu, 21 Oct 2021 22:41:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Oct 2021 15:41:22 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 06/11] drm/msm/dpu: drop scaler config from
 plane state
In-Reply-To: <20210930140002.308628-7-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-7-dmitry.baryshkov@linaro.org>
Message-ID: <d9aaf57840d9c4dd4ad9ea1020123c46@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-09-30 06:59, Dmitry Baryshkov wrote:
> Scaler and pixel_ext configuration does not contain a long living 
> state,
> it is used only during plane update, so remove these two fiels from
fiels ---> fields
> dpu_plane_state and allocate them on stack.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

While addressing the bugs reported by the smatch tool, I saw that pe is 
not
being used at the moment.

412 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
413 		struct dpu_hw_pipe_cfg *sspp,
414 		struct dpu_hw_pixel_ext *pe,
415 		void *scaler_cfg)
416 {
417 	u32 idx;
418 	struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
419
420 	(void)pe;
421 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
422 		|| !scaler3_cfg || !ctx || !ctx->cap || !ctx->cap->sblk)
423 		return;
424
425 	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
426 			ctx->cap->sblk->scaler_blk.version,
427 			sspp->layout.format);
428 }

As part of this change, can you please drop this?

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 59 ++++++++++-------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ---
>  2 files changed, 26 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 5288b5b824f8..4259c4ecde9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -542,14 +542,12 @@ static void _dpu_plane_setup_scaler3(struct
> dpu_plane *pdpu,
>  		struct dpu_plane_state *pstate,
>  		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>  		struct dpu_hw_scaler3_cfg *scale_cfg,
> +		struct dpu_hw_pixel_ext *pixel_ext,
>  		const struct dpu_format *fmt,
>  		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v)
>  {
>  	uint32_t i;
> 
> -	memset(scale_cfg, 0, sizeof(*scale_cfg));
> -	memset(&pstate->pixel_ext, 0, sizeof(struct dpu_hw_pixel_ext));
> -
>  	scale_cfg->phase_step_x[DPU_SSPP_COMP_0] =
>  		mult_frac((1 << PHASE_STEP_SHIFT), src_w, dst_w);
>  	scale_cfg->phase_step_y[DPU_SSPP_COMP_0] =
> @@ -588,9 +586,9 @@ static void _dpu_plane_setup_scaler3(struct 
> dpu_plane *pdpu,
>  			scale_cfg->preload_y[i] = DPU_QSEED3_DEFAULT_PRELOAD_V;
>  		}
> 
> -		pstate->pixel_ext.num_ext_pxls_top[i] =
> +		pixel_ext->num_ext_pxls_top[i] =
>  			scale_cfg->src_height[i];
> -		pstate->pixel_ext.num_ext_pxls_left[i] =
> +		pixel_ext->num_ext_pxls_left[i] =
>  			scale_cfg->src_width[i];
>  	}
>  	if (!(DPU_FORMAT_IS_YUV(fmt)) && (src_h == dst_h)
> @@ -660,6 +658,11 @@ static void _dpu_plane_setup_scaler(struct 
> dpu_plane *pdpu,
>  		struct dpu_hw_pipe_cfg *pipe_cfg)
>  {
>  	const struct drm_format_info *info = 
> drm_format_info(fmt->base.pixel_format);
> +	struct dpu_hw_scaler3_cfg scaler3_cfg;
> +	struct dpu_hw_pixel_ext pixel_ext;
> +
> +	memset(&scaler3_cfg, 0, sizeof(scaler3_cfg));
> +	memset(&pixel_ext, 0, sizeof(pixel_ext));
> 
>  	/* don't chroma subsample if decimating */
>  	/* update scaler. calculate default config for QSEED3 */
> @@ -668,8 +671,23 @@ static void _dpu_plane_setup_scaler(struct 
> dpu_plane *pdpu,
>  			drm_rect_height(&pipe_cfg->src_rect),
>  			drm_rect_width(&pipe_cfg->dst_rect),
>  			drm_rect_height(&pipe_cfg->dst_rect),
> -			&pstate->scaler3_cfg, fmt,
> +			&scaler3_cfg, &pixel_ext, fmt,
>  			info->hsub, info->vsub);
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
>  }
> 
>  /**
> @@ -710,7 +728,6 @@ static int _dpu_plane_color_fill(struct dpu_plane 
> *pdpu,
>  			drm_rect_width(&pipe_cfg.dst_rect);
>  		pipe_cfg.src_rect.y2 =
>  			drm_rect_height(&pipe_cfg.dst_rect);
> -		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
> 
>  		if (pdpu->pipe_hw->ops.setup_format)
>  			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
> @@ -722,15 +739,7 @@ static int _dpu_plane_color_fill(struct dpu_plane 
> *pdpu,
>  					&pipe_cfg,
>  					pstate->multirect_index);
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
>  	}
> 
>  	return 0;
> @@ -1122,8 +1131,6 @@ static void dpu_plane_sspp_atomic_update(struct
> drm_plane *plane)
> 
>  	pipe_cfg.dst_rect = state->dst;
> 
> -	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
> -
>  	/* override for color fill */
>  	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>  		/* skip remaining processing on color fill */
> @@ -1136,21 +1143,7 @@ static void dpu_plane_sspp_atomic_update(struct
> drm_plane *plane)
>  				pstate->multirect_index);
>  	}
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
>  	if (pdpu->pipe_hw->ops.setup_multirect)
>  		pdpu->pipe_hw->ops.setup_multirect(
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 34e03ac05f4a..087194be3c22 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -23,8 +23,6 @@
>   * @multirect_index: index of the rectangle of SSPP
>   * @multirect_mode: parallel or time multiplex multirect mode
>   * @pending:	whether the current update is still pending
> - * @scaler3_cfg: configuration data for scaler3
> - * @pixel_ext: configuration data for pixel extensions
>   * @cdp_cfg:	CDP configuration
>   * @plane_fetch_bw: calculated BW per plane
>   * @plane_clk: calculated clk per plane
> @@ -38,10 +36,6 @@ struct dpu_plane_state {
>  	uint32_t multirect_mode;
>  	bool pending;
> 
> -	/* scaler configuration */
> -	struct dpu_hw_scaler3_cfg scaler3_cfg;
> -	struct dpu_hw_pixel_ext pixel_ext;
> -
>  	struct dpu_hw_pipe_cdp_cfg cdp_cfg;
>  	u64 plane_fetch_bw;
>  	u64 plane_clk;
