Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7B61A0886
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 09:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FD36E57E;
	Tue,  7 Apr 2020 07:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711876E57A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 07:42:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j17so2608654wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jq4C3ivERiHGWYHnYULrL/YqTLEFidM1uG9DLMVZrU4=;
 b=jcD3Cp/NNO8tlS19HhBDJW8XSVHkGzjX615r/W0iEmI/dW05OIw9UkArP1Ym6sXsfr
 GrzVNLWOr4rBX+VdkYJIs7bqmc7rMEFhXaKU9tgP7O6upMGpkpl3PLaFjhoQQ+ILePHP
 PCRppTabfGv+X6IjqHudvZShSKZXU1HbLhmAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jq4C3ivERiHGWYHnYULrL/YqTLEFidM1uG9DLMVZrU4=;
 b=NAmAMVwD7AYUDCSzrcLjeRWF3OApw7wg0M3bthjwvtf0dZN+OIG+909DRkso5rQg4g
 +bChcWMCBjwriwChvLCzsvIfRy3RMyxlVnMQEufnkI4g5BnsCXirhilQysGOXA9+DMNo
 rAy2mG6cRWiYo8nZ9HTn7kruFwqRzkLAcbXauYJw/FxVuJkRP1GP+djnJtmMU6DfY1Nf
 Oqq1pAcwHtdR1zTNky9ZtuKM0H50T4xaVBsdAKA0h/yKtzC9HCsRQ8RrQol9M5gM6UrQ
 uP3kMohzIZKWdcA3bktFUNiRxjKLIl8B7S1QxjK2x3JCoL30rsEzm1w4dG2k4kReZvr3
 L5dw==
X-Gm-Message-State: AGi0PuYD3PCXp9vnouDzJh9RxzxUnsAqpfETKTcUfS3q3MAc7OzOnHYk
 fYOckCMpEVzSRlm/L77hsta+YA==
X-Google-Smtp-Source: APiQypJ0dRXDI93nwsVbUW/FK3rq4YdhPWN3FRgv1K5NG2KIlaHkzh4+Wjq+DWfXap98lroTPF+Ahg==
X-Received: by 2002:a5d:4e4e:: with SMTP id r14mr1234597wrt.362.1586245372966; 
 Tue, 07 Apr 2020 00:42:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o13sm7528334wrm.74.2020.04.07.00.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 00:42:52 -0700 (PDT)
Date: Tue, 7 Apr 2020 09:42:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 14/17] drm/i915: Replace I915_MODE_FLAG_INHERITED with
 a boolean
Message-ID: <20200407074250.GC3456981@phenom.ffwll.local>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-15-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403204008.14864-15-ville.syrjala@linux.intel.com>
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

On Fri, Apr 03, 2020 at 11:40:05PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> There's no reason for I915_MODE_FLAG_INHERITED to exist as a flag
> anymore. Just make it a boolean.
> =

> CC: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c       |  2 +-
>  drivers/gpu/drm/i915/display/intel_display.c      | 15 ++++++---------
>  .../gpu/drm/i915/display/intel_display_types.h    |  2 +-
>  3 files changed, 8 insertions(+), 11 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/dr=
m/i915/display/intel_atomic.c
> index 5863e339a426..2deafaa9ec74 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -249,10 +249,10 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	crtc_state->update_wm_post =3D false;
>  	crtc_state->fifo_changed =3D false;
>  	crtc_state->preload_luts =3D false;
> +	crtc_state->inherited =3D false;
>  	crtc_state->wm.need_postvbl_update =3D false;
>  	crtc_state->fb_bits =3D 0;
>  	crtc_state->update_planes =3D 0;
> -	crtc_state->mode_flags &=3D ~I915_MODE_FLAG_INHERITED;
>  =

