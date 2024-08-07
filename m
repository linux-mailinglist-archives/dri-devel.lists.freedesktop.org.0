Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C6194A87E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1825810E51E;
	Wed,  7 Aug 2024 13:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHhiS8PP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC42F10E4FC;
 Wed,  7 Aug 2024 13:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723037077; x=1754573077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x/4yPIAf9q1wfWiVA6KbXYBEOAZjBG33Dys3A3QZTL0=;
 b=nHhiS8PPMxsPwBGwVemlOs8Ku6h4e1yY6iRAqH+gjIaS6XtlGl8wa3UX
 WSDmvoNt/GCkOr0ZyMRQtXx4BcG3sA+rsksCAoyoylJamJZ6eY//bY0cs
 nvxsZMkIi1iAEFgd5H5JgarHBirfS3iU9KtSfVNU9rW9vK7KZstxbwmC0
 eCnMG4R1RFDBSOQUhwkL3S8QyaoHFa892dloIfaI5xPe1uk2I+m316zVc
 ykc2ByGQ2I1mtvDFpJOIo+xsvUeqc6skfPAY/DUFF0M3KCYvpcAzADQI9
 hRzVrfj+xzEUDzHFFdj3LFJXsUr4JC2NRuhRx4jF2JEdMOfXzBUwaOZKy g==;
X-CSE-ConnectionGUID: RRbvFWTRSpWJ8BXSTjZVeg==
X-CSE-MsgGUID: eVEZOpSqQnOqYCPVef/LeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21225701"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="21225701"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:24:37 -0700
X-CSE-ConnectionGUID: OI0ZN9nIR0WBrEAzJjhCuQ==
X-CSE-MsgGUID: aKUXzt+rR32vNNBYELVfPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="56798834"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 intel.com) ([10.245.245.2])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 06:24:31 -0700
Date: Wed, 7 Aug 2024 14:24:27 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com,
 karthik.poosa@intel.com, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v3] drm/i915/hwmon: expose fan speed
Message-ID: <ZrN1i2snlz8tSA1M@ashyti-mobl2.lan>
References: <20240807123018.827506-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807123018.827506-1-raag.jadav@intel.com>
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

Hi Raag,

> +static umode_t
> +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		return i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}

Why do we need switch case here?
Why can't this function become a single "return " line?

> +}
> +
> +static int
> +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_fan_info *fi = &ddat->fi;
> +	u32 reg_val, pulses, time, time_now;
> +	intel_wakeref_t wakeref;
> +	long rotations;
> +	int ret = 0;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref) {
> +			mutex_lock(&hwmon->hwmon_lock);
> +
> +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> +			time_now = jiffies_to_msecs(jiffies);
> +
> +			/* Handle overflow */
> +			if (reg_val >= fi->reg_val_prev)
> +				pulses = reg_val - fi->reg_val_prev;
> +			else
> +				pulses = UINT_MAX - fi->reg_val_prev + reg_val;
> +
> +			/*
> +			 * HW register value is accumulated count of pulses from
> +			 * PWM fan with the scale of 2 pulses per rotation.
> +			 */
> +			rotations = pulses >> 1;
> +			time = time_now - fi->time_prev;
> +
> +			if (unlikely(!time)) {
> +				ret = -EAGAIN;
> +				mutex_unlock(&hwmon->hwmon_lock);
> +				break;
> +			}
> +
> +			/* Convert to minutes for calculating RPM */
> +			*val = DIV_ROUND_UP(rotations * (60 * MSEC_PER_SEC), time);
> +
> +			fi->reg_val_prev = reg_val;
> +			fi->time_prev = time_now;
> +
> +			mutex_unlock(&hwmon->hwmon_lock);
> +		}
> +		return ret;
> +	default:
> +		return -EOPNOTSUPP;
> +	}

same here, can we make this function:

if (attr != hwmon_fan_input)
	return -EOPNOTSUPP;

and then save all the indentation.

Are we expecting more cases here?

Andi
