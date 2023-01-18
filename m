Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EB7671559
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 08:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9174C10E1E2;
	Wed, 18 Jan 2023 07:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD58C10E192
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 07:47:13 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id l14so19482712qvw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 23:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ckf5E8d0Cnw+micSJ5vxd9QO1KFnhxODfDAqVKF2Q0k=;
 b=1ACTOOy6CjXYheTbmNjfctaNOuVqQvox4Y0EnYUVDeaHs13YSJAKkAxK5iqz6EcIs4
 Cr+Cs3ub0k7be1d/y1VAYIh2987n5o/mg2WKKfUN+D/xkPXkKW3u+ST6DTaJmndvLIP3
 EmMDEOiw1b39tuBKIDOJ+bT+vcxajX5CObClukbgS1hBVDztnUoj5lS1ykVBX4SziNEH
 CpK2mXVNOpW5n+Y1atBNbkt+I52OVQ4sxc5zhWbTVAh0xyFF0UJX0kKe6pQpUK4Rxyum
 cKVdL/wzmYT7rNA9ggfR6fwBBatU/JvOY3IzEHKE4kpG0N6LqFZ+d6qj7O1lDWxV4i9s
 pc8Q==
X-Gm-Message-State: AFqh2kqfPrKyDFxLWF9JCuExS1X+m/OiNnATTDf/0Y4Emv37KaIgoQ9Q
 wwExNGmkfjwn5UWAiM2WpFVibhyB/4A3OQ==
X-Google-Smtp-Source: AMrXdXtRELpzjdamXfl8qQOIPLh2gdSy6WWiDmFXOtEQFEyiQd1wsGgr2yrnU3971PzogEzssUltIg==
X-Received: by 2002:a0c:e344:0:b0:534:6c34:36e2 with SMTP id
 a4-20020a0ce344000000b005346c3436e2mr8953477qvm.45.1674028032504; 
 Tue, 17 Jan 2023 23:47:12 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 bl19-20020a05620a1a9300b006fa9d101775sm20665865qkb.33.2023.01.17.23.47.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 23:47:11 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-4d0f843c417so343325247b3.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 23:47:11 -0800 (PST)
X-Received: by 2002:a81:bd6:0:b0:48d:1334:6e38 with SMTP id
 205-20020a810bd6000000b0048d13346e38mr726842ywl.316.1674028030903; Tue, 17
 Jan 2023 23:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
 <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
 <7329212f-b1a0-41eb-99b3-a56eb1d23138@landley.net>
In-Reply-To: <7329212f-b1a0-41eb-99b3-a56eb1d23138@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2023 08:46:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
Message-ID: <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
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

On Wed, Jan 18, 2023 at 5:50 AM Rob Landley <rob@landley.net> wrote:
> On 1/17/23 14:26, Geert Uytterhoeven wrote:
> > On Tue, Jan 17, 2023 at 8:01 PM Rob Landley <rob@landley.net> wrote:
> >> I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
> >> really convenient: neither of my physical boards boot from SD card so replacing
> >> the kernel requires reflashing soldered in flash. (They'll net mount userspace
> >> but I haven't gotten either bootloader to net-boot a kernel.)
> >
> > On my landisk (with boots from CompactFLASH), I boot the original 2.6.22
> > kernel, and use kexec to boot-test each and every renesas-drivers
> > release.  Note that this requires both the original 2.6.22 kernel
> > and matching kexec-tools.
>
> I make it a point to run _current_ kernels in all my mkroot systems, including
> sh4. What I shipped was 6.1 is:
>
> # cat /proc/version
> Linux version 6.1.0 (landley@driftwood) (sh4-linux-musl-cc (GCC) 9.4.0, GNU ld
> (GNU Binutils) 2.33.1) #1 Tue Jan 10 16:32:07 CST 2023

I think you misunderstood: renesas-drivers releases[1] are current
kernels.

   Linux version 6.2.0-rc3-landisk-01864-g0c6453b3e5f6 (geert@rox)
(sh4-linux-gnu-gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU
Binutils for Ubuntu) 2.38) #125 Tue Jan 10 14:29:01 CET 2023

I use 2.6.22 and kexec as a boot loader for newer kernels, to avoid
juggling CF cards.  I cannot install a newer base kernel on the CF,
as kexec is broken upstream.

> > Apparently both upstreamed kernel and
> > kexec-tools support for SH are different, and incompatible with each
> > other, so you cannot kexec from a contemporary kernel.
>
> Sure you can. Using toybox's insmod and modprobe, anyway. (That's the target I
> tested those on... :)
>
> Haven't messed with signing or compression or anything yet, my insmod is just
> doing syscall(SYS_finit_module) and then falling back to SYS_init_module if that
> fails and either fd was 0 or errno was ENOSYS. (Don't ask me why
> SYS_finit_module doesn't work on stdin...)
>
> https://github.com/landley/toybox/blob/master/toys/other/insmod.c#L31
>
> https://landley.net/toybox/downloads/binaries/0.8.9/toybox-sh4

Again, I think you're talking about something different.
Does kexec work for you?

> > I tried working my way up from 2.6.22, but gave up around 2.6.29.
> > Probably I should do this with r2d and qemu instead ;-)
>
> I have current running there. I've had current running there for years. Config
> attached...
>
> > Both r2d and landisk are SH7751.
>
> Cool. Shouldn't be hard to get landisk running current then.

Current kernels work fine on landisk with an old Debian userspace
on CF.  The 8139cp driver is a bit flaky: last time I tried nfsroot,
that didn't work well.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
