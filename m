Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EA086729B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF2D10F085;
	Mon, 26 Feb 2024 11:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcMnuWLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD0710F085
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708945684; x=1740481684;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NHneLC3m3/NRxM+Zd/dtOiXoXY9OrqHvyXrojTyCdBs=;
 b=RcMnuWLFa1DE/q75oZ4HViTjjeX3mb4vmyfWF+EmCTAjth4qmcGir7nj
 J8ccdzn3xIkgbkpGeqtQBS2JGDoioS1tQmfCDT8fN9nUenYRR50twgVWI
 g/YNOEij0Fc8qXebmLhKKB6IEjis03BKIVYNDTrw53OQG15TZ/dsPVC7m
 JMTFJwNeQznfcbmORW049HXoMmXL3KWmoA4iJQROyuP/kKQffNrTMmxCY
 uhj3Bl8BFhSL3WyScwbzMa8Q6/Y+HOqnCsmKgKnb8EPLs10b6zzjhDYb2
 ClYh81Odg1Q4tDyOG7NCPTEs2myTA3JlOIB1UfWvan3A192cKIzq97tcH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3093710"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3093710"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:08:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6625927"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:07:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas <ndevos-dev@pm.me>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Nicolas <ndevos-dev@pm.me>
Subject: Re: [PATCH] gpu/drm: Fix several checkpatch warnings
In-Reply-To: <20240222204450.7943-1-ndevos-dev@pm.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240222204450.7943-1-ndevos-dev@pm.me>
Date: Mon, 26 Feb 2024 13:07:58 +0200
Message-ID: <87msrno54h.fsf@intel.com>
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

On Thu, 22 Feb 2024, Nicolas <ndevos-dev@pm.me> wrote:
> This commit includes several checkpatch for drm_connector.c:
> - SPDX license
> - Spaces before tabs
> - Unnecessary brackets
> - unsigned int is preferred over unsigned

One change per patch, please.

Signed-off-by missing.

