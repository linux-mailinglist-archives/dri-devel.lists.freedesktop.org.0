Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002909563F8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 08:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F196910E1B2;
	Mon, 19 Aug 2024 06:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqsNvE5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651D410E1B1;
 Mon, 19 Aug 2024 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724050238; x=1755586238;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oj3Y9pH17xNfiWjKVNwaUDErHrAbG48YkAEs7w5hNqE=;
 b=TqsNvE5hkaDymDqTXH/iBaoCLEg4paEbPvrdjrEd0SZPjWtpfqYPQsd9
 bA4ALg6Np2iTJQWOrqsj0x/pgtI5eQarDk2o4VaL0vjCUAcxxGCG51lkT
 xj4dKuaJX5VzEG3nFcTZach62ntiplKTWIxLkNLxvlR1c1gmSeKqcgZC3
 Ct94ZrIVbCM3V2nlfLmNwPUHU7dVOKo5Ahg1tXzNe/SSLicPfMxCaxEND
 5fdZ0WLpk3GQ1c+Jfsz7oWjiGTEe1zKTj5odqmRYtpYknTdEq5IhBhGse
 RQ/M47KdC1/qR5Xmo5+AgGZ3+PZ0CYPYKZ1Ae2Fas348WdPKu8yAIS9Pe g==;
X-CSE-ConnectionGUID: qzKzQC63Tqiirf6012OCEQ==
X-CSE-MsgGUID: xO6EBUvhSwupsWQxzAyoHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26149682"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="26149682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 23:50:34 -0700
X-CSE-ConnectionGUID: 0atrH+wPTZeHjmFXJYOQxQ==
X-CSE-MsgGUID: mC6FAfWsTryxmG5IwJ3sBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="91020759"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 23:50:16 -0700
Date: Mon, 19 Aug 2024 09:50:13 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZsLrJVdBmfZhZaaR@black.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <23dc7824-50cd-4ba3-be5a-df141e8fe69a@intel.com>
 <ZrXslA1c-BhO6zYr@ashyti-mobl2.lan>
 <88320f60-d55b-4aa5-881f-530375659c27@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88320f60-d55b-4aa5-881f-530375659c27@intel.com>
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

On Wed, Aug 14, 2024 at 02:07:44PM +0530, Nilawar, Badal wrote:
> 
> Hi Andi,
> 
> On 09-08-2024 15:46, Andi Shyti wrote:
> > Hi Badal,
> > 
> > > > +static int
> > > > +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > > > +{
> > > > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > > > +	struct hwm_fan_info *fi = &ddat->fi;
> > > > +	u32 reg_val, pulses, time, time_now;
> > > > +	intel_wakeref_t wakeref;
> > > > +	long rotations;
> > > > +	int ret = 0;
> > > > +
> > > > +	if (attr != hwmon_fan_input)
> > > > +		return -EOPNOTSUPP;
> > > Using a switch case in rev3 is more logical here. It will also simplify
> > > adding more fan attributes in the future. This is why switch cases are used
> > > in other parts of the file.
> > 
> > it was my suggestion and to be honest I would rather prefer it
> > this way. I can understand it if we were expecting more cases in
> > the immediate, like it was in your case.
> > 
> > But I wouldn't have an ugly and unreadable one-case-switch in the
> > eventuality that something comes in the future. In that case, we
> > can always convert it.
> 
> My rationale for suggesting a switch case is that in the current alignment
> hwm_XX_read() function is designed to handle all possible/supported
> attributes of the XX sensor type.
> With the proposed change, hwm_fan_read() would only manage the
> hwmon_fan_input attribute.
> If a single switch case isn’t preferred, I would recommend creating a helper
> function dedicated to hwmon_fan_input.
> 
> hwm_fan_read()
> {
> 	if (attr == hwmon_fan_input)
> 		return helper(); //hwmon_fan_input_read()
> 	return -EOPNOTSUPP;
> }

Hi Andi,

If you agree with this, please let me know.
Will send out a v6 accordingly.

Raag
