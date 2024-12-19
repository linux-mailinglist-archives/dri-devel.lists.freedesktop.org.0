Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C79F87DC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E7610EE04;
	Thu, 19 Dec 2024 22:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EOSlLvyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2714D10EE05
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 22:29:36 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1273312e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 14:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734647374; x=1735252174; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ktf00blgG2REd1F7A4BFFcm/g9cGAbuNL5IjQ8xXSgo=;
 b=EOSlLvynCJ0MjK2ZYpBIoC/4MPc/n/nYvOJ0YGNtolEXVzHf8/OoNE67MgeeYEa2sD
 eVJ/Xfv8v3oB+y0qYTuh4VliFw3z/MmwI2jIjvW381kju7mow9p0BOPzkTam6fc6NjfW
 jZiBLEryWWHupDmrwXJu/GOB+mihbWhzO6zgxa4DfH8L+X+LRDl1tip82KL+4I/FS16x
 f1frXn5K/xXXYRb5zIKfZ7u7PUt4VzXHKQWJNeYNjrBTkE2ffvJzyp2EfomEfpBUE2M4
 YdqZFOgMfc9YmTuZH1gWIt1q9ZRBm1Q9RVEzpKpg7ON5SsYpPVnimKEyihwJTrHnGxcH
 LgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734647374; x=1735252174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ktf00blgG2REd1F7A4BFFcm/g9cGAbuNL5IjQ8xXSgo=;
 b=fikxJoUV8/qnrMoYf+yMxm5JTH1j2anV0JaHs7nKOK5u7wz8gDx0J0lUU3J90TWGDY
 2vPckwBGlKmTnKaLx/p9T6QWFiOTZRbDBFe2NO2mS4hApLxMZI9LEoRg39YmpQG3fh4F
 ymANjZyk6YQIwwsy84zKNyDSmji+yM6eGRJta3tdCBqDk9pQIL9LKyrpBaKI5hLQLUEO
 JpVf33NUEPAxIFApQfaMR2EbI+Tcj85wiT1WbSOlEHkDN9D3aKqc82TO8NIi4zLyxy9h
 DrytwSrpBp7Pin/+pvkzFG2Jpp93PS5Wb/t/KlR7KEF6aRfJPiDBIQw9rjNUSQtKskOi
 qKPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBIkuUeAqyrqB01ripWy5lmb0VvZy5ON3HRrf1P4x9zI5lZhQxcG/tYZ8Vt3Z/Gr6z8APKaskenJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ3G3qXgijeXQgxGPT27XeRu0mXipNK7s9GcX+zQ16AX2gOCjV
 LPpeSpme/h/BnCGLUp1paKjW097KDgTQaGzwlIoAkUqd+MghYRtZyNFLbmVs67T8uMSnfes29bh
 2
X-Gm-Gg: ASbGncstQ9hJcuX2IiUv+rjyLiazsdxBt9ZwXowynBU0EN8uqb7fvKmOBVNlVjg3NLt
 WiJK9A8eA60HDk11lLRbeSMGTM71rAtEhfuLD6XENzwRFKmXA9ENC2lJLn+i9+jZfd3fotececb
 U0gHGn9PANQuEpj8jMdK7cjzGXfRPvVOcP10Il6RoHou1Q8hW4oCbG0X+SIJx79nFBF+Dny4ZVw
 ROTELMUGo7Y6c7tSOwkjmTI8OZZYOztl4bll7kslyY4LszVsBzSzqVE58Ndx0CelnC+Orb1mNfw
 8ucYb98iIWUtz1wY+0CX6zvigFDoWiA5PGqE
X-Google-Smtp-Source: AGHT+IFMM7IxIREim+tWSsfHbYnZXp42QWfaJbZuCEzIN329HrV4/pAlBkqpNqL2/3JQwCfAxNPnzw==
X-Received: by 2002:a05:6512:3087:b0:540:1a33:dede with SMTP id
 2adb3069b0e04-54229533383mr60123e87.21.1734647374424; 
 Thu, 19 Dec 2024 14:29:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f66fbsm291938e87.21.2024.12.19.14.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:29:34 -0800 (PST)
Date: Fri, 20 Dec 2024 00:29:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
Message-ID: <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:28PM +0800, Jun Nie wrote:
> Add pipe as trace argument to ease converting pipe into
> pipe array later.

Isn't it already converted in on of the previous patches? Also you are
adding it to a particular trace function, trace_dpu_crtc_setup_mixer().

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 72ed8749cd716..6841d0504d450 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  
>  	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>  				   state, to_dpu_plane_state(state), stage_idx,
> -				   format->pixel_format,
> +				   format->pixel_format, pipe,
>  				   modifier);
>  
>  	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 5307cbc2007c5..cb24ad2a6d8d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>  	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
>  		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
>  		 uint32_t stage_idx, uint32_t pixel_format,
> -		 uint64_t modifier),
> +		 struct dpu_sw_pipe *pipe, uint64_t modifier),
>  	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> -		pixel_format, modifier),
> +		pixel_format, pipe, modifier),
>  	TP_STRUCT__entry(
>  		__field(	uint32_t,		crtc_id		)
>  		__field(	uint32_t,		plane_id	)
> @@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>  		__entry->dst_rect = drm_plane_state_dest(state);
>  		__entry->stage_idx = stage_idx;
>  		__entry->stage = pstate->stage;
> -		__entry->sspp = pstate->pipe.sspp->idx;
> -		__entry->multirect_idx = pstate->pipe.multirect_index;
> -		__entry->multirect_mode = pstate->pipe.multirect_mode;
> +		__entry->sspp = pipe->sspp->idx;
> +		__entry->multirect_idx = pipe->multirect_index;
> +		__entry->multirect_mode = pipe->multirect_mode;
>  		__entry->pixel_format = pixel_format;
>  		__entry->modifier = modifier;
>  	),
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
