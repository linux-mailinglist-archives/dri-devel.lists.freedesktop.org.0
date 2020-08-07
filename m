Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210023E8D6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 10:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8766E07D;
	Fri,  7 Aug 2020 08:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D2D6E07D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 08:24:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a14so867703wra.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 01:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nko1QZC191jx50LSl8Y7JHn+0emLCmSAq7jjr2cCLqg=;
 b=MlbP+Lv9lo930mHTtkTOqKuvE4vE2POozSJ8t+o/2VEJO8DmSVUZFy/5rKueE4PF/O
 T1cbMCEr5C3kGmbl/xXJnwleDyShukhC+SLhbfhP7th9NLS9qcg4p76f3Nx+wOVQX2R8
 EgwC+eBhdDNQVUooZJBjvcDNUKTOdWLFCniBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nko1QZC191jx50LSl8Y7JHn+0emLCmSAq7jjr2cCLqg=;
 b=E19+hi0RoQvof97sL0FYl44Evh5J7kJ3HaQL60HPjA4gcB5YXcd3O568xzVhUOYZBp
 +hNuvA2y+bOJ5gWsLpCkHvnwYhmrq6OabsNnlfn6nSW46Ket00f2yzVsbSKUhtHB4M6Z
 +P1ZMLZHzoKuPp5CwuXqUvL+mPZsfcKxhkC6P/FssEfE2PKeiiSjx877yCSNWaaK74ef
 aQG2fp1aZtXG3o4LGQ2tgrzSwmfmoDChr/wKCMu4vh9aVxtpIk7VrS5PVLiYgTaimzzc
 Lt24x6H3y7JtLKqs/sNgrBIb4wSAqZ39xYJi/czrdk7FOob0OnAUD3wqOaZcG7CPrFk6
 rFfA==
X-Gm-Message-State: AOAM53021Oj+3yp1HigAVLmW/8Xm7+Txn+D3SciyP2Jk9so+L0uyWuCh
 4tgFuUHTwbRpvFs6juwKL/pIeA==
X-Google-Smtp-Source: ABdhPJyJvCHvO+j7ITuQqQswafoW+tiFLnuAMk2ec58Wy4rEkgAp/YMeHxL2tKzNhIFa7j+tbTVtpA==
X-Received: by 2002:a5d:460c:: with SMTP id t12mr11487923wrq.334.1596788649294; 
 Fri, 07 Aug 2020 01:24:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v8sm9829555wmb.24.2020.08.07.01.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:24:08 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:24:06 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 1/7] drm/amd/display: Store tiling_flags and tmz_surface
 on dm_plane_state
Message-ID: <20200807082406.GJ6419@phenom.ffwll.local>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-2-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730203642.17553-2-nicholas.kazlauskas@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 04:36:36PM -0400, Nicholas Kazlauskas wrote:
> [Why]
> Store these in advance so we can reuse them later in commit_tail without
> having to reserve the fbo again.
> 
> These will also be used for checking for tiling changes when deciding
> to reset the plane or not.

I've also dropped some comments on Bas' series for adding modifiers which
might be relevant for shuffling all this. But yeah stuff this into plane
state sounds like a good idea.
-Daniel

