Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGapL7/reWkF1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:58:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12A9FCE6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3316110E64F;
	Wed, 28 Jan 2026 10:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="a375jEtK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6746C10E64F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 10:58:04 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso51508895e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 02:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769597883; x=1770202683;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ePwSV9uQcaY+n4jv1Q2W+vhnTy8c0WhUgXTMl4Q9tqw=;
 b=a375jEtK8vOfQ+jd8yC5ibPy95KcspdYl0crTt59Pw+yUHgjS0TySBRLxBaEF8+wgg
 NObj4BInF3NKjkt3aDmMlQP1wptpqevWgG64h0SrD7vwLAE5vVh9JtBqcYBu8GutVD1n
 sVtML7UG5oz+gdxLrNppmiAuu8EO9Wqlgzj2DiN2UbXtDfd4xNMJk4X40gVBt3rZ5cBN
 cukhg8y2oMV+ZjMZKq+iZy2encJdL1SkKFFXoTPHg4UXqP+hvm/VDbEboHZ+2qGYPvgJ
 RXgHZwU6be6oEWoBNyVm4w/LY+x3h1yBlNTUNM0vcB8R8QhdqPaBvyGg2kegACwnkpCW
 oNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769597883; x=1770202683;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePwSV9uQcaY+n4jv1Q2W+vhnTy8c0WhUgXTMl4Q9tqw=;
 b=MS+mDUAslrXF7mzaeT5/wzK9afjew5IB8ZWoXYX1Jx1X2HQnRFDf2eYAA4HKYXzrSt
 tlllPr3kc10LK8GnUxEN9Nffdyjgmyak0nwM7kgLeyccUz7Do4jWBaxqRi6zuyRhrc1g
 3Z5E4uTrUQR/wQjCTHrEOdwXCMZFuHOoVVYMHkyDWU1tNdu9432fr8V7/lFucbDGkvha
 PIXJvXJVUbw8IvMXi07zi6NGXoSQzuI+OjOMz0dZQvnxv6/b3we1GAvVF5Mh6dV03bF2
 0KTYttmE/Bi3hHEKBDHYr3nhI7I38LMM2q3fqA/cAp/hSAN2BeWJQHBQF7M12J2PFv/H
 CbNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKkK/03eJUHQDkmPFWyQejL3jvhli4gvGds82btPCT4VrII3zy+c/5/VI5Ma/Y4CY1gSoPj2tHr+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUHDwKynr2csxeIf3MhLsRCgmfPA4Xkg8FE2/pBT/aPiAVscF/
 oPvzvtoc56Q0oQpVKOn6UhmcLLJWLBozK7xs6SX/lZI9xWYdiijnHTaR+V8O+EFdAXc=
X-Gm-Gg: AZuq6aLpfPfI4nr91H1Hk7z40gtdtzLJnKKfZhLDPAJu6p00PDdi0ZM4682m0xyHb4r
 fXb/LHp39tRSSVzonSW9gh4jKBP/wvuI0nEvP8mqrNWJDmvuT+4a9+/aSrG7p0I1xKIsd+V1Hrj
 WAu63D5kpGVE+uG8ajkVTw7nawOsLEcZ4fOtFwKfanXnN31xfRKa7V93CwAiw83hPUQEKZBzISk
 uLtyTIT5rpJ40BEBM5XdJIEz3A9XoXTvLfxc1L5q40W22mLUK8n0OEN3dV2VawnjbjXyoe56W/A
 3xyws1Yn/SSPevirv/9ZP6HXdGNDR2xnQXG3IXdBZVN1m4G9ulGR9QTmy6cfq1jpBDC5jq030Bt
 JxHVDMLlPCaVcbuBD7BvWB6NrNeD0QGFTkZ1bZAcn+H/AWpj1IMx+34mRLjK2HI/aKn1WxWVAuZ
 wxcT1tR7OATUQWZwEeiodkJhJQZ20dLp3ZfhbKoKqpTrbHMhI9jnPAdShtAlO6UVApqjI5KKs+F
 w6fk88JEvEz3ix84hjLKDzg6Lh0cEV5QygUhB8LFCBJW64HC3kq4B7j20Av8/bvAmuK7afG
X-Received: by 2002:a05:600c:450b:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-48069c788a3mr59622875e9.17.1769597882839; 
 Wed, 28 Jan 2026 02:58:02 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cdd79c7sm54470645e9.2.2026.01.28.02.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 02:57:59 -0800 (PST)
Date: Wed, 28 Jan 2026 10:57:55 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] backlight: gpio: add support for multiple GPIOs
 for backlight control
