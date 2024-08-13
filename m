Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA3194FDD7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 08:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A23B10E2BC;
	Tue, 13 Aug 2024 06:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/say2IF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930FA10E2BB;
 Tue, 13 Aug 2024 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723530631; x=1755066631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DmKnLXUCM72x1dzkF1cuvWtBK8szozZg09Qg4VMff0U=;
 b=d/say2IFPiuS8SL0OOlvZMJAYQvDNymeRt+EbkaFsmu9WoM5PBduJrp6
 JzufXHsT3fkiHigg1OWSIJ6wa104U6uDkpfraSkKLkmAJwJr4R9WwDDYz
 ezK5BbGDzm87J8hMlfeQF9k22jqcQpHOa19sPrskIW2RvBQ09NSo4xLeT
 lfk4e6IoDExaxVMOpyhixoB2DMjrUfbuv3Yi8c8E/Fvwiknt1Bja5VLVs
 UzIXJQgaKUKQQFcEc3UpNzIMGzjNZFC0x9XKhUvZTzWJafPRg9N04ntkN
 qsHq3z8FA6gwyXRJzhPI7abhgL7ANpmQMmYUj8qCH/ld6lqgAXkj8ccbX w==;
X-CSE-ConnectionGUID: daxMVJeoRCaTL2eWCyR83w==
X-CSE-MsgGUID: sbascSiDT4awHCEhrCcCYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32819306"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="32819306"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 23:30:30 -0700
X-CSE-ConnectionGUID: OK0xb/X4QSK98fK2qnVG0A==
X-CSE-MsgGUID: yIz5n0FASNiiwTlY+NexCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58632017"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 23:30:25 -0700
Date: Tue, 13 Aug 2024 09:30:22 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net,
 andriy.shevchenko@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v5] drm/i915/hwmon: expose fan speed
Message-ID: <Zrr9fobk-zahLpIO@black.fi.intel.com>
References: <20240812081538.1457396-1-raag.jadav@intel.com>
 <ZroTN3UudwvIJ7oR@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZroTN3UudwvIJ7oR@ashyti-mobl2.lan>
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

On Mon, Aug 12, 2024 at 03:50:47PM +0200, Andi Shyti wrote:
> Hi Raag,
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
> > +
> > +	/* Handle HW register overflow */
> > +	if (reg_val >= fi->reg_val_prev)
> > +		pulses = reg_val - fi->reg_val_prev;
> > +	else
> > +		pulses = UINT_MAX - fi->reg_val_prev + reg_val;
> > +
> > +	/*
> > +	 * HW register value is accumulated count of pulses from
> > +	 * PWM fan with the scale of 2 pulses per rotation.
> > +	 */
> > +	rotations = pulses / 2;
> > +
> > +	time = jiffies_delta_to_msecs(time_now - fi->time_prev);
> > +	if (unlikely(!time)) {
> > +		ret = -EAGAIN;
> > +		goto exit;
> > +	}
> 
> Can you please add a comment describing how you obtain the speed
> calculation?

That's what I initially tried but ended up dropping it in favour of RPM
formula below, which I found to be doing a better job of explaining than
a few lines of description.

> Basically at every read you store the values. Is it possible that
> we don't have reads for a long time and the register resets more
> than once?

Considering a fan continuously running at higher speeds (for example 4000 RPM
which is quite optimistic), with the scale of 2 pulses per rotation, a 32 bit
register will take around a year to overflow, which is more than most usecases
I could think of.

Raag

> > +	/*
> > +	 * Convert to minutes for calculating RPM.
> > +	 * RPM = number of rotations * msecs per minute / time in msecs
> > +	 */
> > +	*val = DIV_ROUND_UP(rotations * (MSEC_PER_SEC * 60), time);
> > +
> > +	fi->reg_val_prev = reg_val;
> > +	fi->time_prev = time_now;
> > +exit:
> > +	mutex_unlock(&hwmon->hwmon_lock);
> > +	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
> > +	return ret;
> > +}
