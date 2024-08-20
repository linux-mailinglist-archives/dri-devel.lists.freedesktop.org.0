Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D1958883
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 16:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5370F10E128;
	Tue, 20 Aug 2024 14:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJAbToZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E30A10E092;
 Tue, 20 Aug 2024 14:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724162808; x=1755698808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MrJaVukCblbAF5beCEIvjekC35gWWd06PuqyDAECCUg=;
 b=YJAbToZeQOxGr5AWIF5Ht+I8HyBM/z4/JMlE6gzof7R+LrLJcDiAlmB/
 GJRLirOa3awiUS5PKusrUmVT9j+32sC0b7g0sUpZ4PM7FpYuznoO2E1WQ
 hWdd6UuD9hzDqxPjit6Wlek3M7B4WBQZICfYNKD0e0QaTd2shhCgCOUog
 OzW22mCBfBrp+F+Eyd/Y3SqHspWM6k4l5KSWZDa751GJTzXAaJh5o/h2v
 qRp+iT5LfwdVPY2FLyj3IZQlK0lq7O1aSTXGZVSxlhScvNn00r8mMq+Wc
 Voug3zgTCrzoPZDQxoHzEwja4tKfG07WvpAAZfSWhoPRQ76+aW53xrBfF A==;
X-CSE-ConnectionGUID: T7TOmIzER+CWOPhXJhOiIw==
X-CSE-MsgGUID: s+YCOvn0TtadbaMDtbVD9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22271127"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22271127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 07:06:48 -0700
X-CSE-ConnectionGUID: J7DTI9/XSIq/QAtQsPVswQ==
X-CSE-MsgGUID: 0ny/ekFmTUmrK9wF7VudZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65610152"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 07:06:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sgPVQ-0000000HKD3-0nFm; Tue, 20 Aug 2024 17:06:40 +0300
Date: Tue, 20 Aug 2024 17:06:39 +0300
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
Message-ID: <ZsSi73YyfKletmgk@smile.fi.intel.com>
References: <20240820062010.2000873-1-raag.jadav@intel.com>
 <ZsRup8uKiqUvADFl@smile.fi.intel.com>
 <ZsSWTtew8nCYWrxF@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsSWTtew8nCYWrxF@black.fi.intel.com>
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

On Tue, Aug 20, 2024 at 04:12:46PM +0300, Raag Jadav wrote:
> On Tue, Aug 20, 2024 at 01:23:35PM +0300, Andy Shevchenko wrote:
> > On Tue, Aug 20, 2024 at 11:50:10AM +0530, Raag Jadav wrote:

...

> > > v6: Drop overflow logic (Andy)
> > >     Aesthetic adjustments (Badal)
> > 
> > But it still has an issue with 64-bit division on 32-bit platforms, right?

...

> > > +	/*
> > > +	 * Calculate fan speed in RPM by time averaging two subsequent
> > > +	 * readings in minutes.
> > > +	 * RPM = number of rotations * msecs per minute / time in msecs
> > > +	 */
> > > +	*val = DIV_ROUND_UP(rotations * (MSEC_PER_SEC * 60), time);
> > 
> > ...somewhere here?
> 
> Use div64_u64() instead? Or is there a better alternative?

I don't know the code well to offer anything better. Probably for a starter
you can switch to use DIV_ROUND_UP_ULL().

-- 
With Best Regards,
Andy Shevchenko


