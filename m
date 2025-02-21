Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED9AA3FB13
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1017E10EAF4;
	Fri, 21 Feb 2025 16:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lv3K5qT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8947610EAF6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:25:36 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30797730cbdso22666611fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740155135; x=1740759935; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zVZWunDIG7iJIj75JUGRirS9XvGJ484MyBZ0PrGNwBE=;
 b=Lv3K5qT7u/uOTEaSfqhwNk1scJaOUfOrxSFFzynGWEc0gl5rcnHEAgfDcAaPIBflui
 8UKmuNAiwvyHQK6CSezPeQqTDWstiwL1raVFdtbD9tjMUi4vH8cgN7NXnnVJCwUqd3fw
 pjCmq+B+wmvNaWlmOoGXPLXzFcnIz98yH7waWuOrl07+kqbY97j8/g/bc+qzPa76izMG
 uOOYMBBVK7WbPCSlaXnAHmTpKLSsk1YYrnjyrImzfnZWf+cyHZcbgcpW/rRWk1X2YtV+
 4+2mzcHLZ38S0zsz8n4EczhS8YaqOx7MAhLjEDiu3wur8snqoEjdnCbknVG2180Tlyt3
 kRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740155135; x=1740759935;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zVZWunDIG7iJIj75JUGRirS9XvGJ484MyBZ0PrGNwBE=;
 b=b6jrf4sAzD1AaTi+2UGmgdvoguUC1FY+EA/2i08TA3YvuB4gfGZgUPIEUuLOT/zN0d
 maekUS1rcM1UT7T8a+MlwG5EN0Bd720V3F+/6/J+X39yJLbrnIMFCVXZIdzfJEvqjh4h
 ooNhSg5JXiclakQ0JgeCYDXbuzgq6S5MzR6kHVm5YNnUS57Jh7MbmgA+3P30pxWcYA51
 Qs+DXOtgxSWuJuUi341XI1zIVU3Ha45CpiEJjoqCfiYL6P66TAA8I9RuSKxrE9rnad8f
 6IBzYTS8Ev2xYtdAWGJC/Val+pG2f58TW1CFMg4NCVfFpvR5KYGe8+XLVO3zjgIBrkTo
 jxwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb6zSsOZD4/eUwgHJd8V1t0c/AR4a/vpZFtTcqPaW68EmRrUurnQUQgPka10JXh9e4duNYtlnREWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKZdSKsYJZudaZYo65HhhL0QgncybSYpreshDxWlZqej6kZv/k
 epwGtAYbj6WH9LvKnXSw6i5ifKkH3oTnuoJnOjMnXaZDzMxzKnFxCosftIWDBs8=
X-Gm-Gg: ASbGnct4SsWvBbnK3ZDhjAu1Rv1ALJ5W6DDBh4P8KDVy2JnSQBssh0FNwm2jhR/Yi4B
 KKnyU5xsKiG/Bc6dEXgtBtSLGJSbuLyGgM1ZbZh1C+oeJ1Ysb65utryoZe51s0/V4R8n2pkv4PT
 RhmfQqf0170ZHFmo//gpuoxTUqTiLFm/tZI7JVrQG2rsbUZ1Dcakpi0+YZ3aa1Q7M/dQsXG7Cen
 i9AG3hW/Ono5qZLr+ooNz8X04B6R2iom1VmEPY2TWRvpSCfyvgas/RQTrFYwFxkJhcRAs5UoWpR
 hXR58ME8QToGNLowS68kPB68L0J3kjhJSc3LRi4OqKXbsfa5GLcQ0kkHqfob1fQa5pxFG5zCzWI
 MsEiQ4g==
X-Google-Smtp-Source: AGHT+IGwPCQwlJ8n3fHSVoLxs5y3AVSJq/S4VL0YsBEmcH8zygS1KlxAOHXc2+k8N/cIbIZteGkAQQ==
X-Received: by 2002:a2e:300e:0:b0:309:214a:6b16 with SMTP id
 38308e7fff4ca-30a598f6c81mr12214571fa.22.1740155134665; 
 Fri, 21 Feb 2025 08:25:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091011ed8bsm29249061fa.56.2025.02.21.08.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:25:33 -0800 (PST)
