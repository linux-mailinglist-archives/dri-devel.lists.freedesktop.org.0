Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58650BDE0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 19:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F42910E48E;
	Fri, 22 Apr 2022 17:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A632C10E48E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 17:05:34 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e9027efe6aso1933573fac.10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mY0tGuFElI+pBCvZypa+uhiwZDGlD+rd5RyfMzCDiwY=;
 b=WZlDhNUU9Bv3cLd9+2BUj8PQ0W0vdOUPUmbjOUjWVaDfQ++uQetdgsjMFfM5tQA3nH
 sCDuOGgcoexnVdriYT7wSzZfCJbgMRVjzS/zY0sm9eBjtSMplJnXlCozOQSUZuZt/R/s
 bd/r4UiG41dF4YE96ThOOaTA0KtRp/dsKV/PzUOQiC8g8n5LxQWGIXxcSy6NwpEaGeZd
 8B/yftIZJl8x1Gt9EJXz5WpTY43u/pqfRC5abtUKCtKu1leMlOXnw6fNpSNlvPScI5gf
 mdiun0U49jszbERlNzo3xDzRuqVbk/oT44mXcwf5hBePbqplV9DIZqHZjSAqPA09ahwa
 M3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=mY0tGuFElI+pBCvZypa+uhiwZDGlD+rd5RyfMzCDiwY=;
 b=gAXjcZ0i2smC6ybLHvsB1F7xPyhje/BzC9NbPG22z1oyZZraBAPlFwYdZpRLhlUpWb
 +sWLYAQNjFlkkJpwWxEyEkxG5z+DZt49nSBsohEMSlB0DBsAxJlrXdaazHqliCQA9krN
 MKGAcvmoscS4/ZP9YuCNjGwgfss7w2PYUAEDuboqBzzWga2ypHZD2FTePC3Qtrak2nAf
 rhOEA5ViNxrnkvBb97Map3/J/JOJcxOVqT2wDXVusmrghU/8vbiq0I1b1RX0oGqbqjH5
 MrLrOd+SpjGHxmjEMVbW1UNHWzeFaU+hzMyXoSQTlMZVL4dKL/mB17gnX5E1yHPSQgNe
 ihyw==
X-Gm-Message-State: AOAM530yseYaA0RdZedIBeZ7psB0OYHB//DGzsmMHmCmSJp/V++gUULI
 kZ2quYHstWAifoGjthjNABk=
X-Google-Smtp-Source: ABdhPJwyV4g1eWudYtD/hcz6EJxOYDu09EkjJlhrgLVZDzcFDGxflUVQ6LGY40Te5XJPDjVadkCTWg==
X-Received: by 2002:a05:6870:1607:b0:de:984:496d with SMTP id
 b7-20020a056870160700b000de0984496dmr6469615oae.253.1650647133866; 
 Fri, 22 Apr 2022 10:05:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056808056900b0032252797ea4sm971770oig.6.2022.04.22.10.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 10:05:32 -0700 (PDT)
Date: Fri, 22 Apr 2022 10:05:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Message-ID: <20220422170530.GA2338209@roeck-us.net>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
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
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, robert.jarzmik@free.fr,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 06:37:22PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This revisits a series I sent a few years ago:
> 
> https://lore.kernel.org/lkml/20191018154052.1276506-1-arnd@arndb.de/
> 
> All the other ARMv5 conversions are under way now, with
> OMAP1 being the only one still not in linux-next yet,
> and PXA completing the set.
> 
> Most of the patches are unchanged from before, furtunately
> the PXA code is fairly stable. I addressed Robert's comments,
> pulled in two patches from Dmitry, and added the last a the
> final four patches to finish off the multiplatform conversion.
> 
> I hope someone is left to test these on PXA: if this works,
> I'd like to merge it for 5.19. A git tree with these is avaialable
> for testing at
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=pxa-multiplatform-5.18
> 

Unfortunately that crashes for me when trying to boot from ide.
Bisect points to the last patch of the series.

Guenter

