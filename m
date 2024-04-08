Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D1689BF76
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 14:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF5C112556;
	Mon,  8 Apr 2024 12:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itSKLIkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41227112556;
 Mon,  8 Apr 2024 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712580704; x=1744116704;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gbv+Wvg5dd7WPdDlDRXmFPd6E5AwOV3OIz+mA5OwJxg=;
 b=itSKLIkjCc0qNcRaNIH7Osyq0r1D5rQrYHOT+LaLuM7PpisAVf4AbFeF
 k/ZHk+hjO/c6IOWodRmg3kOvgnq34NZKTBRVYctaEq7yJEsYXhxaqzZmH
 M86v29leC3guqVcdqkissE8VhXJ/k6TgioJvGd9fNRTQX9ZvasOTF+uNh
 v6Ax4u7OCh2t4TMJgEXcmzXNKFNk0lYxEkAGWXn5FLxfUJWaUFAw/6A5c
 4Ldk0uSb0VrhBRO5hYNA6YUeQxEEev+BayIT0H3JHvziGrvlqTkFv7MwR
 AX2+gToGLpnbOUnIZmlgnSs9TmPKQzAX729vBxSDOhfGh0V3//YFYWbgT g==;
X-CSE-ConnectionGUID: NUMVAjvCRbG23moS4eqpqg==
X-CSE-MsgGUID: r6YViW62Sd2dUrHhV7aeGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="33252068"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="33252068"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="827792248"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="827792248"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 05:51:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 15:51:38 +0300
Date: Mon, 8 Apr 2024 15:51:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/7] drm: prefer DRM_MODE_FMT/ARG over
 drm_mode_debug_printmodeline()
Message-ID: <ZhPoWiXybrTxGte2@intel.com>
References: <cover.1712568037.git.jani.nikula@intel.com>
 <6df18588dfa17c5d0a1501f5af9ff21f25a1981b.1712568037.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6df18588dfa17c5d0a1501f5af9ff21f25a1981b.1712568037.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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

