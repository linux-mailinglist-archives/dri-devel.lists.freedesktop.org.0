Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E07EF94F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524D910E31A;
	Fri, 17 Nov 2023 21:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E653B10E31A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700255726; x=1731791726;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OhC8Can3NUULqJ4zhoGuYZBHu9pSBGs3i4XET9PRUpM=;
 b=YcT10/paLw4sZ7dYncP03bCDV5F61TXeChiMpkIgHec0mkG/7STKJxbC
 kMBnwrwi5dlhB6Kmvmw9QUkdAwXm6/6UHGIHwlZNGcGqECQKgVBE+EWWO
 K5wiaKB0PjvYrUPsiW/CaDhAcTJHSsK2nd2chEfHshaB+qreUhIloeDoW
 d4tuKSM0AMMZyVBaPlhlc1aWJp1jXCp9IE++pyia+3moCRHWHoSW4HfXE
 eIHWMdRxycBYiw59Oe1Fv15PYdROBFqBkK0UIpch/1z8waKl8Q4Bi7eKi
 nEEx38YjDMEoqFr5Z1fw7LJJN+WMPGiOLGFI6upsefNaGK4BjWc7QFQel w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="457870847"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="457870847"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="769320977"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="769320977"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:15:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1r46BK-0000000Eu9N-0Z5G; Fri, 17 Nov 2023 23:15:18 +0200
Date: Fri, 17 Nov 2023 23:15:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 2/3] fbdev: ssd1307fb: Change "solomon,page-offset"
 property default value
Message-ID: <ZVfX5Tw71cqKFJ83@smile.fi.intel.com>
References: <20231116180743.2763021-1-javierm@redhat.com>
 <20231116180743.2763021-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116180743.2763021-2-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Sahaj Sarup <sahaj.sarup@linaro.org>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 07:07:38PM +0100, Javier Martinez Canillas wrote:
> This is used to specify the page start address offset of the display RAM.
> 
> The value is used as offset when setting the page start address with the
> SSD130X_SET_PAGE_RANGE command, and the driver currently sets its value to
> 1 if the property is not present in the Device Tree.
> 
> But the datasheet mentions that the value on reset for the page start is a
> 0, so it makes more sense to also have 0 as the default value for the page
> offset if the property is not present.
> 
> In fact, using a default value of 1 leads to the display not working when
> the fbdev is attached to the framebuffer console.
> 
> Reported-by: Sahaj Sarup <sahaj.sarup@linaro.org>

Closes?
Fixes?

> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
With Best Regards,
Andy Shevchenko


