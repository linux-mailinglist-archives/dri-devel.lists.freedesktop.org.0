Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C675521B0C2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B636EB8C;
	Fri, 10 Jul 2020 07:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3935B6EA55;
 Thu,  9 Jul 2020 14:51:16 +0000 (UTC)
IronPort-SDR: zc9qWgM7UKGnu2iEugEyDOQL4zZlqDK3EUEIUnkcdrZoAzwjNCFOVnfeQesNaOTXSQk+bxCYAF
 TTKwLAXQIZtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="209539616"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="209539616"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 07:51:15 -0700
IronPort-SDR: MbW0g/eZ77vvMA01QZmji7O3kRQ4moRTN4XvRHiluqP6HmWTpfg9hdrlBASAp+HqLAomFwTUAz
 jppCmBY6GwTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="323257228"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Jul 2020 07:51:12 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jtXtI-000sMr-Pe; Thu, 09 Jul 2020 17:51:12 +0300
Date: Thu, 9 Jul 2020 17:51:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 04/16] pwm: lpss: Add range limit check for the
 base_unit register value
Message-ID: <20200709145112.GB3703480@smile.fi.intel.com>
References: <20200708211432.28612-1-hdegoede@redhat.com>
 <20200708211432.28612-5-hdegoede@redhat.com>
 <20200709125342.GX3703480@smile.fi.intel.com>
 <4ff9dc18-fa59-d9a3-c7bf-9f95c62fc356@redhat.com>
 <20200709142136.GZ3703480@smile.fi.intel.com>
 <c7925c63-9187-f89f-3a01-2ff252012615@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c7925c63-9187-f89f-3a01-2ff252012615@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 09, 2020 at 04:33:50PM +0200, Hans de Goede wrote:
> On 7/9/20 4:21 PM, Andy Shevchenko wrote:
> > On Thu, Jul 09, 2020 at 03:23:13PM +0200, Hans de Goede wrote:

...

> > You can use clamp_val().
> 
> I did not know about that, that will work nicely I will switch to clamp_val
> for the next version. I assume it is ok to keep your Reviewed-by with this
> very minor change?

Sure.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
