Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59FA1ADEF9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DE76EA88;
	Fri, 17 Apr 2020 14:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65B56E409
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140734euoutp01e207f5036611a421de0c8b31d02511eb~GoI7sgQOV1953319533euoutp01k
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200417140734euoutp01e207f5036611a421de0c8b31d02511eb~GoI7sgQOV1953319533euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132454;
 bh=+mRo0y+WREjEvM6VZR45Y8nyy/gok+B+AK9fCUNLJY4=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=M1xh9nbgeRpS+5C5hOus4iIqzF6YGARbG2bXwFKW+DP/S1/Dps+kGfT5AjbhrpeDR
 KUU/AbTZ0EYmM/8qEsya9OVyQipuwVLvibrOEKuMqYH7KJkCbvs2ZR+XfGQZfx2+zE
 LOxBZsGIlhxIB6PRb+vERbYNbUuZhIZ40ZmQfa6M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200417140734eucas1p12e34024b5a4bed6f5f96ad3a7c1dc876~GoI7gSxWc1437814378eucas1p1T;
 Fri, 17 Apr 2020 14:07:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 51.4C.61286.628B99E5; Fri, 17
 Apr 2020 15:07:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140733eucas1p280e53209e70586c8dde064b6cd6c24d2~GoI7MSHCW1167511675eucas1p2v;
 Fri, 17 Apr 2020 14:07:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140733eusmtrp18ef0244ee0d59e63f3cded17fb2191e2~GoI7JMhnm2210922109eusmtrp1o;
 Fri, 17 Apr 2020 14:07:33 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-fb-5e99b826acaa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 67.B2.08375.528B99E5; Fri, 17
 Apr 2020 15:07:33 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200417140733eusmtip1317ddb38855c782686c85c5d5640a138~GoI63dUps0911109111eusmtip1M;
 Fri, 17 Apr 2020 14:07:33 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v1 2/5] video: ssd1307fb: Introduce temporary variable
 to increase readability
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <3a7ef743-580a-d5e6-08b8-07507c6c6ea7@samsung.com>
Date: Fri, 17 Apr 2020 16:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324170532.44384-2-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87pqO2bGGazczGbR2zSdyeLK1/ds
 Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wASxSXTUpqTmZZapG+XQJXRtOzzSwF
 n1Uqlj/Ra2C8ItvFyMkhIWAicelpP3MXIxeHkMAKRolra6ewQzhfGCWmNV5ng3A+M0rsaW5g
 hmmZ/eQqC0RiOaPE6tV/oKreMkqsv/QBrIpNwEpiYvsqxi5GDg5hgRSJtT/cQMIiAuYS6yYt
 YgOxmQVCJTY0vGcHsXkF7CS6bl5gBilnEVCVmHfeHSQsKhAh8enBYVaIEkGJkzOfsIDYnALu
 Eocv3GaHGCMucevJfCYIW15i+9s5YO9ICExml7j+cSsLxNEuEuc2bmWFsIUlXh3fwg5hy0ic
 ntzDAtGwjlHib8cLqO7tjBLLJ/9jg6iylrhz7hcbyHXMApoS63fpQ4QdJTraGthBwhICfBI3
 3gpCHMEnMWnbdGaIMC9QiRBEtZrEhmUb2GDWdu1cyTyBUWkWktdmIXlnFpJ3ZiHsXcDIsopR
 PLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwrZz+d/zTDsavl5IOMQpwMCrx8Br0zIwTYk0s
 K67MPcQowcGsJMJ70A0oxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQi
 mCwTB6dUA+Os0vobU3vXT+M8d+GGfFIpX2aD8ee2hck7UmdnXPmuYDYxdUnEZ505jw64M8Qc
 mX/jwLLZFzlyDk07+OzXkT3GVoXbVxm0q/3wtTRQXfLqD49KyYnymN9GG6cdTbK0dwqOe7T1
 kVEZ56NDi4O6Aw7829ywfc7jvztvh7Rt7bEKFhLYNEXFUuOsEktxRqKhFnNRcSIAncdoricD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7qqO2bGGZx/rmPR2zSdyeLK1/ds
 Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wAS5SeTVF+aUmqQkZ+cYmtUrShhZGe
 oaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRtOzzSwFn1Uqlj/Ra2C8ItvFyMkhIWAi
 MfvJVZYuRi4OIYGljBJbtj1g62LkAErISBxfXwZRIyzx51oXG0TNa0aJQwe2MIMk2ASsJCa2
 r2IEsYUFUiQuPnnJDmKLCJhLrJu0iA3EZhYIlbh/ex0TRPN1Ron/t2exgCR4Bewkum5eYAZZ
 xiKgKjHvvDtIWFQgQuLwjlmMECWCEidnPgEr5xRwlzh84TY7xEx1iT/zLjFD2OISt57MZ4Kw
 5SW2v53DPIFRaBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwDja
 duzn5h2MlzYGH2IU4GBU4uE16JkZJ8SaWFZcmXuIUYKDWUmE96AbUIg3JbGyKrUoP76oNCe1
 +BCjKdBvE5mlRJPzgTGeVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
 U6qBsXupKbe/f1haZm7L366GWQfOe01d92yz4/40DZ2YJToHuX/8WL36bXPwkeUbKnc/mHzO
 l3u1/0+OqBeOqVJqs37Gec3ekbg99IMNw8/4/vpbS7WPHgtI3/YuwOno0yaVvh1m71/t7tsj
 wnqKY5fgrNS0SSp/jyd1Cl49qSik9IytOKXayuJ0hBJLcUaioRZzUXEiAM4uVc65AgAA
