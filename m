Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98095436E2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2710F08C;
	Wed,  8 Jun 2022 15:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F58010F08C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:14:34 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id g6so1658554vsb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NxsB1Chj3tNX/41HImIY1zgXULTulTxGvHsce7DACcM=;
 b=le3MmjhMFKxtfIVGFaHhZaRmOvAUEyFwCs5xXOYL6nol6bUERxlxo/usqOQslYdCUt
 n2vdm78SLP7RLnsH2CpP5WX3G73T9xJ1E/4c1ggA1D+mQyfq6+GtJ/jyBiLTphbmn4oM
 j5hk8Sx2riBtbgflUngB+BkYwYj3BS9FFIi0WSbyMPq8Qdv+gYG0MROy3lNS/7HzQmY6
 n/hYb+GbXrGMujQdYmK9b1UwOENeEy81wMS1fBdWGGolgZAQIc3WCQ/QkOIT+eSN/nzV
 M0cZl97mWyij5/H9VQOqTXzoYQwnM6Pea0Aygm6n1tyLbkx/frgX+Fkdal6a+Sys6S8l
 2BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NxsB1Chj3tNX/41HImIY1zgXULTulTxGvHsce7DACcM=;
 b=3X1FdLGHtx1U3m5txgR10mGHHyDPa5IBF8SuOphSXpN9oQjCoVG0KIcNtXrEwagc4U
 h1RhNPIhZ/Iegz8ga8atPpRHd9KzwrQ11Nj5BIDfiaghz4dAQjnUMJTnqNtPLNaywU44
 0fgQkVNo0sa//AjI/7b4W/mebRyc8NSdy9VJwzdc8S7Hbxp4IdsEW2XWw+ubsheTPz0t
 FVDMw7yDXisLaNkDAmJyYLIJhgTc3LK2kyFz2hq5ucCs1k/Qu/NK30OPwKWPgRTQ55O4
 i5XcCVc0Cc2vybLJWOI1yV4dgAIqNiBJ/nw07aZ6FTqasfgLHPsurqssRKzh0HxsLSZL
 ibOw==
X-Gm-Message-State: AOAM53117T3kA0dbhj8kHp0voY2hCLKMT3hjeM2VLVKloIhRhdG2Wb8p
 9Bu6P4cl90vpTQClI02caDGFoGI86tcILP4HHqrslhHc6ks=
X-Google-Smtp-Source: ABdhPJzWy914bBh4zEU7xojf8Ail+alfYikx8hDgKS3PEbggzxkat8ZUet9brDOdlB91jbg/Sh+YK0ME6A0/mPLpl5A=
X-Received: by 2002:a67:cd16:0:b0:34b:95ab:715a with SMTP id
 u22-20020a67cd16000000b0034b95ab715amr12630854vsl.19.1654701273281; Wed, 08
 Jun 2022 08:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
In-Reply-To: <20220608143605.x4arwudst3nqeg7b@houat>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 8 Jun 2022 16:14:22 +0100
Message-ID: <CALeDE9OyJtvRGnN80JNW3AwwgAa_h_bs8GTLJzo06WK-o+_7Ng@mail.gmail.com>
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: stefan.wahren@i2se.com, Peter Mattern <pmattern@arcor.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

> > > As of Linux 5.18.0, module vc4 apparently isn't working on Raspberry Pi
> > > 3B any more.
> > >
> > > If a monitor is attached to the device, the boot messages show up as
> > > usual, but right when KMS starts, the screen turns black. Similarly, the
> > > screen also turns black when the module is blacklisted at boot time and
> > > loaded from the running system.
> > > The problem looks quite similar to the one posted some months ago in [1].
>
> If I understand you properly, it results in a blank screen if the
> monitor is connected, but the system is still responsive?

Yes, it boots fine, I see all serial console output and the module
loads etc, without a screen I didn't notice the issue

> If so, it's a very different problem than the link you provided, since
> it was occurring when no monitor was connected and resulted in a total
> system hang.
>
> > > Unfortunately, looking through systemd's journal didn't seem to yield
> > > any real hint. Nevertheless, the results from grepping vc4 are
> >
> > I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
> > can confirm the regression. Maxime would know what might be up here?
>
> I tested on 5.18 on my 3B and it works well. Could you paste your kernel
> configuration and config.txt somewhere?

It boots with output on 5.17.13, and not on 5.18. The config is at the
following link (Fedora config). The config.txt is below.
https://pbrobinson.fedorapeople.org/config-5.18.2-201.fc36.armv7hl

===
# Raspberry Pi 2
[pi2]
kernel=rpi2-u-boot.bin
dtoverlay=upstream

# Raspberry Pi 3
[pi3]
kernel=rpi3-u-boot.bin
dtoverlay=upstream

# Raspberry Pi 4
[pi4]
kernel=rpi4-u-boot.bin
dtoverlay=upstream-pi4

# Default Fedora configs for all Raspberry Pi Revisions
[all]
# Enable UART
# Only enable UART if you're going to use it as it has speed implications
# Serial console is ttyS0 on RPi3 and ttyAMA0 on all other variants
# u-boot will auto detect serial and pass corrent options to kernel if enabled
# Speed details: https://www.raspberrypi.org/forums/viewtopic.php?f=28&t=141195

# Terrible hack to work around U-Boot issues on most devices
enable_uart=1

# Early boot delay in the hope monitors are initialised enough to provide EDID
bootcode_delay=1

# We need this to be 32Mb to support VCHI services and drivers which use them
# but this isn't used by mainline VC4 driver so reduce to lowest supported value
# You need to set this to at least 80 for using the camera
gpu_mem=32

# Use eXtended firmware by default
start_x=1

# Stop the RPi turning on HDMI monitors on reboot
hdmi_ignore_cec_init=1

# New option to allow the firmware to load upstream dtb
# Will allow things like camera, touchscreen etc to work OOTB
upstream_kernel=1
===
