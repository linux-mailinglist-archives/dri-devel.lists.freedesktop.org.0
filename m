Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7B9F8877
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 00:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0E088FB2;
	Thu, 19 Dec 2024 23:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FDn6lw++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F18110E4B2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 23:23:32 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-540218726d5so1218349e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 15:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734650610; x=1735255410; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JxThDL0M06erJx0i5xoAon/SNo0zan2/74JVtKWH2hI=;
 b=FDn6lw++wOJY2+8CdpyNnSG8xAsTNXM7HnS8oEycTZsV+BG3c8KbqfE7fKxfLW5NAn
 bEcNAFZ1Dc5MzRAwQfSMy2U/7PzlRV9qgtc3Krfzqf4eSjvWvjdil3RBG2bnKvPzJLaJ
 YPrFmQ0AElAsRUPKVlLPFwaJwurdLytPPKggAwfIvfmMao3JTMPRTmALALXPKws1+dU3
 5uoGbHmcTQ9y9LEhnIeRp8mi0bIr+MkCpCsovbM5a+lSJTNyGiXMKNo4HUFgQrkdZd/J
 qLeOzxTrCCVNNbXXUgi1R5LfUfqtx9bu+DIsmCkTgAfjbPcWD0hGA173bKNMA+rjD1zC
 WzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734650610; x=1735255410;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxThDL0M06erJx0i5xoAon/SNo0zan2/74JVtKWH2hI=;
 b=fqxXtjQ6N3uBqcSv6ba2QmUMpTExjSOxoq1TDSQapyrVRU0EXvSfmwJYbhiy+lnvDp
 gRLfcXo3B1zMt/30nRnGsr/A5WS2Z/4wP7/pSXMEQ4/bsMHgwJEz1+hVrOzXLl3QNr0A
 nayrlCz6OX/hph7hwcSgzN/1eKzulxsISiRZHhY8kIoNCYCRbqG0sbXqJ/SiXTD2Frqw
 StwdXnc9evpyW+AFg7FhdgFpRh5vbp7ASojfBLgZjXISMISi8jgw6kGI3urJmtnYJQGJ
 N//sWOKGZ9sP7Z/yq5wSo39fFFT4TAfIYuGKyG44fszWK9p0/lLtFXTgA2GBTJ4xxEYa
 Yzwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrdo69p2zKGzsK4Amyw/kse6Y4gAznBia37xcU40ZAUDhBmps6AKGER9pSPHijWNYeNbgrsvp8dgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuTDbEU7xlnoR4kSrhq8pKT6kiz+IFcCfmqobUUESAU1mjJMFm
 eXCF+qb3igH4w2yDXMkCw1DB2606doaTqQSG/XBZK0GyvGmhsXaTS/6JjxMTluQ=
X-Gm-Gg: ASbGncuxC1Qaaaz+7Mb1uV4ltDS80wjOtt+OkLPQxtUd6iTFy86fXz9z3FI3XaGXx3d
 BSSOd138OlaIEsKgCfmLKERQPSWYM5ZgJiO8L5h1NrV7WP9MmoVNyxGBYVo27I48GOKbod8x8PT
 NmfTbVwoPTVXyzifPs2W2jAW/tDq30+Z++D2T0fl0GdkwK8iQH9jCOrkNj0DplSbPRYicEHsq01
 YnzD5VOVqD7jLg2Sn8b76aMgOlJLQuyGc2iXxPQX69H5suJP/iNU8P3OWS9ZPg9qYem/m5ntJhL
 ARIU3qB8FkIiOnyYBu3Ij8PhW5q9wZ7nOA+4
X-Google-Smtp-Source: AGHT+IFu0ygVXVlyCFAI0wBOu30+Rp41ZnPG7y4HSy3cifT6hr1Q9oJ3Obolj498eR0Zp694u+g7Yg==
X-Received: by 2002:a05:6512:3f18:b0:540:23dd:2139 with SMTP id
 2adb3069b0e04-5422953fd6cmr137566e87.29.1734650610402; 
 Thu, 19 Dec 2024 15:23:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b06a4a3sm3513521fa.71.2024.12.19.15.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 15:23:29 -0800 (PST)
