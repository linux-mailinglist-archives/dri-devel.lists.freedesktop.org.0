Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AAB49CADE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F9A10E5B9;
	Wed, 26 Jan 2022 13:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88C10E5B9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:31:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="307262911"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="307262911"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:31:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="477480490"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:31:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1nCiNf-00EbsA-L1;
 Wed, 26 Jan 2022 15:30:35 +0200
Date: Wed, 26 Jan 2022 15:30:35 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <YfFM+6pvJLmtY0Zg@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
 <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <CAKMK7uEqwyZuVheqyNG33Un4WK1cd1B+WBYbCmi20fZi0qVG2w@mail.gmail.com>
 <88ea01b8-3fdd-72cc-c3d8-e2890c68533b@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88ea01b8-3fdd-72cc-c3d8-e2890c68533b@gmx.de>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Carlis <zhangxuezhi1@yulong.com>, Phillip Potter <phil@philpotter.co.uk>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:38:09PM +0100, Helge Deller wrote:
> On 1/26/22 12:24, Daniel Vetter wrote:
> > On Wed, Jan 26, 2022 at 12:18 PM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> On 1/26/22 11:59, Helge Deller wrote:
> >>> On 1/26/22 11:02, Andy Shevchenko wrote:

...

> >>>> P.S. For the record, I will personally NAK any attempts to remove that
> >>>> driver from the kernel. And this is another point why it's better not
> >>>> to be under the staging.
> >>>
> >>> I agree. Same as for me to NAK the disabling of fbcon's acceleration
> >>> features or even attempting to remove fbdev altogether (unless all
> >>> relevant drivers are ported to DRM).
> >>
> >> But that will never happen if we keep moving the goal post.
> >>
> >> At some point new fbdev drivers should not be added anymore, otherwise
> >> the number of existing drivers that need conversion will keep growing.
> >
> > And that point was about 5 years ago, and has been discussed at some
> > plumbers meanwhile, resulting in the staging TODO patches to make
> > these drm drivers to destage them.
> >
> > Fixing bugs in fbdev is all fine, reopening it for merging new drivers is not.
> 
> We are on the same page!
> I'm not at all proposing to include new drivers for (relatively) new
> hardware into fbdev, which is capable to be written as DRM driver.

Agree. The point here is neither in opening it for new comers nor for
expanding, the drivers in question are all in the kernel in different folder
that is not suitable for them, but I gave up. I see that nobody wants
maintainers to be appearing for the old _working_ code, as it was shown
already by the DVB case few month ago.

-- 
With Best Regards,
Andy Shevchenko


