Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56650CD41
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 21:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DAF10E170;
	Sat, 23 Apr 2022 19:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF41110E170
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 19:55:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2E8B60FF3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 19:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED24C385B9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650743721;
 bh=f+gN5VFSk9TvNUY6oLSGkqRdwS9xhEyKvVqBzBXLs0k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PzAHzR20lzvPfCTqt/UUzx12IPhOfz+TRjqNJ8NxEoRI/bWqgErqlZjk7cfTM259a
 ES9ZLzK7AQ5x5SMPoX4fGuEBvk10IF/bYoYOZNrIybBirPtSW18FdAPqWZza8MudXV
 vG23F9GYtnFHpHrf84m9ZBvRrLCT6HR3YBoZ5rIdgNbcdWJ4WulW+Ag5txr/fArK/K
 8hzENh6M4DW/B6aRii4K02sQiyHAgWdV6wTeninHDFb9FTGsk1kC60BC8Ty7Z9oRiu
 uezNy/Q8OZSv9U2rlimKsK6lo1l+EW6dZRWZhxxZjuCiGNgZmaJtyoN+hSdEOEgF8G
 ZbIfS2Abjyb2Q==
Received: by mail-wm1-f48.google.com with SMTP id q20so6999531wmq.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 12:55:21 -0700 (PDT)
X-Gm-Message-State: AOAM533Hg7qc71+l4XXmmpGtRfVkTJso9la9f0XUqYWZ2tEgpi/bAT9p
 QnKg6G0hR2DUM37XSOsLoHi0n7xnXwI91uzg5SI=
X-Google-Smtp-Source: ABdhPJwI9oPHj0hjS6Y5T/XpNunPLjXzfhDb/y4TSIxWhFvis5ICGMzIa2Kp6ZajGKm/dLFayXeKiCmoNnJ4Fu7pVP8=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr18417513wmc.94.1650743719480; Sat, 23
 Apr 2022 12:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
In-Reply-To: <20220422234150.GA3442771@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 23 Apr 2022 21:55:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
Message-ID: <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Guenter Roeck <linux@roeck-us.net>
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
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
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
 Michael Turquette <mturquette@baylibre.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> > On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 4/22/22 12:16, Arnd Bergmann wrote:
> > > > On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > Which machine did you hit this on? Is this on hardware or in qemu?
> > > >
> > > qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
> > > Also, I just noticed that the failure is not always the same.
> > > z2 fails to boot from initrd, and sx1 fails to boot completely.
> >
> > That's a lot of machines failing, I hope at least we got the same bugs more
> > than once here.
> >
> > For the I/O space, I found now that PXA was not using the standard
> > virtual I/O address yet, but instead used a NULL-based offset.
> >
> > I'm not entirely happy with this patch, but this is an outline of what
> > I think we need to fix that: https://pastebin.com/3nVgQsEw
> > This one is probably incomplete, at least it breaks sa1100 for now,
> > and it adds a bogus CONFIG_PCI dependency. I'm also not sure
> > in what way the last patch in the series triggers it, rather than the
> > one that removed mach/io.h.
> >
> > I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
> > If you have a custom config for this one, make sure you get the right
> > DEBUG_LL address.
> >
> > > I'll do another round of bisects.
> >
>
> Here is the bisect for the sx1 boot failure.

Odd, I can't reproduce this at all. Do you get any console output at
all for this?

Is this the plain omap1_defconfig, or something else?

One thing I keep having to apply myself is this snippet:

diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 0bfad62ea858..87c695703580 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -441,7 +441,6 @@ __arm925_setup:

 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
        mov     r0, #4                          @ disable write-back
on caches explicitly
-       mcr     p15, 7, r0, c15, c0, 0
 #endif

        adr     r5, arm925_crval

I don't remember what the story is behind this, but I can't actually manage
to boot omap1_defconfig on qemu with the instruction intact.

       Arnd
