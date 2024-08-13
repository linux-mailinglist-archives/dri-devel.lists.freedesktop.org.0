Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995E9501E4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FBF10E2D7;
	Tue, 13 Aug 2024 10:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9QwbK0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CBD10E2D8;
 Tue, 13 Aug 2024 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723543390; x=1755079390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uAMAIU2rNUtIJG4IQj+VwcR3lSGm3E5jiddPfvFc3lg=;
 b=B9QwbK0Vo8H7ah53w8OQshTXjTweVxqVgxO0WyzBRIrJxgRt3eN2hZOm
 VSb1wfIW8Z68KsJaDwkEQNgtm0gi+E6KHUCAsm6n10MIblvKZ+rBgFGfn
 qK4V5dedCfzBJo7X22oNbcj4KYe5eE74d0nykpCDJ9cEG37zNrpoiPtCo
 e5jjnh/2/MmmJ/LGmoez87rJ7jhxt3icXPe0RzmwEG0MTfs1906dH9pAi
 52lJrt3xBI5I0U9A9l1MPlYTifnF+3IgMXJkdHpTjcoJjQlC1pkWXrBiW
 VY78I+k1cRFrZcmcZfkt/MON8RH3/sPExlvVLJTeCeQG83aP5KSIw1EkI Q==;
X-CSE-ConnectionGUID: rh+DKyHORKGzEoC5HEkxfg==
X-CSE-MsgGUID: ZmgVLnyMTqinRUyRQjBb/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32268462"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="32268462"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:03:10 -0700
X-CSE-ConnectionGUID: iurrRxMEQbK0kZEmRhUkJA==
X-CSE-MsgGUID: uNIHJ3wGS22d1YRrHibNDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="59184596"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:03:06 -0700
Date: Tue, 13 Aug 2024 13:03:01 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v5] drm/i915/hwmon: expose fan speed
Message-ID: <ZrsvVSu8rdNYfsSo@black.fi.intel.com>
References: <20240812081538.1457396-1-raag.jadav@intel.com>
 <ZroK4oSAte9qdnA8@smile.fi.intel.com>
 <Zrry71BfJ31q3iOi@black.fi.intel.com>
 <ZrsY6tMts81T-uFa@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrsY6tMts81T-uFa@smile.fi.intel.com>
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

On Tue, Aug 13, 2024 at 11:27:22AM +0300, Andy Shevchenko wrote:
> On Tue, Aug 13, 2024 at 08:45:19AM +0300, Raag Jadav wrote:
> > On Mon, Aug 12, 2024 at 04:15:14PM +0300, Andy Shevchenko wrote:
> > > On Mon, Aug 12, 2024 at 01:45:38PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > > +static int
> > > > +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > > > +{
> > > > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > > > +	struct hwm_fan_info *fi = &ddat->fi;
> > > > +	u64 rotations, time_now, time;
> > > > +	intel_wakeref_t wakeref;
> > > > +	u32 reg_val, pulses;
> > > > +	int ret = 0;
> > > > +
> > > > +	if (attr != hwmon_fan_input)
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > > +	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> > > > +	mutex_lock(&hwmon->hwmon_lock);
> > > > +
> > > > +	reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> > > > +	time_now = get_jiffies_64();
> > > 
> > > > +	/* Handle HW register overflow */
> > > > +	if (reg_val >= fi->reg_val_prev)
> > > > +		pulses = reg_val - fi->reg_val_prev;
> > > > +	else
> > > > +		pulses = UINT_MAX - fi->reg_val_prev + reg_val;
> > > 
> > > Isn't it the abs_diff() reimplementation?
> > 
> > Not exactly. This is specific to 32 bit register overflow, so we count
> > from max value.
> 
> I see. But since you have the both variables of u32, why:
> 1) UINT_MAX?
> 2) Not simply using
> 
> 	pulses = reg_val - fi->reg_val_prev;
> 
> which will wrap over correctly?

Agree. Will update.

Raag
