Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDAA4FE2CB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33EE10E9FA;
	Tue, 12 Apr 2022 13:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A73110E9E5;
 Tue, 12 Apr 2022 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649770654; x=1681306654;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eYZP8EAH3yxYqQK2HoFD/mY5f7lfnZjmLdyCys3b5U0=;
 b=J6u3i/nQ85t7F6Gy1AtqJGeh3JIvO2KVrciXMZQrPVNxxb0hcaaqAkAx
 I7rIM/2wyPOaKNhkoNWr0PEJTDNrDgf9w2cKY11F1maRSuUXz6bV64vYy
 B2eCkmPZ0t85dXouJN354B3PYZCUtjeyV+DtcuQpoGQWYTR2BgItmNtTk
 5v32COoVzsY6Nt6TbQzyVjIxP9t/EEkdKSXjA/NMrErDkCu0qG6HTW+Ce
 Sxps8CGnvHghqO3orsYmDq2evYxOdHG+jvf8EM5a6TLHRWdCrchZj6uYT
 UrYhA1OEANuZZT5xKsP9X+TYdxwAybvUH4EU5k6ZKqADkpq+/+56J2A6v g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261224145"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="261224145"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:37:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="802235312"
Received: from aguzmanb-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.33.149])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:37:31 -0700
Date: Tue, 12 Apr 2022 09:37:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 05/10] drm/i915/hdcp: Consolidate HDCP setup/state cache
Message-ID: <YlWAmrFbKXJ+1v+t@intel.com>
References: <20220411204741.1074308-1-sean@poorly.run>
 <20220411204741.1074308-6-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-6-sean@poorly.run>
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
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 08:47:34PM +0000, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Stick all of the setup for HDCP into a dedicated function. No functional
> change, but this will facilitate moving HDCP logic into helpers.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-6-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-6-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-6-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-6-sean@poorly.run #v4
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
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 52 +++++++++++++++--------
>  1 file changed, 35 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 861c550b5bd6..6bb5a3971ed9 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2167,6 +2167,37 @@ static enum mei_fw_tc intel_get_mei_fw_tc(enum transcoder cpu_transcoder)
>  	}
>  }
>  
> +static int
> +_intel_hdcp_setup(struct intel_connector *connector,
> +		  const struct intel_crtc_state *pipe_config, u8 content_type)
> +{
> +	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> +	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> +	struct intel_hdcp *hdcp = &connector->hdcp;
> +	int ret = 0;
> +
> +	if (!connector->encoder) {
> +		drm_err(&dev_priv->drm, "[%s:%d] encoder is not initialized\n",
> +			connector->base.name, connector->base.base.id);
> +		return -ENODEV;
> +	}
> +
> +	hdcp->content_type = content_type;
> +
> +	if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
> +		hdcp->cpu_transcoder = pipe_config->mst_master_transcoder;
> +		hdcp->stream_transcoder = pipe_config->cpu_transcoder;
> +	} else {
> +		hdcp->cpu_transcoder = pipe_config->cpu_transcoder;
> +		hdcp->stream_transcoder = INVALID_TRANSCODER;
> +	}
> +
> +	if (DISPLAY_VER(dev_priv) >= 12)
> +		dig_port->hdcp_port_data.fw_tc = intel_get_mei_fw_tc(hdcp->cpu_transcoder);
> +
> +	return ret;
> +}
> +
>  static int initialize_hdcp_port_data(struct intel_connector *connector,
>  				     struct intel_digital_port *dig_port,
>  				     const struct intel_hdcp_shim *shim)
> @@ -2306,28 +2337,14 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  	if (!hdcp->shim)
>  		return -ENOENT;
>  
> -	if (!connector->encoder) {
> -		drm_err(&dev_priv->drm, "[%s:%d] encoder is not initialized\n",
> -			connector->base.name, connector->base.base.id);
> -		return -ENODEV;
> -	}
> -
>  	mutex_lock(&hdcp->mutex);
>  	mutex_lock(&dig_port->hdcp_mutex);
>  	drm_WARN_ON(&dev_priv->drm,
>  		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
> -	hdcp->content_type = content_type;
> -
> -	if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
> -		hdcp->cpu_transcoder = pipe_config->mst_master_transcoder;
> -		hdcp->stream_transcoder = pipe_config->cpu_transcoder;
> -	} else {
> -		hdcp->cpu_transcoder = pipe_config->cpu_transcoder;
> -		hdcp->stream_transcoder = INVALID_TRANSCODER;
> -	}
>  
> -	if (DISPLAY_VER(dev_priv) >= 12)
> -		dig_port->hdcp_port_data.fw_tc = intel_get_mei_fw_tc(hdcp->cpu_transcoder);
> +	ret = _intel_hdcp_setup(connector, pipe_config, content_type);
> +	if (ret)
> +		goto out;
>  
>  	/*
>  	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
> @@ -2355,6 +2372,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  					true);
>  	}
>  
> +out:
>  	mutex_unlock(&dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