Message-ID: <aXnrs-RWWYC2q4O_@aspen.lan>
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-3-tessolveupstream@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120125036.2203995-3-tessolveupstream@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tessolveupstream@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[daniel@riscstar.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,aspen.lan:mid]
X-Rspamd-Queue-Id: 0B12A9FCE6
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 06:20:36PM +0530, Sudarshan Shetty wrote:
> The gpio-backlight driver currently supports only a single GPIO to
> enable or disable a backlight device. Some panels require multiple
> enable GPIOs to be asserted together.
>
> Extend the driver to support an array of GPIOs for a single backlight
> instance. All configured GPIOs are toggled together based on the
> backlight state.
>
> Existing single-GPIO Device Tree users remain unaffected.
>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  drivers/video/backlight/gpio_backlight.c | 66 ++++++++++++++++--------
>  1 file changed, 45 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 728a546904b0..11d21de82cf5 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -14,17 +14,29 @@
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include <linux/bitmap.h>
>
>  struct gpio_backlight {
>  	struct device *dev;
> -	struct gpio_desc *gpiod;
> +	struct gpio_descs *gpiods;
> +	unsigned long *bitmap;
>  };
>
>  static int gpio_backlight_update_status(struct backlight_device *bl)
>  {
>  	struct gpio_backlight *gbl = bl_get_data(bl);
> +	unsigned int n = gbl->gpiods->ndescs;
> +	int br = backlight_get_brightness(bl);
>
> -	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
> +	if (br)
> +		bitmap_fill(gbl->bitmap, n);
> +	else
> +		bitmap_zero(gbl->bitmap, n);
> +
> +	gpiod_set_array_value_cansleep(n,
> +				       gbl->gpiods->desc,
> +				       gbl->gpiods->info,
> +				       gbl->bitmap);
>
>  	return 0;
>  }
> @@ -48,26 +60,43 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
>  	struct device_node *of_node = dev->of_node;
> -	struct backlight_properties props;
> +	struct backlight_properties props = { };

This change is unrelated to the patch description. Do not "hide"
changes like this. It you want to replace the memset() it's better to
send a separate patch.


>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
> -	int ret, init_brightness, def_value;
> +	bool def_value;
> +	enum gpiod_flags flags;
> +	unsigned int n;
> +	int words;
>
> -	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
> -	if (gbl == NULL)
> +	gbl = devm_kcalloc(dev, 1, sizeof(*gbl), GFP_KERNEL);
> +	if (!gbl)

Again, this change is unrelated to the patch description. Do not include
changes that are not described in the patch description.


>  		return -ENOMEM;
>
>  	if (pdata)
>  		gbl->dev = pdata->dev;
>
>  	def_value = device_property_read_bool(dev, "default-on");
> +	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +
> +	gbl->gpiods = devm_gpiod_get_array(dev, NULL, flags);

How is it safe to transition from GPIOD_ASIS to GPIOD_OUT_LOW
here?

Forcing the backlight off if the default-on property is not present
will prevent the backlight state being properly inherited from the
bootloader.


> +	if (IS_ERR(gbl->gpiods)) {
> +		if (PTR_ERR(gbl->gpiods) == -ENODEV)
> +			return dev_err_probe(dev, -EINVAL,
> +			"The gpios parameter is missing or invalid\n");
> +		return PTR_ERR(gbl->gpiods);
> +	}
>
> -	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> -	if (IS_ERR(gbl->gpiod))
> -		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
> -				     "The gpios parameter is missing or invalid\n");
> +	n = gbl->gpiods->ndescs;
> +	if (!n)
> +		return dev_err_probe(dev, -EINVAL,
> +			"No GPIOs provided\n");
> +
> +	words = BITS_TO_LONGS(n);
> +	gbl->bitmap = devm_kcalloc(dev, words, sizeof(unsigned long),
> +				   GFP_KERNEL);
> +	if (!gbl->bitmap)
> +		return -ENOMEM;
>
> -	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = 1;
>  	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
> @@ -81,21 +110,16 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	if (!of_node || !of_node->phandle)
>  		/* Not booted with device tree or no phandle link to the node */
>  		bl->props.power = def_value ? BACKLIGHT_POWER_ON
> -					    : BACKLIGHT_POWER_OFF;
> -	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> +						    : BACKLIGHT_POWER_OFF;
> +	else if (gpiod_get_value_cansleep(gbl->gpiods->desc[0]) == 0)

This logic is broken. This code path needs to be taken is *any* GPIO is
low (and, as mentioned, the initial GPIO state must be GPIOD_ASIS).


>  		bl->props.power = BACKLIGHT_POWER_OFF;
>  	else
>  		bl->props.power = BACKLIGHT_POWER_ON;
>
> -	bl->props.brightness = 1;
> -
> -	init_brightness = backlight_get_brightness(bl);
> -	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
> -	if (ret) {
> -		dev_err(dev, "failed to set initial brightness\n");
> -		return ret;
> -	}
> +	bl->props.brightness = def_value ? 1 : 0;
>
> +	gpio_backlight_update_status(bl);
> +
>  	platform_set_drvdata(pdev, bl);
>  	return 0;
>  }


Daniel.
