Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE07DDE70
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B051710E684;
	Wed,  1 Nov 2023 09:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C16010E684;
 Wed,  1 Nov 2023 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698831173; x=1730367173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BJlnHyxLxxldKBwcbK7SHbsYAPZoprDqJaMrkG5WMX0=;
 b=a0NE8X4DNE79QxjHm3J6qHrO0t1eE4++FCdkwuuZ7iG/szX/p/XKjdp3
 Y/EU58Yj73b/eFlmNhtak0C3ZfQRre5vKPpoUK5ilpK6lh9798PfGH4gc
 RVR1w4sGIFns2sI+8OQ6twWsCed3u3HcTPgBTlzoKfefFQyQzhTt9V0nY
 5AP9etoURd/rbmwmj7RER5UG1JyM2AWmfjmwjOhNqNnHKXRWLVbFKKshU
 olwfq/qnHIxdBpjM/TDOx0NlcLpSODxDRwnythAaarWcA/giMYb92iKzF
 vxjEv+mK3evPg7z3f1eDrxliNLMi3QlJmjIUUfxsyPUJQ6lAPC7js8rS4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="419582765"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="419582765"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 02:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="710732316"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="710732316"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 02:32:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qy7ag-0000000APOD-1R7V; Wed, 01 Nov 2023 11:32:46 +0200
Date: Wed, 1 Nov 2023 11:32:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 6/7] drm/i915/dsi: Replace poking of CHV GPIOs behind
 the driver's back
Message-ID: <ZUIbPtEEbl6pjdqg@smile.fi.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-7-andriy.shevchenko@linux.intel.com>
 <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
 <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
 <16e533e2-81bb-47ba-9e23-460a626bcad7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16e533e2-81bb-47ba-9e23-460a626bcad7@redhat.com>
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

On Tue, Oct 31, 2023 at 10:15:52PM +0100, Hans de Goede wrote:
> On 10/31/23 17:07, Hans de Goede wrote:
> > On 10/24/23 18:11, Andy Shevchenko wrote:
> >> On Tue, Oct 24, 2023 at 06:57:38PM +0300, Andy Shevchenko wrote:

...

> > As for the CHT support, I have not added that to my tree yet, I would
> > prefer to directly test the correct/fixed patch.
> 
> And I hit the "jackpot" on the first device I tried and the code needed
> some fixing to actually work, so here is something to fold into v3 to
> fix things:

Thanks!

But let me first send current v3 as it quite differs to v2 in the sense
of how I do instantiate GPIO lookup tables.

Meanwhile I will look into the change you sent (and hopefully we can
incorporate something in v3 for v4).

-- 
With Best Regards,
Andy Shevchenko


