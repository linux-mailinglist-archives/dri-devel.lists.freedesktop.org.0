Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE12F85FF3B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 18:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A6010E9BA;
	Thu, 22 Feb 2024 17:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEFHN8BO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A245B10E9BA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708622627; x=1740158627;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pQmt1bX8Uzb1bH1jYxtzxQi5Sz4GwyGXkJpyqV5S4C8=;
 b=nEFHN8BOEZ2haxlCrUmyPk2so/NS10216hbeK0elRzJ7ThiAwABdRc1B
 lQMNGWHcaINyIcj5qj4mP+8YYDub0DOpDvKQIBrZaVV3WvlMX2WMOw/Tm
 SgnWqN0G9R52l436MMyMkfcrBYQ2+WhafXss2BSdo/hYkjSKMvrd/mkRe
 nAQFuReES688hv1l3B8u+VmpRNBc3xU3HELG8P2u0Fzp4PS1nUD+L1WCx
 2VGX18cbwwrHtL4r9en9ZgxrE5YQAB3JVzQFGXO8bFiuMhAXyrzGw5rjT
 9j86IjJh4MeWOuiJFM02VRyNYfkqJFMFJKHgffxn2sRIbMG/oWoGGPble A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20304123"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="20304123"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 09:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="36388668"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.246.114.198])
 ([10.246.114.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 09:23:41 -0800
Message-ID: <23c50406-7ebd-4cc3-a978-1b8a5fc71ff0@intel.com>
Date: Thu, 22 Feb 2024 10:23:38 -0700
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
 Guenter Roeck <linux@roeck-us.net>, linux-crypto@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org
References: <20240222145838.12916-1-kabel@kernel.org>
 <20240222145838.12916-2-kabel@kernel.org>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20240222145838.12916-2-kabel@kernel.org>
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



On 2/22/24 7:58 AM, Marek Behún wrote:
> A few drivers register a devm action to remove a debugfs directory,
> implementing a one-liner function that calls debufs_remove_recursive().
> Help drivers avoid this repeated implementations by adding managed
> version of debugfs directory create function.
> 
> Use the new function devm_debugfs_create_dir() in the following
> drivers:
>   drivers/crypto/caam/ctrl.c
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c
>   drivers/hwmon/hp-wmi-sensors.c
>   drivers/hwmon/mr75203.c
>   drivers/hwmon/pmbus/pmbus_core.c
> 
> Also use the action function devm_debugfs_dir_recursive_drop() in
> drivers
>   drivers/cxl/mem.c
>   drivers/gpio/gpio-mockup.c
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/crypto/caam/ctrl.c            | 16 +++------
>  drivers/cxl/mem.c                     |  9 ++---
>  drivers/gpio/gpio-mockup.c            | 11 ++----
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 ++------
>  drivers/hwmon/hp-wmi-sensors.c        | 15 ++-------
>  drivers/hwmon/mr75203.c               | 15 +++------
>  drivers/hwmon/pmbus/pmbus_core.c      | 16 +++------
>  include/linux/devm-helpers.h          | 48 +++++++++++++++++++++++++++
>  8 files changed, 72 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/crypto/caam/ctrl.c b/drivers/crypto/caam/ctrl.c
> index bdf367f3f679..ea3ed9a17f1a 100644
> --- a/drivers/crypto/caam/ctrl.c
> +++ b/drivers/crypto/caam/ctrl.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> @@ -604,11 +605,6 @@ static int init_clocks(struct device *dev, const struct caam_imx_data *data)
>  	return devm_add_action_or_reset(dev, disable_clocks, ctrlpriv);
>  }
>  
> -static void caam_remove_debugfs(void *root)
> -{
> -	debugfs_remove_recursive(root);
> -}
> -
>  #ifdef CONFIG_FSL_MC_BUS
>  static bool check_version(struct fsl_mc_version *mc_version, u32 major,
>  			  u32 minor, u32 revision)
> @@ -1058,13 +1054,9 @@ static int caam_probe(struct platform_device *pdev)
>  	ctrlpriv->era = caam_get_era(perfmon);
>  	ctrlpriv->domain = iommu_get_domain_for_dev(dev);
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
>  	caam_debugfs_init(ctrlpriv, perfmon, dfs_root);
>  
> diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> index c5c9d8e0d88d..4b38514887a4 100644
> --- a/drivers/cxl/mem.c
> +++ b/drivers/cxl/mem.c
> @@ -2,6 +2,7 @@
>  /* Copyright(c) 2022 Intel Corporation. All rights reserved. */
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  
> @@ -30,11 +31,6 @@ static void enable_suspend(void *data)
>  	cxl_mem_active_dec();
>  }
>  
> -static void remove_debugfs(void *dentry)
> -{
> -	debugfs_remove_recursive(dentry);
> -}
> -
>  static int cxl_mem_dpa_show(struct seq_file *file, void *data)
>  {
>  	struct device *dev = file->private;
> @@ -138,7 +134,8 @@ static int cxl_mem_probe(struct device *dev)
>  		debugfs_create_file("clear_poison", 0200, dentry, cxlmd,
>  				    &cxl_poison_clear_fops);
>  
> -	rc = devm_add_action_or_reset(dev, remove_debugfs, dentry);
> +	rc = devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> +				      dentry);

