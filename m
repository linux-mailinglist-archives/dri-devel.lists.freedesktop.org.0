Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505A576EA2
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE4B10EB2B;
	Sat, 16 Jul 2022 14:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA27C10E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:05:32 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EF1536601A6D;
 Fri, 15 Jul 2022 13:38:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657888740;
 bh=ik31J0X2B1s0GYN7y7tsF/edsb/70ewvMRMMT+BPvqc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hICchaNIJZhHVfKAS2Kcb6gh8pKGsDoHgXZ2FztkhUDPeDRqa4ngAL55yAZbw546I
 hCdwQiDShdbWii5FuraZfBBwXLLuy4fmNH2kWFkBSLm1ERhPsnr0+TuhIhIg8NotFX
 wjBXaVfbQ+FfA1J7JSKStUegmroDBUA6UG/36Nmo4MQZ5Qo6S1iFOqrjk5lwRlVCoA
 ufx6jpG415op/rCRU5Fq103vk581BL6xVAOG12l0XZlC1IWGKCm3sTg3mre14gEfN1
 xTSVmZpPxeqhdlW7PJLJU3Pc3w0323PDhe/H+aFpiuCcwrMK6jlSG/i87WIZMQyAQq
 yRNConWA2eWWQ==
Message-ID: <d7157483-a6c6-1883-6fc1-d518c7095288@collabora.com>
Date: Fri, 15 Jul 2022 14:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 11/13] leds: mt6370: Add MediaTek MT6370 current sink
 type LED Indicator support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-12-peterwu.pub@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715112607.591-12-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/07/22 13:26, ChiaEn Wu ha scritto:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> In MediaTek MT6370, there are four channel current-sink RGB LEDs that
