Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D834FE21D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CE610E959;
	Tue, 12 Apr 2022 13:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E50E10E88D;
 Tue, 12 Apr 2022 13:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649769325; x=1681305325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kVE+v0zM0X7mHD1WQ88/DzMrbOAe9GNlmFWRLq+bWkw=;
 b=FLcwfEmXUelSZY/YUzXslTzuu7MPE5eJljL/HdtwJxw7VumGYdW6uXRN
 1XFq8r1CoyaKj4FwVXPYT06UYSjlWCLhBBVseObS6jswTDpegvF6WM01X
 3gOBmA3DQxhuFixmVxErZmc1CaGtOqumGjNdVN+FkSw/HsTOELnbKctuP
 CbwBeArGS2BdUNHckN0uwpFZl1COgoNsy7nz6s6YQJZ8R9Sb4HDWLQsVb
 acIwR/HKDXPZ9G55shfH+E95C8wBuI4dbnEJSFFu9XJrEaUN4PFd9Uvce
 122ap9DHAeJNHvFh+VyzRONUqrq6/qftWuhMr27/kPKHnDPOSPEmzmD+x A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261219263"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="261219263"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:15:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="572760605"
Received: from aguzmanb-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.33.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:15:20 -0700
Date: Tue, 12 Apr 2022 09:15:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
Message-ID: <YlV7ZhnsOPKoOpes@intel.com>
References: <20220411204741.1074308-1-sean@poorly.run>
 <20220411204741.1074308-2-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-2-sean@poorly.run>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 markyacoub@chromium.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, Thomas Zimmermann <tzimmermann@suse.de>,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 08:47:30PM +0000, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch moves the hdcp atomic check from i915 to drm_hdcp so other
