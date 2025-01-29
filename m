Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7CEA22609
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 23:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55F10E1E1;
	Wed, 29 Jan 2025 22:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QeqT2Y3U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10D910E1E1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 22:04:47 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so113922e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738188286; x=1738793086; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nn+NcTr872jiU0vyNt8zW0XrUbMYhZRRGDuD467dm5Q=;
 b=QeqT2Y3U43BABe48nQhsJfsMDZjt1STD3OXcnxjlUqpDRIjzF34F7flg5tzBvqvXEY
 wbAqpZ8OVjfeg+xfZ0l2E3qN0+pa5q/dyyIRmvFbZ6dnEphxYL/BQxIPmL0pKl/XYvkh
 EtI6hF10B73g9SoJDetKP7gm+67lrLQYk/r0/JFq6dkRRlvAKx8uWB+38Pu1/pnxFru3
 ihiwVJafarCATSDHoqE/dF3NWd7DN7hb3wqXPvQjYIkmxVpACfvqgP2dAFM9qBIyfAjW
 D6IS2mIu1Y+ffBQdC9rAoRUzSmfe2bXvIDa7YK2lJ1MFQLIWoaUMGD8oVbbNG1zXTYsA
 4Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738188286; x=1738793086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nn+NcTr872jiU0vyNt8zW0XrUbMYhZRRGDuD467dm5Q=;
 b=QDlV+JHLAmqibv86UDLJdQFsuEtyN5pfWKnkICVnKva7sx6esEdu4qGWwfmusArsDI
 7LUve0RrniyeGwTJ7h+te2rriiR5wDzd6xJ+wQjhbpzOtHxBPam9ggIfyuSCFxRYT0Cb
 bkMLGmukJKhpL3LbWjxkeJlXWVS+zYAoMtWUP81lKi14mhbJOGFCKk+ae04F1rru4f54
 x/B0i1TJm7WBBTh8LQaR7X65L676tez82YmCrWMoTo0TEOWTJF5Jg7pb7Xow6rFdeWnp
 UivCrxKYBCWSTyvk0obiUk1gR2zDMz2UZepMvecH9ZFAeFWwHUrTrTGhPH3GEMbPoqZC
 wKCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH7dAEGhaj6PJm8agux0kaA/UFzsVxvJdrfzezZoogdpmzMc+akoEebfszU01s9/fqHQqSTfcPlQY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVdtB0FcBXUGnQFD0g9AAIIN8vLCkrEkS1my+PytiF1iWCTAou
 5ewPPAFmlm0Mr9BqyQHKvwvDAO6yKN3KrDPHpeoEVXW65Bks6zvefnCsZiHNDyg=
X-Gm-Gg: ASbGncvUJtOfBvP4f3xtSB/LA9zexD1a2REXpRwEoWIXewhfOvD9atLWEk0Lo+enTKB
 thb9uK0bWT8FeKhy0C9O5OghGHWR+WVGDAV0arFIYUbFWRB7l3WHLyUSTQ2ZrBSSjbA8KAlCQo1
 7UdGsa+rZcEuMP31oLyYtcw9iKLDFemczEPmpnuvMycANLARNCee2sMMhG2oxARj4/TdXkv1ow6
 lxZ65+ugTd1NqsccOBc5kSuhStiz0GtGp7Ul6kBjLPm+B7kKhNS0jsM27ZlpZuPuk3NKAs92pq1
 ASFMd5iNp/tOHGI9PS4xb2Mr/Y4l6oZMzXzVXrrfcHlOsxJrydNGzZXeXDV0d4Jekd19kFM=
X-Google-Smtp-Source: AGHT+IFoJoGsIwEL5a5EWttz29YtAkET9nd9l+IhCExm5wdza8/LoWAZwMLvwl0k0ETaASogU8yDBg==
X-Received: by 2002:a05:6512:38d1:b0:53e:2f9d:6a73 with SMTP id
 2adb3069b0e04-543e4ba6b47mr1224562e87.0.1738188285781; 
 Wed, 29 Jan 2025 14:04:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8381846sm2067724e87.255.2025.01.29.14.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 14:04:44 -0800 (PST)
Date: Thu, 30 Jan 2025 00:04:41 +0200
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
Subject: Re: [PATCH v5 02/14] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <34zk3jbcjlbux7737t2ve3xcwbt2uxsalbqih6os4ykqeklyfa@phy4izanhn3d>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-2-6464ca5360df@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-concurrent-wb-v5-2-6464ca5360df@quicinc.com>
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

