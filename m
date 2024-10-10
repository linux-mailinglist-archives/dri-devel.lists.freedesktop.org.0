Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AAC9987FF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DDA10E900;
	Thu, 10 Oct 2024 13:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="II/qsJK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F4010E900
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 13:41:37 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5398cc2fcb7so1171887e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728567696; x=1729172496; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ywYGTQW3NjCWiXrm4ZDzjoz+vHmj6gfKaQuf2Wn/6QY=;
 b=II/qsJK0HlmwOayDKOfv6nD1pc97Dmoa7fI44lgIi0pEfDVSNOICdCqu33VoeXMhtE
 zksNY2E7/wBBhe29FLPgwLYZ0fB249ZIVI9RnJxjAcUm59DYf5t9zfV+d/DcOmTGooPI
 45TfWRQWDGupGGMX04WD4kqjpNylTBLdlimEOyEWCeVB1dtZFpk3Ghzfpx4V8e+HT1hD
 jJw5Tdjhu11VmETLsKtJ7LJ7sKSNXJjzsodj08eDrXRujoF+t+f8Q1OsxnWRZUP4mgdF
 YVTmDVBqSdK0Wu8AqEr4447K+IPofwu6r1HMVLdRDY1oV4KQdFNDpYR2PhE9vpQRUVMs
 XnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728567696; x=1729172496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywYGTQW3NjCWiXrm4ZDzjoz+vHmj6gfKaQuf2Wn/6QY=;
 b=MaChPcS9Fno415C2cc7y3y+Q+HFWtmgFOP44wvzxyScUM17caNfxEKFFDgCBOLKQAN
 KwiFibQvhrZio4vFy1tek3vFY+zYaEkIp5vJuxJDD+50CZbWim9qblMLGJiRAhYu7A7k
 qx5Kx0Rq4oqj5e6nP1CscjK1HGeP4T8xg5pBj1grQSU2SXLy/0hTK99tTBtvFkOOKiGO
 bGjOWY0L1pOyCXzTyUK0cMqmLxp76aYNPYAVnxYP/JK+rmhzJFf5mf+L1vYq1izxsf2k
 PuBhcu/9QPayY96wA2BkkFGClgauCacnCdoicOtPMcH6xi5HW70jIxoEbzakIzCT3CaV
 JCCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+far5YC7QUWwc6i6XqCCiEqJ+OCOHagQmKuKnlzW46vEZRsUXveVskiJxawvDp+fRjWYTac4yuLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgdJ2WRNNqDwIR1PMSsFfZ2m1R0B1BRnszuxKFMiq+At5de6qa
 tHh+DwDb28YuIT1l/UGMeuM2Gkw+/kSHnbIYMpDzwusTRcF6i+I/ufZVcztHyW0=
X-Google-Smtp-Source: AGHT+IFfei1GdkuUWi73PJLzby9uAzHdB32SnRk5Ie0SqTarwvAkXDR1pqSVsk4h1t+o0mMJTf+gaw==
X-Received: by 2002:a05:6512:2582:b0:539:d22c:37b6 with SMTP id
 2adb3069b0e04-539d22c3953mr84671e87.17.1728567695648; 
 Thu, 10 Oct 2024 06:41:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb6c13aasm256358e87.32.2024.10.10.06.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 06:41:34 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:41:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/14] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <7hgahbiow3zrt3a52nwrupbuu3eotytauf2k55xikgqg23dfge@luwcongx6bj4>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-13-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-13-76d4f5d413bf@linaro.org>
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

On Wed, Oct 09, 2024 at 04:50:26PM GMT, Jun Nie wrote:
> Support SSPP assignment for quad-pipe case with unified method.
> The first 2 pipes can share a set of mixer config and enable
> multi-rect mode if condition is met. It is also the case for
> the later 2 pipes.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 85 +++++++++++++++----------------
>  1 file changed, 42 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 480a1b46aba72..23de2ca6fabb0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -999,7 +999,7 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>  		pipe = &pstate->pipe[i];
>  		pipe_cfg = &pstate->pipe_cfg[i];
>  		if (!pipe_cfg->valid || !pipe->sspp)
> -			break;
> +			continue;
>  		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
>  		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
>  						  &crtc_state->adjusted_mode,
> @@ -1154,13 +1154,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate;
> -	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
> -	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct msm_format *fmt;
>  	uint32_t max_linewidth;
> -	int i;
> +	int i, lm_num, lmcfg_id, lmcfg_num;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1168,12 +1165,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	pstate = to_dpu_plane_state(plane_state);
>  
> -	/* loop below code for another pair later */
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1189,41 +1180,49 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
>  
> -	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -	if (!pipe->sspp)
> -		return -ENODEV;
> -
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> -		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -		r_pipe->sspp = NULL;
> -	} else {
> -		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
> -		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
> -		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
> -		     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
> -			r_pipe->sspp = pipe->sspp;
> +	lm_num = dpu_crtc_get_lm_num(crtc_state);
> +	lmcfg_num = (lm_num + 1) / 2;
> +	for (lmcfg_id = 0; lmcfg_id < lmcfg_num; lmcfg_id++) {
> +		for (i = lmcfg_id * PIPES_PER_LM_PAIR; i < (lmcfg_id + 1) * PIPES_PER_LM_PAIR; i++) {
> +			struct dpu_sw_pipe *pipe = &pstate->pipe[i];
> +			struct dpu_sw_pipe *r_pipe = &pstate->pipe[i + 1];
> +			struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[i];
> +			struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[i + 1];
>  
> -			pipe->multirect_index = DPU_SSPP_RECT_0;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +			if (!pipe_cfg->valid)
> +				break;
>  
> -			r_pipe->multirect_index = DPU_SSPP_RECT_1;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> -		} else {
> -			/* multirect is not possible, use two SSPP blocks */
> -			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -			if (!r_pipe->sspp)
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
>  				return -ENODEV;
>  
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			/*
> +			 * If current pipe is the first pipe in pipe pair, check
> +			 * multi-rect opportunity for the 2nd pipe in the pair.
> +			 * SSPP multi-rect mode cross mixer pairs is not supported.
> +			 */
> +			if (!(i % 2) &&

if ((i % PIPES_PER_LM_PAIR == 0) &&

> +			    r_pipe_cfg->valid &&
> +			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +			    dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
> +			    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
> +			    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
> +			     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
> +				pipe->multirect_index = DPU_SSPP_RECT_0;
> +				pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +
> +				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d and set pipe %d as multi-rect\n",
> +						pipe->sspp->idx - SSPP_NONE, i, i + 1);
> +				r_pipe->sspp = pipe->sspp;
> +				r_pipe->multirect_index = DPU_SSPP_RECT_1;
> +				r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +				i++;
> +			} else {
> +				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> +						pipe->sspp->idx - SSPP_NONE, i);
> +			}
>  		}
>  	}
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
