Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FC494FD62
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 07:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1385510E294;
	Tue, 13 Aug 2024 05:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBBBzPNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8839010E294;
 Tue, 13 Aug 2024 05:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723527928; x=1755063928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YwpuBVSFNyDvfJmlX29Z5q0LHVN5p+qw1by/SJOWLDk=;
 b=IBBBzPNmfKJfeSmquIWfuEhWAp9gNHVBpGccp2ZbodAyR05Z7wSXgLt+
 9j8QwioHk6/TDOPIy6+k8SgO8nnXtHk1rP1AkHM3wG8gLK+gQWXW2iwwN
 sBsXCIyLpSukoHI5u6Qjb46xiA1QYfk4h22XGRj5fx2K6jmBdmXO1fGv0
 pAdNjrXmYbf9zysnDG9juPUFTOl3VYCWsGxkhRJmDUaxGblwR+bmpxYdX
 fa+kd9OG64w/PBdkAWUx6ZIGjUrHPQYPJ7+Vk54VAgNZfyZq2UHQrA8fh
 Gw5WuglU9zgrtmAiXqf66dTM3LIDizS5eLXC3sP9bJ/DalKqK54ocwDVI Q==;
X-CSE-ConnectionGUID: tZsEBqaETGey7Ho7PODEcA==
X-CSE-MsgGUID: oWSZpQQpTQWj/RUgQvIqSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21538927"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21538927"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:45:27 -0700
X-CSE-ConnectionGUID: c9dFyZmbSLqazA9E/vH8Og==
X-CSE-MsgGUID: oXlUV/1dR6SazqjesTO58g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="81776598"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:45:22 -0700
Date: Tue, 13 Aug 2024 08:45:19 +0300
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
Message-ID: <Zrry71BfJ31q3iOi@black.fi.intel.com>
References: <20240812081538.1457396-1-raag.jadav@intel.com>
 <ZroK4oSAte9qdnA8@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZroK4oSAte9qdnA8@smile.fi.intel.com>
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

On Mon, Aug 12, 2024 at 04:15:14PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 12, 2024 at 01:45:38PM +0530, Raag Jadav wrote:
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
> ...
> 
> > +static int
> > +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +	struct hwm_fan_info *fi = &ddat->fi;
> > +	u64 rotations, time_now, time;
> > +	intel_wakeref_t wakeref;
> > +	u32 reg_val, pulses;
> > +	int ret = 0;
> > +
> > +	if (attr != hwmon_fan_input)
> > +		return -EOPNOTSUPP;
> > +
> > +	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> > +	mutex_lock(&hwmon->hwmon_lock);
> > +
> > +	reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> > +	time_now = get_jiffies_64();
> 
> > +	/* Handle HW register overflow */
> > +	if (reg_val >= fi->reg_val_prev)
> > +		pulses = reg_val - fi->reg_val_prev;
> > +	else
> > +		pulses = UINT_MAX - fi->reg_val_prev + reg_val;
> 
> Isn't it the abs_diff() reimplementation?

Not exactly. This is specific to 32 bit register overflow, so we count
from max value.

Raag