> 
> [How]
> This change should mostly be a refactor. Only commit check is affected
> for now and I'll drop the get_fb_info calls in prepare_planes and
> commit_tail after.
> 
> This runs a prepass loop once we think that all planes have been added
> to the context and replaces the get_fb_info calls with accessing the
> dm_plane_state instead.
> 
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 60 +++++++++++--------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
>  2 files changed, 37 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8d64f5fde7e2..7cc5ab90ce13 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3700,8 +3700,17 @@ static int fill_dc_scaling_info(const struct drm_plane_state *state,
>  static int get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb,
>  		       uint64_t *tiling_flags, bool *tmz_surface)
>  {
> -	struct amdgpu_bo *rbo = gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
> -	int r = amdgpu_bo_reserve(rbo, false);
> +	struct amdgpu_bo *rbo;
> +	int r;
> +
> +	if (!amdgpu_fb) {
> +		*tiling_flags = 0;
> +		*tmz_surface = false;
> +		return 0;
> +	}
> +
> +	rbo = gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
> +	r = amdgpu_bo_reserve(rbo, false);
>  
>  	if (unlikely(r)) {
>  		/* Don't show error message when returning -ERESTARTSYS */
> @@ -4124,13 +4133,10 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
>  				    struct drm_crtc_state *crtc_state)
>  {
>  	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
> -	const struct amdgpu_framebuffer *amdgpu_fb =
> -		to_amdgpu_framebuffer(plane_state->fb);
> +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
>  	struct dc_scaling_info scaling_info;
>  	struct dc_plane_info plane_info;
> -	uint64_t tiling_flags;
>  	int ret;
> -	bool tmz_surface = false;
>  	bool force_disable_dcc = false;
>  
>  	ret = fill_dc_scaling_info(plane_state, &scaling_info);
> @@ -4142,15 +4148,12 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
>  	dc_plane_state->clip_rect = scaling_info.clip_rect;
>  	dc_plane_state->scaling_quality = scaling_info.scaling_quality;
>  
> -	ret = get_fb_info(amdgpu_fb, &tiling_flags, &tmz_surface);
> -	if (ret)
> -		return ret;
> -
>  	force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
> -	ret = fill_dc_plane_info_and_addr(adev, plane_state, tiling_flags,
> +	ret = fill_dc_plane_info_and_addr(adev, plane_state,
> +					  dm_plane_state->tiling_flags,
>  					  &plane_info,
>  					  &dc_plane_state->address,
> -					  tmz_surface,
> +					  dm_plane_state->tmz_surface,
>  					  force_disable_dcc);
>  	if (ret)
>  		return ret;
> @@ -5753,6 +5756,10 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  		dc_plane_state_retain(dm_plane_state->dc_state);
>  	}
>  
> +	/* Framebuffer hasn't been updated yet, so retain old flags. */
> +	dm_plane_state->tiling_flags = old_dm_plane_state->tiling_flags;
> +	dm_plane_state->tmz_surface = old_dm_plane_state->tmz_surface;
> +
>  	return &dm_plane_state->base;
>  }
>  
> @@ -8557,13 +8564,9 @@ dm_determine_update_type_for_commit(struct amdgpu_display_manager *dm,
>  			continue;
>  
>  		for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, j) {
> -			const struct amdgpu_framebuffer *amdgpu_fb =
> -				to_amdgpu_framebuffer(new_plane_state->fb);
>  			struct dc_plane_info *plane_info = &bundle->plane_infos[num_plane];
>  			struct dc_flip_addrs *flip_addr = &bundle->flip_addrs[num_plane];
>  			struct dc_scaling_info *scaling_info = &bundle->scaling_infos[num_plane];
> -			uint64_t tiling_flags;
> -			bool tmz_surface = false;
>  
>  			new_plane_crtc = new_plane_state->crtc;
>  			new_dm_plane_state = to_dm_plane_state(new_plane_state);
> @@ -8610,16 +8613,12 @@ dm_determine_update_type_for_commit(struct amdgpu_display_manager *dm,
>  
>  			bundle->surface_updates[num_plane].scaling_info = scaling_info;
>  
> -			if (amdgpu_fb) {
> -				ret = get_fb_info(amdgpu_fb, &tiling_flags, &tmz_surface);
> -				if (ret)
> -					goto cleanup;
> -
> +			if (new_plane_state->fb) {
>  				ret = fill_dc_plane_info_and_addr(
> -					dm->adev, new_plane_state, tiling_flags,
> -					plane_info,
> -					&flip_addr->address, tmz_surface,
> -					false);
> +					dm->adev, new_plane_state,
> +					new_dm_plane_state->tiling_flags,
> +					plane_info, &flip_addr->address,
> +					new_dm_plane_state->tmz_surface, false);
>  				if (ret)
>  					goto cleanup;
>  
> @@ -8833,6 +8832,17 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  		}
>  	}
>  
> +	/* Prepass for updating tiling flags on new planes. */
> +	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> +		struct dm_plane_state *new_dm_plane_state = to_dm_plane_state(new_plane_state);
> +		struct amdgpu_framebuffer *new_afb = to_amdgpu_framebuffer(new_plane_state->fb);
> +
> +		ret = get_fb_info(new_afb, &new_dm_plane_state->tiling_flags,
> +				  &new_dm_plane_state->tmz_surface);
> +		if (ret)
> +			goto fail;
> +	}
> +
>  	/* Remove exiting planes if they are modified */
>  	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
>  		ret = dm_update_plane_state(dc, state, plane,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 5b6f879a108c..ad025f5cfd3e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -409,6 +409,8 @@ struct dc_plane_state;
>  struct dm_plane_state {
>  	struct drm_plane_state base;
>  	struct dc_plane_state *dc_state;
> +	uint64_t tiling_flags;
> +	bool tmz_surface;
>  };
>  
>  struct dm_crtc_state {
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
