Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B5495A0BE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D64710E1E2;
	Wed, 21 Aug 2024 14:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRGW8nDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E88F10E0BD;
 Wed, 21 Aug 2024 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724252319; x=1755788319;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SY9ETdA8yCdgJiCqRdXiEsxxrktg3vC2SvzDdQORJJ0=;
 b=gRGW8nDAc4TwnXrZtowDjZWNGCRFKoc5xg+ybtr2T2x5sK8xOAJUqmQR
 +OBpyEtDzRohHaHEMbertWpHUETnNjJKKxRpcZcim6jSR84L60qWvfzE/
 2q85kXinK048ylx6BC57Op+MryoBgZH377zb4VRn7xbNsNmxyStXwwewa
 CpfBU8Yj8vExhi+vuELlc5xKxE6hXjRkKaP28DX2tvpSAc95gJHAqg+B2
 2WL5eDN9XtKPFxQxaqFzwNCsCt0cLpisZQ2og7HZkrUUlBBITQrwyK/v4
 yPjqHgEfJxf4/9SAC44HqjBJ3VgM4A3lNQwny0JfD7Hwrj18QNlgb9pdz w==;
X-CSE-ConnectionGUID: TQIABrPrQdeBDZXTL84zeg==
X-CSE-MsgGUID: ktyNU8spQbughe/V/QlEQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33768660"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33768660"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:58:38 -0700
X-CSE-ConnectionGUID: Xs4IGRm+RlKOiLFrRKdAXQ==
X-CSE-MsgGUID: CvC3qcL6SvSpU6QwOm8CWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61143035"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:58:31 -0700
Date: Wed, 21 Aug 2024 16:58:28 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
 linux@roeck-us.net, andriy.shevchenko@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v5] drm/i915/hwmon: expose fan speed
Message-ID: <ZsYAlG_4MOUagcGk@ashyti-mobl2.lan>
References: <20240812081538.1457396-1-raag.jadav@intel.com>
 <ZroTN3UudwvIJ7oR@ashyti-mobl2.lan>
 <Zrr9fobk-zahLpIO@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zrr9fobk-zahLpIO@black.fi.intel.com>
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

> > > +	/*
> > > +	 * HW register value is accumulated count of pulses from
> > > +	 * PWM fan with the scale of 2 pulses per rotation.
> > > +	 */
> > > +	rotations = pulses / 2;
> > > +
> > > +	time = jiffies_delta_to_msecs(time_now - fi->time_prev);
> > > +	if (unlikely(!time)) {
> > > +		ret = -EAGAIN;
> > > +		goto exit;
> > > +	}
> > 
> > Can you please add a comment describing how you obtain the speed
> > calculation?
> 
> That's what I initially tried but ended up dropping it in favour of RPM
> formula below, which I found to be doing a better job of explaining than
> a few lines of description.
> 
> > Basically at every read you store the values. Is it possible that
> > we don't have reads for a long time and the register resets more
> > than once?
> 
> Considering a fan continuously running at higher speeds (for example 4000 RPM
> which is quite optimistic), with the scale of 2 pulses per rotation, a 32 bit
> register will take around a year to overflow, which is more than most usecases
> I could think of.

Which can be considered as a worse case scenario. I would have
preferred here a runtime calculation, which means read now, wait
a bit, read again and calculate. The read might be slow, but
efficient.

Anyway, your argument makes sense, so that I'm not going to push
on this, I already r-b'ed it.

Thanks,
Andi
