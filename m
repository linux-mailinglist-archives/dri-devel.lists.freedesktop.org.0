Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A8B85FC38
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E43610E95D;
	Thu, 22 Feb 2024 15:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B7jTQWN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F4810E2AD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:23:12 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6e45bd5014dso2192781b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 07:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708615392; x=1709220192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=18aJgkLrhUb7en6e+9IVDc7Sm8XASVYQ/8bIVIOkYlw=;
 b=B7jTQWN/O5dFjypO3/8XMjLgCftoBY2bZ6FvkFPBjskt+HAHcYEasafl9Kt5ZC6PBE
 N/V9BCeV4jUwBgRpYg3wIcJToYpREZ5QoA94eXOTo4jpa3ilGiH/xhKPWzmC43QfQtgy
 FygDesTc0M/RNZLGCefW/OMhamgZg5xtdkaz1BKI82fRgKQuNo6a1HQZC6tDvrmISqyT
 OLsaz5+fx838tpE30n2g1mD8c/QNGXBtuINq1rJ96ARHJWrPgKllz+XcfU98kA/kKtzR
 WpJPyhfz5Ur8CmRsDQ2NXIR5w3j3TSKrpPKjxIVkMPuGuxiIMYBnKwk3CLICEe6WPk8D
 mAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708615392; x=1709220192;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=18aJgkLrhUb7en6e+9IVDc7Sm8XASVYQ/8bIVIOkYlw=;
 b=U5eAX30mL4glvU45ae4TELX3I272eKRSbae9o8IC+ueXsoXk8HjGKgIfbHuGKU0NNm
 +64EUOxzHAKkuiFwk86+8RByjiqDQ1v9rRefRQ7Pwes7l4q2Y6QEiVFYQnWH694LdmTb
 4bfw5mqHbPFRhvuga0VigUc7e78uazmG75EIuuxyh6OveZ2eU1setSGu0i1IdyRHpNJ2
 dIx2XlnaR8LI+dRX+ZRJkI0GIaIhbWS3OsGMfZ/kA9nRVCBtGyC7lwhDd1nkDIFYOfYG
 EiM8pIywlsQG7nH4z/dXzKok8Uyl6y9UR7va1WiyX/chBYY5gsrZzZ2lXIIDd9YQKm4o
 YyjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUELldHXiFgUfouxzGteKKE+Y/n3xjj+Vg3llbkGQ7e+vPdWS11hND7rF74StB83tJ27BlSfTlVNntXaz3Rz+TKimsAt2/dJK0cmvJzM9JE
X-Gm-Message-State: AOJu0YyRe2DC8YdAJDA+vI9Sn/pHjSy87wo2HeM5pcKzovU37ZgA7R9W
 /UUthQ3IlrK8o50NYdZR8eaX3ALT1wPx3jEg0eRHUjO7PJRj/OCv
X-Google-Smtp-Source: AGHT+IFgO7x6qc0DEEnZN42M8DGEgpD5a4mxPzQSd1CZmh4j5qF92F7sS0zFuKoONna795EqP51M4g==
X-Received: by 2002:aa7:91d1:0:b0:6e0:4e7e:ef57 with SMTP id
 z17-20020aa791d1000000b006e04e7eef57mr19247160pfa.32.1708615392201; 
 Thu, 22 Feb 2024 07:23:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b2-20020aa78ec2000000b006e4d2cbcac8sm998069pfr.94.2024.02.22.07.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 07:23:11 -0800 (PST)
Message-ID: <a336a642-838c-48e9-aea3-703fd0d017bc@roeck-us.net>
Date: Thu, 22 Feb 2024 07:23:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] devm-helpers: Add resource managed version of debugfs
 directory create function
Content-Language: en-US
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Davidlohr Bueso
 <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Bamvor Jian Zhang <bamv2005@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 James Seo <james@equiv.tech>, Jean Delvare <jdelvare@suse.com>,
 linux-crypto@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org
