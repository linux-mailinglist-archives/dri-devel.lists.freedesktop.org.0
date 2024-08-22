Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEEF95B69A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA1210EA9B;
	Thu, 22 Aug 2024 13:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLBCrCII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753A710EA9B;
 Thu, 22 Aug 2024 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724333310; x=1755869310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9N41foLL/2Pxt3ECs2i8yc04fwv+tCy+a3YYGiA2Rlk=;
 b=cLBCrCIIR8D/Wxec1HA22z56hZvNnmy/0CQwrEVs7vdls9Y4RPmlTbXV
 UGoBw7RP+dM8B/H03XlXDVgITQuGms/BGQ66uGDCX/g59BhBq0p+6YMTp
 +e7uNzeeE+dQe9Y1mkyn1kczkSKcBzT6hc8OS5UD+wW2bSzc8hGeCLm92
 t8+sjfbiSVQSGG6UgYCLSi9YxQ+ZPgG59ADi/kcZagrJWkygaqxLWqwXW
 +5nt1xK/tmYd84SaFvYpy+CfY+D9kCAXufOc1976cVkcbvFxsVzwgHzdI
 qVHvApizENEKEoy+wVPnj50mRJLDztfwANDX0ckGUfuS95yrBbhB1qQmV Q==;
X-CSE-ConnectionGUID: bIVjSs9dQOmbiUnHIlunkg==
X-CSE-MsgGUID: SxXkdZzxRAudaYSemGnKcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22614777"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22614777"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:28:29 -0700
X-CSE-ConnectionGUID: DuVE3U6PRY6uJ/HMWnMkcw==
X-CSE-MsgGUID: GGD5zlrgRBqouPAqROU2Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61596851"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:28:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sh7rQ-00000000Snz-2X7J; Thu, 22 Aug 2024 16:28:20 +0300
Date: Thu, 22 Aug 2024 16:28:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v6] drm/i915/hwmon: expose fan speed
Message-ID: <Zsc85iQIBpOPJOKp@smile.fi.intel.com>
References: <20240820062010.2000873-1-raag.jadav@intel.com>
 <ZsRup8uKiqUvADFl@smile.fi.intel.com>
 <ZsSWTtew8nCYWrxF@black.fi.intel.com>
 <ZsSi73YyfKletmgk@smile.fi.intel.com>
 <ZsbophGauSzh15lz@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsbophGauSzh15lz@black.fi.intel.com>
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

On Thu, Aug 22, 2024 at 10:28:38AM +0300, Raag Jadav wrote:
> On Tue, Aug 20, 2024 at 05:06:39PM +0300, Andy Shevchenko wrote:
> > On Tue, Aug 20, 2024 at 04:12:46PM +0300, Raag Jadav wrote:
> > > On Tue, Aug 20, 2024 at 01:23:35PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Aug 20, 2024 at 11:50:10AM +0530, Raag Jadav wrote:
> > > > 
> > > > But it still has an issue with 64-bit division on 32-bit platforms, right?
> > > > 
> > > > > +	/*
> > > > > +	 * Calculate fan speed in RPM by time averaging two subsequent
> > > > > +	 * readings in minutes.
> > > > > +	 * RPM = number of rotations * msecs per minute / time in msecs
> > > > > +	 */
> > > > > +	*val = DIV_ROUND_UP(rotations * (MSEC_PER_SEC * 60), time);
> > > > 
> > > > ...somewhere here?
> > > 
> > > Use div64_u64() instead? Or is there a better alternative?
> > 
> > I don't know the code well to offer anything better. Probably for a starter
> > you can switch to use DIV_ROUND_UP_ULL().
> 
> This one seems to work. Does it warrant an explanation here?

You mean _ULL part? No.

-- 
With Best Regards,
Andy Shevchenko


