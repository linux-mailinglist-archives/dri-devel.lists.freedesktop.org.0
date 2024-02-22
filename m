Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CED185FD7C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 17:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8933010E9AA;
	Thu, 22 Feb 2024 16:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WGdomHzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5851110E9A7;
 Thu, 22 Feb 2024 16:03:13 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6e4d869b019so157976b3a.0; 
 Thu, 22 Feb 2024 08:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708617793; x=1709222593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=zmfGugikQMjXAKoK91kY7BKBKEQ6iIZOd74HOBnKvEw=;
 b=WGdomHzZwS1FQJWe9fA8O1I8bRMLDy0FkvCi5nSG+2cUwy/D1rEG///RxU3hxobtUR
 G892NE3XwanoDiceuairj2mt6f6WquLQgI79zGu7/c2agCO/aW15Hlyys7gCpuPFs+Bp
 a88TLB1rC2UKNs4QgEonetSpcI6HWM5Yu2jCR8z+9rSDPXKniJ4dFegh05I+YuzmFWnX
 dWnns0xXNWNCAwDc/RcypqOAT1wFWxUueQJ1j616g/eCMJ8cbFZEGiS2IXAtdhQihZdx
 bUWsgs5gjbOzAe2PoGrfWFYnQ5TsRBVJZ5w1AhyhMZ5WMTiYRpJodz/oUAChu0r9nsrf
 JUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708617793; x=1709222593;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmfGugikQMjXAKoK91kY7BKBKEQ6iIZOd74HOBnKvEw=;
 b=aNd4YIIEZekTQT5SGBYFiqqladtr+pzGyVtNm4AiN8Q1BA2LgVCjork82lXwCbk4Tx
 LMnOe4SoXBtzvcmN+61mVrRxn5K9oCkPCfhAIY1FOeuYbQ4UltD1gAhTBe5LMj7hwH/3
 fEDYIjZ/G6PNRlCypem7Y/adZVVb4/I2o+Z/aH1cxaoHi16YEHafwcoPz2AdKszZU94/
 q1Qvrmi4kHfdgL7zhbDPywlTCTXrBF1KWeUdQetZO9sZROsmYKHJXm8q/RQEwNtfpQgY
 63WJVr7PM9U5ia0T1AwWKUGX2yfgxe6IgHTBEyxERFbKmuiUr7pYx/KGjnhrwFsu1v2y
 9jfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh9aP57qpX+YUefplMuef4NIrR5m/sv/UC7sRn0D1Jh4mOo8akkqAvzfJrBo8J2mSJskwxF/cII2ALa8SjOsjWR6o9fyPszH0IMhWReApp5qoK/e+uBuOYiD8cnVJ0Gnec700h2smW/i8C26pf4DY=
X-Gm-Message-State: AOJu0Yw3rW92LHhL2T1CigE7lGNQoPVwK9emGYXA01JwJsU2Sz1q+MaR
 qi2L6/Ix56kqIg420mCGJW0bdVZGcZSa32JZ1L29/DVWW0dy5PxN
X-Google-Smtp-Source: AGHT+IGB03rRczzEqj0RkkBn0mpiVHnK3M012lR5QdmPa1yhl9Um3OgZJ4eKu61Syk6jCBDk0PMl5Q==
X-Received: by 2002:a05:6a20:6f96:b0:1a0:7f19:b2b1 with SMTP id
 gv22-20020a056a206f9600b001a07f19b2b1mr20747791pzb.26.1708617792716; 
 Thu, 22 Feb 2024 08:03:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a633714000000b005c1ce3c960bsm10802514pga.50.2024.02.22.08.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 08:03:11 -0800 (PST)
Message-ID: <e610c9b6-0491-42ac-90a1-00c547741773@roeck-us.net>
Date: Thu, 22 Feb 2024 08:03:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Aleksandr Mezin <mezin.alexander@gmail.com>, Jean Delvare
 <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones
 <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240222145838.12916-1-kabel@kernel.org>
 <4a545c16-7518-49d2-b158-7fcabe3508c5@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <4a545c16-7518-49d2-b158-7fcabe3508c5@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Oops, sorry for the noise. Shortened reply below.

On 2/22/24 07:24, Guenter Roeck wrote:
> On 2/22/24 06:58, Marek Behún wrote:
>> A few drivers are doing resource-managed mutex initialization by
>> implementing ad-hoc one-liner mutex dropping functions and using them
>> with devm_add_action_or_reset(). Help drivers avoid these repeated
>> one-liners by adding managed version of mutex initialization.
>>

[ ... ]

>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +    mutex_init(lock);
>> +
>> +    /*
>> +     * mutex_destroy() is an empty function if CONFIG_DEBUG_MUTEXES is
>> +     * disabled. No need to allocate an action in that case.
>> +     */
>> +    if (IS_ENABLED(CONFIG_DEBUG_MUTEXES))
>> +        return devm_add_action_or_reset(dev, devm_mutex_drop, lock);
>> +    else
> 
> else after return is unnecessary.
> 
>> +        return 0;
>> +}
>> +
>>   #endif
> 
> 

