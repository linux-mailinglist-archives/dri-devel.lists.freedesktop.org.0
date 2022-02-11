Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E84B2410
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CD910EA78;
	Fri, 11 Feb 2022 11:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6050110EAC4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644578039; x=1676114039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dwLXbIIZzHbMAw4pY6RvQqqG4HJGRvuDXCe7ZYOPqv0=;
 b=KfqGZh09UBzL11pgwSKG30xWSfqG1k3JpAjUpUphyO3nLIdcibiiq4wB
 9anS3lCqpGhFDPg4sfkWjZWmxXwfBfjrb+oPPC/wW0Pg05PCy9TwWaTyL
 CEUIp79nSNElv2MDMS920ZizQ81nc2vKPqmVj7Xu4CWM+0oQN3p2anCIL
 h+FqJfgHsjdOWW1hOQWO7br5V1Lw1WQ0d1hDnr7Y+y4QAJB4z045B+c8L
 75h01SrxjI1XQgQWz0VozYmfY+YFxcSAk1CdU70gnPG5ISXevHiNUqGO+
 LjAuG0WU50t+fiVxfaZ4eMMVjg2JJxi9r2Z7bsxkX16UxTNvWCVcqhD9Z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="310449664"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="310449664"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:13:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="569011379"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:13:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nITrF-003Q2V-Nb; Fri, 11 Feb 2022 13:12:57 +0200
Date: Fri, 11 Feb 2022 13:12:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 11:40:13AM +0100, Javier Martinez Canillas wrote:
> On 2/11/22 11:28, Andy Shevchenko wrote:
> > On Fri, Feb 11, 2022 at 10:19:22AM +0100, Javier Martinez Canillas wrote:

...

> >> +static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
> >> +{
> >> +	unsigned int x;
> >> +
> >> +	for (x = 0; x < pixels; x++) {
> >> +		u8 r = (*src & 0x00ff0000) >> 16;
> >> +		u8 g = (*src & 0x0000ff00) >> 8;
> >> +		u8 b =  *src & 0x000000ff;
> >> +
> >> +		/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
> >> +		*dst++ = (3 * r + 6 * g + b) / 10;
> >> +		src++;
> >> +	}
> > 
> > Can be done as
> > 
> > 	while (pixels--) {
> > 		...
> > 	}
> > 
> > or
> > 
> > 	do {
> > 		...
> > 	} while (--pixels);
> > 
> 
> I don't see why a while loop would be an improvement here TBH.

Less letters to parse when reading the code.

> In any case, I just pulled the line conversion logic as a separate
> function with minimal code changes since doing that should be in a
> separate patch.


> Feel free to post a patch if you want to change that while loop.

Perhaps some day :-)

-- 
With Best Regards,
Andy Shevchenko


