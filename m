Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392EF85FC42
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAE610E5D2;
	Thu, 22 Feb 2024 15:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WCnRzqWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB20410E5D2;
 Thu, 22 Feb 2024 15:24:54 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6e43ee3f6fbso4998550b3a.3; 
 Thu, 22 Feb 2024 07:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708615494; x=1709220294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=aXQfNeMLkgL8vNtlootrbSOlal3IIy+GDwI0MRVyyC8=;
 b=WCnRzqWkGt/c3QpFxIP2Bqhwe9cE5fevHAjyOYVkssfrNgigfbJrC5ofzZHzjAqqpV
 zh2Gn25TOAhx8pzdW+lObL/DC4EAjDNHftFIElM37d0qEsQ4qFl6ekmNFb7tcpHkY7cf
 4AwqehvIHHEaJUgGRSG3A02t7SkuqOlREXMVZf9+oU5ZGoqPBs+R944radYxVepFMvMB
 keY4GkoxW2tf009gqvcsEnEuO7upQO5Ljc5AhHdOb9z9+wIM48OQ7q+z6LGxOsUaMEEU
 /kMD5Jv+VjyeOip0qa1Zm2E6zc9lAv6auhZrwV2Y5YIKdbF04zcUZ+IpWdf3Q0nrLFD9
 qzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708615494; x=1709220294;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aXQfNeMLkgL8vNtlootrbSOlal3IIy+GDwI0MRVyyC8=;
 b=LeC+hs3RYWKynsAQpc8o30PyOeBn/virAZROr52pRLI5A97eW+189EaO8dZ3p48tDH
 TVlFYFTkw3qrKJJYBgndHCBTqsrEphH2p/iovoqB/UZUWDgB3y4eCiWPzSAhxd121BOn
 +t0aNJU3HROxwafytgQjAESv0GxBUsDE+GSEE4ibcy7BivQWCBjvGZkfCvRz/4Z8Qa17
 6OcrY/8VrJoM4x8z8N1Chyi9xDXje3SQ2ePh0JacY8tMLOSqD00Ir2cFDQtzT2hJuESC
 lxaXAoGdKoxhJNjon1JyxEW6Z6wB43uwIFtYamXQJgzLZSEvaiUwzvIhNYr7lbKRPasl
 /YIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7UMPLNUKhu1RGdFBcR8LTRImGL7n8m78A74MQQP+52nSQfMy3g89TIYdeYpFCO6bpZVx/+u+158/JXxHrnRb9T7tdhYrEzo7iWTsO1qf6fA7uqMtxz2ExR7k5M6CAWZ+D2V+6PkPE8jtL3xNI8uk=
X-Gm-Message-State: AOJu0YzrkJCmKGNAs3/Vi8MD8J7dq8dLMkB0zm2AoIn9Q1XknTSwZzLs
 /qphVcHnR5to/SL6fhtzWVGCz1kZjtDEHzF7QCxlgi8yhP0x3nU8
X-Google-Smtp-Source: AGHT+IFOCTi3dMlzjGviA7Kz3InAm5islYUdD+oRHJxhgo5nOUg6H4x7H8pBurwv2VMO/+nCHiFKIQ==
X-Received: by 2002:a05:6a21:3994:b0:19c:a4d3:2041 with SMTP id
 ad20-20020a056a21399400b0019ca4d32041mr31039509pzc.42.1708615494137; 
 Thu, 22 Feb 2024 07:24:54 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b2-20020aa78ec2000000b006e4d2cbcac8sm998069pfr.94.2024.02.22.07.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 07:24:53 -0800 (PST)
Message-ID: <4a545c16-7518-49d2-b158-7fcabe3508c5@roeck-us.net>
Date: Thu, 22 Feb 2024 07:24:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
Content-Language: en-US
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
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240222145838.12916-1-kabel@kernel.org>
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

