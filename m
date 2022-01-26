Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0DE49CBE4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780A410E656;
	Wed, 26 Jan 2022 14:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FE810E656
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643206296; x=1674742296;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=37Crpy1HQSpJjEfNxm/BR1LrwtVeACM1zBGmbeLzZvQ=;
 b=X+Vrh8mH5yx+6G1Dm2r76MfFCMdYlGIz+R2EMWi7OPYz3PDea1C8FxCm
 wWEzCvubRoBVA8Q0OGarVkfN/QaIlIKvRr7wCeMv8TGQNlIkZQT2IcYLt
 pSbrPQrORVLjDAfI+pdqWGpzRBraOdGJRcu6I80+2vkA0yWA9hLTIMFRK
 u8eOoqX0eQsd/k0fwdSm/0EYjvwMCNjc53Do0+bF6oSc4yOQQkYVu7v16
 f7skVF9iv5TwKrFGldy5IJiio8yXae8bRmKvlIhkVQdkoDHDGAYcqxHNj
 7/NhrTXK55AJCxTIuF+8wVhkr5ms70K9kcTa3O5Bb2/e4iHww9kLQd6gw g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="307270155"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="307270155"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 06:11:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="696250344"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 06:11:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCizu-00EcTp-VD; Wed, 26 Jan 2022 16:10:06 +0200
Date: Wed, 26 Jan 2022 16:10:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfFWPmG2D093gz4N@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
 <YfEv7OQs98O9wJdJ@kroah.com> <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfFV4EJosayH+e6C@smile.fi.intel.com>
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

On Wed, Jan 26, 2022 at 04:08:32PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 26, 2022 at 02:46:08PM +0100, Javier Martinez Canillas wrote:
> > On 1/26/22 14:12, Andy Shevchenko wrote:

...

> > I've just bought a SSD1306 (I2C) based one and will attempt to write a DRM
> > driver using drivers/staging/fbtft/fb_ssd1306.c as a reference.
> 
> You should take ssd1307fb.c instead. And basically create a MIPI based driver
> for I2C. Then we won't go same road again for other similar devices.

For the record it supports your device:

static const struct i2c_device_id ssd1307fb_i2c_id[] = {
{ "ssd1305fb", 0 },
{ "ssd1306fb", 0 },
{ "ssd1307fb", 0 },
{ "ssd1309fb", 0 },


-- 
With Best Regards,
Andy Shevchenko


