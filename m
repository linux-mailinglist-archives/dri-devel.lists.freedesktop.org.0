Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B22F653747
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E57210E4A1;
	Wed, 21 Dec 2022 19:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7590C10E4A1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 19:56:03 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z92so63986ede.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h7Vd35MrCCo7c14P56GQK+YwRrwHwe6DIDs/gKX9irk=;
 b=N5xVFIoRxCjhWHBcjOL6L13fEfPRIRuhLPZw4eeWqh+rLRt3C3nOD7OhO6EVYJE9Ib
 6NhDVADjPbvKbAtlwfFb9Z9g+2g5Vlbrg9fx1ewcowHPTG/oqA88cZgyIz0FgN4F8AID
 YHI19tXAknYnv2qEK0c8wODmXHb4L7arM3B1Ijc6Sk/RZPkw01CbaSi9sf38JPwEWR48
 j//g4Ji+BT4/h0dAru1EiA5eKg3jobCgtbX6PkXhMNvV0VYbq3ede13CnUlmXDIWc96A
 TpvCrWaTyl9V1UOS7qx+GGT6xT4iQzV5pxiN3BuistKX2JuWc3YUrOPnvrxTbVnwGr7A
 fMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h7Vd35MrCCo7c14P56GQK+YwRrwHwe6DIDs/gKX9irk=;
 b=HY1Y+nMh8OUUax9szoFyewn7ilwhcRkM5cRMwNjrn3LyqWhQfVjtMVabpiLIgo03oU
 NStkecWwgumZj1ZWnEgd0SF32eS4m1KXdTwXyI7NAs1QTSvXfcq64BUsy2fYtxLLMB5H
 lMxG0/YAY8uDFpiHVZgDQr8RNC9n04ixlQeAuxYZHYLOqBUi2k4v9gch2KtUcxPHYl3O
 jCnTMGNcvRe33unKvnMxrmyo554dNjC981RQfQqdX0iNZEX/HUjIWobRXclQl4SebsuY
 vChT/1TpUgp2gl1m05ssQJL4nCcch1nHb94LWrD/thgMKU1bMckb73/hef5HKJhGDGL8
 SzlA==
X-Gm-Message-State: AFqh2ko8AHT0D3PI78v1PqUvwUgsLrGpqami13uLcKXKEzrGBvwuyVZD
 cuWpvNY0fJNrUa+qcwHVmhb+SS6NmhmexsmKkv0=
X-Google-Smtp-Source: AMrXdXspACP3IvT2groREyi76AqN53Y4J+zaylpCQswfTbJ54HEOOwK26NrnnI4KdF81tiA65yQt4ZPrEPMwMUSF9m0=
X-Received: by 2002:a05:6402:214a:b0:46f:f36b:a4d1 with SMTP id
 bq10-20020a056402214a00b0046ff36ba4d1mr404397edb.365.1671652561811; Wed, 21
 Dec 2022 11:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20221221065807.15998-1-lujianhua000@gmail.com>
In-Reply-To: <20221221065807.15998-1-lujianhua000@gmail.com>
From: Han Jingoo <jingoohan1@gmail.com>
Date: Wed, 21 Dec 2022 11:55:50 -0800
Message-ID: <CAPOBaE6EJnRPp8y+Mf=fbqRqEvz7aLfKZfHUyOAz0QfQVmgOYw@mail.gmail.com>
Subject: Re: [PATCH 1/2] backlight: ktz8866: Add support for Kinetic KTZ8866
 backlight
