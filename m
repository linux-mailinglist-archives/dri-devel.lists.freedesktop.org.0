Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E6EA2B7A9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 02:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831C010E9BF;
	Fri,  7 Feb 2025 01:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vrBy45f+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F8710E9BF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 01:13:14 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54298ec925bso1853156e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 17:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738890793; x=1739495593; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mD8MU9ia7DeQdTywSD1JdEVbwh8ZTx//S8otRz+v9E0=;
 b=vrBy45f+r43mgv7YOyhdVy/K9a/06EvTO6Ki1j1UbZyUVUCWmKMmrxoNuMb6Umc04P
 JGoCM+tzEjmGVPUaCOP5PHlv37lC2s9LUXjqpbJsbrXbm5mYnHXvjAn3GRaK0mveuCcB
 EVbCdUGuFndr7qe6juNZdoRpEfUD7CGUOkHpOeHf4lBj8sqpD95F8vjKoCH9qdtIDlpI
 /39dWggsC3jrENh0qIDMMnqqKA28i5gXOlhIJwb1s1/eN1cyvq6QpvpY6O9s6vtyO6NL
 Gu04PCkyePR2PQO3EdqIzlgGX5thR1OMfdEtL0onjAGOpW3/aLQmW/ieOsX0DIz6ryRn
 GXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738890793; x=1739495593;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mD8MU9ia7DeQdTywSD1JdEVbwh8ZTx//S8otRz+v9E0=;
 b=MN8Boy5C7L3mZJuWHoKYy6tD8nualf6I3ippMbKwMOU/remSiINv7LpS5WwD2Fs2yS
 I8A8qhdE/vidzLoOuwGPMoxHZRlMQIzYWONxOV1ahErASUHTk1y7u20ymObeVMkQEfe7
 x4dlvmjZghTDAndB0gfoZWkXQ994A+0cdTtTRhI4WlhOZRpde8XWY/b72VUQiQOqyH0J
 mD6bTvNs6k09FXBnxEL/NcZtmd38Vg8dHFJqUQGfCOY2az812TxL1cjnhbjtAb9sHZZ4
 0AwUyBQwtlHsvU4ypeGDz5bc279Swzsj8suFhgzNJcF+kshoWF9t1Nhw7KlsByUybNwT
 yVPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYCbiQ4+4cb7H2qgNulwz76fSxR8/m1foL9YQkbZmRjjN5O1OlkxG5vrXkw3x0B6ERb8muja67lss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM7s0NpLU9XIB5z38ifUiu/IE4YHGtGAK/8Dg8CWh16atzeSQ8
 ZIHdeHzg52x3aNamK6LIfqMYarcVUgx7F7iGszTRm46n50F4JwYlhN1ki+uBM88=
X-Gm-Gg: ASbGnctEDlWSw1aHRazC2kU6P0W2s1rJtuQmyrMh1KVN0mAc8URkVU6LQW+8T1LKXhW
 31Y69zBVnbP4/2yxMZDd6Nk40mB0oFhFrrAejC2h/YTTxi5KG5aGOyrEQZhIhO2ud3LKd64jt/F
 2SV6c8fZYddCoBr4ZDShCIRUYk9o+JKhmauc0rLYgE3Bk1maOKNm4F/9IN0EjSZTspgEPR/TqJh
 EtC1MypHhVE9AH0sXLKVFBaED4fIndxPe11zj39mZc30tJ8XQJLH8mCOhsh/uHbzH2/hSQxeaOt
 +48ADx8uhacwMSfyo3Yms21oFtXGIFuV806T9oW1m8PQcCnhd028e6pc0uSeH3C7CJ2hKNk=
X-Google-Smtp-Source: AGHT+IHYSIRsZahPUyPRN1+iXP2PIJf6L3Nw7RCM9yJa976O/YLBqbJ7cTIOY78DUwa2dGHV/JS28Q==
X-Received: by 2002:a05:6512:a8f:b0:544:12df:8726 with SMTP id
 2adb3069b0e04-54414ab6a8bmr261997e87.22.1738890793184; 
 Thu, 06 Feb 2025 17:13:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105e5bc8sm284054e87.166.2025.02.06.17.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 17:13:11 -0800 (PST)
Date: Fri, 7 Feb 2025 03:13:09 +0200
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
Message-ID: <e3lws3vo5x5folczeb2ygscgrnv5jejuaayjzon47ir6kpbhnn@pglvman2jugg>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-2-6464ca5360df@quicinc.com>
 <34zk3jbcjlbux7737t2ve3xcwbt2uxsalbqih6os4ykqeklyfa@phy4izanhn3d>
 <16986655-0c51-49ac-8088-6548317be7e6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16986655-0c51-49ac-8088-6548317be7e6@quicinc.com>
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

