Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73ECAC3DCE
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 12:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2121710E309;
	Mon, 26 May 2025 10:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dk+g/cE1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82F910E301;
 Mon, 26 May 2025 10:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748255076; x=1779791076;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i2e+Si62i+fWehydvuqN0zb6P+68q0sUEfgcITCNmsU=;
 b=dk+g/cE1i+H+cfRyFmZ6i/j782cA5kjgGLOdSc1s07WfNoLUuyMPVYh+
 2AYQa+0aJ1xv7oVVKvhIRiqpACiSqwz2E/nW3WZxdSRc49AcjV5HWCuJF
 mMUsYVEHJuFIn9LtG/XQq82eyjrGsPpF992X6NONuWD3IEJ2wlq4Vx4My
 mfQtDN432q6nk5/HO46BBd2oDdQRaoDceMrZgiwgdYU/QGKQbMjIjaz8q
 W1HJCRhtnQhpyRunlDPQFY3VpIoPrUYnGymf3213N8qgfxqAvB21gxxrn
 5LZpSyGUDf+2fqTtk44Phh64FZAZWfVorHakrAxaOCM1d9W44V0siKlPP A==;
X-CSE-ConnectionGUID: 5QM4e6vCQwOup4brAPm2/w==
X-CSE-MsgGUID: yAn95NanS/2wbq1LRfmVEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="49341256"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="49341256"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 03:24:34 -0700
X-CSE-ConnectionGUID: lQMZuh5xRR+pvtHPGt2DLw==
X-CSE-MsgGUID: o341LzSpSAW4QeiJCZdfsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142688197"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 03:24:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Lyude <lyude@redhat.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>
Subject: Re: [PATCH 5/8] drm/i915: Associate ACPI connector nodes with
 connector entries (v2)
In-Reply-To: <aDCLra5EKMbyVH3D@kuha.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210817215201.795062-1-hdegoede@redhat.com>
 <20210817215201.795062-6-hdegoede@redhat.com> <87sekvsml0.fsf@intel.com>
 <aDCLra5EKMbyVH3D@kuha.fi.intel.com>
Date: Mon, 26 May 2025 13:24:28 +0300
Message-ID: <ad9f6b6cae367580b3da83a5f92de7e7f67e5a1b@intel.com>
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

On Fri, 23 May 2025, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> Hi Jani,
>
> On Fri, May 23, 2025 at 12:28:11PM +0300, Jani Nikula wrote:
>> 
>> Resurrecting an old thread because I am clueless and I have
>> questions. :)
>> 
>> On Tue, 17 Aug 2021, Hans de Goede <hdegoede@redhat.com> wrote:
>> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> >
>> > On Intel platforms we know that the ACPI connector device
>> > node order will follow the order the driver (i915) decides.
>> > The decision is made using the custom Intel ACPI OpRegion
>> > (intel_opregion.c), though the driver does not actually know
>> > that the values it sends to ACPI there are used for
>> > associating a device node for the connectors, and assigning
>> > address for them.
>> 
>> Is this referring to intel_didl_outputs()?
>> 
>> First, it's curious that intel_didl_outputs() is only called on the
>> resume paths, not at probe. I don't think the DIDL is set when
>> intel_acpi_assign_connector_fwnodes() is called. But is it only the
>> order that matters? Should we do intel_didl_outputs() at probe too?
>> 
>> Currently, we register all connectors first, move panel (as opposed to
>> external) connectors in front, and that's the fixed connector order
>> we'll use.
>> 
>> I am wondering if it would be possible to do what this patch does as we
>> register each connector, not afterwards.
>
> That would be ideal. I did not know how to do that at the time.
>
>> It would involve something like this:
>> 
>> - Figure out intel_connector->acpi_device_id at connector register time
>> - Figure out the index for DIDL at connector register time
>> - Figure out connector->fwnode at connector register time
>> 
>> What could possibly go wrong...?
>
> Probable nothing :-)

I guess we'd still have to maintain the same order, somehow? That's
still a problem.

