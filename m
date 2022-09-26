Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBE45EA795
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 15:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFA210E407;
	Mon, 26 Sep 2022 13:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D0310E407
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 13:46:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t14so10297456wrx.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 06:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=wDQyQ3S0noabZCtBYiSEuTtioa8Tv5/nq3tQQLE9mKc=;
 b=HmMw8Wwy5JCjR+G3NafWR1FccJnh/abIUElXkN8PqAMd8eYqr4DOabI/1FP++8LzTX
 EZklm3RPUCHlTp0AiLRF8O2jD4n0mGtwN/os3mtdL6JV6RiqcQ/Aq4G+y/m09T3uoj4C
 PTO8+C00QybJdTvT3r6f64nxZxG88Q9Kl34VaKIXdp9T7shJhI/sphgADxXcUajnirlj
 0ftM7Oyk0H1vnAiLq0QAnc1bZht44AYy3TzGu6Dzl5kNMCsBAKm6ZqezQ76Mhy1sPwpa
 c5t1VLQohKo/3Cf64X8exMLjttJg7TLAgGZQ2ohv9AC6RVzr4AQ6zbNu/eNtXXoRE61M
 +xmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=wDQyQ3S0noabZCtBYiSEuTtioa8Tv5/nq3tQQLE9mKc=;
 b=x8XyXC1l4aTF0Bj+fsry6VbIwJ77909hnmwaH8y5wQGctljGjV5nxTNFGUFE+cscso
 L0k/xPXKr03dAAujY8MFpmi3eB33SRG0t5mPVaJYmEC/FH85mu3yzvv1jPo0AepI6VQe
 ve1X2hpzPJsYW+Qkry328j71JXJ/X28wkBOjKj+yV334knsgFchicOOH0Zy0QSJahgGZ
 nGt4Bs7sOsTGGj2rD+MW/L8JKW5olZ42ySUcDWa5fcL20WRtFC6jiuIOZ6wUwLjV/O/7
 8Wk0dQNARDeGpljFQbtMkqtTwjy6LvOJ7kbucqeW5V9E5Az3lvIKrCi4cACYq0+FmsyV
 cyHQ==
X-Gm-Message-State: ACrzQf3GJz133zmk+ankMtT3GI2REB1V23srZB+D7mW6OueF525dWt/V
 ywkpGzZildsnPVNBlb2kEdphzA==
X-Google-Smtp-Source: AMsMyM6vGVKMMO0iJnizEQFuXAHVtiSiwAqIlwKS4/L7rIE6+LpojI+p45OCYJeOgJsaHzmDYHzYng==
X-Received: by 2002:a05:6000:984:b0:228:60fb:e364 with SMTP id
 by4-20020a056000098400b0022860fbe364mr13404183wrb.66.1664200010433; 
 Mon, 26 Sep 2022 06:46:50 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 x12-20020a5d650c000000b00228cbac7a25sm14499606wru.64.2022.09.26.06.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:46:49 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:46:48 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] backlight: gpio_backlight: Switch to use
 dev_err_probe() helper
Message-ID: <YzGtSPDMQNUf41Z9@maple.lan>
References: <20220926133819.1298856-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926133819.1298856-1-yangyingliang@huawei.com>
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

On Mon, Sep 26, 2022 at 09:38:19PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.

Needs an SoB.


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
> +				     "Error: The gpios parameter is missing or invalid.\n");

Remove the "Error: The " from the beginning of the string:
dev_err_probe() adds an error tag and the resulting line will read
better with a "The " at the beginning.


Daniel.