X-CMS-MailID: 20200417140733eucas1p280e53209e70586c8dde064b6cd6c24d2
X-Msg-Generator: CA
X-RootMTR: 20200324170551eucas1p2a568c0296a5773cdf70e162c5a1e9b72
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324170551eucas1p2a568c0296a5773cdf70e162c5a1e9b72
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
 <CGME20200324170551eucas1p2a568c0296a5773cdf70e162c5a1e9b72@eucas1p2.samsung.com>
 <20200324170532.44384-2-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, xllacyx@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ added dri-devel ML to Cc: ]

On 3/24/20 6:05 PM, Andy Shevchenko wrote:
> Introduce temporary variable to increase readability of the code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch queued for v5.8 (w/ few lines over 80 characters fixed), thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/ssd1307fb.c | 34 ++++++++++++++-------------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 397eae246c2c..84dfd7b0f682 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -588,6 +588,7 @@ MODULE_DEVICE_TABLE(of, ssd1307fb_of_match);
>  
>  static int ssd1307fb_probe(struct i2c_client *client)
>  {
> +	struct device *dev = &client->dev;
>  	struct backlight_device *bl;
>  	char bl_name[12];
>  	struct fb_info *info;
> @@ -598,7 +599,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  	void *vmem;
>  	int ret;
>  
> -	info = framebuffer_alloc(sizeof(struct ssd1307fb_par), &client->dev);
> +	info = framebuffer_alloc(sizeof(struct ssd1307fb_par), dev);
>  	if (!info)
>  		return -ENOMEM;
>  
> @@ -608,23 +609,20 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  
>  	par->device_info = of_device_get_match_data(&client->dev);
>  
> -	par->reset = devm_gpiod_get_optional(&client->dev, "reset",
> -					     GPIOD_OUT_LOW);
> +	par->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(par->reset)) {
> -		dev_err(&client->dev, "failed to get reset gpio: %ld\n",
> -			PTR_ERR(par->reset));
> +		dev_err(dev, "failed to get reset gpio: %ld\n", PTR_ERR(par->reset));
>  		ret = PTR_ERR(par->reset);
>  		goto fb_alloc_error;
>  	}
>  
> -	par->vbat_reg = devm_regulator_get_optional(&client->dev, "vbat");
> +	par->vbat_reg = devm_regulator_get_optional(dev, "vbat");
>  	if (IS_ERR(par->vbat_reg)) {
>  		ret = PTR_ERR(par->vbat_reg);
>  		if (ret == -ENODEV) {
>  			par->vbat_reg = NULL;
>  		} else {
> -			dev_err(&client->dev, "failed to get VBAT regulator: %d\n",
> -				ret);
> +			dev_err(dev, "failed to get VBAT regulator: %d\n", ret);
>  			goto fb_alloc_error;
>  		}
>  	}
> @@ -674,15 +672,14 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  	vmem = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
>  					get_order(vmem_size));
>  	if (!vmem) {
> -		dev_err(&client->dev, "Couldn't allocate graphical memory.\n");
> +		dev_err(dev, "Couldn't allocate graphical memory.\n");
>  		ret = -ENOMEM;
>  		goto fb_alloc_error;
>  	}
>  
> -	ssd1307fb_defio = devm_kzalloc(&client->dev, sizeof(*ssd1307fb_defio),
> -				       GFP_KERNEL);
> +	ssd1307fb_defio = devm_kzalloc(dev, sizeof(*ssd1307fb_defio), GFP_KERNEL);
>  	if (!ssd1307fb_defio) {
> -		dev_err(&client->dev, "Couldn't allocate deferred io.\n");
> +		dev_err(dev, "Couldn't allocate deferred io.\n");
>  		ret = -ENOMEM;
>  		goto fb_alloc_error;
>  	}
> @@ -720,8 +717,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  	if (par->vbat_reg) {
>  		ret = regulator_enable(par->vbat_reg);
>  		if (ret) {
> -			dev_err(&client->dev, "failed to enable VBAT: %d\n",
> -				ret);
> +			dev_err(dev, "failed to enable VBAT: %d\n", ret);
>  			goto reset_oled_error;
>  		}
>  	}
> @@ -732,17 +728,15 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  
>  	ret = register_framebuffer(info);
>  	if (ret) {
> -		dev_err(&client->dev, "Couldn't register the framebuffer\n");
> +		dev_err(dev, "Couldn't register the framebuffer\n");
>  		goto panel_init_error;
>  	}
>  
>  	snprintf(bl_name, sizeof(bl_name), "ssd1307fb%d", info->node);
> -	bl = backlight_device_register(bl_name, &client->dev, par,
> -				       &ssd1307fb_bl_ops, NULL);
> +	bl = backlight_device_register(bl_name, dev, par, &ssd1307fb_bl_ops, NULL);
>  	if (IS_ERR(bl)) {
>  		ret = PTR_ERR(bl);
> -		dev_err(&client->dev, "unable to register backlight device: %d\n",
> -			ret);
> +		dev_err(dev, "unable to register backlight device: %d\n", ret);
>  		goto bl_init_error;
>  	}
>  
> @@ -750,7 +744,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
>  	bl->props.max_brightness = MAX_CONTRAST;
>  	info->bl_dev = bl;
>  
> -	dev_info(&client->dev, "fb%d: %s framebuffer device registered, using %d bytes of video memory\n", info->node, info->fix.id, vmem_size);
> +	dev_info(dev, "fb%d: %s framebuffer device registered, using %d bytes of video memory\n", info->node, info->fix.id, vmem_size);
>  
>  	return 0;
>  
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
