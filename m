Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E053C42A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 07:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EF41137A2;
	Fri,  3 Jun 2022 05:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0775810F171
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 18:22:28 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id a10so5580031ioe.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rb78/Si50YHRG3/zeIdBErQ6GzrBGzyMy6c/2Qru9iA=;
 b=TIwX3QBFC7A8jcA1/ieNV9CVbcphYpQaITGJkvXqeR9RjVRF0E0XsBODPKVouqudI1
 yot70cL06RMduvm13bd1wse+JGt21OYGX1ZwbrLxqEZQh0mu6KVD3iaqZ8qv9a2YBkco
 ItLjawD46ESPW3i7QNZXxgrDi3eE85JW400V1a+iwg9wSk7C6O3JggKToM89pIsyQ039
 ng72vAyGicyCDZuW8AvVBYDp2NdNzOWTvKH7N0iRR2rniHvsAWP8MXOjKVDsd98puJ55
 KhfXup5QcNrvuCl717Jj+2EHY1H3vtZvLvcXCBS9WbFnt1sT1zQgQPo0O03yN/wLzoh1
 n/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rb78/Si50YHRG3/zeIdBErQ6GzrBGzyMy6c/2Qru9iA=;
 b=ZlfitEaUkMfvE/CkeFqYnPNE7xIn6NYH3DiCh8ynxXPaQ2C1KNYCWQZAZItNbRE1GJ
 jy0Ey5cfglR/9SQRye06dWw+Cp1p0/QwsOMeVf5PBRt96GYnuyCZB60WlWW55bOoYA6S
 CUV/i8JOUYg9SU9Ij8HDK4RaKOcwTU2zxCKbYb5mxGqhHVb34MPckZAJceL/GlnZMQX6
 QX+eeCiJ25tiK8mxkGKUCJmaYZqP2cGOQl/Uuq76FK86rQmJwZa5GX2M9B2BC5fJRXrD
 0ReQA12i7u8BMbrIJQms6fX6zOoaVNWjVfuAOi47KppXKPMs6OsNFoPFkurf3Ib+77WJ
 PSTQ==
X-Gm-Message-State: AOAM5330S3ebs//dRzRVSkyCbN7yShAPF2CmSgzLMdsuoJNzNjENxqUV
 B1KsjOvRyiPWU/W3DajqtJmiQMBZIel0huSva/E=
X-Google-Smtp-Source: ABdhPJw51uQn0pORopjOrTQMyfowxa8ppaT964Ws3gi+VH3fwPVU+uI88kAqWAWAwXt9H4A6qWF+EC6yIFJQKSG86OU=
X-Received: by 2002:a02:9f8b:0:b0:32e:7bf1:bd with SMTP id
 a11-20020a029f8b000000b0032e7bf100bdmr3866136jam.2.1654194147191; 
 Thu, 02 Jun 2022 11:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-11-peterwu.pub@gmail.com>
 <20220531142102.00007df0@Huawei.com>
In-Reply-To: <20220531142102.00007df0@Huawei.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 3 Jun 2022 02:22:16 +0800
Message-ID: <CABtFH5Lg43EXS7juhXQ2wQFZzkpD7YB8rM6UFT=U9BDOKcbaNw@mail.gmail.com>
Subject: Re: [RESEND 10/14] iio: adc: mt6370: Add Mediatek MT6370 support
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 03 Jun 2022 05:26:38 +0000
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
 lgirdwood@gmail.com, ChiYuan Huang <cy_huang@richtek.com>, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, daniel.thompson@linaro.org,
 deller@gmx.de, robh+dt@kernel.org, chunfeng.yun@mediatek.com,
 linux@roeck-us.net, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Sorry for sending the same email again. I miss to reply all in the last ema=
il..

Thanks for your valuable suggestions!

Jonathan Cameron <Jonathan.Cameron@huawei.com> =E6=96=BC 2022=E5=B9=B45=E6=
=9C=8831=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:21=E5=AF=AB=E9=81=
=93=EF=BC=9A

