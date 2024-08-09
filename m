Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F176494CE6D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 12:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AA410E8A4;
	Fri,  9 Aug 2024 10:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kifipsTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3453B10E8A3;
 Fri,  9 Aug 2024 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723198622; x=1754734622;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1FzYbWOLuoa+uz4DMEu0pz7Ud2kqpfV6TTOIjpY4fT8=;
 b=kifipsTCgoGvs2rjqb2nKpJHfDOQaBRDGb+AT1GC77Pf6mbJF6pSjY86
 xd84+xdT3ie0+Jh2oxoxqTHQVy6i8vVDDeFjYt0HjOzcdpbgaL7ZFaPbi
 Vtsa6R8l1dUDJGnlHk2JaARKt+rLrPTgiOkMoy06xvINh1kAD2gmmDKIx
 22phw8+hJzaRooifiB3FtO21WOz5kcAsIq/nyo0v+sEOljtQ5SHRFJaWL
 ApfYj5gzR5R1FC9D31BotUAxRenBp+xB3gXUkMD9IgmxPZSjJitKL3IJW
 awqPRw1VgMxWPP6X1CQBGcoHGzWTR5eRZ20f58rA7hy5SQTF2SgxeORwT w==;
X-CSE-ConnectionGUID: gQjHTZPkTgK1Iz4VGFxQQw==
X-CSE-MsgGUID: IzG2iPqIRy+rvqbTiGEuMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="12932048"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="12932048"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:17:01 -0700
X-CSE-ConnectionGUID: 8eIczuMFRT2RD3Nu+zn0vw==
X-CSE-MsgGUID: WFdNnVXyQ6auNoYRo1kCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57495772"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.169])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:16:56 -0700
Date: Fri, 9 Aug 2024 11:16:52 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 linux@roeck-us.net, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZrXslA1c-BhO6zYr@ashyti-mobl2.lan>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <23dc7824-50cd-4ba3-be5a-df141e8fe69a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23dc7824-50cd-4ba3-be5a-df141e8fe69a@intel.com>
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

Hi Badal,

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
> > +	if (attr != hwmon_fan_input)
> > +		return -EOPNOTSUPP;
> Using a switch case in rev3 is more logical here. It will also simplify
> adding more fan attributes in the future. This is why switch cases are used
> in other parts of the file.

it was my suggestion and to be honest I would rather prefer it
this way. I can understand it if we were expecting more cases in
the immediate, like it was in your case.

But I wouldn't have an ugly and unreadable one-case-switch in the
eventuality that something comes in the future. In that case, we
can always convert it.

Thanks,
Andi
