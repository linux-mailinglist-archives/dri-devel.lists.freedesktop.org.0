Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED21E51B7B2
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 08:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A7789179;
	Thu,  5 May 2022 06:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2F689179
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 06:04:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 176E061ABC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 06:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F7AC385AC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 06:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651730673;
 bh=gGag8LcvVDzOYjY7vVQNICNRVUATqvouUQ3T9qB8Y4k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IzeX2fl3N2x2kryaheKunqUXxhYq2EKW3EevzAcRMispu7pOGu+LIVB4gtA4lt47H
 kuw8arO+PfbPq7WQnALg8Llzkb+hKwtvB/sYTsnK/90IacYZCB6DJZ5ZQJOsJ5C1F3
 TeSHzM+uYa+G41zdiYBmFF25L9TEm88hz+cFkf+LED+1kXeRmilzEAvsC7hDnbfjGn
 7+T7Dj+o9VKBm1U6ge16L5XMEd+1ntq34MUjLp9fn2cdJO958LQytdZ8prNLl0PmNR
 JJUBc01v6sbgWXUsh3IWA1bR3+vxPlhbpLgI0/bOseW+q4bkkad+M4ksyG11vuvJyh
 VmRMQT8XoxC+g==
Received: by mail-wm1-f51.google.com with SMTP id bg25so2004917wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 23:04:33 -0700 (PDT)
X-Gm-Message-State: AOAM530gledvDeo9hCqV/OF0z3hIVHgkdzkaoMvwdSLgdJioAkDVFSJm
 Avf7DEcW6SR/HYidtAwDnRA1+vgg1TsndHJlIQs=
X-Google-Smtp-Source: ABdhPJxJJBc6IXeb9FDBUjhMgPRC02W3Kaja9XP7Gl4879zHpOvDa2WCA8GypEt4poAHxn+t5qvz/Rnv+5FUxU+6qJI=
X-Received: by 2002:a05:600c:4f0f:b0:394:54c1:f5b3 with SMTP id
 l15-20020a05600c4f0f00b0039454c1f5b3mr3065513wmq.33.1651730671693; Wed, 04
 May 2022 23:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
 <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
 <CAK8P3a0w3gFzZoBzyRsi1Ta4prESf8Fp0=quAPSKMnaXvbXNTQ@mail.gmail.com>
 <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
In-Reply-To: <CACRpkdZNryYkidvdKuT57RM3fz6_X+3oOzF5xaOZd+TyScfUsw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 5 May 2022 08:04:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
Message-ID: <CAK8P3a0y0tVZODpp+GSf0EkMPWbbvMqA-4kNf0NJMc0M2=2WHw@mail.gmail.com>
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

On Wed, May 4, 2022 at 11:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, May 2, 2022 at 9:08 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Sun, May 1, 2022 at 11:41 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > (...)
> > > > +static struct gpiod_lookup_table hx4700_audio_gpio_table = {
> > > > +       .dev_id = "hx4700-audio",
> > > > +       .table = {
> > > > +               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
> > > > +                           "earphone-ndet", GPIO_ACTIVE_HIGH),
> > >
> > > This looks wrong. The n in nDET in the end of the name of the GPIO line
> > > means active low does it not?
> > >
> > > What I usually do when I see this is to properly set it to
> > > GPIO_ACTIVE_LOW in the descriptor table, then invert the logic
> > > where it's getting used.
> > >
> > > Also rename to earphone-det instead of -ndet
> >
> > Thanks for taking a look! I changed it now, but I don't know if
> > I got the correct number of inversions in the end. How does this look?
>
> Looks wrong, you can just invert the argument to any statement of set_value()
> after tagging respective line as active low. Then gpilob will do a second
> inversion.
>
> > +               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
> > +                           "earphone-det", GPIO_ACTIVE_LOW),
> > +               GPIO_LOOKUP("gpio-pxa", GPIO107_HX4700_SPK_nSD,
> > +                           "spk-sd", GPIO_ACTIVE_LOW),
>
> So those two have switched polarity.
>
> > @@ -81,14 +79,14 @@ static const struct snd_soc_ops hx4700_ops = {
> >  static int hx4700_spk_power(struct snd_soc_dapm_widget *w,
> >                             struct snd_kcontrol *k, int event)
> >  {
> > -       gpio_set_value(GPIO107_HX4700_SPK_nSD, !!SND_SOC_DAPM_EVENT_ON(event));
> > +       gpiod_set_value(gpiod_spk_sd, !!SND_SOC_DAPM_EVENT_ON(event));
>
> Thus drop one ! in front of the expression, just !SND_SOC_DAPM_EVENT_ON(event)

Ok, done. But I still leave the extra 'invert=1' in hs_jack_pin[], right?

/* Headphones jack detection DAPM pin */
static struct snd_soc_jack_pin hs_jack_pin[] = {
        {
                .pin    = "Headphone Jack",
                .mask   = SND_JACK_HEADPHONE,
        },
        {
                .pin    = "Speaker",
                /* disable speaker when hp jack is inserted */
                .mask   = SND_JACK_HEADPHONE,
                .invert = 1,
        },
};

> > +       gpiod_spk_sd = devm_gpiod_get(&pdev->dev, "spk-sd", GPIOD_OUT_LOW);
>
> These initial values don't seem to be set in the old code you could
> just use GPIOD_ASIS as flag to make sure the new code behaves
> the same.

Ok.

        Arnd
