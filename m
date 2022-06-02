Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74853C429
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 07:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0363E11379C;
	Fri,  3 Jun 2022 05:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB79F10E8A8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 19:15:09 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id f4so5741351iov.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+JW6e6kAbkN1t97wxNKn9trDaaZcj41ptIda8qj3Wss=;
 b=Mp3yYAlO9Imkq6jnVsv97Ohy+jxga/lb1MU6H8gTFzB/XiqAYsmgs7+AerjK52IbOX
 Z5ku3ZZAU1yZx0zQJsUoh5Cmfrkh5hNHSUKsZOvomVQ9lrjHsoSPpfnIX0jzAaabG5s/
 kFzIklrdpFad1HMH4lSIsFYRm4z5uggz270Jh6qRBeNIgjFO9VqU0j3BuvbbEsMcLSlN
 q2qK1+2iYRJBbHvyYbnil6/I78AzdEYB5imRqiIR4NgBPnOmyvSnIT2iXsSIukvxkJb3
 FQoW1mECkuo+5XRlZT61kIS5j+umTbCjmUwXjTKSaxFMHBBSl+6BwUf8yF+RBuQt44O8
 WkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+JW6e6kAbkN1t97wxNKn9trDaaZcj41ptIda8qj3Wss=;
 b=eQD4q563KhINBsqdJMwf7IO3yDByH4jo2Dip0x6SZktUattR/Iik2LYaBYIk3QEDz/
 H6V5YIGxir9Bag+R2/Q4FaZq+ZOBk32xSkEHeZZVYVv5PQJHVHZZrkaKrmmSkNYOAeGW
 GtlZHAxeShnCuCK/C1GOFSF9W3DnwPJASXrNOji8vWSSFa2a2PLGU2dqnV1EZPwDH3Zs
 XgdpIEZkZZ5WakVcN6+yqSabkBr/R5z7xRGJwz50E4mugjQBgfb7keZcja8bhIl54R/a
 hRktt2iNXwhwqvzY+IiW2pJ8kgFm9vEnJjfkLZr7+6fqutRylGWj6MeIC76SB1CdzZAv
 ftOQ==
X-Gm-Message-State: AOAM532K70O8uUsDxf9rEtdUJjfQ478XPbscBVt4V6tFIyG7F/fvZh4b
 hQv9zfpPNvMt7Ei+HMdBoR/1bUBEUgxcfLfNM3g=
X-Google-Smtp-Source: ABdhPJy7VatPndTmM5OUVDGmxQ+LUCJY+DzYiarB1n+6ksvOyD1yaNE9MZIu+T8TyIiNppF3Bd3F4stuMBR0VTMVw/s=
X-Received: by 2002:a05:6602:1355:b0:63d:a9ab:7e30 with SMTP id
 i21-20020a056602135500b0063da9ab7e30mr3336043iov.119.1654197307956; Thu, 02
 Jun 2022 12:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-15-peterwu.pub@gmail.com>
 <20220601094623.jnwh2fgsqepy72tc@maple.lan>
In-Reply-To: <20220601094623.jnwh2fgsqepy72tc@maple.lan>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 3 Jun 2022 03:14:56 +0800
Message-ID: <CABtFH5+-o=cML_VCSY9frJwEU_TnZt0+myJebi8J7BpP+BOqOw@mail.gmail.com>
Subject: Re: [RESEND 14/14] video: backlight: mt6370: Add Mediatek MT6370
 support
To: Daniel Thompson <daniel.thompson@linaro.org>
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
 lee.jones@linaro.org, linux-leds@vger.kernel.org, deller@gmx.de,
 robh+dt@kernel.org, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thanks for your valuable feedback!

Daniel Thompson <daniel.thompson@linaro.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=881=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:46=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Tue, May 31, 2022 at 07:19:00PM +0800, ChiaEn Wu wrote:
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > Add Mediatek MT6370 Backlight support.
> >
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >  drivers/video/backlight/Kconfig            |   8 +
> >  drivers/video/backlight/Makefile           |   1 +
> >  drivers/video/backlight/mt6370-backlight.c | 338 +++++++++++++++++++++
> >  3 files changed, 347 insertions(+)
> >  create mode 100644 drivers/video/backlight/mt6370-backlight.c
> >
> > diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/=
Kconfig
> > index a003e02e13ce..d9868fbe7488 100644
> > --- a/drivers/video/backlight/Kconfig
> > +++ b/drivers/video/backlight/Kconfig
> > @@ -268,6 +268,14 @@ config BACKLIGHT_MAX8925
> >         If you have a LCD backlight connected to the WLED output of MAX=
8925
> >         WLED output, say Y here to enable this driver.
> >
> > +config BACKLIGHT_MT6370
>
> Is MT6370 really the best name for this driver? In other words, you
> don't expect there to be any family resemblance between this backlight
> and the backlight in the *next* Mediatak PMIC?
>
> Moreover,

