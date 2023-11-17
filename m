Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD27EF925
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DD010E792;
	Fri, 17 Nov 2023 21:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EECB10E31A;
 Fri, 17 Nov 2023 21:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700255162; x=1731791162;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aT2WVaBK/OG0nienKZxPLkMpvLciTyV3MOhYksMFC+c=;
 b=AkPGj9Sbz7mdYrI+zeLq6Ws6Xdrc3mvMoECObTWcVKANDIOxF9Of+R6d
 2rT5k5SigzfdE9XxvlUBfDwjBlixkr9ybMNggv0z2vLUrzy3tulcLBuIV
 W8NBEzjBrLp4eq9UUrJdAZrfQ61N4HoeNmzC4Z8hgcO6i/f26fKGAvKjc
 M+h7uXgibC0v7UKDlWfuLcqR14X32xRNa0wMV59P1Pu74S7rZlJ0JaQ58
 OFp2SNdMEdgJ/xbyivZl7omNlSVx3PxlRBUeBKuxaIUQIEh23JzwGjGje
 xStGupoW3/qx+pfovCikvtEz1wxyCd3tob8mTqkSYDK1Ilo4MZ0wi91Jy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371546987"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="371546987"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="742187505"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="742187505"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:05:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1r462E-0000000Eu2D-0uzm; Fri, 17 Nov 2023 23:05:54 +0200
Date: Fri, 17 Nov 2023 23:05:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [rft, PATCH v4 00/16] drm/i915/dsi: 4th attempt to get rid of
 IOSF GPIO
Message-ID: <ZVfVsVDQ9j7nMsnW@smile.fi.intel.com>
References: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
 <e66638b0-bbad-4ac7-ad93-6fb0c6147005@redhat.com>
 <871qcqqa1k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qcqqa1k.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 12:15:03PM +0200, Jani Nikula wrote:
> On Thu, 16 Nov 2023, Hans de Goede <hdegoede@redhat.com> wrote:
> > Ok, this now has been testen on both a BYT and a CHT device which
> > actually use GPIO controls in their MIPI sequences so this
> > series is:
> >
> > Tested-by: Hans de Goede <hdegoede@redhat.com>
> >
> > And the code of the entire series also looks good to me:
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >
> > for the series.
> 
> Thanks Andy & Hans!
> 
> I'll merge this once the test results are in. The BAT results have been
> a bit flaky recently, so needed to do a rerun.
> 
> That said, I'm not sure if we have any hardware in CI that would
> actually exercise the modifications, so in that sense I trust Hans'
> testing much more.

Thank you!
Should I fix checkpatch warnings CI reported about?

-- 
With Best Regards,
Andy Shevchenko