Date: Fri, 21 Feb 2025 18:25:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 18/21] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <4y2nj6qxbbp7etuweoyarcg7vpbyemparzclj7ulb46rxk7k3s@s6wjrjebuc3g>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-18-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-18-3ea95b1630ea@linaro.org>
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

On Fri, Feb 21, 2025 at 04:24:28PM +0100, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out,
> setup_border_color and so one for this.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 20 +++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
>  2 files changed, 94 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b9fe3a7343d54f6f8b5aad7982928d5fc728bd61..7a35939ece180c15898b2eaa2f1f451767c741ae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -319,15 +319,21 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>  	return true;
>  }
>  
> -static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> -		struct dpu_plane_state *pstate, const struct msm_format *format)
> +static void _dpu_crtc_setup_blend_cfg(const struct dpu_hw_ctl *ctl,
> +				      struct dpu_crtc_mixer *mixer,
> +				      struct dpu_plane_state *pstate,
> +				      const struct msm_format *format)
>  {
>  	struct dpu_hw_mixer *lm = mixer->hw_lm;
>  	uint32_t blend_op;
> -	uint32_t fg_alpha, bg_alpha;
> +	uint32_t fg_alpha, bg_alpha, max_alpha;
>  
>  	fg_alpha = pstate->base.alpha >> 8;
> -	bg_alpha = 0xff - fg_alpha;
> +	if (ctl->mdss_ver->core_major_ver < 12)
> +		max_alpha = 0xff;
> +	else
> +		max_alpha = 0x3ff;

So, CTL is passed only to get struct dpu_mdss_version? It can either be
passed directly or fetched via dpu_kms->catalog->mdss_ver

> +	bg_alpha = max_alpha - fg_alpha;
>  
>  	/* default to opaque blending */
>  	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
> @@ -337,7 +343,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>  	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
>  		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
>  			DPU_BLEND_BG_ALPHA_FG_PIXEL;
> -		if (fg_alpha != 0xff) {
> +		if (fg_alpha != max_alpha) {
>  			bg_alpha = fg_alpha;
>  			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
>  				    DPU_BLEND_BG_INV_MOD_ALPHA;
> @@ -348,7 +354,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>  		/* coverage blending */
>  		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
>  			DPU_BLEND_BG_ALPHA_FG_PIXEL;
> -		if (fg_alpha != 0xff) {
> +		if (fg_alpha != max_alpha) {
>  			bg_alpha = fg_alpha;
>  			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
>  				    DPU_BLEND_FG_INV_MOD_ALPHA |
> @@ -482,7 +488,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  
>  		/* blend config update */
>  		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
> -			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
> +			_dpu_crtc_setup_blend_cfg(ctl, mixer + lm_idx, pstate, format);
>  
>  			if (bg_alpha_enable && !format->alpha_enable)
>  				mixer[lm_idx].mixer_op_mode = 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..75bf3521b03c8e243ccfe1fc226aa71f23b296df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -19,12 +19,20 @@
>  
>  /* These register are offset to mixer base + stage base */
>  #define LM_BLEND0_OP                     0x00
> +
> +/* <v12 DPU with offset to mixer base + stage base */
>  #define LM_BLEND0_CONST_ALPHA            0x04
>  #define LM_FG_COLOR_FILL_COLOR_0         0x08
>  #define LM_FG_COLOR_FILL_COLOR_1         0x0C

lowercase hex

>  #define LM_FG_COLOR_FILL_SIZE            0x10
>  #define LM_FG_COLOR_FILL_XY              0x14
>  
> +/* >= v12 DPU */
> +#define LM_BORDER_COLOR_0_V12		0x1C

lowercase hex

> +#define LM_BORDER_COLOR_1_V12		0x20
> +
> +/* >= v12 DPU with offset to mixer base + stage base */
> +#define LM_BLEND0_CONST_ALPHA_V12	0x08

This doesn't seem to be aligned properly

>  #define LM_BLEND0_FG_ALPHA               0x04
>  #define LM_BLEND0_BG_ALPHA               0x08
>  

-- 
With best wishes
Dmitry
