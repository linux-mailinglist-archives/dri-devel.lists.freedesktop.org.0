Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C87AB5EE0C7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 17:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E523910EA1E;
	Wed, 28 Sep 2022 15:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9E010EA1E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 15:45:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id o5so8807443wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=7G3PuyNs64T9+gNR4JUjnzY5lk+niLsGepAuneEIq0w=;
 b=ebxtewCKg6Aw7sEhbafCVh2tV7gW3FtInBneELrdjdkiu+dKVDa9YTB/6MHEVZ46Oi
 kHyWz7s6BtiC34kK39iVyuAuyY45+guJXEGy60rDx66FlnbjUwZ+mVaYbUcamCdMSWAz
 lr5ujmue0ikcfocE6hqZ7NCooyv/r5fpvjniaRJIZxGRwHpEzJNhwE9QFNRZpBfeSas4
 II1JAmZ2NLZxMNRT+nGjCGmEALid+B4J6FeerzYKpH0vjz362X62SwGckjzOkwPky3g4
 ZmFu5ghXCJNpwBhpWE1ZYRsaYXZQvvzg6Gfd/vywIzzgB1Wj720jx13ktCy/RhzxmWfm
 c/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=7G3PuyNs64T9+gNR4JUjnzY5lk+niLsGepAuneEIq0w=;
 b=EVdODKaw0Ci/HlfOo9hv2gT9o7SgY3tSJvwUN/I/REN7+rKkWyNa92TgfwkG5uTlO9
 Uecslbwc9PqdotbeT2NtwjjVd7tbIwzEhz+9DlKabUnl4nxWdwki8IOv5/CRLsWWqT+b
 mvshl3bG14z4GhcdapLWP28KW99aKW/fgHNQ7dCZBEYK7aZfYgquiEt2RPBQUsd5rTr1
 FVMpdnKI17OqgL/ZZSdgtRXlxd6f3uGOc+eOlODHIhYGxZ7Mhe5LwIhio1/zYaciiZCL
 /JU/lqatO/MrwVZzgoK7OBnosBT6L3DHfZJkPcuCA34H+kGNEA2pF4S2VT2ehQAtDi7w
 G1Kw==
X-Gm-Message-State: ACrzQf0xa4X08lVLb7T+z3sgwaDr6kaVJdAUGiij0eGrQNnOn/TpUM7o
 AjONcOUXyTrMPX9eFDCFcKUEY8GoV/h001f1
X-Google-Smtp-Source: AMsMyM5BZHRf8L6EwpVwJJ6b3Z3NoGDGct+cLKKAcKLtqvIEaEBwJztpMDX+I8JGUhpWU+dAsNt53Q==
X-Received: by 2002:a05:600c:20b:b0:3b4:86ff:cd with SMTP id
 11-20020a05600c020b00b003b486ff00cdmr7484665wmi.35.1664379915320; 
 Wed, 28 Sep 2022 08:45:15 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d410d000000b0022cbcfa8447sm4635006wrp.87.2022.09.28.08.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:45:14 -0700 (PDT)
Date: Wed, 28 Sep 2022 16:45:13 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v2] backlight: gpio_backlight: Switch to use
 dev_err_probe() helper
Message-ID: <YzRsCQcUfC+ClbSl@maple.lan>
References: <20220926142447.2296872-1-yangyingliang@huawei.com>
 <YzHGEAoodSoamUIM@maple.lan>
 <7d8cfce2-ba08-afc0-de2d-972ee15b5865@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d8cfce2-ba08-afc0-de2d-972ee15b5865@huawei.com>
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org, lee@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 10:17:32AM +0800, Yang Yingliang wrote:
> Hi
>
> On 2022/9/26 23:32, Daniel Thompson wrote:
> > On Mon, Sep 26, 2022 at 10:24:47PM +0800, Yang Yingliang wrote:
> > > In the probe path, dev_err() can be replaced with dev_err_probe()
> > > which will check if error code is -EPROBE_DEFER and prints the
> > > error name. It also sets the defer probe reason which can be
> > > checked later through debugfs. It's more simple in error path.
> > >
> > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > ---
> > > v2:
> > >    Remove "Error: " in error meassage
> > > ---
> > >   drivers/video/backlight/gpio_backlight.c | 10 +++-------
> > >   1 file changed, 3 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> > > index 6f78d928f054..4ff3939e5f7e 100644
> > > --- a/drivers/video/backlight/gpio_backlight.c
> > > +++ b/drivers/video/backlight/gpio_backlight.c
> > > @@ -64,13 +64,9 @@ static int gpio_backlight_probe(struct platform_device *pdev)
> > >   	def_value = device_property_read_bool(dev, "default-on");
> > >
> > >   	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> > > -	if (IS_ERR(gbl->gpiod)) {
> > > -		ret = PTR_ERR(gbl->gpiod);
> > > -		if (ret != -EPROBE_DEFER)
> > > -			dev_err(dev,
> > > -				"Error: The gpios parameter is missing or invalid.\n");
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(gbl->gpiod))
> > > +		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
> > > +				     "The gpios parameter is missing or invalid.\n");
> > Why keep the leading "The " ?
> OK, I will remove it in v3.
>
> But you says "the resulting line will read better with a "The " at
> beginning" in your last mail,
> I am confused about this.

That's because my e-mail was confusing! Thanks for fixing it.


Daniel.
