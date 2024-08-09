Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64594D2B6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 16:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E62610E943;
	Fri,  9 Aug 2024 14:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYTGeDt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013B510E943;
 Fri,  9 Aug 2024 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723215344; x=1754751344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CD71cNIsLw94o+FME/DmfOowqfxC2OXOBO8DMdNGFCY=;
 b=JYTGeDt3Bc97Nk2fihqmcuAddgmToGpihdJKUNrJnfny/tnFt8hh6LAf
 UoyesmYV/pIFSaJCLAwvKojmiABdFxcUeikBL2Ajoz+Raj4QkasD9TzQ+
 XYdPRIGVtLvLV/o0F4ea/2/JsPw9c8Fmmse7s/ypb7uLmy03rDsbkaF4X
 yd3IUIN/3eA7uuMbsD+Q8RR+5uDBKiLHi5AU5AYBqTDvnL3ekXZUnnZk/
 5umX8X5ExA90UZAAv4+BH8L1OKNxk8Qa/tawxtccgyJRAQ/0ZtNrAezIv
 Ir+kZHao6b/2uBJZdQOmd4OO+8842yXRwyxS2bBCf6JAMAuEmyv7ZuVHU Q==;
X-CSE-ConnectionGUID: xYW1JkxbRgyl2xtxl7gTlw==
X-CSE-MsgGUID: VTDZF/b2ShCW3oFUnvZC6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21534202"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21534202"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 07:55:42 -0700
X-CSE-ConnectionGUID: KneSiHdoSViOtNTPGaRvqA==
X-CSE-MsgGUID: yeAlnjLFTHKwsOtoU+l1UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57804712"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 07:55:37 -0700
Date: Fri, 9 Aug 2024 17:55:33 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZrYt5b7Tkl62FRyt@black.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
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

On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:
> > Add hwmon support for fan1_input attribute, which will expose fan speed
> > in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> > 
> > $ sensors
> > i915-pci-0300
> > Adapter: PCI adapter
> > in0:         653.00 mV
> > fan1:        3833 RPM
> > power1:           N/A  (max =  43.00 W)
> > energy1:      32.02 kJ
> 
> > v2:
> > - Add mutex protection
> > - Handle overflow
> > - Add ABI documentation
> > - Aesthetic adjustments (Riana)
> > 
> > v3:
> > - Declare rotations as "long" and drop redundant casting
> > - Change date and version in ABI documentation
> > - Add commenter name in changelog (Riana)
> > 
> > v4:
> > - Fix wakeref leak
> > - Drop switch case and simplify hwm_fan_xx() (Andi)
> 
> I do not understand why we pollute Git history with changelogs, but it's
> probably the ugly atavism in DRM workflow.

Yeah I'm still getting used to it.
Also welcome back, hope it's not a bad start ;)

> ...
> 
> > +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +
> > +	return attr == hwmon_fan_input &&
> > +	       i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
> 
> Not sure why ternary here, it's not well readable in my opinion.
> 
> 	if (attr == hwmon_fan_input && i915_mmio_reg_valid(hwmon->rg.fan_speed))
> 		return 0444;
> 
> 	return 0;
> 
> looks better, no?

Andi had a preference for single return statement.
I'm personally fine with both.

> ...
> 
> > +	/*
> > +	 * HW register value is accumulated count of pulses from
> > +	 * PWM fan with the scale of 2 pulses per rotation.
> > +	 */
> > +	rotations = pulses >> 1;
> 
> In accordance with the comment the
> 
> 	rotations = pulses / 2;
> 
> looks better.
> 
> ...
> 
> (1)
> 
> > +	time = time_now - fi->time_prev;
> > +
> 
> I think location of this blank line is better at (1) above.
> 
> > +	if (unlikely(!time)) {
> > +		ret = -EAGAIN;
> > +		goto exit;
> > +	}

Sure.

> ...
> 
> > +	/* Convert to minutes for calculating RPM */
> > +	*val = DIV_ROUND_UP(rotations * (60 * MSEC_PER_SEC), time);
> 
> Have you considered to keep jiffies in the fi and use something from jiffies.h
> here? To me it feels like we multiply and divide when it can be avoided.
> Please, think about it (I haven't checked myself, just an idea to share).

Will explore.

Raag
