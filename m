Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE6260456
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 20:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AFE6E51B;
	Mon,  7 Sep 2020 18:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4135C6E51B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 18:14:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w5so16646214wrp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 11:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xMmocTlajCiS0vszEsHyq9NFZY0oFxHiPXZEs5xLhBU=;
 b=Pj9tMGSoWZzK5TXp61WgIWU4eJl3hwo/TwRpU6faHZUORa/L0vauWoHHdZUrqrFvXE
 msk/KtWKET7TYom7rPpX52B+HcViQiXlWZ8GjoqVnvffAob99gKBMlZc2RYh1OcUHCBa
 g6Xb7x3PtaysXtUsFyEDgvwSMO0htRKxnyaj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xMmocTlajCiS0vszEsHyq9NFZY0oFxHiPXZEs5xLhBU=;
 b=j0TxRVZuwDoo+YZKjf5TPU2ms7b5C3m25YjXL3Pi7Gbem9B6JyhxgfaS5wAptlXGBG
 0tGQu/gbggKBy/PaNu3vP1rB2L3hazVqryoeIMfIkgPYhLPEpBnyHwGLdJ8n1RFtQJ+J
 ZmtmoHJpzEHl4JP6OSZQuP2G+eHWACd4QfqUDCXCll+H0kOrq4V19KWEKhXrWf/FWbc0
 eN1gpotBkLrMnN/7qf/RKdot7rSzgZXWUeQMoz2sgzhe2LWEvY22cv5UW3MhfCE3goDV
 qFpgmG8pOeT2TVCFXXltHRY2AG1tJLNdsu4vmnwH7AIg15B7Sw8lF2vzXjz3KUU5tBzX
 +CQA==
X-Gm-Message-State: AOAM530NU0kf/SO3LIh4uWXCBHhehx7e+1KfCoeae0Ew78cN5Elg93qU
 6pOuCf5HeOfSn+w4Ah5AKCev19ipEyd1jMDq
X-Google-Smtp-Source: ABdhPJy2GCGqNz6tDjmDouMiHfcsR1h/0ITf5PxQuKk0CqNUtlRwXIIAfHRn2kRbposrfH2RvOvn3A==
X-Received: by 2002:adf:828e:: with SMTP id 14mr24611433wrc.217.1599502480955; 
 Mon, 07 Sep 2020 11:14:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l8sm30062870wrx.22.2020.09.07.11.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 11:14:40 -0700 (PDT)
Date: Mon, 7 Sep 2020 20:14:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Drop the
 drm_atomic_helper_calc_timestamping_constants() call
Message-ID: <20200907181438.GC2352366@phenom.ffwll.local>
References: <20200907120026.6360-1-ville.syrjala@linux.intel.com>
 <20200907120026.6360-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907120026.6360-3-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 03:00:26PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> We update the timestamping constants per-crtc explicitly in
> intel_crtc_update_active_timings(). Furtermore the helper will
> use uapi.adjusted_mode whereas we want hw.adjusted_mode. Thus
> let's drop the helper call an rely on what we already have in
> intel_crtc_update_active_timings(). We can now also drop the
> hw.adjusted_mode -> uapi.adjusted_mode copy hack that was added
> to keep the helper from deriving the timestamping constants from
> the wrong thing.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Does this fix some CI fail? I'd kinda expect/hope for that ...

Anyway looks like a good idea to not mess with the uapi state like this.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 7 -------
>  1 file changed, 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 035840ce3825..a846f414c759 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -13472,12 +13472,6 @@ intel_modeset_pipe_config(struct intel_crtc_stat=
e *pipe_config)
>  		    "hw max bpp: %i, pipe bpp: %i, dithering: %i\n",
>  		    base_bpp, pipe_config->pipe_bpp, pipe_config->dither);
>  =

> -	/*
> -	 * Make drm_calc_timestamping_constants in
> -	 * drm_atomic_helper_update_legacy_modeset_state() happy
> -	 */
> -	pipe_config->uapi.adjusted_mode =3D pipe_config->hw.adjusted_mode;
> -
>  	return 0;
>  }
>  =

> @@ -15578,7 +15572,6 @@ static void intel_atomic_commit_tail(struct intel=
_atomic_state *state)
>  =

>  	if (state->modeset) {
>  		drm_atomic_helper_update_legacy_modeset_state(dev, &state->base);
> -		drm_atomic_helper_calc_timestamping_constants(&state->base);
>  =

>  		intel_set_cdclk_pre_plane_update(state);
>  =

> -- =

> 2.26.2
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