> support hardware pattern for constant current, PWM, and breath mode.
> Isink4 channel can also be used as a CHG_VIN power good indicator.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>   drivers/leds/Kconfig       |  14 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-mt6370.c | 994 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 1009 insertions(+)
>   create mode 100644 drivers/leds/leds-mt6370.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a49979f..71bacb5 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -244,6 +244,20 @@ config LEDS_MT6323
>   	  This option enables support for on-chip LED drivers found on
>   	  Mediatek MT6323 PMIC.
>   
> +config LEDS_MT6370_RGB
> +	tristate "LED Support for MediaTek MT6370 PMIC"
> +	depends on LEDS_CLASS
> +	depends on MFD_MT6370
> +	select LINEAR_RANGE
> +	help
> +	  Say Y here to enable support for MT6370_RGB LED device.
> +	  In MT6370, there are four channel current-sink LED drivers that
> +	  support hardware pattern for constant current, PWM, and breath mode.
> +	  Isink4 channel can also be used as a CHG_VIN power good indicator.
> +
> +	  This driver can also be built as a module. If so the module
> +	  will be called "leds-mt6370.ko".
> +
>   config LEDS_S3C24XX
>   	tristate "LED Support for Samsung S3C24XX GPIO LEDs"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 4fd2f92..557be42 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_LEDS_MIKROTIK_RB532)	+= leds-rb532.o
>   obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
>   obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
>   obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
> +obj-$(CONFIG_LEDS_MT6370_RGB)		+= leds-mt6370.o
>   obj-$(CONFIG_LEDS_NET48XX)		+= leds-net48xx.o
>   obj-$(CONFIG_LEDS_NETXBIG)		+= leds-netxbig.o
>   obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
> diff --git a/drivers/leds/leds-mt6370.c b/drivers/leds/leds-mt6370.c
> new file mode 100644
> index 0000000..1038232
> --- /dev/null
> +++ b/drivers/leds/leds-mt6370.c
> @@ -0,0 +1,994 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 Richtek Technology Corp.
> + *
> + * Author: Alice Chen <alice_chen@richtek.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/kernel.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/linear_range.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +enum {
> +	MT6370_LED_ISNK1 = 0,
> +	MT6370_LED_ISNK2,
> +	MT6370_LED_ISNK3,
> +	MT6370_LED_ISNK4,
> +	MT6370_MAX_LEDS
> +};
> +
> +enum mt6370_led_mode {
> +	MT6370_LED_PWM_MODE = 0,
> +	MT6370_LED_BREATH_MODE,
> +	MT6370_LED_REG_MODE,
> +	MT6370_LED_MAX_MODE
> +};
> +
> +enum mt6370_led_field {
> +	F_RGB_EN = 0,
> +	F_CHGIND_EN,
> +	F_LED1_CURR,
> +	F_LED2_CURR,
> +	F_LED3_CURR,
> +	F_LED4_CURR,
> +	F_LED1_MODE,
> +	F_LED2_MODE,
> +	F_LED3_MODE,
> +	F_LED4_MODE,
> +	F_LED1_DUTY,
> +	F_LED2_DUTY,
> +	F_LED3_DUTY,
> +	F_LED4_DUTY,
> +	F_LED1_FREQ,
> +	F_LED2_FREQ,
> +	F_LED3_FREQ,
> +	F_LED4_FREQ,
> +	F_MAX_FIELDS
> +};
> +
> +enum mt6370_led_ranges {
> +	R_LED123_CURR = 0,
> +	R_LED4_CURR,
> +	R_LED_TRFON,
> +	R_LED_TOFF,
> +	R_MAX_RANGES,
> +};
> +
> +enum mt6370_pattern {
> +	P_LED_TR1 = 0,
> +	P_LED_TR2,
> +	P_LED_TF1,
> +	P_LED_TF2,
> +	P_LED_TON,
> +	P_LED_TOFF,
> +	P_MAX_PATTERNS
> +};
> +
> +#define MT6370_REG_DEV_INFO			0x100
> +#define MT6370_REG_RGB1_DIM			0x182
> +#define MT6370_REG_RGB2_DIM			0x183
> +#define MT6370_REG_RGB3_DIM			0x184
> +#define MT6370_REG_RGB_EN			0x185
> +#define MT6370_REG_RGB1_ISNK			0x186
> +#define MT6370_REG_RGB2_ISNK			0x187
> +#define MT6370_REG_RGB3_ISNK			0x188
> +#define MT6370_REG_RGB1_TR			0x189
> +#define MT6370_REG_RGB_CHRIND_DIM		0x192
> +#define MT6370_REG_RGB_CHRIND_CTRL		0x193
> +#define MT6370_REG_RGB_CHRIND_TR		0x194
> +
> +#define MT6372_REG_RGB_EN			0x182
> +#define MT6372_REG_RGB1_ISNK			0x183
> +#define MT6372_REG_RGB2_ISNK			0x184
> +#define MT6372_REG_RGB3_ISNK			0x185
> +#define MT6372_REG_RGB4_ISNK			0x186
> +#define MT6372_REG_RGB1_DIM			0x187
> +#define MT6372_REG_RGB2_DIM			0x188
> +#define MT6372_REG_RGB3_DIM			0x189
> +#define MT6372_REG_RGB4_DIM			0x18A
> +#define MT6372_REG_RGB12_FREQ			0x18B
> +#define MT6372_REG_RGB34_FREQ			0x18C
> +#define MT6372_REG_RGB1_TR			0x18D
> +
> +#define MT6370_VENID_MASK			GENMASK(7, 4)
> +#define MT6370_CHEN_BIT(id)			BIT(MT6370_LED_ISNK4 - id)
> +#define MT6370_VIRTUAL_MULTICOLOR		5
> +#define MC_CHANNEL_NUM				3
> +#define MT6370_PWM_DUTY				31
> +#define MT6372_PMW_DUTY				255

Please fix this typo: PMW -> PWM

> +
> +#define STATE_OFF				0
> +#define STATE_KEEP				1
> +#define STATE_ON				2

I propose, instead:

enum mt6370_state {
	STATE_OFF = 0,
	STATE_KEEP,
	STATE_ON,
	STATE_MAX,
};

