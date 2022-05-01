Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD351681E
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 23:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3C110E010;
	Sun,  1 May 2022 21:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20A510E010
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 21:41:16 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id g28so23284108ybj.10
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 14:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W/jgoNHxZ0Bthjb3T+ueRSX0j4+9gCUm19tM0i8wHwg=;
 b=IhdUZeb/2gtz8F3Rms9jbaMLWrgk9MgQ3AsdLov4FK3Mlzh5dB5SkLKChzGtZ8IxYp
 G5ca/lqDXuEA1sPhEVPyIa/Q2PZiKGOf7YhqAw/IHqTaRS3tfuxe5vxPkiXcKnSSY+3S
 7ppRg4LQk2Uv9wR63si1SSy6XwiVLL7qFkHNlWqfSlqs0yLXj9GT9hsHOGdPMLeWa4Z5
 yi/NgdTd0E83Yl+jmXtf3Jut6MVJU1arAhV4mge1OLZtShQSG4PEDF87HlZJ7jAAsXMq
 NvpTbNSoJchK+6lkQfko/fVrXtHXd/BqfkBEUyV3r++82iVekijvFZHqUIOR58kizRlW
 mQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W/jgoNHxZ0Bthjb3T+ueRSX0j4+9gCUm19tM0i8wHwg=;
 b=WHfZdsorigdO/vV2Bn2tbvxigghoVJe+lBdJFg+LvjmO7lIHcfhHwKzEQ1EleAVS4L
 FinSIoxUwhGknf7QRraCM3m+2kIMkln1ASunhSgI3BnirEKwXkmg6CrWYMTt18K7tAew
 kZ8yNaWxzPSSQPYjyEsmrtX97Tn0W+4633XCs7kpQSE53au3E2hvTs1wSFnqqWmUZTQv
 HxRf13iDCPwTH/dHiv3FK3rDxPwNfnll0c7O33j4I7XsvEnQ7APfqr1KbmPAeMrVHCfo
 4JVSbtyzzGQt2v7P+9fFC7BxufwarispVbsCANMWIjqn66LElHE0CV5cHKBECuOpGlL2
 03oA==
X-Gm-Message-State: AOAM5314/8zXNWmPrKcxvhAkieiDoBehEFCFHneDsMfK74cSwG7XntJE
 uC0gQTyIxqVQo1KuDXYr3Vv1KOC63xpvXdhgQfSHvg==
X-Google-Smtp-Source: ABdhPJxQ+Z2MWNpw84rRmTsi9PlMVLP8E3NHAP2/94wScknuaOhbNIB27Lulcn5Bn4eH53rZYcEIPCq8gj4+tkqqRT4=
X-Received: by 2002:a25:2905:0:b0:649:7a2b:ca72 with SMTP id
 p5-20020a252905000000b006497a2bca72mr2453918ybp.492.1651441275908; Sun, 01
 May 2022 14:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-19-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-19-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:41:04 +0200
Message-ID: <CACRpkdac8dGKSEmc-HpgooJefrDtiKK+_A1Mv7AJM8yQV9UY-w@mail.gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 robert.jarzmik@free.fr, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 6:41 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The audio driver should not use a hardwired gpio number
> from the header. Change it to use a lookup table.
>
> Cc: Philipp Zabel <philipp.zabel@gmail.com>
> Cc: Paul Parsons <lost.distance@yahoo.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

(...)
> +static struct gpiod_lookup_table hx4700_audio_gpio_table = {
> +       .dev_id = "hx4700-audio",
> +       .table = {
> +               GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
> +                           "earphone-ndet", GPIO_ACTIVE_HIGH),

This looks wrong. The n in nDET in the end of the name of the GPIO line
means active low does it not?

What I usually do when I see this is to properly set it to
GPIO_ACTIVE_LOW in the descriptor table, then invert the logic
where it's getting used.

Also rename to earphone-det instead of -ndet

> +               GPIO_LOOKUP("gpio-pxa", GPIO92_HX4700_HP_DRIVER,
> +                           "hp-driver", GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("gpio-pxa", GPIO107_HX4700_SPK_nSD,
> +                           "spk-nsd", GPIO_ACTIVE_HIGH),

Same here. Rename spk-sd

Yours,
Linus Walleij