>
> On Tue, 31 May 2022 19:18:56 +0800
> ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > Add Mediatek MT6370 ADC support.
> >
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Hi ChiaEn,
>
> A few comments inline.
>
> Thanks,
>
> Jonathan
>
> > ---
> >  drivers/iio/adc/Kconfig      |   9 ++
> >  drivers/iio/adc/Makefile     |   1 +
> >  drivers/iio/adc/mt6370-adc.c | 257 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 267 insertions(+)
> >  create mode 100644 drivers/iio/adc/mt6370-adc.c
> >
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > index 71ab0a06aa82..d7932dd9b773 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -737,6 +737,15 @@ config MEDIATEK_MT6360_ADC
> >         is used in smartphones and tablets and supports a 11 channel
> >         general purpose ADC.
> >
> > +config MEDIATEK_MT6370_ADC
> > +     tristate "Mediatek MT6370 ADC driver"
> > +     depends on MFD_MT6370
> > +     help
> > +       Say Y here to enable MT6370 ADC support.
> > +       Integrated for System Monitoring includes
>
> The wrapping of this text needs cleaning up.
>
> > +       is used in smartphones and tablets and supports a 9 channel
> > +       general purpose ADC.
> > +
> >  config MEDIATEK_MT6577_AUXADC
> >       tristate "MediaTek AUXADC driver"
> >       depends on ARCH_MEDIATEK || COMPILE_TEST
> > diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> > index 39d806f6d457..0ce285c7e2d0 100644
> > --- a/drivers/iio/adc/Makefile
> > +++ b/drivers/iio/adc/Makefile
> > @@ -68,6 +68,7 @@ obj-$(CONFIG_MCP320X) +=3D mcp320x.o
> >  obj-$(CONFIG_MCP3422) +=3D mcp3422.o
> >  obj-$(CONFIG_MCP3911) +=3D mcp3911.o
> >  obj-$(CONFIG_MEDIATEK_MT6360_ADC) +=3D mt6360-adc.o
> > +obj-$(CONFIG_MEDIATEK_MT6370_ADC) +=3D mt6370-adc.o
> >  obj-$(CONFIG_MEDIATEK_MT6577_AUXADC) +=3D mt6577_auxadc.o
> >  obj-$(CONFIG_MEN_Z188_ADC) +=3D men_z188_adc.o
> >  obj-$(CONFIG_MESON_SARADC) +=3D meson_saradc.o
> > diff --git a/drivers/iio/adc/mt6370-adc.c b/drivers/iio/adc/mt6370-adc.=
c
> > new file mode 100644
> > index 000000000000..3320ebca17ad
> > --- /dev/null
> > +++ b/drivers/iio/adc/mt6370-adc.c
> > @@ -0,0 +1,257 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
> > +#include <linux/bits.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/iio/iio.h>
> > +#include <linux/irq.h>
>
> Not seeing any interrupt support in here.

Sorry for that I forgot remove this line, I'll refine it in the next patch.

>
>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#define MT6370_REG_CHG_CTRL3         0x113 /* AICR */
> > +#define MT6370_REG_CHG_CTRL7         0x117 /* ICHG */
> > +#define MT6370_REG_CHG_ADC           0x121
> > +#define MT6370_REG_ADC_DATA_H                0x14C
> > +
> > +#define MT6370_ADC_START_MASK                BIT(0)
> > +#define MT6370_ADC_IN_SEL_MASK               GENMASK(7, 4)
> > +#define MT6370_AICR_ICHG_MASK                GENMASK(7, 2)
> > +
> > +#define MT6370_ADC_CHAN_SHIFT                4
>
> Prefer using a mask and then FIELD_PREP

OK, I got it!

