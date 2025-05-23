Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0700AC2578
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 16:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79D010E80C;
	Fri, 23 May 2025 14:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUBPinVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203F610E80C;
 Fri, 23 May 2025 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748011961; x=1779547961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YfDlfjViUIxPDvxHU9IxZmOKjAqljUMziUk3lky/KQo=;
 b=AUBPinVeuKd5cZPPHdPDa5vSmBsidVi54zE4vMgRjTaJ0+Snhee+TXLy
 X/ND9EVcE+uyprtAQOOq8k7HvLJcu31NwkAwuID2YeVTopiCekOup61Ds
 VRSbxglMsVTS0Ucip9vmNbrtog6U0jOWokBI0tnly47F/nIfXfjF82+OC
 kmXSlS6JwSYqNROm2I5Pvogpzn5P/YAtOD5LpmSQq70bcCOt0Qx2Ev0ve
 AR7DeZQzhF7AGRpDGehT+HMDXc22stoeE3jbLAgUv3gZHxDUNoksgWhkN
 cL2jCtQqH+qPbia5lnB/OGAm+LQdWL8GViJX9o1eO+omGxT/ULWJpNUvr A==;
X-CSE-ConnectionGUID: 1xR4K0yPQeG7FALPc/xPaQ==
X-CSE-MsgGUID: 1DS13Wh0Ri64AcHkkFjavA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37694299"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="37694299"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 07:52:34 -0700
X-CSE-ConnectionGUID: DEuM889MQKOIl8FwkSj3PA==
X-CSE-MsgGUID: c7czU3tbSvy32+dbBwG7aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="142209746"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by fmviesa009.fm.intel.com with SMTP; 23 May 2025 07:52:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 23 May 2025 17:52:29 +0300
Date: Fri, 23 May 2025 17:52:29 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: Re: [PATCH 5/8] drm/i915: Associate ACPI connector nodes with
 connector entries (v2)
Message-ID: <aDCLra5EKMbyVH3D@kuha.fi.intel.com>
References: <20210817215201.795062-1-hdegoede@redhat.com>
 <20210817215201.795062-6-hdegoede@redhat.com>
 <87sekvsml0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sekvsml0.fsf@intel.com>
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

Hi Jani,

On Fri, May 23, 2025 at 12:28:11PM +0300, Jani Nikula wrote:
> 
> Resurrecting an old thread because I am clueless and I have
> questions. :)
> 
> On Tue, 17 Aug 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >
> > On Intel platforms we know that the ACPI connector device
> > node order will follow the order the driver (i915) decides.
> > The decision is made using the custom Intel ACPI OpRegion
> > (intel_opregion.c), though the driver does not actually know
> > that the values it sends to ACPI there are used for
> > associating a device node for the connectors, and assigning
> > address for them.
> 
> Is this referring to intel_didl_outputs()?
> 
> First, it's curious that intel_didl_outputs() is only called on the
> resume paths, not at probe. I don't think the DIDL is set when
> intel_acpi_assign_connector_fwnodes() is called. But is it only the
> order that matters? Should we do intel_didl_outputs() at probe too?
> 
> Currently, we register all connectors first, move panel (as opposed to
> external) connectors in front, and that's the fixed connector order
> we'll use.
> 
> I am wondering if it would be possible to do what this patch does as we
> register each connector, not afterwards.

That would be ideal. I did not know how to do that at the time.

> It would involve something like this:
> 
> - Figure out intel_connector->acpi_device_id at connector register time
> - Figure out the index for DIDL at connector register time
> - Figure out connector->fwnode at connector register time
> 
> What could possibly go wrong...?

Probable nothing :-)