On Thu, Feb 06, 2025 at 03:49:53PM -0800, Jessica Zhang wrote:
> 
> 
> On 1/29/2025 2:04 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 07:20:34PM -0800, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > All resource allocation is centered around the LMs. Then other blocks
> > > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > > powers up the CRTC rather than the encoder.
> > > 
> > > Moreover if at some point the driver supports encoder cloning,
> > > allocating resources from the encoder will be incorrect, as all clones
> > > will have different encoder IDs, while LMs are to be shared by these
> > > encoders.
> > > 
> > > In addition, move mode_changed() to dpu_crtc as encoder no longer has
> > > access to topology information
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > 
> > > ---
> > > Changes in v5:
> > > - Reordered to prevent breaking CI and upon partial applciation
> > > - Moved mode_changed() from dpu_encoder to dpu_crtc
> > > - Dropped dpu_encoder_needs_dsc_merge() refactor to clean up commit
> > > - In dpu_encoder_update_topology(), grab DSC config using dpu_encoder
> > >    helper as dpu_encoder->dsc hasn't been set yet
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  79 +++++++++++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 174 +++++++++-------------------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  11 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  19 +--
> > >   5 files changed, 144 insertions(+), 141 deletions(-)
> > > 
> > 
> > > -/**
> > > - * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> > > - * @drm_enc:    Pointer to drm encoder structure
> > > - * @crtc_state:	Corresponding CRTC state to be checked
> > > - * @conn_state: Corresponding Connector's state to be checked
> > > - *
> > > - * Check if the changes in the object properties demand full mode set.
> > > - */
> > > -int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > > -					struct drm_crtc_state *crtc_state,
> > > -					struct drm_connector_state *conn_state)
> > > +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
> > >   {
> > > +	struct drm_connector *connector;
> > > +	struct drm_connector_state *conn_state;
> > > +	struct drm_framebuffer *fb;
> > >   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > -	struct msm_display_topology topology;
> > > -
> > > -	DPU_DEBUG_ENC(dpu_enc, "\n");
> > > -
> > > -	/* Using mode instead of adjusted_mode as it wasn't computed yet */
> > > -	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> > > -
> > > -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > > -		crtc_state->mode_changed = true;
> > > -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > > -		crtc_state->mode_changed = true;
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static int dpu_encoder_virt_atomic_check(
> > > -		struct drm_encoder *drm_enc,
> > > -		struct drm_crtc_state *crtc_state,
> > > -		struct drm_connector_state *conn_state)
> > > -{
> > > -	struct dpu_encoder_virt *dpu_enc;
> > > -	struct msm_drm_private *priv;
> > > -	struct dpu_kms *dpu_kms;
> > > -	struct drm_display_mode *adj_mode;
> > > -	struct msm_display_topology topology;
> > > -	struct dpu_global_state *global_state;
> > > -	int ret = 0;
> > > -
> > > -	if (!drm_enc || !crtc_state || !conn_state) {
> > > -		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
> > > -				drm_enc != NULL, crtc_state != NULL, conn_state != NULL);
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > -	DPU_DEBUG_ENC(dpu_enc, "\n");
> > > -
> > > -	priv = drm_enc->dev->dev_private;
> > > -	dpu_kms = to_dpu_kms(priv->kms);
> > > -	adj_mode = &crtc_state->adjusted_mode;
> > > -	global_state = dpu_kms_get_global_state(crtc_state->state);
> > > -	if (IS_ERR(global_state))
> > > -		return PTR_ERR(global_state);
> > > -	trace_dpu_enc_atomic_check(DRMID(drm_enc));
> > > +	if (!drm_enc || !state)
> > > +		return false;
> > > -	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
> > > +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> > > +	if (!connector)
> > > +		return false;
> > > -	/*
> > > -	 * Release and Allocate resources on every modeset
> > > -	 */
> > > -	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> > > -		dpu_rm_release(global_state, drm_enc);
> > > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > -		if (crtc_state->enable)
> > > -			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> > > -					drm_enc, crtc_state, &topology);
> > > +	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> > > +		fb = conn_state->writeback_job->fb;
> > > +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
> > > +			if (!dpu_enc->cur_master->hw_cdm)
> > > +				return true;
> > > +		} else {
> > > +			if (dpu_enc->cur_master->hw_cdm)
> > > +				return true;
> > > +		}
> > 
> > Nit: this is duplicating a part of the dpu_encoder_update_topology(). It
> > would be nice to have a comment here. If there is no need for a new
> > versoion, I can probably write something when applying.
> 
> Sure, I can add a note that we need to duplicate these checks in
> *_needs_modeset() since topology info is not stored in the encoder or crtc

Yes, please. I was thinking about having a helper function, but I don't
think that it makes real sense.


-- 
With best wishes
Dmitry
