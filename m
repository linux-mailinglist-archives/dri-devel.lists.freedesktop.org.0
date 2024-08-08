Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333694B5F6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 06:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D1C10E0CC;
	Thu,  8 Aug 2024 04:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hje+ZgCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF5D10E0CC;
 Thu,  8 Aug 2024 04:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723092179; x=1754628179;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4syzyV6hdGjV22Hiflj6sEtCj534I2q+jdzZRjAGewU=;
 b=hje+ZgCy0xygrnTQg5A3S9mGBcXKlDF/RvtZfaTlX2XYMShHcwF9Auq8
 IrxiCb18vFcFMQwACv6a2FSnPKIxB7MpVtqxdSsC6mlZJabGZNfck7Mi9
 KAymtDQ7MJ1MSoVGOra4CuhNS2cMcBKjGQxqhoRXW/4hi23wkzmtA6y/R
 z26zetP7rz17qVF99ppS5SlsGbmP2nUiecvGuAl7qRlky7Pj6T+oQsCvw
 VOJIfTy03pBsIk1esd7zTHbWk/1O8pCloVQ/SChgZG6qY1YM+yFTQwToc
 8ygEKOdkq1MpuHIwrjUDqctkF1ka4JzMiaiVgbOdeRF8XPi8mAj3qnmrz A==;
X-CSE-ConnectionGUID: ZHlkCxONR5CM2MPm7i0cRw==
X-CSE-MsgGUID: D1qlO6BXQkOfsm3zhr1/JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31867210"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31867210"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 21:42:57 -0700
X-CSE-ConnectionGUID: KXtIwPg7SaG4OrINrtmQ+Q==
X-CSE-MsgGUID: BT2jfhRmQaSIW27BmDM3lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61203255"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 21:42:54 -0700
Date: Thu, 8 Aug 2024 07:42:51 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com,
 karthik.poosa@intel.com, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v3] drm/i915/hwmon: expose fan speed
Message-ID: <ZrRMyzUfNdjyL1y6@black.fi.intel.com>
References: <20240807123018.827506-1-raag.jadav@intel.com>
 <ZrN1i2snlz8tSA1M@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrN1i2snlz8tSA1M@ashyti-mobl2.lan>
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

On Wed, Aug 07, 2024 at 02:24:27PM +0100, Andi Shyti wrote:
> Hi Raag,
> 
> > +static umode_t
> > +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +
> > +	switch (attr) {
> > +	case hwmon_fan_input:
> > +		return i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
> > +	default:
> > +		return 0;
> > +	}
> 
> Why do we need switch case here?

Just following the file conventions.

> Why can't this function become a single "return " line?
> 
> > +}
> > +
> > +static int
> > +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +	struct hwm_fan_info *fi = &ddat->fi;
> > +	u32 reg_val, pulses, time, time_now;
> > +	intel_wakeref_t wakeref;
> > +	long rotations;
> > +	int ret = 0;
> > +
> > +	switch (attr) {
> > +	case hwmon_fan_input:
> > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref) {
> > +			mutex_lock(&hwmon->hwmon_lock);
> > +
> > +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
> > +			time_now = jiffies_to_msecs(jiffies);
> > +
> > +			/* Handle overflow */
> > +			if (reg_val >= fi->reg_val_prev)
> > +				pulses = reg_val - fi->reg_val_prev;
> > +			else
> > +				pulses = UINT_MAX - fi->reg_val_prev + reg_val;
> > +
> > +			/*
> > +			 * HW register value is accumulated count of pulses from
> > +			 * PWM fan with the scale of 2 pulses per rotation.
> > +			 */
> > +			rotations = pulses >> 1;
> > +			time = time_now - fi->time_prev;
> > +
> > +			if (unlikely(!time)) {
> > +				ret = -EAGAIN;
> > +				mutex_unlock(&hwmon->hwmon_lock);
> > +				break;
> > +			}
> > +
> > +			/* Convert to minutes for calculating RPM */
> > +			*val = DIV_ROUND_UP(rotations * (60 * MSEC_PER_SEC), time);
> > +
> > +			fi->reg_val_prev = reg_val;
> > +			fi->time_prev = time_now;
> > +
> > +			mutex_unlock(&hwmon->hwmon_lock);
> > +		}
> > +		return ret;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> 
> same here, can we make this function:
> 
> if (attr != hwmon_fan_input)
> 	return -EOPNOTSUPP;
> 
> and then save all the indentation.

Makes sense for hwm_fan_read(). Let me try this.

> Are we expecting more cases here?

Not for now.

Raag