>  	return &crtc_state->uapi;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index d88cade45c35..550369444811 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6413,8 +6413,7 @@ static bool hsw_post_update_enable_ips(const struct=
 intel_crtc_state *old_crtc_s
>  	 * We can't read out IPS on broadwell, assume the worst and
>  	 * forcibly enable IPS on the first fastset.
>  	 */
> -	if (new_crtc_state->update_pipe &&
> -	    old_crtc_state->mode_flags & I915_MODE_FLAG_INHERITED)
> +	if (new_crtc_state->update_pipe && old_crtc_state->inherited)
>  		return true;
>  =

>  	return !old_crtc_state->ips_enabled;
> @@ -13516,8 +13515,7 @@ intel_pipe_config_compare(const struct intel_crtc=
_state *current_config,
>  	bool ret =3D true;
>  	u32 bp_gamma =3D 0;
>  	bool fixup_inherited =3D fastset &&
> -		(current_config->mode_flags & I915_MODE_FLAG_INHERITED) &&
> -		!(pipe_config->mode_flags & I915_MODE_FLAG_INHERITED);
> +		current_config->inherited && !pipe_config->inherited;
>  =

>  	if (fixup_inherited && !fastboot_enabled(dev_priv)) {
>  		drm_dbg_kms(&dev_priv->drm,
> @@ -14667,10 +14665,9 @@ static int intel_atomic_check(struct drm_device =
*dev,
>  	int ret, i;
>  	bool any_ms =3D false;
>  =

> -	/* Catch I915_MODE_FLAG_INHERITED */
>  	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
>  					    new_crtc_state, i) {
> -		if (new_crtc_state->mode_flags !=3D old_crtc_state->mode_flags)
> +		if (new_crtc_state->inherited !=3D old_crtc_state->inherited)
>  			new_crtc_state->uapi.mode_changed =3D true;
>  	}
>  =

> @@ -15016,7 +15013,7 @@ static void intel_update_crtc(struct intel_atomic=
_state *state,
>  	 * of enabling them on the CRTC's first fastset.
>  	 */
>  	if (new_crtc_state->update_pipe && !modeset &&
> -	    old_crtc_state->mode_flags & I915_MODE_FLAG_INHERITED)
> +	    old_crtc_state->inherited)
>  		intel_crtc_arm_fifo_underrun(crtc, new_crtc_state);
>  }
>  =

> @@ -17494,7 +17491,7 @@ static int intel_initial_commit(struct drm_device=
 *dev)
>  			 * happen only for the first real commit from userspace.
>  			 * So preserve the inherited flag for the time being.
>  			 */
> -			crtc_state->mode_flags |=3D I915_MODE_FLAG_INHERITED;
> +			crtc_state->inherited =3D true;
>  =

>  			ret =3D drm_atomic_add_affected_planes(state, &crtc->base);
>  			if (ret)
> @@ -18266,7 +18263,7 @@ static void intel_modeset_readout_hw_state(struct=
 drm_device *dev)
>  			 * set a flag to indicate that a full recalculation is
>  			 * needed on the next commit.
>  			 */
> -			crtc_state->mode_flags |=3D I915_MODE_FLAG_INHERITED;
> +			crtc_state->inherited =3D true;
>  =

>  			intel_crtc_compute_pixel_rate(crtc_state);
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index 26df856f8b72..f529b14fbb2a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -642,7 +642,6 @@ struct intel_crtc_scaler_state {
>  };
>  =

>  /* {crtc,crtc_state}->mode_flags */
> -#define I915_MODE_FLAG_INHERITED (1<<0)
>  /* Flag to get scanline using frame time stamps */
>  #define I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP (1<<1)
>  /* Flag to use the scanline counter instead of the pixel counter */
> @@ -837,6 +836,7 @@ struct intel_crtc_state {
>  	bool update_wm_pre, update_wm_post; /* watermarks are updated */
>  	bool fifo_changed; /* FIFO split is changed */
>  	bool preload_luts;
> +	bool inherited; /* state inherited from BIOS? */
>  =

>  	/* Pipe source size (ie. panel fitter input size)
>  	 * All planes will be positioned inside this space,
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
