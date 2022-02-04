Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5574A9FED
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3330710E7BE;
	Fri,  4 Feb 2022 19:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5410310E7BE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644002358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1SmAWoGG3rpqZKZcFe80PxRS+gWlMoV37ErpIWQkO2c=;
 b=bufMsc/ncUMEyC8g2/MZ1pqaWxe/G0zMgxGDuUU62LJG5Vuc3h9eYR/3lqlgbNVIbfU96A
 UcxkNJ/BplNV5NPEC6n9m+YGej8EIAMyfYo8gBIdNbBDmNOuS/u/ZI9XuTqPXTolvpRmIO
 962YOhZ20GtdqNBnBOLQwnaJX3cUXJU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-ufhsd1SYNmyg6H4s1ZEOyA-1; Fri, 04 Feb 2022 14:19:15 -0500
X-MC-Unique: ufhsd1SYNmyg6H4s1ZEOyA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t14-20020adfa2ce000000b001e1ad2deb3dso2423637wra.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 11:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1SmAWoGG3rpqZKZcFe80PxRS+gWlMoV37ErpIWQkO2c=;
 b=S9EjZYUE2vauDjcMUU5c7CoSWgbjKYrnDSza+HGfH9HyapUCPbpuOpTDBT91sxY74W
 XLof3h80CEpoblIknTug3JlRIR0DsgnPTqZOzuQ2XRnmeBjyoioUcyUXw+lGexbLWD++
 zoUj5Qg+KmjTVsKsH9He6pqXlw/2YQ0IMF357Fq63KvQCuHAobLAQ8x1Anv1QGZ8CPel
 A48qBbAMffGMaBqk1NGJ47Lm9rrABimOZNxv85FGuwI3Olg12G3iyo5qwHMNREqNzI37
 IKe0+++W4WCXsaXyDGlmehmBCahvxYBxQ5cquO6O4h1Vpu6DOPWwo6MEDzVeT5ejgio2
 W9Dg==
X-Gm-Message-State: AOAM531Y3Ik2/b3CMGaY1GPy4r7GHK4YtrGFHazo8Il6sydRdaSDptTX
 26gIglyaZKLlhqOMjbveeG0mtOkIHSbxO/3hVKubnWK1mqlgQPUF90c/85wN4G/hNfrip2PZ7mk
 cOTuCsO/77ZgiY/3W6MphSVdy98jw
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr285300wrb.579.1644002354019;
 Fri, 04 Feb 2022 11:19:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPVEChhH2BIVt4abopCyjtBiEW3BtBxNXFj39pjkOolzuEHz/zA5giC+MmJkCFq0OZIBFvhA==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr285277wrb.579.1644002353738;
 Fri, 04 Feb 2022 11:19:13 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o8sm2089562wmc.46.2022.02.04.11.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 11:19:13 -0800 (PST)
Message-ID: <d4e8c16c-5586-3233-0b99-be15a4c0f7aa@redhat.com>
Date: Fri, 4 Feb 2022 20:19:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/4] drm/tiny: Add driver for Solomon SSD130X OLED
 displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-3-javierm@redhat.com>
 <Yf03sCSuQwHKvgA9@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yf03sCSuQwHKvgA9@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy,

Thanks for your feedback.

