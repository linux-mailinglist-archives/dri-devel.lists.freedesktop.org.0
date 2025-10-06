Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77BABBD6D0
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 11:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2CC10E0B1;
	Mon,  6 Oct 2025 09:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5CR3osd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097D510E0B1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759742617; x=1791278617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ad1tQ2sZuoFqrlKSVVB0GeaSwtVymVdVil1x0KCGTM8=;
 b=I5CR3osdAXrISGqqROHi/n37RyChbP1NGWlD+kGZIe8l/t+ykpz07bbk
 T2m/ZjK1I9M1teeedD0IOiAb6igUqShwnHNsdBTFBaHqRKYbASceh/8UC
 PhcehMshC/qxv8nj0+Aw4y6ZhiFek5FL3cB839vr1BUSBzEmL/I6eZ8mn
 wZNEXIhISYm8I4kw0D4qEryLkZKCWm0UjRREHheBp4jUaGY0rj92EoAhw
 F5LMfZCqwf9xQpBNo1tTiT1QpypwHIknNl01iZZp3ao9AZ5nTW+P8gFdl
 cQO4aCQ6/UydlE+A16sczXBqAyFv7YGTE+aaomh7tJVojRrCpnj3LInfu g==;
X-CSE-ConnectionGUID: /kAVE2DsTmGD4aATD5r1yA==
X-CSE-MsgGUID: N0H/W8RYSm6IKIE7DZZd8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="64531886"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="64531886"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:23:36 -0700
X-CSE-ConnectionGUID: dROji30iSOiS99xZ77D54w==
X-CSE-MsgGUID: rjVlTinRRmWMFsyLCBsOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180635272"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.80])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:23:33 -0700
Date: Mon, 6 Oct 2025 12:23:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, derek.foreman@collabora.com,
 daniel.stone@collabora.com
Subject: Re: [PATCH v2] drm/connector: hdmi: Add a 'link bpc' property
Message-ID: <aOOKk6j_rHB18hR1@intel.com>
References: <20251006083043.3115-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006083043.3115-1-marius.vlad@collabora.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Oct 06, 2025 at 11:30:43AM +0300, Marius Vlad wrote:
> From: Derek Foreman <derek.foreman@collabora.com>
> 
> Add a way to know the actual bpc of a running link.
> 
> Drivers might change the current bpc link value due to changes in mode
> line or refresh rates. For example when enabling VRR the underlying
> hardware might not be able sustain the same bandwidth for a particular
> mode line, and it might attempt to lower the bpc.

Not sure what this VRR stuff is trying to say. Enabling VRR doesn't
itself change anything about the link bandwidth.

> Another example can be
> found when switching the color output format, part of YUV420 fallback.
> 
> This means we might be displaying a stale bpc value although it was
> modified for different reasons -- like a refresh rate or an output
> color format.
> 
> Introduces a new property 'link bpc' that user-space can use to get the
> current bpc value of a running link while in the same time allow
> user-space to set-up bpc using 'max bpc' property.
> 
> An implementation for Weston [1] and a simple test for i-g-t [2] have been added.
> 
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> 
> [1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1850
> [2] https://lists.freedesktop.org/archives/igt-dev/2025-October/097061.html
> 
> ---
> 
> v1: 
> - https://lore.kernel.org/dri-devel/20250801101750.1726-1-marius.vlad@collabora.com/T/#u
> 
> v2: 
> - replace return with EBUSY if connector already exists (Dmitry)
> - add i-g-t test and an implementation for Weston (Dmitry)
> - re-wording patch description (Jani)
>     
> 
>  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
>  drivers/gpu/drm/drm_connector.c   | 25 +++++++++++++++++++++++++
>  include/drm/drm_connector.h       |  8 ++++++++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 85dbdaa4a2e2..15c5ad7ddfb5 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -776,6 +776,9 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  						   fence_ptr);
>  	} else if (property == connector->max_bpc_property) {
>  		state->max_requested_bpc = val;
> +	} else if (property == connector->link_bpc_property) {
> +		drm_dbg_kms(dev, "only drivers can set link bpc property. Use max bpc instead\n");
> +		return -EINVAL;

Is there a particular reason this isn't just an immutable prop?

>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		state->privacy_screen_sw_state = val;
>  	} else if (property == connector->broadcast_rgb_property) {
> @@ -861,6 +864,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = 0;
>  	} else if (property == connector->max_bpc_property) {
>  		*val = state->max_requested_bpc;
> +	} else if (property == connector->link_bpc_property) {
> +		*val = state->hdmi.output_bpc;

Assuming hdmi here doesn't seem good. What about all the other
connector types?

>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		*val = state->privacy_screen_sw_state;
>  	} else if (property == connector->broadcast_rgb_property) {
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea47..7cc99cd16e20 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -542,6 +542,27 @@ int drmm_connector_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drmm_connector_init);
>  
> +static int
> +drm_connector_attach_link_bpc_property(struct drm_connector *connector,
> +				       int max)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	if (connector->link_bpc_property)
> +		return -EBUSY;
> +
> +	prop = drm_property_create_range(dev, 0, "link bpc", 8, max);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	connector->link_bpc_property = prop;
> +
> +	drm_object_attach_property(&connector->base, prop, max);
> +
> +	return 0;
> +}
> +
>  /**
>   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
>   * @dev: DRM device
> @@ -618,6 +639,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
>  	connector->max_bpc = max_bpc;
>  
> +	ret = drm_connector_attach_link_bpc_property(connector, max_bpc);
> +	if (ret)
> +		return ret;
> +
>  	if (max_bpc > 8)
>  		drm_connector_attach_hdr_output_metadata_property(connector);
>  
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..4a50198aa7c0 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2079,6 +2079,14 @@ struct drm_connector {
>  	 */
>  	struct drm_property *max_bpc_property;
>  
> +	/**
> +	 * @link_bpc_property: Current connector link bpc set by the driver
> +	 *
> +	 * This property can be used to retrieve the current link bpc from
> +	 * connector_state::hdmi:output_bpc
> +	 */
> +	struct drm_property *link_bpc_property;
> +
>  	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
>  	struct drm_privacy_screen *privacy_screen;
>  
> -- 
> 2.47.2

-- 
Ville Syrjälä
Intel
