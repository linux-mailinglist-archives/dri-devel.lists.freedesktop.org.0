Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0045731137
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 09:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45DA10E493;
	Thu, 15 Jun 2023 07:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6581891CC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 08:44:14 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7608aae9355so165861385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686732253; x=1689324253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMJjMLsI8EkzKxOp3Ha0kSO9fsjkHtognvUI4F3yvRk=;
 b=fXTwC5Hw0iRKXxndm0MERjkTdkb4q1G9m3h/CNWTKi3oZz0/Rl+75YX1nbhIPvF/5w
 VLNNSlNKtekUm7GIbYA2K4Qg8ROwceaeuQngQuqswad+NdDOIQgtzdwq5FIlArVxjnEg
 87RaxeSKwCBrtYoi7V3oY0U3Q9kiRTPmtd/5/JPPHqucxVYbp3qLh5yRhSTXmYRuDa6P
 Gh7J0JJDbgss5XRuv30S/g1JucR/z+EtyjIopI3Ck0LnLEpuZi5Ul9AcwjDoauxqBaKT
 kFkptLxFt5/YQ94EEVdFl8bogOkO4yr7i3uES9eXtQzKT7sEEPuEyNG3fTR2auTT/IUn
 fYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686732253; x=1689324253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FMJjMLsI8EkzKxOp3Ha0kSO9fsjkHtognvUI4F3yvRk=;
 b=IUWTLMLJdpPmszn5Q/RYfRSHVRNcRLFWerRXkjhOb52wgwETKBKBkuIYTP4epEMbeL
 oQu/FnIW9rruU+52IH/TbrSLdtG/l7ldngnAqZ5qY2mvIYp3/owHUiSuSxgBLBSOa713
 6xGNiDH0StCmEm6zH8WYF6p+PYH4fcEv7dKmddlGM2x2Q8WGnO6XUgBOkW5PCZ0C9Cpc
 HM4KlMHqMweNWBtiJnUTS2yBWMJcfVHpiyC6dodPxbMvK8OIahs2an4jImCJBAByP7ag
 fTuXhE1coeZX/sqdhlS7pOY5Uh2qTomloprGOobZpvhOyfmwJbfilZfQ+J6tVQ2JLbzM
 7GFw==
X-Gm-Message-State: AC+VfDxVtgjOGK+n4RPE1sLHYC5J0LvqdFVqggb7HrEZacCJKHxj3WUL
 xZt1O9L/s2m7XvKRAYiqij0vgQakWpsR9aOO+qo=
X-Google-Smtp-Source: ACHHUZ5yJnFu/jdGktS6LR7LQZZP+IPneVZBGraQSBTzYLDnIkMXSoV8+/QhrSaW17Xk9nKRXwsfB3tBRGV9dzTzSw4=
X-Received: by 2002:a37:ad0e:0:b0:75d:5398:fc70 with SMTP id
 f14-20020a37ad0e000000b0075d5398fc70mr12655962qkm.38.1686732253293; Wed, 14
 Jun 2023 01:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-2-9b6dc5536b17@linaro.org>
