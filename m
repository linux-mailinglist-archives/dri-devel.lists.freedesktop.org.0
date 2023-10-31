Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D87DD177
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D22110E56D;
	Tue, 31 Oct 2023 16:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E7E10E56A;
 Tue, 31 Oct 2023 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698769385; x=1730305385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RwuuNJAK+7sQSJQmSTHK9qohrsSPiOemxUURP/vRQkk=;
 b=b/H0RaI862kHPc2dZWVDpQru/Atu3Pr2wBxSg+JCMBaMHrN1bdjaZ7QG
 O13+KUt4oSK4XHqpfoj8FFBBSXSOlI1q65sgoiP5N/qfHm/lziB2gM88P
 EVY1szwGH+QfYAaA4yNGE9o5J3nj9W74l4pyLwfD+IDvXDjrhMVRfnkIW
 oLWbSY0zbtXeqoY31QufeqkoA96todZ8Vj1o4PAUiMrkTLCgZWzSryb4n
 5LfjLrfDLq/zozT9tI9fmocWi0TOiwreyVSm+L57/o3//U7wFm6gDH+32
 D9xR8fAtojq7F4Nf/+XdkSjQxoWMb3LcEyg/NN+D+fE0/u5yFA/Puy4wN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="385509628"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="385509628"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 09:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="904391019"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="904391019"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 09:21:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qxrUu-0000000ACaZ-1HwF; Tue, 31 Oct 2023 18:21:44 +0200
Date: Tue, 31 Oct 2023 18:21:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 6/7] drm/i915/dsi: Replace poking of CHV GPIOs behind
 the driver's back
Message-ID: <ZUEplxH51geCyHdb@smile.fi.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-7-andriy.shevchenko@linux.intel.com>
 <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
 <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
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
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 31, 2023 at 05:07:39PM +0100, Hans de Goede wrote:
> On 10/24/23 18:11, Andy Shevchenko wrote:
> > On Tue, Oct 24, 2023 at 06:57:38PM +0300, Andy Shevchenko wrote:
> >> It's a dirty hack in the driver that pokes GPIO registers behind
> >> the driver's back. Moreoever it might be problematic as simultaneous
> >> I/O may hang the system, see the commit 0bd50d719b00 ("pinctrl:
> >> cherryview: prevent concurrent access to GPIO controllers") for
> >> the details. Taking all this into consideration replace the hack
> >> with proper GPIO APIs being used.
> > 
> > Ah, just realised that this won't work if it happens to request to GPIOs with
> > the same index but different communities. I will fix that in v3, but will wait
> > for Hans to test VLV and it might even work in most of the cases on CHV as it
> > seems quite unlikely that the above mentioned assertion is going to happen in
> > real life.
> 
> I have added patches 1-5 to my personal tree + a small debug patch on top
> which logs when soc_exec_opaque_gpio() actually gets called.
> 
> So these patches will now get run every time I run some tests on
> one my tablets.
> 
> I'll get back to you with testing results when I've found a device where
> the new soc_exec_opaque_gpio() actually gets called.

Thank you!

> As for the CHT support, I have not added that to my tree yet, I would
> prefer to directly test the correct/fixed patch.

Noted, I'll prepare a new version then.

-- 
With Best Regards,
Andy Shevchenko


