Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69826C73061
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4535010E719;
	Thu, 20 Nov 2025 09:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VMMMGD9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0980510E719
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:09:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D5CFAC111B2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:08:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 29A216068C;
 Thu, 20 Nov 2025 09:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F35E10371C05; Thu, 20 Nov 2025 10:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763629745; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=7l7LwjakFaiU9qB8wCUSVjG9lA7SMcgmBpsVuJVyMBg=;
 b=VMMMGD9P4nTeHCrU8VMOPqfEG/P703S9KjU0+6/fVuKydalkAuRnGKnbOTWel860eAINfQ
 UDf3ip/Bz/0WnQoUOlVI6BD2P3SLwyV1k8APFkFqXL1qcBg+qfSn+JpK7mJ54m3hUyy+1d
 +zYR/sTMhvhhwtlGK/bgDxgocOU0dfR0pMyFXY908HfQQ4oobxu08ZLDCeu3jhL9eUv3aq
 7QRTZ74SfnRrpICMzdtUCNODB+2Rn76BvfGTFxlF/7KtE2J0pDBbdWTJQqnzGodHF7l3pb
 n+ExLgCwlBV+SyzfM5Az+QCvt/SU175/ejzmQMfr3HB1/ySpowCpBjFdY3wKkw==
Message-ID: <f40abf01-46f2-41e6-a21f-c58c21d653c4@bootlin.com>
Date: Thu, 20 Nov 2025 10:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v2 1/2] backlight: Add Congatec Board Controller (CGBC)
 backlight support
To: petri.karhula@novatron.fi, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20251119-cgbc-backlight-v2-0-4d4edd7ca662@novatron.fi>
 <20251119-cgbc-backlight-v2-1-4d4edd7ca662@novatron.fi>
Content-Language: en-US
In-Reply-To: <20251119-cgbc-backlight-v2-1-4d4edd7ca662@novatron.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Petri,

Thanks for your patch.

On 11/19/25 9:25 AM, Petri Karhula via B4 Relay wrote:
> From: Petri Karhula <petri.karhula@novatron.fi>
> 
> This driver provides backlight brightness control through the Linux
> backlight subsystem. It communicates with the board controller to
> adjust LCD backlight using PWM signals. Communication is done
> through Congatec Board Controller core driver.
> 
> Signed-off-by: Petri Karhula <petri.karhula@novatron.fi>
> ---
>  drivers/video/backlight/Kconfig   |  11 ++
>  drivers/video/backlight/Makefile  |   1 +
>  drivers/video/backlight/cgbc_bl.c | 281 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 293 insertions(+)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d9374d208cee..702f3b8ed036 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -249,6 +249,17 @@ config BACKLIGHT_PWM
>  	  If you have a LCD backlight adjustable by PWM, say Y to enable
>  	  this driver.
>  
> +config BACKLIGHT_CGBC
> +	tristate "Congatec Board Controller (CGBC) backlight support"
> +	depends on MFD_CGBC && X86
> +	help
> +	  Say Y here to enable support for LCD backlight control on Congatec
> +	  x86-based boards via the CGBC (Congatec Board Controller).
> +
> +	  This driver provides backlight brightness control through the Linux
> +	  backlight subsystem. It communicates with the board controller to
> +	  adjust LCD backlight using PWM signals.
> +
>  config BACKLIGHT_DA903X
>  	tristate "Backlight Driver for DA9030/DA9034 using WLED"
>  	depends on PMIC_DA903X
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index dfbb169bf6ea..0169fd8873ed 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= apple_dwi_bl.o
>  obj-$(CONFIG_BACKLIGHT_AS3711)		+= as3711_bl.o
>  obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
>  obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
> +obj-$(CONFIG_BACKLIGHT_CGBC)		+= cgbc_bl.o
>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
>  obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
> diff --git a/drivers/video/backlight/cgbc_bl.c b/drivers/video/backlight/cgbc_bl.c
> new file mode 100644
> index 000000000000..4382321f4cac
> --- /dev/null
> +++ b/drivers/video/backlight/cgbc_bl.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Congatec Board Controller (CGBC) Backlight Driver
> + *
> + * This driver provides backlight control for LCD displays connected to
> + * Congatec boards via the CGBC (Congatec Board Controller). It integrates
> + * with the Linux backlight subsystem and communicates with hardware through
> + * the cgbc-core module.
> + *
> + * Copyright (C) 2025 Novatron Oy
> + *
> + * Author: Petri Karhula <petri.karhula@novatron.fi>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/backlight.h>
> +
> +#include <linux/mfd/cgbc.h>

headers shall be sorted in alphabetical order

> +
> +#define CGBC_BL_DRIVER_VERSION     "0.0.1"

not needed

> +
> +#define BLT_PWM_DUTY_MASK          0x7F
> +#define BLT_PWM_INVERTED_MASK      0x80

Use GENMASK

