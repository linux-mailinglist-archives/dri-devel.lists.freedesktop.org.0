Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695C8D6839
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E7E10E270;
	Fri, 31 May 2024 17:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uo4fDUfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB3810E270
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717177055; x=1748713055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GuxYQS0FYJYGWg1QSsJxVdpzacr59Qf7Z2wjinF8MLU=;
 b=Uo4fDUfIvMmC2oPYDfruR42U3LQwSFWEI1ryjryOsSUvLm9X0nc0yg1s
 uySMnFn1bxmOTQswR8vXV2xv3GHthJ4JDNcQy3yLg2ebma2fKdniLo9Qr
 80xzbzOhiSr4YZmGWWzXuGd6JECGjUcC3tXpAQhQF/3ro6q8Pn1oy22S9
 tudIGPQ/eXcTeGgsrW9fqUWMuG5aDXhYe0wGmp5TrE2CyQOH2KNWbPAkq
 9+dY7f+cvx8wRwKZYo3iM8IiAqas280POeFkjCml1da+LfcLPed5K1am5
 5CzOQRn2DOvFXJ64JkP9OeUGa7wLspkM81MfoI3D5+mobS0RYoQAoN1vf A==;
X-CSE-ConnectionGUID: 1nN6qSjxRF2UYATSlN7XVQ==
X-CSE-MsgGUID: xqSNRKWxSNSSVNmV6NUzNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13550958"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="13550958"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:37:34 -0700
X-CSE-ConnectionGUID: xJGeshXWRVCTzV+VtBlg9Q==
X-CSE-MsgGUID: 6nVCfv0IT5WQ29ga8RtdLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36335914"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 10:37:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sD6Bz-0000000CXWw-08Pg; Fri, 31 May 2024 20:37:27 +0300
Date: Fri, 31 May 2024 20:37:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <jhovold@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/4] lm3533: Remove the outdated drivers
Message-ID: <ZloK1hooJ0Wdh0G9@smile.fi.intel.com>
References: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
 <ZloFgnKC6S2B_oz0@smile.fi.intel.com>
 <20240531171546.GF1204315@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531171546.GF1204315@google.com>
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

On Fri, May 31, 2024 at 06:15:46PM +0100, Lee Jones wrote:
> On Fri, 31 May 2024, Andy Shevchenko wrote:
> > On Fri, May 31, 2024 at 07:56:12PM +0300, Andy Shevchenko wrote:
> > > Driver is quite outdated from the Linux kernel internal APIs
> > > perspective. In particular GPIO code is using legacy calls,
> > > that started being replaced by a new API ca. 2014, i.e. ten
> > > years ago.
> > > 
> > > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > >  drivers/mfd/lm3533-core.c           | 645 -------------------
> > 
> > Oops, still leftovers: one file and Kconfig/Makefile updates...
> > If needed I'll send a v2, but now I leave it to Lee and Johan to decide
> > the destiny of the drivers.
> 
> Let's not rush into it.  Take your time.

Exactly, excellente fin de semaine!

-- 
With Best Regards,
Andy Shevchenko


