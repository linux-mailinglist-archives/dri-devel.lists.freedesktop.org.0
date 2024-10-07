Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F49935C9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 20:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0BB10E3F5;
	Mon,  7 Oct 2024 18:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cfpW+PD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB4A10E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 18:13:29 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e28e9fba7c5so262018276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728324808; x=1728929608;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=urCebPFkojhiQ6IxvjO3sxo7nIgIH4D+/pvLF1lTl2I=;
 b=cfpW+PD8m9eSIMiQBkf/nZ/zk625Zf7d0dLETumyay+JpBdi/JHeY71mPqrEfxNLZT
 JmgfAMCataCtMAhA1eOlrN1I/QxtJUz4VTwfrxPK1Qq9HAyyu7Ctst3UTzqABypJo97A
 R9gzrOWWSbmlj2mDpLIb5LCYRgwcxkp/A9sMAlDuBsoOUg6TT8aYC28WMPKDGi2FqQPU
 eU0Wy5hGiJEZl1EIos9sDqtM4i+f6TsRZpShgDMBwfu2VIKyHjCv1cXUpNds9Vmb83S/
 T6G1Odpw1ZRVZyq1RmX/CRUoB8uvVPjWzzqYcYHqMlpBdFyyCWWlNx3sV42LsUZErhhq
 l2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728324808; x=1728929608;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=urCebPFkojhiQ6IxvjO3sxo7nIgIH4D+/pvLF1lTl2I=;
 b=ufGtQO8GHDM7NE05EGvbFABHLCYmwRNuMMQzDgdGupSo5tzg/b/BeH90FqAAuoqxRK
 diZlcnvnmLKm5Vib54+tq4IgrEYKKGqeuU1OTXO0825tLWJ1UG440POFxHKnoNjtEAzP
 QfMjGT1wNGgTBaOng+4hXLhbgtMwWE+AkExk/BHuOu8Lti7wpzjpLbXBgf3b2jvYPz5B
 M+nt7qnqXm3EHAwUwsrbD+1fz3XWTopAsWYBFqIG0KghutkBwyTgmKfbAwFMDiplDEcl
 8c7yX20a670LAIFGhnn1N0sxbsOE80GsE4T7/ahHjqo54R8Kh4YkCu9AUAhY3E834304
 16uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpl/ZQqZU1QoPRNqTkJOAQqc/VRJVZ2KRpf+4nvATOPD3V2AYzvSIZfT5nYGejDszyjH3Otl0dKo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHIdnIcneFEkdUL/FYW+GGp6TNTHUfcZ8Ur96HxWH0IvFBWWOQ
 Fc/m4H0wO2HMI8xyQ8V9IQmHcyfFbwCJ8JehoT2e0QEe+D8FQTOiYIjyBSLIkfL0057USZt12Lx
 RVCQezfTXW69iCIzB2KJEZFQmZ94lEIteMt94UG4T7WZ9W02AXZc=
X-Google-Smtp-Source: AGHT+IF71nZwpZkL9kv3ZicwES5z+M6N0JZdK/FjEeAvDpb6FkbEQ9oPdpeC5/ctPSCtxG0VK9kHMdn/Ii+vqtAFHDQ=
X-Received: by 2002:a05:6902:1b92:b0:e26:36e7:463f with SMTP id
 3f1490d57ef6-e28936c623bmr9499656276.12.1728324808248; Mon, 07 Oct 2024
 11:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20241007115937eucas1p1230341a23b39c7b935812cc62825f2f7@eucas1p1.samsung.com>
 <20240621152055.4180873-21-dave.stevenson@raspberrypi.com>
 <37051126-3921-4afe-a936-5f828bff5752@samsung.com>
In-Reply-To: <37051126-3921-4afe-a936-5f828bff5752@samsung.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Oct 2024 19:13:12 +0100
Message-ID: <CAPY8ntDSgK4BdW9VdJY2c=kmekHFYXfVmh=b-Zo1Cof6Gum0Tg@mail.gmail.com>
Subject: Re: [v2,20/31] drm/vc4: Introduce generation number enum
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek

On Mon, 7 Oct 2024 at 12:59, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Dave,
>
> On 21.06.2024 17:20, Dave Stevenson wrote:
> > From: Maxime Ripard <mripard@kernel.org>
> >
> > With the introduction of the BCM2712 support, we will get yet another
> > generation of display engine to support.
> >
> > The binary check of whether it's VC5 or not thus doesn't work anymore,
> > especially since some parts of the driver will have changed with BCM2711,
> > and some others with BCM2712.
> >
> > Let's introduce an enum to store the generation the driver is running
> > on, which should provide more flexibility.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> This patch landed recently in linux-next as commit 24c5ed3ddf27
> ("drm/vc4: Introduce generation number enum"). In my tests I found that
> it introduces the following warning on Raspberry Pi3B+ board:
>
> ================================================
> WARNING: lock held when returning to user space!
> 6.11.0-rc5+ #15405 Tainted: G         C
> ------------------------------------------------
> (udev-worker)/161 is leaving the kernel with locks still held!
> 1 lock held by (udev-worker)/161:
>   #0: ffff80008338bff8 (drm_unplug_srcu){.?.?}-{0:0}, at:
> drm_dev_enter+0x0/0xdc
>
>
> I suspect that the error path is somewhere broken and the conversion
> triggered that path.

I must remember to test with lockdep debugging enabled.

> A wild guess (noticed by grepping for 'drm_dev_enter') is that the
> following chunk is broken:
>
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> > index 933177cb8d66..7380a02a69a2 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -224,7 +224,7 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
> >       if (!drm_dev_enter(drm, &idx))
> >               return;
> >
> > -     if (hvs->vc4->is_vc5)
> > +     if (hvs->vc4->gen == VC4_GEN_4)
> >               return;
> >
> >       /* The LUT memory is laid out with each HVS channel in order,
>
> as changing the above check to 'if (hvs->vc4->gen > VC4_GEN_4)' fixes this issue (tested also on top of linux-next). I think that one has to review the checks again as well as the error paths in the driver.

It's actually "drm/vc4: hvs: Don't write gamma luts on 2711" that
introduced the problem - we need a drm_dev_exit before returning. The
conversion is actually wrong though, so that needs fixing too.

The same is true in vc4_hvs_atomic_flush that we have a return after
having called drm_dev_enter, and no drm_dev_exit.

It looks like I've got a job in the morning - thanks for the report.

  Dave

> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