To: Jianhua Lu <lujianhua000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 20, 2022, Jianhua Lu <lujianhua000@gmail.com> wrote:
>
> Add support for Kinetic KTZ8866 backlight, which is used in
> Xiaomi tablet, Mi Pad 5 series. This driver lightly based on
> downstream implementation [1].
> [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/video/backlight/ktz8866.c
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  drivers/video/backlight/Kconfig   |   8 ++
>  drivers/video/backlight/Makefile  |   1 +
>  drivers/video/backlight/ktz8866.c | 173 ++++++++++++++++++++++++++++++
>  drivers/video/backlight/ktz8866.h |  31 ++++++
>  4 files changed, 213 insertions(+)
>  create mode 100644 drivers/video/backlight/ktz8866.c
>  create mode 100644 drivers/video/backlight/ktz8866.h
>
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 936ba1e4d35e..2845fd7e33ad 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -190,6 +190,14 @@ config BACKLIGHT_KTD253
>           which is a 1-wire GPIO-controlled backlight found in some mobile
>           phones.
>
> +config BACKLIGHT_KTZ8866
> +       tristate "Backlight Driver for Kinetic KTZ8866"
> +       depends on I2C
> +       select REGMAP_I2C
> +       help
> +               Say Y to enabled the backlight driver for the Kinetic KTZ8866
> +               found in Xiaomi Mi Pad 5 series.
> +
>  config BACKLIGHT_LM3533
>         tristate "Backlight Driver for LM3533"
>         depends on MFD_LM3533
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index e815f3f1deff..f70a819c304c 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_BACKLIGHT_HP680)         += hp680_bl.o
>  obj-$(CONFIG_BACKLIGHT_HP700)          += jornada720_bl.o
>  obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)     += ipaq_micro_bl.o
>  obj-$(CONFIG_BACKLIGHT_KTD253)         += ktd253-backlight.o
> +obj-$(CONFIG_BACKLIGHT_KTZ8866)                += ktz8866.o
>  obj-$(CONFIG_BACKLIGHT_LM3533)         += lm3533_bl.o
>  obj-$(CONFIG_BACKLIGHT_LM3630A)                += lm3630a_bl.o
>  obj-$(CONFIG_BACKLIGHT_LM3639)         += lm3639_bl.o
> diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> new file mode 100644
> index 000000000000..1eaf72d9116b
> --- /dev/null
> +++ b/drivers/video/backlight/ktz8866.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for the Kinetic KTZ8866
> + *
> + * Copyright (C) Jianhua Lu <lujianhua000@gmail.com>

Please add '2022'.

> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/i2c.h>

Please sort these headers alphabetically.

> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include "ktz8866.h"

> +
> +#define DEF_BRIGHTNESS 1500

What is 'DEF'? Please use more meaningful name.

> +#define MAX_BRIGHTNESS 2047
> +#define REG_MAX 0x15
> +
> +/* Helper */

Remove this meaningless comment line.

> +#define low_3_bit(x) ((x)&0x7)
> +#define high_8_bit(x) ((x >> 3) & 0xFF)
> +
> +struct ktz8866 {
> +       struct i2c_client *client;
> +       struct regmap *regmap;
> +       bool state;
> +};
> +
> +enum {
> +       LED_OFF,
> +       LED_ON,
> +};
> +
> +static const struct regmap_config ktz8866_regmap_config = {
> +       .reg_bits = 8,
> +       .val_bits = 8,
> +       .max_register = REG_MAX,
> +};
> +
> +int ktz8866_write(struct ktz8866 *ktz, unsigned int reg, unsigned int val)

Add 'static' here, unless you have a reason.

> +{
> +       return regmap_write(ktz->regmap, reg, val);
> +}
> +
> +static int ktz8866_update_bits(struct ktz8866 *ktz, unsigned int reg,
> +                              unsigned int mask, unsigned int val)
> +{
> +       return regmap_update_bits(ktz->regmap, reg, mask, val);
> +}
> +
> +static int
> +ktz8866_backlight_update_status(struct backlight_device *backlight_dev)

Hmm, use 1 line not 2 lines, if there is no reason.

