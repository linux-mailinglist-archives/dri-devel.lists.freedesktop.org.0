Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67693A13419
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A1310E8E4;
	Thu, 16 Jan 2025 07:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z2h/qlAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B9E10E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:44:50 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso691454e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737013488; x=1737618288; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=biWHg2wuipNHtb9c736XZ1E0I9QutQIX2+ua4fhICWM=;
 b=Z2h/qlAZ55zdjERnYVH8hU6cUUcST+vMNf1EB6gKIzDmZMTDHn/Szqp81fxDjiNmjU
 7Ao7vdGtV4o5W6SouWlL+crQfmbboXp2G/V8Dc/iX5JS3NiI2C+uxB031tDK1cRzJTQQ
 4TVLzi5xMsH2kCLkkmVMkzpxIyCi3h+oin0VqHkkUe/HgIKItfQAfImTEscdXcImeOnP
 LzLLclovBw1i9QQ+HAocSasoNPIXfzXFbziVwK98SvJhkiSDyPsYiyCYpoG1vjtBuX3O
 DyBRWB631ywgQDtD5o8KpjPRvGKd8N7vb3s1B/hUm9NhRrKC0r8JG8ks6MP/jTkbeYOa
 kKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737013488; x=1737618288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=biWHg2wuipNHtb9c736XZ1E0I9QutQIX2+ua4fhICWM=;
 b=R/eHyWJixWW6ZW1LQ88N1w94MvaheDi16O2KHIcN6lyFxPihGLVHvgGFkRaep/DcSv
 s4aMBLnwfZkBIk4esIAWMnYklgUuNXhiTTsrwenuxJmFCoj54NiddMCYsaOlNwkzl85+
 U1cJb1tjhsaNjKMdCyZBrelPnMdiF2lPrhALSOle4mkmxRakMIfTWDAmKaK18hW/Ls57
 itaelUt0Tcq2Ra0AgqMKf3Y0WRzX5cR+Wcq4zcIt2uYhEMTmox20xBBB/2aykWR9PCpw
 JmLxGHBBdVVPgRY3KO2jGqszGhSgIk+IGrJCh+TTXOowGAMwkYMWLhKByP8Ik0Fpxs8+
 lXYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyl8wjoQJvMBuUIMnFVYjA+GFU6PNMx09q5AQgwu9vpTdmITP9GtAt8n3wHN/n7wbTUNtGAaWCpvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAjvlB19mZeXe55EHWxKUBQ3stqZgF/HLcA5WVGPaO79DXzzhM
 syRSemqRYR18YZpFvTqT3OAq0+a5o0DbBJMKZ5/JVBRR7JtbyuGEZocHCRUhNrA=
X-Gm-Gg: ASbGncvemK4z3mER4007J2gvZ+vcoqr0ewHLBwZaKoyStGW5CnHANq4NcG5UT3JKFb+
 HYFy70HBVm3aXxpr9ork/5JvFBRCZlI4k82MuQCqrPGSs+Tx1N3cnHBF1Z4oojLjqbzYa/FZXhj
 Ih4fgGp8UA96AwBigt23QzwCG0nkoQCD75UDj0gmS2pnivsRn04p/RXANieZFXF3B2sJgRaXSof
 aEGGfgMKP1uTVWxQ01dOZezyz6/BwP8zNKpXte9gLIaOvDCIfP0hsxr8LBmO+SxvYWgktRX+ccW
 YHEQnS/2SZrfJvzk0S+WHoQCFlw8HQDu3oav
X-Google-Smtp-Source: AGHT+IGP3X/DhrTrRTJZo+m0r+8hfYqADmOR9+u8sYo6uCVZreubMvDUnUbXM6AGdo5Z5Ar4u7c3/A==
X-Received: by 2002:a05:6512:33ca:b0:53d:f1cb:6266 with SMTP id
 2adb3069b0e04-54284546a9emr10464522e87.28.1737013488460; 
 Wed, 15 Jan 2025 23:44:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec20b8sm2267448e87.216.2025.01.15.23.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:44:48 -0800 (PST)
Date: Thu, 16 Jan 2025 09:44:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/16] drm/msm/dpu: check every pipe per capability
Message-ID: <ra4uugpcufctn2j2sosrwxewlwpivsmc6tidadf4kuostv4cq6@ev4di2547lla>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:50PM +0800, Jun Nie wrote:
> Move requreiment check to routine of every pipe check. As sblk
> and pipe_hw_caps of r_pipe are not checked in current implementation.

Jun, please. I know I might be sounding like a PITA. Please start by
providing the problem description. Refer to the
Documentation/process/submitting-patches.rst, it has pretty good
explanation of what should be written and why.

> 
> Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index cf923287dcd05..2b75a6cf4e670 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -729,12 +729,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
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
> @@ -923,47 +951,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>  	struct dpu_sw_pipe *pipe = &pstate->pipe;
>  	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -	const struct msm_format *fmt;
>  	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> -	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps;
> -	const struct dpu_sspp_sub_blks *sblk;
>  	int ret = 0;
>  
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
> +	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +					  &crtc_state->adjusted_mode,
> +					  new_plane_state);
>  	if (ret)
>  		return ret;
>  
>  	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> -						  &crtc_state->adjusted_mode);
> +		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
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
