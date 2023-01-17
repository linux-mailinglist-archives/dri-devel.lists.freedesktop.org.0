Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6166E7AF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 21:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F11E10E5CA;
	Tue, 17 Jan 2023 20:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A95110E5CA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 20:26:42 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id q125so21777529vsb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 12:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7rC0mNjXax5vqLz2OAo+EH0y+cJfjyIAm7sm9u5PvgQ=;
 b=l8ScoHRzhdB1B8pI8Khp6ltrweNoS1hlpZiUDm7MseGmFV2WAIGRxHuhB7ePcXeCvt
 ioI41nMH18thAKCFMTf1A710J56lK8GBm/RU6iy2MdIiSqTLfWvuOnlrQQCtE33wY1eJ
 HOA4ZQLr6ebPrlrAWe67SuWmKcLwR8wYbNmbsWyQmZYxeOI0IbjqQHsT37bZhXSuKMQd
 pYtUuS9rIqgVPrKk2Hhd3o5QSADvDPNWmG2IPYfceEmwynTCIgquFVjbxNdCznm1PZdK
 G3EXfyjza6+kgwCSdeNiUWaxEP5fGdq1Y93kp8phlF8FOW84kYY41A6WuFvNx3NrzUKN
 KHCw==
X-Gm-Message-State: AFqh2kqiS+CmIayFvZxb4SwBU+23KnyMPrhNfLRMS8S9p5qkSIDEdjw1
 HPhtD+6iBVKIcxw12ZjklbllDedNvJHIwg==
X-Google-Smtp-Source: AMrXdXu+KG12FJMzkCu+IMzWtvulS93S2nInkrNF8t8B7MnBLewJ9DL9tjDaH0kXbJ94EeHAERLhOg==
X-Received: by 2002:a67:f9cd:0:b0:3d3:caad:f74d with SMTP id
 c13-20020a67f9cd000000b003d3caadf74dmr2263609vsq.9.1673987200926; 
 Tue, 17 Jan 2023 12:26:40 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05620a244400b00706adbdf8b8sm788596qkn.83.2023.01.17.12.26.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 12:26:40 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 188so35544741ybi.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 12:26:39 -0800 (PST)
X-Received: by 2002:a25:9012:0:b0:7b8:a0b8:f7ec with SMTP id
 s18-20020a259012000000b007b8a0b8f7ecmr707665ybl.36.1673987199250; Tue, 17 Jan
 2023 12:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
In-Reply-To: <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 21:26:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
Message-ID: <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
Subject: Re: remove arch/sh
To: Rob Landley <rob@landley.net>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Tue, Jan 17, 2023 at 8:01 PM Rob Landley <rob@landley.net> wrote:
> On 1/16/23 01:13, Christoph Hellwig wrote:
> > On Fri, Jan 13, 2023 at 09:09:52AM +0100, John Paul Adrian Glaubitz wrote:
> >> I'm still maintaining and using this port in Debian.
> >>
> >> It's a bit disappointing that people keep hammering on it. It works fine for me.
> >
> > What platforms do you (or your users) use it on?
>
> 3 j-core boards, two sh4 boards (the sh7760 one I patched the kernel of), and an
> sh4 emulator.
>
> I have multiple j-core systems (sh2 compatible with extensions, nommu, 3
> different kinds of boards running it here). There's an existing mmu version of
> j-core that's sh3 flavored but they want to redo it so it hasn't been publicly
> released yet, I have yet to get that to run Linux because the mmu code would
> need adapting, but the most recent customer projects were on the existing nommu
> SOC, as was last year's ASIC work via sky130.

J4 still vaporware?

> My physical sh4 boards are a Johnson Controls N40 (sh7760 chipset) and the
> little blue one is... sh4a I think? (It can run the same userspace, I haven't
> replaced that board's kernel since I got it, I think it's the type Glaubitz is
> using? It's mostly in case he had an issue I couldn't reproduce on different
> hardware, or if I spill something on my N40.)
>
> I also have a physical sh2 board on the shelf which I haven't touched in years
> (used to comparison test during j2 development, and then the j2 boards replaced it).
>
> I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
> really convenient: neither of my physical boards boot from SD card so replacing
> the kernel requires reflashing soldered in flash. (They'll net mount userspace
> but I haven't gotten either bootloader to net-boot a kernel.)

On my landisk (with boots from CompactFLASH), I boot the original 2.6.22
kernel, and use kexec to boot-test each and every renesas-drivers
release.  Note that this requires both the original 2.6.22 kernel
and matching kexec-tools.  Apparently both upstreamed kernel and
kexec-tools support for SH are different, and incompatible with each
other, so you cannot kexec from a contemporary kernel.
I tried working my way up from 2.6.22, but gave up around 2.6.29.
Probably I should do this with r2d and qemu instead ;-)

Both r2d and landisk are SH7751.

Probably SH7722/'23'24 (e.g. Migo-R and Ecovec boards) are also
worth keeping.  Most on-SoC blocks have drivers with DT support,
as they are shared with ARM.  So the hardest part is clock and
interrupt-controller support.
Unfortunately I no longer have access to the (remote) Migo-R.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
