Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021781A0876
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 09:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B466E563;
	Tue,  7 Apr 2020 07:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C1E6E55E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 07:38:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d202so728369wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 00:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7L+q8u9aDwKW8VH2gp1hEXyi3Nj9rt/T9SIxyrtJ+OY=;
 b=OyAWGDM02X73ISHlPPZw6Mtv5XV7ZbYFgVsCeAbaUpbaDCYcrD50RymhF7XVP+b4+E
 2rIrkzUixDJO6N23gAWigpQ2FCE93FXrZx1yT7WzbjTG2hcp159db4qzMO6VwgCGZNu2
 7WWl4bdAkwtXNiEu9LwoNtY0tvu6UvV1gd/uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7L+q8u9aDwKW8VH2gp1hEXyi3Nj9rt/T9SIxyrtJ+OY=;
 b=mcthj3yhJss3eouYEb18YTr0cN3tXiOLzc/b928qhIrRd+40Vh4PrTFAktrdlxHgDV
 mZMWfF/08IUZAf5B4isB8GkUre391VVomouO20RqWfxUpV61xMnQvys1hom1/lQaSyb5
 oJm8klqbgGKPOYWECbVQ2JlywXYS4wGG/kHzQl7kyKA4H1ByI4Gm/v79zVETPerVD8Bv
 VhG5lha455Wy7rMtlDUw3IeeOqgZH6a5/GGFIsFIcZ5qP0GdMkA7e9t1Cuu6SJKjqiHu
 +L/LN9sW3smMHcwWnTz/z+HENNLRalOROV68TscA3tHUAV/t7vmU+oiXywW1EsgqAGx4
 Tn6Q==
X-Gm-Message-State: AGi0PuYegh5FdXCA9j3x9fF/6ZKwzlMhGH4nVBVOXJcHBNrSGhlPosFl
 LQ0MUTzu4a1eIoEfkOiV0HkiM1ZITlI=
X-Google-Smtp-Source: APiQypKYDmuc1G+xsMQibbPsC7PCEzSQfxiJ3QAZmrmEOSspoQ5rcNu4NzEXCG5HK0Yt3naK0VAGqw==
X-Received: by 2002:a05:600c:234f:: with SMTP id
 15mr974251wmq.107.1586245129930; 
 Tue, 07 Apr 2020 00:38:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h10sm31160852wrq.33.2020.04.07.00.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 00:38:49 -0700 (PDT)
Date: Tue, 7 Apr 2020 09:38:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 13/17] drm/i915: Stop using mode->private_flags
Message-ID: <20200407073847.GB3456981@phenom.ffwll.local>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-14-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403204008.14864-14-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 11:40:04PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Replace the use of mode->private_flags with a truly private bitmaks
> in our own crtc state. We also need a copy in the crtc itself so the
> vblank code can get at it. We already have scanline_offset in there
> for a similar reason, as well as the vblank->hwmode which is assigned
> via drm_calc_timestamping_constants(). Fortunately we now have a
> nice place for doing the crtc_state->crtc copy in
> intel_crtc_update_active_timings() which gets called both for
> modesets and init/resume readout.
> =

> The one slightly iffy spot is the INHERITED flag which we want to
> preserve until userspace/fb_helper does the first proper commit after
> actually calling .detecti() on the connectors. Otherwise we don't have
> the full sink capabilities (audio,infoframes,etc.) when .compute_config()
> gets called and thus we will fail to enable those features when the
> first userspace commit happens. The only internal commit we do prior to
> that should be from intel_initial_commit() and there we can simply
> preserve the INHERITED flag from the readout.
> =

