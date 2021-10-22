Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39B0437FCC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 23:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5996E02C;
	Fri, 22 Oct 2021 21:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16206E570
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 21:08:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634936888; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wBBfWKJ+79OAY7xnmUi+R01jeCDha2zVMDTLyYAU7JM=;
 b=m6KLtSxtB2jTjd+Y68vYWtJWyGXAxfxajTqTvD/xsKfz8QX2T5xdyE0X8uDWgO3qXHOtOJnG
 zRHAS4QiL8VQlvjTxHo87I2DtFe2hoDN/aav3BhgkccKi1WGBpjk2SaXKgwVlgzQ5n1JDlms
 ChqtnAcEi9e1lazpVi9K3LtScws=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61732836fd91319f0fae4d28 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Oct 2021 21:08:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 25D8BC43616; Fri, 22 Oct 2021 21:08:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DAD3CC43460;
 Fri, 22 Oct 2021 21:08:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 22 Oct 2021 14:08:02 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, swboyd@chromium.org,
 jani.nikula@linux.intel.com, Sean Paul <seanpaul@chromium.org>, Jani Nikula
 <jani.nikula@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Freedreno] [PATCH v3 01/14] drm/hdcp: Add drm_hdcp_atomic_check()
In-Reply-To: <20211001151145.55916-2-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-2-sean@poorly.run>
Message-ID: <b88002c7047c9e5931e3caa4264bf4fa@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-10-01 08:11, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch moves the hdcp atomic check from i915 to drm_hdcp so other
> drivers can use it. No functional changes, just cleaned up some of the
> code when moving it over.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
For the drm/hdcp pieces:
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-2-sean@poorly.run
> #v1
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-2-sean@poorly.run
> #v2
> 
> Changes in v2:
> -None
> Changes in v3:
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
> @@ -421,3 +422,71 @@ void drm_hdcp_update_content_protection(struct
> drm_connector *connector,
>  				 dev->mode_config.content_protection_property);
>  }
>  EXPORT_SYMBOL(drm_hdcp_update_content_protection);
> +
> +/**
> + * drm_hdcp_atomic_check - Helper for drivers to call during
> connector->atomic_check
> + *
> + * @state: pointer to the atomic state being checked
> + * @connector: drm_connector on which content protection state needs 
> an update
> + *
> + * This function can be used by display drivers to perform an atomic
> check on the
> + * hdcp state elements. If hdcp state has changed, this function will 
> set
> + * mode_changed on the crtc driving the connector so it can update its 
> hardware
> + * to match the hdcp state.
> + */
> +void drm_hdcp_atomic_check(struct drm_connector *connector,
> +			   struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *new_conn_state, *old_conn_state;
> +	struct drm_crtc_state *new_crtc_state;
> +	u64 old_hdcp, new_hdcp;
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, 
> connector);
> +	old_hdcp = old_conn_state->content_protection;
> +
> +	new_conn_state = drm_atomic_get_new_connector_state(state, 
> connector);
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
> +	* FIXME: As per HDCP content protection property uapi doc, an 
> uevent()
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
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
> b/drivers/gpu/drm/i915/display/intel_atomic.c
> index b4e7ac51aa31..1e306e8427ec 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -32,13 +32,13 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_hdcp.h>
>  #include <drm/drm_plane_helper.h>
> 
>  #include "intel_atomic.h"
>  #include "intel_cdclk.h"
>  #include "intel_display_types.h"
>  #include "intel_global_state.h"
> -#include "intel_hdcp.h"
>  #include "intel_psr.h"
>  #include "skl_universal_plane.h"
> 
> @@ -122,7 +122,7 @@ int intel_digital_connector_atomic_check(struct
> drm_connector *conn,
>  		to_intel_digital_connector_state(old_state);
>  	struct drm_crtc_state *crtc_state;
> 
> -	intel_hdcp_atomic_check(conn, old_state, new_state);
> +	drm_hdcp_atomic_check(conn, state);
> 
>  	if (!new_state->crtc)
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 9b9fd9d13043..feebafead046 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2501,53 +2501,6 @@ void intel_hdcp_cleanup(struct intel_connector
> *connector)
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
> -	 * FIXME: As per HDCP content protection property uapi doc, an 
> uevent()
> -	 * need to be sent if there is transition from ENABLED->DESIRED.
> -	 */
> -	if (drm_atomic_crtc_needs_modeset(crtc_state) &&
> -	    (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
> -	    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
> -		new_state->content_protection =
> -			DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -
> -	/*
> -	 * Nothing to do if the state didn't change, or HDCP was activated 
> since
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
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h
> b/drivers/gpu/drm/i915/display/intel_hdcp.h
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
> @@ -300,6 +301,8 @@ int 
> drm_connector_attach_content_protection_property(
>  		struct drm_connector *connector, bool hdcp_content_type);
>  void drm_hdcp_update_content_protection(struct drm_connector 
> *connector,
>  					u64 val);
> +void drm_hdcp_atomic_check(struct drm_connector *connector,
> +			   struct drm_atomic_state *state);
> 
>  /* Content Type classification for HDCP2.2 vs others */
>  #define DRM_MODE_HDCP_CONTENT_TYPE0		0