> +
> +struct mt6370_led {
> +	union {
> +		struct led_classdev isink;
> +		struct led_classdev_mc mc;
> +	};
> +	struct mt6370_priv *priv;
> +	u32 default_state;
> +	u32 index;
> +};
> +
> +struct mt6370_priv {
> +	/* Per LED access lock */
> +	struct mutex lock;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct regmap_field *fields[F_MAX_FIELDS];
> +	const struct reg_field *reg_fields;
> +	const struct linear_range *ranges;
> +	struct reg_cfg *reg_cfgs;
> +	unsigned int leds_count;
> +	unsigned int leds_active;
> +	bool is_mt6372;

Instead of using a bool for that, you can enhance the flexibility of
this driver (and also somewhat reduce cpu cycles) by using:

	struct mt6370_pdata *pdata;

where a good definition of that structure would be...

struct mt6370_pdata {

	const unsigned int *tfreq;

	unsigned int tfreq_len;

	u8 pwm_duty;

	u8 reg_rgb1_tr;	



	/*

	 * You can set this one to -1 on MT6372 to indicate that

	 * this register does not exist (hence use that in function

	 * mt6370_get_breath_reg_base() to replace priv->is_mt6372)

	 */

	s16 reg_rgb_chrind_tr;

};

> +	struct mt6370_led leds[];
> +};
> +
> +static const struct reg_field common_reg_fields[F_MAX_FIELDS] = {
> +	[F_RGB_EN]	= REG_FIELD(MT6370_REG_RGB_EN, 4, 7),
> +	[F_CHGIND_EN]	= REG_FIELD(MT6370_REG_RGB_CHRIND_DIM, 7, 7),
> +	[F_LED1_CURR]	= REG_FIELD(MT6370_REG_RGB1_ISNK, 0, 2),
> +	[F_LED2_CURR]	= REG_FIELD(MT6370_REG_RGB2_ISNK, 0, 2),
> +	[F_LED3_CURR]	= REG_FIELD(MT6370_REG_RGB3_ISNK, 0, 2),
> +	[F_LED4_CURR]	= REG_FIELD(MT6370_REG_RGB_CHRIND_CTRL, 0, 1),
> +	[F_LED1_MODE]	= REG_FIELD(MT6370_REG_RGB1_DIM, 5, 6),
> +	[F_LED2_MODE]	= REG_FIELD(MT6370_REG_RGB2_DIM, 5, 6),
> +	[F_LED3_MODE]	= REG_FIELD(MT6370_REG_RGB3_DIM, 5, 6),
> +	[F_LED4_MODE]	= REG_FIELD(MT6370_REG_RGB_CHRIND_DIM, 5, 6),
> +	[F_LED1_DUTY]	= REG_FIELD(MT6370_REG_RGB1_DIM, 0, 4),
> +	[F_LED2_DUTY]	= REG_FIELD(MT6370_REG_RGB2_DIM, 0, 4),
> +	[F_LED3_DUTY]	= REG_FIELD(MT6370_REG_RGB3_DIM, 0, 4),
> +	[F_LED4_DUTY]	= REG_FIELD(MT6370_REG_RGB_CHRIND_DIM, 0, 4),
> +	[F_LED1_FREQ]	= REG_FIELD(MT6370_REG_RGB1_ISNK, 3, 5),
> +	[F_LED2_FREQ]	= REG_FIELD(MT6370_REG_RGB2_ISNK, 3, 5),
> +	[F_LED3_FREQ]	= REG_FIELD(MT6370_REG_RGB3_ISNK, 3, 5),
> +	[F_LED4_FREQ]	= REG_FIELD(MT6370_REG_RGB_CHRIND_CTRL, 2, 4)
> +};
> +
> +static const struct reg_field mt6372_reg_fields[F_MAX_FIELDS] = {
> +	[F_RGB_EN]	= REG_FIELD(MT6372_REG_RGB_EN, 4, 7),
> +	[F_CHGIND_EN]	= REG_FIELD(MT6372_REG_RGB_EN, 3, 3),
> +	[F_LED1_CURR]	= REG_FIELD(MT6372_REG_RGB1_ISNK, 0, 3),
> +	[F_LED2_CURR]	= REG_FIELD(MT6372_REG_RGB2_ISNK, 0, 3),
> +	[F_LED3_CURR]	= REG_FIELD(MT6372_REG_RGB3_ISNK, 0, 3),
> +	[F_LED4_CURR]	= REG_FIELD(MT6372_REG_RGB4_ISNK, 0, 3),
> +	[F_LED1_MODE]	= REG_FIELD(MT6372_REG_RGB1_ISNK, 6, 7),
> +	[F_LED2_MODE]	= REG_FIELD(MT6372_REG_RGB2_ISNK, 6, 7),
> +	[F_LED3_MODE]	= REG_FIELD(MT6372_REG_RGB3_ISNK, 6, 7),
> +	[F_LED4_MODE]	= REG_FIELD(MT6372_REG_RGB4_ISNK, 6, 7),
> +	[F_LED1_DUTY]	= REG_FIELD(MT6372_REG_RGB1_DIM, 0, 7),
> +	[F_LED2_DUTY]	= REG_FIELD(MT6372_REG_RGB2_DIM, 0, 7),
> +	[F_LED3_DUTY]	= REG_FIELD(MT6372_REG_RGB3_DIM, 0, 7),
> +	[F_LED4_DUTY]	= REG_FIELD(MT6372_REG_RGB4_DIM, 0, 7),
> +	[F_LED1_FREQ]	= REG_FIELD(MT6372_REG_RGB12_FREQ, 5, 7),
> +	[F_LED2_FREQ]	= REG_FIELD(MT6372_REG_RGB12_FREQ, 2, 4),
> +	[F_LED3_FREQ]	= REG_FIELD(MT6372_REG_RGB34_FREQ, 5, 7),
> +	[F_LED4_FREQ]	= REG_FIELD(MT6372_REG_RGB34_FREQ, 2, 4)
> +};
> +
> +/* Current unit: microamp, time unit: millisecond */
> +static const struct linear_range common_led_ranges[R_MAX_RANGES] = {
> +	[R_LED123_CURR]	= { 4000, 1, 6, 4000 },
> +	[R_LED4_CURR]	= { 2000, 1, 3, 2000 },
> +	[R_LED_TRFON]	= { 125, 0, 15, 200 },
> +	[R_LED_TOFF]	= { 250, 0, 15, 400 }
> +};
> +
> +static const struct linear_range mt6372_led_ranges[R_MAX_RANGES] = {
> +	[R_LED123_CURR]	= { 2000, 1, 14, 2000 },
> +	[R_LED4_CURR]	= { 2000, 1, 14, 2000 },
> +	[R_LED_TRFON]	= { 125, 0, 15, 250 },
> +	[R_LED_TOFF]	= { 250, 0, 15, 500 }
> +};
> +
> +static enum mt6370_led_field mt6370_get_led_current_field(unsigned int led_no)
> +{
> +	switch (led_no) {
> +	case MT6370_LED_ISNK1:
> +		return F_LED1_CURR;
> +	case MT6370_LED_ISNK2:
> +		return F_LED2_CURR;
> +	case MT6370_LED_ISNK3:
> +		return F_LED3_CURR;
> +	default:
> +		return F_LED4_CURR;
> +	}
> +}
> +
> +static int mt6370_set_led_brightness(struct mt6370_priv *priv,
> +				     unsigned int led_no, unsigned int level)
> +{
> +	enum mt6370_led_field sel_field;
> +
> +	sel_field = mt6370_get_led_current_field(led_no);
> +
> +	return regmap_field_write(priv->fields[sel_field], level);
> +}
> +
> +static int mt6370_get_led_brightness(struct mt6370_priv *priv,
> +				     unsigned int led_no, unsigned int *level)
> +{
> +	enum mt6370_led_field sel_field;
> +
> +	sel_field = mt6370_get_led_current_field(led_no);
> +
> +	return regmap_field_read(priv->fields[sel_field], level);
> +}
> +
> +static int mt6370_set_led_duty(struct mt6370_priv *priv, unsigned int led_no,
> +			       unsigned int ton, unsigned int toff)
> +{
> +	enum mt6370_led_field sel_field;
> +	unsigned int divisor, ratio;
> +
> +	divisor = priv->is_mt6372 ? MT6372_PMW_DUTY : MT6370_PWM_DUTY;
> +	ratio = ton * divisor / (ton + toff);
> +
> +	switch (led_no) {
> +	case MT6370_LED_ISNK1:
> +		sel_field = F_LED1_DUTY;
> +		break;
> +	case MT6370_LED_ISNK2:
> +		sel_field = F_LED2_DUTY;
> +		break;
> +	case MT6370_LED_ISNK3:
> +		sel_field = F_LED3_DUTY;
> +		break;
> +	default:
> +		sel_field = F_LED4_DUTY;
> +	}
> +
> +	return regmap_field_write(priv->fields[sel_field], ratio);
> +}
> +
> +static const unsigned int common_tfreqs[] = {
> +	10000, 5000, 2000, 1000, 500, 200, 5, 1,
> +};
> +
> +static const unsigned int mt6372_tfreqs[] = {
> +	8000, 4000, 2000, 1000, 500, 250, 8, 4,
> +};
> +
> +static int mt6370_set_led_freq(struct mt6370_priv *priv, unsigned int led_no,
> +			       unsigned int ton, unsigned int toff)
> +{
> +	enum mt6370_led_field sel_field;
> +	const unsigned int *tfreq;
> +	unsigned int tfreq_len, tsum;
> +	int i;
> +

...so, if you have pdata, here you'll do:

	struct mt6370_pdata *pdata = priv->pdata;


> +	if (priv->is_mt6372) {
> +		tfreq = mt6372_tfreqs;
> +		tfreq_len = ARRAY_SIZE(mt6372_tfreqs);
> +	} else {
> +		tfreq = common_tfreqs;
> +		tfreq_len = ARRAY_SIZE(common_tfreqs);
> +	}
> +
> +	tsum = ton + toff;
> +
> +	if (tsum > tfreq[0] || tsum < tfreq[tfreq_len - 1])

	if (tsum > pdata->tfreq[0] || tsum < pdata->tfreq[pdata->tfreq_len - 1])

( etc etc etc )

> +		return -EOPNOTSUPP;
> +
> +	for (i = 0; i < tfreq_len; i++) {
> +		if (tsum >= tfreq[i])
> +			break;
> +	}
> +
> +	switch (led_no) {
> +	case MT6370_LED_ISNK1:
> +		sel_field = F_LED1_FREQ;
> +		break;
> +	case MT6370_LED_ISNK2:
> +		sel_field = F_LED2_FREQ;
> +		break;
> +	case MT6370_LED_ISNK3:
> +		sel_field = F_LED3_FREQ;
> +		break;
> +	default:
> +		sel_field = F_LED4_FREQ;
> +	}
> +
> +	return regmap_field_write(priv->fields[sel_field], i);
> +}
> +
> +static void mt6370_get_breath_reg_base(struct mt6370_priv *priv,
> +				       unsigned int led_no, unsigned int *base)
> +{

	if (pdata->reg_rgb_chrind_tr < 0) {
		*base = pdata->reg_rgb1_tr + led_no * 3;
		return;
	}

> +	if (priv->is_mt6372) {
> +		*base = MT6372_REG_RGB1_TR + led_no * 3;
> +		return;
> +	}
> +
> +	switch (led_no) {
> +	case MT6370_LED_ISNK1:
> +	case MT6370_LED_ISNK2:
> +	case MT6370_LED_ISNK3:
> +		*base = MT6370_REG_RGB1_TR + led_no * 3;
> +		break;
> +	default:
> +		*base = MT6370_REG_RGB_CHRIND_TR;
> +	}
> +}
> +
> +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> +				     struct led_pattern *pattern, u32 len,
> +				     u8 *pattern_val, u32 val_len)
> +{
> +	enum mt6370_led_ranges sel_range;
> +	struct led_pattern *curr;
> +	unsigned int sel;
> +	u8 val[P_MAX_PATTERNS / 2] = {0};
> +	int i;
> +
> +	if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> +		return -EINVAL;
> +
> +	/*
> +	 * Pattern list
> +	 * tr1:	byte 0, b'[7: 4]
> +	 * tr2:	byte 0, b'[3: 0]
> +	 * tf1:	byte 1, b'[7: 4]
> +	 * tf2:	byte 1, b'[3: 0]
> +	 * ton:	byte 2, b'[7: 4]
> +	 * toff: byte 2, b'[3: 0]
> +	 */
> +	for (i = 0; i < P_MAX_PATTERNS; i++) {
> +		curr = pattern + i;
> +
> +		sel_range = i == P_LED_TOFF ? R_LED_TOFF : R_LED_TRFON;
> +
> +		linear_range_get_selector_within(priv->ranges + sel_range,
> +						 curr->delta_t, &sel);
> +
> +		val[i / 2] |= sel << (4 * ((i + 1) % 2));
> +	}
> +
> +	memcpy(pattern_val, val, 3);
> +	return 0;
> +}
> +
> +static int mt6370_set_led_mode(struct mt6370_priv *priv, unsigned int led_no,
> +			       enum mt6370_led_mode mode)
> +{
> +	enum mt6370_led_field sel_field;
> +
> +	switch (led_no) {
> +	case MT6370_LED_ISNK1:
> +		sel_field = F_LED1_MODE;
> +		break;
> +	case MT6370_LED_ISNK2:
> +		sel_field = F_LED2_MODE;
> +		break;
> +	case MT6370_LED_ISNK3:
> +		sel_field = F_LED3_MODE;
> +		break;
> +	default:
> +		sel_field = F_LED4_MODE;
> +	}
> +
> +	return regmap_field_write(priv->fields[sel_field], mode);
> +}
> +
> +static int mt6370_mc_brightness_set(struct led_classdev *lcdev,
> +				    enum led_brightness level)
> +{
> +	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
> +	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
> +	struct mt6370_priv *priv = led->priv;
> +	struct mc_subled *subled;
> +	unsigned int enable, disable;
> +	int i, ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	led_mc_calc_color_components(mccdev, level);
> +
> +	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
> +	if (ret)
> +		goto out;
> +
> +	disable = enable;
> +
> +	for (i = 0; i < mccdev->num_colors; i++) {
> +		u32 brightness;
> +
> +		subled = mccdev->subled_info + i;
> +		brightness = min(subled->brightness, lcdev->max_brightness);
> +		disable &= ~MT6370_CHEN_BIT(subled->channel);
> +
> +		if (level == LED_OFF) {
> +			enable &= ~MT6370_CHEN_BIT(subled->channel);
> +
> +			ret = mt6370_set_led_mode(priv, subled->channel,
> +						  MT6370_LED_REG_MODE);
> +			if (ret)
> +				goto out;
> +
> +			continue;
> +		}
> +
> +		if (brightness == LED_OFF) {
> +			enable &= ~MT6370_CHEN_BIT(subled->channel);
> +			continue;
> +		}
> +
> +		enable |= MT6370_CHEN_BIT(subled->channel);
> +
> +		ret = mt6370_set_led_brightness(priv, subled->channel,
> +						brightness);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	ret = regmap_field_write(priv->fields[F_RGB_EN], disable);
> +	if (ret)
> +		goto out;
> +
> +	ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> +
> +out:
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}
> +
> +static int mt6370_mc_blink_set(struct led_classdev *lcdev,
> +			       unsigned long *delay_on,
> +			       unsigned long *delay_off)
> +{
> +	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
> +	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
> +	struct mt6370_priv *priv = led->priv;
> +	struct mc_subled *subled;
> +	unsigned int enable, disable;
> +	int i, ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	if (!*delay_on && !*delay_off)
> +		*delay_on = *delay_off = 500;
> +
> +	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
> +	if (ret)
> +		goto out;
> +
> +	disable = enable;
> +
> +	for (i = 0; i < mccdev->num_colors; i++) {
> +		subled = mccdev->subled_info + i;
> +
> +		disable &= ~MT6370_CHEN_BIT(subled->channel);
> +
> +		ret = mt6370_set_led_duty(priv, subled->channel, *delay_on,
> +					  *delay_off);
> +		if (ret)
> +			goto out;
> +
> +		ret = mt6370_set_led_freq(priv, subled->channel, *delay_on,
> +					  *delay_off);
> +		if (ret)
> +			goto out;
> +
> +		ret = mt6370_set_led_mode(priv, subled->channel,
> +					  MT6370_LED_PWM_MODE);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	/* Toggle to make pattern timing the same */
> +	ret = regmap_field_write(priv->fields[F_RGB_EN], disable);
> +	if (ret)
> +		goto out;
> +
> +	ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> +
> +out:
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}
> +
> +static int mt6370_mc_pattern_set(struct led_classdev *lcdev,
> +			struct led_pattern *pattern, u32 len, int repeat)
> +{
> +	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
> +	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
> +	struct mt6370_priv *priv = led->priv;
> +	struct mc_subled *subled;
> +	unsigned int reg_base, enable, disable;
> +	u8 params[P_MAX_PATTERNS / 2];
> +	int i, ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	ret = mt6370_gen_breath_pattern(priv, pattern, len, params,
> +					sizeof(params));
> +	if (ret)
> +		goto out;
> +
> +	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
> +	if (ret)
> +		goto out;
> +
> +	disable = enable;
> +
> +	for (i = 0; i < mccdev->num_colors; i++) {
> +		subled = mccdev->subled_info + i;
> +
> +		mt6370_get_breath_reg_base(priv, subled->channel, &reg_base);
> +		disable &= ~MT6370_CHEN_BIT(subled->channel);
> +
> +		ret = regmap_raw_write(priv->regmap, reg_base, params,
> +				       sizeof(params));
> +		if (ret)
> +			goto out;
> +
> +		ret = mt6370_set_led_mode(priv, subled->channel,
> +					  MT6370_LED_BREATH_MODE);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	/* Toggle to make pattern timing be the same */
> +	ret = regmap_field_write(priv->fields[F_RGB_EN], disable);
> +	if (ret)
> +		goto out;
> +
> +	ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> +
> +out:
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}
> +
> +static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
> +{
> +	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
> +	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
> +	struct mt6370_priv *priv = led->priv;
> +	struct mc_subled *subled;
> +	int i, ret = 0;
> +
> +	mutex_lock(&led->priv->lock);
> +
> +	for (i = 0; i < mccdev->num_colors; i++) {
> +		subled = mccdev->subled_info + i;
> +
> +		ret = mt6370_set_led_mode(priv, subled->channel,
> +					  MT6370_LED_REG_MODE);
> +		if (ret)
> +			break;
> +	}
> +
> +	mutex_unlock(&led->priv->lock);
> +
> +	return ret;
> +}
> +
> +static int mt6370_isnk_brightness_set(struct led_classdev *lcdev,
> +				      enum led_brightness level)
> +{
> +	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
> +	struct mt6370_priv *priv = led->priv;
> +	unsigned int enable;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
> +	if (ret)
> +		goto out;
> +
> +	if (level == LED_OFF) {
> +		enable &= ~MT6370_CHEN_BIT(led->index);
> +
> +		ret = mt6370_set_led_mode(priv, led->index,
> +					  MT6370_LED_REG_MODE);
> +		if (ret)
> +			goto out;
> +
> +		ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> +	} else {
> +		enable |= MT6370_CHEN_BIT(led->index);
> +
> +		ret = mt6370_set_led_brightness(priv, led->index, level);
> +		if (ret)
> +			goto out;
> +
> +		ret = regmap_field_write(priv->fields[F_RGB_EN], enable);
> +	}
> +
> +out:
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}
> +
> +static int mt6370_isnk_blink_set(struct led_classdev *lcdev,
> +				 unsigned long *delay_on,
> +				 unsigned long *delay_off)
> +{
> +	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
> +	struct mt6370_priv *priv = led->priv;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	if (!*delay_on && !*delay_off)
> +		*delay_on = *delay_off = 500;
> +
> +	ret = mt6370_set_led_duty(priv, led->index, *delay_on, *delay_off);
> +	if (ret)
> +		goto out;
> +
> +	ret = mt6370_set_led_freq(priv, led->index, *delay_on, *delay_off);
> +	if (ret)
> +		goto out;
> +
> +	ret = mt6370_set_led_mode(priv, led->index, MT6370_LED_PWM_MODE);
> +
> +out:
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}
> +
> +static int mt6370_isnk_pattern_set(struct led_classdev *lcdev,
> +				   struct led_pattern *pattern, u32 len,
> +				   int repeat)
> +{
> +	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
> +	struct mt6370_priv *priv = led->priv;
> +	unsigned int reg_base;
> +	u8 params[P_MAX_PATTERNS / 2];
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	ret = mt6370_gen_breath_pattern(priv, pattern, len, params,
> +					sizeof(params));
> +	if (ret)
> +		goto out;
> +
> +	mt6370_get_breath_reg_base(priv, led->index, &reg_base);
> +
> +	ret = regmap_raw_write(priv->regmap, reg_base, params, sizeof(params));
> +	if (ret)
> +		goto out;
> +
> +	ret = mt6370_set_led_mode(priv, led->index, MT6370_LED_BREATH_MODE);
> +
> +out:
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}
> +
> +static inline int mt6370_isnk_pattern_clear(struct led_classdev *lcdev)
> +{
> +	struct mt6370_led *led = container_of(lcdev, struct mt6370_led, isink);
> +	struct mt6370_priv *priv = led->priv;
> +	int ret;
> +
> +	mutex_lock(&led->priv->lock);
> +	ret = mt6370_set_led_mode(priv, led->index, MT6370_LED_REG_MODE);
> +	mutex_unlock(&led->priv->lock);
> +
> +	return ret;
> +}
> +
> +static int mt6370_init_led_properties(struct mt6370_led *led,
> +				      struct led_init_data *init_data)
> +{
> +	struct mt6370_priv *priv = led->priv;
> +	struct led_classdev *lcdev;
> +	struct fwnode_handle *child;
> +	enum mt6370_led_ranges sel_range;
> +	u32 max_uA, max_level;
> +	const char * const states[] = { "off", "keep", "on" };
> +	const char *stat_str;
> +	int ret;
> +
> +	if (led->index == MT6370_VIRTUAL_MULTICOLOR) {
> +		struct mc_subled *sub_led;
> +		u32 num_color = 0;
> +
> +		sub_led = devm_kzalloc(priv->dev,
> +				       sizeof(*sub_led) * MC_CHANNEL_NUM,
> +				       GFP_KERNEL);
> +		if (!sub_led)
> +			return -ENOMEM;
> +
> +		fwnode_for_each_child_node(init_data->fwnode, child) {
> +			u32 reg, color;
> +
> +			ret = fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret || reg > MT6370_LED_ISNK3 ||
> +			    priv->leds_active & BIT(reg))
> +				return -EINVAL;
> +
> +			ret = fwnode_property_read_u32(child, "color", &color);
> +			if (ret) {
> +				dev_err(priv->dev,
> +					"led %d, no color specified\n",
> +					led->index);
> +				return ret;
> +			}
> +
> +			priv->leds_active |= BIT(reg);
> +			sub_led[num_color].color_index = color;
> +			sub_led[num_color].channel = reg;
> +			num_color++;
> +		}
> +
> +		if (num_color < 2) {
> +			dev_err(priv->dev,
> +				"Multicolor must include 2 or more led channel\n");
> +			return -EINVAL;
> +		}
> +
> +		led->mc.num_colors = num_color;
> +		led->mc.subled_info = sub_led;
> +
> +		lcdev = &led->mc.led_cdev;
> +		lcdev->brightness_set_blocking = mt6370_mc_brightness_set;
> +		lcdev->blink_set = mt6370_mc_blink_set;
> +		lcdev->pattern_set = mt6370_mc_pattern_set;
> +		lcdev->pattern_clear = mt6370_mc_pattern_clear;
> +	} else {
> +		lcdev = &led->isink;
> +		lcdev->brightness_set_blocking = mt6370_isnk_brightness_set;
> +		lcdev->blink_set = mt6370_isnk_blink_set;
> +		lcdev->pattern_set = mt6370_isnk_pattern_set;
> +		lcdev->pattern_clear = mt6370_isnk_pattern_clear;
> +	}
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp",
> +				       &max_uA);
> +	if (ret) {
> +		dev_warn(priv->dev,
> +		   "Not specified led-max-microamp, config to the minimum\n");
> +		max_uA = 0;
> +	}
> +
> +	if (led->index == MT6370_LED_ISNK4)
> +		sel_range = R_LED4_CURR;
> +	else
> +		sel_range = R_LED123_CURR;
> +
> +	linear_range_get_selector_within(priv->ranges + sel_range, max_uA,
> +					 &max_level);
> +
> +	lcdev->max_brightness = max_level;
> +
> +	fwnode_property_read_string(init_data->fwnode, "linux,default-trigger",
> +			&lcdev->default_trigger);
> +
> +	if (!fwnode_property_read_string(init_data->fwnode, "default-state",
> +					 &stat_str)) {
> +		ret = match_string(states, ARRAY_SIZE(states), stat_str);
> +		if (ret < 0)
> +			ret = STATE_OFF;
> +
> +		led->default_state = ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt6370_isnk_init_default_state(struct mt6370_led *led)
> +{
> +	struct mt6370_priv *priv = led->priv;
> +	unsigned int enable, level;
> +	int ret;
> +
> +	ret = mt6370_get_led_brightness(priv, led->index, &level);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_field_read(priv->fields[F_RGB_EN], &enable);
> +	if (ret)
> +		return ret;
> +
> +	if (!(enable & MT6370_CHEN_BIT(led->index)))
> +		level = LED_OFF;
> +
> +	switch (led->default_state) {
> +	case STATE_ON:
> +		led->isink.brightness = led->isink.max_brightness;
> +		break;
> +	case STATE_KEEP:
> +		led->isink.brightness = min(level, led->isink.max_brightness);
> +		break;
> +	default:
> +		led->isink.brightness = LED_OFF;
> +	}
> +
> +	return mt6370_isnk_brightness_set(&led->isink, led->isink.brightness);
> +}
> +
> +static int mt6370_led_register(struct device *parent, struct mt6370_led *led,
> +			       struct led_init_data *init_data)
> +{
> +	struct mt6370_priv *priv = led->priv;
> +	int ret;
> +
> +	if (led->index == MT6370_VIRTUAL_MULTICOLOR) {
> +		ret = mt6370_mc_brightness_set(&led->mc.led_cdev, LED_OFF);
> +		if (ret) {
> +			dev_err(parent, "Couldn't set multicolor brightness\n");
> +			return ret;
> +		}
> +
> +		ret = devm_led_classdev_multicolor_register_ext(parent,
> +								&led->mc,
> +								init_data);
> +		if (ret) {
> +			dev_err(parent, "Couldn't register multicolor\n");
> +			return ret;
> +		}
> +	} else {
> +		if (led->index == MT6370_LED_ISNK4) {
> +			ret = regmap_field_write(priv->fields[F_CHGIND_EN], 1);
> +			if (ret) {
> +				dev_err(parent, "Failed to set CHRIND to SW\n");
> +				return ret;
> +			}
> +		}
> +
> +		ret = mt6370_isnk_init_default_state(led);
> +		if (ret) {
> +			dev_err(parent, "Failed to init %d isnk state\n",
> +				led->index);
> +			return ret;
> +		}
> +
> +		ret = devm_led_classdev_register_ext(parent, &led->isink,
> +						     init_data);
> +		if (ret) {
> +			dev_err(parent, "Couldn't register isink %d\n",
> +				led->index);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt6370_check_vendor_info(struct mt6370_priv *priv)
> +{
> +	unsigned int devinfo, vid;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &devinfo);
> +	if (ret)
> +		return ret;
> +
> +	vid = FIELD_GET(MT6370_VENID_MASK, devinfo);
> +	if (vid == 0x9 || vid == 0xb) {
> +		priv->reg_fields = mt6372_reg_fields;
> +		priv->ranges = mt6372_led_ranges;
> +		priv->is_mt6372 = true;

		priv->pdata = &mt6372_pdata;

> +	} else {
> +		priv->reg_fields = common_reg_fields;
> +		priv->ranges = common_led_ranges;

		priv->pdata = &mt6370_pdata;

> +	}
> +
> +	return 0;
> +}

Regards,
Angelo
