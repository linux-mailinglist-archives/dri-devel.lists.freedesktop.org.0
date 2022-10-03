Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C595F3785
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 23:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5969610E4DE;
	Mon,  3 Oct 2022 21:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6306210E1C0;
 Mon,  3 Oct 2022 21:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664831595; x=1696367595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DO9ZPukMxmaIp+zy0RVVlJM+XNRpgeW7cFsGPXbz5IY=;
 b=D6wONw9OcTQJDHUvRYy1nEGT3j+YxySRduvFtSrhyRW1NZ8efyOSyip7
 u/yV4jWOU+7ewDdlBvqIDaIkTHFyiB6KTg/9kY82n98Dyzvq2nBr5yW8C
 WXke1y3dHvLSyflormq8+5U7KHBpqJg8lucgIHlzAWKNZJ1oUptGDKK4P
 JnZ3k/qFB8TTP+I31v1N3J3YlQBOUkxKZf0AT+LsxIDLZCTYpTz1/kv7v
 5ub9I88rTItP0ZJ7rrjFOy/70cFzssda+bFYiFbtBD8N7eCPhGAfs/msP
 QiOMaXAI7v1jGfjkzRJzQAl/xDRPnmorBhsybWSUztSnh/tc96+GZ2Duw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="329162682"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="329162682"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:13:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="692240868"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; d="scan'208";a="692240868"
Received: from kbalinsk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.213.7.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 14:13:13 -0700
Date: Mon, 3 Oct 2022 23:13:10 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/hwmon: Show device level energy
 usage
Message-ID: <YztQZoHViyw2Cqch@ashyti-mobl2.lan>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
 <20220927055020.3499420-5-badal.nilawar@intel.com>
 <YzcezNGdRJnyXS3N@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzcezNGdRJnyXS3N@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Badal,

[...]

> > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > index 16e697b1db3d..7525db243d74 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > @@ -25,3 +25,11 @@ Contact:	dri-devel@lists.freedesktop.org
> >  Description:	RO. Card default power limit (default TDP setting).
> >  
> >  		Only supported for particular Intel i915 graphics platforms.
> > +
> > +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
> > +Date:		February 2023
> > +KernelVersion:	6.2
> > +Contact:	dri-devel@lists.freedesktop.org
> 
> I'm sorry for being late on the review here, and I know that others
> already looked at the date and other details here in this doc.
> So I'm curious why we have decided for the dri-devel mailing list
> and not for the intel-gfx since intel-gfx is the only one we have
> listed for i915 dir in the MAINTAINERS file:
> L:      intel-gfx@lists.freedesktop.org

same question here.

> > +Description:	RO. Energy input of device in microjoules.
> > +
> > +		Only supported for particular Intel i915 graphics platforms.

[...]

> > +/*
> > + * hwm_energy - Obtain energy value
> > + *
> > + * The underlying energy hardware register is 32-bits and is subject to
> > + * overflow. How long before overflow? For example, with an example
> > + * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
> > + * a power draw of 1000 watts, the 32-bit counter will overflow in
> > + * approximately 4.36 minutes.
> > + *
> > + * Examples:
> > + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> > + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> > + *
> > + * The function significantly increases overflow duration (from 4.36
> > + * minutes) by accumulating the energy register into a 'long' as allowed by
> > + * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
> > + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
> > + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> > + * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> > + */
> > +static int
> > +hwm_energy(struct hwm_drvdata *ddat, long *energy)

This function can just be void.

Andi

> > +{

[...]
