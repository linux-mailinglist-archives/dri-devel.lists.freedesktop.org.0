Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C946942F55
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D0E10E612;
	Wed, 31 Jul 2024 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYWqBitX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616A110E210;
 Wed, 31 Jul 2024 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722430573; x=1753966573;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iMGPNoptOsDVAI9Q8YbdeiCyDp63bgqjel5/ATpJsPY=;
 b=RYWqBitXydnPgrI95JOE9/jzR6x4vaXSfsF5Gw9+vQ6Bbuuo7L0jHftH
 xkVRbbQgWzAInMnH3XxhFJCQGPtgfmNVkkCaKSVAKS9Rn/joUe3WIbzS6
 bgJV3VdxkBINSd8Ge3Y639CiFBPYBzgNvy6wfvqQADm7KfAtlT6N54/V7
 UE8Bor08JI7iJ/yKzcG4s9QbqOs+RfvgphoHI+nPHT7uv95TSWhFdTgdP
 X9Z/Z+v1G04EH/jlUx/ogcGJCdnSP4Mcrv/ShBYQfRFUWNosrpO1kOxWx
 iKVBI0qrymV2iEGNEwVancWcnXa5b8CnvwyYcKnFsVDWgdEI0nWjKipYb A==;
X-CSE-ConnectionGUID: 8fDhBA6KTO68zhjedWzZAA==
X-CSE-MsgGUID: E4y5BtJtSUK8576U67gmew==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30969717"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="30969717"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 05:56:13 -0700
X-CSE-ConnectionGUID: 7OvGN9EtRvyWrEtaq3s15A==
X-CSE-MsgGUID: wlesvcc4Tya2OO0u9JkGrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54562550"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 05:56:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH 2/9] drm/i915: Use backlight power constants
In-Reply-To: <20240731122311.1143153-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-3-tzimmermann@suse.de>
Date: Wed, 31 Jul 2024 15:56:05 +0300
Message-ID: <87y15hwwii.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 31 Jul 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Replace FB_BLANK_ constants with their counterparts from the
> backlight subsystem. The values are identical, so there's no
> change in functionality or semantics.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Do you want us to take this via drm-intel-next, or all together via
drm-misc? Either is fine.

> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 071668bfe5d1..6f678c039ed8 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -455,7 +455,7 @@ void intel_backlight_disable(const struct drm_connector_state *old_conn_state)
>  	mutex_lock(&i915->display.backlight.lock);
>  
>  	if (panel->backlight.device)
> -		panel->backlight.device->props.power = FB_BLANK_POWERDOWN;
> +		panel->backlight.device->props.power = BACKLIGHT_POWER_OFF;
>  	panel->backlight.enabled = false;
>  	panel->backlight.funcs->disable(old_conn_state, 0);
>  
> @@ -773,7 +773,7 @@ static void __intel_backlight_enable(const struct intel_crtc_state *crtc_state,
>  	panel->backlight.funcs->enable(crtc_state, conn_state, panel->backlight.level);
>  	panel->backlight.enabled = true;
>  	if (panel->backlight.device)
> -		panel->backlight.device->props.power = FB_BLANK_UNBLANK;
> +		panel->backlight.device->props.power = BACKLIGHT_POWER_ON;
>  }
>  
>  void intel_backlight_enable(const struct intel_crtc_state *crtc_state,
> @@ -870,12 +870,12 @@ static int intel_backlight_device_update_status(struct backlight_device *bd)
>  	 */
>  	if (panel->backlight.enabled) {
>  		if (panel->backlight.power) {
> -			bool enable = bd->props.power == FB_BLANK_UNBLANK &&
> +			bool enable = bd->props.power == BACKLIGHT_POWER_ON &&
>  				bd->props.brightness != 0;
>  			panel->backlight.power(connector, enable);
>  		}
>  	} else {
> -		bd->props.power = FB_BLANK_POWERDOWN;
> +		bd->props.power = BACKLIGHT_POWER_OFF;
>  	}
>  
>  	drm_modeset_unlock(&i915->drm.mode_config.connection_mutex);
> @@ -945,9 +945,9 @@ int intel_backlight_device_register(struct intel_connector *connector)
>  					    props.max_brightness);
>  
>  	if (panel->backlight.enabled)
> -		props.power = FB_BLANK_UNBLANK;
> +		props.power = BACKLIGHT_POWER_ON;
>  	else
> -		props.power = FB_BLANK_POWERDOWN;
> +		props.power = BACKLIGHT_POWER_OFF;
>  
>  	name = kstrdup_const("intel_backlight", GFP_KERNEL);
>  	if (!name)

-- 
Jani Nikula, Intel
