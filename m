Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF61053AB6D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 18:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0454710EF58;
	Wed,  1 Jun 2022 16:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292FC10EF60
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654102718; x=1685638718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gwfhI1oZGrbLaBNHLPYsrYeVXkiVePA59FrgD/UWM4k=;
 b=WfQrFsXIuwh3vOlOvR1GdBiWYxR4RW/0im2x0Rytm6Z0yJ7P+w6+kyHx
 XIfUebUgdg41U/oaUfRHVEhPcqNfuCBqKuCpCSyK783eySWST85Z2mgfu
 P7iCwTU8p7+kRppYGqnC75q/bQ4Id4w9VlT3F6A5InPc7Tg3sOtKOUCwB
 72iyd3RbPvyr6yQEjHU8zSOjBGR36dUDUZ7F2aLUFi78oQQ4Z393vvwxg
 jrincNwa5pFhY1mUklXrWrz0hWqH1Z1NyTtz5/OkGy3e+fVdw8psUanY8
 1tq6IN/2OTAGaEOWkahLrx5k2HyNO5a0jaqULo28o+C7m4Giw/FGFyDGd A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="273224401"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; d="scan'208";a="273224401"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 09:58:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="530150781"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 09:58:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nwRfm-000QqW-EX; Wed, 01 Jun 2022 19:58:18 +0300
Date: Wed, 1 Jun 2022 19:58:18 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
Message-ID: <Ypeaqgc9r7TOiSbn@smile.fi.intel.com>
References: <5d817ea54144414aa7865a72694b5811@dh-electronics.com>
 <536d4700-6f28-176d-7883-5793f5cd7c8e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536d4700-6f28-176d-7883-5793f5cd7c8e@redhat.com>
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dominik Kierner <dkierner@dh-electronics.com>,
 "noralf@tronnes.org" <noralf@tronnes.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 09:46:24PM +0200, Javier Martinez Canillas wrote:
> On 3/10/22 14:11, Dominik Kierner wrote:

...

> > # DRM Mode Configuration via Device Tree
> > 
> > In the old fbdev driver, the display modes are hard-coded, which means
> > for every new display configuration, a new patch needs to be mainlined,
> > which slows down official Kernel support and
> > puts burden on the maintainers.
> > Additionally, with the DRM-subsystem supporting height and length
> > information, for scaling, this opens up a lot of new combinations.
> > The SSD1306 for example, is available in multiple resolutions like
> > 128x64 and 96x16 and comes in different sizes per resolution as well.
> > Just to name a few:
> > * 128x64 0.96" (22x11mm)
> > * 128x64 1.3" (30x15mm)
> > * 96x16 0.69" (18x3mm)
> >> Instead of hard-coding, I would suggest something along the lines of
> > of_get_drm_display_mode().
> > The displays won't need to support multiple modes at the same time,
> > let alone support for switching between them,
> > so the one-time invocation of this expensive function might be worth it. 
> > maybe a new and simpler function that could be named:
> > of_get_drm_display_mode_simple()
> 
> This makes sense to me as well.

What about non-OF platforms? Please, do not spread OF-only interfaces,
and use fwnode instead.

> > Providing a mode could later prove useful for a conversion to
> > drm_panel, if that is feasible.
> > 
> > But for a function like this, I have to chicken out.

-- 
With Best Regards,
Andy Shevchenko


