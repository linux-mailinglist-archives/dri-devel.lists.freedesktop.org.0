Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB76C46C0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF65210E0F3;
	Wed, 22 Mar 2023 09:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C617D10E0F3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679478273; x=1711014273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JXgG6zxXcorUDglIbt1WLKGkdx5y8z2vjqrNmNha7MI=;
 b=NWrEIPPywoW6rCgCNvIz0c4IleOBbv/ev8jHKJ/weEHth5zAyXYDd4Q2
 f6R/Lay7VAUz73rtjakO6YEu1JliVk2ZuUuLFOhONfsSVKQpsF5trtIXl
 +Lq2KlMMcNEIfvzCrVZzii8Xhctuwa/Qu3+l+AEWATIbMXqGsBxveBe69
 y11Gd3ZfV8zwSmHmWafQiWtrdZDWp81VrHxXNJtBx/U8vwXKNwUdaCkwo
 1HuNg9YrRq3Db0Yn2PyusUhaPmSfTqpY09/7LGX2qNsL20Nr8OAGHGT61
 yqbb92/cmTH/hi/1Mzk14+IcyOxiAqTyF06v7dG05qmwvqu1r40l4zizs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327550540"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="327550540"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825321904"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="825321904"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2023 02:44:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pev18-0075Gt-17; Wed, 22 Mar 2023 11:44:26 +0200
Date: Wed, 22 Mar 2023 11:44:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v4 2/8] kunit: drm/tests: move generic helpers
Message-ID: <ZBrN+o4tLy6FGogm@smile.fi.intel.com>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
 <1abd47784b08939ff08ff03d3d4f60449e87625f.1679062529.git.mazziesaccount@gmail.com>
 <20230317150916.a3xrh25ywe5k77yp@houat>
 <e8f50fe8-bad3-e59e-4d80-e2f7db9c9933@gmail.com>
 <5ace543cae7a54db399750a1b330c3ae.sboyd@kernel.org>
 <d13cd7bf-0b1e-e9e1-266a-00db40e51de7@gmail.com>
 <3479e3d4e5e1d84243ca35398ab392ef.sboyd@kernel.org>
 <b8e20a65-005c-0576-6adf-8735f81c19db@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8e20a65-005c-0576-6adf-8735f81c19db@fi.rohmeurope.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 06:16:27AM +0000, Vaittinen, Matti wrote:
> On 3/21/23 20:59, Stephen Boyd wrote:
> > Quoting Matti Vaittinen (2023-03-20 22:45:52)
> >> On 3/20/23 21:23, Stephen Boyd wrote:
> >>> Quoting Matti Vaittinen (2023-03-18 23:36:20)


> >> Besides, I was not sure if you were planning to add similar helper or
> >> just wrappers to individual functions. Wanted to ping you just in case
> >> this has some impact to what you do.
> > 
> > I don't have a need to bind a device to a driver to satisfy devm APIs
> > currently. I could probably use it though to test some devm code in the
> > clk APIs. The only impact is that we're modifying the same files.
> 
> Thanks for clarifying this.
> 
> >>> Have you Cced kunit folks and the
> >>> list on the kunit patches? They may have some opinion.
> >>
> >> This patch was should have contained the
> >> include/kunit/platform_device.h. That file was pulling the Kunit people
> >> in recipients but I messed up things with last minute changes so both
> >> the header and people were dropped. I'll fix this for v5.
> > 
> > Ok, I'll be on the lookout for v5. From what I can tell kunit goes
> > through the kernel selftest tree and there isn't a kunit git tree as
> > such.
> 
> Right. I am not sure what will be the best tree to carry the testability
> changes. It seems that all of the IIO-tests in v5 will depend on the
> kunit stuff, and I think I will also include the DRM test fixes in this
> series as well just to keep things sorted in my mailbox. Anyways, I hope
> to finish the changes for v5 soon(ish) - maybe already Today and in any
> case during this week. I'll be CC:ing you and Brendan with (relevant
> patches of) v5 as well.

Thank you, folks, for doing this. Let's make Linux kernel greater
(than it is already is).

-- 
With Best Regards,
Andy Shevchenko