> > In reality that custom Intel ACPI OpRegion actually violates
> > ACPI specification (we supply dynamic information to objects
> > that are defined static, for example _ADR), however, it
> > makes assigning correct connector node for a connector entry
> > straightforward (it's one-on-one mapping).
> 
> Could someone elaborate, please?

If you evaluated the _ADR (address) before i915 was loaded you got
different value than what you got after the driver was loaded. In
practice it meant that you could not determine which ACPI device node
would end up representing which connector before the driver was fully
loaded.

But is the intel operation region even used anymore? I can't see its
UUID in the tables of the MTL or even RPL systems that we have.

In any case, this is not a huge problem I think.

> > Changes in v2 (Hans de goede):
> > - Take a reference on the fwnode which we assign to the connector,
> >   for ACPI nodes this is a no-op but in the future we may see
> >   software-fwnodes assigned to connectors which are ref-counted.
> >
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_acpi.c    | 46 ++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_acpi.h    |  3 ++
> >  drivers/gpu/drm/i915/display/intel_display.c |  1 +
> >  3 files changed, 50 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> > index 7cfe91fc05f2..72cac55c0f0f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> > @@ -282,3 +282,49 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
> >  	}
> >  	drm_connector_list_iter_end(&conn_iter);
> >  }
> > +
> > +/* NOTE: The connector order must be final before this is called. */
> > +void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
> > +{
> > +	struct drm_connector_list_iter conn_iter;
> > +	struct drm_device *drm_dev = &i915->drm;
> > +	struct fwnode_handle *fwnode = NULL;
> > +	struct drm_connector *connector;
> > +	struct acpi_device *adev;
> > +
> > +	drm_connector_list_iter_begin(drm_dev, &conn_iter);
> > +	drm_for_each_connector_iter(connector, &conn_iter) {
> > +		/* Always getting the next, even when the last was not used. */
> > +		fwnode = device_get_next_child_node(drm_dev->dev, fwnode);
> > +		if (!fwnode)
> > +			break;
> > +
> > +		switch (connector->connector_type) {
> > +		case DRM_MODE_CONNECTOR_LVDS:
> > +		case DRM_MODE_CONNECTOR_eDP:
> > +		case DRM_MODE_CONNECTOR_DSI:
> > +			/*
> > +			 * Integrated displays have a specific address 0x1f on
> > +			 * most Intel platforms, but not on all of them.
> > +			 */
> > +			adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
> > +						      0x1f, 0);
> > +			if (adev) {
> > +				connector->fwnode =
> > +					fwnode_handle_get(acpi_fwnode_handle(adev));
> > +				break;
> > +			}
> > +			fallthrough;
> > +		default:
> > +			connector->fwnode = fwnode_handle_get(fwnode);
> 
> Is it possible to get the struct acpi_device for all fwnodes? Does one
> exist?

If it is_acpi_node(fwnode) then yes, you can use
to_acpi_device_node(fwnode)

Each connector does have an ACPI device node in the ACPI tables under
the parent GFX controller device, so yes one should always exist.

> Specifically, I think I need a struct device that's also an ACPI device
> to pass to devm_drm_panel_alloc(), so that a subsequent
> drm_panel_add_follower() can use ACPI to look up the panel/connector.

You could already do something like this to make the code work with
both ACPI and DT:

+static struct drm_panel *drm_find_panel(const struct fwnode_handle *fwnode)
+{
+       struct drm_panel *panel;
+
+       if (!fwnode_device_is_available(fwnode))
+               return ERR_PTR(-ENODEV);
+
+       mutex_lock(&panel_lock);
+
+       list_for_each_entry(panel, &panel_list, list) {
+               if (dev_fwnode(panel->dev) == fwnode) {
+                       mutex_unlock(&panel_lock);
+                       return panel;
+               }
+       }
+
+       mutex_unlock(&panel_lock);
+       return ERR_PTR(-EPROBE_DEFER);
+}
+
 int drm_panel_add_follower(struct device *follower_dev,
                           struct drm_panel_follower *follower)
 {
-       struct device_node *panel_np;
+       struct fwnode_handle *fwnode;
        struct drm_panel *panel;
        int ret;
 
-       panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
-       if (!panel_np)
+       fwnode = fwnode_find_reference(dev_fwnode(follower_dev), "panel", 0);
+       if (!fwnode)
                return -ENODEV;
 
-       panel = of_drm_find_panel(panel_np);
-       of_node_put(panel_np);
+       panel = drm_find_panel(fwnode);
+       fwnode_handle_put(fwnode);
        if (IS_ERR(panel))
                return PTR_ERR(panel);


But that would only work if the follower_dev had a _DSD device
property named "panel" that has a reference to the ACPI device node
that represents the panel as its value. Is the panel here the same
thing as the connector?

I'm pretty sure there is no such device property (or is there?), so
how are you going to find the correct panel ACPI node for the
follower_dev?

Br,

-- 
heikki
