Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD64950405
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 13:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348BA10E316;
	Tue, 13 Aug 2024 11:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnMLezDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123F610E2FE;
 Tue, 13 Aug 2024 11:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723549655; x=1755085655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G3pOGZVBqXB7sYa2biEjElbdDn1qcCVetk8yRjFI7VY=;
 b=EnMLezDqBNHPWTSdYnU33I/gWqbZeP3sN7Q8m0KHQ16ku9RLPuheaWIl
 hYwRNcAuCktYwr8cWFeXP8dX4pvBkO54iawqae3d3ObTjHPeN0zyMl/+n
 IGjbd6VdOU0HbyPs2ClowqYtYzvqdxLyQnBflE2wla4gH5KcIf9KpAnAQ
 PqdfsEz63IaeENuefBdaHU0+K+XLzx8AoY2Ihy2BUxYAUs23tMpHBwJRX
 CPOuj6T77DO8O05F+ptku4Bhbkx3txC7RaVpd61MvnknU6Vqd8oVMOA7Y
 jBUb1QhQTR53E1BtOJL8iYjpquCOdcJZfMhwWkIFfobSKp1N7pJv9Ve+Y g==;
X-CSE-ConnectionGUID: 0CD5jzHjQk2Ok8xr0hmO7w==
X-CSE-MsgGUID: x6ZQzdDYShuGa9XIEPrOpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21523384"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21523384"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 04:47:35 -0700
X-CSE-ConnectionGUID: VQZ2r7WpSwadk3elOT4wXg==
X-CSE-MsgGUID: EAyy5BgcTr6dvpG+kQFuLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63038013"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 04:47:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sdpzs-0000000EiH4-0Rht; Tue, 13 Aug 2024 14:47:28 +0300
Date: Tue, 13 Aug 2024 14:47:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZrtHz1aY_Lf_XIsL@smile.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
 <ZrtCIU8On4ZKILmh@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrtCIU8On4ZKILmh@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Aug 13, 2024 at 02:23:13PM +0300, Raag Jadav wrote:
> On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:
> > On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:

...

> > > +	/*
> > > +	 * HW register value is accumulated count of pulses from
> > > +	 * PWM fan with the scale of 2 pulses per rotation.
> > > +	 */
> > > +	rotations = pulses >> 1;
> > 
> > In accordance with the comment the
> > 
> > 	rotations = pulses / 2;
> > 
> > looks better.
> 
> This change seems to cause a build error in v5.
> Something to do with __udivdi3 on i386.

No, it's not this change.
Please, read report carefully.

-- 
With Best Regards,
Andy Shevchenko


