Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ACE4F98DC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF3010E50E;
	Fri,  8 Apr 2022 15:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB5010E503
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649430020; x=1680966020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fvu7Xj2KZeoBoWYVxKXIZ/ZE9uRhVfjO5sJnAbr0H6g=;
 b=dtaTR0NviXRXhKqbUh8siFEKalrVdmtKVmGsD0B9pMuP/lMO1JyxGXMo
 3sC5JeJ/3Z5g2v/mau2xqxfUBYkiNOuCcB+AdTVq0iF1OuDzCKqONgmv9
 e75u2NLm0j71c7IFKx1TWnvFqjWzOznriehjXK2/AwUD8G5IUBSxJXFUW
 74u3HzLbSc5v5+8zqM19oogkO0PR5uszdPHxC1d4XaoUdqvqxcO3dasAg
 500Z5LwzAgusAeDjzcJXZcIw2vOcXblSipR0SGQ+00XeyQEJKXStKf7na
 VPOLXphjMTCh61y+2wWh/zcOOPcEpzdqzavaBNfa8r/u8MsSinqMoezGs w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="259208881"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="259208881"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 08:00:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="524802808"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 08:00:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ncq2N-000Kqr-9K; Fri, 08 Apr 2022 17:56:35 +0300
Date: Fri, 8 Apr 2022 17:56:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 0/5] drm: Fix monochrome conversion for sdd130x
Message-ID: <YlBNIyimU0DGpWK3@smile.fi.intel.com>
References: <20220317081830.1211400-1-geert@linux-m68k.org>
 <f94c0f44-36f1-e1a9-5963-5da0bafb8c90@redhat.com>
 <YjSMWDFxTeJZZ/CB@smile.fi.intel.com>
 <20220318142145.kwq46bf6exgce6wu@houat>
 <YjSYL5oPaDuCXOJQ@smile.fi.intel.com>
 <20220408135413.2vwp4oyzdlu7iczs@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408135413.2vwp4oyzdlu7iczs@houat>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 08, 2022 at 03:54:13PM +0200, Maxime Ripard wrote:
> On Fri, Mar 18, 2022 at 04:33:19PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 18, 2022 at 03:21:45PM +0100, Maxime Ripard wrote:
> > > On Fri, Mar 18, 2022 at 03:42:48PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Mar 17, 2022 at 12:39:57PM +0100, Javier Martinez Canillas wrote:
> > > > > On 3/17/22 09:18, Geert Uytterhoeven wrote:
> > > > 
> > > > > By the way, you should probably request commit access to the drm-misc tree:
> > > > > 
> > > > > https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html
> > > > 
> > > > Does it really work? I tried and no one replied to request.
> > > > Keeping silent is a bad service. If people don't want a person
> > > > to have such access it should be well communicated.
> > > 
> > > I don't see any issue on Gitlab to request commit access, so I'm not
> > > sure what you did exactly but it's not surprising you didn't get any
> > > answer.
> > 
> > https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/311
> 
> Indeed, I wasn't expecting it to be that old.

That's part of "non-working" process.

> I'm not sure why it fell through the cracks, sorry for that.
> 
> That being said, the criteria for requesting drm-misc commit access are
> listed here:
> https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc
> 
> And looking at your commit history so far, I'm not sure you qualifies
> yet for the first criteria. All your patches to drivers/gpu/drm, while
> definitely useful, only seem to be conversions to helpers and general
> best practices changes, which could be classified as trivial.

Can you, please, comment it there then and close the request?

-- 
With Best Regards,
Andy Shevchenko


