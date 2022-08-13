Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBE6591B7A
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 17:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83DDBD439;
	Sat, 13 Aug 2022 15:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088DBD413
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 15:35:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B61660EDC;
 Sat, 13 Aug 2022 15:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65329C433D6;
 Sat, 13 Aug 2022 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660404943;
 bh=H+193s9DhJA+Fo+1yQtUSKQ/Q5LCMqL5XgyPBlKN9iM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=awR9jlAgHn06cl1vhF3zgZ4uZsd98vev6ArN5JzdTNjlXO3+QBqNbjBNOi0fhFqGz
 G5xETOIQbS4eacFez5N3d0j1uw6kH5WKR5zSp0Nrp713gqnQjtBPCtO0kxGnmKjY0f
 JD+CQejRE5uTr+J/Ba19U9PMtT3dvxdAYw5X8+bRQlfgRkIZnuKnsl1RQDmCKRdQhz
 poVbpv0LRHsvzGAW2khsaoJXWSdgxnm1zKGTGcw3liaDhdN/u5ZE9v6ZsSGppbKgUb
 vxYeoZ1y3DOWoRlK56myGWtVQMUT5gkiXrk8D5Nnwch4G+00BcZEwgQ8/zE+q7+/Tt
 5O5IYB13Ysc0g==
Date: Sat, 13 Aug 2022 16:46:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7 09/13] iio: adc: mt6370: Add MediaTek MT6370 support
Message-ID: <20220813164606.3ed93322@jic23-huawei>
In-Reply-To: <CAHp75VexyNqEFKY4PG_jYQxQGmdvE12SeuvMzHThfPY-gB4f7A@mail.gmail.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-10-peterwu.pub@gmail.com>
 <CAHp75VexyNqEFKY4PG_jYQxQGmdvE12SeuvMzHThfPY-gB4f7A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 cy_huang <cy_huang@richtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree <devicetree@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 szuni chen <szunichen@gmail.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Aug 2022 12:54:04 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Aug 5, 2022 at 9:07 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> > with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> > driver, display bias voltage supply, one general purpose LDO, and the
> > USB Type-C & PD controller complies with the latest USB Type-C and PD
> > standards.
> >
> > Add a support for the MT6370 ADC driver for system monitoring, including
> > charger current, voltage, and temperature.  
> 
> On Fri, Aug 5, 2022 at 9:07 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual
> > Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> >
> > Add a support for the Type-C & Power Delivery controller in
> > MediaTek MT6370 IC.  
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Oops. I just noticed I replied only to Andy due to a misclick.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

I took a quick glance through, and with Andy's comments now all answered
to his satisfaction I'm fine with this going through the MFD tree
(or another path if one makes more sense).

Thanks to Andy for his reviewing effort on this one!

Note that because of the bindings header I think this has a build dependency on the
MFD binding patch.

Jonathan


