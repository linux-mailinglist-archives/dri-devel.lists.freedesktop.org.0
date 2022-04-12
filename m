Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC4C4FE2C8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 15:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6F610E9D1;
	Tue, 12 Apr 2022 13:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9F610E0B6;
 Tue, 12 Apr 2022 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649770601; x=1681306601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i7v2KzcqI+M64qiie/ompftP+FW5aBqGrwDEXRvs/rE=;
 b=EkviGnnGo9N2npfanbhDGLLpVJE+LmmH8/UQ9w0j6eE7EVoRFkMPJNVS
 1F3CF3qYxN04TYJlTJDx0X5MPfVCmU9TPF+Vn6HNDiMXKOX/XwklDa2Nm
 m5xm62NqLCVIdFuhHtYmpy5cpujkZxpn6IX6cITfGRU2/CnQAICof8S+J
 wutOlqFoj+Ri5RnTrJgXOX2lOK3+Jk8Ee7MNAvFMTypDjVldzklVNggDl
 KQnfLE1aVdoXfoQ7rmmm7iIVyynJeuh13Sn0TAyvYd7ZOxvIo3XtYckAk
 4OGCHOs27T0TeMbD0EoCKydSjlSmBKpGKjnVM1fbhrHyHlKHZPJVJY1Rn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244258075"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="244258075"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:36:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="572767127"
Received: from aguzmanb-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.33.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:36:37 -0700
Date: Tue, 12 Apr 2022 09:36:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Message-ID: <YlWAY1GdFRhov5fl@intel.com>
References: <20220411204741.1074308-1-sean@poorly.run>
 <20220411204741.1074308-7-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-7-sean@poorly.run>
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

On Mon, Apr 11, 2022 at 08:47:35PM +0000, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The shim functions return error codes, but they are discarded in
> intel_hdcp.c. This patch plumbs the return codes through so they are
> properly handled.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-7-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-7-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-7-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-7-sean@poorly.run #v4
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
>  .../drm/i915/display/intel_display_debugfs.c  |  9 +++-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 51 ++++++++++---------
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
>  3 files changed, 37 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 452d773fd4e3..f18b4bec4dd4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -489,6 +489,7 @@ static void intel_panel_info(struct seq_file *m,
>  static void intel_hdcp_info(struct seq_file *m,
>  			    struct intel_connector *intel_connector)
>  {
> +	int ret;
>  	bool hdcp_cap, hdcp2_cap;
>  
>  	if (!intel_connector->hdcp.shim) {
> @@ -496,8 +497,12 @@ static void intel_hdcp_info(struct seq_file *m,
>  		goto out;
>  	}
>  
> -	hdcp_cap = intel_hdcp_capable(intel_connector);
> -	hdcp2_cap = intel_hdcp2_capable(intel_connector);
> +	ret = intel_hdcp_capable(intel_connector, &hdcp_cap);
> +	if (ret)
> +		hdcp_cap = false;
> +	ret = intel_hdcp2_capable(intel_connector, &hdcp2_cap);
> +	if (ret)
> +		hdcp2_cap = false;
>  
>  	if (hdcp_cap)
>  		seq_puts(m, "HDCP1.4 ");
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 6bb5a3971ed9..771e94fa8dff 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -154,50 +154,49 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
>  }
>  
>  /* Is HDCP1.4 capable on Platform and Sink */
> -bool intel_hdcp_capable(struct intel_connector *connector)
> +int intel_hdcp_capable(struct intel_connector *connector, bool *capable)
>  {
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
>  	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
> -	bool capable = false;
>  	u8 bksv[5];
>  
> +	*capable = false;
> +
>  	if (!shim)
> -		return capable;
> +		return 0;
>  
> -	if (shim->hdcp_capable) {
> -		shim->hdcp_capable(dig_port, &capable);
> -	} else {
> -		if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
> -			capable = true;
> -	}
> +	if (shim->hdcp_capable)
> +		return shim->hdcp_capable(dig_port, capable);
> +
> +	if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
> +		*capable = true;
>  
> -	return capable;
> +	return 0;
>  }
>  
>  /* Is HDCP2.2 capable on Platform and Sink */
> -bool intel_hdcp2_capable(struct intel_connector *connector)
> +int intel_hdcp2_capable(struct intel_connector *connector, bool *capable)
>  {
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
> -	bool capable = false;
> +
> +	*capable = false;
>  
>  	/* I915 support for HDCP2.2 */
>  	if (!hdcp->hdcp2_supported)
> -		return false;
> +		return 0;
>  
>  	/* MEI interface is solid */
>  	mutex_lock(&dev_priv->hdcp_comp_mutex);
>  	if (!dev_priv->hdcp_comp_added ||  !dev_priv->hdcp_master) {
>  		mutex_unlock(&dev_priv->hdcp_comp_mutex);
> -		return false;
> +		return 0;
>  	}
>  	mutex_unlock(&dev_priv->hdcp_comp_mutex);
>  
>  	/* Sink's capability for HDCP2.2 */
> -	hdcp->shim->hdcp_2_2_capable(dig_port, &capable);
> -
> -	return capable;
> +	return hdcp->shim->hdcp_2_2_capable(dig_port, capable);
>  }
>  
>  static bool intel_hdcp_in_use(struct drm_i915_private *dev_priv,
> @@ -2332,6 +2331,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
>  	struct intel_hdcp *hdcp = &connector->hdcp;
>  	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
> +	bool capable;
>  	int ret = -EINVAL;
>  
>  	if (!hdcp->shim)
> @@ -2350,21 +2350,27 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
>  	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
>  	 */
> -	if (intel_hdcp2_capable(connector)) {
> +	ret = intel_hdcp2_capable(connector, &capable);
> +	if (capable) {
>  		ret = _intel_hdcp2_enable(connector);
> -		if (!ret)
> +		if (!ret) {
>  			check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
> +			goto out;
> +		}
>  	}
>  
>  	/*
>  	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
>  	 * be attempted.
>  	 */
> -	if (ret && intel_hdcp_capable(connector) &&
> -	    hdcp->content_type != DRM_MODE_HDCP_CONTENT_TYPE1) {
> +	ret = intel_hdcp_capable(connector, &capable);
> +	if (ret)
> +		goto out;
> +
> +	if (capable && hdcp->content_type != DRM_MODE_HDCP_CONTENT_TYPE1)
>  		ret = _intel_hdcp_enable(connector);
> -	}
>  
> +out:
>  	if (!ret) {
>  		schedule_delayed_work(&hdcp->check_work, check_link_interval);
>  		intel_hdcp_update_value(connector,
> @@ -2372,7 +2378,6 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  					true);
>  	}
>  
> -out:
>  	mutex_unlock(&dig_port->hdcp_mutex);
>  	mutex_unlock(&hdcp->mutex);
>  	return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index 7c5fd84a7b65..f06f6e5a2b1a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -33,8 +33,8 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
>  			    const struct intel_crtc_state *crtc_state,
>  			    const struct drm_connector_state *conn_state);
>  bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port);
> -bool intel_hdcp_capable(struct intel_connector *connector);
> -bool intel_hdcp2_capable(struct intel_connector *connector);
> +int intel_hdcp_capable(struct intel_connector *connector, bool *capable);
> +int intel_hdcp2_capable(struct intel_connector *connector, bool *capable);
>  void intel_hdcp_component_init(struct drm_i915_private *dev_priv);
>  void intel_hdcp_component_fini(struct drm_i915_private *dev_priv);
>  void intel_hdcp_cleanup(struct intel_connector *connector);
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
