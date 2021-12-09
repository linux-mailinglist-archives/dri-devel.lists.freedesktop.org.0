Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEFC46EE9B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57A210E418;
	Thu,  9 Dec 2021 16:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2022889FF6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 12:26:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="237891940"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="237891940"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 04:26:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="462109743"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 04:25:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1mvITo-0045BO-MA;
 Thu, 09 Dec 2021 14:24:56 +0200
Date: Thu, 9 Dec 2021 14:24:56 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/1] drm: Replace kernel.h with the necessary inclusions
Message-ID: <YbH1mBlbuysch15b@smile.fi.intel.com>
References: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
 <887a15cb-3a3b-4ba2-aa0f-a241e70a19fa@suse.de>
 <CAHp75VdY57xQBLN8vT3RdagQx=4kLx69qAyuzLwqTvNGC2xUbQ@mail.gmail.com>
 <d536e7d2-891e-e0a8-6abc-6694987a65f7@suse.de>
 <YZJGEi6Qqh1aGCxa@smile.fi.intel.com>
 <YZ0Xrus5wZar3QN7@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZ0Xrus5wZar3QN7@smile.fi.intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 23, 2021 at 06:32:46PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 15, 2021 at 01:35:47PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 10, 2021 at 05:39:33PM +0100, Thomas Zimmermann wrote:
> > > Am 10.11.21 um 17:34 schrieb Andy Shevchenko:
> > > > On Wed, Nov 10, 2021 at 3:55 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > Am 10.11.21 um 11:24 schrieb Andy Shevchenko:
> > 
> > ...
> > 
> > > > > > +#include <linux/container_of.h>
> > > > > 
> > > > > I built this patch on a recent drm-misc-next, but there's no
> > > > > linux/container_of.h
> > > > 
> > > > Thank you for trying. It's in the upstream, whenever drm-misc-next
> > > > switches to newer/newest upstream it will be there. I assume it will
> > > > happen after v5.16-rc1?
> > > 
> > > Yes, we'll certainly backmerge soon after rc1 has been released. If I forget
> > > to add the patch then, please send a reminder.
> > > 
> > > Once the necessary headers are available,
> > 
> > $ git log --oneline v5.16-rc1 -- include/linux/container_of.h
> > e1edc277e6f6 linux/container_of.h: switch to static_assert
> > d2a8ebbf8192 kernel.h: split out container_of() and typeof_member() macros
> > 
> > > the patch is
> > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > Thanks!
> 
> Maybe I misunderstood something, I thought that DRM people may apply this,
> is it incorrect assumption?

It still does not appear in Linux Next...
What should I do to move this forward, please?

-- 
With Best Regards,
Andy Shevchenko