---
[    1.403715] 8<--- cut here ---
[    1.403848] Unable to handle kernel paging request at virtual address feeb000e
[    1.404097] [feeb000e] *pgd=00000000
[    1.404400] Internal error: Oops: 805 [#1] PREEMPT ARM
[    1.404648] Modules linked in:
[    1.404890] CPU: 0 PID: 22 Comm: pccardd Not tainted 5.18.0-rc3-next-20220422 #1
[    1.405159] Hardware name: SHARP Borzoi
[    1.405319] PC is at pcmcia_init_one+0xf8/0x27c
[    1.405476] LR is at devres_add+0x40/0x6c
[    1.405611] pc : [<c04bdea0>]    lr : [<c044d808>]    psr: a0000113
[    1.405846] sp : c48a5d00  ip : c15f4220  fp : 60000113
[    1.406026] r10: 00000000  r9 : c48b000e  r8 : c48b0000
[    1.406195] r7 : feeb0000  r6 : feeb000e  r5 : c15ec090  r4 : c15ec020
[    1.406395] r3 : 00000002  r2 : 00000000  r1 : c15f4200  r0 : feeb000e
[    1.406615] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    1.406847] Control: 00007977  Table: a0004000  DAC: 00000071
[    1.407042] Register r0 information: 0-page vmalloc region starting at 0xfee00000 allocated at pci_reserve_io+0x0/0x38
[    1.407453] Register r1 information: slab
[    1.407721] Register r2 information: NULL pointer
[    1.407885] Register r3 information: non-paged memory
[    1.408047] Register r4 information: slab
[    1.408179] Register r5 information: slab
[    1.408310] Register r6 information: 0-page vmalloc region starting at 0xfee00000 allocated at pci_reserve_io+0x0/0x38
[    1.408622] Register r7 information: 0-page vmalloc region starting at 0xfee00000 allocated at pci_reserve_io+0x0/0x38
[    1.408941] Register r8 information: 0-page vmalloc region starting at 0xc48b0000 allocated at soc_pcmcia_add_one+0xf0/0x370
[    1.409291] Register r9 information: 0-page vmalloc region starting at 0xc48b0000 allocated at soc_pcmcia_add_one+0xf0/0x370
[    1.409617] Register r10 information: NULL pointer
[    1.409768] Register r11 information: non-paged memory
[    1.409924] Register r12 information: slab
[    1.410066] Process pccardd (pid: 22, stack limit = 0x(ptrval))
[    1.410268] Stack: (0xc48a5d00 to 0xc48a6000)
[    1.410448] 5d00: c15ebb78 00000000 0000001a 00000110 00000000 c0ad702c ff00051a c15ec090
[    1.410694] 5d20: c0b713ec c0b713ec c12f6048 c0b644fc 00000000 00000000 60000113 c053f6bc
[    1.410938] 5d40: c16b3bf0 c15efa88 c09d4e48 00000001 00000007 00000200 0000000f 00000000
[    1.411174] 5d60: 00000000 00000000 c0b71300 c0ad702c c0b644fc 00000000 c15ec090 c0b713ec
[    1.411410] 5d80: c0b9f980 c04491a8 c15ec090 00000000 60000113 c15ec090 c0b713ec c15ec090
[    1.411644] 5da0: 00000003 c0449530 c078a988 c0399c90 ffffff08 c0be4d7c c0b713ec c15ec090
[    1.411882] 5dc0: 00000003 c0b644fc 00000000 00000000 60000113 c04496e0 00000001 c0b713ec
[    1.412117] 5de0: c48a5e2c c15ec090 c0b644fc c0449aa0 00000000 c48a5e2c c04499fc c0be4d50
[    1.412352] 5e00: c0b644fc c044702c 00000000 c12f407c c16b3bd4 c0ad702c c15ec090 00000001
[    1.412587] 5e20: c15ec0d4 c0449030 c15ec090 c15ec090 00000001 c0ad702c c15ec090 c15ec090
[    1.412827] 5e40: c0b77a9c c0448044 c15ec090 00000000 c12f5030 c04458bc 00000001 c009c720
[    1.413065] 5e60: c15ec090 c04590e4 c15ec090 00000002 c12f6048 c12f6150 c15ec088 c0ad702c
[    1.413307] 5e80: c15ec090 c15ec020 c12f6150 c12f6048 c12f6150 c15ec088 c15ec090 c12f6160
[    1.413551] 5ea0: 60000113 c0540820 00000000 c12f6048 c12f6150 ffffffe4 c12f6178 c12f6900
[    1.413804] 5ec0: c0bb6828 c05409e8 00000000 00000011 c12f6048 00000000 c12f6150 c0ba35c8
[    1.414050] 5ee0: c12f6178 c12f6900 c0bb6828 c074c3a8 c48a5f04 c0ad702c c48a5f10 c074c44c
[    1.414294] 5f00: c098de10 c09acdc0 c12f4fa0 c48a5f1c 000031d0 c0ad702c c12f6048 c12f6048
[    1.414538] 5f20: 00000000 c12f6150 c0ba35c8 c0540af8 c12f6048 00000000 c12f6150 c053dcd4
[    1.414791] 5f40: c12f6048 00000000 00000080 c12f6144 c12f6900 c053e704 00000000 c12f6178
[    1.415037] 5f60: 000030d0 c0ad702c c12f6900 c12f4fe0 c12f21a0 c053e36c c12f6048 c12f6900
[    1.415282] 5f80: c4809cc0 00000000 00000000 c004d67c c12f4fe0 c004d5a0 00000000 00000000
[    1.415531] 5fa0: 00000000 00000000 00000000 c0008368 00000000 00000000 00000000 00000000
[    1.415780] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.416025] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    1.416643]  pcmcia_init_one from pcmcia_device_probe+0xe4/0x2a0
[    1.416882]  pcmcia_device_probe from really_probe+0xc8/0x3b4
[    1.417070]  really_probe from __driver_probe_device+0x9c/0x214
[    1.417255]  __driver_probe_device from driver_probe_device+0x38/0xe0
[    1.417454]  driver_probe_device from __device_attach_driver+0xa4/0x11c
[    1.417657]  __device_attach_driver from bus_for_each_drv+0x88/0xd8
[    1.417864]  bus_for_each_drv from __device_attach+0xf4/0x194
[    1.418047]  __device_attach from bus_probe_device+0x8c/0x94
[    1.418224]  bus_probe_device from device_add+0x3d0/0x894
[    1.418395]  device_add from pcmcia_device_add+0x2ec/0x3e0
[    1.418568]  pcmcia_device_add from pcmcia_card_add+0xd4/0x1a0
[    1.418756]  pcmcia_card_add from pcmcia_bus_add+0x44/0x4c
[    1.418930]  pcmcia_bus_add from socket_insert+0x12c/0x150
[    1.419103]  socket_insert from pccardd+0x398/0x44c
[    1.419257]  pccardd from kthread+0xdc/0x114
[    1.419400]  kthread from ret_from_fork+0x14/0x2c
[    1.419569] Exception stack(0xc48a5fb0 to 0xc48a5ff8)
[    1.419735] 5fa0:                                     00000000 00000000 00000000 00000000
[    1.419979] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.420222] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    1.420501] Code: 13570000 e1a06000 0a000043 e3a03002 (e5c03000)
[    1.420874] ---[ end trace 0000000000000000 ]---

