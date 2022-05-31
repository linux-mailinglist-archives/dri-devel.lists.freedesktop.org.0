Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39725391F2
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 15:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB43112E12;
	Tue, 31 May 2022 13:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1203 seconds by postgrey-1.36 at gabe;
 Tue, 31 May 2022 13:41:13 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81C8112E03
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:41:13 +0000 (UTC)
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LCCV33F5nz685N7;
 Tue, 31 May 2022 21:16:43 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 31 May 2022 15:21:06 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 31 May
 2022 14:21:04 +0100
Date: Tue, 31 May 2022 14:21:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [RESEND 10/14] iio: adc: mt6370: Add Mediatek MT6370 support
Message-ID: <20220531142102.00007df0@Huawei.com>
In-Reply-To: <20220531111900.19422-11-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-11-peterwu.pub@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml730-chm.china.huawei.com (10.201.108.81) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 robh+dt@kernel.org, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 May 2022 19:18:56 +0800
ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 ADC support.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Hi ChiaEn,

A few comments inline.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/Kconfig      |   9 ++
>  drivers/iio/adc/Makefile     |   1 +
>  drivers/iio/adc/mt6370-adc.c | 257 +++++++++++++++++++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 drivers/iio/adc/mt6370-adc.c
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 71ab0a06aa82..d7932dd9b773 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -737,6 +737,15 @@ config MEDIATEK_MT6360_ADC
>  	  is used in smartphones and tablets and supports a 11 channel
>  	  general purpose ADC.
>  
> +config MEDIATEK_MT6370_ADC
> +	tristate "Mediatek MT6370 ADC driver"
> +	depends on MFD_MT6370
> +	help
> +	  Say Y here to enable MT6370 ADC support.
> +	  Integrated for System Monitoring includes

The wrapping of this text needs cleaning up.

> +	  is used in smartphones and tablets and supports a 9 channel
> +	  general purpose ADC.
> +
>  config MEDIATEK_MT6577_AUXADC
>  	tristate "MediaTek AUXADC driver"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index 39d806f6d457..0ce285c7e2d0 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_MCP320X) += mcp320x.o
>  obj-$(CONFIG_MCP3422) += mcp3422.o
>  obj-$(CONFIG_MCP3911) += mcp3911.o
>  obj-$(CONFIG_MEDIATEK_MT6360_ADC) += mt6360-adc.o
> +obj-$(CONFIG_MEDIATEK_MT6370_ADC) += mt6370-adc.o
>  obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) += mt6577_auxadc.o
>  obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
>  obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
> diff --git a/drivers/iio/adc/mt6370-adc.c b/drivers/iio/adc/mt6370-adc.c
> new file mode 100644
> index 000000000000..3320ebca17ad
> --- /dev/null
> +++ b/drivers/iio/adc/mt6370-adc.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/iio/iio.h>
> +#include <linux/irq.h>

Not seeing any interrupt support in here.


> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define MT6370_REG_CHG_CTRL3		0x113 /* AICR */
> +#define MT6370_REG_CHG_CTRL7		0x117 /* ICHG */
> +#define MT6370_REG_CHG_ADC		0x121
> +#define MT6370_REG_ADC_DATA_H		0x14C
> +
> +#define MT6370_ADC_START_MASK		BIT(0)
> +#define MT6370_ADC_IN_SEL_MASK		GENMASK(7, 4)
> +#define MT6370_AICR_ICHG_MASK		GENMASK(7, 2)
> +
> +#define MT6370_ADC_CHAN_SHIFT		4

Prefer using a mask and then FIELD_PREP

