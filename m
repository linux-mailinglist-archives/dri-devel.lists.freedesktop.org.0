Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC55EAB23
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D6510E6EC;
	Mon, 26 Sep 2022 15:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E24F10E6E8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 15:32:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id cc5so10812029wrb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=0KlEo+afyt4apyvxaLqPEL4NYXEKz5IumQTdfwKfpco=;
 b=xoAHbUl+K1FV+nzNh1j3pmo5TlabCnsO83h8eMKm9rHlDB82YJ7aZGCJzVSGlL8J1F
 prRS6DaKF27OYe2itAcEOrguRqR3JSe2uABB/yaTFX/3DdGi/eZX1+asJSt6vVcim4xy
 iUrc+T5aQkrSWiQNtbScpF12JD3iXrdKtKCc5nw/EqgMvam2ccBd0Yw30/z6FMLF/bJ9
 FPcbyo+6x51hfV4+tEky8O1HUNmPN4z/fcM9YmCEKTo5GdEl8dlg7GK0O6oP08wUIuJa
 t3/l2cjZ8PFNTQDbkGcZy62nQ7mT2HaTctpyqC9QTPSR0flDO/QcVk7HdS2w/M8iJ+7K
 llGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=0KlEo+afyt4apyvxaLqPEL4NYXEKz5IumQTdfwKfpco=;
 b=vEW/cDHrmopbNhTWW6ZnKJ9cCk50mu0VsE1EOtNlFpOlLmcdtZp+jbg0imfjCWNF31
 SvuJkSxrxZOJel8BMEnhAtR6F2Mgx+avr1WOzCb7KBHlj6nSE13OpQg+EfldGF00Ejzy
 Aca4vAdqxawC6Dqjg3j1FT+YKOZIsrgb0UAsgsa4P22X+oGHMYkLmjAOIH6YudBU38rc
 as32MhwzC9qE9QVPFobacLgjTbEb4+xDquF2vEQEhdoXo0Z8EyXpYlRakTK5uhwZaNF0
 i1GgoxITodY4gKSdYJhdqyuk1jBD4M7N6GmMbEfrB6ja47zAwCX0XBvdtj6KsvDK7nxH
 IUaQ==
X-Gm-Message-State: ACrzQf25zKGqXNqNAUXlzuKVHciDK4pN9tGSej4hq0vkaps/WoFWH2iP
 HC7iskrv4tglF0ZK+aweDpOoog==
X-Google-Smtp-Source: AMsMyM52E5mqq6qKo38bBmoy7Uq9UewNHaL9e35Vmjh6mw2qQaPpjOuWlfz5YmM/Lchc3PeMqmWH1A==
X-Received: by 2002:a05:6000:1e14:b0:22b:3aa1:f310 with SMTP id
 bj20-20020a0560001e1400b0022b3aa1f310mr12237323wrb.108.1664206356053; 
 Mon, 26 Sep 2022 08:32:36 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c154900b003a3442f1229sm12860585wmg.29.2022.09.26.08.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:32:34 -0700 (PDT)
Date: Mon, 26 Sep 2022 16:32:32 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next v2] backlight: gpio_backlight: Switch to use
 dev_err_probe() helper
Message-ID: <YzHGEAoodSoamUIM@maple.lan>
References: <20220926142447.2296872-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926142447.2296872-1-yangyingliang@huawei.com>
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

On Mon, Sep 26, 2022 at 10:24:47PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2:
>   Remove "Error: " in error meassage
> ---
>  drivers/video/backlight/gpio_backlight.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 6f78d928f054..4ff3939e5f7e 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -64,13 +64,9 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	def_value = device_property_read_bool(dev, "default-on");
>
>  	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> -	if (IS_ERR(gbl->gpiod)) {
> -		ret = PTR_ERR(gbl->gpiod);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev,
> -				"Error: The gpios parameter is missing or invalid.\n");
> -		return ret;
> -	}
> +	if (IS_ERR(gbl->gpiod))
> +		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
> +				     "The gpios parameter is missing or invalid.\n");

Why keep the leading "The " ?


Daniel.
