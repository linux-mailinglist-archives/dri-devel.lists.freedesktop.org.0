Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF0783AF8F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 18:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD6C10F787;
	Wed, 24 Jan 2024 17:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC8C10F799
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 17:20:56 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-337d99f9cdfso4994531f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706116795; x=1706721595; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s3a+DNtECmvubjsLdhByFOruS2nKP6Q4o/Q4YSoYzCk=;
 b=eNCVqT7tCaTkCbErFUpDTxWBMAciIS9+89aZvraRn9VvMi6K/sOAsAt8tZvc+VLJq0
 KFbD6PrkkhmSW0via6yJzfKMYNODc5MWWMtcSL3Nty2U1NTayrSqfhXp4ucKTiFg8ejv
 FeovCL3DV6fxcADbaWie3YCpu48P5GL6s4WUQPO5/u14U+S4Q+1gezUj5481RNAZTjFI
 NUgVwPXH67rWOswMExJ28JrcrWCLdItz9+A/Hdhf18wvniz1nCOKdoiqLKHnREd84bMQ
 j2KwBKWNx9sBDE/knndmtW//76YB7nRGIFMS4oC8n6aDqWoFGBXHfNbxMryrn7qrNlV6
 j9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706116795; x=1706721595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3a+DNtECmvubjsLdhByFOruS2nKP6Q4o/Q4YSoYzCk=;
 b=W1iTC9K14BXNZjEwMJwFNhMgvLqIQev38BAsVY9kjl0sFiFSNwy+880LAdp3i/pQ6J
 QEcffjnwIBY2iVzGYO+2XSgL8bPX65V3D5RcuJl9ZyB/Mjz3yGjcNFmfiEqYMXkeKIzd
 rzJ1rUiZfweslPiTukNhwI2FskhUcltTImect465WYeovEnohbi3UmHNsPDCKHYj8Ksx
 QYzzaWyR3ufR6/GkYbsGyD/wpxueV5xH/tpmmIe5hwLNoe28YEC4j6Slj1lV0A7UiEGK
 x9OOraAqskpmEhXADJMFES/fhISE3wpIT4SnXmp6UK/5qbP9tPZbQbkw2dsDkrTuwkNu
 sWKA==
X-Gm-Message-State: AOJu0Yy9caNzIZ62nOMngFeoe/LA+h6SrDl5JCH6TWRGxsT4VEKmROus
 +zWXIvCrUumNbCvW0UCgz6V6ZN8cxTNg+uB15Fov1C88guOEh8As2XcVjJQA6OU=
X-Google-Smtp-Source: AGHT+IF2PLiH41Eqpuhe6kbhSpWxzeOappELX/qRauwkSGF7Z3O3gB6rW0/YAAZnyx7oHR8llwr4WQ==
X-Received: by 2002:adf:f345:0:b0:339:359c:3d3d with SMTP id
 e5-20020adff345000000b00339359c3d3dmr752932wrp.14.1706116795299; 
 Wed, 24 Jan 2024 09:19:55 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a5d4904000000b0033928514699sm11805827wrq.2.2024.01.24.09.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 09:19:54 -0800 (PST)
Date: Wed, 24 Jan 2024 17:19:53 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] backlight: hx8357: Make use of device properties
Message-ID: <20240124171953.GA15539@aspen.lan>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240114152759.1040563-2-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 14, 2024 at 05:25:08PM +0200, Andy Shevchenko wrote:
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>
> Include mod_devicetable.h explicitly to replace the dropped of.h
> which included mod_devicetable.h indirectly.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/video/backlight/hx8357.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
> index bf18337ff0c2..c7fd10d55c5d 100644
> --- a/drivers/video/backlight/hx8357.c
> +++ b/drivers/video/backlight/hx8357.c
> @@ -8,9 +8,9 @@
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/lcd.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
> +#include <linux/property.h>
>  #include <linux/spi/spi.h>
>
>  #define HX8357_NUM_IM_PINS	3
> @@ -564,6 +564,8 @@ static struct lcd_ops hx8357_ops = {
>  	.get_power	= hx8357_get_power,
>  };
>
> +typedef int (*hx8357_init)(struct lcd_device *);
> +
>  static const struct of_device_id hx8357_dt_ids[] = {
>  	{
>  		.compatible = "himax,hx8357",
> @@ -582,7 +584,7 @@ static int hx8357_probe(struct spi_device *spi)
>  	struct device *dev = &spi->dev;
>  	struct lcd_device *lcdev;
>  	struct hx8357_data *lcd;
> -	const struct of_device_id *match;
> +	hx8357_init init;

As somewhere else in this thread, I'd find this a lot more readable
as:
	hx8357_init_fn init_fn;

Other than that, LGTM.


Daniel.