---
# bad: [7643a9ca9f8e08f71e15f89dd74863635e981e03] ARM: pxa: convert to multiplatform
# good: [3123109284176b1532874591f7c81f3837bbdc17] Linux 5.18-rc1
git bisect start 'HEAD' 'v5.18-rc1'
# good: [9b03d7f95bd4d97101ecb8ea1e822103b81fdb2d] ARM: pxa: mainstone-wm97xx: use gpio lookup table
git bisect good 9b03d7f95bd4d97101ecb8ea1e822103b81fdb2d
# good: [764063eee7620ea9abb940068a7ad0e7f9efa1b6] cpufreq: pxa3: move clk register access to clk driver
git bisect good 764063eee7620ea9abb940068a7ad0e7f9efa1b6
# good: [5153474f0a4388b7ddb59add4be73bfb42b2007f] ARM: mmp: remove tavorevb board support
git bisect good 5153474f0a4388b7ddb59add4be73bfb42b2007f
# good: [2746f7c78b428c8b01b691a29a972c08101ae343] ARM: PXA: fix multi-cpu build of xsc3
git bisect good 2746f7c78b428c8b01b691a29a972c08101ae343
# good: [73d5106e9489464eac84362705e93bcf3b376123] ARM: pxa: remove support for MTD_XIP
git bisect good 73d5106e9489464eac84362705e93bcf3b376123
# first bad commit: [7643a9ca9f8e08f71e15f89dd74863635e981e03] ARM: pxa: convert to multiplatform
