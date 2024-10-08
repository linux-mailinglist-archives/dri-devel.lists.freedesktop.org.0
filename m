Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02159952D6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 17:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300C810E571;
	Tue,  8 Oct 2024 15:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFe0yThZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B52710E571;
 Tue,  8 Oct 2024 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728399771; x=1759935771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gpUErE9pNkYGr5nHTOEazsYjopbzltoUu+P7dfTzBZA=;
 b=nFe0yThZxq+AorpyA+mh7MQLyTLC/xKAbd0dgOa6b0byQF1yGR8BMBdC
 yYiwBeGV7uLZwKa63fXMzlLCKxHoQ73mLeL8zB+c9iVwg/FjaIpmi51gS
 MMPCb6DtFoq9WCAoRq/HE/pkvlsE/vrPTyyGGVLT6jyO7jjA0P4lESNzC
 FhlhFS/FCsZ73FHfstgJfGYrCrRssuCh/sskRLqB1u59WBM57PI98QZLm
 gB7CuBsy7RjzQrxqcP1XAIoyqsrIk5ldFoLzqYg17u+ATO0fAhYvGt7lL
 N5MOoBJFDYuTEwx0wI5l18UJGecSOWIwVaA0qLEN9J36UcqzCnJ/jjCpn A==;
X-CSE-ConnectionGUID: YIYExzxeSP2Kxzh1ns8Gxg==
X-CSE-MsgGUID: ADtVj3ANRAmAm/E2Jne4BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38731459"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38731459"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 08:02:51 -0700
X-CSE-ConnectionGUID: MBlP9xOBSz6by9s1ZX3kYg==
X-CSE-MsgGUID: ZTM8qWQEQLWJWmbMTbGSKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75966973"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 08:02:46 -0700
Date: Tue, 8 Oct 2024 18:02:43 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, lucas.demarchi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZwVJk8ESEyxyemrG@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <26f90d12-6a04-445e-96ff-aafbe3dc8132@intel.com>
 <Zv6Ms7G4pSLdgUKo@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv6Ms7G4pSLdgUKo@black.fi.intel.com>
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

On Thu, Oct 03, 2024 at 03:23:22PM +0300, Raag Jadav wrote:
> On Tue, Oct 01, 2024 at 02:20:29PM +0200, Michal Wajdeczko wrote:
> > On 30.09.2024 09:38, Raag Jadav wrote:
> > >  
> > > +/**
> > > + * enum drm_wedge_recovery - Recovery method for wedged device in order of
> > > + * severity. To be set as bit fields in drm_device.wedge_recovery variable.
> > > + * Drivers can choose to support any one or multiple of them depending on
> > > + * their needs.
> > > + */
> > > +enum drm_wedge_recovery {
> > > +	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
> > > +	DRM_WEDGE_RECOVERY_REBIND,
> > > +
> > > +	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
> > > +	DRM_WEDGE_RECOVERY_BUS_RESET,
> > > +
> > > +	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
> > > +	DRM_WEDGE_RECOVERY_REBOOT,
> > > +
> > > +	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
> > > +	DRM_WEDGE_RECOVERY_MAX
> > > +};
> > > +
> > >  /**
> > >   * struct drm_device - DRM device structure
> > >   *
> > > @@ -317,6 +337,9 @@ struct drm_device {
> > >  	 * Root directory for debugfs files.
> > >  	 */
> > >  	struct dentry *debugfs_root;
> > > +
> > > +	/** @wedge_recovery: Supported recovery methods for wedged device */
> > > +	unsigned long wedge_recovery;
> > 
> > hmm, so before the driver can ask for a reboot as a recovery method from
> > wedge it has to somehow add 'reboot' as available method? why it that?
> 
> It's for consumers to use as fallbacks in case the preferred recovery method
> (sent along with uevent) don't workout. (patch 2/5)

On second thought...

Lucas, do we have a convincing enough usecase for fallback recovery?
If <method> were to fail, I would expect there to be even bigger problems
like kernel crash or unrecoverable hardware failure.

At that point is it worth retrying?

Raag
