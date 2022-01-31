Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94044A450F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 12:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912A610E3A0;
	Mon, 31 Jan 2022 11:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8C310E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643629055; x=1675165055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lI9J06ShMDzX4snLdMSWm2sVJLb4bsM0sL6ARCPRO8s=;
 b=ZkxmOalOGXjlNf/PX5LLvzvsbw75MIsno3j22Ds6lBQpxyPsH43+imL1
 yHubldVjdyrff5otJZzDkYWJGLRKa9EzgyMChFb17HtbVKczzEgCHcX3z
 uLJMjpeCj6EU45n8UlytBhqsslSkzj82+hsfLBhoVVwVgHhBXUC71H+iW
 /BUvO8+xAbUuwVYNJIbXV/h7rnBxqNBFBAeboHPtncdcEdOcgfoslZns3
 RMUKtPmqv+iCcJIKa3jplBq2HgC6FeB1P//NP8XHNme1M5oMPVl72t/RA
 YYlji8dpGxkwQbhqveQK0gfkBEP4+AqPr6ExeNDjPJ1xnF7TigaPU8TpT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247397382"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="247397382"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 03:37:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="619355861"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 03:37:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nEUyx-00Gqnl-AM; Mon, 31 Jan 2022 13:36:27 +0200
Date: Mon, 31 Jan 2022 13:36:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YffJujbpUGUqpIk/@smile.fi.intel.com>
References: <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <YfEv7OQs98O9wJdJ@kroah.com> <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com>
 <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 09:29:33AM +0100, Javier Martinez Canillas wrote:
> On 1/26/22 15:15, Javier Martinez Canillas wrote:
> > On 1/26/22 15:10, Andy Shevchenko wrote:
> >> On Wed, Jan 26, 2022 at 04:08:32PM +0200, Andy Shevchenko wrote:
> >>> On Wed, Jan 26, 2022 at 02:46:08PM +0100, Javier Martinez Canillas wrote:
> >>>> On 1/26/22 14:12, Andy Shevchenko wrote:
> >>
> >> ...
> >>
> >>>> I've just bought a SSD1306 (I2C) based one and will attempt to write a DRM
> >>>> driver using drivers/staging/fbtft/fb_ssd1306.c as a reference.
> >>>
> >>> You should take ssd1307fb.c instead. And basically create a MIPI based driver
> >>> for I2C. Then we won't go same road again for other similar devices.
> >>
> >> For the record it supports your device:
> >>
> >> static const struct i2c_device_id ssd1307fb_i2c_id[] = {
> >> { "ssd1305fb", 0 },
> >> { "ssd1306fb", 0 },
> >> { "ssd1307fb", 0 },
> >> { "ssd1309fb", 0 },
> >>
> >>
> > 
> > Thanks a lot for the pointer. I was only looking at drivers/staging
> > and didn't check drivers/video. I'll try to convert that one then
> > once I get the display.
> > 
> 
> I got some time this weekend and was able to port the ssd1306 fbdev driver
> to DRM [0]. I'm not that familiar with the simple display pipe helpers, so
> there may be some wrong things there. But it does work and all the fbtests
> from https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git pass.

Thanks! Good news, everybody!

> There are some hacks in the driver though. For example it exposes an XRGB8888
> format even thought the OLED display is monochromatic and has 1 bit per pixel.
> 
> The driver then goes and converts the XRGB8888 pixels first to grayscale and
> then to reverse mono. I took that idea from the repaper driver but that gives
> us the multiple copies that Geert was complaining about.
> 
> Another hack is that I am just hardcoding the {width, height}_mm, but I don't
> know what DPI could be used for these panels nor how I could calculate the mm.

I think the hacks is the first what should be eliminated, also see below.

...

> +config TINYDRM_SSD130X
> +	tristate "DRM support for Solomon SSD130X OLED displays"
> +	depends on DRM && OF && I2C

Please, make sure that it does NOT dependent on OF.

...

> +obj-$(CONFIG_TINYDRM_SSD130X)		+= ssd130x.o

I would keep the original name since we have I2C (fbdev) implementation, SPI
and platform (fbtft), and now i2c (drm). I would like to avoid more confusion
that we already have.

-- 
With Best Regards,
Andy Shevchenko