References: <20240222145838.12916-1-kabel@kernel.org>
 <20240222145838.12916-2-kabel@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240222145838.12916-2-kabel@kernel.org>
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
> A few drivers register a devm action to remove a debugfs directory,
> implementing a one-liner function that calls debufs_remove_recursive().
> Help drivers avoid this repeated implementations by adding managed
> version of debugfs directory create function.
> 
> Use the new function devm_debugfs_create_dir() in the following
> drivers:
>    drivers/crypto/caam/ctrl.c
>    drivers/gpu/drm/bridge/ti-sn65dsi86.c
>    drivers/hwmon/hp-wmi-sensors.c
>    drivers/hwmon/mr75203.c
>    drivers/hwmon/pmbus/pmbus_core.c
> 
> Also use the action function devm_debugfs_dir_recursive_drop() in
> drivers
>    drivers/cxl/mem.c
>    drivers/gpio/gpio-mockup.c
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   drivers/crypto/caam/ctrl.c            | 16 +++------
>   drivers/cxl/mem.c                     |  9 ++---
>   drivers/gpio/gpio-mockup.c            | 11 ++----
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 ++------
>   drivers/hwmon/hp-wmi-sensors.c        | 15 ++-------
>   drivers/hwmon/mr75203.c               | 15 +++------
>   drivers/hwmon/pmbus/pmbus_core.c      | 16 +++------
>   include/linux/devm-helpers.h          | 48 +++++++++++++++++++++++++++
>   8 files changed, 72 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/crypto/caam/ctrl.c b/drivers/crypto/caam/ctrl.c
> index bdf367f3f679..ea3ed9a17f1a 100644
> --- a/drivers/crypto/caam/ctrl.c
> +++ b/drivers/crypto/caam/ctrl.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/of_address.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
> @@ -604,11 +605,6 @@ static int init_clocks(struct device *dev, const struct caam_imx_data *data)
>   	return devm_add_action_or_reset(dev, disable_clocks, ctrlpriv);
>   }
>   
> -static void caam_remove_debugfs(void *root)
> -{
> -	debugfs_remove_recursive(root);
> -}
> -
>   #ifdef CONFIG_FSL_MC_BUS
>   static bool check_version(struct fsl_mc_version *mc_version, u32 major,
>   			  u32 minor, u32 revision)
> @@ -1058,13 +1054,9 @@ static int caam_probe(struct platform_device *pdev)
>   	ctrlpriv->era = caam_get_era(perfmon);
>   	ctrlpriv->domain = iommu_get_domain_for_dev(dev);
>   
> -	dfs_root = debugfs_create_dir(dev_name(dev), NULL);
> -	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
> -		ret = devm_add_action_or_reset(dev, caam_remove_debugfs,
> -					       dfs_root);
> -		if (ret)
> -			return ret;
> -	}
> +	dfs_root = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> +	if (IS_ERR(dfs_root))
> +		return PTR_ERR(dfs_root);
>   
>   	caam_debugfs_init(ctrlpriv, perfmon, dfs_root);
>   
> diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> index c5c9d8e0d88d..4b38514887a4 100644
> --- a/drivers/cxl/mem.c
> +++ b/drivers/cxl/mem.c
> @@ -2,6 +2,7 @@
>   /* Copyright(c) 2022 Intel Corporation. All rights reserved. */
>   #include <linux/debugfs.h>
>   #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/module.h>
>   #include <linux/pci.h>
>   
> @@ -30,11 +31,6 @@ static void enable_suspend(void *data)
>   	cxl_mem_active_dec();
>   }
>   
> -static void remove_debugfs(void *dentry)
> -{
> -	debugfs_remove_recursive(dentry);
> -}
> -
>   static int cxl_mem_dpa_show(struct seq_file *file, void *data)
>   {
>   	struct device *dev = file->private;
> @@ -138,7 +134,8 @@ static int cxl_mem_probe(struct device *dev)
>   		debugfs_create_file("clear_poison", 0200, dentry, cxlmd,
>   				    &cxl_poison_clear_fops);
>   
> -	rc = devm_add_action_or_reset(dev, remove_debugfs, dentry);
> +	rc = devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> +				      dentry);
>   	if (rc)
>   		return rc;
>   
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 455eecf6380e..adbe0fe09490 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -12,6 +12,7 @@
>   #include <linux/cleanup.h>
>   #include <linux/debugfs.h>
>   #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/interrupt.h>
>   #include <linux/irq.h>
> @@ -390,13 +391,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
>   	}
>   }
>   
> -static void gpio_mockup_debugfs_cleanup(void *data)
> -{
> -	struct gpio_mockup_chip *chip = data;
> -
> -	debugfs_remove_recursive(chip->dbg_dir);
> -}
> -
>   static void gpio_mockup_dispose_mappings(void *data)
>   {
>   	struct gpio_mockup_chip *chip = data;
> @@ -480,7 +474,8 @@ static int gpio_mockup_probe(struct platform_device *pdev)
>   
>   	gpio_mockup_debugfs_setup(dev, chip);
>   
> -	return devm_add_action_or_reset(dev, gpio_mockup_debugfs_cleanup, chip);
> +	return devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> +					chip->dbg_dir);
>   }
>   
>   static const struct of_device_id gpio_mockup_of_match[] = {
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 62cc3893dca5..ad0ed2459394 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -10,6 +10,7 @@
>   #include <linux/bits.h>
>   #include <linux/clk.h>
>   #include <linux/debugfs.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/i2c.h>
> @@ -427,18 +428,12 @@ static int status_show(struct seq_file *s, void *data)
>   
>   DEFINE_SHOW_ATTRIBUTE(status);
>   
> -static void ti_sn65dsi86_debugfs_remove(void *data)
> -{
> -	debugfs_remove_recursive(data);
> -}
> -
>   static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
>   {
>   	struct device *dev = pdata->dev;
>   	struct dentry *debugfs;
> -	int ret;
>   
> -	debugfs = debugfs_create_dir(dev_name(dev), NULL);
> +	debugfs = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
>   
>   	/*
>   	 * We might get an error back if debugfs wasn't enabled in the kernel
> @@ -447,10 +442,6 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
>   	if (IS_ERR_OR_NULL(debugfs))
>   		return;
>   
> -	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_debugfs_remove, debugfs);
> -	if (ret)
> -		return;
> -
>   	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
>   }
>   
> diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
> index b5325d0e72b9..2a7c33763ce8 100644
> --- a/drivers/hwmon/hp-wmi-sensors.c
> +++ b/drivers/hwmon/hp-wmi-sensors.c
> @@ -23,6 +23,7 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/debugfs.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/hwmon.h>
>   #include <linux/jiffies.h>
>   #include <linux/mutex.h>
> @@ -1304,12 +1305,6 @@ static int current_reading_show(struct seq_file *seqf, void *ignored)
>   }
>   DEFINE_SHOW_ATTRIBUTE(current_reading);
>   
> -/* hp_wmi_devm_debugfs_remove - devm callback for debugfs cleanup */
> -static void hp_wmi_devm_debugfs_remove(void *res)
> -{
> -	debugfs_remove_recursive(res);
> -}
> -
>   /* hp_wmi_debugfs_init - create and populate debugfs directory tree */
>   static void hp_wmi_debugfs_init(struct device *dev, struct hp_wmi_info *info,
>   				struct hp_wmi_platform_events *pevents,
> @@ -1320,21 +1315,15 @@ static void hp_wmi_debugfs_init(struct device *dev, struct hp_wmi_info *info,
>   	struct dentry *debugfs;
>   	struct dentry *entries;
>   	struct dentry *dir;
> -	int err;
>   	u8 i;
>   
>   	/* dev_name() gives a not-very-friendly GUID for WMI devices. */
>   	scnprintf(buf, sizeof(buf), "hp-wmi-sensors-%u", dev->id);
>   
> -	debugfs = debugfs_create_dir(buf, NULL);
> +	debugfs = devm_debugfs_create_dir(dev, buf, NULL);
>   	if (IS_ERR(debugfs))
>   		return;
>   
> -	err = devm_add_action_or_reset(dev, hp_wmi_devm_debugfs_remove,
> -				       debugfs);
> -	if (err)
> -		return;
> -
>   	entries = debugfs_create_dir("sensor", debugfs);
>   
>   	for (i = 0; i < icount; i++, info++) {
> diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
> index 50a8b9c3f94d..50f348fca108 100644
> --- a/drivers/hwmon/mr75203.c
> +++ b/drivers/hwmon/mr75203.c
> @@ -10,6 +10,7 @@
>   #include <linux/bits.h>
>   #include <linux/clk.h>
>   #include <linux/debugfs.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/hwmon.h>
>   #include <linux/kstrtox.h>
>   #include <linux/module.h>
> @@ -216,17 +217,11 @@ static const struct file_operations pvt_ts_coeff_j_fops = {
>   	.llseek = default_llseek,
>   };
>   
> -static void devm_pvt_ts_dbgfs_remove(void *data)
> -{
> -	struct pvt_device *pvt = (struct pvt_device *)data;
> -
> -	debugfs_remove_recursive(pvt->dbgfs_dir);
> -	pvt->dbgfs_dir = NULL;
> -}
> -
>   static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
>   {
> -	pvt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
> +	pvt->dbgfs_dir = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> +	if (IS_ERR(pvt->dbgfs_dir))
> +		return PTR_ERR(pvt->dbgfs_dir);
>   
>   	debugfs_create_u32("ts_coeff_h", 0644, pvt->dbgfs_dir,
>   			   &pvt->ts_coeff.h);
> @@ -237,7 +232,7 @@ static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
>   	debugfs_create_file("ts_coeff_j", 0644, pvt->dbgfs_dir, pvt,
>   			    &pvt_ts_coeff_j_fops);
>   
> -	return devm_add_action_or_reset(dev, devm_pvt_ts_dbgfs_remove, pvt);
> +	return 0;
>   }
>   
>   static umode_t pvt_is_visible(const void *data, enum hwmon_sensor_types type,
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 1363d9f89181..e0f956a21125 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/debugfs.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/kernel.h>
>   #include <linux/math64.h>
>   #include <linux/module.h>
> @@ -3336,13 +3337,6 @@ static const struct file_operations pmbus_debugfs_ops_mfr = {
>   	.open = simple_open,
>   };
>   
> -static void pmbus_remove_debugfs(void *data)
> -{
> -	struct dentry *entry = data;
> -
> -	debugfs_remove_recursive(entry);
> -}
> -
>   static int pmbus_init_debugfs(struct i2c_client *client,
>   			      struct pmbus_data *data)
>   {
> @@ -3357,8 +3351,9 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>   	 * Create the debugfs directory for this device. Use the hwmon device
>   	 * name to avoid conflicts (hwmon numbers are globally unique).
>   	 */
> -	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
> -					   pmbus_debugfs_dir);
> +	data->debugfs = devm_debugfs_create_dir(data->dev,
> +						dev_name(data->hwmon_dev),
> +						pmbus_debugfs_dir);
>   	if (IS_ERR_OR_NULL(data->debugfs)) {
>   		data->debugfs = NULL;
>   		return -ENODEV;
> @@ -3542,8 +3537,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>   		}
>   	}
>   
> -	return devm_add_action_or_reset(data->dev,
> -					pmbus_remove_debugfs, data->debugfs);
> +	return 0;
>   }
>   #else
>   static int pmbus_init_debugfs(struct i2c_client *client,
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 70640fb96117..39d743175ec4 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -23,6 +23,7 @@
>    * already ran.
>    */
>   
> +#include <linux/debugfs.h>
>   #include <linux/device.h>
>   #include <linux/kconfig.h>
>   #include <linux/mutex.h>
> @@ -108,4 +109,51 @@ static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>   		return 0;
>   }
>   
> +static inline void devm_debugfs_dir_recursive_drop(void *res)
> +{
> +	debugfs_remove_recursive(res);
> +}
> +
> +/**
> + * devm_debugfs_create_dir - Resource managed debugfs directory creation
> + * @dev:	Device which lifetime the directory is bound to
> + * @name:	a pointer to a string containing the name of the directory to
> + *		create
> + * @parent:	a pointer to the parent dentry for this file.  This should be a
> + *		directory dentry if set.  If this parameter is NULL, then the
> + *		directory will be created in the root of the debugfs filesystem.
> + *
> + * Create a debugfs directory which is automatically recursively removed when
> + * the driver is detached. A few drivers create debugfs directories which they
> + * want removed before driver is detached.
> + * devm_debugfs_create_dir() can be used to omit the explicit
> + * debugfs_remove_recursive() call when driver is detached.
> + */
> +static inline struct dentry *
> +devm_debugfs_create_dir(struct device *dev, const char *name,
> +			struct dentry *parent)
> +{
> +	struct dentry *dentry;
> +
> +	dentry = debugfs_create_dir(name, parent);
> +	if (IS_ERR(dentry))
> +		return dentry;
> +
> +	/*
> +	 * debugfs_remove_recursive() is an empty function if CONFIG_DEBUG_FS is
> +	 * disabled. No need to register an action in that case.
> +	 */
> +	if (IS_ENABLED(CONFIG_DEBUG_FS)) {


This conditional seems unnecessary since in that case debugfs_create_dir()
would return -ENODEV, and the code below would never be executed to start with.

Guenter

> +		int err;
> +
> +		err = devm_add_action_or_reset(dev,
> +					       devm_debugfs_dir_recursive_drop,
> +					       dentry);
> +		if (err < 0)
> +			return ERR_PTR(err);
> +	}
> +
> +	return dentry;
> +}
> +
>   #endif