In-Reply-To: <20230430-nokia770-regression-v4-2-9b6dc5536b17@linaro.org>
From: Peter Vasil <petervasil@gmail.com>
Date: Wed, 14 Jun 2023 10:44:01 +0200
Message-ID: <CAFwpezXJkXRr0Es=owr6fJ8BB_DETYPWdj_EzLbw9+5d7YOxxQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM/mmc: Convert old mmci-omap to GPIO descriptors
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 15 Jun 2023 07:46:51 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Tony Lindgren <tony@atomide.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 8, 2023 at 11:21=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> A recent change to the OMAP driver making it use a dynamic GPIO
> base created problems with some old OMAP1 board files, among
> them Nokia 770, SX1 and also the OMAP2 Nokia n8x0.
>
> Fix up all instances of GPIOs being used for the MMC driver
> by pushing the handling of power, slot selection and MMC
> "cover" into the driver as optional GPIOs.
>
> This is maybe not the most perfect solution as the MMC
> framework have some central handlers for some of the
> stuff, but it at least makes the situtation better and
> solves the immediate issue.
>
> Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/mach-omap1/board-nokia770.c   | 43 ++++++-----------
>  arch/arm/mach-omap1/board-sx1-mmc.c    |  1 -
>  arch/arm/mach-omap2/board-n8x0.c       | 85 +++++++++++-----------------=
------
>  drivers/mmc/host/omap.c                | 46 +++++++++++++++++-
>  include/linux/platform_data/mmc-omap.h |  2 -
>  5 files changed, 83 insertions(+), 94 deletions(-)
>
> diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/b=
oard-nokia770.c
> index 8a1f2572deea..218c928f71b3 100644
> --- a/arch/arm/mach-omap1/board-nokia770.c
> +++ b/arch/arm/mach-omap1/board-nokia770.c
> @@ -183,27 +183,23 @@ static struct omap_usb_config nokia770_usb_config _=
_initdata =3D {
>
>  #if IS_ENABLED(CONFIG_MMC_OMAP)
>
> -#define NOKIA770_GPIO_MMC_POWER                41
> -#define NOKIA770_GPIO_MMC_SWITCH       23
> -
> -static int nokia770_mmc_set_power(struct device *dev, int slot, int powe=
r_on,
> -                               int vdd)
> -{
> -       gpio_set_value(NOKIA770_GPIO_MMC_POWER, power_on);
> -       return 0;
> -}
> -
> -static int nokia770_mmc_get_cover_state(struct device *dev, int slot)
> -{
> -       return gpio_get_value(NOKIA770_GPIO_MMC_SWITCH);
> -}
> +static struct gpiod_lookup_table nokia770_mmc_gpio_table =3D {
> +       .dev_id =3D "mmci-omap",
> +       .table =3D {
> +               /* Slot index 0, VSD power, GPIO 41 */
> +               GPIO_LOOKUP_IDX("gpio-32-47", 9,
> +                               "vsd", 0, GPIO_ACTIVE_HIGH),
> +               /* Slot index 0, switch, GPIO 23 */
> +               GPIO_LOOKUP_IDX("gpio-16-31", 7,
> +                               "cover", 0, GPIO_ACTIVE_HIGH),
> +               { }
> +       },
> +};
>
>  static struct omap_mmc_platform_data nokia770_mmc2_data =3D {
>         .nr_slots                       =3D 1,
>         .max_freq                       =3D 12000000,
>         .slots[0]       =3D {
> -               .set_power              =3D nokia770_mmc_set_power,
> -               .get_cover_state        =3D nokia770_mmc_get_cover_state,
>                 .ocr_mask               =3D MMC_VDD_32_33|MMC_VDD_33_34,
>                 .name                   =3D "mmcblk",
>         },
> @@ -213,20 +209,7 @@ static struct omap_mmc_platform_data *nokia770_mmc_d=
ata[OMAP16XX_NR_MMC];
>
>  static void __init nokia770_mmc_init(void)
>  {
> -       int ret;
> -
> -       ret =3D gpio_request(NOKIA770_GPIO_MMC_POWER, "MMC power");
> -       if (ret < 0)
> -               return;
> -       gpio_direction_output(NOKIA770_GPIO_MMC_POWER, 0);
> -
> -       ret =3D gpio_request(NOKIA770_GPIO_MMC_SWITCH, "MMC cover");
> -       if (ret < 0) {
> -               gpio_free(NOKIA770_GPIO_MMC_POWER);
> -               return;
> -       }
> -       gpio_direction_input(NOKIA770_GPIO_MMC_SWITCH);
> -
> +       gpiod_add_lookup_table(&nokia770_mmc_gpio_table);
>         /* Only the second MMC controller is used */
>         nokia770_mmc_data[1] =3D &nokia770_mmc2_data;
>         omap1_init_mmc(nokia770_mmc_data, OMAP16XX_NR_MMC);
> diff --git a/arch/arm/mach-omap1/board-sx1-mmc.c b/arch/arm/mach-omap1/bo=
ard-sx1-mmc.c
> index f1c160924dfe..f183a8448a7b 100644
> --- a/arch/arm/mach-omap1/board-sx1-mmc.c
> +++ b/arch/arm/mach-omap1/board-sx1-mmc.c
> @@ -9,7 +9,6 @@
>   * Copyright (C) 2007 Instituto Nokia de Tecnologia - INdT
>   */
>
> -#include <linux/gpio.h>
>  #include <linux/platform_device.h>
>
>  #include "hardware.h"
> diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board=
-n8x0.c
> index 3353b0a923d9..baa2f0341aed 100644
> --- a/arch/arm/mach-omap2/board-n8x0.c
> +++ b/arch/arm/mach-omap2/board-n8x0.c
> @@ -11,6 +11,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio.h>
> +#include <linux/gpio/machine.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> @@ -170,22 +171,32 @@ static struct spi_board_info n800_spi_board_info[] =
__initdata =3D {
>   * GPIO23 and GPIO9            slot 2 EMMC on N810
>   *
>   */
> -#define N8X0_SLOT_SWITCH_GPIO  96
> -#define N810_EMMC_VSD_GPIO     23
> -#define N810_EMMC_VIO_GPIO     9
> -
>  static int slot1_cover_open;
>  static int slot2_cover_open;
>  static struct device *mmc_device;
>
> -static int n8x0_mmc_switch_slot(struct device *dev, int slot)
> -{
> -#ifdef CONFIG_MMC_DEBUG
> -       dev_dbg(dev, "Choose slot %d\n", slot + 1);
> -#endif
> -       gpio_set_value(N8X0_SLOT_SWITCH_GPIO, slot);
> -       return 0;
> -}
> +static struct gpiod_lookup_table nokia8xx_mmc_gpio_table =3D {
> +       .dev_id =3D "mmci-omap",
> +       .table =3D {
> +               /* Slot switch, GPIO 96 */
> +               GPIO_LOOKUP("gpio-80-111", 16,
> +                           "switch", GPIO_ACTIVE_HIGH),
> +               { }
> +       },
> +};
> +
> +static struct gpiod_lookup_table nokia810_mmc_gpio_table =3D {
> +       .dev_id =3D "mmci-omap",
> +       .table =3D {
> +               /* Slot index 1, VSD power, GPIO 23 */
> +               GPIO_LOOKUP_IDX("gpio-16-31", 7,
> +                               "vsd", 1, GPIO_ACTIVE_HIGH),

Hello everyone,
not sure if anyone noticed this already, or if I understand it
wrong... shouldn't the "vsd" name in following lookup descriptor
actually be "vio"?

> +               /* Slot index 1, VIO power, GPIO 9 */
> +               GPIO_LOOKUP_IDX("gpio-0-15", 9,
> +                               "vsd", 1, GPIO_ACTIVE_HIGH),

At least the driver code further down seems to use that name while
n8x0 board file does not define it anywhere.
I've noticed it in the pull request already, so it looks like it has
not been fixed yet (if it's actually wrong?).
Regards,
Peter

> +               { }
> +       },
> +};
>
>  static int n8x0_mmc_set_power_menelaus(struct device *dev, int slot,
>                                         int power_on, int vdd)
> @@ -256,31 +267,13 @@ static int n8x0_mmc_set_power_menelaus(struct devic=
e *dev, int slot,
>         return 0;
>  }
>
> -static void n810_set_power_emmc(struct device *dev,
> -                                        int power_on)
> -{
> -       dev_dbg(dev, "Set EMMC power %s\n", power_on ? "on" : "off");
> -
> -       if (power_on) {
> -               gpio_set_value(N810_EMMC_VSD_GPIO, 1);
> -               msleep(1);
> -               gpio_set_value(N810_EMMC_VIO_GPIO, 1);
> -               msleep(1);
> -       } else {
> -               gpio_set_value(N810_EMMC_VIO_GPIO, 0);
> -               msleep(50);
> -               gpio_set_value(N810_EMMC_VSD_GPIO, 0);
> -               msleep(50);
> -       }
> -}
> -
>  static int n8x0_mmc_set_power(struct device *dev, int slot, int power_on=
,
>                               int vdd)
>  {
>         if (board_is_n800() || slot =3D=3D 0)
>                 return n8x0_mmc_set_power_menelaus(dev, slot, power_on, v=
dd);
>
> -       n810_set_power_emmc(dev, power_on);
> +       /* The n810 power will be handled by GPIO code in the driver */
>
>         return 0;
>  }
> @@ -418,13 +411,6 @@ static void n8x0_mmc_shutdown(struct device *dev)
>  static void n8x0_mmc_cleanup(struct device *dev)
>  {
>         menelaus_unregister_mmc_callback();
> -
> -       gpio_free(N8X0_SLOT_SWITCH_GPIO);
> -
> -       if (board_is_n810()) {
> -               gpio_free(N810_EMMC_VSD_GPIO);
> -               gpio_free(N810_EMMC_VIO_GPIO);
> -       }
>  }
>
>  /*
> @@ -433,7 +419,6 @@ static void n8x0_mmc_cleanup(struct device *dev)
>   */
>  static struct omap_mmc_platform_data mmc1_data =3D {
>         .nr_slots                       =3D 0,
> -       .switch_slot                    =3D n8x0_mmc_switch_slot,
>         .init                           =3D n8x0_mmc_late_init,
>         .cleanup                        =3D n8x0_mmc_cleanup,
>         .shutdown                       =3D n8x0_mmc_shutdown,
> @@ -463,14 +448,9 @@ static struct omap_mmc_platform_data mmc1_data =3D {
>
>  static struct omap_mmc_platform_data *mmc_data[OMAP24XX_NR_MMC];
>
> -static struct gpio n810_emmc_gpios[] __initdata =3D {
> -       { N810_EMMC_VSD_GPIO, GPIOF_OUT_INIT_LOW,  "MMC slot 2 Vddf" },
> -       { N810_EMMC_VIO_GPIO, GPIOF_OUT_INIT_LOW,  "MMC slot 2 Vdd"  },
> -};
> -
>  static void __init n8x0_mmc_init(void)
>  {
> -       int err;
> +       gpiod_add_lookup_table(&nokia8xx_mmc_gpio_table);
>
>         if (board_is_n810()) {
>                 mmc1_data.slots[0].name =3D "external";
> @@ -483,20 +463,7 @@ static void __init n8x0_mmc_init(void)
>                  */
>                 mmc1_data.slots[1].name =3D "internal";
>                 mmc1_data.slots[1].ban_openended =3D 1;
> -       }
> -
> -       err =3D gpio_request_one(N8X0_SLOT_SWITCH_GPIO, GPIOF_OUT_INIT_LO=
W,
> -                              "MMC slot switch");
> -       if (err)
> -               return;
> -
> -       if (board_is_n810()) {
> -               err =3D gpio_request_array(n810_emmc_gpios,
> -                                        ARRAY_SIZE(n810_emmc_gpios));
> -               if (err) {
> -                       gpio_free(N8X0_SLOT_SWITCH_GPIO);
> -                       return;
> -               }
> +               gpiod_add_lookup_table(&nokia810_mmc_gpio_table);
>         }
>
>         mmc1_data.nr_slots =3D 2;
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index ce78edfb402b..a14af21f12da 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -26,6 +26,7 @@
>  #include <linux/clk.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/platform_data/mmc-omap.h>
>
>
> @@ -111,6 +112,9 @@ struct mmc_omap_slot {
>         struct mmc_request      *mrq;
>         struct mmc_omap_host    *host;
>         struct mmc_host         *mmc;
> +       struct gpio_desc        *vsd;
> +       struct gpio_desc        *vio;
> +       struct gpio_desc        *cover;
>         struct omap_mmc_slot_data *pdata;
>  };
>
> @@ -133,6 +137,7 @@ struct mmc_omap_host {
>         int                     irq;
>         unsigned char           bus_mode;
>         unsigned int            reg_shift;
> +       struct gpio_desc        *slot_switch;
>
>         struct work_struct      cmd_abort_work;
>         unsigned                abort:1;
> @@ -216,8 +221,13 @@ static void mmc_omap_select_slot(struct mmc_omap_slo=
t *slot, int claimed)
>
>         if (host->current_slot !=3D slot) {
>                 OMAP_MMC_WRITE(host, CON, slot->saved_con & 0xFC00);
> -               if (host->pdata->switch_slot !=3D NULL)
> -                       host->pdata->switch_slot(mmc_dev(slot->mmc), slot=
->id);
> +               if (host->slot_switch)
> +                       /*
> +                        * With two slots and a simple GPIO switch, setti=
ng
> +                        * the GPIO to 0 selects slot ID 0, setting it to=
 1
> +                        * selects slot ID 1.
> +                        */
> +                       gpiod_set_value(host->slot_switch, slot->id);
>                 host->current_slot =3D slot;
>         }
>
> @@ -297,6 +307,9 @@ static void mmc_omap_release_slot(struct mmc_omap_slo=
t *slot, int clk_enabled)
>  static inline
>  int mmc_omap_cover_is_open(struct mmc_omap_slot *slot)
>  {
> +       /* If we have a GPIO then use that */
> +       if (slot->cover)
> +               return gpiod_get_value(slot->cover);
>         if (slot->pdata->get_cover_state)
>                 return slot->pdata->get_cover_state(mmc_dev(slot->mmc),
>                                                     slot->id);
> @@ -1106,6 +1119,11 @@ static void mmc_omap_set_power(struct mmc_omap_slo=
t *slot, int power_on,
>
>         host =3D slot->host;
>
> +       if (slot->vsd)
> +               gpiod_set_value(slot->vsd, power_on);
> +       if (slot->vio)
> +               gpiod_set_value(slot->vio, power_on);
> +
>         if (slot->pdata->set_power !=3D NULL)
>                 slot->pdata->set_power(mmc_dev(slot->mmc), slot->id, powe=
r_on,
>                                         vdd);
> @@ -1240,6 +1258,23 @@ static int mmc_omap_new_slot(struct mmc_omap_host =
*host, int id)
>         slot->power_mode =3D MMC_POWER_UNDEFINED;
>         slot->pdata =3D &host->pdata->slots[id];
>
> +       /* Check for some optional GPIO controls */
> +       slot->vsd =3D gpiod_get_index_optional(host->dev, "vsd",
> +                                            id, GPIOD_OUT_LOW);
> +       if (IS_ERR(slot->vsd))
> +               return dev_err_probe(host->dev, PTR_ERR(slot->vsd),
> +                                    "error looking up VSD GPIO\n");
> +       slot->vio =3D gpiod_get_index_optional(host->dev, "vio",
> +                                            id, GPIOD_OUT_LOW);
> +       if (IS_ERR(slot->vio))
> +               return dev_err_probe(host->dev, PTR_ERR(slot->vio),
> +                                    "error looking up VIO GPIO\n");
> +       slot->cover =3D gpiod_get_index_optional(host->dev, "cover",
> +                                               id, GPIOD_IN);
> +       if (IS_ERR(slot->cover))
> +               return dev_err_probe(host->dev, PTR_ERR(slot->cover),
> +                                    "error looking up cover switch GPIO\=
n");
> +
>         host->slots[id] =3D slot;
>
>         mmc->caps =3D 0;
> @@ -1349,6 +1384,13 @@ static int mmc_omap_probe(struct platform_device *=
pdev)
>         if (IS_ERR(host->virt_base))
>                 return PTR_ERR(host->virt_base);
>
> +       host->slot_switch =3D gpiod_get_optional(host->dev, "switch",
> +                                              GPIOD_OUT_LOW);
> +       if (IS_ERR(host->slot_switch))
> +               return dev_err_probe(host->dev, PTR_ERR(host->slot_switch=
),
> +                                    "error looking up slot switch GPIO\n=
");
> +
> +
>         INIT_WORK(&host->slot_release_work, mmc_omap_slot_release_work);
>         INIT_WORK(&host->send_stop_work, mmc_omap_send_stop_work);
>
> diff --git a/include/linux/platform_data/mmc-omap.h b/include/linux/platf=
orm_data/mmc-omap.h
> index 91051e9907f3..054d0c3c5ec5 100644
> --- a/include/linux/platform_data/mmc-omap.h
> +++ b/include/linux/platform_data/mmc-omap.h
> @@ -20,8 +20,6 @@ struct omap_mmc_platform_data {
>          * maximum frequency on the MMC bus */
>         unsigned int max_freq;
>
> -       /* switch the bus to a new slot */
> -       int (*switch_slot)(struct device *dev, int slot);
>         /* initialize board-specific MMC functionality, can be NULL if
>          * not supported */
>         int (*init)(struct device *dev);
>
> --
> 2.34.1
>
