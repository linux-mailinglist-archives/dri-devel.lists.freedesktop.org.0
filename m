Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F05485F9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 17:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE01E10E374;
	Mon, 13 Jun 2022 15:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA22110E495
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655134528; x=1686670528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VaArXUZWlGkR+Rg5TxqlTrvxLQWmF66TsY0IDaHvDJU=;
 b=JzOdkArhkg1sT0hN4GKBRuopGrBuEbyaOcz3m/LZuma1wv2ueOPYDJUs
 RZ1QLg58yHBfOtLchNDP1q3jIrHGWyhgTZc6U6DghPLFCAuVmSwQQscap
 x/LIqzuv3VBlJ3abgDVfR/guv6Kk0rMkE52fI8icDd4zc9dydHn1t193S
 zvof09LjwYZlVQklC1U8UXQ5O8A/hgSptCv85FwWn8T6RkGn7fhrd8MiO
 WIUiZitMjx/vDt4LTpg/zeAGD5YrYhcEXvpdk9ejIGWdyHatq2XcQ2ylP
 yJpZxpatiDt5t612okdyOQV3aXbQ9Eu7CzbNtjTNxCalbK66xzBCR90QQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="278355556"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="278355556"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 08:35:28 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="582283738"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 08:35:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1o0m64-000b8T-6V; Mon, 13 Jun 2022 18:35:20 +0300
Date: Mon, 13 Jun 2022 18:35:19 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Dominik Kierner <dkierner@dh-electronics.com>
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
Message-ID: <YqdZN6mtEDF2CRtS@smile.fi.intel.com>
References: <7a78d57342754a5d9bd3ce7c7bf3fa47@dh-electronics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a78d57342754a5d9bd3ce7c7bf3fa47@dh-electronics.com>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "noralf@tronnes.org" <noralf@tronnes.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 11:39:30AM +0000, Dominik Kierner wrote:
> On 5/25/2022 21:46, Javier Martinez Canillas wrote:

...

> > Thanks, I looked at the code briefly and think that there are things there that we
> > could use. I.e the 3-wire SPI support that's in panel-solomon-ssd130x-spi-3wire.c.
> 
> When writing my driver code, I wasn't even considering using regmaps,
> like You did in Your I2C-Code. If that's applicable for 3-wire-SPI,
> it would likely be the better, more generic option. Your SPI-code
> reuses these parts to some extent. For that case,
> ssd130x_spi_regmap_config.reg_bits would need be changed to 1,
> as the "register address" has a length of 1 bit and we are sending
> 9 bits over the line and not 16.
> Since we still have 2 bytes of host memory,
> it should still be compatible with the 4-wire write, right?
> Or would 3-wire SPI require a second regmap?

I believe the cleanest solution is to have different regmap configurations.


-- 
With Best Regards,
Andy Shevchenko


