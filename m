Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF59B6076
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 11:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623FA10E784;
	Wed, 30 Oct 2024 10:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i37Ozb87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC5110E2B5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 10:48:53 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e3f35268so7722468e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730285332; x=1730890132; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jz2GFkbr9FnGRwgDEzg4QotGK0HO8+AWtr1e9YLYCWs=;
 b=i37Ozb872128mDZLNKXWkXkzkWk50BzQX/tGefELBXKPWfua8YZ5KVWCCsBKwsQpi8
 ZjYDBrI5/wfOYFhvbJqUaELX8mmLl011QVPhx32dNdV3ZbEn7qoxsznnxTqs++NVL76K
 InGBp6SiRxU3FBBcHABQBIISd9RvPSxm55uGYYlJTz1wuZgPieVAex/mugqHs+de41Kp
 hNxwtKHZ+1QJVjmcyP4R2IcdJyoav/EdbByIx5Z3kAxm3/4AcvuN3HCXC04Ld9zkXycA
 pWri9ncpDiX6skCOFkWqZDpTrZ05S+Q3iECYtmFq8OcAiB8BEaG5uJ5leAQHWXfTWAXB
 wTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730285332; x=1730890132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jz2GFkbr9FnGRwgDEzg4QotGK0HO8+AWtr1e9YLYCWs=;
 b=nMDKBWpYXDR3ap3lt+ElR4WZ2FSIhXGd/zKp/Ak35C71ZsGKS3Ojsp1iNMtoz01Q8g
 kw5txsrIq5XoxO47kFhz15AKrVIeKGC8XCiNYKrwVfn3VW8XHauO5Rs4a05TazkZ1urb
 Y314JurOahAXGXGL75iPKbdZvPkFywQ+UTBbg70Fh/DlsreVmF/9YXt81erB6hKGEYxO
 ZEJ2SbCT2/4g7H64jezGHtkgPh1Q8fJBan+4Hwz9v3SGCNypR0j90QTougHSDQlRvm5u
 8JD+JWFUBCaeL6QW4kmtTw9L76fOrSdwj/2/+jfuoc5gv6BmgP5mkTTz3Nu0AoYAm7H8
 yt1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9UiKBEpvzFPIWRap8QEDKaFa3zKt+hNjugb4X6HgIPKJdXFQRgXXXpec+Hfd4kx7BIuDpDEDxj+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypNMadutxoYFZMwgzTph8NWhVz77oj83RiDwXxFTyoe2GSPany
 IXGu6pDdif8t37maRgVsc/fE+m94tbfzjNBk6evYbL+5MCkiaU611E125Wu0SOM=
X-Google-Smtp-Source: AGHT+IGH8EFC/XOSUrqDG+Yk6/KXUc6kFwxFUsCoH2AWpjs5/syJYCwLh1Xb4fnNdyOkCWLmtTY7hQ==
X-Received: by 2002:a05:6512:23a9:b0:536:55cf:3148 with SMTP id
 2adb3069b0e04-53b348deb93mr7379571e87.31.1730285331611; 
 Wed, 30 Oct 2024 03:48:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53bb818fe82sm213940e87.57.2024.10.30.03.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 03:48:49 -0700 (PDT)
Date: Wed, 30 Oct 2024 12:48:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 7/9] drm/msm/dpu: add support for virtual planes
Message-ID: <xxxedwb2t6xhfzmhpom6dirs2ur2qvmruimdxgvdkh7gmey5tr@qotm7xvbsg5a>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-7-0310fd519765@linaro.org>
 <e0f84f35-6d98-45c3-857c-c273820fab69@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0f84f35-6d98-45c3-857c-c273820fab69@quicinc.com>
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

