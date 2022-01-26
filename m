Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A749CABD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF8510E405;
	Wed, 26 Jan 2022 13:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9546210E405
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:25:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230121135"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="230121135"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:25:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="477478913"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:25:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1nCiHN-00EblD-5n;
 Wed, 26 Jan 2022 15:24:05 +0200
Date: Wed, 26 Jan 2022 15:24:04 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <YfFLdOKt+EZidKvc@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <YfEmuGVQ+IlhdQDh@kroah.com>
 <CAKMK7uEiUH8vD3jUCDPXFbF2YS5LygJLVOosbnUnvMP0MU2kTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEiUH8vD3jUCDPXFbF2YS5LygJLVOosbnUnvMP0MU2kTg@mail.gmail.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 11:52:16AM +0100, Daniel Vetter wrote:
> On Wed, Jan 26, 2022 at 11:47 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Wed, Jan 26, 2022 at 12:02:36PM +0200, Andy Shevchenko wrote:
> > > On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > Am 25.01.22 um 21:21 schrieb Andy Shevchenko:

> > > > > Since we got a maintainer for fbdev, I would like to
> > > > > unorphan fbtft (with the idea of sending PRs to Helge)
> > > > > and move it out of staging since there is no more clean
> > > > > up work expected and no more drivers either.
> > > > >
> > > > > Thoughts?
> > >
> > > Thanks for sharing yours, my answers below.
> > >
> > > > But why? We already have DRM drivers for some of these devices.
> > >
> > > No, we do not (only a few are available).
> > >
> > > > Porting
> > > > the others to DRM is such a better long-term plan.  OTOH, as no one has
> > > > shown up and converted them, maybe they should be left dead or removed
> > > > entirely.
> > >
> > > As I mentioned above there are devices that nobody will take time to
> > > port to a way too complex DRM subsystem. But the devices are cheap and
> > > quite widespread in the embedded world. I'm in possession of 3 or 4
> > > different models and only 1 is supported by tiny DRM.
> >
> > Great, then let's just move the 2 models that you do not have support
> > for in DRM, not the whole lot.  When we have real users for the drivers,
> > we can move them out of staging, but until then, dragging all of them
> > out does not make sense.
> 
> Can't we create drm drivers for these 2-3 models? Like we have drivers
> which are below 300 lines with all the helpers taking care of
> everything, this shouldn't be too tricky.

For a few years there is no news about it. Okay, in this thread Noralf
revealed a new idea to replace pile of the drivers in FBTFT.

> And if no one cares enough for that, then imo let's just keep this in
> staging and let it quietly&slowly pass away. At least from the people
> who've been active in any kind of display development the past 6+
> years (which is roughly when Tomi abandoned fbdev as last active
> maintainer) the consensus _is_ that drm drivers are simpler, quicker
> to type (once you got hold of the subsystem and all its helpers at
> least), and adding new fbdev drivers just makes no sense at all.

-- 
With Best Regards,
Andy Shevchenko


