Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1D851B17C
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 23:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A8610E6AB;
	Wed,  4 May 2022 21:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511AF10E6AB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 21:59:43 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id v59so4676975ybi.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 14:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rmJxiEP7m5MkHAr9riUqfx3uT8FiWx1lLvenswbOwJo=;
 b=QoiC7QZe2hJyujp1ZRg0nlXjXopykN2j/DeYH65TBWATXUktJf0x/kyffuuacsI/Xo
 3U/WGyV+fixlajIQ09GKt1DZZYpxMas0dWaDYCL8jonCJtMRr4CSZtyBZVh8caz3Zhfm
 KLVYZqsNmH6MjXnLA95998XCfsQEg4LoRnNmHuqp/sQ2AApgVFWMqqZBdroSiC1gbSmN
 F4COMU/J9YGu52LHRSSP9wDA3f+g3bnizNxpCHxuTE9h/gJ7KhKhsdH72IujMMikVg4I
 fP3vyeXEvVrVnkAX/oRVPo4TmV6M5W4ptTtqSYXWLDxsKe5hoIl7+BOBmDpgqE7s/ubD
 8xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rmJxiEP7m5MkHAr9riUqfx3uT8FiWx1lLvenswbOwJo=;
 b=ubPPrxkL1fpHoFAQuv9GT7AYb63g4Xv4diZRwkhHySx9AeapdDy5+5KmpxZbQDt9xN
 eYpwtnasdO8dcUzDSFsZ2wwCfYa/ZDAdtJokbRZTQyOLeidDAtmYilIwtM1lOkX2f8gV
 fk+1497KUdcWXYG82np4AdsI27l4bXjxf+Y9Foip4W01Xm9Pcwa15NwhX219tPFeN5Pk
 hX5nCswpSnEeEodyPvYXbErZH1wj5pGfAwe/Hq3UROb0/KTbzEAV/7v8x3x5QAH4QDhU
 rS2ra40gCE7hotjC3AJjYDzyZvOl9jMwboOqQyOERKc+bAz+De19wpp7T6NcZBgsugdT
 9DkA==
X-Gm-Message-State: AOAM533jP0VB8c5hIgHhpO08gwMmv93TI8JImGi+z/98kkMO6c00PK9h
 9Zxsgx0y2ngaJLCtP7BhrHgGtYShQ08EH9lFcnq0hA==
X-Google-Smtp-Source: ABdhPJws0kFu4uk8m+EBRW3/56Ag/4uZ6hdskWay/lA/R4RBYkLUb5oUPb5cyXOdcEWwAD5EvFRWUXI3Mh6lxHFGeY0=
X-Received: by 2002:a25:bcc7:0:b0:648:d728:d39 with SMTP id
 l7-20020a25bcc7000000b00648d7280d39mr19634791ybm.514.1651701582183; Wed, 04
 May 2022 14:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 May 2022 23:59:30 +0200
Message-ID: <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
Subject: Re: [PATCH 18/48] ARM: pxa: hx4700: use gpio descriptors for audio
To: Arnd Bergmann <arnd@kernel.org>
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

On Mon, May 2, 2022 at 9:08 AM Arnd Bergmann <arnd@kernel.org> wrote:
> On Sun, May 1, 2022 at 11:41 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > (...)
> > > +static struct gpiod_lookup_table hx4700_audio_gpio_table = {
> > > +       .dev_id = "hx4700-audio",
> > > +       .table = {
> > > +               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
> > > +                           "earphone-ndet", GPIO_ACTIVE_HIGH),
> >
> > This looks wrong. The n in nDET in the end of the name of the GPIO line
> > means active low does it not?
> >
> > What I usually do when I see this is to properly set it to
> > GPIO_ACTIVE_LOW in the descriptor table, then invert the logic
> > where it's getting used.
> >
> > Also rename to earphone-det instead of -ndet
>
> Thanks for taking a look! I changed it now, but I don't know if
> I got the correct number of inversions in the end. How does this look?

Looks wrong, you can just invert the argument to any statement of set_value()
after tagging respective line as active low. Then gpilob will do a second
inversion.

> +               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
> +                           "earphone-det", GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP("gpio-pxa", GPIO107_HX4700_SPK_nSD,
> +                           "spk-sd", GPIO_ACTIVE_LOW),

So those two have switched polarity.

> @@ -81,14 +79,14 @@ static const struct snd_soc_ops hx4700_ops = {
>  static int hx4700_spk_power(struct snd_soc_dapm_widget *w,
>                             struct snd_kcontrol *k, int event)
>  {
> -       gpio_set_value(GPIO107_HX4700_SPK_nSD, !!SND_SOC_DAPM_EVENT_ON(event));
> +       gpiod_set_value(gpiod_spk_sd, !!SND_SOC_DAPM_EVENT_ON(event));

Thus drop one ! in front of the expression, just !SND_SOC_DAPM_EVENT_ON(event)

> -       gpio_set_value(GPIO92_HX4700_HP_DRIVER, !!SND_SOC_DAPM_EVENT_ON(event));
> +       gpiod_set_value(gpiod_hp_driver, !!SND_SOC_DAPM_EVENT_ON(event));

But not this.

> +       gpiod_spk_sd = devm_gpiod_get(&pdev->dev, "spk-sd", GPIOD_OUT_LOW);

These initial values don't seem to be set in the old code you could
just use GPIOD_ASIS as flag to make sure the new code behaves
the same.

Yours,
Linus Walleij
