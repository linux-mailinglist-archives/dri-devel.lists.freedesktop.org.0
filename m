Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E349CAC2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1CB10E576;
	Wed, 26 Jan 2022 13:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDEE10E576
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:27:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="233923104"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="233923104"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:27:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="532757290"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:27:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1nCiJE-00EbmO-Lq;
 Wed, 26 Jan 2022 15:26:00 +0200
Date: Wed, 26 Jan 2022 15:26:00 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <YfFL6AQ7UbKYS1gl@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <YfEmuGVQ+IlhdQDh@kroah.com>
 <CAKMK7uEiUH8vD3jUCDPXFbF2YS5LygJLVOosbnUnvMP0MU2kTg@mail.gmail.com>
 <YfEtZD0uYp9yngvq@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfEtZD0uYp9yngvq@kroah.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:15:48PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 26, 2022 at 11:52:16AM +0100, Daniel Vetter wrote:
> > On Wed, Jan 26, 2022 at 11:47 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Wed, Jan 26, 2022 at 12:02:36PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > Am 25.01.22 um 21:21 schrieb Andy Shevchenko:
> > > > > > Since we got a maintainer for fbdev, I would like to
> > > > > > unorphan fbtft (with the idea of sending PRs to Helge)
> > > > > > and move it out of staging since there is no more clean
> > > > > > up work expected and no more drivers either.
> > > > > >
> > > > > > Thoughts?
> > > >
> > > > Thanks for sharing yours, my answers below.
> > > >
> > > > > But why? We already have DRM drivers for some of these devices.
> > > >
> > > > No, we do not (only a few are available).
> > > >
> > > > > Porting
> > > > > the others to DRM is such a better long-term plan.  OTOH, as no one has
> > > > > shown up and converted them, maybe they should be left dead or removed
> > > > > entirely.
> > > >
> > > > As I mentioned above there are devices that nobody will take time to
> > > > port to a way too complex DRM subsystem. But the devices are cheap and
> > > > quite widespread in the embedded world. I'm in possession of 3 or 4
> > > > different models and only 1 is supported by tiny DRM.
> > >
> > > Great, then let's just move the 2 models that you do not have support
> > > for in DRM, not the whole lot.  When we have real users for the drivers,
> > > we can move them out of staging, but until then, dragging all of them
> > > out does not make sense.
> > 
> > Can't we create drm drivers for these 2-3 models? Like we have drivers
> > which are below 300 lines with all the helpers taking care of
> > everything, this shouldn't be too tricky.
> 
> Agreed, having the hardware to test this with is the hardest part.
> Andy, this should be better to do in the longrun than trying to keep
> these other drivers "alive".

I see, I'm not objecting the place, I'm objecting blind removal, so
as far as the drivers, for which there is no alternative in the tree,
are in the tree (even in the staging) it's fine.

Let's keep a status quo then.

-- 
With Best Regards,
Andy Shevchenko


