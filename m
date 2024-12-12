Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A09EE611
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 13:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35AA10ED77;
	Thu, 12 Dec 2024 12:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DC2uv01i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7F210E2F2;
 Thu, 12 Dec 2024 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734004939; x=1765540939;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=0k6aHLb7ZJcJ78gY9AGGHKEKrUJsuYzLi0fH2J83YPM=;
 b=DC2uv01ihgQG5EyHTdlm5jd54SI8hmk3PDNbMEaZNbQmG95c14CBPGgY
 0UaLhYZ3Uin8ln2gAX5KcPBxsdhjiBZlk/oR4qv0le2UJsjX62cVLl737
 jpuiTxIEIn7KCpT+ljPf7McDrjsNey7HJ+G3x6nimOhqd3w00CaRDUk/L
 NZdM9hCMCkZM9hhw8hLDAbfccD6ciX4hH519PikxA79tCnEVYJZUjektd
 rB33kLxPlvAX/kUGG5IhfH/P0qCCPG9SQKOBxX0CiPJ+TR+emLMu/sejR
 NEeaG5SOUui8ULHzhidS3mAvtjS7jdFDjbhIJansfWtN8TrH1zQEvL4S8 w==;
X-CSE-ConnectionGUID: FnXXD3JERFyA1lUuc01IFw==
X-CSE-MsgGUID: myD1NwchQmqzBjPtos042A==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34546756"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="34546756"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 04:02:19 -0800
X-CSE-ConnectionGUID: 5nscjOnyRgiDeiOXt5jrQQ==
X-CSE-MsgGUID: LR/yQ7NbRraMXXLFIG3GFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="95961789"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 04:02:17 -0800
Date: Thu, 12 Dec 2024 14:02:58 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 03/11] drm/connector: Add deprication notes for
 drm_connector_register/unregister
Message-ID: <Z1rQ8pvfFWlj5yLl@ideak-desk.fi.intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-4-imre.deak@intel.com>
 <87ed2dxlcd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed2dxlcd.fsf@intel.com>
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

On Thu, Dec 12, 2024 at 12:10:58PM +0200, Jani Nikula wrote:
> [...]
> On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> > @@ -863,9 +866,14 @@ EXPORT_SYMBOL(drm_connector_dynamic_register);
> >   * drm_connector_unregister - unregister a connector
> >   * @connector: the connector to unregister
> >   *
> > - * Unregister userspace interfaces for a connector. Only call this for
> > - * connectors which have been registered explicitly by calling
> > - * drm_connector_register().
> > + * Unregister userspace interfaces for a connector. Drivers should call this
> > + * for dynamic connectors (MST) only, which were registered explicitly by
> > + * calling drm_connector_dynamic_register(). All other - static - connectors
> > + * will be unregistered automatically by DRM core and drivers shouldn't call
> > + * this function for those.
> 
> This kind of supports my point about a single
> drm_connector_register(). There's no
> drm_connector_dynamic_unregister(). After all the
> drm_connector_register() calls have been removed, we're left with the
> asymmetric pair:
> 
> - drm_connector_dynamic_register()
> - drm_connector_unregister()
> 
> Then again, all of these should become internal and not for drivers?

Yes, drm_connector_register() - after this patchset - could be removed
from drivers. The use of drm_connector_unregister() in drivers for
static connectors should be also removed, left it for DRM core internal
use only and exporting drm_connector_dynamic_unregister() for driver
use (atm only MST).

> > + *
> > + * Note: Existing uses of this function in drivers for static connectors
> > + * should be a nop already and are scheduled to be removed.
> >   */
> >  void drm_connector_unregister(struct drm_connector *connector)
> >  {
> 
> -- 
> Jani Nikula, Intel