On 2/4/22 15:26, Andy Shevchenko wrote:
> On Fri, Feb 04, 2022 at 02:43:45PM +0100, Javier Martinez Canillas wrote:
>> Add a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon OLED
>> controllers that can be programmed via an I2C interface. This is a port
>> of the ssd1307fb driver that already supports these devices.
>>
>> A Device Tree binding is not added because the DRM driver is compatible
>> with the existing binding for the ssd1307fb driver.
> 
> ...
> 
>> +/*
>> + * DRM driver for Solomon SSD130X OLED displays
>> + *
>> + * Copyright 2022 Red Hat Inc.
>> + *
>> + * Based on drivers/video/fbdev/ssd1307fb.c
>> + * Copyright 2012 Free Electrons
> 
>> + *
> 
> No need for this blank line.
>

Ok.
 
>> + */
> 
> ...
> 
>> +struct ssd130x_device {
>> +	struct drm_device drm;
>> +	struct drm_simple_display_pipe pipe;
>> +	struct drm_display_mode mode;
>> +	struct drm_connector connector;
> 
> 
>> +	struct i2c_client *client;
> 
> Can we logically separate hw protocol vs hw interface from day 1, please?
> This will allow to add SPI support for this panel much easier.
> 
> Technically I would like to see here
> 
> 	struct device *dev;
>
> and probably (I haven't looked into design)
> 
> 	struct ssd130x_ops *ops;
> 
> or something alike.
>

Sure. I wanted to keep the driver simple, making the writes bus agnostic and
adding a level of indirection would make it more complex. But I agree that
it will also make easier to add more buses later. I will do that for v3.

[snip]

> 
>> +static inline int ssd130x_write_value(struct i2c_client *client, u8 value)
> 
> Not sure inline does anything useful here.
> Ditto for the rest similar cases.
>

Ok, I'll drop them.
 
> ...
> 
>> +static inline int ssd130x_write_cmd(struct i2c_client *client, int count,
>> +				    /* u8 cmd, u8 value, ... */...)
>> +{
>> +	va_list ap;
>> +	u8 value;
>> +	int ret;
>> +
>> +	va_start(ap, count);
> 
>> +	while (count--) {
>> +		value = va_arg(ap, int);
>> +		ret = ssd130x_write_value(client, (u8)value);
>> +		if (ret)
>> +			goto out_end;
>> +	}
> 
> I'm wondering if this can be written in a form
> 
> 	do {
> 		...
> 	} while (--count);
> 
> In this case it will give a hint that count can't be 0.
>

Sure, I don't have a strong preference. I will change it.

[snip]
 
>> +	ssd130x->pwm = pwm_get(dev, NULL);
>> +	if (IS_ERR(ssd130x->pwm)) {
>> +		dev_err(dev, "Could not get PWM from device tree!\n");
> 
> "device tree" is a bit confusing here if I run this on ACPI.
> Maybe something like "firmware description"?
>

Indeed.
 
>> +		return PTR_ERR(ssd130x->pwm);
>> +	}
> 
> ...
> 
>> +	/* Set initial contrast */
>> +	ret = ssd130x_write_cmd(ssd130x->client, 2, SSD130X_CONTRAST, ssd130x->contrast);
> 
> Creating a local variable for client allows to:
> - make lines shorter and might even be less LOCs
> - allow to convert struct device to client in one place
>   (as per my above comment)
> 
> Ditto for other similar cases.
>

Ok.
 
[snip]

>> +	/* Switch to horizontal addressing mode */
>> +	ret = ssd130x_write_cmd(ssd130x->client, 2, SSD130X_SET_ADDRESS_MODE,
>> +				SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
> 
> Can it be
> 
> 	return ssd130x_write_cmd(...);
> 
> ?
> 
> ...
>

Yes.

>> +	unsigned int line_length = DIV_ROUND_UP(width, 8);
>> +	unsigned int pages = DIV_ROUND_UP(height, 8);
> 
> For power of two there are more efficient roundup()/rounddown()
> (or with _ in the names, I don't remember by heart).
>

Oh, I didn't know about round_{up,down}(). Thanks a lot for the pointer.

> ...
> 
>> +			for (k = 0; k < m; k++) {
> 
>> +				u8 byte = buf[(8 * i + k) * line_length +
>> +					       j / 8];
> 
> One line?
>

Yes.

>> +				u8 bit = (byte >> (j % 8)) & 1;
>> +
>> +				data |= bit << k;
>> +			}
> 
> ...
> 
>> +static int ssd130x_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
>> +					   const struct drm_display_mode *mode)
>> +{
>> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(pipe->crtc.dev);
>> +
>> +	if (mode->hdisplay != ssd130x->mode.hdisplay &&
>> +	    mode->vdisplay != ssd130x->mode.vdisplay)
>> +		return MODE_ONE_SIZE;
> 
>> +	else if (mode->hdisplay != ssd130x->mode.hdisplay)
>> +		return MODE_ONE_WIDTH;
>> +	else if (mode->vdisplay != ssd130x->mode.vdisplay)
>> +		return MODE_ONE_HEIGHT;
> 
> 'else' in both cases is redundant.
>

Indeed.
 
>> +	return MODE_OK;
>> +}
> 
> ...
> 
>> +poweroff:
> 
> out_power_off: ?
>

Ok.
 
> ...
> 
>> +	if (!fb)
>> +		return;
> 
> Can it happen?
>

I don't know, but saw that the handler of other drivers checked for this so
preferred to play safe and do the same.
 
> ...
> 
>> +	drm_mode_probed_add(connector, mode);
>> +	drm_set_preferred_mode(connector, mode->hdisplay, mode->vdisplay);
>> +
>> +	return 1;
> 
> Positive code, what is the meaning of it?
>

It's the number of connector modes. The driver only supports 1.
 
> ...
> 
>> +	if (device_property_read_u32(dev, "solomon,prechargep2", &ssd130x->prechargep2))
>> +		ssd130x->prechargep2 = 2;
> 
> You can drop conditionals for the optional properties
>


 
> 	ssd130x->prechargep2 = 2;
> 	device_property_read_u32(dev, "solomon,prechargep2", &ssd130x->prechargep2);
> 
> and so on for the similar.
>

Ok.
 
> ...
> 
>> +	ssd130x->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>> +	if (IS_ERR(ssd130x->reset)) {
> 
>> +		ret = PTR_ERR(ssd130x->reset);
>> +		dev_err(dev, "Failed to get reset gpio: %d\n", ret);
>> +		return ret;
> 
> Why not
> 
> 	return dev_err_probe()?
> 
> Each time you call it for deferred probe, it will spam logs.
>

Right. I'll change in all the places you pointed out.

[snip] 

> ...
> 
>> +	{},
> 
> Comma is not needed in terminator entry.
>

Right.
 
> ...
> 
>> +static struct i2c_driver ssd130x_i2c_driver = {
>> +	.driver = {
>> +		.name = DRIVER_NAME,
>> +		.of_match_table = ssd130x_of_match,
>> +	},
>> +	.probe_new = ssd130x_probe,
>> +	.remove = ssd130x_remove,
>> +	.shutdown = ssd130x_shutdown,
>> +};
> 
>> +
> 
> Redundant blank line.
>

Ok.
 
>> +module_i2c_driver(ssd130x_i2c_driver);
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

