Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A764D5604F0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 17:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FD110E606;
	Wed, 29 Jun 2022 15:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A44D10E606
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 15:52:51 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id p69so16395266iod.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m3srbM8QGWrZhwGq/B370AsvjDk8BediS0HIOgFCe3E=;
 b=TEqaPH+b8J+kXTgX6LEBz8BN99Q66IkyfTj6NQf26Ir9KFKzJZQhZNNYMMGqRDSXRo
 7G8RPAE3Ivq80Rkwp/+ZUB/616P7/Lyl6qshrI567HvQ9t6/P6X0G1jLWZWUOjIkoWSt
 cWz4d4UdzcRBwtU09wfItyTJ5bA1klYc7TJ6RafHaP3Yo88QQKuHk1zI/qe3q/vWt9au
 LlVlhUhn+6HuKRK3wVWiMaHNlFbychaZJGtyZvVICV8gpj2/STktb0MXl1ilulpiV/Zf
 ZL+ykSxuyluILTFp3WJD6ZM2Ux79vUgPcg9FYBVp7HCc9nzlsTEp25Ooc7reCsJUgvA9
 j6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m3srbM8QGWrZhwGq/B370AsvjDk8BediS0HIOgFCe3E=;
 b=Tz+pEjgpRqVxuV7w++tzL1H1+caoWA1huZOo/FdSU57ym1FrWbGHleu6cscS3WVcb9
 fItjxOGEbgV6LZQFzY7MPNWtf0E/KLubSS4pnA2H9nrF0H6DrNV1rz3BfH1d+lMkN4rE
 KveDWx0zLFcjGaZ9ZQ5T1NQsEKwFsfc/ae+ityNx/ebOJiknSp37e14zytalmMboXrUj
 RWMWw8/U70JGcfyu+JCNSeLKSjbIAOsF4J6yCdS/5s220vAGxAAIulUjsjfIHw8OJ/Lm
 jtrrrSQWIh6V4ghVmwQn+o59pXbrkyLdc82vqAZpgjmajTESPBwYlvuEl+v0rKHzlAAr
 x9Fw==
X-Gm-Message-State: AJIora8x1/D33VNUYQ+yXsyyLJx7sU3OyjqWoZ+2RsFQGZbBLxXjbedt
 rK9uqHgTkVZHM/uuM4dWjoGbfuT1jqDes//6Xu0=
X-Google-Smtp-Source: AGRyM1t+rE4Wwngtg5YS4SsXmN+Nyw4Tu9pZHHDpNjJP8e9iQDVbLMC6ySWAMXPj73PzqGNOmA4LXfYcAJyLHSyBKfs=
X-Received: by 2002:a05:6638:14c7:b0:33c:c6ff:4d74 with SMTP id
 l7-20020a05663814c700b0033cc6ff4d74mr2346897jak.254.1656517968775; Wed, 29
 Jun 2022 08:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-12-peterwu.pub@gmail.com>
 <CAHp75Vf2UAVgWS1nu8iwNjESWHQGOMWcNMUFShZ8Q_Qp3fssdQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf2UAVgWS1nu8iwNjESWHQGOMWcNMUFShZ8Q_Qp3fssdQ@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 29 Jun 2022 23:52:33 +0800
Message-ID: <CABtFH5J8GVXQMKmsUs2HfjV-p_rx4gLdCTKsDP_aCJWzE4AVeQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] power: supply: mt6370: Add Mediatek MT6370
 charger driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Sorry for the late reply, I have some questions to ask you below. Thanks!

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E5=87=8C=E6=99=A82:56=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Thu, Jun 23, 2022 at 2:00 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > Add Mediatek MT6370 charger driver.
>
> ...
>
> > +config CHARGER_MT6370
> > +       tristate "Mediatek MT6370 Charger Driver"
> > +       depends on MFD_MT6370
> > +       depends on REGULATOR
> > +       select LINEAR_RANGES
> > +       help
> > +         Say Y here to enable MT6370 Charger Part.
> > +         The device supports High-Accuracy Voltage/Current Regulation,
> > +         Average Input Current Regulation, Battery Temperature Sensing=
,
> > +         Over-Temperature Protection, DPDM Detection for BC1.2.
>
> Module name?
>
> ...
>
> > +#include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
>
> This usually goes after linux/*
>
> > +#include <linux/atomic.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/iio/consumer.h>
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
>
> > +#include <linux/of.h>
>
>
> > +#include <linux/platform_device.h>
> > +#include <linux/power_supply.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/driver.h>
> > +#include <linux/workqueue.h>
>
> ...
>
> > +#define MT6370_MIVR_IBUS_TH            100000          /* 100 mA */
>
> Instead of comment, add proper units.
>
> ...
>
> > +       MT6370_USB_STAT_DCP,
> > +       MT6370_USB_STAT_CDP,
> > +       MT6370_USB_STAT_MAX,
>
> No comma for a terminator line.
>
> ...
>
> > +static inline u32 mt6370_chg_val_to_reg(const struct mt6370_chg_range =
*range,
> > +                                       u32 val)
> > +static inline u32 mt6370_chg_reg_to_val(const struct mt6370_chg_range =
*range,
> > +                                       u8 reg)
>
> I'm wondering if you can use the
> https://elixir.bootlin.com/linux/v5.19-rc3/source/include/linux/linear_ra=
nge.h
> APIs.

