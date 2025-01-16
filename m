Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEB2A1352F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8DE10E579;
	Thu, 16 Jan 2025 08:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DzLYYWOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A51010E579
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:19:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so745808e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737015499; x=1737620299; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BBRYijatydQgVzSiuVY77R+uqeAtmhSMfg8qktQdI/U=;
 b=DzLYYWOT9SAQDmd6LOEFA8xFUDJkjeMmv4Iws15H6485wv0d0R5thgolkdY23qyRui
 tIBCa6/1Ut5CophV57bFPG3hHuT+mzw95RoRFXfFqaZy1HRZhVtEXna6Ayrg5lzFmxR1
 +aGfXKDQ0Mg/zGsJhgSr8XJkpH3OFI9do+HAXBKXCEqgPIVpNDwz0ac5epWjId1Q1l+Y
 G/qwCxEDXLpzEAkGNKrRar6PDF20hilrcqi9T6krylDsL6AOBja1nlUZBZxFUc9mr2b5
 5NsvfVLSaFGN6QRcsTXEL25wXl0t+lPgYEjzWm2xVVWmJUW9BcnBZcnggLxy4fIztBM5
 /BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737015499; x=1737620299;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BBRYijatydQgVzSiuVY77R+uqeAtmhSMfg8qktQdI/U=;
 b=S8K6bdFcIQUoYeKwc/IMYi5DEMClGkr71rjfkr3sSx6xevcA+KKhVAwOd5fVEA/oa4
 Sv4FPCWTyTHih9BS+mfH4AdEjQcXUnGlJfXxLp/79IOzswgJWXZeNmR/cp1MXvWdGqNp
 H24+oQ1SIwsx5G4mMfi6G9skUV4wITS/ZDG2vhLptyyIAUUOWLVoqiDJpfpMs5wdiPEX
 t3+v+0FOskePDHaHn2oFdwLo5YxNdT1KbWs5mxsD052qFMlMp28+bhdrJXMJGB6pm8ai
 X28t4AXGysBFhBR9nQh47UEsCoOUrKg0obY+X/sh/A1p4437wIvhtu+8I4RiMDM7DOrU
 rw+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6DhkmPd8U6A/EJLnUXGj1UdcNvifRfN+Agxygh6/6oqHNjwWRRWdS/CAMVdLwY8l7khOCuHt3PUU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKDDfkfP3IYbBqBYySNdiLNbXLZ9iVXtHa4e4YHY1s8HIatnEy
 tf+RyUR7YV3Q9cxFBC1RNSpe1aZtQKoB9bu4+U6TntrR37eXQks2xxwQ0By4c04=
X-Gm-Gg: ASbGncuKKyfxqznXzMAwf1PeiyXYfnuln4StvK0UpwFA6t0R1z0pSFcbFfzzJaQNt01
 dWyR2FIVeAycNY7WrSLQun/TwxzS9fb8f6HyNghdyz4pfee/cxJiybRTRFr0OkAEDHcJW6gez1c
 z4kvtrLG1eGFTBmDE5f9zimPLELf7w8JkUY4VcrQ714TIEaN6L6N6No1caDfI8HwVtcrk5bEX71
 0cH3ey9kTkXvEc7DJ3Zw6OUh5il9sxQBfhBsecReRDzj/rYAhYYiThAIE6IquF7o9+co8nUfKUY
 3WOisze2jBBs94TQ1FGFrN/sm3jGeBYNCRvs
X-Google-Smtp-Source: AGHT+IHm/RgPW0rZIyr7zzNsP5cCSYP/kctP25DgzTdzFj0fBdGSrUSkIQkujtSiMXV0EQOUkS0mRA==
X-Received: by 2002:a05:6512:3ba3:b0:542:2e04:edc5 with SMTP id
 2adb3069b0e04-542844ad9edmr10919173e87.0.1737015499468; 
 Thu, 16 Jan 2025 00:18:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be499afsm2223831e87.49.2025.01.16.00.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:18:19 -0800 (PST)
Date: Thu, 16 Jan 2025 10:18:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/16] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:26:03PM +0800, Jun Nie wrote:
> Support SSPP assignment for quad-pipe case with unified method.
> The first 2 pipes can share a set of mixer config and enable
> multi-rect mode if condition is met. It is also the case for
> the later 2 pipes.

Missing problem description.

Also, shouldn't this patch come before the previous one?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 4bcd7b1a05c16..d96f4405a4c26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1171,8 +1171,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_sw_pipe *r_pipe;
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, num_lm, stage_id, num_stages;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1180,11 +1181,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	pstate = to_dpu_plane_state(plane_state);
>  
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1198,24 +1194,43 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>  
> -	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -	if (!pipe->sspp)
> -		return -ENODEV;
> -
> -	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -					      pipe->sspp,
> -					      msm_framebuffer_format(plane_state->fb),
> -					      dpu_kms->catalog->caps->max_linewidth)) {
> -		/* multirect is not possible, use two SSPP blocks */
> -		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -		if (!r_pipe->sspp)
> -			return -ENODEV;
> -
> -		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	num_lm = dpu_crtc_get_num_lm(crtc_state);
> +	num_stages = (num_lm + 1) / 2;
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> +		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
> +			pipe = &pstate->pipe[i];
> +			pipe_cfg = &pstate->pipe_cfg[i];
> +
> +			if (!pipe_cfg->valid)
> +				break;
> +
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
> +
> +			r_pipe = &pstate->pipe[i + 1];
> +			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
> +
> +			/*
> +			 * If current pipe is the first pipe in pipe pair, check
> +			 * multi-rect opportunity for the 2nd pipe in the pair.
> +			 * SSPP multi-rect mode cross mixer pairs is not supported.
> +			 */
> +			if ((i % PIPES_PER_STAGE == 0) &&
> +			    r_pipe_cfg->valid &&
> +			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +							      pipe->sspp,
> +							      msm_framebuffer_format(plane_state->fb),
> +							      dpu_kms->catalog->caps->max_linewidth)) {
> +				i++;
> +			} else {
> +				/* multirect is not possible, use two SSPP blocks */
> +				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> +						pipe->sspp->idx - SSPP_NONE, i);
> +			}
> +		}
>  	}
>  
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