> +
> +/* CGBC command for PWM brightness control*/
> +#define CGBC_CMD_BLT0_PWM          0x75
> +
> +#define CGBC_BL_MAX_BRIGHTNESS     100
> +
> +/**
> + * CGBC backlight driver data
> + * @dev: Pointer to the platform device
> + * @bl_dev: Pointer to the backlight device
> + * @cgbc: Pointer to the parent CGBC device data
> + * @current_brightness: Current brightness level (0-100)
> + */
> +struct cgbc_bl_data {
> +	struct device *dev;
> +	struct backlight_device *bl_dev;

not used

> +	struct cgbc_device_data *cgbc;
> +	unsigned int current_brightness;
> +};
> +
> +/**
> + * Read current PWM settings from hardware
> + * @bl_data: Backlight driver data
> + *
> + * Reads the current PWM duty cycle percentage (= brightness level)
> + * from the board controller.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int cgbc_bl_read_pwm_settings(struct cgbc_bl_data *bl_data)
> +{
> +	u8 cmd_buf[4] = { CGBC_CMD_BLT0_PWM, 0, 0, 0 };
> +	u8 reply_buf[3];
> +	int ret;
> +
> +	ret = cgbc_command(bl_data->cgbc, cmd_buf, sizeof(cmd_buf), reply_buf,
> +			   sizeof(reply_buf), NULL);
> +
> +	if (ret < 0) {
> +		dev_err(bl_data->dev, "Failed to read PWM settings: %d\n", ret);
> +		return ret;
> +	}

error message not needed from my point of view.

> +
> +	/*
> +	 * Only return PWM duty factor percentage,
> +	 * ignore polarity inversion bit (bit 7)
> +	 */
> +	bl_data->current_brightness = reply_buf[0] & BLT_PWM_DUTY_MASK;

I would prefer to use FIELD_GET

> +
> +	dev_dbg(bl_data->dev, "Current PWM duty=%u\n", bl_data->current_brightness);

Not needed from my point of view.

> +
> +	return 0;
> +}
> +
> +/**
> + * Set backlight brightness
> + * @bl_data: Backlight driver data
> + * @brightness: Brightness level (0-100)
> + *
> + * Sets the backlight brightness by configuring the PWM duty cycle.
> + * Preserves the current polarity and frequency settings.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int cgbc_bl_set_brightness(struct cgbc_bl_data *bl_data, u8 brightness)
> +{
> +	u8 cmd_buf[4] = { CGBC_CMD_BLT0_PWM, 0, 0, 0 };

u8 cmd_buf[4] = { CGBC_CMD_BLT0_PWM };

> +	u8 reply_buf[3];
> +	int ret;
> +
> +	/* Read the current values */
> +	ret = cgbc_command(bl_data->cgbc, cmd_buf, sizeof(cmd_buf), reply_buf,
> +			   sizeof(reply_buf), NULL);
> +
> +	if (ret < 0) {
> +		dev_err(bl_data->dev, "Failed to read PWM settings: %d\n", ret);
> +		return ret;
> +	}

error message not needed from my point of view.

> +
> +	/*
> +	 * Prepare command buffer for writing new settings. Only 2nd byte is changed
> +	 * to set new brightness (PWM duty cycle %). Other balues (polarity, frequency)

values

> +	 * are preserved from the read values.
> +	 */
> +	cmd_buf[1] = (reply_buf[0] & BLT_PWM_INVERTED_MASK) |
> +		     (BLT_PWM_DUTY_MASK & brightness);

use FIELD_PREP

> +	cmd_buf[2] = reply_buf[1];
> +	cmd_buf[3] = reply_buf[2];
> +
> +	ret = cgbc_command(bl_data->cgbc, cmd_buf, sizeof(cmd_buf), reply_buf,
> +			   sizeof(reply_buf), NULL);
> +
> +	if (ret < 0) {
> +		dev_err(bl_data->dev, "Failed to set brightness: %d\n", ret);

error messages not needed from my point of view.

> +		return ret;
> +	}
> +
> +	bl_data->current_brightness = reply_buf[0] & BLT_PWM_DUTY_MASK;
> +
> +	/* Verify the setting was applied correctly */
> +	if (bl_data->current_brightness != brightness) {
> +		dev_err(bl_data->dev,
> +			"Brightness setting verification failed\n");
> +		return -EIO;
> +	}

Do we really need to check the brightness returned by the board
controller? Have you ever run into a situation where cbgc_command
completed without errors, but the brightness level didn’t match what you
expected? Maybe we could assume that if the cbgc_command returned
successfully the brightness value is correct?

I'm not against checking the backlight value. I looked at Congatec's
implementation and they also check it.

> +
> +	dev_dbg(bl_data->dev, "Set brightness to %u\n", brightness);

Not needed, the core already has this message