Thanks for your helpful comments!
I will refine it in the next patch!

>
> ...
>
> > +       int ret =3D 0;
>
> This seems a redundant assignment, see below.
>
> > +       rcfg->ena_gpiod =3D fwnode_gpiod_get_index(of_fwnode_handle(of)=
,
> > +                                                "enable", 0,
>
> For index =3D=3D 0 don't use _index API.
>
> > +                                                GPIOD_OUT_LOW |
> > +                                                GPIOD_FLAGS_BIT_NONEXC=
LUSIVE,
> > +                                                rdesc->name);
> > +       if (IS_ERR(rcfg->ena_gpiod)) {
> > +               dev_err(priv->dev, "Failed to requeset OTG EN Pin\n");
>
> request
>
> > +               rcfg->ena_gpiod =3D NULL;
>
> So, use _optional and return any errors you got.

These days, I tried to use various APIs in <gpio/consumer.h>, and also
try to use _optional APIs.
But my OTG regulator node is a child node of the charger node, like below.
---------------------------------------------------------------------------=
-
// copy-paste from our mfd dt-binding example
        charger {
          compatible =3D "mediatek,mt6370-charger";
          interrupts =3D <48>, <68>, <6>;
          interrupt-names =3D "attach_i", "uvp_d_evt", "mivr";
          io-channels =3D <&mt6370_adc MT6370_CHAN_IBUS>;

          mt6370_otg_vbus: usb-otg-vbus-regulator {
            regulator-name =3D "mt6370-usb-otg-vbus";
            regulator-min-microvolt =3D <4350000>;
            regulator-max-microvolt =3D <5800000>;
            regulator-min-microamp =3D <500000>;
            regulator-max-microamp =3D <3000000>;
          };
        };
---------------------------------------------------------------------------=
-
Hence, if I use _optional APIs, it will always get NULL.
And, If I use 'gpiod_get_from_of_node' here, this API will only parse
the 'enable' property, not 'enable-gpio' or 'enable-gpios', we need to
add the '-gpio' suffix before we use this API.

Only 'fwnode_gpiod_get_index' can match this case. Although fwnode
parsing is not preferred, 'of_parse_cb' already can guarantee the
callback will only be used by the regulator of_node parsing.

>
> > +       } else {
> > +               val =3D MT6370_OPA_MODE_MASK | MT6370_OTG_PIN_EN_MASK;
> > +               ret =3D regmap_update_bits(priv->regmap, MT6370_REG_CHG=
_CTRL1,
> > +                                        val, val);
> > +               if (ret)
> > +                       dev_err(priv->dev, "Failed to set otg bits\n");
> > +       }
>
> ...
>
> > +       irq_num =3D platform_get_irq_byname(pdev, irq_name);
>
> > +
>
> Unwanted blank line.
>
> > +       if (irq_num < 0) {
>
> > +               dev_err(priv->dev, "Failed to get platform resource\n")=
;
>
> Isn't it printed by the call?
>
> > +       } else {
> > +               if (en)
> > +                       enable_irq(irq_num);
> > +               else
> > +                       disable_irq_nosync(irq_num);
> > +       }
>
> ...
>
> > +toggle_cfo_exit:
>
> The useless label.
>
> > +       return ret;
> > +}
>
> ...
>
> > +       ret =3D mt6370_chg_get_online(priv, val);
> > +       if (!val->intval) {
>
> No error check?

I replace "mt6370_chg_get_online()" with "power_supply_get_property()"
and add some error check.
Could it meet your expectations??

>
> > +               val->intval =3D POWER_SUPPLY_STATUS_DISCHARGING;
> > +               return 0;
> > +       }
>
> ...
>
> > +static int mt6370_chg_set_online(struct mt6370_priv *priv,
> > +                                const union power_supply_propval *val)
> > +{
> > +       int attach;
> > +       u32 pwr_rdy =3D !!val->intval;
> > +
> > +       mutex_lock(&priv->attach_lock);
> > +       attach =3D atomic_read(&priv->attach);
> > +       if (pwr_rdy =3D=3D !!attach) {
> > +               dev_err(priv->dev, "pwr_rdy is same(%d)\n", pwr_rdy);
> > +               mutex_unlock(&priv->attach_lock);
> > +               return 0;
> > +       }
> > +
> > +       atomic_set(&priv->attach, pwr_rdy);
> > +       mutex_unlock(&priv->attach_lock);
> > +
> > +       if (!queue_work(priv->wq, &priv->bc12_work))
> > +               dev_err(priv->dev, "bc12 work has already queued\n");
> > +
> > +       return 0;
>
> > +
>
> Unwanted blank line.
>
> > +}
>
> > +static int mt6370_chg_get_property(struct power_supply *psy,
> > +                                  enum power_supply_property psp,
> > +                                  union power_supply_propval *val)
> > +{
> > +       struct mt6370_priv *priv =3D power_supply_get_drvdata(psy);
> > +       int ret =3D 0;
> > +
> > +       switch (psp) {
> > +       case POWER_SUPPLY_PROP_ONLINE:
> > +               ret =3D mt6370_chg_get_online(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_STATUS:
> > +               ret =3D mt6370_chg_get_status(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_CHARGE_TYPE:
> > +               ret =3D mt6370_chg_get_charge_type(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> > +               ret =3D mt6370_chg_get_ichg(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
> > +               ret =3D mt6370_chg_get_max_ichg(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
> > +               ret =3D mt6370_chg_get_cv(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX:
> > +               ret =3D mt6370_chg_get_max_cv(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> > +               ret =3D mt6370_chg_get_aicr(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
> > +               ret =3D mt6370_chg_get_mivr(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_PRECHARGE_CURRENT:
> > +               ret =3D mt6370_chg_get_iprechg(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
> > +               ret =3D mt6370_chg_get_ieoc(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_TYPE:
> > +               val->intval =3D priv->psy_desc->type;
> > +               break;
> > +       case POWER_SUPPLY_PROP_USB_TYPE:
> > +               val->intval =3D priv->psy_usb_type;
> > +               break;
> > +       default:
> > +               ret =3D -EINVAL;
> > +               break;
> > +       }
> > +
> > +       return ret;
>
> In all cases, return directly.
>
> > +}
>
> ...
>
> > +       switch (psp) {
> > +       case POWER_SUPPLY_PROP_ONLINE:
> > +               ret =3D mt6370_chg_set_online(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> > +               ret =3D mt6370_chg_set_ichg(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
> > +               ret =3D mt6370_chg_set_cv(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> > +               ret =3D mt6370_chg_set_aicr(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
> > +               ret =3D mt6370_chg_set_mivr(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_PRECHARGE_CURRENT:
> > +               ret =3D mt6370_chg_set_iprechg(priv, val);
> > +               break;
> > +       case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
> > +               ret =3D mt6370_chg_set_ieoc(priv, val);
> > +               break;
> > +       default:
> > +               ret =3D -EINVAL;
> > +       }
> > +       return ret;
>
> As per above.
>
> ...
>
> > +       for (i =3D 0; i < F_MAX; i++) {
> > +               priv->rmap_fields[i] =3D devm_regmap_field_alloc(priv->=
dev,
> > +                                                              priv->re=
gmap,
> > +                                                              fds[i].f=
ield);
> > +               if (IS_ERR(priv->rmap_fields[i])) {
> > +                       dev_err(priv->dev,
> > +                               "Failed to allocate regmap field [%s]\n=
",
> > +                               fds[i].name);
> > +                       return PTR_ERR(priv->rmap_fields[i]);
>
> return dev_err_probe();
>
> > +               }
> > +       }
>
> ...
>
> > +       mutex_init(&priv->attach_lock);
> > +       atomic_set(&priv->attach, 0);
>
> Why not atomic_init() ?
> But yeah, usage of it and other locking mechanisms in this driver are
> questionable.

I will refine it in the next patch!

>
> ...
>
> > +       /* ICHG/IEOC Workaroud, ICHG can not be set less than 900mA */
>
> Workaround
>
> ...
>
> > +       return IS_ERR(priv->rdev) ? PTR_ERR(priv->rdev) : 0;
>
> PTR_ERR_OR_ZERO()
>
> ...
>
> > +               .of_node =3D priv->dev->of_node,
>
> dev_of_node() ?
>
> > +       };
> > +
> > +       priv->psy_desc =3D &mt6370_chg_psy_desc;
> > +       priv->psy_desc->name =3D dev_name(priv->dev);
> > +       priv->psy =3D devm_power_supply_register(priv->dev, priv->psy_d=
esc, &cfg);
> > +
> > +       return IS_ERR(priv->psy) ? PTR_ERR(priv->psy) : 0;
>
> PTR_ERR_OR_ZERO()
>
> > +}
>
> ...
>
> > +static irqreturn_t mt6370_attach_i_handler(int irq, void *data)
> > +{
> > +       struct mt6370_priv *priv =3D data;
> > +       u32 otg_en;
> > +       int ret;
> > +
> > +       /* Check in otg mode or not */
> > +       ret =3D mt6370_chg_field_get(priv, F_BOOST_STAT, &otg_en);
> > +       if (ret < 0) {
> > +               dev_err(priv->dev, "failed to get otg state\n");
> > +               return IRQ_HANDLED;
>
> Handled error?
>
> > +       }
> > +
> > +       if (otg_en)
> > +               return IRQ_HANDLED;
>
> > +       mutex_lock(&priv->attach_lock);
> > +       atomic_set(&priv->attach, MT6370_ATTACH_STAT_ATTACH_BC12_DONE);
> > +       mutex_unlock(&priv->attach_lock);
>
> Mutex around atomic?! It's interesting...

I will revise it in the next patch.

>
> > +       if (!queue_work(priv->wq, &priv->bc12_work))
> > +               dev_err(priv->dev, "bc12 work has already queued\n");
> > +
> > +       return IRQ_HANDLED;
> > +}
>
> ...
>
> > +       for (i =3D 0; i < ARRAY_SIZE(mt6370_chg_irqs); i++) {
> > +               ret =3D platform_get_irq_byname(to_platform_device(priv=
->dev),
> > +                                             mt6370_chg_irqs[i].name);
> > +               if (ret < 0) {
> > +                       dev_err(priv->dev, "Failed to get irq %s\n",
> > +                               mt6370_chg_irqs[i].name);
>
> Isn't the same printed by the above call?

well... yes they are similar, I will remove one of them in the next patch.

>
> > +                       return ret;
> > +               }
> > +
> > +               ret =3D devm_request_threaded_irq(priv->dev, ret, NULL,
> > +                                               mt6370_chg_irqs[i].hand=
ler,
> > +                                               IRQF_TRIGGER_FALLING,
> > +                                               dev_name(priv->dev),
> > +                                               priv);
> > +
> > +               if (ret < 0) {
> > +                       dev_err(priv->dev, "Failed to request irq %s\n"=
,
> > +                               mt6370_chg_irqs[i].name);
> > +                       return ret;
>
> return dev_err_probe();
>
> > +               }
> > +       }
>
> ...
>
> > +static int mt6370_chg_probe(struct platform_device *pdev)
> > +{
>
>
> Use return dev_err_probe(...); pattern.
>
> > +probe_out:
> > +       destroy_workqueue(priv->wq);
> > +       mutex_destroy(&priv->attach_lock);
>
> I don't see clearly the initialization of these in the ->probe().
> Besides that, does destroy_workque() synchronize the actual queue(s)?
>
> Mixing devm_ and non-devm_ may lead to a wrong release order that's
> why it is better to see allocating and destroying resources in one
> function (they may be wrapped, but should be both of them, seems like
> you have done it only for the first parts).

OK, I will try to revise these in the next patch!

>
> > +       return ret;
> > +}
>
> ...
>
> > +static int mt6370_chg_remove(struct platform_device *pdev)
> > +{
> > +       struct mt6370_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > +       if (priv) {
>
> Can you describe when this condition can be false?

well... I will remove it in the next patch, sorry for making this
stupid mistake...

>
> > +               mt6370_chg_enable_irq(priv, "mivr", false);
> > +               cancel_delayed_work_sync(&priv->mivr_dwork);
> > +               destroy_workqueue(priv->wq);
> > +               mutex_destroy(&priv->attach_lock);
> > +       }
> > +
> > +       return 0;
> > +}
>
> ...
>
> > +static struct platform_driver mt6370_chg_driver =3D {
> > +       .probe =3D mt6370_chg_probe,
> > +       .remove =3D mt6370_chg_remove,
> > +       .driver =3D {
> > +               .name =3D "mt6370-charger",
> > +               .of_match_table =3D of_match_ptr(mt6370_chg_of_match),
>
> No good use of of_match_ptr(), please drop it.
>
> > +       },
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko

Thanks for your review!

Best regards,
ChiaEn Wu
