Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A4A8D6809
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B02F10E6AA;
	Fri, 31 May 2024 17:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myDf/3Yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F0010E6F4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717175862; x=1748711862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J9gDH3bKlwWrZve8Rr8EmXrmd2I73nnMrlBHNuPI7IM=;
 b=myDf/3YppPN/Rtadcg4DzBemmcGTOyAr49fgjauw9IXeqV306312HNgT
 IfeLEBv+HXWeYx7MUt6A+WMB62CdmzHipLfJ7UiJQyT7PslrO7aXWpZMz
 pw3v2pcwCVRGAEx4Bfo/sZL55SyNoUjvox6BA0yCs+9o5zlwL1vt4A3ct
 Y4KX2lSYihA2vhhS7gcq+bfdvEtJgbmpyhXCvNNip1mDcOPV+46IfEIUp
 PVK53XK5UqNmjngWNgDbYAGj82Mm7KjtWNxqc1LvjH72S4AMQ6JxrnZWU
 E91fKszq7X2pwfPukFPp4QWhNw/tm2kJLwvdb9fbkqkWQxOM+E2ofdu4+ Q==;
X-CSE-ConnectionGUID: wsXbKFvNS4Cz4neU8e3CIA==
X-CSE-MsgGUID: t0Fm1QItTZWPRohHvrrJug==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="16681457"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="16681457"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:17:41 -0700
X-CSE-ConnectionGUID: bTIUQv84QRGUIQbKOV3/7A==
X-CSE-MsgGUID: VFQalBeHT6e9S7cQurApGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36682890"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:17:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sD5sk-0000000CX1u-1qfC; Fri, 31 May 2024 20:17:34 +0300
Date: Fri, 31 May 2024 20:17:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, johan@kernel.org,
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
Message-ID: <ZloGLmlfHIfWfWV9@smile.fi.intel.com>
References: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
 <ZloFgnKC6S2B_oz0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZloFgnKC6S2B_oz0@smile.fi.intel.com>
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

+Cc: Johan (via kernel.org)

On Fri, May 31, 2024 at 08:14:43PM +0300, Andy Shevchenko wrote:
> On Fri, May 31, 2024 at 07:56:12PM +0300, Andy Shevchenko wrote:
> > Driver is quite outdated from the Linux kernel internal APIs
> > perspective. In particular GPIO code is using legacy calls,
> > that started being replaced by a new API ca. 2014, i.e. ten
> > years ago.
> > 
> > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> 
> >  drivers/mfd/lm3533-core.c           | 645 -------------------
> 
> Oops, still leftovers: one file and Kconfig/Makefile updates...
> If needed I'll send a v2, but now I leave it to Lee and Johan to decide
> the destiny of the drivers.

-- 
With Best Regards,
Andy Shevchenko


