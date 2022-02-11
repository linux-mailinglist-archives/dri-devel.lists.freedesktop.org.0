Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB24B2532
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9C910EA94;
	Fri, 11 Feb 2022 12:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3523110EA94
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644581161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BASHV7aFfw3qHYbxs7gIYxsZkBm2pYuduv5XXGleEkc=;
 b=Lg1CNixSW3/U5mGxbr0OPUFlwnvdiOjWoGeolxFq0lyRs0mUNabd4UTIL8PQGaNKyI21EA
 Ahg23A/P1/BvEGyYJMkkNFcyJ4+fN1dohEUvp+6Aw5iMy4BcGIpbPQ7FxmPyXpgNEnl0IS
 r+vyKHUZj4/PpxnkPmdHSdv+ssWb+o0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-FquQXZh-NfmuB4ESFmeScg-1; Fri, 11 Feb 2022 07:06:00 -0500
X-MC-Unique: FquQXZh-NfmuB4ESFmeScg-1
Received: by mail-wr1-f69.google.com with SMTP id
 t14-20020adfa2ce000000b001e1ad2deb3dso3794227wra.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BASHV7aFfw3qHYbxs7gIYxsZkBm2pYuduv5XXGleEkc=;
 b=RgO0MyjzaHKE/KmU4cUC+RlThWb6ZfVbtHybt63BMPx6GC1at24PJZQJrUwA3P+0uQ
 hWjAmALx4IPmkNF3o9JmWYYRsAGUpRYrEY1nJHPuHEN78KWc3BTv5xcFoYtkikNBlkez
 /Mv10bbtw5Svw9gRYk28jgIBJpgRCsEbIW5UvqFxFUWhIjFRoZ8N76dW70Kmk48QogSJ
 YFKFZ625Q8BPpkRzmrU6JVHVfU/MnvXzarNxcFQsSio8XqV09wsF4cD/ksaX3n/dImD1
 CDA4dhi29mTaFYwlRfBRtCPBSGl+80ny7bXszmc5bzMK36MLyvj634yagiD8tzLhD4PD
 9o9w==
X-Gm-Message-State: AOAM532Yec9B0WkbqcnWleW4Shjv9AhWHyKzHNVcFcls/MKYN4Lq5TdN
 eakzxs+nR9eT4GrXlZtnknD1B2y66zHlZFsoRwVv1EIbt2MPSf73Z3mt1g8WT7Lxcv8V2e66Ym4
 UIQuUwDdoCLi6BRp59Vmx7GHsYL1L
X-Received: by 2002:a5d:5692:: with SMTP id f18mr1182592wrv.285.1644581159522; 
 Fri, 11 Feb 2022 04:05:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/wwEdn1CDOpccM3hGHhbtDnjh87iUZ0MvvFV8jLkai8DaWkcExzOlYAiyBmaBdWNEv6pKZQ==
X-Received: by 2002:a5d:5692:: with SMTP id f18mr1182575wrv.285.1644581159299; 
 Fri, 11 Feb 2022 04:05:59 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id g8sm1531531wrd.9.2022.02.11.04.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 04:05:59 -0800 (PST)
Message-ID: <eed8200c-7716-ce4f-dac5-bd6f0345b631@redhat.com>
Date: Fri, 11 Feb 2022 13:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 3/6] drm: Add driver for Solomon SSD130x OLED displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-4-javierm@redhat.com>
 <YgZJpi4llqr93U9Y@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgZJpi4llqr93U9Y@smile.fi.intel.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/11/22 12:33, Andy Shevchenko wrote:
> On Fri, Feb 11, 2022 at 10:19:24AM +0100, Javier Martinez Canillas wrote:
>> This adds a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon
>> OLED display controllers.
>>
>> It's only the core part of the driver and a bus specific driver is needed
>> for each transport interface supported by the display controllers.
> 
> ...
> 
>> +#include <linux/backlight.h>
>> +#include <linux/bitfield.h>
> 
> bits.h

Ok, missed that both weren't in the same macro.