On Tue, Oct 29, 2024 at 02:30:12PM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> > Only several SSPP blocks support such features as YUV output or scaling,
> > thus different DRM planes have different features.  Properly utilizing
> > all planes requires the attention of the compositor, who should
> > prefer simpler planes to YUV-supporting ones. Otherwise it is very easy
> > to end up in a situation when all featureful planes are already
> > allocated for simple windows, leaving no spare plane for YUV playback.
> > 
> > To solve this problem make all planes virtual. Each plane is registered
> > as if it supports all possible features, but then at the runtime during
> > the atomic_check phase the driver selects backing SSPP block for each
> > plane.
> > 
> > As the planes are attached to the CRTC and not the encoder, the SSPP
> > blocks are also allocated per CRTC ID (all other resources are currently
> > allocated per encoder ID). This also matches the hardware requirement,
> > where both rectangles of a single SSPP can only be used with the LM
> > pair.
> > 
> > Note, this does not provide support for using two different SSPP blocks
> > for a single plane or using two rectangles of an SSPP to drive two
> > planes. Each plane still gets its own SSPP and can utilize either a solo
> > rectangle or both multirect rectangles depending on the resolution.
> > 
> > Note #2: By default support for virtual planes is turned off and the
> > driver still uses old code path with preallocated SSPP block for each
> > plane. To enable virtual planes, pass 'msm.dpu_use_virtual_planes=1'
> > kernel parameter.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  50 +++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |   4 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 237 ++++++++++++++++++++++++++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  16 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    |  68 +++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    |  27 ++++
> >   7 files changed, 383 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 58595dcc3889..a7eea094aa14 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1166,6 +1166,49 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
> >   	return false;
> >   }
> > +static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
> > +{
> > +	int total_planes = crtc->dev->mode_config.num_total_plane;
> > +	struct drm_atomic_state *state = crtc_state->state;
> > +	struct dpu_global_state *global_state;
> > +	struct drm_plane_state **states;
> > +	struct drm_plane *plane;
> > +	int ret;
> > +
> > +	global_state = dpu_kms_get_global_state(crtc_state->state);
> > +	if (IS_ERR(global_state))
> > +		return PTR_ERR(global_state);
> > +
> > +	dpu_rm_release_all_sspp(global_state, crtc);
> > +
> > +	if (!crtc_state->enable)
> > +		return 0;
> > +
> > +	states = kcalloc(total_planes, sizeof(*states), GFP_KERNEL);
> > +	if (!states)
> > +		return -ENOMEM;
> > +
> > +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
> > +		struct drm_plane_state *plane_state =
> > +			drm_atomic_get_plane_state(state, plane);
> > +
> > +		if (IS_ERR(plane_state)) {
> > +			ret = PTR_ERR(plane_state);
> > +			goto done;
> > +		}
> > +
> > +		states[plane_state->normalized_zpos] = plane_state;
> > +	}
> > +
> > +	ret = dpu_assign_plane_resources(global_state, state, crtc, states, total_planes);
> > +
> > +done:
> > +	kfree(states);
> > +	return ret;
> > +
> > +	return 0;
> > +}
> > +
> >   static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >   		struct drm_atomic_state *state)
> >   {
> > @@ -1181,6 +1224,13 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >   	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> > +	if (dpu_use_virtual_planes &&
> > +	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> > +		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
> > +		if (rc < 0)
> > +			return rc;
> > +	}
> 
> planes_changed is set only for format changes . Will it cover all
> needs_modeset cases?
> 
> OR do we also need to set planes_changed when
> drm_atomic_crtc_needs_modeset()?
> 
> Unless I am missing something, I think we have to otherwise sspp
> reallocation wont happen in modeset cases.

I was depending on the planes being included in the state by the client.
I don't think we really care about the modeset per se. We care about
plane size changes. And changing the size means that the plane is
included into the commit.

> 
> Overall, mainly we want to make sure SSPPs are re-assigned when:
> 

0) plane size changes

> 1) format changes (RGB to YUV and vice-versa)
> 2) Any modesets

No

> 3) Any disable/enable without modeset like connectors changed as SSPPs are
> changing outputs there.

Absolutely no, the logic should be the same as active vs enabled for
CRTCs. Realloc resources only if the plane itself gets disabled or
enabled. In all other cases the set of SSPP blocks should stay
untouched.

