Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CD194EDD3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 15:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B13310E1F8;
	Mon, 12 Aug 2024 13:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZKqyhQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2F310E1FC;
 Mon, 12 Aug 2024 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723468521; x=1755004521;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mw28CMZsCYEDai4Uy7oNYa4fhqfTA0xHHE6WVcjY/I0=;
 b=XZKqyhQKzwQb0OGAsqb0FUER3Et5BFufCs1OxqoVmAxv8x56fPVLXla4
 h7dqd/OdV2b2O4tKwzPw1JL64+yooufPJwiSvcay/3a0JdDS8+f/s83kr
 C48PJhIO8834198GCH7/01t9FAZl2Oyj9nZxKJPk1ESbRE3Nak2AGjb/l
 4+8EAF7ifoTCnqz425IjD2R0r1akG+EfqAU9o0bUHVkZg31Zw+womXgQX
 4hgXxkSTeHP0rRadGZfjmINyoOp5DryOMLKY5yMi0a+ifCwckfBU37Ijg
 lKciImPKWhCBz+4d7YDaiffYBqA8g1UbkWkm5CPfnFJ46fLN9tyk1uVg/ w==;
X-CSE-ConnectionGUID: pXXwfpe6QPyG04ebyES5mQ==
X-CSE-MsgGUID: U1K3CysRSZu5L2lJsAucVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="12963663"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="12963663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 06:15:20 -0700
X-CSE-ConnectionGUID: XLaW1EqfSKeEXNJ7CNVLng==
X-CSE-MsgGUID: ZxUZsq4MRcKzL5iRWLRWJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="62393301"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 06:15:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sdUtG-0000000EM1E-1ASo; Mon, 12 Aug 2024 16:15:14 +0300
Date: Mon, 12 Aug 2024 16:15:14 +0300
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
Message-ID: <ZroK4oSAte9qdnA8@smile.fi.intel.com>
References: <20240812081538.1457396-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812081538.1457396-1-raag.jadav@intel.com>
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

On Mon, Aug 12, 2024 at 01:45:38PM +0530, Raag Jadav wrote:
> Add hwmon support for fan1_input attribute, which will expose fan speed
> in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> 
> $ sensors
> i915-pci-0300
> Adapter: PCI adapter
> in0:         653.00 mV
> fan1:        3833 RPM
> power1:           N/A  (max =  43.00 W)
> energy1:      32.02 kJ

...

> +static int
> +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_fan_info *fi = &ddat->fi;
> +	u64 rotations, time_now, time;
> +	intel_wakeref_t wakeref;
> +	u32 reg_val, pulses;
> +	int ret = 0;
> +
> +	if (attr != hwmon_fan_input)
> +		return -EOPNOTSUPP;
> +
> +	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> +	time_now = get_jiffies_64();

> +	/* Handle HW register overflow */
> +	if (reg_val >= fi->reg_val_prev)
> +		pulses = reg_val - fi->reg_val_prev;
> +	else
> +		pulses = UINT_MAX - fi->reg_val_prev + reg_val;

Isn't it the abs_diff() reimplementation?

> +	/*
> +	 * HW register value is accumulated count of pulses from
> +	 * PWM fan with the scale of 2 pulses per rotation.
> +	 */
> +	rotations = pulses / 2;
> +
> +	time = jiffies_delta_to_msecs(time_now - fi->time_prev);
> +	if (unlikely(!time)) {
> +		ret = -EAGAIN;
> +		goto exit;
> +	}
> +
> +	/*
> +	 * Convert to minutes for calculating RPM.
> +	 * RPM = number of rotations * msecs per minute / time in msecs
> +	 */
> +	*val = DIV_ROUND_UP(rotations * (MSEC_PER_SEC * 60), time);
> +
> +	fi->reg_val_prev = reg_val;
> +	fi->time_prev = time_now;
> +exit:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
> +	return ret;
> +}


-- 
With Best Regards,
Andy Shevchenko