> drivers can use it. No functional changes, just cleaned up some of the
> code when moving it over.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-2-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-2-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-2-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-2-sean@poorly.run #v4
> 
> Changes in v2:
> -None
> Changes in v3:
> -None
> Changes in v4:
> -None
> Changes in v5:
> -None
> ---
>  drivers/gpu/drm/drm_hdcp.c                  | 71 ++++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_atomic.c |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c   | 47 --------------
>  drivers/gpu/drm/i915/display/intel_hdcp.h   |  3 -
>  include/drm/drm_hdcp.h                      |  3 +
>  5 files changed, 75 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index ca9b8f697202..522326b03e66 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -13,13 +13,14 @@
>  #include <linux/slab.h>
>  #include <linux/firmware.h>
>  
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_hdcp.h>
>  #include <drm/drm_sysfs.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_property.h>
>  #include <drm/drm_mode_object.h>
> -#include <drm/drm_connector.h>
>  
>  #include "drm_internal.h"
>  
> @@ -421,3 +422,71 @@ void drm_hdcp_update_content_protection(struct drm_connector *connector,
>  				 dev->mode_config.content_protection_property);
>  }
>  EXPORT_SYMBOL(drm_hdcp_update_content_protection);
> +
> +/**
> + * drm_hdcp_atomic_check - Helper for drivers to call during connector->atomic_check
> + *
> + * @state: pointer to the atomic state being checked
> + * @connector: drm_connector on which content protection state needs an update
> + *
> + * This function can be used by display drivers to perform an atomic check on the
> + * hdcp state elements. If hdcp state has changed, this function will set
> + * mode_changed on the crtc driving the connector so it can update its hardware
> + * to match the hdcp state.
> + */
> +void drm_hdcp_atomic_check(struct drm_connector *connector,
> +			   struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *new_conn_state, *old_conn_state;
> +	struct drm_crtc_state *new_crtc_state;
> +	u64 old_hdcp, new_hdcp;
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, connector);
> +	old_hdcp = old_conn_state->content_protection;
> +
> +	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	new_hdcp = new_conn_state->content_protection;
> +
> +	if (!new_conn_state->crtc) {
> +		/*
> +		 * If the connector is being disabled with CP enabled, mark it
> +		 * desired so it's re-enabled when the connector is brought back
> +		 */
> +		if (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
> +			new_conn_state->content_protection =
> +				DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		return;
> +	}
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(state,
> +						       new_conn_state->crtc);
> +	/*
> +	* Fix the HDCP uapi content protection state in case of modeset.
> +	* FIXME: As per HDCP content protection property uapi doc, an uevent()
> +	* need to be sent if there is transition from ENABLED->DESIRED.
> +	*/
> +	if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
> +	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> +	     new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> +		new_conn_state->content_protection =
> +			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +
> +	/*
> +	 * Nothing to do if content type is unchanged and one of:
> +	 *  - state didn't change
> +	 *  - HDCP was activated since the last commit
> +	 *  - attempting to set to desired while already enabled
> +	 */
> +	if (old_hdcp == new_hdcp ||
> +	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> +	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
> +	    (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> +	     new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
> +		if (old_conn_state->hdcp_content_type ==
> +				new_conn_state->hdcp_content_type)
> +			return;
> +	}
> +
> +	new_crtc_state->mode_changed = true;
> +}
> +EXPORT_SYMBOL(drm_hdcp_atomic_check);
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 40da7910f845..b301a4d1017e 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -32,6 +32,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_hdcp.h>
>  #include <drm/drm_plane_helper.h>
>  
>  #include "i915_drv.h"
> @@ -40,7 +41,6 @@
>  #include "intel_cdclk.h"
>  #include "intel_display_types.h"
>  #include "intel_global_state.h"
> -#include "intel_hdcp.h"
>  #include "intel_psr.h"
>  #include "skl_universal_plane.h"
>  
> @@ -124,7 +124,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>  		to_intel_digital_connector_state(old_state);
>  	struct drm_crtc_state *crtc_state;
>  
> -	intel_hdcp_atomic_check(conn, old_state, new_state);
> +	drm_hdcp_atomic_check(conn, state);
>  
>  	if (!new_state->crtc)
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 4de4c174a987..861c550b5bd6 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2501,53 +2501,6 @@ void intel_hdcp_cleanup(struct intel_connector *connector)
>  	mutex_unlock(&hdcp->mutex);
>  }
>  
> -void intel_hdcp_atomic_check(struct drm_connector *connector,
> -			     struct drm_connector_state *old_state,
> -			     struct drm_connector_state *new_state)
> -{
> -	u64 old_cp = old_state->content_protection;
> -	u64 new_cp = new_state->content_protection;
> -	struct drm_crtc_state *crtc_state;
> -
> -	if (!new_state->crtc) {
> -		/*
> -		 * If the connector is being disabled with CP enabled, mark it
> -		 * desired so it's re-enabled when the connector is brought back
> -		 */
> -		if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
> -			new_state->content_protection =
> -				DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		return;
> -	}
> -
> -	crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
> -						   new_state->crtc);
> -	/*
> -	 * Fix the HDCP uapi content protection state in case of modeset.
> -	 * FIXME: As per HDCP content protection property uapi doc, an uevent()
> -	 * need to be sent if there is transition from ENABLED->DESIRED.
> -	 */
> -	if (drm_atomic_crtc_needs_modeset(crtc_state) &&
> -	    (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> -	    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> -		new_state->content_protection =
> -			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -
> -	/*
> -	 * Nothing to do if the state didn't change, or HDCP was activated since
> -	 * the last commit. And also no change in hdcp content type.
> -	 */
> -	if (old_cp == new_cp ||
> -	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> -	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
> -		if (old_state->hdcp_content_type ==
> -				new_state->hdcp_content_type)
> -			return;
> -	}
> -
> -	crtc_state->mode_changed = true;
> -}
> -
>  /* Handles the CP_IRQ raised from the DP HDCP sink */
>  void intel_hdcp_handle_cp_irq(struct intel_connector *connector)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index 8f53b0c7fe5c..7c5fd84a7b65 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -22,9 +22,6 @@ struct intel_digital_port;
>  enum port;
>  enum transcoder;
>  
> -void intel_hdcp_atomic_check(struct drm_connector *connector,
> -			     struct drm_connector_state *old_state,
> -			     struct drm_connector_state *new_state);
>  int intel_hdcp_init(struct intel_connector *connector,
>  		    struct intel_digital_port *dig_port,
>  		    const struct intel_hdcp_shim *hdcp_shim);
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index 0b1111e3228e..d49977a042e1 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -291,6 +291,7 @@ struct hdcp_srm_header {
>  	u8 srm_gen_no;
>  } __packed;
>  
> +struct drm_atomic_state;
>  struct drm_device;
>  struct drm_connector;
>  
> @@ -300,6 +301,8 @@ int drm_connector_attach_content_protection_property(
>  		struct drm_connector *connector, bool hdcp_content_type);
>  void drm_hdcp_update_content_protection(struct drm_connector *connector,
>  					u64 val);
> +void drm_hdcp_atomic_check(struct drm_connector *connector,
> +			   struct drm_atomic_state *state);
>  
>  /* Content Type classification for HDCP2.2 vs others */
>  #define DRM_MODE_HDCP_CONTENT_TYPE0		0
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