Date: Fri, 20 Dec 2024 01:23:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/15] drm/msm/dpu: Support quad-pipe in SSPP checking
Message-ID: <smr36w34y6ygi2lb2omuswc3oygryizjhq6r6bzrgznv46anhy@jnuranf3opdw>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-13-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-13-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:31PM +0800, Jun Nie wrote:
> Move requreiment check to routine of every pipe check. There will be
> multiple SSPPs for quad-pipe case in future. Only check valid pipe
> as some pipes are for multi-rect or right half of screen that may
> not be used.

This highlights an issue in the current wide planes implelentation.
Please move this to the top of the series, provide a proper commit
message, describing the issue, and add a proper Fixes tag.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 86 +++++++++++++++----------------
>  1 file changed, 42 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index fca6e609898a6..1cd98892898a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -730,12 +730,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>  static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>  		struct dpu_sw_pipe *pipe,
>  		struct dpu_sw_pipe_cfg *pipe_cfg,
> -		const struct msm_format *fmt,
> -		const struct drm_display_mode *mode)
> +		const struct drm_display_mode *mode,
> +		struct drm_plane_state *new_plane_state)
>  {
>  	uint32_t min_src_size;
>  	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>  	int ret;
> +	const struct msm_format *fmt;
> +	uint32_t supported_rotations;
> +	const struct dpu_sspp_cfg *pipe_hw_caps;
> +	const struct dpu_sspp_sub_blks *sblk;
> +
> +	pipe_hw_caps = pipe->sspp->cap;
> +	sblk = pipe->sspp->cap->sblk;
> +
> +	/*
> +	 * We already have verified scaling against platform limitations.
> +	 * Now check if the SSPP supports scaling at all.
> +	 */
> +	if (!sblk->scaler_blk.len &&
> +	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
> +	      drm_rect_width(&new_plane_state->dst)) ||
> +	     (drm_rect_height(&new_plane_state->src) >> 16 !=
> +	      drm_rect_height(&new_plane_state->dst))))
> +		return -ERANGE;
> +
> +	fmt = msm_framebuffer_format(new_plane_state->fb);
> +
> +	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +
> +	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +		supported_rotations |= DRM_MODE_ROTATE_90;
> +
> +	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> +						   supported_rotations);
>  
>  	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
>  
> @@ -981,49 +1009,19 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  		drm_atomic_get_new_plane_state(state, plane);
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	const struct msm_format *fmt;
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> -	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps;
> -	const struct dpu_sspp_sub_blks *sblk;
> -	int ret = 0;
> -
> -	pipe_hw_caps = pipe->sspp->cap;
> -	sblk = pipe->sspp->cap->sblk;
> -
> -	/*
> -	 * We already have verified scaling against platform limitations.
> -	 * Now check if the SSPP supports scaling at all.
> -	 */
> -	if (!sblk->scaler_blk.len &&
> -	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
> -	      drm_rect_width(&new_plane_state->dst)) ||
> -	     (drm_rect_height(&new_plane_state->src) >> 16 !=
> -	      drm_rect_height(&new_plane_state->dst))))
> -		return -ERANGE;
> -
> -	fmt = msm_framebuffer_format(new_plane_state->fb);
> -
> -	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> -
> -	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> -		supported_rotations |= DRM_MODE_ROTATE_90;
> -
> -	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> -						   supported_rotations);
> -	r_pipe_cfg->rotation = pipe_cfg->rotation;
> -
> -	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> -					  &crtc_state->adjusted_mode);
> -	if (ret)
> -		return ret;
> +	struct dpu_sw_pipe *pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	int ret = 0, i;
>  
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> -						  &crtc_state->adjusted_mode);
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
> +		pipe = &pstate->pipe[i];
> +		pipe_cfg = &pstate->pipe_cfg[i];
> +		if (!pipe_cfg->valid || !pipe->sspp)
> +			continue;
> +		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> +		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +						  &crtc_state->adjusted_mode,
> +						  new_plane_state);
>  		if (ret)
>  			return ret;
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
