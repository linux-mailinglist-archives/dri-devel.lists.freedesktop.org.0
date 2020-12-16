Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B522DC917
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 23:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D289489B45;
	Wed, 16 Dec 2020 22:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A937F89A1F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 22:43:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y17so24677496wrr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rB2EdrM2t0RedIv24WvrSXv3bTRS05PFCWESMiIY2CA=;
 b=NlT9xrtgyiziwwdMKokPq/insf/1zF5rJzjExOG38p/QhrwFo9GTLApyLCHg+e4foe
 tYj/71LC3g3d7Q3lPNUZFRpuhYlDk5eU9DuX9HECcII9lma//O1vpXpQ8Z6a9xAnKubs
 6Bjxczqn10WQuw8bqq3xpSeGdWgwWHba2YHHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rB2EdrM2t0RedIv24WvrSXv3bTRS05PFCWESMiIY2CA=;
 b=Soz6DbP7TIGliz/aCR/Yqh7q3kFvnE8XqafSjTcNg417Rvew6sXfMBOSEVC4LkJQ4/
 +ZucmsowVdfuLJK9DLqYGr5FqXEmEUMz1bIP8eDk+MGph9KRtdaeg/BnW9X1isWnOfZ0
 +a4269dzjmmikJeyZ9BUf3LUS7oNzjQNMH2AYyYNAuy5NDc7qm5MJ8hVqOHmKjZm9Fc1
 JIP2T+/Xltfj5MYzOb+uzJ9L5nA6D0goZzKbLgB2aZMFjt5068DDe0YPHfqi8HkI5GOU
 +NqVjvpiRFcdpxUjdahfTxqtLKiVYgvga2ja74yCheW+uFGBn4RkNYvcRi/9kybGFIzz
 9dzw==
X-Gm-Message-State: AOAM530WYtIVAkmT1jei6S/xDknZyfJ8Ora66MQLXrFZX3bHgZ7JXjft
 MY/C8D8QlWw3fkBipFtD46o5Sg==
X-Google-Smtp-Source: ABdhPJxCNVg0e2fjjJCb0BcFy8+9ntKlBWaOta/I8xydGIGrrGYj2WPU7R3zExuIeDaZbk/b/jMISA==
X-Received: by 2002:adf:8b4a:: with SMTP id v10mr40437314wra.212.1608158607001; 
 Wed, 16 Dec 2020 14:43:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v125sm4727853wme.42.2020.12.16.14.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 14:43:26 -0800 (PST)
Date: Wed, 16 Dec 2020 23:43:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Bindu Ramamurthy <bindu.r@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 13/17] drm/amd/display: Expose new CRC window property
Message-ID: <X9qNjIgQI6Z9kmy+@phenom.ffwll.local>
References: <20201113205645.640981-1-bindu.r@amd.com>
 <20201113205645.640981-14-bindu.r@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113205645.640981-14-bindu.r@amd.com>
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
Cc: Eryk.Brol@amd.com, Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com,
 Qingqing.Zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, Aurabindo.Pillai@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 13, 2020 at 03:56:41PM -0500, Bindu Ramamurthy wrote:
> From: Wayne Lin <Wayne.Lin@amd.com>
> 
> [Why]
> Instead of calculating CRC on whole frame, add flexibility to calculate
> CRC on specific frame region.
> 
> [How]
> Add few crc window coordinate properties. By default, CRC is calculated
> on whole frame unless user space specifies the CRC calculation window.
> 
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Acked-by: Bindu Ramamurthy <bindu.r@amd.com>

Already pinged Alex on irc, but here also as a mail.

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 +++++++++++++++++-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  19 +++
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  43 +++++-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   3 +
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c |   3 +
>  5 files changed, 201 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 77c06f999040..f81c49f28bc9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -943,6 +943,41 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
>  }
>  #endif
>  
> +#ifdef CONFIG_DEBUG_FS
> +static int create_crtc_crc_properties(struct amdgpu_display_manager *dm)

Yes it's behind a #ifdef but a) most distros enable this anyway and b)
it's still a KMS property, so still uapi, i.e.
- should be discussed on dri-devel
- needs igt testcases and stuff
- and real userspace

Drivers adding random kms properties has brought us into a pretty giant
mess, we need to stop this. That's why we've increased merge criteria for
these to include an igt and have at least some hopes of a cross-driver
standard. Also the crc interface is all in debugfs, that's where this
belongs.

