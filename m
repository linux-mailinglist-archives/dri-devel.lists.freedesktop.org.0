Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01009FB960
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 06:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E3310E27D;
	Tue, 24 Dec 2024 05:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FK/Fd7wc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E86010E45F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 05:02:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54025432becso5040605e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 21:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735016535; x=1735621335; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hqUplIjV+TQuDOCxd/dA3VUIf/gZpdRIKkbJK+V73kk=;
 b=FK/Fd7wc+knJlM4HVTeebs3IOPVpBIELO/mb5JIdkLHLR/D0Ivj2xMjXHYf3JmWFwi
 fEV+iE/Hmn7SyBzhSpdMutR3Gm8fYJ2WcCQLowku9Or64oRc2mD6na6v+EaquVjUiSxC
 4mJAJUCi2ToSVg7MJhsA08nNCcP5n9wYyR9TQX7zDbF73GKhq6SxtLIcgwGU+xjsMPXh
 jrRrbZ90inUtVkduhsEAx54YKX4ozX9FbhocCvfyVbc9BqfNQImj9dB//7NGVttWrj08
 7D8cvzUOwXXC1QY91faayQ9lffhS0oY8BhenEGuS5lKrIqu5TbqWYc1ixmaqgzCE3gUQ
 smKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735016535; x=1735621335;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqUplIjV+TQuDOCxd/dA3VUIf/gZpdRIKkbJK+V73kk=;
 b=qmJzu06q271doNuKy93W90tkAPlgKrXD49o6uvPLTyNKuLOaayJJMdQXUEk43xnJZB
 JHUl9rgJbBqCTRGcM1u1dwJN2UUKy6X1+HPfZAG1YUNYzrz4y/0YQ7aUyF9rgwQ/+OFv
 6h00eY2R8lfyTslqrv7fxLfeA0+HvHF3+DDhv3Vt7aW6IJzYxSUrmbuwuRm880f8TIUj
 JAG5Ez/VY7v4SKykjnop62UUGjYW3yVOjBEuSKHQJ67S/0yIwgEr4OlWDUHdBwUwxsfi
 FztEM23ZLUehy0soYV6l1kW2oUlm5IlgodK4B+BcE22sHiDH8vHiShvceoYTxfRcZ+QV
 Ftmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+z0ZMgjqx2+hELnp1mfLdsXre5F4nXczrZ6ycgejrRZ4Ku9xe91Srm9FFRugTqnoj5vlpqOQDWz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrBIw5LcpIayGHu6kAZ0CeONzWad3/u0uKRW77YWRDXUfBdd+q
 3I//uCEjtZtN8MU9tPi9y+/pWzaFV/9lS0lC/wb9DES6dcQ3cNasglp6Sgh/k/w=
X-Gm-Gg: ASbGncs1sT688VzpF3hVcLIOiIkj1kchxv3LoLbDLOJDjmbes66ko37RPJVkYaYUmEN
 5pn6boDoocpmglPDKcF98gLP+jYiNr3VQBOmKCAm5Ar/RxrmAlVVnnkrGK8cwcluihD6WhfabAJ
 iMtKGvcEzchT/6/qmKXBibYtb+BfPG3eFXF7KXtJvwAS/gaxmKh4nKoM9wHAxjj6YvXJS3disNa
 jy8Jh3oAdui6/g66+8nACLiwM6fjbIqQItH5QNpKZfo/6D7953UkCx7C2k/PObxMzLhovwdNTou
 IDMZ0m2wujZcqEpehI3P+R6LHj0TmcdAcBMP
X-Google-Smtp-Source: AGHT+IHfZEYnMGS/7Hwur+um5VWcx75oAzisP8vBOaDbrUzOJjcORdmzgFv+PXWI59XIt6+NQBUEKg==
X-Received: by 2002:a05:6512:3d10:b0:53e:350a:72a0 with SMTP id
 2adb3069b0e04-54229598a27mr5159963e87.51.1735016534496; 
 Mon, 23 Dec 2024 21:02:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f66bdsm1478626e87.16.2024.12.23.21.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 21:02:13 -0800 (PST)
