Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9188D67F0
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EB510E634;
	Fri, 31 May 2024 17:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFepZghH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAB410E634
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717175690; x=1748711690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ra01TUqafQnueHY+6XA0wN/bRJPiiyyn14ikUAWapRE=;
 b=BFepZghHER6q+5lFdMaN/NajI717UvdoFn3DqTmyS4wQdJ7sWj/9gpId
 ds0vjst2Jvmz6LcAhGe1LvfmbLo7SWi4UvXemAyufGoQLZjXvGgLChSHn
 8KRinoHdZJurf4s3/nloS78vkLN865HXaF4n5YzTC8pOtaUyItaPG0N+I
 sftYUghTzUGaMaRZPa2jaF8Vyol76dwCbxBWe3oF4k6ZShadtpWJEtBpH
 YFmkAkRPWJmLOXR9Gh8KmXXtBpPL76k0z9pafWZvJFDsvE8QNxZtOzoxL
 o0GrOxbvUCpGQYfGU5kwXngmKe25tXpz62OiAj6V5WqcFVhOJ2oHrfzYK A==;
X-CSE-ConnectionGUID: mwEqrsv9Tc+mwFOY4neFOA==
X-CSE-MsgGUID: B+3bIMEmQkmUjk/+o3AS1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="25132699"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25132699"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:14:50 -0700
X-CSE-ConnectionGUID: E/+p99EhQ9+QCIkTiyw7ew==
X-CSE-MsgGUID: ggGG2oTZQ1WH2UHHIsef6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36149369"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:14:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sD5pz-0000000CWxo-0rLw; Fri, 31 May 2024 20:14:43 +0300
Date: Fri, 31 May 2024 20:14:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <jhovold@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/4] lm3533: Remove the outdated drivers
Message-ID: <ZloFgnKC6S2B_oz0@smile.fi.intel.com>
References: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
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

On Fri, May 31, 2024 at 07:56:12PM +0300, Andy Shevchenko wrote:
> Driver is quite outdated from the Linux kernel internal APIs
> perspective. In particular GPIO code is using legacy calls,
> that started being replaced by a new API ca. 2014, i.e. ten
> years ago.
> 
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>

>  drivers/mfd/lm3533-core.c           | 645 -------------------

Oops, still leftovers: one file and Kconfig/Makefile updates...
If needed I'll send a v2, but now I leave it to Lee and Johan to decide
the destiny of the drivers.

-- 
With Best Regards,
Andy Shevchenko


