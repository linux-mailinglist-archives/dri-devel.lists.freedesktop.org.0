Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69114FDD9E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 13:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193C110E67C;
	Tue, 12 Apr 2022 11:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF6210E67C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649762867; x=1681298867;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A8L7F1aXAv1zmc7BrwX0jr9a4044fPUJAWnmDOdYuoU=;
 b=fg8Dvsv9eIuxPlf+V9lHvyJ35UZzSCud8sQ58D7ILqUkAdguxUQ3Io3H
 z1uj4WdPkd29bwzpIJVTJDeKz+DwJufLze4hVPnahkl9tbzXYhg9dN34C
 ja9tswulHAdw640mwuDySp0RzqtidvVZJfyfZd2QnzMzwjTnX66SkCJM3
 +WbncXgDp6cQtr2JWVdN8BCZeqcd7VgiCB2TuZKBlFISAxMg+1N2rGgcw
 mz5xuzKYfU2EzyhCRmLs3AheoB7c5F9mLzFB1BreOwt92F5V7t3AaNaL7
 agIYFTNfYrPQORVjurzndCN7+DAOm2F+w0IjWvTPZwPVvBFqRmv9bkAv3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="322797313"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="322797313"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 04:26:06 -0700
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="526002248"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 04:26:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1neEbI-001Yl0-8d; Tue, 12 Apr 2022 14:22:24 +0300
Date: Tue, 12 Apr 2022 14:22:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
Message-ID: <YlVg8PE6SBzhmqjI@smile.fi.intel.com>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-5-javierm@redhat.com>
 <CAMuHMdVSsAtRLob5fLoBMNu-DRXJOaBrEHYEwG5iCA03XR5JSw@mail.gmail.com>
 <4128b288-2b9a-f9cd-01f3-a1d50d3e10bb@redhat.com>
 <YlVgpHqqqFy43L37@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlVgpHqqqFy43L37@smile.fi.intel.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 02:21:08PM +0300, Andy Shevchenko wrote:
> On Tue, Apr 12, 2022 at 10:07:02AM +0200, Javier Martinez Canillas wrote:
> > On 4/12/22 09:23, Geert Uytterhoeven wrote:
> > > On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
> > > <javierm@redhat.com> wrote:

...

> > >> -       ssd130x->device_info = device_get_match_data(dev);
> > >> +
> > >> +       variant = (enum ssd130x_variants)device_get_match_data(dev);
> > > 
> > > (uintptr_t), to avoid a cast from pointer to integer of different
> > > size warning.
> > >
> > 
> > Indeed. The kernel test robot reported the same.
> 
> Not only because of this, but also with the non-NULL pointers I prefer the old
> style without ugly castings.
> 
> Instead, you may export the array (in the driver's namespace) and use
> &info[ID] pointer for the specific device info.

Note that device_get_match_data() has no clue if the data is absent or
data == (void *)0.

-- 
With Best Regards,
Andy Shevchenko


