Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA59999F42
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 10:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2703E10EA87;
	Fri, 11 Oct 2024 08:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmmK3wfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141B910EA87;
 Fri, 11 Oct 2024 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728636460; x=1760172460;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2nj39NWEoWIviTYiFxe5RTBXqZ1nw3RnvVjKbtRqWpk=;
 b=OmmK3wfvtASFjT2+/rXc3e/1ZAIHc8bhcLtC3PFSuXLVNJN8cNG+ZZXB
 Nbaz03llFrf/UKObABUOdS7TlNka9FMtZx2lCVNc1Qydd8ij9RdfXRIog
 EcHPhPnBrd+hQkiMjybMHtAaeDIOryqpzmHlcLmC3y2quhJwbKNOBAp6/
 I/PvYW5gB8t+6uFSpN8tjYdncyDbZae+/rF82Bwo3/bkaCxm+gOFkFKhn
 MnYmhZNgnNGxJwyrAdqBRz6+JFs8goAPiHfHPxMpZUjLaZ0t1a3jJ/+u0
 iMXigaJqxMMZKDOUz7Y879umTYFkLq1CEBSLY+r9Puevs3x6PWFzSabmo g==;
X-CSE-ConnectionGUID: bMT37ctjRXCJuFPaLbRgYw==
X-CSE-MsgGUID: XvOJBWMWQjC/J/OCSJozuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27838121"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="27838121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:47:40 -0700
X-CSE-ConnectionGUID: AnQ4uspyTuy6Fs0fH+5acg==
X-CSE-MsgGUID: vqCFHIglQBub6i2f/JPFMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="81644719"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:47:35 -0700
Date: Fri, 11 Oct 2024 11:47:32 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, airlied@gmail.com,
 simona@ffwll.ch, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZwjmJFaK1FYVK7TK@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <26f90d12-6a04-445e-96ff-aafbe3dc8132@intel.com>
 <Zv6Ms7G4pSLdgUKo@black.fi.intel.com>
 <ZwVJk8ESEyxyemrG@black.fi.intel.com>
 <ghawgrgfbochcupnbq52q4ep6l5rfj32i4wcnmykah3zxmehts@r5eaynm4vocf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ghawgrgfbochcupnbq52q4ep6l5rfj32i4wcnmykah3zxmehts@r5eaynm4vocf>
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

On Thu, Oct 10, 2024 at 08:02:10AM -0500, Lucas De Marchi wrote:
> On Tue, Oct 08, 2024 at 06:02:43PM +0300, Raag Jadav wrote:
> > On Thu, Oct 03, 2024 at 03:23:22PM +0300, Raag Jadav wrote:
> > > On Tue, Oct 01, 2024 at 02:20:29PM +0200, Michal Wajdeczko wrote:
> > > > On 30.09.2024 09:38, Raag Jadav wrote:
> > > > >
> > > > > +/**
> > > > > + * enum drm_wedge_recovery - Recovery method for wedged device in order of
> > > > > + * severity. To be set as bit fields in drm_device.wedge_recovery variable.
> > > > > + * Drivers can choose to support any one or multiple of them depending on
> > > > > + * their needs.
> > > > > + */
> > > > > +enum drm_wedge_recovery {
> > > > > +	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
> > > > > +	DRM_WEDGE_RECOVERY_REBIND,
> > > > > +
> > > > > +	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
> > > > > +	DRM_WEDGE_RECOVERY_BUS_RESET,
> > > > > +
> > > > > +	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
> > > > > +	DRM_WEDGE_RECOVERY_REBOOT,
> > > > > +
> > > > > +	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
> > > > > +	DRM_WEDGE_RECOVERY_MAX
> > > > > +};
> > > > > +
> > > > >  /**
> > > > >   * struct drm_device - DRM device structure
> > > > >   *
> > > > > @@ -317,6 +337,9 @@ struct drm_device {
> > > > >  	 * Root directory for debugfs files.
> > > > >  	 */
> > > > >  	struct dentry *debugfs_root;
> > > > > +
> > > > > +	/** @wedge_recovery: Supported recovery methods for wedged device */
> > > > > +	unsigned long wedge_recovery;
> > > >
> > > > hmm, so before the driver can ask for a reboot as a recovery method from
> > > > wedge it has to somehow add 'reboot' as available method? why it that?
> > > 
> > > It's for consumers to use as fallbacks in case the preferred recovery method
> > > (sent along with uevent) don't workout. (patch 2/5)
> > 
> > On second thought...
> > 
> > Lucas, do we have a convincing enough usecase for fallback recovery?
> > If <method> were to fail, I would expect there to be even bigger problems
> > like kernel crash or unrecoverable hardware failure.
> > 
> > At that point is it worth retrying?
> 
> when we were talking about this, I brought it up about allowing the
> driver to inform what was the supported wedge recovery mechanisms
> when the notification is sent. Not to be intended as fallback mechanism.
> 
> So if the driver sends a notification with:
> 
> 	DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET | DRM_WEDGE_RECOVERY_REBOOT
> 
> it means any of these would be suitable, with the first being the option
> with less side-effect. I don't think we are advising userspace to use
> fallback, just informing what the driver/device supports. Depending on
> the error, the driver may leave only
> 
> 	DRM_WEDGE_RECOVERY_REBOOT
> 
> That name could actually be DRM_WEDGE_RECOVERY_NONE. Because at that
> state the driver doesn't really know what can be done to recover.
> With that we can drop _MAX and use _NONE for bounding check. I think
> we can also omit it in the notification as it's clear:
> 
> 	WEDGED
> 	DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET
> 
> This means the driver can use any of these options to recover
> 
> 	WEDGED
> 	DRM_WEDGE_RECOVERY_BUS_RESET
> 
> only bus reset would fix it
> 
> 	WEDGED
> 	
> driver doesn't know anything that could fix it. It may be a soft-reboot,
> hard-reboot, firmware flashing etc... We just don't know.

With this I think we can drop sysfs.
(Already too many ABIs to deal with)

Raag
