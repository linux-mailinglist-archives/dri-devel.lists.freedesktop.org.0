Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C78BA063D1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C175210E2A5;
	Wed,  8 Jan 2025 17:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="h03KPurI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB50F10EC48
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:56:31 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3863703258fso785629f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736358930; x=1736963730; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3GM1JRVPVl0gTv2VmZaYk6O4MFv0V6eAj0bdBVB48Ys=;
 b=h03KPurItvGmjndjvqq+NNfOwD59T6kRLbIDNo+5fmrSQ2WKKgi6O/kvGtbXYCivJe
 yyzVlbGx/rNgMDXcdhePcw5sbBElvtnS3x/lpeZXFvT3r7SjgwLxHKaoYSM8plISwr1p
 VOCx5xwALxhbgHNnvzYLT9NB71yi9/4/vr9ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736358930; x=1736963730;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3GM1JRVPVl0gTv2VmZaYk6O4MFv0V6eAj0bdBVB48Ys=;
 b=mwiPwWpMRgX73IN5VkdLmdoNAUR0jDk/2P5fVVGIa2kC0HwhvvdaoOjQqQ/dZP4fJC
 E05/0zgvWaydKXewBBNdMwEYPuln9tzPQ2MYWNfRtgsjRgrKq9fVNu2Smbc1FItVxW+0
 2gLE7OiU8QjDYuTUU6dvpzxb7oODwfAFIbmlN13SP739rGDoi1QuMrunN2MWOav6dAfd
 ShC+E3KNU+PhOC7jL9QCQrVALMWsEIQXkQ2iyL5G2XiDDlgAVtL2nk+GeJiDZRSzQ94T
 QRYeUK/msPkf2d4fJZjjzglOJ3Tb9i+rxidj5uV7GFK1VfK+VENOXr6Jl1auvk8374AH
 Q6Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+rVub33yMqD0VGa2aws2aaiNZmh/bcXRLtd4rMvtdrFBze/5lzz1scRNDmx/0dSu/W+i9gAfkibc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBlvBSngh8ReQNnLIVMonwpT+4iryudjsPBJbe6V4z8pPOz1xm
 Xmcn4tROCXUGZ4M5atJXnXWw4uf/TcqvJpPNSxVYUsOeWm4omn2ACGu72dyGM3I=
X-Gm-Gg: ASbGnct6etElK5sltuSkbrtbyR5KUtv0RJSX5YQOxd9GX5NnSNSAuWq8Jt4tybmds8m
 w6X9Hj6Xs00PDPnZoFgiMjpHnq9CVu9Fxh5ph8VNZQCjhthOCAkE0f7Hoe0/ZeGr2LPyhnL0GLL
 ND3V5FfxaT/XPvBo9RPp8eTJljmR2aLa4ScQ6SBty5WnyxeYEBY0IlirA8OlGq1tRCtqAD7Afd4
 DPqCroqCUeAmxxDozGmE6nY0lstBybyEbhi5trX3WepE7BMRR2W6HeOwdbk6iA3qYml
X-Google-Smtp-Source: AGHT+IHNsTBVSnsdV2eXC1RFeO9HR13klAVZDEXF0MY5bNs7y9wpzrPCS6PGzHfUOKXyznGuq68Qgg==
X-Received: by 2002:a5d:64cb:0:b0:386:3711:ffa9 with SMTP id
 ffacd0b85a97d-38a8b0d327cmr177645f8f.16.1736358928777; 
 Wed, 08 Jan 2025 09:55:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e030e2sm28350205e9.32.2025.01.08.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:55:28 -0800 (PST)
