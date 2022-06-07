Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0154142D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 22:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3474A10E166;
	Tue,  7 Jun 2022 20:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D987A10E166
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654633010; x=1686169010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7V/VA70lsYPB2rHKj1GQNpN5bDhVdxSUPtPF7P0+zbo=;
 b=fbsSxyQUV8mvku3KKGwZ4Q3jQfGS2tG5xtFQ/UQYvtEp3Gruj1nAwISO
 T0BGRmZkrfzuhlxavw2agJVj1n1BZrMCkN9yDls3FuDXCOoRrd9n2iT9L
 DrFYTjbJxxdvtO3Pc6uglyNTM6xtfoge6bLMscRY9NIV/k84H3vI4Li3r
 i2En5jse4+Z4prQcQ/Wu6+Y30kEYudIF7mhkUWRUkSybS0NMk026aoylM
 k6DuaWC/jpsS/9Bpp89904e/WwquViakZ/EhOsfMyRNXHBtX7z36QPkYU
 5kBK5lutWxf5/r/8/24S1hUc7HgRlcji5HKfyt92qU+pvRXPJ5emn2BSP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="257186936"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="257186936"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 13:16:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="648216227"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 13:16:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nyfd6-000W7i-N9; Tue, 07 Jun 2022 23:16:44 +0300
Date: Tue, 7 Jun 2022 23:16:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] staging: ftbft: Use backlight helper
Message-ID: <Yp+yLJNq70U3Z7AZ@smile.fi.intel.com>
References: <20220607185516.1129900-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220607185516.1129900-1-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Len Baker <len.baker@gmx.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 08:55:16PM +0200, Stephen Kitt wrote:
> backlight_properties.fb_blank is deprecated. The states it represents
> are handled by other properties; but instead of accessing those
> properties directly, drivers should use the helpers provided by
> backlight.h.
> 
> Instead of manually checking the power state in struct
> backlight_properties, use backlight_is_blank().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Len Baker <len.baker@gmx.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> ---
>  drivers/staging/fbtft/fb_ssd1351.c | 3 +--
>  drivers/staging/fbtft/fbtft-core.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
> index 6fd549a424d5..b8d55aa8c5c7 100644
> --- a/drivers/staging/fbtft/fb_ssd1351.c
> +++ b/drivers/staging/fbtft/fb_ssd1351.c
> @@ -196,8 +196,7 @@ static int update_onboard_backlight(struct backlight_device *bd)
>  		      "%s: power=%d, fb_blank=%d\n",
>  		      __func__, bd->props.power, bd->props.fb_blank);
>  
> -	on = (bd->props.power == FB_BLANK_UNBLANK) &&
> -	     (bd->props.fb_blank == FB_BLANK_UNBLANK);
> +	on = !backlight_is_blank(bd);
>  	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
>  	write_reg(par, 0xB5, on ? 0x03 : 0x02);
>  
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 60b2278d8b16..9b3eaed80cdd 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -137,8 +137,7 @@ static int fbtft_backlight_update_status(struct backlight_device *bd)
>  		      "%s: polarity=%d, power=%d, fb_blank=%d\n",
>  		      __func__, polarity, bd->props.power, bd->props.fb_blank);
>  
> -	if ((bd->props.power == FB_BLANK_UNBLANK) &&
> -	    (bd->props.fb_blank == FB_BLANK_UNBLANK))
> +	if (!backlight_is_blank(bd))
>  		gpiod_set_value(par->gpio.led[0], polarity);
>  	else
>  		gpiod_set_value(par->gpio.led[0], !polarity);
> 
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


