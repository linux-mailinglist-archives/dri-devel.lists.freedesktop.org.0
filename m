Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F09667F2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3768010E056;
	Fri, 30 Aug 2024 17:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nlRrlOeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1100410EAAC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:25:34 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5334a8a1b07so2528616e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725038732; x=1725643532; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tts8d/vsTb2shtPr8ARgYB6shyI2W4IvjVV+pUS/EO0=;
 b=nlRrlOeCqFEH7f1O4cQnO64NojUNVL2y0M36m/qKKEDnYY7gzY6zZ/jECnxuChQCsh
 ehSCTirQphQ5sc60w4Pw7ipHm4QYX/V8xBoRsyeeHX8LAzR+OY05jLDX+hvKTh5ah6kb
 c3BW4zwXZhZakLxVf0jQ2DoM7Bq76xVaFuMcpqemX1oapGkX3kXDqVvsBo9Ul4uB6VUy
 /dGqdsoh8NK+/ac4p07EyUT6F3Ej7TtLA6zDoc4Fv85G8379gq7aHgZbAWnQg5hFv+E7
 aX8uVzXSxaVtnErSwwgn6OIxLp+v5CX7kGMKQa3WaiMlNr6VWETJApf3bz0TkTOO9E+6
 QRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725038732; x=1725643532;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tts8d/vsTb2shtPr8ARgYB6shyI2W4IvjVV+pUS/EO0=;
 b=YZYl6psafDScNfxLjlObUBSTkl3+WopNE7LN3kY/ZftV5Kl7gnXNp5z8dVpKieTJJU
 VrE89Oq5uNR7gkCRN+XS/TI7y6hRonHRUY37hO1U+efDfzssyXXR5hdrHI3JUsqg8rwa
 PdjVWqvJ4BQr8X2vJ2loygUbOsmeN7PyLxgDUd2Mt8FpGkCC4CKzuRKLSmVoCRqCaiwe
 ukgnV7Nq2xbNNFvzDlnyAgOYayG7du4cfMTLf7vlspGfgVLfP+VzjyUC4RqcA/O8hn5l
 Jm0DEkQF9zJT7Kq2lUm/IaAOEOnD2I5Md+gfAs7AHQ3YUAfnz62yI+TfOgUkCFezOSA0
 Xgfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVFZXkrUgt00pSqkNRWf8/FXLi4F9HSatdEgrxmI0uDWT8uCPvZi4IKtw+O14tBscNRcNoNLMTcs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxna0MeO161kX6y6E4HdEZNEty05oD+h9IMaj3PaHS72pscMtx
 VVcrLpRtaMdqdZBsGiQFC+CuN+AOctCQEgwYNozxLCHeMD897/CGiiCzcWuokJg=
X-Google-Smtp-Source: AGHT+IE8/VaQxR5xEjwPCk3dHcHC7hA2aM+AJamVIo5ydsZa6i1ax86Oclom/5rHRIiZMUxAhFZJZQ==
X-Received: by 2002:a05:6512:224a:b0:52b:de5b:1b30 with SMTP id
 2adb3069b0e04-53546ba09afmr2488465e87.44.1725038731406; 
 Fri, 30 Aug 2024 10:25:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084ca95sm693710e87.245.2024.08.30.10.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:25:31 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:25:29 +0300
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
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 14/21] drm/msm/dpu: Reserve resources for CWB
Message-ID: <yohtzxysheoybac24hxil6zzzsqi4inx6oh6x7vaoj5lvtdf3u@vd5nax37ilqd>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-14-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-14-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:35PM GMT, Jessica Zhang wrote:
> Reserve dedicated pingpong blocks for CWB

Please explain design ideas. Having just a single phrase is usually not
enough.

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 65 +++++++++++++++++++++++++++++
>  3 files changed, 79 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 36b677cf9c7a..f1bd14d1f89e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2013 Red Hat
>   * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   *
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
> @@ -1054,6 +1054,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>  	int num_pp, num_dsc;
> +	bool is_cwb_encoder;
>  	unsigned int dsc_mask = 0;
>  	int i;
>  
> @@ -1067,6 +1068,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  
>  	priv = drm_enc->dev->dev_private;
>  	dpu_kms = to_dpu_kms(priv->kms);
> +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> +		dpu_enc->disp_info.intf_type == INTF_WB;
>  
>  	global_state = dpu_kms_get_existing_global_state(dpu_kms);
>  	if (IS_ERR_OR_NULL(global_state)) {
> @@ -1077,9 +1080,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	trace_dpu_enc_mode_set(DRMID(drm_enc));
>  
>  	/* Query resource that have been reserved in atomic check step. */
> -	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> -		ARRAY_SIZE(hw_pp));
> +	if (is_cwb_encoder)
> +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +			drm_enc->crtc, DPU_HW_BLK_DCWB_PINGPONG, hw_pp,
> +			ARRAY_SIZE(hw_pp));
> +	else
> +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +			drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> +			ARRAY_SIZE(hw_pp));

