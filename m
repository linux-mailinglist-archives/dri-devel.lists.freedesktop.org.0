Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD0516B21
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 09:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7514110F38D;
	Mon,  2 May 2022 07:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF46B10F38C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 07:08:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB326B8114D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 07:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E18C385B6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 07:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651475290;
 bh=X5DDZ5cu8Ec0v5TpZDEASVCpiKVJTD3WHl3xILny+5s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SVSQCk9b/yJrYkVOSPoGUI4vnfAzU7nEtNHFitXQpLGMN9oYAjP1/wpjFoaNO1q4/
 JDUt+vBwhy3DxPUejwI6hPKlYXdLEfcgkkLkjhmp2e8XTdjVjoOLuwOr53R1FZGJ1/
 5tuDH4W3rPocK6jU3aFTlL4D+ulefd5zs9t6+YWIZkW4O0bVqlQAberIFooGyuz8Ag
 oxEUXLAxi9cvhJvLB+O/UcfKPlZ2VbBBCtOnl2nJKJHisU0yHxer1FazYucIq+D2nA
 At7LDRdDFgXSPZjdwDbfTTZeupQpwTFKTj1i7WpmNHGWQOP7D2J90cdoDn6Qal551+
 X238PyYu+O6xA==
Received: by mail-yb1-f169.google.com with SMTP id i38so24520380ybj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 00:08:10 -0700 (PDT)
X-Gm-Message-State: AOAM530Ppzqx8hKtfwwTGC0M+VsM+RIhkFbBaoatUve0fMUde5EBYo01
 g+r1Jkfop9UEaAOCAtiZPDbTyu//EMO++5bXnEQ=
X-Google-Smtp-Source: ABdhPJzh1sjDRx5OtKZisw0kK2teD3n3NIRAbZSwmRkDNwDLe6EnG5RDGjvENlJGwWWdkEOx8bePQy1Q38g26+xkjEA=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr9381815ybx.472.1651475288728; Mon, 02
 May 2022 00:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
In-Reply-To: <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 2 May 2022 09:07:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
Message-ID: <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 1, 2022 at 11:41 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> (...)
> > +static struct gpiod_lookup_table hx4700_audio_gpio_table = {
> > +       .dev_id = "hx4700-audio",
> > +       .table = {
> > +               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
> > +                           "earphone-ndet", GPIO_ACTIVE_HIGH),
>
> This looks wrong. The n in nDET in the end of the name of the GPIO line
> means active low does it not?
>
> What I usually do when I see this is to properly set it to
> GPIO_ACTIVE_LOW in the descriptor table, then invert the logic
> where it's getting used.
>
> Also rename to earphone-det instead of -ndet

Thanks for taking a look! I changed it now, but I don't know if
I got the correct number of inversions in the end. How does this look?

          Arnd

commit 9d452c9cbee59fc58c940b5f7ae5a40579aab0d2
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Sep 11 14:27:13 2019 +0200

    ARM: pxa: hx4700: use gpio descriptors for audio

    The audio driver should not use a hardwired gpio number
    from the header. Change it to use a lookup table.

    Cc: Philipp Zabel <philipp.zabel@gmail.com>
    Cc: Paul Parsons <lost.distance@yahoo.com>
    Acked-by: Mark Brown <broonie@kernel.org>
    Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
    Cc: alsa-devel@alsa-project.org
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/arm/mach-pxa/hx4700-pcmcia.c
b/arch/arm/mach-pxa/hx4700-pcmcia.c
index e8acbfc9ef6c..e2331dfe427d 100644
--- a/arch/arm/mach-pxa/hx4700-pcmcia.c
+++ b/arch/arm/mach-pxa/hx4700-pcmcia.c
@@ -10,7 +10,7 @@
 #include <linux/irq.h>

 #include <asm/mach-types.h>
-#include <mach/hx4700.h>
+#include "hx4700.h"

 #include <pcmcia/soc_common.h>

diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
index 140a44cb2989..2ae06edf413c 100644
--- a/arch/arm/mach-pxa/hx4700.c
+++ b/arch/arm/mach-pxa/hx4700.c
@@ -41,7 +41,7 @@

 #include "pxa27x.h"
 #include "addr-map.h"
-#include <mach/hx4700.h>
+#include "hx4700.h"
 #include <linux/platform_data/irda-pxaficp.h>

 #include <sound/ak4641.h>
@@ -834,6 +834,19 @@ static struct i2c_board_info i2c_board_info[]
__initdata = {
        },
 };

