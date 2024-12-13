Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88E9F0BD6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 13:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53F610E328;
	Fri, 13 Dec 2024 12:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YT3w6kpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6461E10E313;
 Fri, 13 Dec 2024 12:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734091488; x=1765627488;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=UygAvWkWKp2AZXk4OXEfW5yeVUUIZ9S4CJz491SUAtA=;
 b=YT3w6kpaqSfSBXXc+5O+ow2JTsSD2y+n6v3oaNJZr7/bAunQlRbTAUk/
 oIw6dyQuQCCttfO1lES/IjQI/5WQ60/oI58wJNnlE4IVUh6T4S8m6qpdz
 iiEuXIvRy0ipc1s/8R/yW7yBNPKFQRpQZ8Xyj2h0HxI/yNsoXy7IYbeyY
 +R29KMkDKk074tkcG/RhtzZ1xEcSwJ4cM6yhsVpwNlIdUtppuX9B7NC2R
 /n48qsJo+6txDv6EdlfrPDEEtRfNE0TslZhAnhj6yxsbjeTP7eA5NHPr3
 E44wnaCep2Pn57DU99bB9/EUU4TK9afIOBItCdX9ZaklU4z1TDsIYMGWO A==;
X-CSE-ConnectionGUID: XC53Uf6cQCuBaxOZvJEtYw==
X-CSE-MsgGUID: J/Iq6I+nSIqsy/tP5OqZ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34444145"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34444145"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:02:39 -0800
X-CSE-ConnectionGUID: g5rRMqD2Qry0e3c7XPH5/g==
X-CSE-MsgGUID: Szd7ojhJQoCz8br6t5m86Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96377237"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:02:12 -0800
Date: Fri, 13 Dec 2024 14:02:01 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v3 02/11] drm/connector: Add FIXME for GETRESOURCES ioctl
 wrt. uninited connectors
Message-ID: <Z1wiOWPz84hO4XTa@ideak-desk.fi.intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-3-imre.deak@intel.com>
 <87h679xlkb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h679xlkb.fsf@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2024 at 12:06:12PM +0200, Jani Nikula wrote:
> On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> > The connectors enumerated by the GETRESOURCES ioctl may not be fully
> > initialized yet wrt. to the state set up during connector registration
> > (for instance the connector's debugfs/sysfs interfaces may not exist
> > yet). This can happen in two ways:
> >
> > 1. Connectors initialized and added to the
> >    drm_mode_config::connector_list during driver loading will be visible
> >    to the GETRESOURCES ioctl caller once the driver is registered via
> >    drm_dev_register()->drm_minor_register(DRM_MINOR_PRIMARY) and before
> >    the connectors are registered via drm_dev_register()->
> >    drm_modeset_register_all().
> >
> > 2. Dynamic connectors (MST) - after being initialized - may be added to
> >    the connector_list after the driver is loaded and registered and before
> >    the connector's userspace interfaces (debugfs, sysfs etc.) are added
> >    in drm_connector_dynamic_register().
> >
> > A solution for 1. would be to register the driver only after the
> > connectors are registered, for 2. to add the connector to connector_list
> > only after the userspace interfaces are registered.
> >
> > The fix would require a bigger change, not the topic of this patchset,
> > so adding only a FIXME comment here.
> 
> References to "this patchset" become meaningless after this has been
> committed.

I wondered if the Link: added when the patch is committed provides the
context, but I suppose the link can get stale. I can reword the above to:

"The fix requires a bigger change, for now adding a FIXME: comment for
it."

> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> >
> > Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/drm_mode_config.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > index 37d2e0a4ef4be..8642a2fb25a90 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -150,6 +150,15 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
> >  	drm_connector_list_iter_begin(dev, &conn_iter);
> >  	count = 0;
> >  	connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
> > +	/*
> > +	 * FIXME: the connectors on the list may not be fully initialized yet,
> > +	 * if the ioctl is called before the connectors are registered. (See
> > +	 * drm_dev_register()->drm_modeset_register_all() for static and
> > +	 * drm_connector_dynamic_register() for dynamic connectors.)
> > +	 * The driver should only get registered after static connectors are
> > +	 * fully initialized and dynamic connectors should be added to the
> > +	 * connector list only after fully initializing them.
> > +	 */
> >  	drm_for_each_connector_iter(connector, &conn_iter) {
> >  		/* only expose writeback connectors if userspace understands them */
> >  		if (!file_priv->writeback_connectors &&
> 
> -- 
> Jani Nikula, Intel