> +{
> +       struct ktz8866 *ktz = bl_get_data(backlight_dev);
> +       unsigned int brightness = backlight_get_brightness(backlight_dev);
> +
> +       if (!ktz->state && brightness > 0) {
> +               ktz8866_update_bits(ktz, BL_EN, BIT(6), BIT(6));

Please use definitions.

> +               ktz->state = LED_ON;
> +       } else if (brightness == 0) {
> +               ktz8866_update_bits(ktz, BL_EN, BIT(6), 0);
> +               ktz->state = LED_OFF;
> +               msleep(10);
> +       }
> +
> +       /* Set brightness */
> +       ktz8866_write(ktz, BL_BRT_LSB, low_3_bit(brightness));
> +       ktz8866_write(ktz, BL_BRT_MSB, high_8_bit(brightness));
> +
> +       return 0;
> +}
> +
> +static const struct backlight_ops ktz8866_backlight_ops = {
> +       .options = BL_CORE_SUSPENDRESUME,
> +       .update_status = ktz8866_backlight_update_status,
> +};
> +
> +static void ktz8866_init(struct ktz8866 *ktz)
> +{
> +       /* Enable 1~5 current sinks */
> +       ktz8866_write(ktz, BL_EN, 0x1F);
> +       /* Backlight OVP 26.4V */
> +       ktz8866_write(ktz, BL_CFG1, 0x33);
> +       /* LED ramping time 128ms */
> +       ktz8866_write(ktz, BL_CFG2, 0xBD);
> +       /* LED on/off ramping time 1ms */
> +       ktz8866_write(ktz, BL_DIMMING, 0x11);
> +       /* Enable OUTP and OUTN via pin ENP and ENN */
> +       ktz8866_write(ktz, LCD_BIAS_CFG1, 0x9F);
> +       /* Backlight Full-scale LED Current 30.0mA */
> +       ktz8866_write(ktz, FULL_SCALE_CURRENT, 0xF9);

Don't use hardcoding.
Please add definitions for bits, and use these definitions.

> +}
> +
> +static int ktz8866_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)
> +{
> +       struct backlight_device *backlight_dev;
> +       struct backlight_properties props;
> +       struct ktz8866 *ktz;
> +
> +       ktz = devm_kzalloc(&client->dev, sizeof(*ktz), GFP_KERNEL);
> +       if (!ktz)
> +               return -ENOMEM;
> +
> +       ktz->client = client;
> +       ktz->regmap = devm_regmap_init_i2c(client, &ktz8866_regmap_config);
> +
> +       if (IS_ERR(ktz->regmap)) {
> +               dev_err(&client->dev, "failed to init regmap\n");
> +               return PTR_ERR(ktz->regmap);
> +       }
> +
> +       memset(&props, 0, sizeof(props));
> +       props.type = BACKLIGHT_RAW;
> +       props.max_brightness = MAX_BRIGHTNESS;
> +       props.brightness =
> +               clamp_t(unsigned int, DEF_BRIGHTNESS, 0, props.max_brightness);
> +
> +       backlight_dev = devm_backlight_device_register(
> +               &client->dev, "ktz8866-backlight", &client->dev, ktz,
> +               &ktz8866_backlight_ops, &props);
> +
> +       if (IS_ERR(backlight_dev)) {
> +               dev_err(&client->dev, "failed to register backlight device\n");
> +               return PTR_ERR(backlight_dev);
> +       }
> +
> +       ktz8866_init(ktz);
> +
> +       i2c_set_clientdata(client, backlight_dev);
> +       backlight_update_status(backlight_dev);
> +
> +       return 0;
> +}
> +
> +static void ktz8866_remove(struct i2c_client *client)
> +{
> +       struct backlight_device *backlight_dev = i2c_get_clientdata(client);
> +
> +       backlight_dev->props.brightness = 0;
> +       backlight_update_status(backlight_dev);
> +}
> +
> +static const struct i2c_device_id ktz8866_ids[] = {
> +       { "ktz8866", 0 },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(i2c, ktz8866_ids);
> +
> +static const struct of_device_id ktz8866_match_table[] = {
> +       {
> +               .compatible = "kinetic,ktz8866",
> +       },
> +       {},
> +};
> +
> +static struct i2c_driver ktz8866_driver = {
> +       .driver = {
> +               .name = "ktz8866",
> +               .of_match_table = ktz8866_match_table,
> +       },
> +       .probe = ktz8866_probe,
> +       .remove = ktz8866_remove,
> +       .id_table = ktz8866_ids,
> +};
> +
> +module_i2c_driver(ktz8866_driver);
> +
> +MODULE_DESCRIPTION("Kinetic KTZ8866 Backlight Driver");
> +MODULE_AUTHOR("Jianhua Lu <lujianhua000@gmail.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/video/backlight/ktz8866.h b/drivers/video/backlight/ktz8866.h
> new file mode 100644
> index 000000000000..b2a606288a7e
> --- /dev/null
> +++ b/drivers/video/backlight/ktz8866.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Register definitions for Kinetic KTZ8866 backlight
> + *
> + * Copyright (C) Jianhua Lu <lujianhua000@gmail.com>

Please add '2022'.

Best regards,
Jingoo Han

> + */
> +
> +#ifndef KTZ8866_H
> +#define KTZ8866_H
> +
> +#define DEVICE_ID 0x01
> +#define BL_CFG1 0x02
> +#define BL_CFG2 0x03
> +#define BL_BRT_LSB 0x04
> +#define BL_BRT_MSB 0x05
> +#define BL_EN 0x08
> +#define LCD_BIAS_CFG1 0x09
> +#define LCD_BIAS_CFG2 0x0A
> +#define LCD_BIAS_CFG3 0x0B
> +#define LCD_BOOST_CFG 0x0C
> +#define OUTP_CFG 0x0D
> +#define OUTN_CFG 0x0E
> +#define FLAG 0x0F
> +#define BL_OPTION1 0x10
> +#define BL_OPTION2 0x11
> +#define PWM2DIG_LSBs 0x12
> +#define PWM2DIG_MSBs 0x13
> +#define BL_DIMMING 0x14
> +#define FULL_SCALE_CURRENT 0x15
> +
> +#endif /* KTZ8866_H */
> --
> 2.38.2
>
