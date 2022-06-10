Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8E546F7E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 00:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E4C10F3B7;
	Fri, 10 Jun 2022 22:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E052210F3B7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 22:02:25 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id z15so95485uad.7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 15:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+SM2akCQzrthDzYZBszJmpgu7bpMyjRvj+trHjf7e14=;
 b=IIztVrHpyLZLuvTgPWly4g7s1juC88Uwqwt0XV+e/HSgcTMKmVqMhJSbR/+PjfMcfE
 91E0zd9NynrKU2REmjWWBX8EhaL89NDd8xKr9AOGzO1sGrbjQU//aEUMwDyE4y88GUMY
 qFK1klp/NszYLjIPtgykKd/pNxXD9g3cWZwy/SpdxnKzlATfRMXeaHIiY8v1wcTfWpko
 cKp6HVf2wDxgvyHERpQcXtHbgqMuYaeapkIc6+ET+01rlW5oR+69hIXSUpm5+Azn0QrJ
 DGU7aAmkg/8VTo+FlKmytVMiJIDHI/ojaiF8iVxsq1plavBXoZByhvTVaGKbkm3rVnd+
 HbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+SM2akCQzrthDzYZBszJmpgu7bpMyjRvj+trHjf7e14=;
 b=5HNrBCa1yIgjuDB50j1RnA7HysTMNgGWY9Dgj4PjaXiJrq77Azw53DOAhLFfpPdrxd
 EQVQJ1nQniOxS0WZRetbyVhMK6ctDm+BMBrgELD5VkotghhWe58r9dKCes18zFJF2WDT
 9hrSAH2xMsvaWxUbwGuPy/6Zd/H4napT+lJbtOulggJ4+5NPcBZTR1sAHw9OOqgBy2y7
 RgBg9aY2kUuqK91h1K2R0GH1cREeEI2FCiHIg08BCtQ4wTbBNj7YeZZnHXKvP1OD/dD3
 WhRTD7yi9C/nt/skATp2yR0M2fDcVGu3eyu0UHGsWizkEON+fJ8iXx/r0PoYzt1lUs+r
 43Tw==
X-Gm-Message-State: AOAM5300xcMcTDWl9KFNdoH7UnBExoheE7RS+yhcy5Y1Ny0CKxnCns3V
 GNcRiETopA5gu1iNym55X/HdhF+2UA2uAzHqde8=
X-Google-Smtp-Source: ABdhPJza1z2uHjwnQGsQDn1h4LNkKxIR3kMsJA4Zvq2DERw1Y537lV2k6iAnERnxPxhYGvGmBVGBLXvjurxt+4oMYbw=
X-Received: by 2002:ab0:142b:0:b0:379:54a7:ad41 with SMTP id
 b40-20020ab0142b000000b0037954a7ad41mr1815303uae.23.1654898545001; Fri, 10
 Jun 2022 15:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
 <3648b281-c6b0-a91c-2a4f-ddbee6988b3f@i2se.com>
 <CALeDE9OkN5Vq-_L=VzSdKK0=6dKrNBX1q3zm3ZaNX8Jy9VJ35w@mail.gmail.com>
 <fb2035d3-5322-7b03-e9fc-89ce1f892db6@i2se.com>
In-Reply-To: <fb2035d3-5322-7b03-e9fc-89ce1f892db6@i2se.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 10 Jun 2022 23:02:14 +0100
Message-ID: <CALeDE9NhuXmGBxRPW++d1bwwg6GHZ9Oc8PaC0dD4-3Us1xfuSQ@mail.gmail.com>
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
To: Stefan Wahren <stefan.wahren@i2se.com>
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
Cc: Peter Mattern <pmattern@arcor.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 9, 2022 at 10:33 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Hi Peter,
>
> Am 09.06.22 um 13:52 schrieb Peter Robinson:
> >>>>> As of Linux 5.18.0, module vc4 apparently isn't working on Raspberry Pi
> >>>>> 3B any more.
> >>>>>
> >>>>> If a monitor is attached to the device, the boot messages show up as
> >>>>> usual, but right when KMS starts, the screen turns black. Similarly, the
> >>>>> screen also turns black when the module is blacklisted at boot time and
> >>>>> loaded from the running system.
> >>>>> The problem looks quite similar to the one posted some months ago in [1].
> >>> If I understand you properly, it results in a blank screen if the
> >>> monitor is connected, but the system is still responsive?
> >>>
> >>> If so, it's a very different problem than the link you provided, since
> >>> it was occurring when no monitor was connected and resulted in a total
> >>> system hang.
> >>>
> >>>>> Unfortunately, looking through systemd's journal didn't seem to yield
> >>>>> any real hint. Nevertheless, the results from grepping vc4 are
> >>>> I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
> >>>> can confirm the regression. Maxime would know what might be up here?
> >> i assume you are using the downstream DTB?
> > In this case it's the one in the Linux kernel (not sure if that's
> > upstream or downstream in this context) not the one provided by the
> > RPi firmware.
>
> okay thanks. I tried the kernel config but its huge.

Welcome to distro configs.

> Is it correct that the issue occurs with your kernel config, but not
> with multi_v7_defconfig?

I've not tried it, ultimately the distro config is where it's used and
the rpi config within that hasn't changed for some time.

> >
> >> Please provide the version/date of the GPU firmware?
> > [    6.205121] raspberrypi-firmware soc:firmware: Attached to firmware
> > from 2022-05-24T13:26:52
> > Which is git f145afc
> This is good. I had issues with older firmware which didn't implement
> RPI_FIRMWARE_NOTIFY_DISPLAY_DONE. So it must be something different.