Date: Wed, 8 Jan 2025 18:55:26 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
Message-ID: <Z368DnfCrpYOPbav@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Sun, Dec 22, 2024 at 07:00:46AM +0200, Dmitry Baryshkov wrote:
> The MSM driver uses drm_atomic_helper_check() which mandates that none
> of the atomic_check() callbacks toggles crtc_state->mode_changed.
> Perform corresponding check before calling the drm_atomic_helper_check()
> function.
> 
> Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
>  drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
>  5 files changed, 77 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -753,6 +753,34 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
>  	cstate->num_mixers = num_lm;
>  }
>  
> +/**
> + * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> + * @drm_enc:    Pointer to drm encoder structure
> + * @crtc_state:	Corresponding CRTC state to be checked
> + * @conn_state: Corresponding Connector's state to be checked
> + *
> + * Check if the changes in the object properties demand full mode set.
> + */
> +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	struct msm_display_topology topology;
> +
> +	DPU_DEBUG_ENC(dpu_enc, "\n");
> +
> +	/* Using mode instead of adjusted_mode as it wasn't computed yet */
> +	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> +
> +	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> +		crtc_state->mode_changed = true;
> +	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> +		crtc_state->mode_changed = true;
> +
> +	return 0;
> +}
> +
>  static int dpu_encoder_virt_atomic_check(
>  		struct drm_encoder *drm_enc,
>  		struct drm_crtc_state *crtc_state,
> @@ -786,10 +814,6 @@ static int dpu_encoder_virt_atomic_check(
>  
>  	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
>  
> -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
> -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
>  	/*
>  	 * Release and Allocate resources on every modeset
>  	 */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 92b5ee390788d16e85e195a664417896a2bf1cae..da133ee4701a329f566f6f9a7255f2f6d050f891 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -88,4 +88,8 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>  
>  bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
>  
> +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state);
> +
>  #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index dae8a94d3366abfb8937d5f44d8968f1d0691c2d..e2d822f7d785dc0debcb28595029a3e2050b0cf4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -446,6 +446,31 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>  
> +static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *new_crtc_state;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *new_conn_state;
> +	int i;
> +
> +	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
> +		struct drm_encoder *encoder;
> +
> +		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
> +
> +		if (!new_conn_state->crtc || !new_conn_state->best_encoder)
> +			continue;
> +
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
> +
> +		encoder = new_conn_state->best_encoder;
> +
> +		dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
> +	}
> +
> +	return 0;
> +}
> +
>  static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> @@ -1049,6 +1074,7 @@ static const struct msm_kms_funcs kms_funcs = {
>  	.irq             = dpu_core_irq,
>  	.enable_commit   = dpu_kms_enable_commit,
>  	.disable_commit  = dpu_kms_disable_commit,
> +	.check_mode_changed = dpu_kms_check_mode_changed,
>  	.flush_commit    = dpu_kms_flush_commit,
>  	.wait_flush      = dpu_kms_wait_flush,
>  	.complete_commit = dpu_kms_complete_commit,
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index a7a2384044ffdb13579cc9a10f56f8de9beca761..364df245e3a209094782ca1b47b752a729b32a5b 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -183,10 +183,16 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
>  
>  int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>  {
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct msm_kms *kms = priv->kms;
>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>  	struct drm_crtc *crtc;
> -	int i;
> +	int i, ret = 0;
>  
> +	/*
> +	 * FIXME: stop setting allow_modeset and move this check to the DPU
> +	 * driver.
> +	 */

I guess there's more work to stop setting allow_modeset? Or was the issue
there that it breaks userspace that expects ctm changes to be doable
without modesets?

Either way msm patches lgtm, but don't feel confident enough for acks
except on the first one that reworks the active_change logic to use
crtc->enable instead for resource allocation.
-Sima

>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
>  				      new_crtc_state, i) {
>  		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
> @@ -196,6 +202,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>  		}
>  	}
>  
> +	if (kms && kms->funcs && kms->funcs->check_mode_changed)
> +		ret = kms->funcs->check_mode_changed(kms, state);
> +	if (ret)
> +		return ret;
> +
>  	return drm_atomic_helper_check(dev, state);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index e60162744c669773b6e5aef824a173647626ab4e..ec2a75af89b09754faef1a07adc9338f7d78161e 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -59,6 +59,13 @@ struct msm_kms_funcs {
>  	void (*enable_commit)(struct msm_kms *kms);
>  	void (*disable_commit)(struct msm_kms *kms);
>  
> +	/**
> +	 * @check_mode_changed:
> +	 *
> +	 * Verify if the commit requires a full modeset on one of CRTCs.
> +	 */
> +	int (*check_mode_changed)(struct msm_kms *kms, struct drm_atomic_state *state);
> +
>  	/**
>  	 * Prepare for atomic commit.  This is called after any previous
>  	 * (async or otherwise) commit has completed.
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