> 
> If we are covered for all these, let me know.
> 
> > +
> >   	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
> >   		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
> >   				crtc->base.id, crtc_state->enable,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 15679dd50c66..70757d876cc3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -51,6 +51,9 @@
> >   #define DPU_DEBUGFS_DIR "msm_dpu"
> >   #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
> > +bool dpu_use_virtual_planes;
> > +module_param(dpu_use_virtual_planes, bool, 0);
> > +
> >   static int dpu_kms_hw_init(struct msm_kms *kms);
> >   static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
> > @@ -814,8 +817,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
> >   			  type, catalog->sspp[i].features,
> >   			  catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR));
> > -		plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
> > -				       (1UL << max_crtc_count) - 1);
> > +		if (dpu_use_virtual_planes)
> > +			plane = dpu_plane_init_virtual(dev, type, (1UL << max_crtc_count) - 1);
> > +		else
> > +			plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
> > +					       (1UL << max_crtc_count) - 1);
> >   		if (IS_ERR(plane)) {
> >   			DPU_ERROR("dpu_plane_init failed\n");
> >   			ret = PTR_ERR(plane);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index 935ff6fd172c..479d4c172290 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -54,6 +54,8 @@
> >   #define ktime_compare_safe(A, B) \
> >   	ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
> > +extern bool dpu_use_virtual_planes;
> > +
> >   struct dpu_kms {
> >   	struct msm_kms base;
> >   	struct drm_device *dev;
> > @@ -128,6 +130,8 @@ struct dpu_global_state {
> >   	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> >   	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
> >   	uint32_t cdm_to_enc_id;
> > +
> > +	uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
> >   };
> 
> This is the part which now looks odd and can be managed with rebase I guess.
> 
> Are you planning to pull in the move resource allocation to crtc_id changes
> first before this part? IOW, rebase this change on top of that?

No. I do not. If you remember, several revisions ago the enc_id ->
crtc_id was a part of the series, but we both agreed to drop it since it
was not required for virtual planes. As such, I plan to land this one
first (yes, having some of the resources tracked basing on enc_id and
SSPP is tracked basing on crtc_id). 

> 
> That will look clean because if this goes in first now, the crtc_id
> allocation changes will need to be rebased which I dont know who will do now
> as Jessica is OOO.

My plan is to pull this first and then pull patches 3-12 from the CWB
series. I do not expect significant conflicts there.

> 
> >   struct dpu_global_state
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 5e230391fabc..125db3803cf5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -878,7 +878,7 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> >   	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> >   			    new_plane_state->fb->width, new_plane_state->fb->height,
> >   			    new_plane_state->rotation);
> > -	if (r_pipe_cfg->src_rect.x1 != 0)
> > +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> >   		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> >   				    new_plane_state->fb->width, new_plane_state->fb->height,
> >   				    new_plane_state->rotation);
> > @@ -1001,8 +1001,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   		crtc_state = drm_atomic_get_new_crtc_state(state,
> >   							   new_plane_state->crtc);
> > -	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > -	r_pipe->sspp = NULL;
> > +	if (pdpu->pipe != SSPP_NONE) {
> > +		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > +		r_pipe->sspp = NULL;
> > +	}
> > +
> > +	if (!pipe->sspp)
> > +		return -EINVAL;
> >   	ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
> >   	if (ret)
> > @@ -1019,6 +1024,112 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >   }
> > +static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > +					  struct drm_atomic_state *state)
> > +{
> > +	struct drm_plane_state *plane_state =
> > +		drm_atomic_get_plane_state(state, plane);
> > +	struct drm_plane_state *old_plane_state =
> > +		drm_atomic_get_old_plane_state(state, plane);
> > +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> > +	struct drm_crtc_state *crtc_state;
> > +	int ret;
> > +
> > +	if (plane_state->crtc)
> > +		crtc_state = drm_atomic_get_new_crtc_state(state,
> > +							   plane_state->crtc);
> > +
> > +	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!plane_state->visible) {
> > +		/*
> > +		 * resources are freed by dpu_crtc_assign_plane_resources(),
> > +		 * but clean them here.
> > +		 */
> > +		pstate->pipe.sspp = NULL;
> > +		pstate->r_pipe.sspp = NULL;
> > +
> > +		return 0;
> > +	}
> > +
> > +	/* force resource reallocation if the format of FB has changed */
> > +	if (!old_plane_state || !old_plane_state->fb ||
> > +	    msm_framebuffer_format(old_plane_state->fb) !=
> > +	    msm_framebuffer_format(plane_state->fb))
> > +		crtc_state->planes_changed = true;
> > +
> > +	return 0;
> > +}
> > +
> > +static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > +					      struct dpu_global_state *global_state,
> > +					      struct drm_atomic_state *state,
> > +					      struct drm_plane_state *plane_state)
> > +{
> > +	const struct drm_crtc_state *crtc_state = NULL;
> > +	struct drm_plane *plane = plane_state->plane;
> > +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > +	struct dpu_rm_sspp_requirements reqs;
> > +	struct dpu_plane_state *pstate;
> > +	struct dpu_sw_pipe *pipe;
> > +	struct dpu_sw_pipe *r_pipe;
> > +	const struct msm_format *fmt;
> > +
> > +	if (plane_state->crtc)
> > +		crtc_state = drm_atomic_get_new_crtc_state(state,
> > +							   plane_state->crtc);
> > +
> > +	pstate = to_dpu_plane_state(plane_state);
> > +	pipe = &pstate->pipe;
> > +	r_pipe = &pstate->r_pipe;
> > +
> > +	pipe->sspp = NULL;
> > +	r_pipe->sspp = NULL;
> > +
> > +	if (!plane_state->fb)
> > +		return -EINVAL;
> > +
> > +	fmt = msm_framebuffer_format(plane_state->fb);
> > +	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
> > +	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
> > +		(plane_state->src_h >> 16 != plane_state->crtc_h);
> > +
> > +	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
> > +
> > +	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > +	if (!pipe->sspp)
> > +		return -ENODEV;
> > +
> > +	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > +}
> > +
> > +int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > +			       struct drm_atomic_state *state,
> > +			       struct drm_crtc *crtc,
> > +			       struct drm_plane_state **states,
> > +			       unsigned int num_planes)
> > +{
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (i = 0; i < num_planes; i++) {
> > +		struct drm_plane_state *plane_state = states[i];
> > +
> > +		if (!plane_state ||
> > +		    !plane_state->visible)
> > +			continue;
> > +
> > +		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > +							 state, plane_state);
> > +		if (ret)
> > +			break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >   static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> >   {
> >   	const struct msm_format *format =
> > @@ -1331,12 +1442,15 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
> >   	drm_printf(p, "\tstage=%d\n", pstate->stage);
> > -	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> > -	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
> > -	drm_printf(p, "\tmultirect_index[0]=%s\n",
> > -		   dpu_get_multirect_index(pipe->multirect_index));
> > -	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> > -	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> > +	if (pipe->sspp) {
> > +		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> > +		drm_printf(p, "\tmultirect_mode[0]=%s\n",
> > +			   dpu_get_multirect_mode(pipe->multirect_mode));
> > +		drm_printf(p, "\tmultirect_index[0]=%s\n",
> > +			   dpu_get_multirect_index(pipe->multirect_index));
> > +		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> > +		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> > +	}
> >   	if (r_pipe->sspp) {
> >   		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
> > @@ -1429,31 +1543,29 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
> >   		.atomic_update = dpu_plane_atomic_update,
> >   };
> > +static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
> > +	.prepare_fb = dpu_plane_prepare_fb,
> > +	.cleanup_fb = dpu_plane_cleanup_fb,
> > +	.atomic_check = dpu_plane_virtual_atomic_check,
> > +	.atomic_update = dpu_plane_atomic_update,
> > +};
> > +
> >   /* initialize plane */
> > -struct drm_plane *dpu_plane_init(struct drm_device *dev,
> > -		uint32_t pipe, enum drm_plane_type type,
> > -		unsigned long possible_crtcs)
> > +static struct drm_plane *dpu_plane_init_common(struct drm_device *dev,
> > +					       enum drm_plane_type type,
> > +					       unsigned long possible_crtcs,
> > +					       bool inline_rotation,
> > +					       const uint32_t *format_list,
> > +					       uint32_t num_formats,
> > +					       enum dpu_sspp pipe)
> >   {
> >   	struct drm_plane *plane = NULL;
> > -	const uint32_t *format_list;
> >   	struct dpu_plane *pdpu;
> >   	struct msm_drm_private *priv = dev->dev_private;
> >   	struct dpu_kms *kms = to_dpu_kms(priv->kms);
> > -	struct dpu_hw_sspp *pipe_hw;
> > -	uint32_t num_formats;
> >   	uint32_t supported_rotations;
> >   	int ret;
> > -	/* initialize underlying h/w driver */
> > -	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
> > -	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
> > -		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
> > -		return ERR_PTR(-EINVAL);
> > -	}
> > -
> > -	format_list = pipe_hw->cap->sblk->format_list;
> > -	num_formats = pipe_hw->cap->sblk->num_formats;
> > -
> >   	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
> >   				0xff, &dpu_plane_funcs,
> >   				format_list, num_formats,
> > @@ -1479,7 +1591,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
> >   	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
> > -	if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
> > +	if (inline_rotation)
> >   		supported_rotations |= DRM_MODE_ROTATE_MASK;
> >   	drm_plane_create_rotation_property(plane,
> > @@ -1487,10 +1599,81 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
> >   	drm_plane_enable_fb_damage_clips(plane);
> > -	/* success! finalize initialization */
> > +	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
> > +					pipe, plane->base.id);
> > +	return plane;
> > +}
> > +
> > +struct drm_plane *dpu_plane_init(struct drm_device *dev,
> > +				 uint32_t pipe, enum drm_plane_type type,
> > +				 unsigned long possible_crtcs)
> > +{
> > +	struct drm_plane *plane = NULL;
> > +	struct msm_drm_private *priv = dev->dev_private;
> > +	struct dpu_kms *kms = to_dpu_kms(priv->kms);
> > +	struct dpu_hw_sspp *pipe_hw;
> > +
> > +	/* initialize underlying h/w driver */
> > +	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
> > +	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
> > +		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +
> > +	plane = dpu_plane_init_common(dev, type, possible_crtcs,
> > +				      pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION),
> > +				      pipe_hw->cap->sblk->format_list,
> > +				      pipe_hw->cap->sblk->num_formats,
> > +				      pipe);
> > +	if (IS_ERR(plane))
> > +		return plane;
> > +
> >   	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
> >   	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
> >   					pipe, plane->base.id);
> > +
> > +	return plane;
> > +}
> > +
> > +struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
> > +					 enum drm_plane_type type,
> > +					 unsigned long possible_crtcs)
> > +{
> > +	struct drm_plane *plane = NULL;
> > +	struct msm_drm_private *priv = dev->dev_private;
> > +	struct dpu_kms *kms = to_dpu_kms(priv->kms);
> > +	bool has_inline_rotation = false;
> > +	const u32 *format_list = NULL;
> > +	u32 num_formats = 0;
> > +	int i;
> > +
> > +	/* Determine the largest configuration that we can implement */
> > +	for (i = 0; i < kms->catalog->sspp_count; i++) {
> > +		const struct dpu_sspp_cfg *cfg = &kms->catalog->sspp[i];
> > +
> > +		if (test_bit(DPU_SSPP_INLINE_ROTATION, &cfg->features))
> > +			has_inline_rotation = true;
> > +
> > +		if (!format_list ||
> > +		    cfg->sblk->csc_blk.len) {
> > +			format_list = cfg->sblk->format_list;
> > +			num_formats = cfg->sblk->num_formats;
> > +		}
> > +	}
> > +
> > +	plane = dpu_plane_init_common(dev, type, possible_crtcs,
> > +				      has_inline_rotation,
> > +				      format_list,
> > +				      num_formats,
> > +				      SSPP_NONE);
> > +	if (IS_ERR(plane))
> > +		return plane;
> > +
> > +	drm_plane_helper_add(plane, &dpu_plane_virtual_helper_funcs);
> > +
> > +	DPU_DEBUG("%s created virtual id:%u\n", plane->name, plane->base.id);
> > +
> >   	return plane;
> >   }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > index 31ee8b55c4dd..6d310bd9db30 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > @@ -78,6 +78,16 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
> >   		uint32_t pipe, enum drm_plane_type type,
> >   		unsigned long possible_crtcs);
> > +/**
> > + * dpu_plane_init_virtual - create new dpu virtualized plane
> > + * @dev:   Pointer to DRM device
> > + * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
> > + * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
> > + */
> > +struct drm_plane *dpu_plane_init_virtual(struct drm_device *dev,
> > +					 enum drm_plane_type type,
> > +					 unsigned long possible_crtcs);
> > +
> >   /**
> >    * dpu_plane_color_fill - enables color fill on plane
> >    * @plane:  Pointer to DRM plane object
> > @@ -94,4 +104,10 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
> >   static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
> >   #endif
> > +int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > +			       struct drm_atomic_state *state,
> > +			       struct drm_crtc *crtc,
> > +			       struct drm_plane_state **states,
> > +			       unsigned int num_planes);
> > +
> >   #endif /* _DPU_PLANE_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index 44938ba7a2b7..feeef9d31653 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -694,6 +694,74 @@ int dpu_rm_reserve(
> >   	return ret;
> >   }
> > +static struct dpu_hw_sspp *dpu_rm_try_sspp(struct dpu_rm *rm,
> > +					   struct dpu_global_state *global_state,
> > +					   struct drm_crtc *crtc,
> > +					   struct dpu_rm_sspp_requirements *reqs,
> > +					   unsigned int type)
> > +{
> > +	uint32_t crtc_id = crtc->base.id;
> > +	struct dpu_hw_sspp *hw_sspp;
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++) {
> > +		if (!rm->hw_sspp[i])
> > +			continue;
> > +
> > +		if (global_state->sspp_to_crtc_id[i])
> > +			continue;
> > +
> > +		hw_sspp = rm->hw_sspp[i];
> > +
> > +		if (hw_sspp->cap->type != type)
> > +			continue;
> > +
> > +		if (reqs->scale && !hw_sspp->cap->sblk->scaler_blk.len)
> > +			continue;
> 
> We are already requesting a relevant SSPP when scale is needed so is this
> needed?

(here and below): yes, it is necessary for platforms like QCM2290, which
have ViG blocks, but no support for scaling.

> 
> > +
> > +		// TODO: QSEED2 and RGB scalers are not yet supported
> > +		if (reqs->scale && !hw_sspp->ops.setup_scaler)
> > +			continue;
> > +
> 
> same here

We do not support QSEED2 setup, so it scaling is not possible on QSEED2
platforms even on ViG layers.

> 
> > +		if (reqs->yuv && !hw_sspp->cap->sblk->csc_blk.len)
> > +			continue;
> 
> same here
> > +
> > +		if (reqs->rot90 && !(hw_sspp->cap->features & DPU_SSPP_INLINE_ROTATION))
> > +			continue;
> > +
> > +		global_state->sspp_to_crtc_id[i] = crtc_id;
> > +
> > +		return rm->hw_sspp[i];
> > +	}
> > +
> > +	return NULL;
> > +}
> > +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
> > +					struct dpu_global_state *global_state,
> > +					struct drm_crtc *crtc,
> > +					struct dpu_rm_sspp_requirements *reqs)
> > +{
> > +	struct dpu_hw_sspp *hw_sspp = NULL;
> > +
> > +	if (!reqs->scale && !reqs->yuv)
> > +		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_DMA);
> > +	if (!hw_sspp && reqs->scale)
> > +		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_RGB);
> 
> I dont recollect whether RGB SSPPs supported scaling, if you have any source
> or link for this, that would help me for sure.

I have to dig further into the old fbdev driver. It looks like
mdss_mdp_qseed2_setup() is getting called for all plane types on the
corresponding hardware, but then it rejects scaling only for DMA and
CURSOR planes, which means that RGB planes should get the scaler setup.

For now this is from the SDE driver from 4.4:

 * @SDE_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes

> But even otherwise, I dont see any chipset in the catalog setting this SSPP
> type, so do we need to add this case?

Yes, we do. MSM8996 / MSM8937 / MSM8917 / MSM8953 use RGB planes.

> 
> Overall, I am happier with this version which elimiates the hweight.
> 
> > +	if (!hw_sspp)
> > +		hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_VIG);
> > +
> > +	return hw_sspp;
> > +}
> > +
> > +void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
> > +			     struct drm_crtc *crtc)
> > +{
> > +	uint32_t crtc_id = crtc->base.id;
> > +
> > +	_dpu_rm_clear_mapping(global_state->sspp_to_crtc_id,
> > +		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
> > +}
> > +
> >   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >   	struct dpu_global_state *global_state, uint32_t enc_id,
> >   	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > index e63db8ace6b9..6edff89fe83a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > @@ -37,6 +37,12 @@ struct dpu_rm {
> >   	struct dpu_hw_blk *cdm_blk;
> >   };
> > +struct dpu_rm_sspp_requirements {
> > +	bool yuv;
> > +	bool scale;
> > +	bool rot90;
> > +};
> > +
> >   /**
> >    * dpu_rm_init - Read hardware catalog and create reservation tracking objects
> >    *	for all HW blocks.
> > @@ -82,6 +88,27 @@ int dpu_rm_reserve(struct dpu_rm *rm,
> >   void dpu_rm_release(struct dpu_global_state *global_state,
> >   		struct drm_encoder *enc);
> > +/**
> > + * dpu_rm_reserve_sspp - Reserve the required SSPP for the provided CRTC
> > + * @rm: DPU Resource Manager handle
> > + * @global_state: private global state
> > + * @crtc: DRM CRTC handle
> > + * @reqs: SSPP required features
> > + */
> > +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
> > +					struct dpu_global_state *global_state,
> > +					struct drm_crtc *crtc,
> > +					struct dpu_rm_sspp_requirements *reqs);
> > +
> > +/**
> > + * dpu_rm_release_all_sspp - Given the CRTC, release all SSPP
> > + *	blocks previously reserved for that use case.
> > + * @rm: DPU Resource Manager handle
> > + * @crtc: DRM CRTC handle
> > + */
> > +void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
> > +			     struct drm_crtc *crtc);
> > +
> >   /**
> >    * Get hw resources of the given type that are assigned to this encoder.
> >    */
> > 

-- 
With best wishes
Dmitry
