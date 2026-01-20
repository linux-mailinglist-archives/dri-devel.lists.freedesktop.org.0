Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6W2RMAKub2lBGgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:32:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E75547997
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3862A10E5E3;
	Tue, 20 Jan 2026 12:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k3aSphIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1778910E5E3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 12:53:29 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a77c1d5c3bso1761005ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 04:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768913608; x=1769518408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vQA0UiXnoLM7Zoi1HosgUAoRgcMqa5i1Mjp3uZoByh0=;
 b=k3aSphICYp1uLEt0XBu/ER+rNCarH27gGhimAuRnC4gw1whoPMaPY3HHex1C3GLqcg
 H/LN/S0AlrJWEzw7xc3sQZmILoRPhpnfJFA4bByMpO13qqf9XKF/Mv9RT1a1lMFTSHbS
 0kBA3/alye5dQ85qz6LkOob3QpSR+WMxiIRWb+V33TpeVLgp/Dz899bSLKWk9gRAM1YC
 1C2ROrh2UGfqkdhmCWfxDKpDqtQrcsvBmN1X1EBzt3TyAivNFbfqctc9LkPCAPHDl4LK
 icYAUHojXcl/4ipzXkXbyou/x2ICyp2A98eiYSfNSnP8MgA5n5Oo/TP+n0+OAaL+ypOp
 70MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768913608; x=1769518408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vQA0UiXnoLM7Zoi1HosgUAoRgcMqa5i1Mjp3uZoByh0=;
 b=ljy3j7xE98B+1PnCfYRLE4rzz45jGf2kv3xbosafDGvsxkbRM17l4TKt9lvO33UO/9
 z9/5Dqt8QPERhlcLJbONbTyWrbZiyikd354RDNj1YsqdXfWQT/463u7xcfJMhODn82Fp
 ScLkcFE5/KfJLsplfKnj+HNcMK0KgbkQa8jEAqASx1wvkIM33THwHgefIugm8CMNZF51
 ePVs4PAYzP+ogQXMUVA4oVnerQ2WaJ7ZdR1YVboa6wgX0/YluuXknnCtyulEQHOngWUh
 hi6qeXm70C3nWrkrCWZ57kfjLAx7Jy/rdOc3XXRHJPzurRtQHwlD8A3U4HB5ihqn/v/9
 GQ0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaqJyiGY6OmqNfSg4w0hMOWBRnoP8MURDxV4EPBMRU7ZBFu+t/jQBPjUAi4EPpL+XMyjkeXJDdX/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMWWykuvAOfntgfESGN18LeBe1y8V8SWNUKDacdmAEbtgawE9s
 Y3tdxdPzY2tb28jQ7KGZu0RKVpJqB2RGPFzDIFdsHPzztmKF1FwC7gd+
X-Gm-Gg: AZuq6aL5f1RFyHL3VK0My7LrBYLZznfinSVNdm87ueEG2coOoWouy4gTC+r+cKEBynx
 6JLK+osTRFLsb17tU/IlZNi4PIybV8fHxKAfOXswEqIHf6UVfZp7l/vxI4i7uL7YreIMbK6YMIc
 ZWxi39t3KkkTYhP5BHJMuO/Y8KE3rV7Xazq5VMga6V/8sleS5uantIx9uZQ6eASjA0YW57B7IMB
 8JsbxXe4Js3HabnJealt7v5lqhPAgV8FusZqc8FmEGPHPT3neKSmPrwacUh3GJAYBudGqVtdCoz
 9yAddDmJ28el6+K2LoXj4Fqpmvsye3Fwe5HySDWc34w5JJF6v2IX79kBMHf0n0evDVFN2SU7I9H
 j/bFarVR8nwtW4e4S27zCYJJPW3syQuzJxqKqVfRkgAT4KJRcuEm4TaziOiI0ED1xtMSRH79VOl
 k412PRniRrTV9IR8ZzF3zy9qycrmx6jrYyag==
X-Received: by 2002:a17:902:e84a:b0:2a0:c942:8adf with SMTP id
 d9443c01a7336-2a7690523c5mr13664115ad.8.1768913608371; 
 Tue, 20 Jan 2026 04:53:28 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190abcf0sm125579405ad.12.2026.01.20.04.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 04:53:27 -0800 (PST)
