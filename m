Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307B16C1143
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 12:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E29210E417;
	Mon, 20 Mar 2023 11:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBA910E545
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679313272; x=1710849272;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tSGuRyYCkEG5apEu/urBdXyfINko5BoAavDLnCG0vqA=;
 b=S9O9o4hmdt1CkPO/rM1kpZ7MFVwLUalPk+GFzsdeGSudrtCeoxGtMFoE
 uC6CFzmuFhkRzutilHkBYv7tLBx8GrqjcFwFWqtL/X11U1vOfTBQ8GD/z
 vMtO8EzVKsia1yBh2KVg1/6TiJWMSCPRCl+i6tx0LxIWP5JkILbjbGY2z
 Rby5wGiUBmlU6t2rTcQyxAT7URKVuf/SP8jbzLwg07+XH/RB0xAbfWfFF
 u8paG+Ekof/pFs30ZpmS2MeoKi8/erM4H+mb+Vbb+p6OjxtV2a6X3lNAQ
 hPVdQ/mR0B19zblLflJLI8lNfMHi4sDzA03fOAWbl/XmV5cj4QeVbHr1h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="319040992"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="319040992"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 04:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804880875"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="804880875"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 04:54:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1peE5q-006Fq3-2q; Mon, 20 Mar 2023 13:54:26 +0200
Date: Mon, 20 Mar 2023 13:54:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] backlight: hx8357: Convert to agnostic GPIO API
Message-ID: <ZBhJctqSkdtoUmBi@smile.fi.intel.com>
References: <20230317185230.46189-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYXTk2pzXEM9MTjt=oT-CbhENABSLeb9dN7ZvEy8oqiag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYXTk2pzXEM9MTjt=oT-CbhENABSLeb9dN7ZvEy8oqiag@mail.gmail.com>
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

On Fri, Mar 17, 2023 at 09:53:40PM +0100, Linus Walleij wrote:
> On Fri, Mar 17, 2023 at 7:51 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The of_gpio.h is going to be removed. In preparation of that convert
> > the driver to the agnostic API.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks for fixing this Andy!
> 
> > -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> > +#if IS_ENABLED(CONFIG_LCD_HX8357)
> >                 /*
> >                  * Himax LCD controllers used incorrectly named
> >                  * "gpios-reset" property and also specified wrong
> > @@ -452,7 +452,7 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
> >                  */
> >                 const char *compatible;
> >         } gpios[] = {
> > -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> > +#if IS_ENABLED(CONFIG_LCD_HX8357)
> >                 /* Himax LCD controllers used "gpios-reset" */
> >                 { "reset",      "gpios-reset",  "himax,hx8357" },
> >                 { "reset",      "gpios-reset",  "himax,hx8369" },
> 
> Eh what happened here .. it's even intuitively wrong.

I believe it had to be something  like

	#if 0 && IS_ENABLED()

to show that this change is for the future.
Currently it does something unneeded for the kernels with that option off.

> I would add
> Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines
> with legacy bindings")

I'm not sure. But it's fine, I can add it. Just want to double confirm
you really want this Fixes tag.

> It wasn't used until now it seems so not a regression and no
> need for a separate patch.

Exactly why I'm not sure about the tag :-)

> Other than that it looks correct.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


