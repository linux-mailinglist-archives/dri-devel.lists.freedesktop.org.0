Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464C5A1350E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D1910E8EF;
	Thu, 16 Jan 2025 08:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PqDk1zxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0647610E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:15:06 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso767233e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737015244; x=1737620044; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t41KpxpKiU9abnGV0MjlkX9oMb/HoUfrr8CVsTbI+OU=;
 b=PqDk1zxJoL6JDsLkLAZSZp8HW6/cWXN6gNIZXLG9c12kgWKkKyt9taXAlTsEzvH9KT
 XeETXwsljxF9dB5312cifFUaP37a3NP1VXqNVnb+Y1yeWBgQpJl4DdVtjNrDtE0+HoX6
 sUKWLVt0AEABRLeomOoQyubsJOZnFw+o3u4JdUaSsmtEK5PQaMS/S1oFhNSposCRz2/y
 IgmtdSFIvwr3EaJM2Q38zatgP0II2ViHFBACbauiJFMuweMiZYi05KNBBIr0vbZcgiQf
 bIlM+QI/PJwJvYc7YYxIK18wziKFSkvjILp7mLpiCevqAq3k+vRP31bO7aOcn6HsWA9C
 BlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737015244; x=1737620044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t41KpxpKiU9abnGV0MjlkX9oMb/HoUfrr8CVsTbI+OU=;
 b=iSCNusvdQGy1Y/TOfINaPQJazRs1yvf00A0pheb7NkvG9RZhL1cJmP//jzc39KFj0y
 U0/R84XzfblU/1PbpgfiTB6KRSctG+XDPS7wwIZmaIhPNTqO5S5OPEDbnY27UhMTCINh
 uuv04Oo1cPOexdoUrRmBvCjrxmYu3EA16R2qTIzOmXbWWjk8EzuT7NPXXYYO4p307YI2
 qFxUj3OsNJT0GQMYFvjydiAifBjQstZEDzXbf5XLpBuGLr4y3e5fKAbPGEqQvQ7HK++S
 Lb3FY60SelVh2NYGt2cd8zjiLHrSTr00Ly2NaCotXYrs+SSCd7t8pgcMKrmSpyqrNko2
 ZBtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXT6QjWPsIRB5+n5rWu+b6hdzZZMHEzFgY71FuKFhzoyULqJnXAOwwCGMWTvD3fbEGOSk80h1dOv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhe6D0UefI6EQo2LsztGGWEypm1Rr78nfBtx9UhCxh7DcdUD2A
 ac08Hqk7vFk5DXHhGDJt2Rw66yhCsUn4W3dcSb5f+eH/O7YSeKHwa4Aut1wiHpE=
X-Gm-Gg: ASbGncsds9aflFlE0QS/3YeFPj/xrhnQoe+FVBEGbYiImHFiV/hUebeizn7Px3FBAI7
 bJrzmOC3bGgHfFc23T5sgQAts5c9kIqUgA2GWcgj6KZWz7KImMyU2CI+YVOlQ/E8wBIyqxhea9M
 WEdRdIeQ/Uo0Qbr+RJLBI+4XCukP3cj3zP679ExbVv4ed9VphHqMpNSHbyBT3IsU3NlHF62NkdB
 0rtne+Y1IyGDHxeqIM++V83TpsQApdrVj9s9P8Fs1LkjK7dtRlzLel302jzuRrq1VQRQE26pUqy
 P2da0BKZvMieW8oyyz0oiaEDjH6Ns5QDzAi1
X-Google-Smtp-Source: AGHT+IHBGWgnjQbQaF7K39jBjnb5AglvlmCjor+nRLMUd3AeoVpr507kxz0M1FRsCHGe5AtcazMUqw==
X-Received: by 2002:a05:6512:39c3:b0:542:2972:4e59 with SMTP id
 2adb3069b0e04-54284558d26mr10512351e87.28.1737015244267; 
 Thu, 16 Jan 2025 00:14:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becafaasm2224934e87.239.2025.01.16.00.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:14:03 -0800 (PST)
Date: Thu, 16 Jan 2025 10:14:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/16] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <ohq35qtnnas5oqiqycn3floji3auuvwitdy43geve6nce5xxq4@4gsyikmqbbh3>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-13-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-13-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:26:02PM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen will be split further
> by half if its width still exceeds limit.

futher handled by two pipes if its width exceeds a limit for a single
pipe.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 138 +++++++++++++++++++---------
>  4 files changed, 112 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 5ae640da53fbf..a900220deeb35 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1361,6 +1361,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  	return 0;
>  }
>  
> +/**
> + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> + * @state: Pointer to drm crtc state object
> + */
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> +{
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +
> +	return cstate->num_mixers;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 0b148f3ce0d7a..b14bab2754635 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 56a0edf2a57c6..39fe338e76691 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -145,11 +145,13 @@ struct dpu_hw_pixel_ext {
>   *             such as decimation, flip etc to program this field
>   * @dest_rect: destination ROI.
>   * @rotation: simplified drm rotation hint
> + * @valid: notify that this pipe and config is in use
>   */
>  struct dpu_sw_pipe_cfg {
>  	struct drm_rect src_rect;
>  	struct drm_rect dst_rect;
>  	unsigned int rotation;
> +	bool valid;

Commit message doesn't describe why this is necessary at all. Why isn't
it enough to check pipe->sspp as the code has been doing up to this
point?

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 3795576e2eedd..4bcd7b1a05c16 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -831,8 +831,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_sw_pipe_cfg init_pipe_cfg;
>  	struct drm_rect fb_rect = { 0 };
> +	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  	uint32_t max_linewidth;
> +	u32 num_lm;
> +	int stage_id, num_stages;
>  
>  	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
>  	max_scale = MAX_DOWNSCALE_RATIO << 16;
> @@ -855,13 +859,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> -	/* move the assignment here, to ease handling to another pairs later */
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -	/* state->src is 16.16, src_rect is not */
> -	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +	num_lm = dpu_crtc_get_num_lm(crtc_state);
>  
> -	pipe_cfg->dst_rect = new_plane_state->dst;
> +	/* state->src is 16.16, src_rect is not */
> +	drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
>  
>  	fb_rect.x2 = new_plane_state->fb->width;
>  	fb_rect.y2 = new_plane_state->fb->height;
> @@ -886,35 +887,93 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  
>  	max_linewidth = pdpu->catalog->caps->max_linewidth;
>  
> -	drm_rect_rotate(&pipe_cfg->src_rect,
> +	drm_rect_rotate(&init_pipe_cfg.src_rect,
>  			new_plane_state->fb->width, new_plane_state->fb->height,
>  			new_plane_state->rotation);
>  
> -	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> -	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> -		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -			return -E2BIG;
> +	/*
> +	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> +	 * configs for left and right half screen in case of 4:4:2 topology.
> +	 * But we may have 2 rect to split wide plane that exceeds limit with 1
> +	 * config for 2:2:1. So need to handle both wide plane splitting, and
> +	 * plane on right half for quad-pipe case. Check dest rectangle

only on the right side?

> +	 * left/right clipping first, then check wide rectangle splitting in
> +	 * every half next.
> +	 */
> +	num_stages = (num_lm + 1) / 2;

-- 
With best wishes
Dmitry
