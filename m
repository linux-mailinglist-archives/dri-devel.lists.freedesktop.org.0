Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B441F97ED39
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 16:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD1010E409;
	Mon, 23 Sep 2024 14:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwOFHZYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6E810E26D;
 Mon, 23 Sep 2024 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727102141; x=1758638141;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VBUgLTShHn7RoGyOzmsltQFhRb+Mo7+Qxel6tPi+m20=;
 b=TwOFHZYhUe+N1+gcSRw/LSWNMtG7ryv8QjK/Gla7sESuFldxjaivZHBB
 1W478yWa+2qEHicPNNs8gl2zK7NG1NZGuGqOel69wJieM9oZyy66RQQIL
 K2KDLum/PL6/xr5qIjtajObMndz2qybE5syWkv3yUxJXsrLRJHEyejQft
 I5kSOjon9aZGMck3fTCH7K+JdBJ1rYkN9SZ+LPwibaGh+xkpct14wn8MO
 Je1yReyjjsQN0KKUlnuFLUxC6/vRC/251A+umMTexMjRvyCYLEaGS/K6u
 8jHn+G1MNLt1l5nQVS5jy4CHTz5uazfAw8O709QXY50tSmPKYuUCwVdsu Q==;
X-CSE-ConnectionGUID: uueNYsuORpKgCw2wAseEBQ==
X-CSE-MsgGUID: Ikd01jQpQCuMGCb0a1aBig==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43568371"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="43568371"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 07:35:31 -0700
X-CSE-ConnectionGUID: lBJ1BNJgRLWGlR5Pr3zNbg==
X-CSE-MsgGUID: YwEBrzmpQr+zZ75abnQdBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="108522524"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 07:35:26 -0700
Date: Mon, 23 Sep 2024 17:35:23 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v6 1/4] drm: Introduce device wedged event
Message-ID: <ZvF8q7xkbEegPzc9@black.fi.intel.com>
References: <20240923035826.624196-1-raag.jadav@intel.com>
 <20240923035826.624196-2-raag.jadav@intel.com>
 <ZvEpH_po4bYmEISh@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvEpH_po4bYmEISh@smile.fi.intel.com>
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

On Mon, Sep 23, 2024 at 11:38:55AM +0300, Andy Shevchenko wrote:
> On Mon, Sep 23, 2024 at 09:28:23AM +0530, Raag Jadav wrote:
> > Introduce device wedged event, which will notify userspace of wedged
> > (hanged/unusable) state of the DRM device through a uevent. This is
> > useful especially in cases where the device is no longer operating as
> > expected and has become unrecoverable from driver context.
> > 
> > Purpose of this implementation is to provide drivers a way to recover
> > through userspace intervention. Different drivers may have different
> > ideas of a "wedged device" depending on their hardware implementation,
> > and hence the vendor agnostic nature of the event. It is up to the drivers
> > to decide when they see the need for recovery and how they want to recover
> > from the available methods.
> > 
> > Current implementation defines three recovery methods, out of which,
> > drivers can choose to support any one or multiple of them. Preferred
> > recovery method will be sent in the uevent environment as WEDGED=<method>.
> > Userspace consumers (sysadmin) can define udev rules to parse this event
> > and take respective action to recover the device.
> > 
> >  Method    | Consumer expectations
> > -----------|-----------------------------------
> >  rebind    | unbind + rebind driver
> >  bus-reset | unbind + reset bus device + rebind
> >  reboot    | reboot system
> 
> > v4: s/drm_dev_wedged/drm_dev_wedged_event
> >     Use drm_info() (Jani)
> >     Kernel doc adjustment (Aravind)
> > v5: Send recovery method with uevent (Lina)
> > v6: Access wedge_recovery_opts[] using helper function (Jani)
> >     Use snprintf() (Jani)
> 
> Hmm... Isn't changelog in the cover letter is not enough?

Which was initial thought but I'm told otherwise ¯\_(ツ)_/¯

> ...
> 
> > +extern const char *const wedge_recovery_opts[];
> 
> It's not NULL terminated. How users will know that they have an index valid?

It's expected to be accessed using recovery_*() helpers.
 
> Either you NULL-terminate that, or export the size as well (personally I would
> go with the first approach).
> 
> ...
> 
> > +static inline bool recovery_method_is_valid(enum wedge_recovery_method method)
> > +{
> > +	if (method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX)
> > +		return true;
> > +
> > +	return false;
> 
> Besides that this can be written as
> 
> 	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;
> 
> > +}
> 
> this seems a runtime approach for what we have at compile-time, i.e. static_assert()

My understanding is that we have runtime users that the compiler may not be
able to resolve.

Raag
