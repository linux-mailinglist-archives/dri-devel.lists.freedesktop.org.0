Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5009973CB3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47F410E86A;
	Tue, 10 Sep 2024 15:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZ2Dfh7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCC810E0FA;
 Tue, 10 Sep 2024 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725983353; x=1757519353;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tXfZjIelOoATVNRuNd2M0e7G5jk07wceckIyCC+aQBQ=;
 b=KZ2Dfh7uJh0ET76KFTLpB5Ls4gMQT6Dfj5fIcdUDf5lqmlvf2AALfjP6
 xP+A+4CFPZxXkNxFgPcMHhEK49zBG1Jk9ASYZnHVH8tc6jaRokvU5Rh5v
 /XsP7DAVvpWqFR4GEG3bFAPsshrJBSOWYlr3KQFvRpkU77rWIp0oWSgek
 WfAHHz2QITV01R1kuvHLHehSowGkRdCydIzHdwtDKLNEyFrglt1TB9QM4
 hN+4G8k9T/LsvzrasyaiRHYCUoHQO8jDbaWy5H4pGE6Ercd1RNRYyCRlP
 YdULvGfhVfLDHnHgBhs4yezbeXbSYYVILVMYf7z11PwUhaeAK23IBxnap w==;
X-CSE-ConnectionGUID: rB3xF2XiQxiw8A0xqNKoZA==
X-CSE-MsgGUID: TycIBNApTb+c+TE3OoCoRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24882976"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24882976"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:49:08 -0700
X-CSE-ConnectionGUID: H7SzwbTlRCOeZTMc2fExpw==
X-CSE-MsgGUID: lIwTWrPDT3+N2TflfhFYPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="71860233"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:49:04 -0700
Date: Tue, 10 Sep 2024 18:49:00 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com
Subject: Re: [PATCH v4 1/3] drm: Introduce device wedged event
Message-ID: <ZuBqbFA8_d0khPCY@black.fi.intel.com>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
 <20240906094225.3082162-2-raag.jadav@intel.com>
 <20240909215323.GC5774@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909215323.GC5774@mdroper-desk1.amr.corp.intel.com>
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

On Mon, Sep 09, 2024 at 02:53:23PM -0700, Matt Roper wrote:
> On Fri, Sep 06, 2024 at 03:12:23PM +0530, Raag Jadav wrote:
> > Introduce device wedged event, which will notify userspace of wedged
> > (hanged/unusable) state of the DRM device through a uevent. This is
> > useful especially in cases where the device is in unrecoverable state
> > and requires userspace intervention for recovery.
> > 
> > Purpose of this implementation is to be vendor agnostic. Userspace
> > consumers (sysadmin) can define udev rules to parse this event and
> > take respective action to recover the device.
> > 
> > Consumer expectations:
> > ----------------------
> > 1) Unbind driver
> > 2) Reset bus device
> > 3) Re-bind driver
> > 
> > v4: s/drm_dev_wedged/drm_dev_wedged_event
> >     Use drm_info() (Jani)
> >     Kernel doc adjustment (Aravind)
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c | 20 ++++++++++++++++++++
> >  include/drm/drm_drv.h     |  1 +
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 93543071a500..cca5d8295eb7 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -499,6 +499,26 @@ void drm_dev_unplug(struct drm_device *dev)
> >  }
> >  EXPORT_SYMBOL(drm_dev_unplug);
> >  
> > +/**
> > + * drm_dev_wedged_event - generate a device wedged uevent
> > + * @dev: DRM device
> > + *
> > + * This generates a device wedged uevent for the DRM device specified by @dev,
> > + * on the basis of which, userspace may take respective action to recover the
> > + * device. Currently we only set WEDGED=1 in the uevent environment, but this
> > + * can be expanded in the future.
> 
> Just to clarify, is "wedged" intended to always mean "the entire device
> is unusable" or are there cases where it would also get sent if only
> part of the device is in a bad state?  For example, using i915/Xe
> terminology, maybe the GT is dead but display is still working.  Or one
> GT is dead, but another is still alive.

The idea is to provide drivers a way to recover through userspace intervention.
It is upto the drivers to decide when they see the need for recovery and how
they want to recover.

> Basically, is this event intended as a signal that userspace should stop
> trying to do _anything_ with the device, or just that the device has
> degraded functionality in some way (and maybe userspace can still do
> something useful if it's lucky)?  It would be good to clarify that in
> the docs here in case different drivers have different ideas about how
> this is expected to work.

And hence the open discussion. Improvements are welcome :)

Raag