Please fix this before we ship it. Ideally we'd make this a standard part
so it can be used in igt testcase, but quick fix would be to either revert
or at least move into debugfs files (we have per-crtc files, so not hard
to pull off).

If this is for functional safety or whatever the IVI standard for that
was, then it needs real uapi treatment.

Thanks, Daniel

> +{
> +	dm->crc_win_x_start_property =
> +		drm_property_create_range(adev_to_drm(dm->adev),
> +					  DRM_MODE_PROP_ATOMIC,
> +					  "AMD_CRC_WIN_X_START", 0, U16_MAX);
> +	if (!dm->crc_win_x_start_property)
> +		return -ENOMEM;
> +
> +	dm->crc_win_y_start_property =
> +		drm_property_create_range(adev_to_drm(dm->adev),
> +					  DRM_MODE_PROP_ATOMIC,
> +					  "AMD_CRC_WIN_Y_START", 0, U16_MAX);
> +	if (!dm->crc_win_y_start_property)
> +		return -ENOMEM;
> +
> +	dm->crc_win_x_end_property =
> +		drm_property_create_range(adev_to_drm(dm->adev),
> +					  DRM_MODE_PROP_ATOMIC,
> +					  "AMD_CRC_WIN_X_END", 0, U16_MAX);
> +	if (!dm->crc_win_x_end_property)
> +		return -ENOMEM;
> +
> +	dm->crc_win_y_end_property =
> +		drm_property_create_range(adev_to_drm(dm->adev),
> +					  DRM_MODE_PROP_ATOMIC,
> +					  "AMD_CRC_WIN_Y_END", 0, U16_MAX);
> +	if (!dm->crc_win_y_end_property)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +#endif
> +
>  static int amdgpu_dm_init(struct amdgpu_device *adev)
>  {
>  	struct dc_init_data init_data;
> @@ -1084,6 +1119,10 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>  
>  		dc_init_callbacks(adev->dm.dc, &init_params);
>  	}
> +#endif
> +#ifdef CONFIG_DEBUG_FS
> +	if (create_crtc_crc_properties(&adev->dm))
> +		DRM_ERROR("amdgpu: failed to create crc property.\n");
>  #endif
>  	if (amdgpu_dm_initialize_drm_device(adev)) {
>  		DRM_ERROR(
> @@ -5409,12 +5448,64 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
>  	state->crc_src = cur->crc_src;
>  	state->cm_has_degamma = cur->cm_has_degamma;
>  	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
> -
> +#ifdef CONFIG_DEBUG_FS
> +	state->crc_window = cur->crc_window;
> +#endif
>  	/* TODO Duplicate dc_stream after objects are stream object is flattened */
>  
>  	return &state->base;
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
> +int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
> +					    struct drm_crtc_state *crtc_state,
> +					    struct drm_property *property,
> +					    uint64_t val)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct amdgpu_device *adev = drm_to_adev(dev);
> +	struct dm_crtc_state *dm_new_state =
> +		to_dm_crtc_state(crtc_state);
> +
> +	if (property == adev->dm.crc_win_x_start_property)
> +		dm_new_state->crc_window.x_start = val;
> +	else if (property == adev->dm.crc_win_y_start_property)
> +		dm_new_state->crc_window.y_start = val;
> +	else if (property == adev->dm.crc_win_x_end_property)
> +		dm_new_state->crc_window.x_end = val;
> +	else if (property == adev->dm.crc_win_y_end_property)
> +		dm_new_state->crc_window.y_end = val;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
> +					    const struct drm_crtc_state *state,
> +					    struct drm_property *property,
> +					    uint64_t *val)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct amdgpu_device *adev = drm_to_adev(dev);
> +	struct dm_crtc_state *dm_state =
> +		to_dm_crtc_state(state);
> +
> +	if (property == adev->dm.crc_win_x_start_property)
> +		*val = dm_state->crc_window.x_start;
> +	else if (property == adev->dm.crc_win_y_start_property)
> +		*val = dm_state->crc_window.y_start;
> +	else if (property == adev->dm.crc_win_x_end_property)
> +		*val = dm_state->crc_window.x_end;
> +	else if (property == adev->dm.crc_win_y_end_property)
> +		*val = dm_state->crc_window.y_end;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +#endif
> +
>  static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
>  {
>  	enum dc_irq_source irq_source;
> @@ -5481,6 +5572,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>  	.enable_vblank = dm_enable_vblank,
>  	.disable_vblank = dm_disable_vblank,
>  	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
> +#ifdef CONFIG_DEBUG_FS
> +	.atomic_set_property = amdgpu_dm_crtc_atomic_set_property,
> +	.atomic_get_property = amdgpu_dm_crtc_atomic_get_property,
> +#endif
>  };
>  
>  static enum drm_connector_status
> @@ -6689,6 +6784,25 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
> +static void attach_crtc_crc_properties(struct amdgpu_display_manager *dm,
> +				struct amdgpu_crtc *acrtc)
> +{
> +	drm_object_attach_property(&acrtc->base.base,
> +				   dm->crc_win_x_start_property,
> +				   0);
> +	drm_object_attach_property(&acrtc->base.base,
> +				   dm->crc_win_y_start_property,
> +				   0);
> +	drm_object_attach_property(&acrtc->base.base,
> +				   dm->crc_win_x_end_property,
> +				   0);
> +	drm_object_attach_property(&acrtc->base.base,
> +				   dm->crc_win_y_end_property,
> +				   0);
> +}
> +#endif
> +
>  static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  			       struct drm_plane *plane,
>  			       uint32_t crtc_index)
> @@ -6736,7 +6850,9 @@ static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  	drm_crtc_enable_color_mgmt(&acrtc->base, MAX_COLOR_LUT_ENTRIES,
>  				   true, MAX_COLOR_LUT_ENTRIES);
>  	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
> -
> +#ifdef CONFIG_DEBUG_FS
> +	attach_crtc_crc_properties(dm, acrtc);
> +#endif
>  	return 0;
>  
>  fail:
> @@ -8363,6 +8479,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  	 */
>  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
>  		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
> +		bool configure_crc = false;
>  
>  		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>  
> @@ -8372,21 +8489,30 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  			dc_stream_retain(dm_new_crtc_state->stream);
>  			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
>  			manage_dm_interrupts(adev, acrtc, true);
> -
> +		}
>  #ifdef CONFIG_DEBUG_FS
> +		if (new_crtc_state->active &&
> +			amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
>  			/**
>  			 * Frontend may have changed so reapply the CRC capture
>  			 * settings for the stream.
>  			 */
>  			dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
> +			dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
>  
> -			if (amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
> -				amdgpu_dm_crtc_configure_crc_source(
> -					crtc, dm_new_crtc_state,
> -					dm_new_crtc_state->crc_src);
> +			if (amdgpu_dm_crc_window_is_default(dm_new_crtc_state)) {
> +				if (!old_crtc_state->active || drm_atomic_crtc_needs_modeset(new_crtc_state))
> +					configure_crc = true;
> +			} else {
> +				if (amdgpu_dm_crc_window_changed(dm_new_crtc_state, dm_old_crtc_state))
> +					configure_crc = true;
>  			}
> -#endif
> +
> +			if (configure_crc)
> +				amdgpu_dm_crtc_configure_crc_source(
> +					crtc, dm_new_crtc_state, dm_new_crtc_state->crc_src);
>  		}
> +#endif
>  	}
>  
>  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 963a69877455..f2aebbe4d140 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -336,6 +336,13 @@ struct amdgpu_display_manager {
>  	 */
>  	const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
>  
> +#ifdef CONFIG_DEBUG_FS
> +	/* set the crc calculation window*/
> +	struct drm_property *crc_win_x_start_property;
> +	struct drm_property *crc_win_y_start_property;
> +	struct drm_property *crc_win_x_end_property;
> +	struct drm_property *crc_win_y_end_property;
> +#endif
>  	/**
>  	 * @mst_encoders:
>  	 *
> @@ -422,6 +429,15 @@ struct dm_plane_state {
>  	struct dc_plane_state *dc_state;
>  };
>  
> +#ifdef CONFIG_DEBUG_FS
> +struct crc_rec {
> +	uint16_t x_start;
> +	uint16_t y_start;
> +	uint16_t x_end;
> +	uint16_t y_end;
> +	};
> +#endif
> +
>  struct dm_crtc_state {
>  	struct drm_crtc_state base;
>  	struct dc_stream_state *stream;
> @@ -444,6 +460,9 @@ struct dm_crtc_state {
>  	struct dc_info_packet vrr_infopacket;
>  
>  	int abm_level;
> +#ifdef CONFIG_DEBUG_FS
> +	struct crc_rec crc_window;
> +#endif
>  };
>  
>  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> index c29dc11619f7..ff6db26626ea 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
> @@ -81,6 +81,33 @@ const char *const *amdgpu_dm_crtc_get_crc_sources(struct drm_crtc *crtc,
>  	return pipe_crc_sources;
>  }
>  
> +bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state)
> +{
> +	bool ret = true;
> +
> +	if ((dm_crtc_state->crc_window.x_start != 0) ||
> +		(dm_crtc_state->crc_window.y_start != 0) ||
> +		(dm_crtc_state->crc_window.x_end != 0) ||
> +		(dm_crtc_state->crc_window.y_end != 0))
> +		ret = false;
> +
> +	return ret;
> +}
> +
> +bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
> +					struct dm_crtc_state *dm_old_crtc_state)
> +{
> +	bool ret = false;
> +
> +	if ((dm_new_crtc_state->crc_window.x_start != dm_old_crtc_state->crc_window.x_start) ||
> +		(dm_new_crtc_state->crc_window.y_start != dm_old_crtc_state->crc_window.y_start) ||
> +		(dm_new_crtc_state->crc_window.x_end != dm_old_crtc_state->crc_window.x_end) ||
> +		(dm_new_crtc_state->crc_window.y_end != dm_old_crtc_state->crc_window.y_end))
> +		ret = true;
> +
> +	return ret;
> +}
> +
>  int
>  amdgpu_dm_crtc_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
>  				 size_t *values_cnt)
> @@ -105,6 +132,7 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
>  	struct dc_stream_state *stream_state = dm_crtc_state->stream;
>  	bool enable = amdgpu_dm_is_valid_crc_source(source);
>  	int ret = 0;
> +	struct crc_params *crc_window = NULL, tmp_window;
>  
>  	/* Configuration will be deferred to stream enable. */
>  	if (!stream_state)
> @@ -114,8 +142,21 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
>  
>  	/* Enable CRTC CRC generation if necessary. */
>  	if (dm_is_crc_source_crtc(source)) {
> +		if (!amdgpu_dm_crc_window_is_default(dm_crtc_state)) {
> +			crc_window = &tmp_window;
> +
> +			tmp_window.windowa_x_start = dm_crtc_state->crc_window.x_start;
> +			tmp_window.windowa_y_start = dm_crtc_state->crc_window.y_start;
> +			tmp_window.windowa_x_end = dm_crtc_state->crc_window.x_end;
> +			tmp_window.windowa_y_end = dm_crtc_state->crc_window.y_end;
> +			tmp_window.windowb_x_start = dm_crtc_state->crc_window.x_start;
> +			tmp_window.windowb_y_start = dm_crtc_state->crc_window.y_start;
> +			tmp_window.windowb_x_end = dm_crtc_state->crc_window.x_end;
> +			tmp_window.windowb_y_end = dm_crtc_state->crc_window.y_end;
> +		}
> +
>  		if (!dc_stream_configure_crc(stream_state->ctx->dc,
> -					     stream_state, NULL, enable, enable)) {
> +					     stream_state, crc_window, enable, enable)) {
>  			ret = -EINVAL;
>  			goto unlock;
>  		}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
> index f7d731797d3f..0235bfb246e5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
> @@ -47,6 +47,9 @@ static inline bool amdgpu_dm_is_valid_crc_source(enum amdgpu_dm_pipe_crc_source
>  
>  /* amdgpu_dm_crc.c */
>  #ifdef CONFIG_DEBUG_FS
> +bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state);
> +bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
> +					struct dm_crtc_state *dm_old_crtc_state);
>  int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
>  					struct dm_crtc_state *dm_crtc_state,
>  					enum amdgpu_dm_pipe_crc_source source);
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index f522b664d3c6..5790affc7d61 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -3259,6 +3259,9 @@ void core_link_enable_stream(
>  			}
>  		}
>  
> +#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
> +#endif
> +
>  		dc->hwss.enable_audio_stream(pipe_ctx);
>  
>  		/* turn off otg test pattern if enable */
> -- 
> 2.25.1
> 
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
