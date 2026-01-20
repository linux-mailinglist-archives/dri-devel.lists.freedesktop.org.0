Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B72D3BE8A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 05:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3936010E183;
	Tue, 20 Jan 2026 04:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="STTi1GIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C899610E183
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 04:51:39 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-29f2676bb21so49773145ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768884699; x=1769489499; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CrPpWhLizzqyrVdqRt9DE4t+jE309BmKnkyinv/DH0E=;
 b=STTi1GIFBglUrtyPjdL67HN57MQb/9GyRxUetlIqYMp69ghSVsI3i/D86qi42YaAxz
 dEBYN8sVp+pJxYfM8b8EeFsUrqxaDqSw8BUIYqVDBofpAt+gm1ChXR53BYlCJOh9ztKL
 EwSmtJtj3sz1nuh7E+ld/i0steH1pB9pEDXox0bO73bGjl3OaNTfCBoNDkX4pWFPh7Ux
 lHTs75JcXwY8W532PLVXhJUkait2qFctEwlPcdXwTPvJPHGTr0pkArPgRqUfBbHXiWcf
 K/9tcmzFRRFmmrZKvstkhEuNtJ/ykCEwEdnkPYBkTHxH8vpFB+KS5KRqtJ5D7zXONFD1
 hE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768884699; x=1769489499;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CrPpWhLizzqyrVdqRt9DE4t+jE309BmKnkyinv/DH0E=;
 b=cIKMddj5yIEVu49NWP6HnhteomnrhW59pin1dRFmslxtpR2vFStI1qVovAIY+QDPa3
 ytWTCbgiEbNIH5baBwvIRb98+TOLDejqIVZqcz2Z1s/ShujmI8cefO80V73KgaHZuACE
 E3Fhvr35UhmVl6/58Y2V+h4amFQTlZaY24c5BRY9EutslpMpcjyOj1NMxojsPlwUBxtI
 wAIaZZGyP/+e4wZu6kogfYacTkRfbiLF9Zzs5H+NnxSaOp0807I1lQy3WYU6jvDcDlAh
 L9OKt4Vkcmt1q/VPiKg3ROavCSiWazveyh9wSnPvn4Fkxcanaw+JxFx7jaF62XhyAh49
 gzUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRTJOZR88I9YvqrJ5OKKyylEx+zYj9Pohg3tahAeU/D3a/PCQRKs9qEYI8opGFBWKG8z6//6QBlIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbeLpVAm5s5YTRo5+yxafKzJPiyZpj/YLZmIouA5oJMP5qWT07
 szqFz5ynqXJCIjUTriJprKxFOaH9UFtsqocGEcZu08O/VThpXJbNoOf/
X-Gm-Gg: AZuq6aIvdFpV+oIHE+GpKPLwT8CAzge4sKkT3veYxg93y7IPM79hqYMFrlHTtv8vVbH
 SWeA9WQaGfIsfemuS9OYNRcC2fgAnVhwp3Gwq5vj31DTdsiiFoh5i95jk1PWw9G5iiS7ZHhUq4U
 ZJCsiQQpk90wBbzWLES66lI1fkNHkyLMKafl+Ee3+jQfNQycRLZsRL5apdTqvEQHnNbGJkpy7Hb
 2QsfkoHN6KdEu6A/YYj1cc4WRM0HNBuHOZt087qJY94cJ1+QkSCKEaDcS8x+eQpizjALSUN68bh
 4uiwR3u5yGjYFSkvIEFR+CB3twiLnqhN0+i69Tcqz2eFVV5uyg7HzfZ3CKD/1SbPw+tKhHObtnR
 a7IlRRIW5+RmrLqm6TwzfY4RW/7qo42T/27jYBlaWoq+l18beAHCY0oj1QmlwBRr9X2TPjCwSdr
 uwnFNl9JI2Z7mcIHyivq7fmFvdvjFUZSD78Q==
X-Received: by 2002:a17:902:f788:b0:29e:9387:f2b7 with SMTP id
 d9443c01a7336-2a7188577d1mr133191665ad.11.1768884699087; 
 Mon, 19 Jan 2026 20:51:39 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193fd35esm107003535ad.81.2026.01.19.20.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 20:51:38 -0800 (PST)