This is probably the better fix for cxl:

diff --git a/drivers/cxl/core/core.h b/drivers/cxl/core/core.h
index 3b64fb1b9ed0..3258427af032 100644
--- a/drivers/cxl/core/core.h
+++ b/drivers/cxl/core/core.h
@@ -57,7 +57,6 @@ int cxl_send_cmd(struct cxl_memdev *cxlmd, struct cxl_send_command __user *s);
 void __iomem *devm_cxl_iomap_block(struct device *dev, resource_size_t addr,
 				   resource_size_t length);
 
-struct dentry *cxl_debugfs_create_dir(const char *dir);
 int cxl_dpa_set_mode(struct cxl_endpoint_decoder *cxled,
 		     enum cxl_decoder_mode mode);
 int cxl_dpa_alloc(struct cxl_endpoint_decoder *cxled, unsigned long long size);
diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
index 27166a411705..5c2db4791b8b 100644
--- a/drivers/cxl/core/mbox.c
+++ b/drivers/cxl/core/mbox.c
@@ -1402,7 +1402,7 @@ void __init cxl_mbox_init(void)
 {
 	struct dentry *mbox_debugfs;
 
-	mbox_debugfs = cxl_debugfs_create_dir("mbox");
+	mbox_debugfs = debugfs_create_dir("mbox", NULL);
 	debugfs_create_bool("raw_allow_all", 0600, mbox_debugfs,
 			    &cxl_raw_allow_all);
 }
diff --git a/drivers/cxl/core/port.c b/drivers/cxl/core/port.c
index e59d9d37aa65..82c6a1c6aff4 100644
--- a/drivers/cxl/core/port.c
+++ b/drivers/cxl/core/port.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/idr.h>
 #include <linux/node.h>
+#include <linux/devm-helpers.h>
 #include <cxlmem.h>
 #include <cxlpci.h>
 #include <cxl.h>
@@ -2207,13 +2208,7 @@ struct bus_type cxl_bus_type = {
 };
 EXPORT_SYMBOL_NS_GPL(cxl_bus_type, CXL);
 
-static struct dentry *cxl_debugfs;
-
-struct dentry *cxl_debugfs_create_dir(const char *dir)
-{
-	return debugfs_create_dir(dir, cxl_debugfs);
-}
-EXPORT_SYMBOL_NS_GPL(cxl_debugfs_create_dir, CXL);
+struct dentry *cxl_debugfs;
 
 static __init int cxl_core_init(void)
 {
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index b6017c0c57b4..ca8399b24955 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -880,6 +880,8 @@ void cxl_switch_parse_cdat(struct cxl_port *port);
 int cxl_endpoint_get_perf_coordinates(struct cxl_port *port,
 				      struct access_coordinate *coord);
 
+extern struct dentry *cxl_debugfs;
+
 /*
  * Unit test builds overrides this to __weak, find the 'strong' version
  * of these symbols in tools/testing/cxl/.
diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
index 5303d6942b88..b6f13ba87927 100644
--- a/drivers/cxl/cxlmem.h
+++ b/drivers/cxl/cxlmem.h
@@ -859,6 +859,5 @@ struct cxl_hdm {
 };
 
 struct seq_file;
-struct dentry *cxl_debugfs_create_dir(const char *dir);
 void cxl_dpa_debug(struct seq_file *file, struct cxl_dev_state *cxlds);
 #endif /* __CXL_MEM_H__ */
diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
index c5c9d8e0d88d..494abe7a54c5 100644
--- a/drivers/cxl/mem.c
+++ b/drivers/cxl/mem.c
@@ -4,6 +4,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/devm-helpers.h>
 
 #include "cxlmem.h"
 #include "cxlpci.h"
@@ -30,11 +31,6 @@ static void enable_suspend(void *data)
 	cxl_mem_active_dec();
 }
 
