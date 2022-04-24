Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5527850D0A7
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 10:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1166F10EF90;
	Sun, 24 Apr 2022 08:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BC810EF90
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 08:53:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8F9EEB80DDD
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 08:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C84AC385BC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650790374;
 bh=VAIS5RCD9giYhrbO5Hac6FpKh7We3My7pPHwyo54GI8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IlEUmxA7Upi/jZvwszo5tWXIcRM0EAFPHSwLNctN9Y58IvDFrOEsiQajUPCMH7Jvj
 ffMGYU3Am1eiuRxan/QEzVGZIU4/nZDiD4I9qyEihHwFs57oDBFuZkioK/aaH82E/D
 cafv1RJevyhRqAmfrOprDhzFhC5PdErVyqMypulLdZQgaDPE2OydWwwQC4+yvZmqbe
 cKfnbHuByU+9iCxgB+9sW82eJWEWf6s1YXcaaJOKEOR6FMrQj52g4nRCkxQaL9o5DE
 hRPjDgGmvEn6UrlX0oEzCHgEu1vF7VzmeRUbf/lMOXmL9MVlUAWdZQ45wrK1ipQsiq
 1YeW3uUpHXgig==
Received: by mail-wm1-f46.google.com with SMTP id
 u9-20020a05600c00c900b00393e729e655so1158965wmm.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 01:52:54 -0700 (PDT)
X-Gm-Message-State: AOAM533qwmE8TfFJ3YeG34Q1BEMFoVZs0ReMklzwUnjZZpCbK56IFM+b
 DXlAhmsDj2v4wQcXV4dCQtnVXBdGB/QFbOwEuWo=
X-Google-Smtp-Source: ABdhPJwWxQyFReh1xxhP87snsCB/AySgR1dxVTGy6Gpi4+Uz2ZZzeirzOgx8S2o3MdbrdLkLr/78d+DVsl9RCKwJ5Q8=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr20347843wmc.94.1650790372472; Sun, 24
 Apr 2022 01:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
In-Reply-To: <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 24 Apr 2022 10:52:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
Message-ID: <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
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

On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/23/22 12:55, Arnd Bergmann wrote:
> > On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> >
> > Odd, I can't reproduce this at all. Do you get any console output at
> > all for this?
> >
> > Is this the plain omap1_defconfig, or something else?
> >
>
> No, it is my own sx1 specific configuration.
>
> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/qemu_sx1_defconfig
>
> I don't recall where I got it from but ...

Ok, that explains it, thanks!

I fixed all the defconfig files that come with the kernel, but for your own
ones you have to add

# CONFIG_ARCH_MULTI_V7 is not set

into the defconfig file, otherwise the multiplatform target defaults to
an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
you also need to enable CONFIG_ARCH_MULTI_V4T.

This is slightly unfortunate, but I don't see any way to avoid it, and the
modified defconfig will still work fine with older kernel trees.

> > One thing I keep having to apply myself is this snippet:
> >
> > diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
> > index 0bfad62ea858..87c695703580 100644
> > --- a/arch/arm/mm/proc-arm925.S
> > +++ b/arch/arm/mm/proc-arm925.S
> > @@ -441,7 +441,6 @@ __arm925_setup:
> >
> >   #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
> >          mov     r0, #4                          @ disable write-back
> > on caches explicitly
> > -       mcr     p15, 7, r0, c15, c0, 0
> >   #endif
>
> it does not have CONFIG_CPU_DCACHE_WRITETHROUGH enabled.

Maybe it was disabled explicitly for the sx1_defconfig because of this
bug. I would think that this is required for actual sx1 hardware because the
option is default-enabled for ARM925T, and that CPU core is exclusively
used in OMAP15xx.

        Arnd