+static struct gpiod_lookup_table hx4700_audio_gpio_table = {
+       .dev_id = "hx4700-audio",
+       .table = {
+               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
+                           "earphone-det", GPIO_ACTIVE_LOW),
+               GPIO_LOOKUP("gpio-pxa", GPIO92_HX4700_HP_DRIVER,
+                           "hp-driver", GPIO_ACTIVE_HIGH),
+               GPIO_LOOKUP("gpio-pxa", GPIO107_HX4700_SPK_nSD,
+                           "spk-sd", GPIO_ACTIVE_LOW),
+               { },
+       },
+};
+
 static struct platform_device audio = {
        .name   = "hx4700-audio",
        .id     = -1,
@@ -895,6 +908,7 @@ static void __init hx4700_init(void)

        gpiod_add_lookup_table(&bq24022_gpiod_table);
        gpiod_add_lookup_table(&gpio_vbus_gpiod_table);
+       gpiod_add_lookup_table(&hx4700_audio_gpio_table);
        platform_add_devices(devices, ARRAY_SIZE(devices));
        pwm_add_table(hx4700_pwm_lookup, ARRAY_SIZE(hx4700_pwm_lookup));

diff --git a/arch/arm/mach-pxa/include/mach/hx4700.h
b/arch/arm/mach-pxa/hx4700.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/hx4700.h
rename to arch/arm/mach-pxa/hx4700.h
index 0c30e6d9c660..ce2db33989e1 100644
--- a/arch/arm/mach-pxa/include/mach/hx4700.h
+++ b/arch/arm/mach-pxa/hx4700.h
@@ -10,7 +10,7 @@

 #include <linux/gpio.h>
 #include <linux/mfd/asic3.h>
-#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
+#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */

 #define HX4700_ASIC3_GPIO_BASE PXA_NR_BUILTIN_GPIO
 #define HX4700_EGPIO_BASE      (HX4700_ASIC3_GPIO_BASE + ASIC3_NUM_GPIOS)
diff --git a/sound/soc/pxa/hx4700.c b/sound/soc/pxa/hx4700.c
index 7334fac758de..a0734b742322 100644
--- a/sound/soc/pxa/hx4700.c
+++ b/sound/soc/pxa/hx4700.c
@@ -10,7 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>

 #include <sound/core.h>
 #include <sound/jack.h>
@@ -18,10 +18,10 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>

-#include <mach/hx4700.h>
 #include <asm/mach-types.h>
 #include "pxa2xx-i2s.h"

+static struct gpio_desc *gpiod_hp_driver, *gpiod_spk_sd;
 static struct snd_soc_jack hs_jack;

 /* Headphones jack detection DAPM pin */
@@ -40,9 +40,7 @@ static struct snd_soc_jack_pin hs_jack_pin[] = {

 /* Headphones jack detection GPIO */
 static struct snd_soc_jack_gpio hs_jack_gpio = {
-       .gpio           = GPIO75_HX4700_EARPHONE_nDET,
-       .invert         = true,
-       .name           = "hp-gpio",
+       .name           = "earphone-det",
        .report         = SND_JACK_HEADPHONE,
        .debounce_time  = 200,
 };
@@ -81,14 +79,14 @@ static const struct snd_soc_ops hx4700_ops = {
 static int hx4700_spk_power(struct snd_soc_dapm_widget *w,
                            struct snd_kcontrol *k, int event)
 {
-       gpio_set_value(GPIO107_HX4700_SPK_nSD, !!SND_SOC_DAPM_EVENT_ON(event));
+       gpiod_set_value(gpiod_spk_sd, !!SND_SOC_DAPM_EVENT_ON(event));
        return 0;
 }

 static int hx4700_hp_power(struct snd_soc_dapm_widget *w,
                           struct snd_kcontrol *k, int event)
 {
-       gpio_set_value(GPIO92_HX4700_HP_DRIVER, !!SND_SOC_DAPM_EVENT_ON(event));
+       gpiod_set_value(gpiod_hp_driver, !!SND_SOC_DAPM_EVENT_ON(event));
        return 0;
 }

@@ -162,11 +160,6 @@ static struct snd_soc_card snd_soc_card_hx4700 = {
        .fully_routed           = true,
 };

-static struct gpio hx4700_audio_gpios[] = {
-       { GPIO107_HX4700_SPK_nSD, GPIOF_OUT_INIT_HIGH, "SPK_POWER" },
-       { GPIO92_HX4700_HP_DRIVER, GPIOF_OUT_INIT_LOW, "EP_POWER" },
-};
-
 static int hx4700_audio_probe(struct platform_device *pdev)
 {
        int ret;
@@ -174,26 +167,26 @@ static int hx4700_audio_probe(struct
platform_device *pdev)
        if (!machine_is_h4700())
                return -ENODEV;

-       ret = gpio_request_array(hx4700_audio_gpios,
-                               ARRAY_SIZE(hx4700_audio_gpios));
+       gpiod_hp_driver = devm_gpiod_get(&pdev->dev, "hp-driver",
GPIOD_OUT_HIGH);
+       ret = PTR_ERR_OR_ZERO(gpiod_hp_driver);
+       if (ret)
+               return ret;
+       gpiod_spk_sd = devm_gpiod_get(&pdev->dev, "spk-sd", GPIOD_OUT_LOW);
+       ret = PTR_ERR_OR_ZERO(gpiod_spk_sd);
        if (ret)
                return ret;

+       hs_jack_gpio.gpiod_dev = &pdev->dev;
        snd_soc_card_hx4700.dev = &pdev->dev;
        ret = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_hx4700);
-       if (ret)
-               gpio_free_array(hx4700_audio_gpios,
-                               ARRAY_SIZE(hx4700_audio_gpios));

        return ret;
 }

 static int hx4700_audio_remove(struct platform_device *pdev)
 {
-       gpio_set_value(GPIO92_HX4700_HP_DRIVER, 0);
-       gpio_set_value(GPIO107_HX4700_SPK_nSD, 0);
-
-       gpio_free_array(hx4700_audio_gpios, ARRAY_SIZE(hx4700_audio_gpios));
+       gpiod_set_value(gpiod_hp_driver, 0);
+       gpiod_set_value(gpiod_spk_sd, 0);
        return 0;
 }
