Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0760DA134B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7487F10E8E6;
	Thu, 16 Jan 2025 08:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hHrfZrog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F074E10E8E6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 08:08:23 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30615661f98so7039401fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 00:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737014902; x=1737619702; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OvjQGS9v3GeYSYSe2LBAG448Vja+LlRvw7uplzopV8w=;
 b=hHrfZrogi4yj+UjpvZazAopurVzUXLWjLovg65MlRAOaKguzCQo4FhaAshbOZouGyg
 8A9vUiGNuxP2q+YWOvH0F6e9mKY+0LA0dckK5UuwMSNvHqjtLa7Wo8N0cBCWvvBJQvcP
 PBiEx7bFk5PnVOj3Cl65XZfXAsRAufw85QvMzIVn0i3r7r9mnjekRzn2ThDXme0EGL/f
 f+E6YVc5Up6Y42clIX+AhjL9gMKzZsuDukGfAgY5F3igSxdB7QkbsUbl8V5ZSx9ZAORi
 I3SE45sSjV/0wLJoipxJoaQ9wVmauZdikwkwLRuGeuV3JASZdHMXJvjP2fnes/wGfKtQ
 KHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737014902; x=1737619702;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvjQGS9v3GeYSYSe2LBAG448Vja+LlRvw7uplzopV8w=;
 b=e4M6cZFYxcLMDDgdCwmWyWueYWkBzqGCdS+1Uvx/D1pgPzKn/t+8TdCuxSBHj+A9jh
 J6ygi9wpF+YmKYBrwFcuG4uujQDm9D3ysR1Dj/sKn5w/yKy/DVaFaqQaPB6vr73e87Oo
 FClklILKrkWrWuc9JeWrWy+sfDCeBIHkOcc+cJGyg3Xb0wR5BImI06qGp40HTy612PLf
 1PFPTOTTKW+G3gRIe88gLFDepTdf/0M2MJbJZ+iDtV+AF/VXIkSE1s6Fd+0Lx34VxpFG
 5ELFijIyMo/iFygvMobl5yyqJYHYGMYoHMswDH7eX0gAs5Dwf7cNTvYSaJi3KH3aJvtj
 wNBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDnuExdtJ390dkPO0N1f0Dhl11vCwdV/Gx2g9FV3HqwvK4p4LVwGEokwz90bnW5hskgcoLnbf4i7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzipjXwu+ypJqGIOa0Ir1oF9mnBDycUCF/14KoP2GPmgRzoa4Sd
 lVsg00LB/lHPcvjNWbkD2GvURPxpuXx3DSGKk3w324tv/bFn0PtDuVwD5ST5OPw=
X-Gm-Gg: ASbGncsG41kUfUmMcpfpaP5msethvlzzDeRL7jI7/CASWLYYfCZh9ow+IbzLnK9OxaJ
 93usLLoSnzu5nIbic9ggGk9Hohjpb9XhvKt98Fd/IW0ty8AzrQ9UUFsS+Tjk5dkbqKIV/Ysx4Fy
 9YCLv136LJxc7j3pc0nXhr2l4ecWnofxZBcQijX+UJXgegeo4Bbtf2+NPzZk408oFqq2OZGtMIN
 Kp1n22vD6iux8VMRI2twCxgy5oieWOveeUyXUQm3zWx7NSdFQ47FrnmQrZqyjcFUTGkG4AeYRBt
 H/vs661cI6MDYUwpcCpYlj6ZrmSl3erCZG59
X-Google-Smtp-Source: AGHT+IGEHcCQjP4XA6TrXiXXldBmt08e0Vh4nxPE4SnDPCPsbcrbar+E8zfVOYTqQoHRGtLyWIB3yw==
X-Received: by 2002:a05:6512:a8e:b0:540:3572:1864 with SMTP id
 2adb3069b0e04-542845b35b6mr9642052e87.44.1737014902298; 
 Thu, 16 Jan 2025 00:08:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec067asm2271621e87.186.2025.01.16.00.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:08:21 -0800 (PST)
Date: Thu, 16 Jan 2025 10:08:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/16] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <actkdpr62j55cez7sbszrsjgsax7lwzlzk4qqe7rmqfo2y3u4a@2xro4eo56a25>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-12-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-12-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:26:01PM +0800, Jun Nie wrote:
> Currently, only 2 pipes are used at most for a plane. A stage structure
> describes the configuration for a mixer pair. So only one stage is needed
> for current usage cases. The quad-pipe case will be added in future and 2
> stages are used in the case. So extend the stage to an array with array size
> STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
> stage structure.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 42 +++++++++++++++++------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  2 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 81474823e6799..5ae640da53fbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -401,7 +401,6 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  				       struct dpu_hw_stage_cfg *stage_cfg
>  				      )
>  {
> -	uint32_t lm_idx;
>  	enum dpu_sspp sspp_idx;
>  	struct drm_plane_state *state;
>  
> @@ -426,8 +425,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
>  
>  	/* blend config update */
> -	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
> -		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
> +	mixer->lm_ctl->ops.update_pending_flush_sspp(mixer->lm_ctl, sspp_idx);

No. This is required if two LMs use different CTLs.

>  }
>  
>  static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 5f010d36672cc..64e220987be56 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,6 +34,7 @@
>  #define DPU_MAX_PLANES			4
>  #endif
>  
> +#define STAGES_PER_PLANE		2

it's 1, not 2.

>  #define PIPES_PER_PLANE			2

#define PIPES_PER_PLANE		(PIPES_PER_STAGE * STAGES_PER_PLANE)

>  #define PIPES_PER_STAGE			2
>  #ifndef DPU_MAX_DE_CURVES
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
