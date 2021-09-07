Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31181402636
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 11:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5DA893ED;
	Tue,  7 Sep 2021 09:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2DE893ED
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 09:31:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so1664160wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AqCBcpOKIxaebNIokP1AWBP6ZbSBum5V1BZ707Wyq8E=;
 b=Dwk4JEWWYgCYK7blSsU8LQW0rDzpzhFhAxeuq3wDz3+XejZ1XNJVCvUvhGMPzkQBbK
 hNvSVNdQZ1J67BTL+JT3z5IPD/gfrk5oLhuHwVrDLLB9l+4fYT7OsAiAXgElk7VcFimw
 C4nxfRf8CWVE+gwn0qqZ+Ktlw56o6kS34lIDEZ22R4SFhcZofZmImejrlLpf96KDD7DI
 MNz8v5EoniqHVbMPEuSQ7kkCvHk6XStFzNCzYVAWIpDu9+Pvkxnf8Nqdf3NK3KiZny55
 QGGMfKUkQjrsJMnSUcetQ/lXgEpa/BZZGGuA9Nz/mWWj4nmTjv+mwXdgN76nYKZYnXxZ
 Wuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AqCBcpOKIxaebNIokP1AWBP6ZbSBum5V1BZ707Wyq8E=;
 b=lOFzzYo8nCio09HBhqBdxpCQHV3knIYseteEIgIcB5F8nCcmY8McFPJS2oA2faEQGb
 ICGnKg66DjFHFe8CFwNYJJQwFp7hsn3yMtgZf+g7nfK0RpmbUw5V21DVzZkRfEQtjMyw
 998+aOxPK0DjJ56D4lGV2JigpqhNzlxEapKY0fvIJ281g/QVnLC+GHsaC7fcG+MURvmj
 J3KqhMh6cePJztD/PnzJLFIcj9h7/14RzQgWRWlRlBWQJmdiu7gD5ZhgN8G9NQe1jaC2
 Zg40O4E2pqHheIraNAib7E7dx2fct0AwaGwvCnaY7ZIyn2rg1R4AtsTPHD/ZjolD4/LZ
 2jUg==
X-Gm-Message-State: AOAM530lCOizypZbs4aMJCkrZvMonOe8gCE8JfTGHNBKJ5DsITTcVCdV
 Yb7y4BrdrpNevJxofx0YkldWIg==
X-Google-Smtp-Source: ABdhPJz0j9H3loRG3Z9thA8ApTEszOgaQ+1fEKo5SFusKiSgqd/P1ZoCuwReB4WAx9eOP6pYg0SWoA==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr2885572wmc.15.1631007112023;
 Tue, 07 Sep 2021 02:31:52 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id y24sm2202846wma.9.2021.09.07.02.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 02:31:51 -0700 (PDT)
Date: Tue, 7 Sep 2021 10:31:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: propagate errors from get_brightness()
Message-ID: <20210907093149.2sk3d2jsrekearpa@maple.lan>
References: <20210906215525.15418-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210906215525.15418-1-linux@weissschuh.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 06, 2021 at 11:55:25PM +0200, Thomas Weiﬂschuh wrote:
> backlight.h documents "struct backlight_ops->get_brightness()" to return
> a negative errno on failure.
> So far these errors have not been handled in the backlight core.
> This leads to negative values being exposed through sysfs although only
> positive values are documented to be reported.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Change looks good overall but I've raised a few quibbles about the new
error message below.


> ---
>  drivers/video/backlight/backlight.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 537fe1b376ad..d681962f8509 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -292,10 +292,13 @@ static ssize_t actual_brightness_show(struct device *dev,
>  	struct backlight_device *bd = to_backlight_device(dev);
>  
>  	mutex_lock(&bd->ops_lock);
> -	if (bd->ops && bd->ops->get_brightness)
> -		rc = sprintf(buf, "%d\n", bd->ops->get_brightness(bd));
> -	else
> +	if (bd->ops && bd->ops->get_brightness) {
> +		rc = bd->ops->get_brightness(bd);
> +		if (rc >= 0)
> +			rc = sprintf(buf, "%d\n", rc);
> +	} else {
>  		rc = sprintf(buf, "%d\n", bd->props.brightness);
> +	}
>  	mutex_unlock(&bd->ops_lock);
>  
>  	return rc;
> @@ -381,9 +384,18 @@ ATTRIBUTE_GROUPS(bl_device);
>  void backlight_force_update(struct backlight_device *bd,
>  			    enum backlight_update_reason reason)
>  {
> +	int brightness;
> +
>  	mutex_lock(&bd->ops_lock);
> -	if (bd->ops && bd->ops->get_brightness)
> -		bd->props.brightness = bd->ops->get_brightness(bd);
> +	if (bd->ops && bd->ops->get_brightness) {
> +		brightness = bd->ops->get_brightness(bd);
> +		if (brightness >= 0)
> +			bd->props.brightness = brightness;
> +		else
> +			dev_warn(&bd->dev,
> +				 "Could not update brightness from device: errno = %d",
> +				 -brightness);

The format string is missing a \n and should it really be a dev_warn()?
Is dev_err() more appropriate?

Also please print the error symbolically (which is self explaining
meaning we don't need the errno prefix):

		"Could not update brightness from device: %pe\n",
		ERR_PTR(brightness)



Daniel.


> +	}
>  	mutex_unlock(&bd->ops_lock);
>  	backlight_generate_event(bd, reason);
>  }
> 
> base-commit: 79fad92f2e596f5a8dd085788a24f540263ef887
> -- 
> 2.33.0
> 