>
>> > In reality that custom Intel ACPI OpRegion actually violates
>> > ACPI specification (we supply dynamic information to objects
>> > that are defined static, for example _ADR), however, it
>> > makes assigning correct connector node for a connector entry
>> > straightforward (it's one-on-one mapping).
>> 
>> Could someone elaborate, please?
>
> If you evaluated the _ADR (address) before i915 was loaded you got
> different value than what you got after the driver was loaded. In
> practice it meant that you could not determine which ACPI device node
> would end up representing which connector before the driver was fully
> loaded.
>
> But is the intel operation region even used anymore? I can't see its
> UUID in the tables of the MTL or even RPL systems that we have.

What does it mean? What we write in DIDL doesn't matter for such
systems? What does that mean for the ordering?

I'm just clueless about this. :/

> In any case, this is not a huge problem I think.
>
>> > Changes in v2 (Hans de goede):
>> > - Take a reference on the fwnode which we assign to the connector,
>> >   for ACPI nodes this is a no-op but in the future we may see
>> >   software-fwnodes assigned to connectors which are ref-counted.
>> >
>> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> > Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_acpi.c    | 46 ++++++++++++++++++++
>> >  drivers/gpu/drm/i915/display/intel_acpi.h    |  3 ++
>> >  drivers/gpu/drm/i915/display/intel_display.c |  1 +
>> >  3 files changed, 50 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
>> > index 7cfe91fc05f2..72cac55c0f0f 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
>> > @@ -282,3 +282,49 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
>> >  	}
>> >  	drm_connector_list_iter_end(&conn_iter);
>> >  }
>> > +
>> > +/* NOTE: The connector order must be final before this is called. */
>> > +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
>> > +{
>> > +	struct drm_connector_list_iter conn_iter;
>> > +	struct drm_device *drm_dev = &i915->drm;
>> > +	struct fwnode_handle *fwnode = NULL;
>> > +	struct drm_connector *connector;
>> > +	struct acpi_device *adev;
>> > +
>> > +	drm_connector_list_iter_begin(drm_dev, &conn_iter);
>> > +	drm_for_each_connector_iter(connector, &conn_iter) {
>> > +		/* Always getting the next, even when the last was not used. */
>> > +		fwnode = device_get_next_child_node(drm_dev->dev, fwnode);
>> > +		if (!fwnode)
>> > +			break;
>> > +
>> > +		switch (connector->connector_type) {
>> > +		case DRM_MODE_CONNECTOR_LVDS:
>> > +		case DRM_MODE_CONNECTOR_eDP:
>> > +		case DRM_MODE_CONNECTOR_DSI:
>> > +			/*
>> > +			 * Integrated displays have a specific address 0x1f on
>> > +			 * most Intel platforms, but not on all of them.
>> > +			 */
>> > +			adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
>> > +						      0x1f, 0);
>> > +			if (adev) {
>> > +				connector->fwnode =
>> > +					fwnode_handle_get(acpi_fwnode_handle(adev));
>> > +				break;
>> > +			}
>> > +			fallthrough;
>> > +		default:
>> > +			connector->fwnode = fwnode_handle_get(fwnode);
>> 
>> Is it possible to get the struct acpi_device for all fwnodes? Does one
>> exist?
>
> If it is_acpi_node(fwnode) then yes, you can use
> to_acpi_device_node(fwnode)
>
> Each connector does have an ACPI device node in the ACPI tables under
> the parent GFX controller device, so yes one should always exist.
>
>> Specifically, I think I need a struct device that's also an ACPI device
>> to pass to devm_drm_panel_alloc(), so that a subsequent
>> drm_panel_add_follower() can use ACPI to look up the panel/connector.
>
> You could already do something like this to make the code work with
> both ACPI and DT:
>
> +static struct drm_panel *drm_find_panel(const struct fwnode_handle *fwnode)
> +{
> +       struct drm_panel *panel;
> +
> +       if (!fwnode_device_is_available(fwnode))
> +               return ERR_PTR(-ENODEV);
> +
> +       mutex_lock(&panel_lock);
> +
> +       list_for_each_entry(panel, &panel_list, list) {
> +               if (dev_fwnode(panel->dev) == fwnode) {
> +                       mutex_unlock(&panel_lock);
> +                       return panel;
> +               }
> +       }
> +
> +       mutex_unlock(&panel_lock);
> +       return ERR_PTR(-EPROBE_DEFER);
> +}
> +
>  int drm_panel_add_follower(struct device *follower_dev,
>                            struct drm_panel_follower *follower)
>  {
> -       struct device_node *panel_np;
> +       struct fwnode_handle *fwnode;
>         struct drm_panel *panel;
>         int ret;
>  
> -       panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
> -       if (!panel_np)
> +       fwnode = fwnode_find_reference(dev_fwnode(follower_dev), "panel", 0);
> +       if (!fwnode)
>                 return -ENODEV;
>  
> -       panel = of_drm_find_panel(panel_np);
> -       of_node_put(panel_np);
> +       panel = drm_find_panel(fwnode);
> +       fwnode_handle_put(fwnode);
>         if (IS_ERR(panel))
>                 return PTR_ERR(panel);

Cool, thanks!

> But that would only work if the follower_dev had a _DSD device
> property named "panel" that has a reference to the ACPI device node
> that represents the panel as its value. Is the panel here the same
> thing as the connector?

For our purposes I think it would be. But I don't know what that
reference would look like, or what the connector ACPI things look like.

> I'm pretty sure there is no such device property (or is there?), so
> how are you going to find the correct panel ACPI node for the
> follower_dev?

I'm being told such thing doesn't exist, but could be defined. Again,
I'm clueless.


BR,
Jani.


-- 
Jani Nikula, Intel
