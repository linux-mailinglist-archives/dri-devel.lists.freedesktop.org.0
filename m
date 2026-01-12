Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B942D11DBB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDEE10E335;
	Mon, 12 Jan 2026 10:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+OLXLSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0356410E0D5;
 Mon, 12 Jan 2026 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768213631; x=1799749631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M1qnNXXnU4ythQw3ZcVlVpymP9jZUc0obFE9gq46d10=;
 b=T+OLXLSHHLMLhJHApiqc0r+CH4WmNof1gaygeBJzccpkvfC4MWP9NFYb
 y3kjdV2E1FmKfcLj3E26E997usT0sBCKKWRp2TibMuIKGSmRpmhghHX/W
 mhLUpNmQGuhSy/R8YqkIgbXVmltaxBOGlSxXqheXoIztpGxj7y8oKBChG
 fGe52ZL/l4ec3zoBmhgtBttc2s/TXU6bw+nn9vJ+kcvc2J1JGwiC/EvGh
 UfKnxBFtzHyeKnkKOdsN7kzSxIo/PZl3lcmK1BegQR/BWEXrVaxIVgGFk
 SGayqXZEQ7BcTgzJLcdC6cq0668UKfQlh5k+VfZ4WcoVdBwzY6wOKGu84 w==;
X-CSE-ConnectionGUID: KAuHs4NDTTKk3GYM5kDF1g==
X-CSE-MsgGUID: FzfKZk7kTr2b+x3p6F+byA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69468613"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69468613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 02:27:11 -0800
X-CSE-ConnectionGUID: m5XYCjgfSnKoty+aAVa5mg==
X-CSE-MsgGUID: iPGHhv32RsWosCWQjynV8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208537619"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 02:27:08 -0800
Date: Mon, 12 Jan 2026 11:27:05 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com
Subject: Re: [PATCH v3 2/4] drm/xe/xe_drm_ras: Add support for drm ras
Message-ID: <aWTMef5w6NH4SxRF@black.igk.intel.com>
References: <20251205083934.3602030-6-riana.tauro@intel.com>
 <20251205083934.3602030-8-riana.tauro@intel.com>
 <aTfcV5nb_vBOOBvP@black.igk.intel.com>
 <ac78c819-51ce-4a6b-a5c8-1f327d1d8a7e@intel.com>
 <aWENCzpkeI4OaZqa@intel.com> <aWEljhdVF10_70Cz@black.igk.intel.com>
 <fb4fed2d-27e6-4533-a37e-8a8d24f20aae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb4fed2d-27e6-4533-a37e-8a8d24f20aae@intel.com>
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

On Mon, Jan 12, 2026 at 11:43:16AM +0530, Riana Tauro wrote:
> On 1/9/2026 9:28 PM, Raag Jadav wrote:
> > On Fri, Jan 09, 2026 at 09:13:31AM -0500, Rodrigo Vivi wrote:
> > > On Fri, Jan 09, 2026 at 01:38:44PM +0530, Riana Tauro wrote:
> > > > Hi Raag
> > > > 
> > > > Thank you for the review
> > > > 
> > > > On 12/9/2025 1:52 PM, Raag Jadav wrote:
> > > > > On Fri, Dec 05, 2025 at 02:09:34PM +0530, Riana Tauro wrote:
> > > > > > Allocate correctable, nonfatal and fatal nodes per xe device.
> > > > > > Each node contains error classes, counters and respective
> > > > > > query counter functions.
> > > > > > 
> > > > > > Add basic functionality to create and register drm nodes.
> > > > > > Below operations can be performed using Generic netlink DRM RAS interface

...

> > > > > > +/**
> > > > > > + * enum drm_xe_ras_error_class - Supported drm ras error classes.
> > > > > > + */
> > > > > > +enum drm_xe_ras_error_class {
> > > > > > +	/** @DRM_XE_RAS_ERROR_CORE_COMPUTE: GT and Media Error */
> > > > > > +	DRM_XE_RAS_ERROR_CORE_COMPUTE = 1,
> > > > > > +	/** @DRM_XE_RAS_ERROR_SOC_INTERNAL: SOC Error */
> > > > > > +	DRM_XE_RAS_ERROR_SOC_INTERNAL,
> > > > > > +	/** @DRM_XE_RAS_ERROR_CLASS_MAX: Max Error */
> > > > > > +	DRM_XE_RAS_ERROR_CLASS_MAX,	/* non-ABI */
> > > > > > +};
> > > > > 
> > > > > Also, all of the enums share the same DRM_XE_RAS_ERROR_* prefix, so let's try
> > > > > to have distinguishable naming. Perhaps [*] would be useful here as well ;)
> > > > 
> > > > DRM_XE_RAS_ERROR_SEVERITY_* will cause longer names. Any suggestions?
> > 
> > Already mentioned above[*], the key is to not overuse 'error' ;)
> > 
> > DRM_XE_RAS_SEVERITY_*
> > DRM_XE_RAS_COMPONENT_*
> 
> There's been an interest expressed to add telemetry nodes as well.
> 
> https://patchwork.freedesktop.org/patch/666138/?series=118435&rev=5
> 
> I have kept the prefix (DRM_XE_RAS_ERROR) consistent with the first patch
> (type - ERROR_COUNTER) for alignment.
> 
> From my perspective retaining the prefix ERROR would be beneficial to
> differentiate if there are different types.
> 
> Can you please have a look at the link and let me know if you still think
> the same

Fair, whichever makes sense for the usecase and please excuse my
bikeshedding.

> For differentiation, i will add SEVERITY and CLASS/COMPONENT.

Thank you.

Raag