MT6370, MT6371, MT6372 are very similar, their hardware design and
features are almost the same and this driver can be compatible with
them.
But, MT6374 is not the same serials PMIC as MT6370, but the name is
very similar. And It has no backlight feature, so I think MT6370 is
the best name for this driver now.

>
>
> > +     tristate "Mediatek MT6370 Backlight Driver"
> > +     depends on MFD_MT6370
> > +     help
> > +       Say Y here to enable MT6370 Backlight support.
> > +       It's commonly used to drive the display WLED. There're 4 channe=
ls
> > +       inisde, and each channel can provide up to 30mA current.
>
> Nitpicking but this doesn't align well with other help texts in this
> file.
>

OK! I will try to align well in the next patch.

>
> > +
> >  config BACKLIGHT_APPLE
> >       tristate "Apple Backlight Driver"
> >       depends on X86 && ACPI
> > diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight=
/Makefile
> > index cae2c83422ae..e815f3f1deff 100644
> > --- a/drivers/video/backlight/Makefile
> > +++ b/drivers/video/backlight/Makefile
> > @@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)              +=3D lp85=
5x_bl.o
> >  obj-$(CONFIG_BACKLIGHT_LP8788)               +=3D lp8788_bl.o
> >  obj-$(CONFIG_BACKLIGHT_LV5207LP)     +=3D lv5207lp.o
> >  obj-$(CONFIG_BACKLIGHT_MAX8925)              +=3D max8925_bl.o
> > +obj-$(CONFIG_BACKLIGHT_MT6370)               +=3D mt6370-backlight.o
> >  obj-$(CONFIG_BACKLIGHT_OMAP1)                +=3D omap1_bl.o
> >  obj-$(CONFIG_BACKLIGHT_PANDORA)              +=3D pandora_bl.o
> >  obj-$(CONFIG_BACKLIGHT_PCF50633)     +=3D pcf50633-backlight.o
> > diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video=
/backlight/mt6370-backlight.c
> > new file mode 100644
> > index 000000000000..f8a8d33203ed
> > --- /dev/null
> > +++ b/drivers/video/backlight/mt6370-backlight.c
> > @@ -0,0 +1,338 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#define MT6370_REG_DEV_INFO          0x100
> > +#define MT6370_REG_BL_EN             0x1A0
> > +#define MT6370_REG_BL_BSTCTRL                0x1A1
> > +#define MT6370_REG_BL_PWM            0x1A2
> > +#define MT6370_REG_BL_DIM2           0x1A4
> > +
> > +#define MT6370_VENID_MASK            GENMASK(7, 4)
> > +#define MT6370_BL_EXT_EN_MASK                BIT(7)
> > +#define MT6370_BL_EN_MASK            BIT(6)
> > +#define MT6370_BL_CONFIG_MASK                BIT(0)
> > +#define MT6370_BL_CH_MASK            GENMASK(5, 2)
> > +#define MT6370_BL_DIM2_MASK          GENMASK(2, 0)
> > +#define MT6370_BL_DUMMY_6372_MASK    GENMASK(2, 0)
> > +#define MT6370_BL_DIM2_6372_SHIFT    3
> > +#define MT6370_BL_PWM_EN_MASK                BIT(7)
> > +#define MT6370_BL_PWM_HYS_EN_MASK    BIT(2)
> > +#define MT6370_BL_PWM_HYS_SEL_MASK   GENMASK(1, 0)
> > +#define MT6370_BL_OVP_EN_MASK                BIT(7)
> > +#define MT6370_BL_OVP_SEL_MASK               GENMASK(6, 5)
> > +#define MT6370_BL_OC_EN_MASK         BIT(3)
> > +#define MT6370_BL_OC_SEL_MASK                GENMASK(2, 1)
> > +
> > +#define MT6370_BL_MAX_BRIGHTNESS     2048
> > +
> > +enum {
> > +     MT6370_VID_COMMON =3D 0,
> > +     MT6370_VID_6372,
> > +     MT6370_VID_MAX,
>
> Unused.
>
> > +};
> > +
> > +enum mt6370_prop_type {
> > +     MT6370_PARSE_TYPE_BOOL =3D 0,
> > +     MT6370_PARSE_TYPE_U8,
> > +     MT6370_PARSE_TYPE_MAX,
>
> Unused.
>
> > +};
> > +
> > +struct mt6370_priv {
> > +     int vid_type;
> > +     struct backlight_device *bl;
> > +     struct device *dev;
> > +     struct gpio_desc *enable_gpio;
> > +     struct regmap *regmap;
> > +};
> > +
> > +static int mt6370_bl_update_status(struct backlight_device *bl_dev)
> > +{
> > +     struct mt6370_priv *priv =3D bl_get_data(bl_dev);
> > +     int brightness =3D backlight_get_brightness(bl_dev);
> > +     unsigned int enable_val;
> > +     u8 brightness_val[2];
> > +     int ret;
> > +
> > +     if (brightness) {
> > +             brightness_val[0] =3D (brightness - 1) & MT6370_BL_DIM2_M=
ASK;
> > +             brightness_val[1] =3D (brightness - 1)
> > +                                     >> fls(MT6370_BL_DIM2_MASK);
> > +
> > +             if (priv->vid_type =3D=3D MT6370_VID_6372) {
> > +                     brightness_val[0] <<=3D MT6370_BL_DIM2_6372_SHIFT=
;
> > +                     brightness_val[0] |=3D MT6370_BL_DUMMY_6372_MASK;
>
> Comment explaining why we have to set these bits would be useful.

I got it, I will add the comment in the next patch.

>
>
> > +             }
> > +
> > +             ret =3D regmap_raw_write(priv->regmap, MT6370_REG_BL_DIM2=
,
> > +                                    brightness_val, sizeof(brightness_=
val));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (priv->enable_gpio)
> > +             gpiod_set_value(priv->enable_gpio, brightness ? 1 : 0);
> > +
> > +     enable_val =3D brightness ? MT6370_BL_EN_MASK : 0;
> > +     return regmap_update_bits(priv->regmap, MT6370_REG_BL_EN,
> > +                               MT6370_BL_EN_MASK, enable_val);
> > +}
> > +
>
> <snip>
>
> > +#define MT6370_DT_PROP_DECL(_name, _type, _reg, _mask, _max, _inv)   \
> > +{                                                                    \
> > +     .name =3D "mediatek,bled-" #_name,                               =
 \
>
> I'd rather have the whole DT property in the macro (because it helps
> with grepability).

Do you mean the _name parameter must be the full name of the DT
property and do not use "#" to concat like following example?

// in declare
            .name =3D _name,
// in use
            MT6370_DT_PROP_DECL(mediatek,bled-pwm-enable, ......)

>
>
> > +     .type =3D MT6370_PARSE_TYPE_##_type,                             =
 \
> > +     .reg =3D _reg,                                                   =
 \
> > +     .mask =3D _mask,                                                 =
 \
> > +     .max_val =3D _max,                                               =
 \
> > +     .invert =3D _inv,                                                =
 \
> > +}
> > +
> > +static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
> > +                                         struct backlight_properties *=
props)
> > +{
> > +     struct device *dev =3D priv->dev;
> > +     u8 prop_val;
> > +     u32 brightness;
> > +     unsigned int mask, val;
> > +     static const struct {
> > +             char *name;
> > +             enum mt6370_prop_type type;
> > +             unsigned int reg;
> > +             unsigned int mask;
> > +             u8 max_val;
> > +             bool invert;
> > +     } vendor_opt_props[] =3D {
> > +             MT6370_DT_PROP_DECL(pwm-enable, BOOL, MT6370_REG_BL_PWM,
> > +                                 MT6370_BL_PWM_EN_MASK, 1, false),
> > +             MT6370_DT_PROP_DECL(pwm-hys-enable, BOOL, MT6370_REG_BL_P=
WM,
> > +                                 MT6370_BL_PWM_HYS_EN_MASK, 1, false),
> > +             MT6370_DT_PROP_DECL(pwm-hys-sel, U8, MT6370_REG_BL_PWM,
> > +                                 MT6370_BL_PWM_HYS_SEL_MASK, 3, false)=
,
> > +             MT6370_DT_PROP_DECL(ovp-level-sel, U8, MT6370_REG_BL_BSTC=
TRL,
> > +                                 MT6370_BL_OVP_SEL_MASK, 3, false),
> > +             MT6370_DT_PROP_DECL(ovp-shutdown, BOOL, MT6370_REG_BL_BST=
CTRL,
> > +                                 MT6370_BL_OVP_EN_MASK, 1, true),
> > +             MT6370_DT_PROP_DECL(ocp-level-sel, U8, MT6370_REG_BL_BSTC=
TRL,
> > +                                 MT6370_BL_OC_SEL_MASK, 3, false),
> > +             MT6370_DT_PROP_DECL(ocp-shutdown, BOOL, MT6370_REG_BL_BST=
CTRL,
> > +                                 MT6370_BL_OC_EN_MASK, 1, true),
> > +     }, *prop_now;
> > +     int i, ret;
> > +
> > +     /* vendor optional properties */
> > +     for (i =3D 0; i < ARRAY_SIZE(vendor_opt_props); i++) {
> > +             prop_now =3D vendor_opt_props + i;
> > +
> > +             switch (prop_now->type) {
> > +             case MT6370_PARSE_TYPE_BOOL:
> > +                     if (device_property_read_bool(dev, prop_now->name=
))
> > +                             val =3D 1;
> > +                     else
> > +                             val =3D 0;
> > +                     break;
> > +             case MT6370_PARSE_TYPE_U8:
> > +                     ret =3D device_property_read_u8(dev, prop_now->na=
me,
> > +                                                   &prop_val);
> > +                     /* Property not exist, keep value in default */
> > +                     if (ret)
> > +                             continue;
> > +
> > +                     val =3D min_t(u8, prop_val, prop_now->max_val);
> > +                     break;
> > +             default:
> > +                     return -EINVAL;
> > +             }
> > +
> > +             if (prop_now->invert)
> > +                     val =3D prop_now->max_val - val;
> > +
> > +             val <<=3D ffs(prop_now->mask) - 1;
> > +
> > +             ret =3D regmap_update_bits(priv->regmap, prop_now->reg,
> > +                                      prop_now->mask, val);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> Is it really worth all this tricky code for 7 properties?
>
> The code would be much easier to read and maintain if it were coded
> directly. For example, the inverted boolean code is hard to read and
> can be written directly as:
>
>
>         val =3D device_property_read_bool(dev, "mediatek,bled-ovp_shutdow=
n");
>         ret =3D regmap_update_bits(priv->regmap, MT6370_REG_BL_BST_CTRL,
>                                  MT6370_BL_OVP_EN_MASK,
>                                  MT6370_BL_OVP_EN_MASK * !val);
>         if (ret)
>                 return ret;
>
> The direct coded approach will probably also pay off if you switch
> the bindings over to microvolts/microamps since it becomes much more
> natural to call out to a lookup function to convert it into a register
> value.
>

The purpose of my code is trying to avoid the repeat code in this
function. And for loop can help to decrease the lines of code
effectively, that's why I use these code to parse the DT properties.

> > +
> > +     /* common properties */
> > +     ret =3D device_property_read_u32(dev, "max-brightness", &brightne=
ss);
> > +     if (ret)
> > +             brightness =3D MT6370_BL_MAX_BRIGHTNESS;
> > +
> > +     props->max_brightness =3D min_t(u32, brightness,
> > +                                   MT6370_BL_MAX_BRIGHTNESS);
> > +
> > +     ret =3D device_property_read_u32(dev, "default-brightness", &brig=
htness);
> > +     if (ret)
> > +             brightness =3D props->max_brightness;
> > +
> > +     props->brightness =3D min_t(u32, brightness, props->max_brightnes=
s);
> > +
> > +
> > +     ret =3D device_property_read_u8(dev, "mediatek,bled-channel-use",
> > +                                   &prop_val);
> > +     if (ret) {
> > +             dev_err(dev, "mediatek,bled-channel-use DT property missi=
ng\n");
> > +             return ret;
> > +     }
> > +
> > +     if (!prop_val) {
> > +             dev_err(dev, "No channel specified\n");
> > +             return -EINVAL;
> > +     }
>
> If we are going to validity check this property then it needs an upper
> bounds check to (e.g. consider if property is set to 64).
>
OK, I will add the validation in the next patch.

>
> > +
> > +     mask =3D MT6370_BL_EXT_EN_MASK | MT6370_BL_CH_MASK;
> > +     val =3D prop_val << (ffs(MT6370_BL_CH_MASK) - 1);
> > +
> > +     if (priv->enable_gpio)
> > +             val |=3D MT6370_BL_EXT_EN_MASK;
> > +
> > +     return regmap_update_bits(priv->regmap, MT6370_REG_BL_EN, mask, v=
al);
> > +}
> > +
> > +static int mt6370_check_vendor_info(struct mt6370_priv *priv)
>
> A comment explaining what variants this function is intended to
> supported here would be good here.

Ok, I got it! I'll add the comment in the next patch.

>
>
> > +{
> > +     unsigned int dev_info, vid;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &dev_info)=
;
> > +     if (ret)
> > +             return ret;
> > +
> > +     vid =3D FIELD_GET(MT6370_VENID_MASK, dev_info);
> > +     if (vid =3D=3D 0x9 || vid =3D=3D 0xb)
> > +             priv->vid_type =3D MT6370_VID_6372;
> > +     else
> > +             priv->vid_type =3D MT6370_VID_COMMON;
> > +
> > +     return 0;
> > +}
>
>
> No furthers comments so I trimmed the rest.
>
>
> Daniel.

Best regards,
ChiaEn Wu
