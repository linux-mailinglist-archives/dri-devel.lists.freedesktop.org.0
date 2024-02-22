Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1750086016F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A7E10EA1F;
	Thu, 22 Feb 2024 18:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F9vaL/4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598D710EA1F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708626802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDF5rof44gEIb9jX4TIDVAFNvDzRBoYmWa48QZ9r6nQ=;
 b=F9vaL/4J6BIKYvGuy4K5IemkafT7VkbbiUBJNbQrSmK8J1HK0+ML9PXCxd0XgvYoYmhxUb
 32GrtyJzbcGUwuUOKDpUajdzIoQ0lRBbc4tXcyrOEnTklyhYqCaBQbv1gyxUE/XXXmTsXh
 ysa3T5RG4BG5ktRXe9jxGpIWUSgxKvA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-1GPdaEu5N0qXUjGp3VocOw-1; Thu, 22 Feb 2024 13:33:19 -0500
X-MC-Unique: 1GPdaEu5N0qXUjGp3VocOw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a3f35ebeefbso873366b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708626798; x=1709231598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IDF5rof44gEIb9jX4TIDVAFNvDzRBoYmWa48QZ9r6nQ=;
 b=MHu9gDnVIG2M9n2Wiua+1ZfkX7K66ObE1hQhHgqSXdKpeu+0meKawhk519ySNLPruK
 XmBIK3bPcYNUBxc5P/ZMguZqvNU7YWYxLJeg0OaAamOUaEHENrCAkZQeJUSl8vnB2MLC
 ykTQLe/kzL8Po58xEFxtnGI4PItBwKgUBFAo7LSGY2i6vUy0vBqTldgbfzrtZcIb2voa
 98cSGMXSr9p+Nud1GQcE6E7c+2KLSLgxBAav5XxbWgcf0OhWOA9RJcWs/R90NvAYZ9SE
 rai1aMFaCp/fQWxxTtpSK46OUyMALqyVrXmvPxL6aqocdQfGzS4SMKsBmxqdVTZqEwl2
 Ll/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+mIDVVImVeeEOH7fukvZX7GSqQKy+HWziKWvVDQswMz75GZ33hV0nPrVBtrlSicXeBB84+zZmNBH8ey9wgdDP3noki4GJFjaWTjgwoC9+
X-Gm-Message-State: AOJu0Yyj76qnpw70fW/6UYwhfuhXJHtLGcB+Wid/PmpilVa6F8knKhbZ
 /dlc6cpzMdQMeJdFZ+/BUMUsCaDVO0qJBYPu7QzrKaG94UvzbtnS+TJD1hKt2qMHkrRr9hS9X4D
 rqzrQZb/xaIcyquBI0L2vFniYJzXXmaW9j83MEsVwjFM4fcJzAdqptMQaIPWy6nuwqQ==
X-Received: by 2002:a17:906:3b52:b0:a3f:1ec7:8765 with SMTP id
 h18-20020a1709063b5200b00a3f1ec78765mr4781466ejf.8.1708626797771; 
 Thu, 22 Feb 2024 10:33:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy6MVM+yU0ergPm1eOLv+jCkZxkYnKmu7DqTz49UohXBGjHmSJ/pKffRukeXLaaXuaiUR+Cg==
X-Received: by 2002:a17:906:3b52:b0:a3f:1ec7:8765 with SMTP id
 h18-20020a1709063b5200b00a3f1ec78765mr4781437ejf.8.1708626797348; 
 Thu, 22 Feb 2024 10:33:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 lu16-20020a170906fad000b00a3d5efc65e0sm4854658ejb.91.2024.02.22.10.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 10:33:16 -0800 (PST)
Message-ID: <7013bf9e-2663-4613-ae61-61872e81355b@redhat.com>
Date: Thu, 22 Feb 2024 19:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
To: Matthew Auld <matthew.auld@intel.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, linux-kernel@vger.kernel.org,
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
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240222145838.12916-1-kabel@kernel.org>
 <03e62bcf-137c-4947-8f34-0cbfcba92a30@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <03e62bcf-137c-4947-8f34-0cbfcba92a30@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 2/22/24 17:44, Matthew Auld wrote:
> On 22/02/2024 14:58, Marek Behún wrote:
>> A few drivers are doing resource-managed mutex initialization by
>> implementing ad-hoc one-liner mutex dropping functions and using them
>> with devm_add_action_or_reset(). Help drivers avoid these repeated
>> one-liners by adding managed version of mutex initialization.

<snip>

>> index 74891802200d..70640fb96117 100644
>> --- a/include/linux/devm-helpers.h
>> +++ b/include/linux/devm-helpers.h
>> @@ -24,6 +24,8 @@
>>    */
>>     #include <linux/device.h>
>> +#include <linux/kconfig.h>
>> +#include <linux/mutex.h>
>>   #include <linux/workqueue.h>
>>     static inline void devm_delayed_work_drop(void *res)
>> @@ -76,4 +78,34 @@ static inline int devm_work_autocancel(struct device *dev,
>>       return devm_add_action(dev, devm_work_drop, w);
>>   }
>>   +static inline void devm_mutex_drop(void *res)
>> +{
>> +    mutex_destroy(res);
>> +}
>> +
>> +/**
>> + * devm_mutex_init - Resource managed mutex initialization
>> + * @dev:    Device which lifetime mutex is bound to
>> + * @lock:    Mutex to be initialized (and automatically destroyed)
>> + *
>> + * Initialize mutex which is automatically destroyed when driver is detached.
>> + * A few drivers initialize mutexes which they want destroyed before driver is
>> + * detached, for debugging purposes.
>> + * devm_mutex_init() can be used to omit the explicit mutex_destroy() call when
>> + * driver is detached.
>> + */
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +    mutex_init(lock);
> 
> Do you know if this this needs __always_inline? The static lockdep key in mutex_init() should be
> different for each caller class. See c21f11d182c2 ("drm: fix drmm_mutex_init()").

That is a very good point. I believe that this should mirror mutex_init() and
the actual static inline function should be __devm_mutex_init() which takes
the key as extra argument (and calls __mutex_init()) and then make
devm_mutex_init() itself a macro mirroring the mutex_init() macro.

Regards,

Hans






> 
>> +
>> +    /*
>> +     * mutex_destroy() is an empty function if CONFIG_DEBUG_MUTEXES is
>> +     * disabled. No need to allocate an action in that case.
>> +     */
>> +    if (IS_ENABLED(CONFIG_DEBUG_MUTEXES))
>> +        return devm_add_action_or_reset(dev, devm_mutex_drop, lock);
>> +    else
>> +        return 0;
>> +}
>> +
>>   #endif
> 