>
> > +
> > +#define MT6370_AICR_400MA            0x6
> > +#define MT6370_ICHG_500MA            0x4
> > +#define MT6370_ICHG_900MA            0x8
> > +
> > +#define ADC_CONV_TIME_US             35000
> > +#define ADC_CONV_POLLING_TIME                1000
> > +
> > +struct mt6370_adc_data {
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct mutex lock;
>
> All locks need documentation.  What is the scope of the lock?
> Looks like it protects device state when doing setup, wait for read, read
> cycles.

This mutex lock is for preventing the different adc channel from being
read at the same time.
So, if I just change its name to adc_chan_lock or adc_lock and add the
comment for this mutex lock, does this change meet your requirement?

>
> > +};
> > +
> > +static int mt6370_adc_read_channel(struct mt6370_adc_data *priv, int c=
han,
> > +                                unsigned long addr, int *val)
> > +{
> > +     __be16 be_val;
> > +     unsigned int reg_val;
> > +     int ret;
> > +
> > +     mutex_lock(&priv->lock);
> > +
> > +     reg_val =3D MT6370_ADC_START_MASK | (addr << MT6370_ADC_CHAN_SHIF=
T);
>
> FIELD_PREP for that shift?

I got it! I'll refine it in the next patch.


>
> > +     ret =3D regmap_write(priv->regmap, MT6370_REG_CHG_ADC, reg_val);
> > +     if (ret)
> > +             goto adc_unlock;
> > +
> > +     msleep(ADC_CONV_TIME_US / 1000);
> > +
> > +     ret =3D regmap_read_poll_timeout(priv->regmap,
> > +                                    MT6370_REG_CHG_ADC, reg_val,
> > +                                    !(reg_val & MT6370_ADC_START_MASK)=
,
> > +                                    ADC_CONV_POLLING_TIME,
> > +                                    ADC_CONV_TIME_US * 3);
> > +     if (ret) {
> > +             if (ret =3D=3D -ETIMEDOUT)
> > +                     dev_err(priv->dev, "Failed to wait adc conversion=
\n");
> > +             goto adc_unlock;
> > +     }
> > +
> > +     ret =3D regmap_raw_read(priv->regmap, MT6370_REG_ADC_DATA_H,
> > +                           &be_val, sizeof(be_val));
> > +     if (ret)
> > +             goto adc_unlock;
> > +
> > +     *val =3D be16_to_cpu(be_val);
> > +     ret =3D IIO_VAL_INT;
> > +
> > +adc_unlock:
> > +     mutex_unlock(&priv->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
> > +                              int chan, int *val1, int *val2)
> > +{
> > +     unsigned int reg_val;
> > +     int ret;
> > +
> > +     switch (chan) {
> > +     case MT6370_CHAN_VBAT:
> > +     case MT6370_CHAN_VSYS:
> > +     case MT6370_CHAN_CHG_VDDP:
> > +             *val1 =3D 5000;
>
> This seems very large.  Voltages are in millivolts
> as per Documentation/ABI/testing/sysfs-bus-iio
> and this means each step is 5 volts.
>
> So value in mv is currently 5 * _raw
>

OK, I got it. Also, I will add the ABI file in the next version. Thanks!


>
>
> > +             return IIO_VAL_INT;
> > +     case MT6370_CHAN_IBUS:
> > +             ret =3D regmap_read(priv->regmap, MT6370_REG_CHG_CTRL3, &=
reg_val);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             reg_val =3D FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
> > +             if (reg_val < MT6370_AICR_400MA)
> > +                     *val1 =3D 33500;
> > +             else
> > +                     *val1 =3D 50000;
> > +
> > +             return IIO_VAL_INT;
> > +     case MT6370_CHAN_IBAT:
> > +             ret =3D regmap_read(priv->regmap, MT6370_REG_CHG_CTRL7, &=
reg_val);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             reg_val =3D FIELD_GET(MT6370_AICR_ICHG_MASK, reg_val);
> > +             if (reg_val < MT6370_ICHG_500MA)
> > +                     *val1 =3D 23750;
> > +             else if (reg_val >=3D MT6370_ICHG_500MA &&
> > +                      reg_val < MT6370_ICHG_900MA)
> > +                     *val1 =3D 26800;
> > +             else
> > +                     *val1 =3D 50000;
> > +
> > +             return IIO_VAL_INT;
> > +     case MT6370_CHAN_VBUSDIV5:
> > +             *val1 =3D 25000;
> > +             return IIO_VAL_INT;
> > +     case MT6370_CHAN_VBUSDIV2:
> > +             *val1 =3D 50000;
> > +             return IIO_VAL_INT;
> > +     case MT6370_CHAN_TS_BAT:
> > +             *val1 =3D 25;
> > +             *val2 =3D 10000;
> > +             return IIO_VAL_FRACTIONAL;
> > +     case MT6370_CHAN_TEMP_JC:
> > +             *val1 =3D 2;
> > +             return IIO_VAL_INT;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int mt6370_adc_read_offset(struct mt6370_adc_data *priv,
> > +                               int chan, int *val)
> > +{
> > +     *val =3D (chan =3D=3D MT6370_CHAN_TEMP_JC) ? -20 : 0;
>
> Offset default is 0, so for channels where it doesn't apply don't
> provide the offset attribute at all.
>

OK!


> > +     return IIO_VAL_INT;
> > +}
> > +
> > +static int mt6370_adc_read_raw(struct iio_dev *iio_dev,
> > +                            const struct iio_chan_spec *chan,
> > +                            int *val, int *val2, long mask)
> > +{
> > +     struct mt6370_adc_data *priv =3D iio_priv(iio_dev);
> > +
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             return mt6370_adc_read_channel(priv, chan->channel,
> > +                                            chan->address, val);
> > +     case IIO_CHAN_INFO_SCALE:
> > +             return mt6370_adc_read_scale(priv, chan->channel, val, va=
l2);
> > +     case IIO_CHAN_INFO_OFFSET:
> > +             return mt6370_adc_read_offset(priv, chan->channel, val);
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] =3D {
>
> Perhaps define an enum with which to index this and the chan spec
> and hence ensure they end up matching.
>  [vbusdiv5] =3D "vbusdiv5", etc
>

Do you mean that I can refine this const char array to the following array?=
?

static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] =3D {
    [MT6370_CHAN_VBUSDIV5] =3D  "vbusdiv5",
    [MT6370_CHAN_VBUSDIV2] =3D  "vbusdiv2",
    ...
    ...
    [MT6370_CHAN_TEMP_JC] =3D  "temp_jc",
};



> > +     "vbusdiv5", "vbusdiv2", "vsys", "vbat",
> > +     "ts_bat", "ibus", "ibat", "chg_vddp",
> > +     "temp_jc",
> > +};
> > +
> > +static int mt6370_adc_read_label(struct iio_dev *iio_dev,
> > +                              struct iio_chan_spec const *chan, char *=
label)
> > +{
> > +     return snprintf(label, PAGE_SIZE, "%s\n",
> > +                     mt6370_channel_labels[chan->channel]);
> > +}
> > +
> > +static const struct iio_info mt6370_adc_iio_info =3D {
> > +     .read_raw =3D mt6370_adc_read_raw,
> > +     .read_label =3D mt6370_adc_read_label,
> > +};
> > +
> > +#define MT6370_ADC_CHAN(_idx, _type, _addr) {                        \
> > +     .type =3D _type,                                          \
> > +     .channel =3D MT6370_CHAN_##_idx,                          \
> > +     .address =3D _addr,                                       \
> > +     .scan_index =3D MT6370_CHAN_##_idx,                       \
> > +     .indexed =3D 1,                                           \
> > +     .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |          \
> > +                           BIT(IIO_CHAN_INFO_SCALE) |        \
> > +                           BIT(IIO_CHAN_INFO_OFFSET),        \
>
> See above. Only temp_jc channel should hav an offset.
>
OK!


> > +}
> > +
> > +static const struct iio_chan_spec mt6370_adc_channels[] =3D {
> > +     MT6370_ADC_CHAN(VBUSDIV5, IIO_VOLTAGE, 1),
> > +     MT6370_ADC_CHAN(VBUSDIV2, IIO_VOLTAGE, 2),
> > +     MT6370_ADC_CHAN(VSYS, IIO_VOLTAGE, 3),
> > +     MT6370_ADC_CHAN(VBAT, IIO_VOLTAGE, 4),
> > +     MT6370_ADC_CHAN(TS_BAT, IIO_VOLTAGE, 6),
> > +     MT6370_ADC_CHAN(IBUS, IIO_CURRENT, 8),
> > +     MT6370_ADC_CHAN(IBAT, IIO_CURRENT, 9),
> > +     MT6370_ADC_CHAN(CHG_VDDP, IIO_VOLTAGE, 11),
> > +     MT6370_ADC_CHAN(TEMP_JC, IIO_TEMP, 12),
> > +};
> > +
> > +static int mt6370_adc_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +     struct mt6370_adc_data *priv;
> > +     struct regmap *regmap;
> > +     struct iio_dev *indio_dev;
> > +
> > +     regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
> > +     if (!regmap) {
> > +             dev_err(&pdev->dev, "Failed to get regmap\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*priv));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +
> > +     priv =3D iio_priv(indio_dev);
> > +     priv->dev =3D &pdev->dev;
> > +     priv->regmap =3D regmap;
> > +     mutex_init(&priv->lock);
> > +
> > +     ret =3D regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "Failed to reset adc\n");
> > +             return ret;
> > +     }
> > +
> > +     indio_dev->name =3D dev_name(&pdev->dev);
>
> What does this end up as?  It's used for userspace ABI and should
> correspond to the part number, "mt6370-adc" probably
> appropriate in this case (I think it'll end up as simply "adc.x"
> currently?)  Normally we just hard code this in the driver for
> whatever devices the driver supports.

I got it, I will change this name to "mt6370-adc" in the next version! Than=
ks!


>
> > +     indio_dev->info =3D &mt6370_adc_iio_info;
> > +     indio_dev->modes =3D INDIO_DIRECT_MODE;
> > +     indio_dev->channels =3D mt6370_adc_channels;
> > +     indio_dev->num_channels =3D ARRAY_SIZE(mt6370_adc_channels);
> > +
> > +     return devm_iio_device_register(&pdev->dev, indio_dev);
> > +}
> > +
> > +static const struct of_device_id mt6370_adc_of_id[] =3D {
> > +     { .compatible =3D "mediatek,mt6370-adc", },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, mt6370_adc_of_id);
> > +
> > +static struct platform_driver mt6370_adc_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "mt6370-adc",
> > +             .of_match_table =3D mt6370_adc_of_id,
> > +     },
> > +     .probe =3D mt6370_adc_probe,
> > +};
> > +module_platform_driver(mt6370_adc_driver);
> > +
> > +MODULE_AUTHOR("ChiaEn Wu <chiaen_wu@richtek.com>");
> > +MODULE_DESCRIPTION("MT6370 ADC Drvier");
> > +MODULE_LICENSE("GPL v2");
>

Best regards,
ChiaEn Wu