> (FYI, specifically sent a patch few days ago to add explicitly the inclusions
>  that needed for bitfield operations in the example inside bitfield.h).
> 
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/property.h>
>> +#include <linux/pwm.h>
>> +#include <linux/regulator/consumer.h>
> 
> ...
> 
>> +#define SSD130X_SET_ADDRESS_MODE_HORIZONTAL	(0x00)
>> +#define SSD130X_SET_ADDRESS_MODE_VERTICAL	(0x01)
>> +#define SSD130X_SET_ADDRESS_MODE_PAGE		(0x02)
>> +
>> +#define SSD130X_SET_AREA_COLOR_MODE_ENABLE	(0x1e)
>> +#define SSD130X_SET_AREA_COLOR_MODE_LOW_POWER	(0x05)
> 
> Do the parentheses add anything here?
>

Not really, the fbdev driver used it and I understood that was
a convention to denote that these are command options and not a
command or register. I'll drop them.

> ...
> 
>> +/*
>> + * Helper to write command (SSD130X_COMMAND). The fist variadic argument
>> + * is the command to write and the following are the command options.
> 
> This is not correct explanation. Please, rephrase to show that _each_ of the
> options is sent with a preceding command.
>

It's a correct explanation IMO from the caller point of view. The first argument
is the command sent (i.e: SSD130X_SET_ADDRESS_MODE) and the next ones are the
the command options (i.e: SSD130X_SET_ADDRESS_MODE_HORIZONTAL).

The fact that each command and options are preceding with a SSD130X_COMMAND
value is part of the protocol of the device and a detail that's abstracted
away by this helper function to the callers.

>> + */
>> +static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
>> +				    /* u8 cmd, u8 option, ... */...)
>> +{
>> +	va_list ap;
>> +	u8 value;
>> +	int ret;
>> +
>> +	va_start(ap, count);
>> +
>> +	do {
>> +		value = va_arg(ap, int);
>> +		ret = regmap_write(ssd130x->regmap, SSD130X_COMMAND, (u8)value);
>> +		if (ret)
>> +			goto out_end;
>> +	} while (--count);
>> +
>> +out_end:
>> +	va_end(ap);
>> +
>> +	return ret;
>> +}
> 
> ...
> 
>> +	if (ssd130x->device_info->need_pwm) {
> 
> Yeah, unfortunately we still don't have pwm_get_optional()...
> 
>> +		ret = ssd130x_pwm_enable(ssd130x);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to enable PWM: %d\n", ret);
>> +			regulator_disable(ssd130x->vcc_reg);
>> +			return ret;
>> +		}
>> +	}
> 
> ...
> 
>> +static void ssd130x_power_off(struct ssd130x_device *ssd130x)
>> +{
> 
>> +	if (ssd130x->device_info->need_pwm) {
> 
> Redundant check. The two below are NULL-aware.
>

Ok, I'll drop it.

>> +		pwm_disable(ssd130x->pwm);
>> +		pwm_put(ssd130x->pwm);
>> +	}
>> +
>> +	regulator_disable(ssd130x->vcc_reg);
>> +}
> 
> ...
> 
>> +	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_COM_PINS_CONFIG, compins);
>> +	if (ret < 0)
>> +		return ret;
> 
>> +
>> +
> 
> One blank line is enough.
>

Indeed, that was a left over when changing this to use the macros.
 
> ...
> 
>> +	for (i = y / 8; i < y / 8 + pages; i++) {
>> +		int m = 8;
>> +
>> +		/* Last page may be partial */
>> +		if (8 * (i + 1) > ssd130x->height)
>> +			m = ssd130x->height % 8;
> 
> Perhaps it can be moved out of the loop with refactored piece below.
>

Not sure I'm following since it depends on the for loop iterator value.

[snip]

>> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
>> +					    &ssd130xfb_bl_ops, NULL);
>> +	if (IS_ERR(bl)) {
> 
>> +		ret = PTR_ERR(bl);
>> +		dev_err_probe(dev, ret, "Unable to register backlight device\n");
>> +		return ERR_PTR(ret);
> 
> 		dev_err_probe(dev, PTR_ERR(bl), "Unable to register backlight device\n");
> 		return bl;
> 
> ?

No, because this function's return value is a struct ssd130x_device pointer,
not a struct backlight_device pointer.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

