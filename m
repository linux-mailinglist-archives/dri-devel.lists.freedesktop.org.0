Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 599A150E6FC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 19:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DA710E260;
	Mon, 25 Apr 2022 17:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AF810E1E4;
 Mon, 25 Apr 2022 17:22:16 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so16771837fac.7; 
 Mon, 25 Apr 2022 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A90GU2nt1wfR5qUezEBsvRsm3534kJQKHIMyIIMxbsM=;
 b=nNX8TgQ/gKhvpOzh0A7buMvOAt5YVu45mHCh/pjdsJdKS64N7Y0310zvfv/P6y3UHb
 gNLTg5wJcJwVxcQeCsAvAco0ZC4ac1NmY8Qa8MYo39Ny8G1T7j9bHMxbSRpWLxjq9JAC
 XMJfxEvc28NKo52ucucEEaw5zvEjQA9Zf45ngs/K8ivGGxB7zdylWaZX0AWPgsA3VGxD
 z8RjJ6FhG3QxPEcfGVhnfvAkeenbSQGI3Y2PNapdyIglUuOa13gtgRksnJQ+/0xi/g5j
 MhgfYIdaNSYJVvQlt/ohDyxcAU8pMU/Auvxu8BX0suyYxh7yehcgOcrYcfWLQ6EiYG1C
 50qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A90GU2nt1wfR5qUezEBsvRsm3534kJQKHIMyIIMxbsM=;
 b=qZMWmNmBl/rphx6tVLKybsOsE2S9CtIWENV7znLvEqxoybhvlpacTlna8VIjVHqLlG
 IjSbmDc+MVy0zdBb7RjMr06IDpZTnh5bJ6ABt6ZcS6y1lULtVYLVstrxyOe7WAq5PHRQ
 N9HUK6DatXasN8GwFb7K4/pG5mg4Uo22w2Tp6gFdR8KFUzaoyCMwDNLbbH8Bosf7jsIn
 w0X+iqiG6lrZBWS5/55ptlN4aPhNUHF+795VRmXw55meHCmjWZ6qfvWuTWtXKoo2je0s
 7E3B5grxICGrGjPfgxcot7rAH8vS3CsQZ5QwmzQz8q8xguzZdvJooSny3LKHWKEqJH5G
 yE0w==
X-Gm-Message-State: AOAM533IyFrc5dQeDyIOGqz+3uk/5RABMsGFsbJfHC9bni4z9yTa8ahH
 guqDBqUzxq90jhh3NH5vG4MTtKbsEkivMKW/D04xK6EdXHU=
X-Google-Smtp-Source: ABdhPJw5kkTwd9IGRBgU4IGEanzmPdkCyCs0Gwi1KZkNvrQDjuO6G1O4XaJN2k2AXCDn6JR58SZASgTHcZLem5U1G9Q=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr11150222oaa.200.1650907335415; Mon, 25
 Apr 2022 10:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220423193145.3301ed06@desktop>
In-Reply-To: <20220423193145.3301ed06@desktop>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Apr 2022 13:22:04 -0400
Message-ID: <CADnq5_PXgFBXZ03LXE8qOdimzfKYGhzX1JnycJQcHWcMZdgJug@mail.gmail.com>
Subject: Re: Screen corruption using radeon kernel driver
To: Krylov Michael <sqarert@gmail.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel

On Mon, Apr 25, 2022 at 3:33 AM Krylov Michael <sqarert@gmail.com> wrote:
>
> Hello!
>
> After updating my Linux kernel from version 4.19 (Debian 10 version) to
> 5.10 (packaged with Debian 11), I've noticed that the image
> displayed on my older computer, 32-bit Pentium 4 using ATI Radeon X1950
> AGP video card is severely corrupted in the graphical (Xorg and Wayland)
> mode: all kinds of black and white stripes across the screen, some
> letters missing, etc.
>
> I've checked several options (Xorg drivers, Wayland instead of
> Xorg, radeon.agpmode=-1 in kernel command line and so on), but the
> problem persisted. I've managed to find that the problem was in the
> kernel, as everything worked well with 4.19 kernel with everything
> else being from Debian 11.
>
> I have managed to find the culprit of that corruption, that is the
> commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713 on the linux kernel.
> Reverting this commit and building the kernel with that commit reverted
> fixes the problem. Disabling HIMEM also gets rid of that problem. But it
> also leaves the system with less that 1G of RAM, which is, of course,
> undesirable.
>
> Apparently this problem is somewhat known, as I can tell after googling
> for the commit id, see this link for example:
> https://lkml.org/lkml/2020/1/9/518
>
> Mageia distro, for example, reverted this commit in the kernel they are
> building:
>
> http://sophie.zarb.org/distrib/Mageia/7/i586/by-pkgid/b9193a4f85192bc57f4d770fb9bb399c/files/32
>
> I've reported this bug to Debian bugtracker, checked the recent verion
> of the kernel (5.17), bug still persists. Here's a link to the Debian
> bug page:
>
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=993670
>
> I'm not sure if reverting this commit is the correct way to go, so if
> you need to check any changes/patches that I could apply and test on
> the real hardware, I'll be glad to do that (but please keep in mind
> that testing could take some time, I don't have access to this computer
> 24/7, but I'll do my best to respond ASAP).

I would be happy to revert that commit.  I attempted to revert it a
year or so ago, but Christoph didn't want to.  He was going to look
further into it.  I was not able to repro the issue.  It seemed to be
related to highmem support.  You might try disabling that.  Here is
the previous thread for reference:
https://lists.freedesktop.org/archives/amd-gfx/2020-September/053922.html

Alex
