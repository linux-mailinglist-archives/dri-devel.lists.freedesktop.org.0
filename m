Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45CF442DBC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 13:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA686E958;
	Tue,  2 Nov 2021 12:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCA06E958
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 12:22:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d5so17698646wrc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 05:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PPrVvkKpDShrC2goi1J/Uno+TTdyeE7cxJPzYCbMSPg=;
 b=jxU04U0MA10e7Y9U6CN0a4OFuXLVChKzFdX2BjfJHLmAeI8hJ1qIVqZRMXuo1qTWJJ
 cVBoleFGmLtwyZh9rJDn75yqDgsZYr6c3qDRg9+tzXmS0nKqg3r/iJGblkGBkICrZKcc
 HZHjvOuCGu6J+o5WZ0qcYYidKMyhW0ow1egcdY0EBDTbkco3CzcO1fV0Gam4qcd6+NhQ
 g5c4D5HbGdriLR3dD94mKdWrQ76lxel8gklujAv1GprHxc4TlQBceogA43e6BtZZWzKv
 IVVDJRjA7rzJKa8NetTDVdXGdYt32YEoyK2FvVFb1OX99fxZsP+XX7jFJv39Z/YMqC/r
 UPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PPrVvkKpDShrC2goi1J/Uno+TTdyeE7cxJPzYCbMSPg=;
 b=VV4MNktfkTXKVzhc819UOxn/i2uJTTcuoy9jokKldApqVrO9PRlHANJ8hi571GDace
 7BBljk0zUxVwNGUAunZ4iY2RCEhog+3ExykcXYneJC65f9YzL+1bXxGevIe0M9Oo4XYs
 Pb3DITiLATjOccLTaHS1Qka5zjE3iSC9WRE0kftJC4eTB8LiKgKcFKSp6RpB5m/0s1s4
 GT5mWUCAs9r8LT3/re2tilv+GdPM5G4QcpwaSIPxquQa3DKxe3Ewp+QZXJ93vu34jX4B
 8X+ocpZtC8i/QtP2g8aMZz+ybKg9beainJ21PzXnjRqiEQ8HtBh37go5ca5rJxHViYDM
 fUEA==
X-Gm-Message-State: AOAM532dqfozQs6l9o52zD5i2cpbY9fyLfJgKNsjwcfhB7U7kulPjGUS
 sqcN5gh+O0sUEtZLUgN+drecAQ==
X-Google-Smtp-Source: ABdhPJw2cKX4hOFi9O3gYybeogMRGL3fiRW5uZVJYAl/ga+gA0jafphuJrk6wM5hf/6vINnLKSD2uA==
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr22288639wrz.127.1635855775993; 
 Tue, 02 Nov 2021 05:22:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id m20sm2634572wmq.5.2021.11.02.05.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 05:22:55 -0700 (PDT)
Date: Tue, 2 Nov 2021 12:22:53 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/3] backlight: lp855x: Add support ACPI enumeration
Message-ID: <20211102122253.s4oc2p7hmy7w2qgn@maple.lan>
References: <20211101185518.306728-1-hdegoede@redhat.com>
 <20211101185518.306728-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101185518.306728-3-hdegoede@redhat.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 01, 2021 at 07:55:17PM +0100, Hans de Goede wrote:
> The Xiaomi Mi Pad 2 tablet uses an ACPI enumerated LP8556 backlight
> controller for its LCD-panel, with a Xiaomi specific ACPI HID of
> "XMCC0001", add support for this.
> 
> Note the new "if (id)" check also fixes a NULL pointer deref when a user
> tries to manually bind the driver from sysfs.
> 
> When CONFIG_ACPI is disabled acpi_match_device() will always return NULL,
> so the lp855x_parse_acpi() call will get optimized away.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/video/backlight/lp855x_bl.c | 70 ++++++++++++++++++++++++-----
>  1 file changed, 60 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
> index d1d27d5eb0f2..f075ec84acfb 100644
> --- a/drivers/video/backlight/lp855x_bl.c
> +++ b/drivers/video/backlight/lp855x_bl.c
> @@ -338,10 +339,6 @@ static int lp855x_parse_dt(struct lp855x *lp)
>  		return -EINVAL;
>  	}
>  
> -	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> -	if (!pdata)
> -		return -ENOMEM;
> -
>  	of_property_read_string(node, "bl-name", &pdata->name);
>  	of_property_read_u8(node, "dev-ctrl", &pdata->device_control);
>  	of_property_read_u8(node, "init-brt", &pdata->initial_brightness);

Shouldn't there be a removal of an `lp->pdata = pdata` from somewhere in
this function?


> @@ -379,8 +376,31 @@ static int lp855x_parse_dt(struct lp855x *lp)
>  }
>  #endif
>  
> +static int lp855x_parse_acpi(struct lp855x *lp)
> +{
> +	int ret;
> +
> +	/*
> +	 * On ACPI the device has already been initialized by the firmware

Perhaps nitpicking but ideally I'd like "and is in register mode" here 
since I presume it can also be assumed that everything with this HID
has adopted that).

Other than these, LGTM.


Daniel.
