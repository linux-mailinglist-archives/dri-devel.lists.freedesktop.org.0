Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B84B2938
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 16:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A0810EA6A;
	Fri, 11 Feb 2022 15:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A2A10EA6A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644594125; x=1676130125;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T3ef5F65PJmfBcchWNRaBxXxdQ77ulKuIvsCxJQZ99I=;
 b=bVKeKt28Y6DD5975ETB7oi+mvVF0r3Ik06C3lwQRmhAvmiK9nGWaoDVK
 jF9Yra0BpEZQ2TUnevCQty8DkB3FNtHotwc7V7brfe1ozV02sSoWHubcp
 qd9kWQC9DbJbubhN9tHYxAH6dSj3ImNsMWenWg2uLuglr7K/S73sc/68j
 quLG47Yjh4PaGXyO3VdYnhlVFG1cFvTnsq1II71Y1uxlDzeXzQ9tqEVeH
 e7pixcBtzp0fdw0Q0Z0ANOp2UOqr8fjclZzSD5NfbX/MmTdrHylHW+LxZ
 OkLW23uSVR8Vc3Rup2cog/Fd9wmk2/olsy0bM0sjV1VGvzJuSUi9H++pu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248583209"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="248583209"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:42:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="488056186"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 07:42:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIY2i-003UaW-0O; Fri, 11 Feb 2022 17:41:04 +0200
Date: Fri, 11 Feb 2022 17:41:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
 <87pmnt7gm3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmnt7gm3.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 02:05:56PM +0200, Jani Nikula wrote:
> On Fri, 11 Feb 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Am 11.02.22 um 12:12 schrieb Andy Shevchenko:
> >> On Fri, Feb 11, 2022 at 11:40:13AM +0100, Javier Martinez Canillas wrote:
> >>> On 2/11/22 11:28, Andy Shevchenko wrote:
> >>>> On Fri, Feb 11, 2022 at 10:19:22AM +0100, Javier Martinez Canillas wrote:

...

> >>>>> +static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
> >>>>> +{
> >>>>> +	unsigned int x;
> >>>>> +
> >>>>> +	for (x = 0; x < pixels; x++) {
> >>>>> +		u8 r = (*src & 0x00ff0000) >> 16;
> >>>>> +		u8 g = (*src & 0x0000ff00) >> 8;
> >>>>> +		u8 b =  *src & 0x000000ff;
> >>>>> +
> >>>>> +		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
> >>>>> +		*dst++ = (3 * r + 6 * g + b) / 10;
> >>>>> +		src++;
> >>>>> +	}
> >>>>
> >>>> Can be done as
> >>>>
> >>>> 	while (pixels--) {
> >>>> 		...
> >>>> 	}
> >>>>
> >>>> or
> >>>>
> >>>> 	do {
> >>>> 		...
> >>>> 	} while (--pixels);
> >>>>
> >>>
> >>> I don't see why a while loop would be an improvement here TBH.
> >> 
> >> Less letters to parse when reading the code.
> >
> > It's a simple refactoring of code that has worked well so far. Let's 
> > leave it as-is for now.
> 
> IMO *always* prefer a for loop over while or do-while.
> 
> The for (i = 0; i < N; i++) is such a strong paradigm in C. You
> instantly know how many times you're going to loop, at a glance. Not so
> with with the alternatives, which should be used sparingly.

while () {}  _is_ a paradigm, for-loop is syntax sugar on top of it.

> And yes, the do-while suggested above is buggy, and you actually need to
> stop and think to see why.

It depends if pixels can be 0 or not and if it's not, then does it contain last
or number.

The do {} while (--pixels); might be buggy iff pixels may be 0.

-- 
With Best Regards,
Andy Shevchenko