> +
> +#define MT6370_AICR_400MA		0x6
> +#define MT6370_ICHG_500MA		0x4
> +#define MT6370_ICHG_900MA		0x8
> +
> +#define ADC_CONV_TIME_US		35000
> +#define ADC_CONV_POLLING_TIME		1000
> +
> +struct mt6370_adc_data {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct mutex lock;

All locks need documentation.  What is the scope of the lock?
Looks like it protects device state when doing setup, wait for read, read
cycles.

> +};
> +
> +static int mt6370_adc_read_channel(struct mt6370_adc_data *priv, int chan,
> +				   unsigned long addr, int *val)
> +{
> +	__be16 be_val;
> +	unsigned int reg_val;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	reg_val = MT6370_ADC_START_MASK | (addr << MT6370_ADC_CHAN_SHIFT);

FIELD_PREP for that shift?

> +	ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, reg_val);
> +	if (ret)
> +		goto adc_unlock;
> +
> +	msleep(ADC_CONV_TIME_US / 1000);
> +
> +	ret = regmap_read_poll_timeout(priv->regmap,
> +				       MT6370_REG_CHG_ADC, reg_val,
> +				       !(reg_val & MT6370_ADC_START_MASK),
> +				       ADC_CONV_POLLING_TIME,
> +				       ADC_CONV_TIME_US * 3);
> +	if (ret) {
> +		if (ret == -ETIMEDOUT)
> +			dev_err(priv->dev, "Failed to wait adc conversion\n");
> +		goto adc_unlock;
> +	}
> +
> +	ret = regmap_raw_read(priv->regmap, MT6370_REG_ADC_DATA_H,
> +			      &be_val, sizeof(be_val));
> +	if (ret)
> +		goto adc_unlock;
> +
> +	*val = be16_to_cpu(be_val);
> +	ret = IIO_VAL_INT;
> +
> +adc_unlock:
> +	mutex_unlock(&priv->lock);
> +
> +	return ret;
> +}
> +
> +static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
> +				 int chan, int *val1, int *val2)
> +{
> +	unsigned int reg_val;
> +	int ret;
> +
> +	switch (chan) {
> +	case MT6370_CHAN_VBAT:
> +	case MT6370_CHAN_VSYS:
> +	case MT6370_CHAN_CHG_VDDP:
> +		*val1 = 5000;

This seems very large.  Voltages are in millivolts
as per Documentation/ABI/testing/sysfs-bus-iio
and this means each step is 5 volts.

So value in mv is currently 5 * _raw 



> +		return IIO_VAL_INT;
> +	case MT6370_CHAN_IBUS:
> +		ret = regmap_read(priv->regmap, MT6370_REG_CHG_CTRL3, &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
> +		if (reg_val < MT6370_AICR_400MA)
> +			*val1 = 33500;
> +		else
> +			*val1 = 50000;
> +
> +		return IIO_VAL_INT;
> +	case MT6370_CHAN_IBAT:
> +		ret = regmap_read(priv->regmap, MT6370_REG_CHG_CTRL7, &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
> +		if (reg_val < MT6370_ICHG_500MA)
> +			*val1 = 23750;
> +		else if (reg_val >= MT6370_ICHG_500MA &&
> +			 reg_val < MT6370_ICHG_900MA)
> +			*val1 = 26800;
> +		else
> +			*val1 = 50000;
> +
> +		return IIO_VAL_INT;
> +	case MT6370_CHAN_VBUSDIV5:
> +		*val1 = 25000;
> +		return IIO_VAL_INT;
> +	case MT6370_CHAN_VBUSDIV2:
> +		*val1 = 50000;
> +		return IIO_VAL_INT;
> +	case MT6370_CHAN_TS_BAT:
> +		*val1 = 25;
> +		*val2 = 10000;
> +		return IIO_VAL_FRACTIONAL;
> +	case MT6370_CHAN_TEMP_JC:
> +		*val1 = 2;
> +		return IIO_VAL_INT;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int mt6370_adc_read_offset(struct mt6370_adc_data *priv,
> +				  int chan, int *val)
> +{
> +	*val = (chan == MT6370_CHAN_TEMP_JC) ? -20 : 0;

Offset default is 0, so for channels where it doesn't apply don't
provide the offset attribute at all.

> +	return IIO_VAL_INT;
> +}
> +
> +static int mt6370_adc_read_raw(struct iio_dev *iio_dev,
> +			       const struct iio_chan_spec *chan,
> +			       int *val, int *val2, long mask)
> +{
> +	struct mt6370_adc_data *priv = iio_priv(iio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		return mt6370_adc_read_channel(priv, chan->channel,
> +					       chan->address, val);
> +	case IIO_CHAN_INFO_SCALE:
> +		return mt6370_adc_read_scale(priv, chan->channel, val, val2);
> +	case IIO_CHAN_INFO_OFFSET:
> +		return mt6370_adc_read_offset(priv, chan->channel, val);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] = {

Perhaps define an enum with which to index this and the chan spec
and hence ensure they end up matching.
 [vbusdiv5] = "vbusdiv5", etc

> +	"vbusdiv5", "vbusdiv2", "vsys", "vbat",
> +	"ts_bat", "ibus", "ibat", "chg_vddp",
> +	"temp_jc",
> +};
> +
> +static int mt6370_adc_read_label(struct iio_dev *iio_dev,
> +				 struct iio_chan_spec const *chan, char *label)
> +{
> +	return snprintf(label, PAGE_SIZE, "%s\n",
> +			mt6370_channel_labels[chan->channel]);
> +}
> +
> +static const struct iio_info mt6370_adc_iio_info = {
> +	.read_raw = mt6370_adc_read_raw,
> +	.read_label = mt6370_adc_read_label,
> +};
> +
> +#define MT6370_ADC_CHAN(_idx, _type, _addr) {			\
> +	.type = _type,						\
> +	.channel = MT6370_CHAN_##_idx,				\
> +	.address = _addr,					\
> +	.scan_index = MT6370_CHAN_##_idx,			\
> +	.indexed = 1,						\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
> +			      BIT(IIO_CHAN_INFO_SCALE) |	\
> +			      BIT(IIO_CHAN_INFO_OFFSET),	\

See above. Only temp_jc channel should hav an offset.

> +}
> +
> +static const struct iio_chan_spec mt6370_adc_channels[] = {
> +	MT6370_ADC_CHAN(VBUSDIV5, IIO_VOLTAGE, 1),
> +	MT6370_ADC_CHAN(VBUSDIV2, IIO_VOLTAGE, 2),
> +	MT6370_ADC_CHAN(VSYS, IIO_VOLTAGE, 3),
> +	MT6370_ADC_CHAN(VBAT, IIO_VOLTAGE, 4),
> +	MT6370_ADC_CHAN(TS_BAT, IIO_VOLTAGE, 6),
> +	MT6370_ADC_CHAN(IBUS, IIO_CURRENT, 8),
> +	MT6370_ADC_CHAN(IBAT, IIO_CURRENT, 9),
> +	MT6370_ADC_CHAN(CHG_VDDP, IIO_VOLTAGE, 11),
> +	MT6370_ADC_CHAN(TEMP_JC, IIO_TEMP, 12),
> +};
> +
> +static int mt6370_adc_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct mt6370_adc_data *priv;
> +	struct regmap *regmap;
> +	struct iio_dev *indio_dev;
> +
> +	regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!regmap) {
> +		dev_err(&pdev->dev, "Failed to get regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*priv));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	priv = iio_priv(indio_dev);
> +	priv->dev = &pdev->dev;
> +	priv->regmap = regmap;
> +	mutex_init(&priv->lock);
> +
> +	ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to reset adc\n");
> +		return ret;
> +	}
> +
> +	indio_dev->name = dev_name(&pdev->dev);

What does this end up as?  It's used for userspace ABI and should
correspond to the part number, "mt6370-adc" probably
appropriate in this case (I think it'll end up as simply "adc.x"
currently?)  Normally we just hard code this in the driver for
whatever devices the driver supports.

> +	indio_dev->info = &mt6370_adc_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->channels = mt6370_adc_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(mt6370_adc_channels);
> +
> +	return devm_iio_device_register(&pdev->dev, indio_dev);
> +}
> +
> +static const struct of_device_id mt6370_adc_of_id[] = {
> +	{ .compatible = "mediatek,mt6370-adc", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mt6370_adc_of_id);
> +
> +static struct platform_driver mt6370_adc_driver = {
> +	.driver = {
> +		.name = "mt6370-adc",
> +		.of_match_table = mt6370_adc_of_id,
> +	},
> +	.probe = mt6370_adc_probe,
> +};
> +module_platform_driver(mt6370_adc_driver);
> +
> +MODULE_AUTHOR("ChiaEn Wu <chiaen_wu@richtek.com>");
> +MODULE_DESCRIPTION("MT6370 ADC Drvier");
> +MODULE_LICENSE("GPL v2");