Message-ID: <ec7b7af7-1343-4988-b783-9ce9b045c8ae@gmail.com>
Date: Tue, 20 Jan 2026 10:22:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] backlight: gpio: add support for multiple GPIOs
 for backlight control
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-3-tessolveupstream@gmail.com>
 <aVuN7zVUWJ1qsVh8@aspen.lan> <1fedb7d7-3a30-4f0f-961f-09613f2a95d0@gmail.com>
 <aWe-QA_grqNwnE4n@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aWe-QA_grqNwnE4n@aspen.lan>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14-01-2026 21:33, Daniel Thompson wrote:
> On Tue, Jan 13, 2026 at 12:47:26PM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 05-01-2026 15:39, Daniel Thompson wrote:
>>> On Mon, Jan 05, 2026 at 02:21:20PM +0530, Sudarshan Shetty wrote:
>>>> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
>>>> single one. This allows panels that require driving several enable pins
>>>> to be controlled by the backlight framework.
>>>>
>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>> ---
>>>>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
>>>>  1 file changed, 45 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>>>> index 728a546904b0..037e1c111e48 100644
>>>> --- a/drivers/video/backlight/gpio_backlight.c
>>>> +++ b/drivers/video/backlight/gpio_backlight.c
>>>> @@ -17,14 +17,18 @@
>>>>
>>>>  struct gpio_backlight {
>>>>  	struct device *dev;
>>>> -	struct gpio_desc *gpiod;
>>>> +	struct gpio_desc **gpiods;
>>>> +	unsigned int num_gpios;
>>>
>>> Why not use struct gpio_descs for this?
>>>
>>> Once you do that, then most of the gbl->num_gpios loops can be replaced with
>>> calls to the array based accessors.
>>>
>>
>> Based on your feedback, I have updated the implementation to use
>> struct gpio_descs and array-based accessors, as recommended like
>> below:
>>
>> git diff drivers/video/backlight/gpio_backlight.c
>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>> index 037e1c111e48..e99d7a9dc670 100644
>> --- a/drivers/video/backlight/gpio_backlight.c
>> +++ b/drivers/video/backlight/gpio_backlight.c
>> @@ -14,22 +14,37 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/property.h>
>>  #include <linux/slab.h>
>> +#include <linux/bitmap.h>
>>
>>  struct gpio_backlight {
>>         struct device *dev;
>> -       struct gpio_desc **gpiods;
>> +       struct gpio_descs *gpiods;
>>         unsigned int num_gpios;
>>  };
>>
>>  static int gpio_backlight_update_status(struct backlight_device *bl)
>>  {
>>         struct gpio_backlight *gbl = bl_get_data(bl);
>> -       unsigned int i;
>> +       unsigned int n = gbl->num_gpios;
>>         int br = backlight_get_brightness(bl);
>> +       unsigned long *value_bitmap;
>> +       int words = BITS_TO_LONGS(n);
>> +
>> +       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
> 
> Not sure you need a kcalloc() here. If you want to support more than 32
> GPIOs then you can pre-allocate space with a devm_kcalloc() in the probe
> method rather than reallocate every time it is used.
> 
> To be honest I don't really mind putting a hard limit on the maximum
> gpl->num_gpios (so you can just use a local variable) and having no
> allocation at all.
>

Thanks for the suggestion. I addressed the kcalloc() concern by 
moving the bitmap allocation to probe using devm_kcalloc() as 
below:

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 0eb42d8bf1d9..7af5dc4f0315 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -19,32 +19,25 @@
 struct gpio_backlight {
        struct device *dev;
        struct gpio_descs *gpiods;
-       unsigned int num_gpios;
+       unsigned long *bitmap;
 };

 static int gpio_backlight_update_status(struct backlight_device *bl)
 {
        struct gpio_backlight *gbl = bl_get_data(bl);
-       unsigned int n = gbl->num_gpios;
+       unsigned int n = gbl->gpiods->ndescs;
        int br = backlight_get_brightness(bl);
-       unsigned long *value_bitmap;
-       int words = BITS_TO_LONGS(n);
-
-       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
-       if (!value_bitmap)
-               return -ENOMEM;

        if (br)
-               bitmap_fill(value_bitmap, n);
+               bitmap_fill(gbl->bitmap, n);
        else
-               bitmap_zero(value_bitmap, n);
+               bitmap_zero(gbl->bitmap, n);

-       gpiod_set_array_value_cansleep(gbl->gpiods->ndescs,
+       gpiod_set_array_value_cansleep(n,
                                       gbl->gpiods->desc,
                                       gbl->gpiods->info,
-                                      value_bitmap);
+                                      gbl->bitmap);

-       kfree(value_bitmap);
        return 0;
 }

@@ -67,22 +60,25 @@ static int gpio_backlight_probe(struct platform_device *pdev)
        struct device *dev = &pdev->dev;
        struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
        struct device_node *of_node = dev->of_node;
-       struct backlight_properties props;
+       struct backlight_properties props = { };
        struct backlight_device *bl;
        struct gpio_backlight *gbl;
-       int ret, init_brightness, def_value;
-       unsigned int i;
+       bool def_value;
+       enum gpiod_flags flags;
+       unsigned int n;
+       int words;

-       gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
-       if (gbl == NULL)
+       gbl = devm_kcalloc(dev, 1, sizeof(*gbl), GFP_KERNEL);
+       if (!gbl)
                return -ENOMEM;

        if (pdata)
                gbl->dev = pdata->dev;

        def_value = device_property_read_bool(dev, "default-on");
-
-       gbl->gpiods = devm_gpiod_get_array(dev, NULL, GPIOD_ASIS);
+       flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+
+       gbl->gpiods = devm_gpiod_get_array(dev, NULL, flags);
        if (IS_ERR(gbl->gpiods)) {
                if (PTR_ERR(gbl->gpiods) == -ENODEV)
                        return dev_err_probe(dev, -EINVAL,
@@ -90,12 +86,17 @@ static int gpio_backlight_probe(struct platform_device *pdev)
                return PTR_ERR(gbl->gpiods);
        }

-       gbl->num_gpios = gbl->gpiods->ndescs;
-       if (gbl->num_gpios == 0)
+       n = gbl->gpiods->ndescs;
+       if (!n)
                return dev_err_probe(dev, -EINVAL,
-                       "The gpios parameter is missing or invalid\n");
+                       "No GPIOs provided\n");
+
+       words = BITS_TO_LONGS(n);
+       gbl->bitmap = devm_kcalloc(dev, words, sizeof(unsigned long),
+                                  GFP_KERNEL);
+       if (!gbl->bitmap)
+               return -ENOMEM;

-       memset(&props, 0, sizeof(props));
        props.type = BACKLIGHT_RAW;
        props.max_brightness = 1;
        bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
@@ -106,50 +107,19 @@ static int gpio_backlight_probe(struct platform_device *pdev)
        }

        /* Set the initial power state */
-       if (!of_node || !of_node->phandle) {
+       if (!of_node || !of_node->phandle)
                /* Not booted with device tree or no phandle link to the node */
                bl->props.power = def_value ? BACKLIGHT_POWER_ON
                                                    : BACKLIGHT_POWER_OFF;
-       } else {
-               bool all_high = true;
-               unsigned long *value_bitmap;
-               int words = BITS_TO_LONGS(gbl->num_gpios);
-
-               value_bitmap = kcalloc(words, sizeof(unsigned long),
-                                      GFP_KERNEL);
-               if (!value_bitmap)
-                       return -ENOMEM;
-
-               ret = gpiod_get_array_value_cansleep(gbl->gpiods->ndescs,
-                                                    gbl->gpiods->desc,
-                                                    gbl->gpiods->info,
-                                                    value_bitmap);
-               if (ret) {
-                       kfree(value_bitmap);
-                       return dev_err_probe(dev, ret,
-                               "failed to read initial gpio values\n");
-               }
-
-               all_high = bitmap_full(value_bitmap, gbl->num_gpios);
-
-               kfree(value_bitmap);
-               bl->props.power =
-                       all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
-       }
-
-       bl->props.brightness = 1;
-
-       init_brightness = backlight_get_brightness(bl);
+       else if (gpiod_get_value_cansleep(gbl->gpiods->desc[0]) == 0)
+               bl->props.power = BACKLIGHT_POWER_OFF;
+       else
+               bl->props.power = BACKLIGHT_POWER_ON;

-       for (i = 0; i < gbl->num_gpios; i++) {
-               ret = gpiod_direction_output(gbl->gpiods->desc[i],
-                                            init_brightness);
-               if (ret)
-                       return dev_err_probe(dev, ret,
-                                       "failed to set gpio %u direction\n",
-                                       i);
-       }
+       bl->props.brightness = def_value ? 1 : 0;

+       gpio_backlight_update_status(bl);
+
        platform_set_drvdata(pdev, bl);
        return 0;
 }

Kindly confirm whether this approach aligns with your 
expectations.
 
> 
>> Could you please share your thoughts on whether this approach
>> aligns with your expectations?
> 
> Looks like it is going in the right direction, yes.
> 
> 
> Daniel.