> +
> +	return 0;
> +}
> +
> +/**
> + * Backlight update callback
> + * @bl: Backlight device
> + *
> + * Called by the backlight subsystem when brightness needs to be updated.
> + * Changes the brightness level on the hardware
> + * if requested value differs from the current setting.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int cgbc_bl_update_status(struct backlight_device *bl)
> +{
> +	struct cgbc_bl_data *bl_data = bl_get_data(bl);
> +	u8 brightness;
> +	int ret;
> +
> +	brightness = bl->props.brightness;

use backlight_get_brightness()

> +
> +	if (brightness != bl_data->current_brightness) {
> +		ret = cgbc_bl_set_brightness(bl_data, brightness);
> +
> +		if (ret < 0) {
> +			dev_err(bl_data->dev, "Failed to set brightness: %d\n",
> +			       ret);
> +			return ret;
> +		}

error message not needed from my point of view.

> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * Get current backlight brightness
> + * @bl: Backlight device
> + *
> + * Returns the current brightness level by reading from hardware.
> + *
> + * Return: Current brightness level (0-100), or negative error code
> + */
> +static int cgbc_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct cgbc_bl_data *bl_data = bl_get_data(bl);
> +	int ret;
> +
> +	/* Read current PWM brightness settings */
> +	ret = cgbc_bl_read_pwm_settings(bl_data);
> +
> +	if (ret < 0) {
> +		dev_err(bl_data->dev, "Failed to read PWM settings: %d\n", ret);
> +		return ret;
> +	}

error message not needed from my point of view.
If you remove all these error messages, you can also remove the struct
device in the struct cgbc_bl_data.

> +
> +	return bl_data->current_brightness;
> +}

Maybe you can remove cgbc_bl_read_pwm_settings() and move all the code
in cgbc_bl_get_brightness(). It makes the code easier to read.

> +
> +/* Backlight device operations */
> +static const struct backlight_ops cgbc_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = cgbc_bl_update_status,
> +	.get_brightness = cgbc_bl_get_brightness,
> +};
> +
> +/**
> + * Probe function for CGBC backlight driver
> + * @pdev: Platform device
> + *
> + * Initializes the CGBC backlight driver and registers it with the
> + * Linux backlight subsystem.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int cgbc_bl_probe(struct platform_device *pdev)
> +{
> +	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
> +	struct cgbc_bl_data *bl_data;
> +	struct backlight_properties props;
> +	struct backlight_device *bl_dev;
> +	int ret;

nitpick: reverse xmas tree

> +
> +	bl_data = devm_kzalloc(&pdev->dev, sizeof(*bl_data), GFP_KERNEL);
> +

nitpick: drop empty line.

> +	if (!bl_data)
> +		return -ENOMEM;
> +
> +	bl_data->dev = &pdev->dev;
> +	bl_data->cgbc = cgbc;
> +
> +	ret = cgbc_bl_read_pwm_settings(bl_data);
> +

nitpick: drop empty line.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to read initial PWM settings: %d\n",
> +			ret);
> +		return ret;
> +	}

Use dev_err_probe().

> +
> +	memset(&props, 0, sizeof(props));

Use struct backlight_properties props = { };

> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = CGBC_BL_MAX_BRIGHTNESS;
> +	props.brightness = bl_data->current_brightness;
> +
> +	bl_dev = devm_backlight_device_register(&pdev->dev, "cgbc-backlight",
> +						&pdev->dev, bl_data,
> +						&cgbc_bl_ops, &props);
> +
> +	if (IS_ERR(bl_dev)) {
> +		dev_err(&pdev->dev, "Failed to register backlight device\n");
> +		return PTR_ERR(bl_dev);
> +	}

Use dev_err_probe()

> +
> +	bl_data->bl_dev = bl_dev;
> +	platform_set_drvdata(pdev, bl_data);
> +
> +	dev_info(&pdev->dev,
> +		 "CGBC backlight driver registered (brightness=%u)\n",
> +		 bl_data->current_brightness);

No logs if device probes successfully.

> +
> +	return 0;
> +}
> +
> +/**
> + * Remove function for CGBC backlight driver
> + * @pdev: Platform device
> + *
> + * The Linux device-managed resource framework (devres) does the cleanup.
> + * No explicit cleanup is needed here.
> + */
> +static void cgbc_bl_remove(struct platform_device *pdev)
> +{
> +	dev_info(&pdev->dev, "CGBC backlight driver removed\n");
> +}

Remove operation does nothing so drop it.

> +
> +static struct platform_driver cgbc_bl_driver = {
> +	.driver = {
> +		.name = "cgbc-backlight",
> +	},
> +	.probe = cgbc_bl_probe,
> +	.remove = cgbc_bl_remove,
> +};
> +
> +module_platform_driver(cgbc_bl_driver);
> +
> +MODULE_AUTHOR("Petri Karhula <petri.karhula@novatron.fi>");
> +MODULE_DESCRIPTION("Congatec Board Controller (CGBC) Backlight Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION(CGBC_BL_DRIVER_VERSION);

Not needed

> +MODULE_ALIAS("platform:cgbc-backlight");
> 

Best Regards,
Thomas
