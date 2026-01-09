Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C53D0B147
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4A910E8F4;
	Fri,  9 Jan 2026 15:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCo5+H2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1042E10E8F1;
 Fri,  9 Jan 2026 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767974292; x=1799510292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9JYpM3aXZLkVSZvCLteDPPQd9tuSrTEhUTPEjYaJ4zA=;
 b=cCo5+H2TUywgOSPvb7NsKOtggxXc/n2Rmiwkwbe1M/eYtfpY4mat9jDZ
 ayJQa4RMne8gQct83TDrHxyF/axzbxDTqskE7AHQ0PR/ZxPw2NdRaekgI
 3ndxuK9BO6uSftuBBo3MA8nr7Y7GBiV2kcgk6LoQBiMUzCdi1BO5ln1TA
 adhNXLwlhLLKmeCoTkGTp+UymIIOTuQGmDcQVoGF3oAKrd1KUVmmrNGtj
 iBVziOGHbZaDK73w7hbVKLS0LDWV0cjyGEDbYPO0ytIee0ZnbJfIY56T6
 djj6j4tuoCpkcsAk6ILqFFEFP2Q9u9BoBH65xkn/hQ70oe334UKXKmwxB Q==;
X-CSE-ConnectionGUID: H7C201AoRvOW3YmehGKqKA==
X-CSE-MsgGUID: OrHIFsccTy6kVSBH38gH1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69289024"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69289024"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:58:11 -0800
X-CSE-ConnectionGUID: qc+0kx6BQrm0lzS+pCBb9Q==
X-CSE-MsgGUID: Q25AI9gOS9G7M1JOVoIuhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="208026614"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:58:09 -0800
Date: Fri, 9 Jan 2026 16:58:06 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com
Subject: Re: [PATCH v3 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Message-ID: <aWEljhdVF10_70Cz@black.igk.intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-8-riana.tauro@intel.com>
 <aTfcV5nb_vBOOBvP@black.igk.intel.com>
 <ac78c819-51ce-4a6b-a5c8-1f327d1d8a7e@intel.com>
 <aWENCzpkeI4OaZqa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWENCzpkeI4OaZqa@intel.com>
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

On Fri, Jan 09, 2026 at 09:13:31AM -0500, Rodrigo Vivi wrote:
> On Fri, Jan 09, 2026 at 01:38:44PM +0530, Riana Tauro wrote:
> > Hi Raag
> > 
> > Thank you for the review
> > 
> > On 12/9/2025 1:52 PM, Raag Jadav wrote:
> > > On Fri, Dec 05, 2025 at 02:09:34PM +0530, Riana Tauro wrote:
> > > > Allocate correctable, nonfatal and fatal nodes per xe device.
> > > > Each node contains error classes, counters and respective
> > > > query counter functions.
> > > > 
> > > > Add basic functionality to create and register drm nodes.
> > > > Below operations can be performed using Generic netlink DRM RAS interface

...

> > > > Query Error counter:
> > > > 
> > > > $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":1, "error-id":1}'
> > > > {'error-id': 1, 'error-name': 'Core Compute Error', 'error-value': 0}
> > > 
> > > One more (sorry): So this means graphics will be a different id? Or do they
> > > overlap? How does it work?
> > > 
> > 
> > Did not get this question.

This give the impression that it's specific to compute engine, so I was
hoping for something more generic like "execution unit" or simply "core"
but I couldn't come up with anything better than this, so upto you.

> > > Also,
> > > 
> > > [*] I'm not much informed about the history here but the 'error' term
> > > seems slapped onto almost everything. We already know it's RAS so perhaps
> > > we add it only where make sense and try to simplify some of the naming?

...

> > > > +/**
> > > > + * enum drm_xe_ras_error_class - Supported drm ras error classes.
> > > > + */
> > > > +enum drm_xe_ras_error_class {
> > > > +	/** @DRM_XE_RAS_ERROR_CORE_COMPUTE: GT and Media Error */
> > > > +	DRM_XE_RAS_ERROR_CORE_COMPUTE = 1,
> > > > +	/** @DRM_XE_RAS_ERROR_SOC_INTERNAL: SOC Error */
> > > > +	DRM_XE_RAS_ERROR_SOC_INTERNAL,
> > > > +	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
> > > > +	DRM_XE_RAS_ERROR_CLASS_MAX,	/* non-ABI */
> > > > +};
> > > 
> > > Also, all of the enums share the same DRM_XE_RAS_ERROR_* prefix, so let's try
> > > to have distinguishable naming. Perhaps [*] would be useful here as well ;)
> > 
> > DRM_XE_RAS_ERROR_SEVERITY_* will cause longer names. Any suggestions?

Already mentioned above[*], the key is to not overuse 'error' ;)

DRM_XE_RAS_SEVERITY_*
DRM_XE_RAS_COMPONENT_*

and so on ...

> Try this full version first and see how the outcome looks like...
> if we are still respecting the line limits without ugly cuts, then let's go with it.
> otherwise try something shorter ERR_SEV_ ... or something like that...

... which can be futher shortened with this idea.

Side note: I'm already using these on my local branch.

Raag