> ---
>  drivers/gpu/drm/drm_connector.c | 142 ++++++++++++++++----------------
>  1 file changed, 71 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b0516505f7ae..4e6c910e339b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
>  /*
>   * Copyright (c) 2016 Intel Corporation
>   *
> @@ -313,9 +314,8 @@ static int __drm_connector_init(struct drm_device *dev,
>  				   config->tile_property,
>  				   0);
>  
> -	if (drm_core_check_feature(dev, DRIVER_ATOMIC)) {
> +	if (drm_core_check_feature(dev, DRIVER_ATOMIC))
>  		drm_object_attach_property(&connector->base, config->prop_crtc_id, 0);
> -	}
>  
>  	connector->debugfs_entry = NULL;
>  out_put_type_id:
> @@ -1150,70 +1150,70 @@ static const u32 dp_colorspaces =
>   * DRM connectors have a few standardized properties:
>   *

In the comments below, please switch to spaces instead of tabs.

BR,
Jani.

>   * EDID:
> - * 	Blob property which contains the current EDID read from the sink. This
> - * 	is useful to parse sink identification information like vendor, model
> - * 	and serial. Drivers should update this property by calling
> - * 	drm_connector_update_edid_property(), usually after having parsed
> - * 	the EDID using drm_add_edid_modes(). Userspace cannot change this
> - * 	property.
> - *
> - * 	User-space should not parse the EDID to obtain information exposed via
> - * 	other KMS properties (because the kernel might apply limits, quirks or
> - * 	fixups to the EDID). For instance, user-space should not try to parse
> - * 	mode lists from the EDID.
> + *	Blob property which contains the current EDID read from the sink. This
> + *	is useful to parse sink identification information like vendor, model
> + *	and serial. Drivers should update this property by calling
> + *	drm_connector_update_edid_property(), usually after having parsed
> + *	the EDID using drm_add_edid_modes(). Userspace cannot change this
> + *	property.
> + *
> + *	User-space should not parse the EDID to obtain information exposed via
> + *	other KMS properties (because the kernel might apply limits, quirks or
> + *	fixups to the EDID). For instance, user-space should not try to parse
> + *	mode lists from the EDID.
>   * DPMS:
> - * 	Legacy property for setting the power state of the connector. For atomic
> - * 	drivers this is only provided for backwards compatibility with existing
> - * 	drivers, it remaps to controlling the "ACTIVE" property on the CRTC the
> - * 	connector is linked to. Drivers should never set this property directly,
> - * 	it is handled by the DRM core by calling the &drm_connector_funcs.dpms
> - * 	callback. For atomic drivers the remapping to the "ACTIVE" property is
> - * 	implemented in the DRM core.
> - *
> - * 	Note that this property cannot be set through the MODE_ATOMIC ioctl,
> - * 	userspace must use "ACTIVE" on the CRTC instead.
> - *
> - * 	WARNING:
> - *
> - * 	For userspace also running on legacy drivers the "DPMS" semantics are a
> - * 	lot more complicated. First, userspace cannot rely on the "DPMS" value
> - * 	returned by the GETCONNECTOR actually reflecting reality, because many
> - * 	drivers fail to update it. For atomic drivers this is taken care of in
> - * 	drm_atomic_helper_update_legacy_modeset_state().
> - *
> - * 	The second issue is that the DPMS state is only well-defined when the
> - * 	connector is connected to a CRTC. In atomic the DRM core enforces that
> - * 	"ACTIVE" is off in such a case, no such checks exists for "DPMS".
> - *
> - * 	Finally, when enabling an output using the legacy SETCONFIG ioctl then
> - * 	"DPMS" is forced to ON. But see above, that might not be reflected in
> - * 	the software value on legacy drivers.
> - *
> - * 	Summarizing: Only set "DPMS" when the connector is known to be enabled,
> - * 	assume that a successful SETCONFIG call also sets "DPMS" to on, and
> - * 	never read back the value of "DPMS" because it can be incorrect.
> + *	Legacy property for setting the power state of the connector. For atomic
> + *	drivers this is only provided for backwards compatibility with existing
> + *	drivers, it remaps to controlling the "ACTIVE" property on the CRTC the
> + *	connector is linked to. Drivers should never set this property directly,
> + *	it is handled by the DRM core by calling the &drm_connector_funcs.dpms
> + *	callback. For atomic drivers the remapping to the "ACTIVE" property is
> + *	implemented in the DRM core.
> + *
> + *	Note that this property cannot be set through the MODE_ATOMIC ioctl,
> + *	userspace must use "ACTIVE" on the CRTC instead.
> + *
> + *	WARNING:
> + *
> + *	For userspace also running on legacy drivers the "DPMS" semantics are a
> + *	lot more complicated. First, userspace cannot rely on the "DPMS" value
> + *	returned by the GETCONNECTOR actually reflecting reality, because many
> + *	drivers fail to update it. For atomic drivers this is taken care of in
> + *	drm_atomic_helper_update_legacy_modeset_state().
> + *
> + *	The second issue is that the DPMS state is only well-defined when the
> + *	connector is connected to a CRTC. In atomic the DRM core enforces that
> + *	"ACTIVE" is off in such a case, no such checks exists for "DPMS".
> + *
> + *	Finally, when enabling an output using the legacy SETCONFIG ioctl then
> + *	"DPMS" is forced to ON. But see above, that might not be reflected in
> + *	the software value on legacy drivers.
> + *
> + *	Summarizing: Only set "DPMS" when the connector is known to be enabled,
> + *	assume that a successful SETCONFIG call also sets "DPMS" to on, and
> + *	never read back the value of "DPMS" because it can be incorrect.
>   * PATH:
> - * 	Connector path property to identify how this sink is physically
> - * 	connected. Used by DP MST. This should be set by calling
> - * 	drm_connector_set_path_property(), in the case of DP MST with the
> - * 	path property the MST manager created. Userspace cannot change this
> - * 	property.
> - *
> - * 	In the case of DP MST, the property has the format
> - * 	``mst:<parent>-<ports>`` where ``<parent>`` is the KMS object ID of the
> - * 	parent connector and ``<ports>`` is a hyphen-separated list of DP MST
> - * 	port numbers. Note, KMS object IDs are not guaranteed to be stable
> - * 	across reboots.
> + *	Connector path property to identify how this sink is physically
> + *	connected. Used by DP MST. This should be set by calling
> + *	drm_connector_set_path_property(), in the case of DP MST with the
> + *	path property the MST manager created. Userspace cannot change this
> + *	property.
> + *
> + *	In the case of DP MST, the property has the format
> + *	``mst:<parent>-<ports>`` where ``<parent>`` is the KMS object ID of the
> + *	parent connector and ``<ports>`` is a hyphen-separated list of DP MST
> + *	port numbers. Note, KMS object IDs are not guaranteed to be stable
> + *	across reboots.
>   * TILE:
> - * 	Connector tile group property to indicate how a set of DRM connector
> - * 	compose together into one logical screen. This is used by both high-res
> - * 	external screens (often only using a single cable, but exposing multiple
> - * 	DP MST sinks), or high-res integrated panels (like dual-link DSI) which
> - * 	are not gen-locked. Note that for tiled panels which are genlocked, like
> - * 	dual-link LVDS or dual-link DSI, the driver should try to not expose the
> - * 	tiling and virtualise both &drm_crtc and &drm_plane if needed. Drivers
> - * 	should update this value using drm_connector_set_tile_property().
> - * 	Userspace cannot change this property.
> + *	Connector tile group property to indicate how a set of DRM connector
> + *	compose together into one logical screen. This is used by both high-res
> + *	external screens (often only using a single cable, but exposing multiple
> + *	DP MST sinks), or high-res integrated panels (like dual-link DSI) which
> + *	are not gen-locked. Note that for tiled panels which are genlocked, like
> + *	dual-link LVDS or dual-link DSI, the driver should try to not expose the
> + *	tiling and virtualise both &drm_crtc and &drm_plane if needed. Drivers
> + *	should update this value using drm_connector_set_tile_property().
> + *	Userspace cannot change this property.
>   * link-status:
>   *      Connector link-status property to indicate the status of link. The
>   *      default value of link-status is "GOOD". If something fails during or
> @@ -1247,9 +1247,9 @@ static const u32 dp_colorspaces =
>   *      to how it might fail if a different screen has been connected in the
>   *      interim.
>   * non_desktop:
> - * 	Indicates the output should be ignored for purposes of displaying a
> - * 	standard desktop environment or console. This is most likely because
> - * 	the output device is not rectilinear.
> + *	Indicates the output should be ignored for purposes of displaying a
> + *	standard desktop environment or console. This is most likely because
> + *	the output device is not rectilinear.
>   * Content Protection:
>   *	This property is used by userspace to request the kernel protect future
>   *	content communicated over the link. When requested, kernel will apply
> @@ -1399,7 +1399,7 @@ static const u32 dp_colorspaces =
>   * Connectors also have one standardized atomic property:
>   *
>   * CRTC_ID:
> - * 	Mode object ID of the &drm_crtc this connector should be connected to.
> + *	Mode object ID of the &drm_crtc this connector should be connected to.
>   *
>   * Connectors for LCD panels may also have one standardized property:
>   *
> @@ -1721,7 +1721,7 @@ EXPORT_SYMBOL(drm_connector_attach_content_type_property);
>  
>  /**
>   * drm_connector_attach_tv_margin_properties - attach TV connector margin
> - * 	properties
> + *	properties
>   * @connector: DRM connector
>   *
>   * Called by a driver when it needs to attach TV margin props to a connector.
> @@ -2076,7 +2076,7 @@ int drm_connector_attach_scaling_mode_property(struct drm_connector *connector,
>  	struct drm_device *dev = connector->dev;
>  	struct drm_property *scaling_mode_property;
>  	int i;
> -	const unsigned valid_scaling_mode_mask =
> +	const unsigned int valid_scaling_mode_mask =
>  		(1U << ARRAY_SIZE(drm_scaling_mode_enum_list)) - 1;
>  
>  	if (WARN_ON(hweight32(scaling_mode_mask) < 2 ||
> @@ -2817,9 +2817,9 @@ int drm_connector_set_obj_prop(struct drm_mode_object *obj,
>  	struct drm_connector *connector = obj_to_connector(obj);
>  
>  	/* Do DPMS ourselves */
> -	if (property == connector->dev->mode_config.dpms_property) {
> +	if (property == connector->dev->mode_config.dpms_property)
>  		ret = (*connector->funcs->dpms)(connector, (int)value);
> -	} else if (connector->funcs->set_property)
> +	else if (connector->funcs->set_property)
>  		ret = connector->funcs->set_property(connector, property, value);
>  
>  	if (!ret)

-- 
Jani Nikula, Intel
