Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25D64B5287
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 15:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933A310E13A;
	Mon, 14 Feb 2022 14:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A752410E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644847237; x=1676383237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qW3sr4UpfHOJBkGebrV5Id5bVpujcOv1DgqT7fTbuks=;
 b=ZFSbB3m8bKS5o+DgdUkMBvH2tjRkZTaIevnzM9l2a7v6kcx/5venx1Zt
 L1byk7E8XhDzSt27/ozQWQIzvy2jGUSqoto5NKCTnNoSFn8bsCDoBv5gS
 2dq/y0vO8fpIC1EDLfPvK/CyYZWUsFfPpzB9T8m0rDupneDTHufUK+mFq
 XtvsnMyCkJ191avVnJfASuKrHtM4YOk+IVgQWLq1nfumqvpjwMyATRPeL
 WKPjXmi3h+Qi7jj4wh+FduZk0NmXTGGlcj1MSK2K49wJ6Vfv+CA5Wm5eb
 60FM9JG+n7obLy9wNxTYGEjwcDfy61MDzoeF6HKqU5oZsb/TdMdaBlXt7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="336518802"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="336518802"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 06:00:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; d="scan'208";a="632157823"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 06:00:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nJbsz-004Yhy-62; Mon, 14 Feb 2022 15:59:25 +0200
Date: Mon, 14 Feb 2022 15:59:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <YgpgPCT7XVLvwTnr@smile.fi.intel.com>
References: <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
 <87pmnt7gm3.fsf@intel.com> <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
 <YgoxFBGNsrezVxmi@smile.fi.intel.com>
 <5ee24960-7843-827a-2c47-b93a4b4798e3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ee24960-7843-827a-2c47-b93a4b4798e3@suse.de>
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
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 01:12:48PM +0100, Thomas Zimmermann wrote:
> Am 14.02.22 um 11:38 schrieb Andy Shevchenko:
> > On Mon, Feb 14, 2022 at 10:03:53AM +0100, Thomas Zimmermann wrote:
> > > Am 11.02.22 um 16:41 schrieb Andy Shevchenko:

...

> > > > > IMO *always* prefer a for loop over while or do-while.
> > > > > 
> > > > > The for (i = 0; i < N; i++) is such a strong paradigm in C. You
> > > > > instantly know how many times you're going to loop, at a glance. Not so
> > > > > with with the alternatives, which should be used sparingly.
> > > > 
> > > > while () {}  _is_ a paradigm, for-loop is syntax sugar on top of it.
> > > 
> > > Naw, that's not true.
> > 
> > In the section 3.5 "Loops - While and For" in "The C Programming
> > Language" 2nd by K&R, the authors said:
> 
> Year of publication: 1988 . It's not the most up-to-date reference for C
> programming.

Yet this makes your above remark invalid, i.e. `for` _is_ syntax sugar despite
what you think it's idiomatic _nowadays_.

> > 	The for statement ... is equivalent to ... while..."
> > 
> > They said that for is equivalent to while, and not otherwise.
> 
> Even leaving readability aside, it's not equivalent. You can declare
> variables as part of the for statement. (I know it's not the kernel's
> style.) Also, 'continue' statements are not well-suited in for loops,
> because it's non-obvious if the loop's update statement is being executed.
> (It isn't.)

It's also written in the book :-)

> > Also, syntax sugar by definition declares something that can be written as
> > a single line of code, which usually is done using more (not always).
> 
> The discussion has entered the phase of hair splitting. Good.

I don't know why we are adding an oil into the flames...

-- 
With Best Regards,
Andy Shevchenko


