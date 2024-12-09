Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3975C9EA0CA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 22:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D6C10E2CE;
	Mon,  9 Dec 2024 21:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZuQ0hoCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FFC10E7ED
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 21:04:17 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30229d5b22fso9277031fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 13:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733778255; x=1734383055; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7Ma5GtyG8ioog91EhM+P4GWHWrGCT15M/sea78+XBKE=;
 b=ZuQ0hoCPBtrYSB/aQiaKWC4cDFh0zz8omD1tLHkOqKCwxyubvzGI/hJSikr9wanhj2
 H7v6HJ5oW8iNTtE2cjGvgTIeI+L38ci6/PtPpOZzPbnACjdCreOyC7J9IbcIbd60gIco
 KdXOjMlsQ/Cz2Jl03Gnuzq5NV9UAFdjNwLGrS6I8GPciJazfYS0xinni5PoHoDZO+cWm
 dnA8gi/a/QyhrhfYASAMcEtc6saMv5SNMIeMKxxhjNDn9FhqialZPLHHKI2sy+ryj8T9
 SHrm5+6rfzNWnaxS8FblLIeV+E3L6L8ZnlVStD756JSzF5Pi24tU78yKuwwfJRK6hXez
 TUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733778255; x=1734383055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Ma5GtyG8ioog91EhM+P4GWHWrGCT15M/sea78+XBKE=;
 b=jduRBJROqBCdINUgaQoecj+AJpl++Q3IseJKHGLNoQkAyDUJMQ/TTXvabvGDdH+cl2
 WqbCd9w71XGhzSzxhaAOd8+iPdm0UudsV0+RDZBYx/x0qaDfN2R0eRlsQ6HZ5Z3+QMd9
 wiVMsuIc/Lv8O4xbdObO/z452ffX036ZDI7iyfWgCL+VZQ6o38vZ+hQ0Hnee4Z5LQDa+
 zRbFB13yv5ApyN8EKfrSe8auTRXzyCqPHlr0IvDmlnGFzUnZe0P3xfClQ2eDYfwxGpXr
 MGNJXZHousedGcjiDvFWEzIi8olldVVuyDyn8fE2T9A4Mu6F+0kYUcCpQu6TtVI4ZItZ
 JqpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFgMqnRnuc7YDZTsyLNSNkweSMCDUBlFNxqg2xoU6O95ERB0KcAMXKblu0Ko+pGsdmWNdEhTVPUZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTXdd+ogMIx41+s8/EVyEa/ZgFvt2nvZxHq9erQQZ5Ct6wCtsc
 yz51K5yXUmXdcwJ7iBLUCSw/4FVs8DxoxjT0CAg7eJ79q8L5HF8vtRZIBUz5OhQ=
X-Gm-Gg: ASbGncsrwO6BVQzaICD108QChRV27Eh96WJ57sF0snu02HEOnyTWNVSTdVSkzWki58B
 9YaY3IM5Joso93ZGBOzCyv5nxMEusvyJLSiAVvT+zKb4LSyp0RTTQlQLPO32uSVzgYY/XJw35Q1
 jgoRESHzl01jGOuN6yFShYgiRjvhItGLC3yEa9ISPywj7SpK8KXF2/6wp9pfJSG0RNQ7d/TDxFQ
 jNzuj98lw0Jk2wGv/K8ndcFOcE8zHcslIPyGJw6FoUxyz//as09+f2DAlckLwcdRhUsGoNf7MVg
 RDyn8u9NLSqmTeANV4CVwD+4syHce6wLbg==
X-Google-Smtp-Source: AGHT+IGyoN5lvEyWoIQKeZ0cauegZG/9/HnT3c9dEG7V7kOpedR0OZrCmSQf0J/flV38TzNZUm43Vg==
X-Received: by 2002:a05:651c:541:b0:302:2c61:a1d3 with SMTP id
 38308e7fff4ca-3022fd89c5dmr7913551fa.36.1733778255053; 
 Mon, 09 Dec 2024 13:04:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30220d0b34fsm4716121fa.60.2024.12.09.13.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 13:04:13 -0800 (PST)
Date: Mon, 9 Dec 2024 23:04:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
Message-ID: <d5yfas7yzilvjryrtdi2miaw5khnycm7egn4dd5ff3vu7z4op5@oit2xvsyx5l5>
References: <20241209-check-state-before-dump-v1-1-7a9d8bc6048f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209-check-state-before-dump-v1-1-7a9d8bc6048f@quicinc.com>
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

On Mon, Dec 09, 2024 at 12:37:51PM -0800, Abhinav Kumar wrote:
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
> 
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 3ffac24333a2a5b01135d4ece418432d4a74dc04..fe3fd9587ec61f241ccb8c28925c7902b92bcdcd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1333,14 +1333,17 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>  	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>  	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>  
> -	drm_printf(p, "\tstage=%d\n", pstate->stage);
> -
> -	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> -	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
> -	drm_printf(p, "\tmultirect_index[0]=%s\n",
> -		   dpu_get_multirect_index(pipe->multirect_index));
> -	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> -	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> +	if (pipe->sspp) {
> +		drm_printf(p, "\tstage=%d\n", pstate->stage);

Please keep pstate->stage out of the if() statement. LGTM otherwise.

> +
> +		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> +		drm_printf(p, "\tmultirect_mode[0]=%s\n",
> +			   dpu_get_multirect_mode(pipe->multirect_mode));
> +		drm_printf(p, "\tmultirect_index[0]=%s\n",
> +			   dpu_get_multirect_index(pipe->multirect_index));
> +		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> +		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> +	}
>  
>  	if (r_pipe->sspp) {
>  		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
> 
> ---
> base-commit: 9d6a414ad31e8eb296cd6f2c1834b2c6994960a0
> change-id: 20241209-check-state-before-dump-2a015ace5f49
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry
