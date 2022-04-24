Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C316E50D444
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 20:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCB3112678;
	Sun, 24 Apr 2022 18:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A18B11266F
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 18:49:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B4586124E
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 18:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEEFC385AE
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 18:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650826137;
 bh=ipl3oSa3DODJXFqNROBx1CoqGwslciyjMuC+i+Saf6s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BOkM82fII90m6hiFZrsM+S6NoOx/9JSXO645uDox3wouyvV5cDVRWJxz7xq/cB9au
 LYrBwqxSBkhIKBzBNs0hwtCBHRO1gixAqGnRtxVTd+01UzyFfxHSDne9WN6ttlm+rb
 jcQBniXrkaKqn2jBmZOb15DeGZFcd9PAC8aU0sErmt9X3VJ12+DgM2/0JBOHnN/nNw
 G4IIFddQ3lsrPoLfBPfhYi7wy7+MEYhHtnQkavlIidm5fb5N3XrXiQ6swPnyQws0/W
 CtU43okgiFy2OpjRFiWX3gSYz6BOM2afEEdzeBOnonvAaXEfnmyinRGY3cRVziG/FD
 TihvS5WssHAGA==
Received: by mail-wm1-f49.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so11219502wmb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 11:48:56 -0700 (PDT)
X-Gm-Message-State: AOAM531D6Pi2I5cycvC+EVCPKHQ1qE13fxjW5BBhPCtAO7wPXF4saZYI
 xAKKnbwZsKWlMGUpg9VplSfEwHtX8rvhksINDvc=
X-Google-Smtp-Source: ABdhPJy0bXzhrJhOMZ1X8kbnkslFxEyAGa0Ih/9fgvnO3mTuzgN7/0kU+dSPN2u/9dZRAXnrV+Nc5ftINsUw3V0d/rc=
X-Received: by 2002:a05:600c:4e4a:b0:392:88e1:74a7 with SMTP id
 e10-20020a05600c4e4a00b0039288e174a7mr22771106wmq.174.1650826135238; Sun, 24
 Apr 2022 11:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
In-Reply-To: <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 24 Apr 2022 20:48:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
Message-ID: <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
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

On Sun, Apr 24, 2022 at 5:28 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 4/24/22 01:52, Arnd Bergmann wrote:
> > On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > into the defconfig file, otherwise the multiplatform target defaults to
> > an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
> > you also need to enable CONFIG_ARCH_MULTI_V4T.
> >
> > This is slightly unfortunate, but I don't see any way to avoid it, and the
> > modified defconfig will still work fine with older kernel trees.
> >
>
> Yes, that works. I changed it in my configuration.

Ok, great!. I managed to boot the z2 machine with PCMCIA support
and it gets around the issue with my patch, correctly detecting the
CF card.

> >>> One thing I keep having to apply myself is this snippet:
> >>>
> >>> diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
> >>> index 0bfad62ea858..87c695703580 100644
> >>> --- a/arch/arm/mm/proc-arm925.S
> >>> +++ b/arch/arm/mm/proc-arm925.S
> >>> @@ -441,7 +441,6 @@ __arm925_setup:
> >>>
> >>>    #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
> >>>           mov     r0, #4                          @ disable write-back
> >>> on caches explicitly
> >>> -       mcr     p15, 7, r0, c15, c0, 0
> >>>    #endif
> >>
> >> it does not have CONFIG_CPU_DCACHE_WRITETHROUGH enabled.
> >
> > Maybe it was disabled explicitly for the sx1_defconfig because of this
> > bug. I would think that this is required for actual sx1 hardware because the
> > option is default-enabled for ARM925T, and that CPU core is exclusively
> > used in OMAP15xx.
> >
>
> That looks like a bug in qemu. ARM925T instruction support is limited to V4T
> instructions. qemu doesn't have explicit 5T support. It is either V4T
> or V5.

I'm not entirely sure what instructions the CPU supports, but Linux
treats it as ARMv4T as well, and qemu supports some of the 925t
specific instructions as "ti925t" in target/arm/cpu_tcg.c, it just seems
it's missing some others.

      Arnd