On Tue, Jan 28, 2025 at 07:20:34PM -0800, Jessica Zhang wrote:
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
> In addition, move mode_changed() to dpu_crtc as encoder no longer has
> access to topology information
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> ---
> Changes in v5:
> - Reordered to prevent breaking CI and upon partial applciation
> - Moved mode_changed() from dpu_encoder to dpu_crtc
> - Dropped dpu_encoder_needs_dsc_merge() refactor to clean up commit
> - In dpu_encoder_update_topology(), grab DSC config using dpu_encoder
>   helper as dpu_encoder->dsc hasn't been set yet
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  79 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 174 +++++++++-------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  11 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  19 +--
>  5 files changed, 144 insertions(+), 141 deletions(-)
> 

> -/**
> - * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> - * @drm_enc:    Pointer to drm encoder structure
> - * @crtc_state:	Corresponding CRTC state to be checked
> - * @conn_state: Corresponding Connector's state to be checked
> - *
> - * Check if the changes in the object properties demand full mode set.
> - */
> -int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> -					struct drm_crtc_state *crtc_state,
> -					struct drm_connector_state *conn_state)
> +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
>  {
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct drm_framebuffer *fb;
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	struct msm_display_topology topology;
> -
> -	DPU_DEBUG_ENC(dpu_enc, "\n");
> -
> -	/* Using mode instead of adjusted_mode as it wasn't computed yet */
> -	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> -
> -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
> -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
> -
> -	return 0;
> -}
> -
> -static int dpu_encoder_virt_atomic_check(
> -		struct drm_encoder *drm_enc,
> -		struct drm_crtc_state *crtc_state,
> -		struct drm_connector_state *conn_state)
> -{
> -	struct dpu_encoder_virt *dpu_enc;
> -	struct msm_drm_private *priv;
> -	struct dpu_kms *dpu_kms;
> -	struct drm_display_mode *adj_mode;
> -	struct msm_display_topology topology;
> -	struct dpu_global_state *global_state;
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
> -	dpu_kms = to_dpu_kms(priv->kms);
> -	adj_mode = &crtc_state->adjusted_mode;
> -	global_state = dpu_kms_get_global_state(crtc_state->state);
> -	if (IS_ERR(global_state))
> -		return PTR_ERR(global_state);
>  
> -	trace_dpu_enc_atomic_check(DRMID(drm_enc));
> +	if (!drm_enc || !state)
> +		return false;
>  
> -	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
> +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> +	if (!connector)
> +		return false;
>  
> -	/*
> -	 * Release and Allocate resources on every modeset
> -	 */
> -	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -		dpu_rm_release(global_state, drm_enc);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
>  
> -		if (crtc_state->enable)
> -			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -					drm_enc, crtc_state, &topology);
> +	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +		fb = conn_state->writeback_job->fb;
> +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
> +			if (!dpu_enc->cur_master->hw_cdm)
> +				return true;
> +		} else {
> +			if (dpu_enc->cur_master->hw_cdm)
> +				return true;
> +		}

Nit: this is duplicating a part of the dpu_encoder_update_topology(). It
would be nice to have a comment here. If there is no need for a new
versoion, I can probably write something when applying.

>  	}
>  
> -	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> -
> -	return ret;
> +	return false;
>  }
>  
>  static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> @@ -2612,7 +2545,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>  	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
>  	.atomic_disable = dpu_encoder_virt_atomic_disable,
>  	.atomic_enable = dpu_encoder_virt_atomic_enable,
> -	.atomic_check = dpu_encoder_virt_atomic_check,
>  };
>  
>  static const struct drm_encoder_funcs dpu_encoder_funcs = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index da133ee4701a329f566f6f9a7255f2f6d050f891..b0ac10ebd02c2b63e6f6f9010a22cdace931cf3b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -80,6 +80,13 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
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
> @@ -88,8 +95,4 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>  
>  bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
>  
> -int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> -					struct drm_crtc_state *crtc_state,
> -					struct drm_connector_state *conn_state);
> -
>  #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5ce06e25990cb70284d3c3f04ac1e1e1bed6142a..c6b3b2e147b4c61ec93db4a9f01d5a288d2b9eb2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -449,24 +449,11 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>  static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
>  {
>  	struct drm_crtc_state *new_crtc_state;
> -	struct drm_connector *connector;
> -	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc *crtc;
>  	int i;
>  
> -	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
> -		struct drm_encoder *encoder;
> -
> -		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
> -
> -		if (!new_conn_state->crtc || !new_conn_state->best_encoder)
> -			continue;
> -
> -		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
> -
> -		encoder = new_conn_state->best_encoder;
> -
> -		dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
> -	}
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> +		dpu_crtc_check_mode_changed(new_crtc_state);
>  
>  	return 0;
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
