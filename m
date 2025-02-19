Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A982EA3C97A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 21:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8718510E889;
	Wed, 19 Feb 2025 20:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2hpu+3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A486010E889
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 20:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739996338; x=1771532338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oXeGgZ0czwVwUtkAvKWihshapBTjaKnRt7r/lDXjwUg=;
 b=Q2hpu+3VcrCRlHkvWLhmtgMWXagzMGN6IzF3XEoSKkB8S75vJPiqrjpV
 nxyyNpYw5oCMMQ9cQYIpUTjHtazcwPn4b9U24hLvmKoaawcasppXLbMLp
 0t/0OK/I34XUOq7tZzzawPehEw4l3q9e1egUczWhDGRcQesFkCUFNNHd2
 kirYqC6sJIHEfX5m4vvdundIhE5qMsivBNvvX50+/0JCo9FGMZ+16FJOT
 UxwW041ZPeMm3OOySCgV/41ImWBgzzr8CqrDmKcxoZvV4GTUvFsy37umT
 mRX83A5FTcGhWLvpxA8iw95Pg5tOFU7aJ/rVW3CAnFiWkQK9Lrom/tD4T A==;
X-CSE-ConnectionGUID: 75Waq0K5R6eH7/Nek6LNrg==
X-CSE-MsgGUID: fchYJKyORxux5AVOQ9rg1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51734467"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="51734467"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:18:57 -0800
X-CSE-ConnectionGUID: vlRCi91XTOu32FEws8/1Vg==
X-CSE-MsgGUID: yYmc9FLARoeVY4knBxElMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="138038520"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:18:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tkqWv-0000000D7cB-47Tq; Wed, 19 Feb 2025 22:18:49 +0200
Date: Wed, 19 Feb 2025 22:18:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: lm3533: convert to use OF
Message-ID: <Z7Y8qcNDxjsqJfhM@smile.fi.intel.com>
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-3-clamor95@gmail.com>
 <Z7XqKcOUt5niXzpv@smile.fi.intel.com>
 <CAPVz0n1_WQyOHhtEVAh53uhEUhZvqqZSEJh6XALtSrVfkMSLYw@mail.gmail.com>
 <Z7XzgfHcjyK_UZKv@smile.fi.intel.com>
 <CAPVz0n2WwAOb1UU7J7aDTdhXXCaAZkCpYjW_nc_CBRgkGWdEOw@mail.gmail.com>
 <Z7X3ZvQbSe75U-AR@smile.fi.intel.com>
 <CAPVz0n19D1mS_prvMo-HD3m7U9+iknm49JSj5ydNUHoqjK7gZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n19D1mS_prvMo-HD3m7U9+iknm49JSj5ydNUHoqjK7gZw@mail.gmail.com>
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

On Wed, Feb 19, 2025 at 07:39:29PM +0200, Svyatoslav Ryhel wrote:
> ср, 19 лют. 2025 р. о 17:56 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> пише:
> > On Wed, Feb 19, 2025 at 05:13:15PM +0200, Svyatoslav Ryhel wrote:
> > > ср, 19 лют. 2025 р. о 17:07 Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> пише:
> > > > On Wed, Feb 19, 2025 at 04:36:38PM +0200, Svyatoslav Ryhel wrote:
> > > > > ср, 19 лют. 2025 р. о 16:27 Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> пише:

...

> > > > > MFD part is removed since MFD cells binding is unconditional, while
> > > > > the device supports any amount of children grater then one. For
> > > > > example, my  device uses only backlight at bank A, while all other
> > > > > subdevices are not present and used. This patch switches to dynamic
> > > > > bind of children.
> > > >
> > > > MFD does the same. Please, take your time and get familiar with how MFD works.
> > >
> > > It does not. I have tried. If mfd cell binding is missing, driver will
> > > complain and fail.
> >
> > I really don't know what exactly is going on here, you can check it later, but
> > I'm 100% sure that MFD works for only driver that are present. What you are
> > describing is how component framework is designed.
> >
> > To proove my words you can check drivers/mfd/intel_soc_pmic_*.c and find listed
> > cells that never had a driver in the Linux kernel. They are just placeholders.
> 
> This example is not valid since those drivers do not use device tree.

You didn't get the point. I'm telling that it should not matter if there is a
device driver present or absent. The rest will be enumerated as usual.

I even checked the code that handles of_compatible member from struct mfd_cell and
at a brief glance I do not see that it can do otherwise.

Care to elaborate what and where is the error happened exactly?

-- 
With Best Regards,
Andy Shevchenko