-static void remove_debugfs(void *dentry)
-{
-	debugfs_remove_recursive(dentry);
-}
-
 static int cxl_mem_dpa_show(struct seq_file *file, void *data)
 {
 	struct device *dev = file->private;
@@ -128,7 +124,10 @@ static int cxl_mem_probe(struct device *dev)
 	if (work_pending(&cxlmd->detach_work))
 		return -EBUSY;
 
-	dentry = cxl_debugfs_create_dir(dev_name(dev));
+	dentry = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
+	if (IS_ERR(dentry))
+		return PTR_ERR(dentry);
+
 	debugfs_create_devm_seqfile(dev, "dpamem", dentry, cxl_mem_dpa_show);
 
 	if (test_bit(CXL_POISON_ENABLED_INJECT, mds->poison.enabled_cmds))
@@ -138,10 +137,6 @@ static int cxl_mem_probe(struct device *dev)
 		debugfs_create_file("clear_poison", 0200, dentry, cxlmd,
 				    &cxl_poison_clear_fops);
 
-	rc = devm_add_action_or_reset(dev, remove_debugfs, dentry);
-	if (rc)
-		return rc;
-
 	rc = devm_cxl_enumerate_ports(cxlmd);
 	if (rc)
 		return rc;



>  	if (rc)
>  		return rc;
>  
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 455eecf6380e..adbe0fe09490 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -12,6 +12,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> @@ -390,13 +391,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
>  	}
>  }
>  
> -static void gpio_mockup_debugfs_cleanup(void *data)
> -{
> -	struct gpio_mockup_chip *chip = data;
> -
> -	debugfs_remove_recursive(chip->dbg_dir);
> -}
> -
>  static void gpio_mockup_dispose_mappings(void *data)
>  {
>  	struct gpio_mockup_chip *chip = data;
> @@ -480,7 +474,8 @@ static int gpio_mockup_probe(struct platform_device *pdev)
>  
>  	gpio_mockup_debugfs_setup(dev, chip);
>  
> -	return devm_add_action_or_reset(dev, gpio_mockup_debugfs_cleanup, chip);
> +	return devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> +					chip->dbg_dir);
>  }
>  
>  static const struct of_device_id gpio_mockup_of_match[] = {
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 62cc3893dca5..ad0ed2459394 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -10,6 +10,7 @@
>  #include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
> @@ -427,18 +428,12 @@ static int status_show(struct seq_file *s, void *data)
>  
>  DEFINE_SHOW_ATTRIBUTE(status);
>  
> -static void ti_sn65dsi86_debugfs_remove(void *data)
> -{
> -	debugfs_remove_recursive(data);
> -}
> -
>  static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
>  {
>  	struct device *dev = pdata->dev;
>  	struct dentry *debugfs;
> -	int ret;
>  
> -	debugfs = debugfs_create_dir(dev_name(dev), NULL);
> +	debugfs = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
>  
>  	/*
>  	 * We might get an error back if debugfs wasn't enabled in the kernel
> @@ -447,10 +442,6 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
>  	if (IS_ERR_OR_NULL(debugfs))
>  		return;
>  
> -	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_debugfs_remove, debugfs);
> -	if (ret)
> -		return;
> -
>  	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
>  }
>  
> diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
> index b5325d0e72b9..2a7c33763ce8 100644
> --- a/drivers/hwmon/hp-wmi-sensors.c
> +++ b/drivers/hwmon/hp-wmi-sensors.c
> @@ -23,6 +23,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/debugfs.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/hwmon.h>
>  #include <linux/jiffies.h>
>  #include <linux/mutex.h>
> @@ -1304,12 +1305,6 @@ static int current_reading_show(struct seq_file *seqf, void *ignored)
>  }
>  DEFINE_SHOW_ATTRIBUTE(current_reading);
>  
> -/* hp_wmi_devm_debugfs_remove - devm callback for debugfs cleanup */
> -static void hp_wmi_devm_debugfs_remove(void *res)
> -{
> -	debugfs_remove_recursive(res);
> -}
> -
>  /* hp_wmi_debugfs_init - create and populate debugfs directory tree */
>  static void hp_wmi_debugfs_init(struct device *dev, struct hp_wmi_info *info,
>  				struct hp_wmi_platform_events *pevents,
> @@ -1320,21 +1315,15 @@ static void hp_wmi_debugfs_init(struct device *dev, struct hp_wmi_info *info,
>  	struct dentry *debugfs;
>  	struct dentry *entries;
>  	struct dentry *dir;
> -	int err;
>  	u8 i;
>  
>  	/* dev_name() gives a not-very-friendly GUID for WMI devices. */
>  	scnprintf(buf, sizeof(buf), "hp-wmi-sensors-%u", dev->id);
>  
> -	debugfs = debugfs_create_dir(buf, NULL);
> +	debugfs = devm_debugfs_create_dir(dev, buf, NULL);
>  	if (IS_ERR(debugfs))
>  		return;
>  
> -	err = devm_add_action_or_reset(dev, hp_wmi_devm_debugfs_remove,
> -				       debugfs);
> -	if (err)
> -		return;
> -
>  	entries = debugfs_create_dir("sensor", debugfs);
>  
>  	for (i = 0; i < icount; i++, info++) {
> diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
> index 50a8b9c3f94d..50f348fca108 100644
> --- a/drivers/hwmon/mr75203.c
> +++ b/drivers/hwmon/mr75203.c
> @@ -10,6 +10,7 @@
>  #include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/hwmon.h>
>  #include <linux/kstrtox.h>
>  #include <linux/module.h>
> @@ -216,17 +217,11 @@ static const struct file_operations pvt_ts_coeff_j_fops = {
>  	.llseek = default_llseek,
>  };
>  
> -static void devm_pvt_ts_dbgfs_remove(void *data)
> -{
> -	struct pvt_device *pvt = (struct pvt_device *)data;
> -
> -	debugfs_remove_recursive(pvt->dbgfs_dir);
> -	pvt->dbgfs_dir = NULL;
> -}
> -
>  static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
>  {
> -	pvt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
> +	pvt->dbgfs_dir = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> +	if (IS_ERR(pvt->dbgfs_dir))
> +		return PTR_ERR(pvt->dbgfs_dir);
>  
>  	debugfs_create_u32("ts_coeff_h", 0644, pvt->dbgfs_dir,
>  			   &pvt->ts_coeff.h);
> @@ -237,7 +232,7 @@ static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
>  	debugfs_create_file("ts_coeff_j", 0644, pvt->dbgfs_dir, pvt,
>  			    &pvt_ts_coeff_j_fops);
>  
> -	return devm_add_action_or_reset(dev, devm_pvt_ts_dbgfs_remove, pvt);
> +	return 0;
>  }
>  
>  static umode_t pvt_is_visible(const void *data, enum hwmon_sensor_types type,
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 1363d9f89181..e0f956a21125 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/debugfs.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/kernel.h>
>  #include <linux/math64.h>
>  #include <linux/module.h>
> @@ -3336,13 +3337,6 @@ static const struct file_operations pmbus_debugfs_ops_mfr = {
>  	.open = simple_open,
>  };
>  
> -static void pmbus_remove_debugfs(void *data)
> -{
> -	struct dentry *entry = data;
> -
> -	debugfs_remove_recursive(entry);
> -}
> -
>  static int pmbus_init_debugfs(struct i2c_client *client,
>  			      struct pmbus_data *data)
>  {
> @@ -3357,8 +3351,9 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>  	 * Create the debugfs directory for this device. Use the hwmon device
>  	 * name to avoid conflicts (hwmon numbers are globally unique).
>  	 */
> -	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
> -					   pmbus_debugfs_dir);
> +	data->debugfs = devm_debugfs_create_dir(data->dev,
> +						dev_name(data->hwmon_dev),
> +						pmbus_debugfs_dir);
>  	if (IS_ERR_OR_NULL(data->debugfs)) {
>  		data->debugfs = NULL;
>  		return -ENODEV;
> @@ -3542,8 +3537,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>  		}
>  	}
>  
> -	return devm_add_action_or_reset(data->dev,
> -					pmbus_remove_debugfs, data->debugfs);
> +	return 0;
>  }
>  #else
>  static int pmbus_init_debugfs(struct i2c_client *client,
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 70640fb96117..39d743175ec4 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -23,6 +23,7 @@
>   * already ran.
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/kconfig.h>
>  #include <linux/mutex.h>
> @@ -108,4 +109,51 @@ static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>  		return 0;
>  }
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
>  #endif