> 
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >
> > v7
> > - Add AICR(100mA ~ 350mA), ICHG(100mA ~ 800mA) macros
> > - Remove 400mA AICR and 900mA ICHG macros
> > - Revise using 'if-else' to 'switch-case' in mt6370_adc_read_scale()
> >   where the adc channel is ibus or ibat
> > ---
> >  drivers/iio/adc/Kconfig      |  12 ++
> >  drivers/iio/adc/Makefile     |   1 +
> >  drivers/iio/adc/mt6370-adc.c | 305 +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 318 insertions(+)
> >  create mode 100644 drivers/iio/adc/mt6370-adc.c
> >
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > index 7fe5930..995cbb5 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -736,6 +736,18 @@ config MEDIATEK_MT6360_ADC
> >           is used in smartphones and tablets and supports a 11 channel
> >           general purpose ADC.
> >
> > +config MEDIATEK_MT6370_ADC
> > +       tristate "MediaTek MT6370 ADC driver"
> > +       depends on MFD_MT6370
> > +       help
> > +         Say yes here to enable MediaTek MT6370 ADC support.
> > +
> > +         This ADC driver provides 9 channels for system monitoring (charger
> > +         current, voltage, and temperature).
> > +
> > +         This driver can also be built as a module. If so, the module
> > +         will be called "mt6370-adc".
> > +
> >  config MEDIATEK_MT6577_AUXADC
> >         tristate "MediaTek AUXADC driver"
> >         depends on ARCH_MEDIATEK || COMPILE_TEST
> > diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> > index 1772a54..c6bc35f 100644
> > --- a/drivers/iio/adc/Makefile
> > +++ b/drivers/iio/adc/Makefile
> > @@ -68,6 +68,7 @@ obj-$(CONFIG_MCP320X) += mcp320x.o
> >  obj-$(CONFIG_MCP3422) += mcp3422.o
> >  obj-$(CONFIG_MCP3911) += mcp3911.o
> >  obj-$(CONFIG_MEDIATEK_MT6360_ADC) += mt6360-adc.o
> > +obj-$(CONFIG_MEDIATEK_MT6370_ADC) += mt6370-adc.o
> >  obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) += mt6577_auxadc.o
> >  obj-$(CONFIG_MEN_Z188_ADC) += men_z188_adc.o
> >  obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
> > diff --git a/drivers/iio/adc/mt6370-adc.c b/drivers/iio/adc/mt6370-adc.c
> > new file mode 100644
> > index 0000000..2a46471
> > --- /dev/null
> > +++ b/drivers/iio/adc/mt6370-adc.c
> > @@ -0,0 +1,305 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2022 Richtek Technology Corp.
> > + *
> > + * Author: ChiaEn Wu <chiaen_wu@richtek.com>
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/iio/iio.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/units.h>
> > +
> > +#include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
> > +
> > +#define MT6370_REG_CHG_CTRL3           0x113
> > +#define MT6370_REG_CHG_CTRL7           0x117
> > +#define MT6370_REG_CHG_ADC             0x121
> > +#define MT6370_REG_ADC_DATA_H          0x14C
> > +
> > +#define MT6370_ADC_START_MASK          BIT(0)
> > +#define MT6370_ADC_IN_SEL_MASK         GENMASK(7, 4)
> > +#define MT6370_AICR_ICHG_MASK          GENMASK(7, 2)
> > +
> > +#define MT6370_AICR_100_mA             0x0
> > +#define MT6370_AICR_150_mA             0x1
> > +#define MT6370_AICR_200_mA             0x2
> > +#define MT6370_AICR_250_mA             0x3
> > +#define MT6370_AICR_300_mA             0x4
> > +#define MT6370_AICR_350_mA             0x5
> > +
> > +#define MT6370_ICHG_100_mA             0x0
> > +#define MT6370_ICHG_200_mA             0x1
> > +#define MT6370_ICHG_300_mA             0x2
> > +#define MT6370_ICHG_400_mA             0x3
> > +#define MT6370_ICHG_500_mA             0x4
> > +#define MT6370_ICHG_600_mA             0x5
> > +#define MT6370_ICHG_700_mA             0x6
> > +#define MT6370_ICHG_800_mA             0x7
> > +
> > +#define ADC_CONV_TIME_MS               35
> > +#define ADC_CONV_POLLING_TIME_US       1000
> > +
> > +struct mt6370_adc_data {
> > +       struct device *dev;
> > +       struct regmap *regmap;
> > +       /*
> > +        * This mutex lock is for preventing the different ADC channels
> > +        * from being read at the same time.
> > +        */
> > +       struct mutex adc_lock;
> > +};
> > +
> > +static int mt6370_adc_read_channel(struct mt6370_adc_data *priv, int chan,
> > +                                  unsigned long addr, int *val)
> > +{
> > +       unsigned int reg_val;
> > +       __be16 be_val;
> > +       int ret;
> > +
> > +       mutex_lock(&priv->adc_lock);
> > +
> > +       reg_val = MT6370_ADC_START_MASK |
> > +                 FIELD_PREP(MT6370_ADC_IN_SEL_MASK, addr);
> > +       ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, reg_val);
> > +       if (ret)
> > +               goto adc_unlock;
> > +
> > +       msleep(ADC_CONV_TIME_MS);
> > +
> > +       ret = regmap_read_poll_timeout(priv->regmap,
> > +                                      MT6370_REG_CHG_ADC, reg_val,
> > +                                      !(reg_val & MT6370_ADC_START_MASK),
> > +                                      ADC_CONV_POLLING_TIME_US,
> > +                                      ADC_CONV_TIME_MS * MILLI * 3);
> > +       if (ret) {
> > +               dev_err(priv->dev, "Failed to read ADC register (%d)\n", ret);
> > +               goto adc_unlock;
> > +       }
> > +
> > +       ret = regmap_raw_read(priv->regmap, MT6370_REG_ADC_DATA_H,
> > +                             &be_val, sizeof(be_val));
> > +       if (ret)
> > +               goto adc_unlock;
> > +
> > +       *val = be16_to_cpu(be_val);
> > +       ret = IIO_VAL_INT;
> > +
> > +adc_unlock:
> > +       mutex_unlock(&priv->adc_lock);
> > +
> > +       return ret;
> > +}
> > +
> > +static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
> > +                                int chan, int *val1, int *val2)
> > +{
> > +       unsigned int reg_val;
> > +       int ret;
> > +
> > +       switch (chan) {
> > +       case MT6370_CHAN_VBAT:
> > +       case MT6370_CHAN_VSYS:
> > +       case MT6370_CHAN_CHG_VDDP:
> > +               *val1 = 5;
> > +               return IIO_VAL_INT;
> > +       case MT6370_CHAN_IBUS:
> > +               ret = regmap_read(priv->regmap, MT6370_REG_CHG_CTRL3, &reg_val);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
> > +               switch (reg_val) {
> > +               case MT6370_AICR_100_mA:
> > +               case MT6370_AICR_150_mA:
> > +               case MT6370_AICR_200_mA:
> > +               case MT6370_AICR_250_mA:
> > +               case MT6370_AICR_300_mA:
> > +               case MT6370_AICR_350_mA:
> > +                       *val1 = 3350;
> > +                       break;
> > +               default:
> > +                       *val1 = 5000;
> > +                       break;
> > +               }
> > +
> > +               *val2 = 100;
> > +
> > +               return IIO_VAL_FRACTIONAL;
> > +       case MT6370_CHAN_IBAT:
> > +               ret = regmap_read(priv->regmap, MT6370_REG_CHG_CTRL7, &reg_val);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               reg_val = FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
> > +               switch (reg_val) {
> > +               case MT6370_ICHG_100_mA:
> > +               case MT6370_ICHG_200_mA:
> > +               case MT6370_ICHG_300_mA:
> > +               case MT6370_ICHG_400_mA:
> > +                       *val1 = 2375;
> > +                       break;
> > +               case MT6370_ICHG_500_mA:
> > +               case MT6370_ICHG_600_mA:
> > +               case MT6370_ICHG_700_mA:
> > +               case MT6370_ICHG_800_mA:
> > +                       *val1 = 2680;
> > +                       break;
> > +               default:
> > +                       *val1 = 5000;
> > +                       break;
> > +               }
> > +
> > +               *val2 = 100;
> > +
> > +               return IIO_VAL_FRACTIONAL;
> > +       case MT6370_CHAN_VBUSDIV5:
> > +               *val1 = 25;
> > +               return IIO_VAL_INT;
> > +       case MT6370_CHAN_VBUSDIV2:
> > +               *val1 = 50;
> > +               return IIO_VAL_INT;
> > +       case MT6370_CHAN_TS_BAT:
> > +               *val1 = 25;
> > +               *val2 = 10000;
> > +               return IIO_VAL_FRACTIONAL;
> > +       case MT6370_CHAN_TEMP_JC:
> > +               *val1 = 2000;
> > +               return IIO_VAL_FRACTIONAL;
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +}
> > +
> > +static int mt6370_adc_read_offset(struct mt6370_adc_data *priv,
> > +                                 int chan, int *val)
> > +{
> > +       *val = -20;
> > +
> > +       return IIO_VAL_INT;
> > +}
> > +
> > +static int mt6370_adc_read_raw(struct iio_dev *iio_dev,
> > +                              const struct iio_chan_spec *chan,
> > +                              int *val, int *val2, long mask)
> > +{
> > +       struct mt6370_adc_data *priv = iio_priv(iio_dev);
> > +
> > +       switch (mask) {
> > +       case IIO_CHAN_INFO_RAW:
> > +               return mt6370_adc_read_channel(priv, chan->channel,
> > +                                              chan->address, val);
> > +       case IIO_CHAN_INFO_SCALE:
> > +               return mt6370_adc_read_scale(priv, chan->channel, val, val2);
> > +       case IIO_CHAN_INFO_OFFSET:
> > +               return mt6370_adc_read_offset(priv, chan->channel, val);
> > +       default:
> > +               return -EINVAL;
> > +       }
> > +}
> > +
> > +static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] = {
> > +       [MT6370_CHAN_VBUSDIV5] = "vbusdiv5",
> > +       [MT6370_CHAN_VBUSDIV2] = "vbusdiv2",
> > +       [MT6370_CHAN_VSYS] = "vsys",
> > +       [MT6370_CHAN_VBAT] = "vbat",
> > +       [MT6370_CHAN_TS_BAT] = "ts_bat",
> > +       [MT6370_CHAN_IBUS] = "ibus",
> > +       [MT6370_CHAN_IBAT] = "ibat",
> > +       [MT6370_CHAN_CHG_VDDP] = "chg_vddp",
> > +       [MT6370_CHAN_TEMP_JC] = "temp_jc",
> > +};
> > +
> > +static int mt6370_adc_read_label(struct iio_dev *iio_dev,
> > +                                struct iio_chan_spec const *chan, char *label)
> > +{
> > +       return sysfs_emit(label, "%s\n", mt6370_channel_labels[chan->channel]);
> > +}
> > +
> > +static const struct iio_info mt6370_adc_iio_info = {
> > +       .read_raw = mt6370_adc_read_raw,
> > +       .read_label = mt6370_adc_read_label,
> > +};
> > +
> > +#define MT6370_ADC_CHAN(_idx, _type, _addr, _extra_info) {     \
> > +       .type = _type,                                          \
> > +       .channel = MT6370_CHAN_##_idx,                          \
> > +       .address = _addr,                                       \
> > +       .scan_index = MT6370_CHAN_##_idx,                       \
> > +       .indexed = 1,                                           \
> > +       .info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |          \
> > +                             BIT(IIO_CHAN_INFO_SCALE) |        \
> > +                             _extra_info,                      \
> > +}
> > +
> > +static const struct iio_chan_spec mt6370_adc_channels[] = {
> > +       MT6370_ADC_CHAN(VBUSDIV5, IIO_VOLTAGE, 1, 0),
> > +       MT6370_ADC_CHAN(VBUSDIV2, IIO_VOLTAGE, 2, 0),
> > +       MT6370_ADC_CHAN(VSYS, IIO_VOLTAGE, 3, 0),
> > +       MT6370_ADC_CHAN(VBAT, IIO_VOLTAGE, 4, 0),
> > +       MT6370_ADC_CHAN(TS_BAT, IIO_VOLTAGE, 6, 0),
> > +       MT6370_ADC_CHAN(IBUS, IIO_CURRENT, 8, 0),
> > +       MT6370_ADC_CHAN(IBAT, IIO_CURRENT, 9, 0),
> > +       MT6370_ADC_CHAN(CHG_VDDP, IIO_VOLTAGE, 11, 0),
> > +       MT6370_ADC_CHAN(TEMP_JC, IIO_TEMP, 12, BIT(IIO_CHAN_INFO_OFFSET)),
> > +};
> > +
> > +static int mt6370_adc_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct mt6370_adc_data *priv;
> > +       struct iio_dev *indio_dev;
> > +       struct regmap *regmap;
> > +       int ret;
> > +
> > +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> > +       if (!regmap)
> > +               return dev_err_probe(dev, -ENODEV, "Failed to get regmap\n");
> > +
> > +       indio_dev = devm_iio_device_alloc(dev, sizeof(*priv));
> > +       if (!indio_dev)
> > +               return -ENOMEM;
> > +
> > +       priv = iio_priv(indio_dev);
> > +       priv->dev = dev;
> > +       priv->regmap = regmap;
> > +       mutex_init(&priv->adc_lock);
> > +
> > +       ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "Failed to reset ADC\n");
> > +
> > +       indio_dev->name = "mt6370-adc";
> > +       indio_dev->info = &mt6370_adc_iio_info;
> > +       indio_dev->modes = INDIO_DIRECT_MODE;
> > +       indio_dev->channels = mt6370_adc_channels;
> > +       indio_dev->num_channels = ARRAY_SIZE(mt6370_adc_channels);
> > +
> > +       return devm_iio_device_register(dev, indio_dev);
> > +}
> > +
> > +static const struct of_device_id mt6370_adc_of_id[] = {
> > +       { .compatible = "mediatek,mt6370-adc", },
> > +       {}
> > +};
> > +MODULE_DEVICE_TABLE(of, mt6370_adc_of_id);
> > +
> > +static struct platform_driver mt6370_adc_driver = {
> > +       .driver = {
> > +               .name = "mt6370-adc",
> > +               .of_match_table = mt6370_adc_of_id,
> > +       },
> > +       .probe = mt6370_adc_probe,
> > +};
> > +module_platform_driver(mt6370_adc_driver);
> > +
> > +MODULE_AUTHOR("ChiaEn Wu <chiaen_wu@richtek.com>");
> > +MODULE_DESCRIPTION("MT6370 ADC Driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.7.4
> >  
> 
> 