Message-ID: <c8d539f1-bebd-445b-b0a4-9f3fc62770c0@gmail.com>
Date: Tue, 20 Jan 2026 18:23:50 +0530
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
 <aWe-QA_grqNwnE4n@aspen.lan> <ec7b7af7-1343-4988-b783-9ce9b045c8ae@gmail.com>
 <aW9NH5GTwSR-m7VQ@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aW9NH5GTwSR-m7VQ@aspen.lan>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@riscstar.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 1E75547997
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20-01-2026 15:08, Daniel Thompson wrote:
> On Tue, Jan 20, 2026 at 10:22:02AM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 14-01-2026 21:33, Daniel Thompson wrote:
>>> On Tue, Jan 13, 2026 at 12:47:26PM +0530, tessolveupstream@gmail.com wrote:
>>>>
>>>>
>>>> On 05-01-2026 15:39, Daniel Thompson wrote:
>>>>> On Mon, Jan 05, 2026 at 02:21:20PM +0530, Sudarshan Shetty wrote:
>>>>>> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
>>>>>> single one. This allows panels that require driving several enable pins
>>>>>> to be controlled by the backlight framework.
>>>>>>
>>>>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>>>>> ---
>>>>>>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
>>>>>>  1 file changed, 45 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>>>>>> index 728a546904b0..037e1c111e48 100644
>>>>>> --- a/drivers/video/backlight/gpio_backlight.c
>>>>>> +++ b/drivers/video/backlight/gpio_backlight.c
>>>>>> @@ -17,14 +17,18 @@
>>>>>>
>>>>>>  struct gpio_backlight {
>>>>>>  	struct device *dev;
>>>>>> -	struct gpio_desc *gpiod;
>>>>>> +	struct gpio_desc **gpiods;
>>>>>> +	unsigned int num_gpios;
>>>>>
>>>>> Why not use struct gpio_descs for this?
>>>>>
>>>>> Once you do that, then most of the gbl->num_gpios loops can be replaced with
>>>>> calls to the array based accessors.
>>>>>
>>>>
>>>> Based on your feedback, I have updated the implementation to use
>>>> struct gpio_descs and array-based accessors, as recommended like
>>>> below:
>>>>
>>>> git diff drivers/video/backlight/gpio_backlight.c
>>>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>>>> index 037e1c111e48..e99d7a9dc670 100644
>>>> --- a/drivers/video/backlight/gpio_backlight.c
>>>> +++ b/drivers/video/backlight/gpio_backlight.c
>>>> @@ -14,22 +14,37 @@
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/property.h>
>>>>  #include <linux/slab.h>
>>>> +#include <linux/bitmap.h>
>>>>
>>>>  struct gpio_backlight {
>>>>         struct device *dev;
>>>> -       struct gpio_desc **gpiods;
>>>> +       struct gpio_descs *gpiods;
>>>>         unsigned int num_gpios;
>>>>  };
>>>>
>>>>  static int gpio_backlight_update_status(struct backlight_device *bl)
>>>>  {
>>>>         struct gpio_backlight *gbl = bl_get_data(bl);
>>>> -       unsigned int i;
>>>> +       unsigned int n = gbl->num_gpios;
>>>>         int br = backlight_get_brightness(bl);
>>>> +       unsigned long *value_bitmap;
>>>> +       int words = BITS_TO_LONGS(n);
>>>> +
>>>> +       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
>>>
>>> Not sure you need a kcalloc() here. If you want to support more than 32
>>> GPIOs then you can pre-allocate space with a devm_kcalloc() in the probe
>>> method rather than reallocate every time it is used.
>>>
>>> To be honest I don't really mind putting a hard limit on the maximum
>>> gpl->num_gpios (so you can just use a local variable) and having no
>>> allocation at all.
>>>
>>
>> Thanks for the suggestion. I addressed the kcalloc() concern by
>> moving the bitmap allocation to probe using devm_kcalloc() as
>> below:
>>
>> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
>> index 0eb42d8bf1d9..7af5dc4f0315 100644
>> --- a/drivers/video/backlight/gpio_backlight.c
>> +++ b/drivers/video/backlight/gpio_backlight.c
>> @@ -19,32 +19,25 @@
>>  struct gpio_backlight {
>>         struct device *dev;
>>         struct gpio_descs *gpiods;
>> -       unsigned int num_gpios;
>> +       unsigned long *bitmap;
>>  };
>>
>>  static int gpio_backlight_update_status(struct backlight_device *bl)
>>  {
>>         struct gpio_backlight *gbl = bl_get_data(bl);
>> -       unsigned int n = gbl->num_gpios;
>> +       unsigned int n = gbl->gpiods->ndescs;
>>         int br = backlight_get_brightness(bl);
>> -       unsigned long *value_bitmap;
>> -       int words = BITS_TO_LONGS(n);
>> -
>> -       value_bitmap = kcalloc(words, sizeof(unsigned long), GFP_KERNEL);
>> -       if (!value_bitmap)
>> -               return -ENOMEM;
>>
>>         if (br)
>> -               bitmap_fill(value_bitmap, n);
>> +               bitmap_fill(gbl->bitmap, n);
>>         else
>> -               bitmap_zero(value_bitmap, n);
>> +               bitmap_zero(gbl->bitmap, n);
>>
>> -       gpiod_set_array_value_cansleep(gbl->gpiods->ndescs,
>> +       gpiod_set_array_value_cansleep(n,
>>                                        gbl->gpiods->desc,
>>                                        gbl->gpiods->info,
>> -                                      value_bitmap);
>> +                                      gbl->bitmap);
>>
>> -       kfree(value_bitmap);
>>         return 0;
>>  }
>>
>> @@ -67,22 +60,25 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>         struct device *dev = &pdev->dev;
>>         struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
>>         struct device_node *of_node = dev->of_node;
>> -       struct backlight_properties props;
>> +       struct backlight_properties props = { };
>>         struct backlight_device *bl;
>>         struct gpio_backlight *gbl;
>> -       int ret, init_brightness, def_value;
>> -       unsigned int i;
>> +       bool def_value;
>> +       enum gpiod_flags flags;
>> +       unsigned int n;
>> +       int words;
>>
>> -       gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>> -       if (gbl == NULL)
>> +       gbl = devm_kcalloc(dev, 1, sizeof(*gbl), GFP_KERNEL);
>> +       if (!gbl)
>>                 return -ENOMEM;
>>
>>         if (pdata)
>>                 gbl->dev = pdata->dev;
>>
>>         def_value = device_property_read_bool(dev, "default-on");
>> -
>> -       gbl->gpiods = devm_gpiod_get_array(dev, NULL, GPIOD_ASIS);
>> +       flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
>> +
>> +       gbl->gpiods = devm_gpiod_get_array(dev, NULL, flags);
>>         if (IS_ERR(gbl->gpiods)) {
>>                 if (PTR_ERR(gbl->gpiods) == -ENODEV)
>>                         return dev_err_probe(dev, -EINVAL,
>> @@ -90,12 +86,17 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>                 return PTR_ERR(gbl->gpiods);
>>         }
>>
>> -       gbl->num_gpios = gbl->gpiods->ndescs;
>> -       if (gbl->num_gpios == 0)
>> +       n = gbl->gpiods->ndescs;
>> +       if (!n)
>>                 return dev_err_probe(dev, -EINVAL,
>> -                       "The gpios parameter is missing or invalid\n");
>> +                       "No GPIOs provided\n");
>> +
>> +       words = BITS_TO_LONGS(n);
>> +       gbl->bitmap = devm_kcalloc(dev, words, sizeof(unsigned long),
>> +                                  GFP_KERNEL);
>> +       if (!gbl->bitmap)
>> +               return -ENOMEM;
>>
>> -       memset(&props, 0, sizeof(props));
>>         props.type = BACKLIGHT_RAW;
>>         props.max_brightness = 1;
>>         bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
>> @@ -106,50 +107,19 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>>         }
>>
>>         /* Set the initial power state */
>> -       if (!of_node || !of_node->phandle) {
>> +       if (!of_node || !of_node->phandle)
>>                 /* Not booted with device tree or no phandle link to the node */
>>                 bl->props.power = def_value ? BACKLIGHT_POWER_ON
>>                                                     : BACKLIGHT_POWER_OFF;
>> -       } else {
>> -               bool all_high = true;
>> -               unsigned long *value_bitmap;
>> -               int words = BITS_TO_LONGS(gbl->num_gpios);
>> -
>> -               value_bitmap = kcalloc(words, sizeof(unsigned long),
>> -                                      GFP_KERNEL);
>> -               if (!value_bitmap)
>> -                       return -ENOMEM;
>> -
>> -               ret = gpiod_get_array_value_cansleep(gbl->gpiods->ndescs,
>> -                                                    gbl->gpiods->desc,
>> -                                                    gbl->gpiods->info,
>> -                                                    value_bitmap);
>> -               if (ret) {
>> -                       kfree(value_bitmap);
>> -                       return dev_err_probe(dev, ret,
>> -                               "failed to read initial gpio values\n");
>> -               }
>> -
>> -               all_high = bitmap_full(value_bitmap, gbl->num_gpios);
>> -
>> -               kfree(value_bitmap);
>> -               bl->props.power =
>> -                       all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
>> -       }
>> -
>> -       bl->props.brightness = 1;
>> -
>> -       init_brightness = backlight_get_brightness(bl);
>> +       else if (gpiod_get_value_cansleep(gbl->gpiods->desc[0]) == 0)
>> +               bl->props.power = BACKLIGHT_POWER_OFF;
>> +       else
>> +               bl->props.power = BACKLIGHT_POWER_ON;
>>
>> -       for (i = 0; i < gbl->num_gpios; i++) {
>> -               ret = gpiod_direction_output(gbl->gpiods->desc[i],
>> -                                            init_brightness);
>> -               if (ret)
>> -                       return dev_err_probe(dev, ret,
>> -                                       "failed to set gpio %u direction\n",
>> -                                       i);
>> -       }
>> +       bl->props.brightness = def_value ? 1 : 0;
>>
>> +       gpio_backlight_update_status(bl);
>> +
>>         platform_set_drvdata(pdev, bl);
>>         return 0;
>>  }
>>
>> Kindly confirm whether this approach aligns with your
>> expectations.
> 
> As mentioned yesterday, I'd rather just review a v2 patch than this kind of
> meta-patch. Please send a v2 patch instead.
>

Got it, will send v2 patch.
 
> 
> Daniel.

