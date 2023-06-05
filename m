Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB09722C32
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 18:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E3D10E2F4;
	Mon,  5 Jun 2023 16:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE8210E2F4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685981283; x=1717517283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WsTl8q/03NmXvbUZeuZjP7EEn4sjQ1TeIpWAboty3qg=;
 b=JkfGarj8L3HN/9CQak14EE/0Xfa2x9MdPDXmJnGnodPLqv+DvMeYQWUM
 rNZ4iSq+UdlZ8Ugo8oJwhjsfCilVShQLmzvA6wPHuPzvaH2eQLvPglz9F
 qtRJYWoq2/1ELV4kOOu5JogO6bLkjfkjKBFTkNe87cJH34SjT11NcrrvH
 7LxFIEC3Bi5aiUvOWYxGkui7BSS+lmvTzUGOm0UATXCy2G+wGEhw1bqMg
 ZS5jjxxQdpQOyAaWfdeXaRHAUNJLbi6YEZDhiEr8JkwxDYnu6Kr0O0f2x
 1lEMx9xq2MRhSODxdzPQiqH9d/hHreMjG/ENE2uT8ZIiXEM6MeeZu3r6q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="353898979"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="353898979"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738411169"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="738411169"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 09:07:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1q6Cjs-001PpH-2k; Mon, 05 Jun 2023 19:07:24 +0300
Date: Mon, 5 Jun 2023 19:07:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] backlight: hx8357: Convert to agnostic GPIO API
Message-ID: <ZH4IPJuPoX3gi5Ga@smile.fi.intel.com>
References: <20230317185230.46189-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYXTk2pzXEM9MTjt=oT-CbhENABSLeb9dN7ZvEy8oqiag@mail.gmail.com>
 <ZBhJctqSkdtoUmBi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBhJctqSkdtoUmBi@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 01:54:26PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 17, 2023 at 09:53:40PM +0100, Linus Walleij wrote:
> > On Fri, Mar 17, 2023 at 7:51 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > The of_gpio.h is going to be removed. In preparation of that convert
> > > the driver to the agnostic API.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Thanks for fixing this Andy!
> > 
> > > -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> > > +#if IS_ENABLED(CONFIG_LCD_HX8357)
> > >                 /*
> > >                  * Himax LCD controllers used incorrectly named
> > >                  * "gpios-reset" property and also specified wrong
> > > @@ -452,7 +452,7 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
> > >                  */
> > >                 const char *compatible;
> > >         } gpios[] = {
> > > -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> > > +#if IS_ENABLED(CONFIG_LCD_HX8357)
> > >                 /* Himax LCD controllers used "gpios-reset" */
> > >                 { "reset",      "gpios-reset",  "himax,hx8357" },
> > >                 { "reset",      "gpios-reset",  "himax,hx8369" },
> > 
> > Eh what happened here .. it's even intuitively wrong.
> 
> I believe it had to be something  like
> 
> 	#if 0 && IS_ENABLED()
> 
> to show that this change is for the future.
> Currently it does something unneeded for the kernels with that option off.
> 
> > I would add
> > Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines
> > with legacy bindings")
> 
> I'm not sure. But it's fine, I can add it. Just want to double confirm
> you really want this Fixes tag.
> 
> > It wasn't used until now it seems so not a regression and no
> > need for a separate patch.
> 
> Exactly why I'm not sure about the tag :-)
> 
> > Other than that it looks correct.
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Thank you!

Lee, is anything I can do here to move this forward?

-- 
With Best Regards,
Andy Shevchenko