> CC: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c        | 13 ++++------
>  drivers/gpu/drm/i915/display/intel_atomic.c   |  1 +
>  drivers/gpu/drm/i915/display/intel_display.c  | 24 +++++++++++++------
>  .../drm/i915/display/intel_display_types.h    |  9 ++++++-
>  drivers/gpu/drm/i915/display/intel_tv.c       |  4 ++--
>  drivers/gpu/drm/i915/display/vlv_dsi.c        |  6 ++---
>  drivers/gpu/drm/i915/i915_irq.c               |  4 ++--
>  7 files changed, 37 insertions(+), 24 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i91=
5/display/icl_dsi.c
> index 99a25c0bb08f..4d6788ef2e5e 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1469,8 +1469,7 @@ static void gen11_dsi_get_config(struct intel_encod=
er *encoder,
>  	pipe_config->pipe_bpp =3D bdw_get_pipemisc_bpp(crtc);
>  =

>  	if (gen11_dsi_is_periodic_cmd_mode(intel_dsi))
> -		pipe_config->hw.adjusted_mode.private_flags |=3D
> -					I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE;
> +		pipe_config->mode_flags |=3D I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE;
>  }
>  =

>  static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
> @@ -1555,10 +1554,6 @@ static int gen11_dsi_compute_config(struct intel_e=
ncoder *encoder,
>  =

>  	pipe_config->port_clock =3D afe_clk(encoder, pipe_config) / 5;
>  =

> -	/* We would not operate in periodic command mode */
> -	pipe_config->hw.adjusted_mode.private_flags &=3D
> -					~I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE;
> -

Since you delete this here, but not above (and then you could also detel
gen11_dsi_is_periodic_cmd_mode I think): It's dead code, maybe prep patch
to just garbage collect I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE?

I think the proper replacement is the mode flag stuff below, this is just
interim stuff that fell through the review.

With that prep patch to get rid of these 2 hunks above:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also surplus Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> on the patch
to delete I915_MODE_FLAG_DSI_PERIODIC_CMD_MODE in case I miss the new
version.

>  	/*
>  	 * In case of TE GATE cmd mode, we
>  	 * receive TE from the slave if
> @@ -1566,14 +1561,14 @@ static int gen11_dsi_compute_config(struct intel_=
encoder *encoder,
>  	 */
>  	if (is_cmd_mode(intel_dsi)) {
>  		if (intel_dsi->ports =3D=3D (BIT(PORT_B) | BIT(PORT_A)))
> -			pipe_config->hw.adjusted_mode.private_flags |=3D
> +			pipe_config->mode_flags |=3D
>  						I915_MODE_FLAG_DSI_USE_TE1 |
>  						I915_MODE_FLAG_DSI_USE_TE0;
>  		else if (intel_dsi->ports =3D=3D BIT(PORT_B))
> -			pipe_config->hw.adjusted_mode.private_flags |=3D
> +			pipe_config->mode_flags |=3D
>  						I915_MODE_FLAG_DSI_USE_TE1;
>  		else
> -			pipe_config->hw.adjusted_mode.private_flags |=3D
> +			pipe_config->mode_flags |=3D
>  						I915_MODE_FLAG_DSI_USE_TE0;
>  	}
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/dr=
m/i915/display/intel_atomic.c
> index d043057d2fa0..5863e339a426 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -252,6 +252,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	crtc_state->wm.need_postvbl_update =3D false;
>  	crtc_state->fb_bits =3D 0;
>  	crtc_state->update_planes =3D 0;
> +	crtc_state->mode_flags &=3D ~I915_MODE_FLAG_INHERITED;
>  =

>  	return &crtc_state->uapi;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index bcb5d754f20d..d88cade45c35 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6414,7 +6414,7 @@ static bool hsw_post_update_enable_ips(const struct=
 intel_crtc_state *old_crtc_s
>  	 * forcibly enable IPS on the first fastset.
>  	 */
>  	if (new_crtc_state->update_pipe &&
> -	    old_crtc_state->hw.adjusted_mode.private_flags & I915_MODE_FLAG_INH=
ERITED)
> +	    old_crtc_state->mode_flags & I915_MODE_FLAG_INHERITED)
>  		return true;
>  =

>  	return !old_crtc_state->ips_enabled;
> @@ -13516,8 +13516,8 @@ intel_pipe_config_compare(const struct intel_crtc=
_state *current_config,
>  	bool ret =3D true;
>  	u32 bp_gamma =3D 0;
>  	bool fixup_inherited =3D fastset &&
> -		(current_config->hw.mode.private_flags & I915_MODE_FLAG_INHERITED) &&
> -		!(pipe_config->hw.mode.private_flags & I915_MODE_FLAG_INHERITED);
> +		(current_config->mode_flags & I915_MODE_FLAG_INHERITED) &&
> +		!(pipe_config->mode_flags & I915_MODE_FLAG_INHERITED);
>  =

>  	if (fixup_inherited && !fastboot_enabled(dev_priv)) {
>  		drm_dbg_kms(&dev_priv->drm,
> @@ -14307,6 +14307,8 @@ intel_crtc_update_active_timings(const struct int=
el_crtc_state *crtc_state)
>  =

>  	drm_calc_timestamping_constants(&crtc->base, adjusted_mode);
>  =

> +	crtc->mode_flags =3D crtc_state->mode_flags;
> +
>  	/*
>  	 * The scanline counter increments at the leading edge of hsync.
>  	 *
> @@ -14668,8 +14670,7 @@ static int intel_atomic_check(struct drm_device *=
dev,
>  	/* Catch I915_MODE_FLAG_INHERITED */
>  	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
>  					    new_crtc_state, i) {
> -		if (new_crtc_state->uapi.mode.private_flags !=3D
> -		    old_crtc_state->uapi.mode.private_flags)
> +		if (new_crtc_state->mode_flags !=3D old_crtc_state->mode_flags)
>  			new_crtc_state->uapi.mode_changed =3D true;
>  	}
>  =

> @@ -15015,7 +15016,7 @@ static void intel_update_crtc(struct intel_atomic=
_state *state,
>  	 * of enabling them on the CRTC's first fastset.
>  	 */
>  	if (new_crtc_state->update_pipe && !modeset &&
> -	    old_crtc_state->hw.mode.private_flags & I915_MODE_FLAG_INHERITED)
> +	    old_crtc_state->mode_flags & I915_MODE_FLAG_INHERITED)
>  		intel_crtc_arm_fifo_underrun(crtc, new_crtc_state);
>  }
>  =

> @@ -17486,6 +17487,15 @@ static int intel_initial_commit(struct drm_devic=
e *dev)
>  		}
>  =

>  		if (crtc_state->hw.active) {
> +			/*
> +			 * We've not yet detected sink capabilities
> +			 * (audio,infoframes,etc.) and thus we don't want to
> +			 * force a full state recomputation yet. We want that to
> +			 * happen only for the first real commit from userspace.
> +			 * So preserve the inherited flag for the time being.
> +			 */
> +			crtc_state->mode_flags |=3D I915_MODE_FLAG_INHERITED;
> +
>  			ret =3D drm_atomic_add_affected_planes(state, &crtc->base);
>  			if (ret)
>  				goto out;
> @@ -18256,7 +18266,7 @@ static void intel_modeset_readout_hw_state(struct=
 drm_device *dev)
>  			 * set a flag to indicate that a full recalculation is
>  			 * needed on the next commit.
>  			 */
> -			mode->private_flags =3D I915_MODE_FLAG_INHERITED;
> +			crtc_state->mode_flags |=3D I915_MODE_FLAG_INHERITED;
>  =

>  			intel_crtc_compute_pixel_rate(crtc_state);
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index 2bedd626c686..26df856f8b72 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -641,7 +641,7 @@ struct intel_crtc_scaler_state {
>  	int scaler_id;
>  };
>  =

> -/* drm_mode->private_flags */
> +/* {crtc,crtc_state}->mode_flags */
>  #define I915_MODE_FLAG_INHERITED (1<<0)
>  /* Flag to get scanline using frame time stamps */
>  #define I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP (1<<1)
> @@ -952,6 +952,9 @@ struct intel_crtc_state {
>  	/* Used by SDVO (and if we ever fix it, HDMI). */
>  	unsigned pixel_multiplier;
>  =

> +	/* I915_MODE_FLAG_* */
> +	u8 mode_flags;
> +
>  	u8 lane_count;
>  =

>  	/*
> @@ -1115,6 +1118,10 @@ struct intel_crtc {
>  	 */
>  	bool active;
>  	u8 plane_ids_mask;
> +
> +	/* I915_MODE_FLAG_* */
> +	u8 mode_flags;
> +
>  	unsigned long long enabled_power_domains;
>  	struct intel_overlay *overlay;
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i9=
15/display/intel_tv.c
> index abc67207f2f3..777032d9697b 100644
> --- a/drivers/gpu/drm/i915/display/intel_tv.c
> +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> @@ -1158,7 +1158,7 @@ intel_tv_get_config(struct intel_encoder *encoder,
>  =

>  	/* pixel counter doesn't work on i965gm TV output */
>  	if (IS_I965GM(dev_priv))
> -		adjusted_mode->private_flags |=3D
> +		pipe_config->mode_flags |=3D
>  			I915_MODE_FLAG_USE_SCANLINE_COUNTER;
>  }
>  =

> @@ -1328,7 +1328,7 @@ intel_tv_compute_config(struct intel_encoder *encod=
er,
>  =

>  	/* pixel counter doesn't work on i965gm TV output */
>  	if (IS_I965GM(dev_priv))
> -		adjusted_mode->private_flags |=3D
> +		pipe_config->mode_flags |=3D
>  			I915_MODE_FLAG_USE_SCANLINE_COUNTER;
>  =

>  	return 0;
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i91=
5/display/vlv_dsi.c
> index 4e18d4627065..d8b1c12cb21c 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -299,7 +299,7 @@ static int intel_dsi_compute_config(struct intel_enco=
der *encoder,
>  =

>  	if (IS_GEN9_LP(dev_priv)) {
>  		/* Enable Frame time stamp based scanline reporting */
> -		adjusted_mode->private_flags |=3D
> +		pipe_config->mode_flags |=3D
>  			I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP;
>  =

>  		/* Dual link goes to DSI transcoder A. */
> @@ -1098,8 +1098,8 @@ static void bxt_dsi_get_pipe_config(struct intel_en=
coder *encoder,
>  	pipe_config->pipe_bpp =3D bdw_get_pipemisc_bpp(crtc);
>  =

>  	/* Enable Frame time stamo based scanline reporting */
> -	adjusted_mode->private_flags |=3D
> -			I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP;
> +	pipe_config->mode_flags |=3D
> +		I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP;
>  =

>  	/* In terms of pixels */
>  	adjusted_mode->crtc_hdisplay =3D
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index 1502ab44f1a5..55ed9516bfd3 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -735,7 +735,7 @@ static int __intel_get_crtc_scanline(struct intel_crt=
c *crtc)
>  	vblank =3D &crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
>  	mode =3D &vblank->hwmode;
>  =

> -	if (mode->private_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP)
> +	if (crtc->mode_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP)
>  		return __intel_get_crtc_scanline_from_timestamp(crtc);
>  =

>  	vtotal =3D mode->crtc_vtotal;
> @@ -794,7 +794,7 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc =
*_crtc,
>  	unsigned long irqflags;
>  	bool use_scanline_counter =3D INTEL_GEN(dev_priv) >=3D 5 ||
>  		IS_G4X(dev_priv) || IS_GEN(dev_priv, 2) ||
> -		mode->private_flags & I915_MODE_FLAG_USE_SCANLINE_COUNTER;
> +		crtc->mode_flags & I915_MODE_FLAG_USE_SCANLINE_COUNTER;
>  =

>  	if (drm_WARN_ON(&dev_priv->drm, !mode->crtc_clock)) {
>  		drm_dbg(&dev_priv->drm,
> -- =

> 2.24.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
