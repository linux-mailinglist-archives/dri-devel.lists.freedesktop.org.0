Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43A546E36
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ED3113595;
	Fri, 10 Jun 2022 20:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED151113595
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=yEmxF5RyuM6RMfQHFf2TezZ0ZiQABnpS17ZaJPl6EqQ=;
 b=UAlFAD+ztWpTSVLTfAmDWbBZA+lPMct5ZeW+J2r/zjpZjfTNkcpjkmd3+zhT533zk8+qqQHbAnzqH
 cpeh7Oqi5k/hJcmWnrTKUPGfaIIihgCAUzdGOvFeD6KSU0UiXs1zsPUF5JIpCjHTehsIZel9F32l2G
 p67o/JErEFUoBuNjwfWTugwxHUZJdcSdl+HzNVqOgPykUYPrQKChzxphisQcve/2IaZlRc4flQhYvY
 o1BDzGOaZR+j6nsA4HZ3QHWFpEs4+3eiaaqW+d5A8C4jEFgxNzuKnW5NGd5/jYTo0SHBtZJ0nakHRD
 hOgbfvxcaQulThqQcO2O87NiDLHNoJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=yEmxF5RyuM6RMfQHFf2TezZ0ZiQABnpS17ZaJPl6EqQ=;
 b=Bl5CmF92iCOPaPPyQ2cIKsX1hMi/8oNriRyNnnQge7Ka7GakBmWpIsz8MeF5JDATkE2tbgS5tlwQ1
 K1xrDLYDQ==
X-HalOne-Cookie: 66b84489637b8b1ca6e0e2c3baf32dd9c570f798
X-HalOne-ID: 1ff957ae-e8fb-11ec-a6c0-d0431ea8a283
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 1ff957ae-e8fb-11ec-a6c0-d0431ea8a283;
 Fri, 10 Jun 2022 20:23:01 +0000 (UTC)
Date: Fri, 10 Jun 2022 22:22:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] staging: ftbft: Use backlight helper
Message-ID: <YqOoI6g6GVw0Z1s/@ravnborg.org>
References: <20220607185516.1129900-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220607185516.1129900-1-steve@sk2.org>
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
 Len Baker <len.baker@gmx.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Tue, Jun 07, 2022 at 08:55:16PM +0200, Stephen Kitt wrote:
> backlight_properties.fb_blank is deprecated. The states it represents
> are handled by other properties; but instead of accessing those
> properties directly, drivers should use the helpers provided by
> backlight.h.
> 
> Instead of manually checking the power state in struct
> backlight_properties, use backlight_is_blank().
> 
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
Could you try to kill this use of props.fb_blank too?      ^^^^^^
A local variable should do the trick.

	Sam

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
