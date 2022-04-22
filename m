Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3850C037
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 21:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0BC10E47C;
	Fri, 22 Apr 2022 19:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4AA10E47C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 19:16:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D8DC0B83080
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 19:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE80C385A9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650654996;
 bh=usqLrTa+RhNIXODsvc1TquBT71WxqcNK2RxgDri8djo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dHZdyEqPbXSmeLsuy8PRY8gXoSJpMet3UHqdYrtinR2eBd+8B/N2mmofElBUbtMxP
 q8r7n4ncrLlzphg1eptw0OcB/tkTXS7Wu5c0+2ETmdsj1L3+3zeqdF+HwcYSu+n3Uq
 1g+pIuksyr7npaick9W4i8sLsxYXsIAz/zdYGL9VHag6K2ei3r6bOQvgiAUz5GPqwI
 GD8rl4Pj29WUDMJeHw7N6ZIi95tiQZ43R0ZteLd0w2UdCH+N/IpSZj8T4vn2EAA7dd
 GKq/Pw4mYPpOAz2Hjz6hIpuHQ54CPuvkDYSab0d4S9/Q5dgDzscYwk2MkrzQlU5y27
 m331jxLqtxgKQ==
Received: by mail-wr1-f51.google.com with SMTP id h25so6349864wrc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 12:16:36 -0700 (PDT)
X-Gm-Message-State: AOAM533dbeLK8su9x4WVWITcZkkwGbsSDe+fMmrL0ThjzTdDZJkoulXP
 dR5eWUSYU0kiCypLyEy3AcuhsOGFA1Vdj8cBzGw=
X-Google-Smtp-Source: ABdhPJw6+Yao9x3BaLiJGzKRj3K3UIg0JnN9aGyxH7bzbX5jCygm3ZIZ1bsSqfcHE9peInK43hwx2CakFvcKMsS3Rps=
X-Received: by 2002:a5d:6983:0:b0:207:a226:df4b with SMTP id
 g3-20020a5d6983000000b00207a226df4bmr5002354wru.192.1650654994816; Fri, 22
 Apr 2022 12:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
In-Reply-To: <20220422170530.GA2338209@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Apr 2022 21:16:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
Message-ID: <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
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

On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Apr 19, 2022 at 06:37:22PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This revisits a series I sent a few years ago:
> >
> > https://lore.kernel.org/lkml/20191018154052.1276506-1-arnd@arndb.de/
> >
> > All the other ARMv5 conversions are under way now, with
> > OMAP1 being the only one still not in linux-next yet,
> > and PXA completing the set.
> >
> > Most of the patches are unchanged from before, furtunately
> > the PXA code is fairly stable. I addressed Robert's comments,
> > pulled in two patches from Dmitry, and added the last a the
> > final four patches to finish off the multiplatform conversion.
> >
> > I hope someone is left to test these on PXA: if this works,
> > I'd like to merge it for 5.19. A git tree with these is avaialable
> > for testing at
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=pxa-multiplatform-5.18
> >
>
> Unfortunately that crashes for me when trying to boot from ide.
> Bisect points to the last patch of the series.

Thanks a lot for testing and the perfect bug report!

> [    1.403715] 8<--- cut here ---
> [    1.403848] Unable to handle kernel paging request at virtual address feeb000e
> [    1.404097] [feeb000e] *pgd=00000000

Ok, this is the PCI I/O space area, which starts at 0xfee00000,
clearly the way I/O space
gets mapped changed here. I don't yet see what happened, but it should
be straightforward
to find from here.

> [    1.416643]  pcmcia_init_one from pcmcia_device_probe+0xe4/0x2a0
> [    1.416882]  pcmcia_device_probe from really_probe+0xc8/0x3b4
> [    1.417070]  really_probe from __driver_probe_device+0x9c/0x214
> [    1.417255]  __driver_probe_device from driver_probe_device+0x38/0xe0
> [    1.417454]  driver_probe_device from __device_attach_driver+0xa4/0x11c
> [    1.417657]  __device_attach_driver from bus_for_each_drv+0x88/0xd8
> [    1.417864]  bus_for_each_drv from __device_attach+0xf4/0x194
> [    1.418047]  __device_attach from bus_probe_device+0x8c/0x94
> [    1.418224]  bus_probe_device from device_add+0x3d0/0x894
> [    1.418395]  device_add from pcmcia_device_add+0x2ec/0x3e0
> [    1.418568]  pcmcia_device_add from pcmcia_card_add+0xd4/0x1a0
> [    1.418756]  pcmcia_card_add from pcmcia_bus_add+0x44/0x4c
> [    1.418930]  pcmcia_bus_add from socket_insert+0x12c/0x150
> [    1.419103]  socket_insert from pccardd+0x398/0x44c
> [    1.419257]  pccardd from kthread+0xdc/0x114
> [    1.419400]  kthread from ret_from_fork+0x14/0x2c
> [    1.419569] Exception stack(0xc48a5fb0 to 0xc48a5ff8)
> [    1.419735] 5fa0:                                     00000000 00000000 00000000 00000000
> [    1.419979] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.420222] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    1.420501] Code: 13570000 e1a06000 0a000043 e3a03002 (e5c03000)
> [    1.420874] ---[ end trace 0000000000000000 ]---
>
> ---
> # bad: [7643a9ca9f8e08f71e15f89dd74863635e981e03] ARM: pxa: convert to multiplatform
> # good: [3123109284176b1532874591f7c81f3837bbdc17] Linux 5.18-rc1
> git bisect start 'HEAD' 'v5.18-rc1'
> # good: [9b03d7f95bd4d97101ecb8ea1e822103b81fdb2d] ARM: pxa: mainstone-wm97xx: use gpio lookup table
> git bisect good 9b03d7f95bd4d97101ecb8ea1e822103b81fdb2d
> # good: [764063eee7620ea9abb940068a7ad0e7f9efa1b6] cpufreq: pxa3: move clk register access to clk driver
> git bisect good 764063eee7620ea9abb940068a7ad0e7f9efa1b6
> # good: [5153474f0a4388b7ddb59add4be73bfb42b2007f] ARM: mmp: remove tavorevb board support
> git bisect good 5153474f0a4388b7ddb59add4be73bfb42b2007f
> # good: [2746f7c78b428c8b01b691a29a972c08101ae343] ARM: PXA: fix multi-cpu build of xsc3
> git bisect good 2746f7c78b428c8b01b691a29a972c08101ae343
> # good: [73d5106e9489464eac84362705e93bcf3b376123] ARM: pxa: remove support for MTD_XIP
> git bisect good 73d5106e9489464eac84362705e93bcf3b376123
> # first bad commit: [7643a9ca9f8e08f71e15f89dd74863635e981e03] ARM: pxa: convert to multiplatform

I'll back out this patch for now while investigating further.

Which machine did you hit this on? Is this on hardware or in qemu?

       Arnd