On Mon, Apr 08, 2024 at 12:24:02PM +0300, Jani Nikula wrote:
> We have DRM_MODE_FMT and DRM_MODE_ARG() macros to allow unified debug
> printing of modes in any printk-formatted logging. Prefer them over
> drm_mode_debug_printmodeline().
> 
> This allows drm device specific logging of modes, in the right drm debug
> category, and inline with the rest of the logging instead of split to
> multiple lines.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_atomic_uapi.c  |  6 +++---
>  drivers/gpu/drm/drm_crtc.c         |  6 +++---
>  drivers/gpu/drm/drm_crtc_helper.c  |  9 ++++-----
>  drivers/gpu/drm/drm_modes.c        | 13 +++++--------
>  drivers/gpu/drm/drm_probe_helper.c |  3 ++-
>  5 files changed, 17 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 29d4940188d4..fc16fddee5c5 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -145,10 +145,10 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
>  					     &state->mode, blob->data);
>  		if (ret) {
>  			drm_dbg_atomic(crtc->dev,
> -				       "[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
> +				       "[CRTC:%d:%s] invalid mode (%s, %pe): " DRM_MODE_FMT "\n",
>  				       crtc->base.id, crtc->name,
> -				       ret, drm_get_mode_status_name(state->mode.status));
> -			drm_mode_debug_printmodeline(&state->mode);
> +				       drm_get_mode_status_name(state->mode.status),
> +				       ERR_PTR(ret), DRM_MODE_ARG(&state->mode));
>  			return -EINVAL;
>  		}
>  
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index b0a0e27e83eb..483969b84a30 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -775,9 +775,9 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  
>  		ret = drm_mode_convert_umode(dev, mode, &crtc_req->mode);
>  		if (ret) {
> -			drm_dbg_kms(dev, "Invalid mode (ret=%d, status=%s)\n",
> -				    ret, drm_get_mode_status_name(mode->status));
> -			drm_mode_debug_printmodeline(mode);
> +			drm_dbg_kms(dev, "Invalid mode (%s, %pe): " DRM_MODE_FMT "\n",
> +				    drm_get_mode_status_name(mode->status),
> +				    ERR_PTR(ret), DRM_MODE_ARG(mode));
>  			goto out;
>  		}
>  
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index af7ac9d9192a..0955f1c385dd 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -657,8 +657,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  	if (!drm_mode_equal(set->mode, &set->crtc->mode)) {
>  		drm_dbg_kms(dev, "[CRTC:%d:%s] modes are different, full mode set:\n",
>  			    set->crtc->base.id, set->crtc->name);
> -		drm_mode_debug_printmodeline(&set->crtc->mode);
> -		drm_mode_debug_printmodeline(set->mode);
> +		drm_dbg_kms(dev, DRM_MODE_FMT "\n", DRM_MODE_ARG(&set->crtc->mode));
> +		drm_dbg_kms(dev, DRM_MODE_FMT "\n", DRM_MODE_ARG(set->mode));
>  		mode_changed = true;
>  	}
>  
> @@ -766,9 +766,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  
>  	if (mode_changed) {
>  		if (drm_helper_crtc_in_use(set->crtc)) {
> -			drm_dbg_kms(dev, "[CRTC:%d:%s] attempting to set mode from userspace\n",
> -				    set->crtc->base.id, set->crtc->name);
> -			drm_mode_debug_printmodeline(set->mode);
> +			drm_dbg_kms(dev, "[CRTC:%d:%s] attempting to set mode from userspace: " DRM_MODE_FMT "\n",
> +				    set->crtc->base.id, set->crtc->name, DRM_MODE_ARG(set->mode));
>  			set->crtc->primary->fb = set->fb;
>  			if (!drm_crtc_helper_set_mode(set->crtc, set->mode,
>  						      set->x, set->y,
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 408ee1b5e44d..2d8b0371619d 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1201,9 +1201,8 @@ int of_get_drm_display_mode(struct device_node *np,
>  	if (bus_flags)
>  		drm_bus_flags_from_videomode(&vm, bus_flags);
>  
> -	pr_debug("%pOF: got %dx%d display mode\n",
> -		np, vm.hactive, vm.vactive);
> -	drm_mode_debug_printmodeline(dmode);
> +	pr_debug("%pOF: got %dx%d display mode: " DRM_MODE_FMT "\n",
> +		 np, vm.hactive, vm.vactive, DRM_MODE_ARG(dmode));
>  
>  	return 0;
>  }
> @@ -1251,7 +1250,7 @@ int of_get_drm_panel_display_mode(struct device_node *np,
>  	dmode->width_mm = width_mm;
>  	dmode->height_mm = height_mm;
>  
> -	drm_mode_debug_printmodeline(dmode);
> +	pr_debug(DRM_MODE_FMT "\n", DRM_MODE_ARG(dmode));
>  
>  	return 0;
>  }
> @@ -1813,10 +1812,8 @@ void drm_mode_prune_invalid(struct drm_device *dev,
>  					 DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
>  			}
>  			if (verbose) {
> -				drm_mode_debug_printmodeline(mode);
> -				drm_dbg_kms(dev, "Not using %s mode: %s\n",
> -					    mode->name,
> -					    drm_get_mode_status_name(mode->status));
> +				drm_dbg_kms(dev, "Rejected mode: " DRM_MODE_FMT " (%s)\n",
> +					    DRM_MODE_ARG(mode), drm_get_mode_status_name(mode->status));
>  			}
>  			drm_mode_destroy(dev, mode);
>  		}
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 19bf5d298257..4f75a1cfd820 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -701,7 +701,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  
>  	list_for_each_entry(mode, &connector->modes, head) {
>  		drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
> -		drm_mode_debug_printmodeline(mode);
> +		drm_dbg_kms(dev, "Probed mode: " DRM_MODE_FMT "\n",
> +			    DRM_MODE_ARG(mode));
>  	}
>  
>  	return count;
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