Date: Tue, 24 Dec 2024 07:02:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 07/25] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <bvaxcfku5lwldww6qcwfe4ukv2xxd2ivaidvewylofgltba2rv@jx65h5ems67g>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:18PM -0800, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All resource allocation is centered around the LMs. Then other blocks
> (except DSCs) are allocated basing on the LMs that was selected, and LM
> powers up the CRTC rather than the encoder.
> 
> Moreover if at some point the driver supports encoder cloning,
> allocating resources from the encoder will be incorrect, as all clones
> will have different encoder IDs, while LMs are to be shared by these
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 256 ++++++++++------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
>  3 files changed, 181 insertions(+), 169 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f6ffd344693ecfb633095772a31ada5613345dc..186ed84f59f16997716fe216e635b8dce07a63a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1182,6 +1182,78 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>  	return false;
>  }
>  
> +#define MAX_HDISPLAY_SPLIT 1080
> +
> +static struct msm_display_topology dpu_crtc_get_topology(
> +		struct drm_crtc *crtc,
> +		struct dpu_kms *dpu_kms,
> +		struct drm_crtc_state *crtc_state)
> +{
> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +	struct msm_display_topology topology = {0};
> +	struct drm_encoder *drm_enc;
> +
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
> +		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> +					    &crtc_state->adjusted_mode);
> +
> +	/*
> +	 * Datapath topology selection
> +	 *
> +	 * Dual display
> +	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> +	 *
> +	 * Single display
> +	 * 1 LM, 1 INTF
> +	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> +	 *
> +	 * Add dspps to the reservation requirements if ctm is requested
> +	 */
> +
> +	if (topology.num_intf == 2)
> +		topology.num_lm = 2;
> +	else if (topology.num_dsc == 2)
> +		topology.num_lm = 2;
> +	else if (dpu_kms->catalog->caps->has_3d_merge)
> +		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> +	else
> +		topology.num_lm = 1;
> +
> +	if (crtc_state->ctm)
> +		topology.num_dspp = topology.num_lm;
> +
> +	return topology;
> +}
> +
> +static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
> +{
> +	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> +	struct dpu_global_state *global_state;
> +	struct msm_display_topology topology;
> +	int ret;
> +
> +	/*
> +	 * Release and Allocate resources on every modeset
> +	 * Dont allocate when enable is false.
> +	 */
> +	global_state = dpu_kms_get_existing_global_state(dpu_kms);
> +	if (IS_ERR(global_state))
> +		return PTR_ERR(global_state);
> +
> +	dpu_rm_release(global_state, crtc);
> +
> +	if (!crtc_state->enable)
> +		return 0;
> +
> +	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
> +	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> +			     crtc, &topology);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  		struct drm_atomic_state *state)
>  {
> @@ -1193,10 +1265,24 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	const struct drm_plane_state *pstate;
>  	struct drm_plane *plane;
>  
> +	struct drm_encoder *drm_enc;
> +
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>  
> +	/* there might be cases where encoder needs a modeset too */
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> +		if (dpu_encoder_needs_modeset(drm_enc, crtc_state->state))
> +			crtc_state->mode_changed = true;

I will postpone this patch for a while, pending the review of the
drm_atomic_helper_check_modeset() series

https://lore.kernel.org/dri-devel/20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org/

Not to mention that this commit looks broken, see below.

> +	}
> +
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		rc = dpu_crtc_assign_resources(crtc, crtc_state);
> +		if (rc < 0)
> +			return rc;
> +	}
> +
>  	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
>  		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>  				crtc->base.id, crtc_state->enable,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index e6f930dd34566d01223823de82c922668e6be300..2b999a0558b2a016644ed5d25bf54ab45c38d1d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -58,8 +58,6 @@
>  
>  #define IDLE_SHORT_TIMEOUT	1
>  
> -#define MAX_HDISPLAY_SPLIT 1080
> -
>  /* timeout in frames waiting for frame done */
>  #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
>  
> @@ -609,206 +607,127 @@ void dpu_encoder_helper_split_config(
>  	}
>  }
>  
> -/**
> - * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
> - * @drm_enc:    Pointer to previously created drm encoder structure
> - */
> -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> +				 struct msm_display_topology *topology,
> +				 struct drm_atomic_state *state,
> +				 const struct drm_display_mode *adj_mode)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int i, intf_count = 0, num_dsc = 0;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct msm_display_info *disp_info;
> +	struct drm_framebuffer *fb;
> +	struct msm_drm_private *priv;
> +	int i;
>  
>  	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>  		if (dpu_enc->phys_encs[i])
> -			intf_count++;
> +			topology->num_intf++;
>  
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
>  	if (dpu_enc->dsc)
> -		num_dsc = 2;
> -
> -	return (num_dsc > 0) && (num_dsc > intf_count);
> -}
> -
> -/**
> - * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
> - *   This helper function is used by physical encoder to get DSC config
> - *   used for this encoder.
> - * @drm_enc: Pointer to encoder structure
> - */
> -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> -{
> -	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int index = dpu_enc->disp_info.h_tile_instance[0];
> +		topology->num_dsc += 2;
>  
> -	if (dpu_enc->disp_info.intf_type == INTF_DSI)
> -		return msm_dsi_get_dsc_config(priv->dsi[index]);
> +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> +	if (!connector)
> +		return;
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!conn_state)
> +		return;
>  
> -	return NULL;
> -}
> +	disp_info = &dpu_enc->disp_info;
>  
> -static struct msm_display_topology dpu_encoder_get_topology(
> -			struct dpu_encoder_virt *dpu_enc,
> -			struct dpu_kms *dpu_kms,
> -			struct drm_display_mode *mode,
> -			struct drm_crtc_state *crtc_state,
> -			struct drm_dsc_config *dsc)
> -{
> -	struct msm_display_topology topology = {0};
> -	int i, intf_count = 0;
> +	priv = drm_enc->dev->dev_private;
>  
> -	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> -		if (dpu_enc->phys_encs[i])
> -			intf_count++;
> -
> -	/* Datapath topology selection
> -	 *
> -	 * Dual display
> -	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> -	 *
> -	 * Single display
> -	 * 1 LM, 1 INTF
> -	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> -	 *
> -	 * Add dspps to the reservation requirements if ctm is requested
> +	/*
> +	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> +	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +	 * earlier.
>  	 */
> -	if (intf_count == 2)
> -		topology.num_lm = 2;
> -	else if (!dpu_kms->catalog->caps->has_3d_merge)
> -		topology.num_lm = 1;
> -	else
> -		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> -
> -	if (crtc_state->ctm)
> -		topology.num_dspp = topology.num_lm;
> -
> -	topology.num_intf = intf_count;
> +	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> +		fb = conn_state->writeback_job->fb;
>  
> -	if (dsc) {
> -		/*
> -		 * In case of Display Stream Compression (DSC), we would use
> -		 * 2 DSC encoders, 2 layer mixers and 1 interface
> -		 * this is power optimal and can drive up to (including) 4k
> -		 * screens
> -		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> -		topology.num_intf = 1;
> +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> +			topology->needs_cdm = true;
> +	} else if (disp_info->intf_type == INTF_DP) {
> +		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> +			topology->needs_cdm = true;
>  	}
> -
> -	return topology;
>  }
>  
> -static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> -					      struct drm_encoder *drm_enc,
> -					      struct dpu_global_state *global_state,
> -					      struct drm_crtc_state *crtc_state)
> +static bool dpu_encoder_needs_dsc_merge(struct drm_encoder *drm_enc)
>  {
> -	struct dpu_crtc_state *cstate;
> -	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> -	int num_lm, num_ctl, num_dspp, i;
> -
> -	cstate = to_dpu_crtc_state(crtc_state);
> -
> -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> -
> -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> -	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> -		ARRAY_SIZE(hw_dspp));
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	u32 num_intf = 0;
> +	u32 num_dsc = 0;
> +	int i;
>  
> -	for (i = 0; i < num_lm; i++) {
> -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> +	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> +		if (dpu_enc->phys_encs[i])
> +			num_intf++;
>  
> -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> -		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> -	}
> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> +	if (dpu_enc->dsc)
> +		num_dsc += 2;
>  
> -	cstate->num_mixers = num_lm;
> +	return (num_dsc > 0) && (num_dsc > num_intf);

Ok, so after all the rebases this commit removes CRTC resource
assignment from dpu_encoder.c, but they are added to dpu_crtc.c only in
the next commit! So after this one the tree is broken. This isn't really
acceptable. After each commit the tree should work, otherwise git-bisect
might return incorrect results.

Historically this patch just moved the allocation to the
dpu_crtc_atomic_check(), while cstate has been maniputated in
dpu_encoder_virt_atomic_mode_set(). Commit 3ae133b0192b ("drm/msm/dpu:
move CRTC resource assignment to dpu_encoder_virt_atomic_check") moved
resource handling to the atomic_check() stage. I think at this point you
need to take one step back, return to the previous commits, but revert
their order: first move cstate manipulation to happen during the
dpu_crtc_atomic_check() function call, leaving dpu_rm_release() /
dpu_rm_reserve() out of dpu_crtc_assign_resources() (in
dpu_encoder_virt_atomic_check() as they are now). Then can come this
patch, which moves topology handling, resource reservation, etc. to
dpu_crtc.c.

>  }
>  
> -static int dpu_encoder_virt_atomic_check(
> -		struct drm_encoder *drm_enc,
> -		struct drm_crtc_state *crtc_state,
> -		struct drm_connector_state *conn_state)
> +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
>  {
> -	struct dpu_encoder_virt *dpu_enc;
> -	struct msm_drm_private *priv;
> -	struct dpu_kms *dpu_kms;
> -	struct drm_display_mode *adj_mode;
> -	struct msm_display_topology topology;
> -	struct msm_display_info *disp_info;
> -	struct dpu_global_state *global_state;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
>  	struct drm_framebuffer *fb;
> -	struct drm_dsc_config *dsc;
> -	int ret = 0;
> -
> -	if (!drm_enc || !crtc_state || !conn_state) {
> -		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
> -				drm_enc != NULL, crtc_state != NULL, conn_state != NULL);
> -		return -EINVAL;
> -	}
> -
> -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	DPU_DEBUG_ENC(dpu_enc, "\n");
> -
> -	priv = drm_enc->dev->dev_private;
> -	disp_info = &dpu_enc->disp_info;
> -	dpu_kms = to_dpu_kms(priv->kms);
> -	adj_mode = &crtc_state->adjusted_mode;
> -	global_state = dpu_kms_get_global_state(crtc_state->state);
> -	if (IS_ERR(global_state))
> -		return PTR_ERR(global_state);
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>  
> -	trace_dpu_enc_atomic_check(DRMID(drm_enc));
> +	if (!drm_enc || !state)
> +		return false;
>  
> -	dsc = dpu_encoder_get_dsc_config(drm_enc);
> +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> +	if (!connector)
> +		return false;
>  
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
>  
> -	/*
> -	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> -	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> -	 * earlier.
> -	 */
> -	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> +	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
>  		fb = conn_state->writeback_job->fb;
> -
> -		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> -			topology.needs_cdm = true;
> -	} else if (disp_info->intf_type == INTF_DP) {
> -		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> -			topology.needs_cdm = true;
> +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
> +			if (!dpu_enc->cur_master->hw_cdm)
> +				return true;
> +		} else {
> +			if (dpu_enc->cur_master->hw_cdm)
> +				return true;
> +		}
>  	}
>  
> -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
> -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
> -	/*
> -	 * Release and Allocate resources on every modeset
> -	 * Dont allocate when active is false.
> -	 */
> -	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -		dpu_rm_release(global_state, crtc_state->crtc);
> +	return false;
> +}
>  
> -		if (!crtc_state->active_changed || crtc_state->enable)
> -			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -					crtc_state->crtc, &topology);
> -		if (!ret)
> -			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
> -							  global_state, crtc_state);
> -	}
> +/**
> + * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
> + *   This helper function is used by physical encoder to get DSC config
> + *   used for this encoder.
> + * @drm_enc: Pointer to encoder structure
> + */
> +struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> +{
> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	int index = dpu_enc->disp_info.h_tile_instance[0];
>  
> -	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> +	if (dpu_enc->disp_info.intf_type == INTF_DSI)
> +		return msm_dsi_get_dsc_config(priv->dsi[index]);
>  
> -	return ret;
> +	return NULL;
> +}
> +
> +/**
> + * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> +{
> +	return dpu_encoder_needs_dsc_merge(drm_enc);
>  }
>  
>  static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> @@ -2627,7 +2546,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>  	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
>  	.atomic_disable = dpu_encoder_virt_atomic_disable,
>  	.atomic_enable = dpu_encoder_virt_atomic_enable,
> -	.atomic_check = dpu_encoder_virt_atomic_check,
>  };
>  
>  static const struct drm_encoder_funcs dpu_encoder_funcs = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 92b5ee390788d16e85e195a664417896a2bf1cae..3db3ea076c377ad5411ec85006bcf4cd9757eb1d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -11,6 +11,7 @@
>  
>  #include <drm/drm_crtc.h>
>  #include "dpu_hw_mdss.h"
> +#include "dpu_kms.h"
>  
>  #define DPU_ENCODER_FRAME_EVENT_DONE			BIT(0)
>  #define DPU_ENCODER_FRAME_EVENT_ERROR			BIT(1)
> @@ -80,6 +81,13 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
>  
>  bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
>  
> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> +				 struct msm_display_topology *topology,
> +				 struct drm_atomic_state *state,
> +				 const struct drm_display_mode *adj_mode);
> +
> +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state);
> +
>  void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
>  		struct drm_writeback_job *job);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
