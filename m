Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB575AC1FBC
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 11:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3476C10E7A9;
	Fri, 23 May 2025 09:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BA4ht4b8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EA010E16C;
 Fri, 23 May 2025 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747992500; x=1779528500;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pz0wUatI2sWm5ZlERU1fESHJowwyUiFW7XEihtGUPwQ=;
 b=BA4ht4b8ySApI1Tbq7u5xOO/rGsFl3HQUxSjCh2x42r5cyr6mef/oZi1
 u6PbloS0zQ03eKoekv4yaO79qcg156Ust2w4X2B0kQuuAjPMYrGIAWunO
 LDdHyij/94ZIMvQWgE6rBXhq1nsraJLMUsYpC4tDuys9tHHQsaibOsl4Z
 3aJFQvw90dBAVlkRn5nQgRRvyWZEpw+W9AQ/lpS9ke+4m1QS3CBaRf3wP
 aXO7+uGGTqwEYz4OnjjG3oN2sz7YkUcII6AaCdlgsj2DDQbpIwrvsYL7B
 Uo+99+6rJ5S24m9OVvmE8icCIm3Bi/RAk5A5wu7MK8q/iDXF7n3Dmia97 A==;
X-CSE-ConnectionGUID: IVaFr82GTbCiZpJWNjRxcA==
X-CSE-MsgGUID: n8aSjAzJTA6WQKJduT5nEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49160996"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="49160996"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 02:28:18 -0700
X-CSE-ConnectionGUID: nJAOgtM0SOSZvgVYPA4sNw==
X-CSE-MsgGUID: nPZ0hD+ITsaBK+zLKJJ4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="146056385"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 02:28:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Lyude <lyude@redhat.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: Re: [PATCH 5/8] drm/i915: Associate ACPI connector nodes with
 connector entries (v2)
In-Reply-To: <20210817215201.795062-6-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210817215201.795062-1-hdegoede@redhat.com>
 <20210817215201.795062-6-hdegoede@redhat.com>
Date: Fri, 23 May 2025 12:28:11 +0300
Message-ID: <87sekvsml0.fsf@intel.com>
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


Resurrecting an old thread because I am clueless and I have
questions. :)

On Tue, 17 Aug 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
> On Intel platforms we know that the ACPI connector device
> node order will follow the order the driver (i915) decides.
> The decision is made using the custom Intel ACPI OpRegion
> (intel_opregion.c), though the driver does not actually know
> that the values it sends to ACPI there are used for
> associating a device node for the connectors, and assigning
> address for them.

Is this referring to intel_didl_outputs()?

First, it's curious that intel_didl_outputs() is only called on the
resume paths, not at probe. I don't think the DIDL is set when
intel_acpi_assign_connector_fwnodes() is called. But is it only the
order that matters? Should we do intel_didl_outputs() at probe too?

Currently, we register all connectors first, move panel (as opposed to
external) connectors in front, and that's the fixed connector order
we'll use.

I am wondering if it would be possible to do what this patch does as we
register each connector, not afterwards.

It would involve something like this:

- Figure out intel_connector->acpi_device_id at connector register time
- Figure out the index for DIDL at connector register time
- Figure out connector->fwnode at connector register time

What could possibly go wrong...?

> In reality that custom Intel ACPI OpRegion actually violates
> ACPI specification (we supply dynamic information to objects
> that are defined static, for example _ADR), however, it
> makes assigning correct connector node for a connector entry
> straightforward (it's one-on-one mapping).

Could someone elaborate, please?

> Changes in v2 (Hans de goede):
> - Take a reference on the fwnode which we assign to the connector,
>   for ACPI nodes this is a no-op but in the future we may see
>   software-fwnodes assigned to connectors which are ref-counted.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_acpi.c    | 46 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_acpi.h    |  3 ++
>  drivers/gpu/drm/i915/display/intel_display.c |  1 +
>  3 files changed, 50 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> index 7cfe91fc05f2..72cac55c0f0f 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -282,3 +282,49 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
>  	}
>  	drm_connector_list_iter_end(&conn_iter);
>  }
> +
> +/* NOTE: The connector order must be final before this is called. */
> +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
> +{
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_device *drm_dev = &i915->drm;
> +	struct fwnode_handle *fwnode = NULL;
> +	struct drm_connector *connector;
> +	struct acpi_device *adev;
> +
> +	drm_connector_list_iter_begin(drm_dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		/* Always getting the next, even when the last was not used. */
> +		fwnode = device_get_next_child_node(drm_dev->dev, fwnode);
> +		if (!fwnode)
> +			break;
> +
> +		switch (connector->connector_type) {
> +		case DRM_MODE_CONNECTOR_LVDS:
> +		case DRM_MODE_CONNECTOR_eDP:
> +		case DRM_MODE_CONNECTOR_DSI:
> +			/*
> +			 * Integrated displays have a specific address 0x1f on
> +			 * most Intel platforms, but not on all of them.
> +			 */
> +			adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
> +						      0x1f, 0);
> +			if (adev) {
> +				connector->fwnode =
> +					fwnode_handle_get(acpi_fwnode_handle(adev));
> +				break;
> +			}
> +			fallthrough;
> +		default:
> +			connector->fwnode = fwnode_handle_get(fwnode);

Is it possible to get the struct acpi_device for all fwnodes? Does one
exist?

Specifically, I think I need a struct device that's also an ACPI device
to pass to devm_drm_panel_alloc(), so that a subsequent
drm_panel_add_follower() can use ACPI to look up the panel/connector.

BR,
Jani.


> +			break;
> +		}
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +	/*
> +	 * device_get_next_child_node() takes a reference on the fwnode, if
> +	 * we stopped iterating because we are out of connectors we need to
> +	 * put this, otherwise fwnode is NULL and the put is a no-op.
> +	 */
> +	fwnode_handle_put(fwnode);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
> index 9f197401c313..4a760a2baed9 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.h
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.h
> @@ -13,6 +13,7 @@ void intel_register_dsm_handler(void);
>  void intel_unregister_dsm_handler(void);
>  void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915);
>  void intel_acpi_device_id_update(struct drm_i915_private *i915);
> +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915);
>  #else
>  static inline void intel_register_dsm_handler(void) { return; }
>  static inline void intel_unregister_dsm_handler(void) { return; }
> @@ -20,6 +21,8 @@ static inline
>  void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915) { return; }
>  static inline
>  void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
> +static inline
> +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
>  #endif /* CONFIG_ACPI */
>  
>  #endif /* __INTEL_ACPI_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index a257e5dc381c..88e5fff64b8c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -12561,6 +12561,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
>  
>  	drm_modeset_lock_all(dev);
>  	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
> +	intel_acpi_assign_connector_fwnodes(i915);
>  	drm_modeset_unlock_all(dev);
>  
>  	for_each_intel_crtc(dev, crtc) {

-- 
Jani Nikula, Intel
