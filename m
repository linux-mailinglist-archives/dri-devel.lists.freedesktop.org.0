Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1EE94FFCF
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 10:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD9B10E1BC;
	Tue, 13 Aug 2024 08:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AABL3Y+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9CD10E1BC;
 Tue, 13 Aug 2024 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723537650; x=1755073650;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RyDHZHG1qM+4Ggl8UqXwMYT3dj0QzqQytYDcJf5gWcw=;
 b=AABL3Y+g6WUARhf0QFyO4tiQabJ+vuzdQCFHJa9x63ultWNjVDsysvUq
 JwRK+2kDMcHx1+/ggiZMLDDkSvro9+C9vG8q/FkSutvVI9I+F7hatA3aa
 jP38ftBSAhCIaFHKQ/JGfF0nk7/xn6vlAjnsx/uXIrTSJMmM3RAYHui6S
 FHPJQMsAT5PtcH9V29kbJM3KWZoLKTtlZVnt1M81jPXPAki7rc8RWtA5e
 5SUZJA+US10ceaaYui5fl4n/WldjWQ6ozetFSFsOcJEnKMiaycS6FMLjP
 SGiyQn1R8Yo3BqYo6Gg7j81+jZrX+6IVABS3g6J8FxPbk2UK+EmJwZGJK g==;
X-CSE-ConnectionGUID: XMBJhdC9SiSziC2v3qc13A==
X-CSE-MsgGUID: YHdqdhzISJqcaKbPu6IqWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44206969"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="44206969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 01:27:30 -0700
X-CSE-ConnectionGUID: V9r30wDxRkWwvgSwb20/Qw==
X-CSE-MsgGUID: PUr0OWqzQleZMmjieiro2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63432409"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 01:27:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sdmsE-0000000Eeuo-1cOg; Tue, 13 Aug 2024 11:27:22 +0300
Date: Tue, 13 Aug 2024 11:27:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v5] drm/i915/hwmon: expose fan speed
Message-ID: <ZrsY6tMts81T-uFa@smile.fi.intel.com>
References: <20240812081538.1457396-1-raag.jadav@intel.com>
 <ZroK4oSAte9qdnA8@smile.fi.intel.com>
 <Zrry71BfJ31q3iOi@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zrry71BfJ31q3iOi@black.fi.intel.com>
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

On Tue, Aug 13, 2024 at 08:45:19AM +0300, Raag Jadav wrote:
> On Mon, Aug 12, 2024 at 04:15:14PM +0300, Andy Shevchenko wrote:
> > On Mon, Aug 12, 2024 at 01:45:38PM +0530, Raag Jadav wrote:

...

> > > +static int
> > > +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > > +{
> > > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > > +	struct hwm_fan_info *fi = &ddat->fi;
> > > +	u64 rotations, time_now, time;
> > > +	intel_wakeref_t wakeref;
> > > +	u32 reg_val, pulses;
> > > +	int ret = 0;
> > > +
> > > +	if (attr != hwmon_fan_input)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> > > +	mutex_lock(&hwmon->hwmon_lock);
> > > +
> > > +	reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> > > +	time_now = get_jiffies_64();
> > 
> > > +	/* Handle HW register overflow */
> > > +	if (reg_val >= fi->reg_val_prev)
> > > +		pulses = reg_val - fi->reg_val_prev;
> > > +	else
> > > +		pulses = UINT_MAX - fi->reg_val_prev + reg_val;
> > 
> > Isn't it the abs_diff() reimplementation?
> 
> Not exactly. This is specific to 32 bit register overflow, so we count
> from max value.

I see. But since you have the both variables of u32, why:
1) UINT_MAX?
2) Not simply using

	pulses = reg_val - fi->reg_val_prev;

which will wrap over correctly?

Note, in your case (in comparison to the wrap over variant) the off-by-one is
present. Is it on purpose?

-- 
With Best Regards,
Andy Shevchenko


