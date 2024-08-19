Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9D956EA0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755A688FB2;
	Mon, 19 Aug 2024 15:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiMxgfGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D0888FB2;
 Mon, 19 Aug 2024 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724080957; x=1755616957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9JWfjIa1vdn38FsVkvDYMYCfzjwxvlY4s9IpqPG8eFw=;
 b=aiMxgfGfxC3vrOV271O2cOnS73Cr6pn5gbnOlGw2UkN3Cq54isbJ65BH
 07BH+FEXpRvA6Enaqje0MxJrKkke90Za+afPocIYo6/ADCqTExI03tkqy
 amFZqs/PualnJFyxDDaBJ/ygOqIzGaESoYFBSJa9fZ1K5WT+gtJvoBund
 I88mxgDX6jPF7KXlxqb9ZRH3ClVuVeTM/NR/axUd7qgujs0qVv7QnuFaw
 0k/8UCW77g9NREaDOqR7WCPhxmLsZz/6+ozeY7P9WeC8mNufyI3P1N9f0
 Bx/4aYNpyWZ7pqXGNJk8fk1KX2lxEDHSJ8VcT/V/7GWIA/NUERwZg2m8q g==;
X-CSE-ConnectionGUID: 9nmMqK9HScGgyTsyHxem7Q==
X-CSE-MsgGUID: hVx9kR5vSfqsYMnwdg1f4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22509907"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="22509907"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:22:37 -0700
X-CSE-ConnectionGUID: h/Lf2QjnTJWLwtRYtsKpRw==
X-CSE-MsgGUID: FkCpXxoHSjSKEccMTCJLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="60068171"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.73])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:22:32 -0700
Date: Mon, 19 Aug 2024 17:22:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, linux@roeck-us.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, karthik.poosa@intel.com,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZsNjNSu5tCsRUxJ9@ashyti-mobl2.lan>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <23dc7824-50cd-4ba3-be5a-df141e8fe69a@intel.com>
 <ZrXslA1c-BhO6zYr@ashyti-mobl2.lan>
 <88320f60-d55b-4aa5-881f-530375659c27@intel.com>
 <ZsLrJVdBmfZhZaaR@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZsLrJVdBmfZhZaaR@black.fi.intel.com>
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

I'm sorry, I missed this mail.

On Mon, Aug 19, 2024 at 09:50:13AM +0300, Raag Jadav wrote:
> On Wed, Aug 14, 2024 at 02:07:44PM +0530, Nilawar, Badal wrote:
> > On 09-08-2024 15:46, Andi Shyti wrote:
> > > > > +static int
> > > > > +hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > > > > +{
> > > > > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > > > > +	struct hwm_fan_info *fi = &ddat->fi;
> > > > > +	u32 reg_val, pulses, time, time_now;
> > > > > +	intel_wakeref_t wakeref;
> > > > > +	long rotations;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	if (attr != hwmon_fan_input)
> > > > > +		return -EOPNOTSUPP;
> > > > Using a switch case in rev3 is more logical here. It will also simplify
> > > > adding more fan attributes in the future. This is why switch cases are used
> > > > in other parts of the file.
> > > 
> > > it was my suggestion and to be honest I would rather prefer it
> > > this way. I can understand it if we were expecting more cases in
> > > the immediate, like it was in your case.
> > > 
> > > But I wouldn't have an ugly and unreadable one-case-switch in the
> > > eventuality that something comes in the future. In that case, we
> > > can always convert it.
> > 
> > My rationale for suggesting a switch case is that in the current alignment
> > hwm_XX_read() function is designed to handle all possible/supported
> > attributes of the XX sensor type.
> > With the proposed change, hwm_fan_read() would only manage the
> > hwmon_fan_input attribute.
> > If a single switch case isn’t preferred, I would recommend creating a helper
> > function dedicated to hwmon_fan_input.
> > 
> > hwm_fan_read()
> > {
> > 	if (attr == hwmon_fan_input)
> > 		return helper(); //hwmon_fan_input_read()

I'm not really understanding what is the point of the helper, but
if it looks cleaner, I have no objection.

Thanks,
Andi
