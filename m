Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3848984EC1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE0110E8E7;
	Tue, 24 Sep 2024 23:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LnKGR0q7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DA710E8E7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:16:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-537a2a2c74fso351357e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727219779; x=1727824579; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=moQz4inI3YwnAOviXk1VVat+DdfU98cn6Ehk6mxCVSM=;
 b=LnKGR0q77yyJWkP1+7IdC4YvuBPQG+s4MdSV71E4EcqsriUG3DYchgCk8RdH5HnUZn
 rosTqvuf++bA0jMX53Dv0VO5RuAe0W4/R1nEWW7lafi728dPauSbtLZ/l3XQQgwOIUh+
 tUc58TErD/SdCsX9XfXXNEQ4vYuOXk6h6iA8xxHf1CCxhtYcyuP1osi9Sc7mOoQcC3dQ
 00FcogZrxzb2QS9K8mVVj8Hp24yF/9yO5qhKc7OC5F1UTveXcwxzeDr9+0Slc82x4kcu
 1D6y1AB0X+89aeBtVnsqCe2IfyTjlHKJYbPtT0CiQvVrmwLrujtxtYND6jDnZxXPcDV1
 QSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727219779; x=1727824579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=moQz4inI3YwnAOviXk1VVat+DdfU98cn6Ehk6mxCVSM=;
 b=iIeyYqxrKhw4+r68CnGAk2r4qDjUoOYMcHDFZMNV/7ECqlO9RlJ25y6+qbjBl3xD+q
 ybh1J2W7EfOsVcDG5aHD21AwWik3c2kQG+ElpXqReRikE0hpY24RrYFFFae/Er7Ugapq
 6UJFvQ0W8euaBsicg+6cvPxQrZIiNpsTv4IwkAj089LWUW+3VrXGDqDzgZppmZHORfF0
 dmGJuFxLSJdcVPtPyfWe8GY+UFCNyCAkfXsZWjMvf0h7bU16AHAYfsQZkKDVMb5U+C59
 bXdVmXzjiKNsb0jk8e7QP08oCPwvAXA+QgTJQHchGdT8dTEM4FwsXBez/e0jJ5O88eDi
 bLoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqpIQAjS/VDn5OkULb39ve+v78QEpqq+gfAC+9vNEQjg+u25ML02BN70AsAvIqO8LypNAdqby9oMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIsQkz7JlW/StBMWg20qZoLBZyNYv8jQSYSS39f9a1mNbefGrZ
 t+O3ZqZ6TNEs/kzMuDTmkgOig8AwnmVMpgXsVlxwNwO7yk/4pD6Ac50BZMKQchk=
X-Google-Smtp-Source: AGHT+IH7hVzjaM5XkRJ2ko9TD7TMXrD/sSXqmetC1fkEqMx7PameMrwDPrFOU5wxWxP3Arsnf+1Mtw==
X-Received: by 2002:a05:6512:3d8d:b0:533:4191:fa4a with SMTP id
 2adb3069b0e04-537a68f4631mr1809859e87.15.1727219778578; 
 Tue, 24 Sep 2024 16:16:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a8651393sm348601e87.309.2024.09.24.16.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:16:18 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:16:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 06/22] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Message-ID: <4c7spborzltmvjlbd2o4uwknraitjtf34mqt7r3x2ospnaidyn@abvn5zdumvwt>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-6-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-6-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:22PM GMT, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
> from dpu_crtc_assign_resources().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: cleaned up formatting]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: dropped clearing num_mixers in CRTC disable
> path]

Same comment as before: the code is still there.

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 32 ++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++--------------------
>  2 files changed, 31 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b918c80d30b3..d53e986eee54 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>  
>  	dpu_core_perf_crtc_update(crtc, 0);
>  
> -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> -	cstate->num_mixers = 0;
> -
>  	/* disable clk & bw control until clk & bw properties are set */
>  	cstate->bw_control = false;
>  	cstate->bw_split_vote = false;
> @@ -1164,6 +1161,7 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>  }
>  
>  #define MAX_HDISPLAY_SPLIT 1080
> +#define MAX_CHANNELS_PER_CRTC 2
>  
>  static struct msm_display_topology dpu_crtc_get_topology(
>  		struct drm_crtc *crtc,
> @@ -1208,9 +1206,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  
>  static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
>  {
> +	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
> +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_CRTC];
> +	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_CRTC];
> +	int i, num_lm, num_ctl, num_dspp;
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>  	struct dpu_global_state *global_state;
>  	struct msm_display_topology topology;
> +	struct dpu_crtc_state *cstate;
>  	int ret;
>  
>  	/*
> @@ -1232,6 +1235,29 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
>  	if (ret)
>  		return ret;
>  
> +	cstate = to_dpu_crtc_state(crtc_state);
> +
> +	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +						crtc, DPU_HW_BLK_CTL, hw_ctl,
> +						ARRAY_SIZE(hw_ctl));
> +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +					       crtc, DPU_HW_BLK_LM, hw_lm,
> +					       ARRAY_SIZE(hw_lm));
> +	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +						 crtc, DPU_HW_BLK_DSPP, hw_dspp,
> +						 ARRAY_SIZE(hw_dspp));
> +
> +	for (i = 0; i < num_lm; i++) {
> +		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> +
> +		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> +		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> +		if (i < num_dspp)
> +			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> +	}
> +
> +	cstate->num_mixers = num_lm;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ada9119326ca..36b677cf9c7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1049,14 +1049,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_encoder_virt *dpu_enc;
>  	struct msm_drm_private *priv;
>  	struct dpu_kms *dpu_kms;
> -	struct dpu_crtc_state *cstate;
>  	struct dpu_global_state *global_state;
>  	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>  	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> -	int num_lm, num_ctl, num_pp, num_dsc;
> +	int num_pp, num_dsc;
>  	unsigned int dsc_mask = 0;
>  	int i;
>  
> @@ -1083,13 +1080,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>  		ARRAY_SIZE(hw_pp));
> -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
>  	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> -		ARRAY_SIZE(hw_dspp));
> +			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));

Please don't mix reindentation with the actual changes. It makes it
harder to read.

>  
>  	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>  		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> @@ -1115,18 +1107,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
>  	}
>  
> -	cstate = to_dpu_crtc_state(crtc_state);
> -
> -	for (i = 0; i < num_lm; i++) {
> -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> -
> -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> -		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> -	}
> -
> -	cstate->num_mixers = num_lm;
> -
>  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