On 2/22/24 06:58, Marek Behún wrote:
> A few drivers are doing resource-managed mutex initialization by
> implementing ad-hoc one-liner mutex dropping functions and using them
> with devm_add_action_or_reset(). Help drivers avoid these repeated
> one-liners by adding managed version of mutex initialization.
> 
> Use the new function devm_mutex_init() in the following drivers:
>    drivers/gpio/gpio-pisosr.c
>    drivers/gpio/gpio-sim.c
>    drivers/gpu/drm/xe/xe_hwmon.c
>    drivers/hwmon/nzxt-smart2.c
>    drivers/leds/leds-is31fl319x.c
>    drivers/power/supply/mt6370-charger.c
>    drivers/power/supply/rt9467-charger.c
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   drivers/gpio/gpio-pisosr.c            |  9 ++-----
>   drivers/gpio/gpio-sim.c               | 12 ++--------
>   drivers/gpu/drm/xe/xe_hwmon.c         | 11 ++-------
>   drivers/hwmon/nzxt-smart2.c           |  9 ++-----
>   drivers/leds/leds-is31fl319x.c        |  9 ++-----
>   drivers/power/supply/mt6370-charger.c | 11 +--------
>   drivers/power/supply/rt9467-charger.c | 34 ++++-----------------------
>   include/linux/devm-helpers.h          | 32 +++++++++++++++++++++++++
>   8 files changed, 47 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
> index e3013e778e15..dddbf37e855f 100644
> --- a/drivers/gpio/gpio-pisosr.c
> +++ b/drivers/gpio/gpio-pisosr.c
> @@ -7,6 +7,7 @@
>   #include <linux/bitmap.h>
>   #include <linux/bitops.h>
>   #include <linux/delay.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/module.h>
> @@ -116,11 +117,6 @@ static const struct gpio_chip template_chip = {
>   	.can_sleep		= true,
>   };
>   
> -static void pisosr_mutex_destroy(void *lock)
> -{
> -	mutex_destroy(lock);
> -}
> -
>   static int pisosr_gpio_probe(struct spi_device *spi)
>   {
>   	struct device *dev = &spi->dev;
> @@ -147,8 +143,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
>   		return dev_err_probe(dev, PTR_ERR(gpio->load_gpio),
>   				     "Unable to allocate load GPIO\n");
>   
> -	mutex_init(&gpio->lock);
> -	ret = devm_add_action_or_reset(dev, pisosr_mutex_destroy, &gpio->lock);
> +	ret = devm_mutex_init(dev, &gpio->lock);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index c4106e37e6db..fcfcaa4efe70 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -12,6 +12,7 @@
>   #include <linux/completion.h>
>   #include <linux/configfs.h>
>   #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/err.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/driver.h>
> @@ -307,13 +308,6 @@ static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
>   	return len;
>   }
>   
> -static void gpio_sim_mutex_destroy(void *data)
> -{
> -	struct mutex *lock = data;
> -
> -	mutex_destroy(lock);
> -}
> -
>   static void gpio_sim_put_device(void *data)
>   {
>   	struct device *dev = data;
> @@ -457,9 +451,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	mutex_init(&chip->lock);
> -	ret = devm_add_action_or_reset(dev, gpio_sim_mutex_destroy,
> -				       &chip->lock);
> +	ret = devm_mutex_init(dev, &chip->lock);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 174ed2185481..bb88ae1c196c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <linux/devm-helpers.h>
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/hwmon.h>
>   #include <linux/types.h>
> @@ -729,13 +730,6 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   		xe_hwmon_energy_get(hwmon, &energy);
>   }
>   
> -static void xe_hwmon_mutex_destroy(void *arg)
> -{
> -	struct xe_hwmon *hwmon = arg;
> -
> -	mutex_destroy(&hwmon->hwmon_lock);
> -}
> -
>   void xe_hwmon_register(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
> @@ -751,8 +745,7 @@ void xe_hwmon_register(struct xe_device *xe)
>   
>   	xe->hwmon = hwmon;
>   
> -	mutex_init(&hwmon->hwmon_lock);
> -	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
> +	if (devm_mutex_init(dev, &hwmon->hwmon_lock))
>   		return;
>   
>   	/* primary GT to access device level properties */
> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index 7aa586eb74be..00bc89607673 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -5,6 +5,7 @@
>    * Copyright (c) 2021 Aleksandr Mezin
>    */
>   
> +#include <linux/devm-helpers.h>
>   #include <linux/hid.h>
>   #include <linux/hwmon.h>
>   #include <linux/math.h>
> @@ -721,11 +722,6 @@ static int __maybe_unused nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
>   	return init_device(drvdata, drvdata->update_interval);
>   }
>   
> -static void mutex_fini(void *lock)
> -{
> -	mutex_destroy(lock);
> -}
> -
>   static int nzxt_smart2_hid_probe(struct hid_device *hdev,
>   				 const struct hid_device_id *id)
>   {
> @@ -741,8 +737,7 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
>   
>   	init_waitqueue_head(&drvdata->wq);
>   
> -	mutex_init(&drvdata->mutex);
> -	ret = devm_add_action_or_reset(&hdev->dev, mutex_fini, &drvdata->mutex);
> +	ret = devm_mutex_init(&hdev->dev, &drvdata->mutex);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
> index 66c65741202e..e9d7cf6a386c 100644
> --- a/drivers/leds/leds-is31fl319x.c
> +++ b/drivers/leds/leds-is31fl319x.c
> @@ -8,6 +8,7 @@
>    * effect LEDs.
>    */
>   
> +#include <linux/devm-helpers.h>
>   #include <linux/err.h>
>   #include <linux/i2c.h>
>   #include <linux/leds.h>
> @@ -495,11 +496,6 @@ static inline int is31fl3196_db_to_gain(u32 dezibel)
>   	return dezibel / IS31FL3196_AUDIO_GAIN_DB_STEP;
>   }
>   
> -static void is31f1319x_mutex_destroy(void *lock)
> -{
> -	mutex_destroy(lock);
> -}
> -
>   static int is31fl319x_probe(struct i2c_client *client)
>   {
>   	struct is31fl319x_chip *is31;
> @@ -515,8 +511,7 @@ static int is31fl319x_probe(struct i2c_client *client)
>   	if (!is31)
>   		return -ENOMEM;
>   
> -	mutex_init(&is31->lock);
> -	err = devm_add_action_or_reset(dev, is31f1319x_mutex_destroy, &is31->lock);
> +	err = devm_mutex_init(dev, &is31->lock);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
> index e24fce087d80..fa0517d0352d 100644
> --- a/drivers/power/supply/mt6370-charger.c
> +++ b/drivers/power/supply/mt6370-charger.c
> @@ -766,13 +766,6 @@ static int mt6370_chg_init_psy(struct mt6370_priv *priv)
>   	return PTR_ERR_OR_ZERO(priv->psy);
>   }
>   
> -static void mt6370_chg_destroy_attach_lock(void *data)
> -{
> -	struct mutex *attach_lock = data;
> -
> -	mutex_destroy(attach_lock);
> -}
> -
>   static void mt6370_chg_destroy_wq(void *data)
>   {
>   	struct workqueue_struct *wq = data;
> @@ -900,9 +893,7 @@ static int mt6370_chg_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init psy\n");
>   
> -	mutex_init(&priv->attach_lock);
> -	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_attach_lock,
> -				       &priv->attach_lock);
> +	ret = devm_mutex_init(dev, &priv->attach_lock);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init attach lock\n");
>   
> diff --git a/drivers/power/supply/rt9467-charger.c b/drivers/power/supply/rt9467-charger.c
> index fdfdc83ab045..84f07c22077f 100644
> --- a/drivers/power/supply/rt9467-charger.c
> +++ b/drivers/power/supply/rt9467-charger.c
> @@ -10,6 +10,7 @@
>   #include <linux/bitfield.h>
>   #include <linux/completion.h>
>   #include <linux/delay.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/interrupt.h>
> @@ -1149,27 +1150,6 @@ static int rt9467_reset_chip(struct rt9467_chg_data *data)
>   	return regmap_field_write(data->rm_field[F_RST], 1);
>   }
>   
> -static void rt9467_chg_destroy_adc_lock(void *data)
> -{
> -	struct mutex *adc_lock = data;
> -
> -	mutex_destroy(adc_lock);
> -}
> -
> -static void rt9467_chg_destroy_attach_lock(void *data)
> -{
> -	struct mutex *attach_lock = data;
> -
> -	mutex_destroy(attach_lock);
> -}
> -
> -static void rt9467_chg_destroy_ichg_ieoc_lock(void *data)
> -{
> -	struct mutex *ichg_ieoc_lock = data;
> -
> -	mutex_destroy(ichg_ieoc_lock);
> -}
> -
>   static void rt9467_chg_complete_aicl_done(void *data)
>   {
>   	struct completion *aicl_done = data;
> @@ -1222,21 +1202,15 @@ static int rt9467_charger_probe(struct i2c_client *i2c)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to add irq chip\n");
>   
> -	mutex_init(&data->adc_lock);
> -	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_adc_lock,
> -				       &data->adc_lock);
> +	ret = devm_mutex_init(dev, &data->adc_lock);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init ADC lock\n");
>   
> -	mutex_init(&data->attach_lock);
> -	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_attach_lock,
> -				       &data->attach_lock);
> +	ret = devm_mutex_init(dev, &data->attach_lock);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init attach lock\n");
>   
> -	mutex_init(&data->ichg_ieoc_lock);
> -	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_ichg_ieoc_lock,
> -				       &data->ichg_ieoc_lock);
> +	ret = devm_mutex_init(dev, &data->ichg_ieoc_lock);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init ICHG/IEOC lock\n");
>   
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 74891802200d..70640fb96117 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -24,6 +24,8 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/kconfig.h>
> +#include <linux/mutex.h>
>   #include <linux/workqueue.h>
>   
>   static inline void devm_delayed_work_drop(void *res)
> @@ -76,4 +78,34 @@ static inline int devm_work_autocancel(struct device *dev,
>   	return devm_add_action(dev, devm_work_drop, w);
>   }
>   
> +static inline void devm_mutex_drop(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +/**
> + * devm_mutex_init - Resource managed mutex initialization
> + * @dev:	Device which lifetime mutex is bound to
> + * @lock:	Mutex to be initialized (and automatically destroyed)
> + *
> + * Initialize mutex which is automatically destroyed when driver is detached.
> + * A few drivers initialize mutexes which they want destroyed before driver is
> + * detached, for debugging purposes.
> + * devm_mutex_init() can be used to omit the explicit mutex_destroy() call when
> + * driver is detached.
> + */
> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	mutex_init(lock);
> +
> +	/*
> +	 * mutex_destroy() is an empty function if CONFIG_DEBUG_MUTEXES is
> +	 * disabled. No need to allocate an action in that case.
> +	 */
> +	if (IS_ENABLED(CONFIG_DEBUG_MUTEXES))
> +		return devm_add_action_or_reset(dev, devm_mutex_drop, lock);
> +	else

else after return is unnecessary.

> +		return 0;
> +}
> +
>   #endif