Why is this necessary? Can we still use DPU_HW_BLK_PINGPONG?

> +
>  	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index c43cb55fe1d2..c87790a1b940 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -77,6 +77,7 @@ enum dpu_hw_blk_type {
>  	DPU_HW_BLK_LM,
>  	DPU_HW_BLK_CTL,
>  	DPU_HW_BLK_PINGPONG,
> +	DPU_HW_BLK_DCWB_PINGPONG,
>  	DPU_HW_BLK_INTF,
>  	DPU_HW_BLK_WB,
>  	DPU_HW_BLK_DSPP,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 13f84375e15d..afad26556cd5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -236,6 +236,48 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>  	return -EINVAL;
>  }
>  
> +static int _dpu_rm_reserve_cwb_pingpong(struct dpu_rm *rm,
> +		struct dpu_global_state *global_state, uint32_t crtc_id,
> +		struct msm_display_topology *topology)
> +{
> +	int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> +	int cwb_pp_idx[MAX_BLOCKS];
> +
> +	/*
> +	 * Reserve additional dedicated CWB pingpong blocks for each mixer
> +	 *
> +	 * TODO: add support for reserving non-dedicated CWB pingpong blocks
> +	 */
> +	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> +			cwb_pp_count < num_cwb_pp; i++) {
> +		for (int j = PINGPONG_CWB_0 - PINGPONG_0;
> +				j < ARRAY_SIZE(rm->pingpong_blks); j++) {

Alignment...

> +			/*
> +			 * Odd LMs must be assigned to odd pingpongs and even
> +			 * LMs with even pingpongs
> +			 */
> +			if (reserved_by_other(global_state->pingpong_to_crtc_id,
> +						j, crtc_id) ||
> +					i % 2 != j % 2)
> +				continue;
> +
> +			cwb_pp_idx[cwb_pp_count] = j;
> +			cwb_pp_count++;
> +			break;
> +		}
> +	}
> +
> +	if (cwb_pp_count != num_cwb_pp) {
> +		DPU_ERROR("Unable to reserve all cwb pingpongs\n");
> +		return -ENAVAIL;
> +	}
> +
> +	for (int i = 0; i < cwb_pp_count; i++)
> +		global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
> +
> +	return 0;
> +}
> +
>  /**
>   * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
>   *	proposed use case requirements, incl. hardwired dependent blocks like
> @@ -617,6 +659,14 @@ static int _dpu_rm_make_reservation(
>  		return ret;
>  	}
>  
> +	if (topology->cwb_enabled) {
> +		ret = _dpu_rm_reserve_cwb_pingpong(rm, global_state,
> +				crtc_id, topology);
> +		if (ret) {
> +			DPU_ERROR("unable to find appropriate dcwb pingpongs\n");
> +			return ret;
> +		}
> +	}
>  
>  	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
>  			topology);
> @@ -706,6 +756,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  
>  	switch (type) {
>  	case DPU_HW_BLK_PINGPONG:
> +	case DPU_HW_BLK_DCWB_PINGPONG:
>  		hw_blks = rm->pingpong_blks;
>  		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
>  		max_blks = ARRAY_SIZE(rm->pingpong_blks);
> @@ -745,6 +796,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  		if (hw_to_crtc_id[i] != crtc_id)
>  			continue;
>  
> +		if (type == DPU_HW_BLK_PINGPONG) {
> +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> +
> +			if (pp->idx >= PINGPONG_CWB_0)
> +				continue;
> +		}
> +
> +		if (type == DPU_HW_BLK_DCWB_PINGPONG) {
> +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> +
> +			if (pp->idx < PINGPONG_CWB_0)
> +				continue;
> +		}
> +
>  		if (num_blks == blks_size) {
>  			DPU_ERROR("More than %d resources assigned to crtc %d\n",
>  				  blks_size, crtc_id);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
