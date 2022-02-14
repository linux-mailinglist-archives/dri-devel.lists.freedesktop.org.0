Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C84E04B4A8E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BD510E53E;
	Mon, 14 Feb 2022 10:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C08C10E53E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644835156; x=1676371156;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C9m2rcxcDwLvUl2QbsECG3i5+PvKcHA60fHQFVqzZzs=;
 b=J6b0XXkNyE1DjjO7JvGetUGZNxcvsaX5pUAQVOTqaPpgZGR8sIxtXtmC
 g2rBYR/2zlkTB1TXZPSwTnJIkKdo/b6TVUeInHsl3xh/iYv6UKtOIreVb
 5RATuPx6qpOgnVuJ4d/yi/DXLsCPgsczBsy8ymjRPbs4UaGpHLrRSdpib
 ZJ6z4z63zaAxIZcmgoB7dP0NmgP9XjVRfiUL8OH8LWAMNwZhxXGXNPBJp
 AHpVrnj3nGPBs8R5MAxQWMWl9QezX2XgcPFLevyH63Z+XBm7tlYlrCMFW
 +ZrnR0wcL6J+WKGjU4wIwDtN519Ruy8Cn1FIUZED9jJUUrYunPnkJT6Te Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="250009735"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="250009735"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:39:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="570085760"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:39:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nJYkG-004Pw8-Jg; Mon, 14 Feb 2022 12:38:12 +0200
Date: Mon, 14 Feb 2022 12:38:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <YgoxFBGNsrezVxmi@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
 <87pmnt7gm3.fsf@intel.com> <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
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

On Mon, Feb 14, 2022 at 10:03:53AM +0100, Thomas Zimmermann wrote:
> Am 11.02.22 um 16:41 schrieb Andy Shevchenko:

...

> > > IMO *always* prefer a for loop over while or do-while.
> > > 
> > > The for (i = 0; i < N; i++) is such a strong paradigm in C. You
> > > instantly know how many times you're going to loop, at a glance. Not so
> > > with with the alternatives, which should be used sparingly.
> > 
> > while () {}  _is_ a paradigm, for-loop is syntax sugar on top of it.
> 
> Naw, that's not true.

In the section 3.5 "Loops - While and For" in "The C Programming
Language" 2nd by K&R, the authors said:

	The for statement ... is equivalent to ... while..."

They said that for is equivalent to while, and not otherwise.

Also, syntax sugar by definition declares something that can be written as
a single line of code, which usually is done using more (not always).

> An idiomatic for loop, such as for (i = ...; i < N;
> ++i), is such a strong pattern that it's way better than the corresponding
> while loop.

> > > And yes, the do-while suggested above is buggy, and you actually need to
> > > stop and think to see why.
> > 
> > It depends if pixels can be 0 or not and if it's not, then does it contain last
> > or number.
> > 
> > The do {} while (--pixels); might be buggy iff pixels may be 0.

-- 
With Best Regards,
Andy Shevchenko


