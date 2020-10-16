Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B02901DD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 11:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772286EAB5;
	Fri, 16 Oct 2020 09:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8928E89F3B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 09:30:16 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id j7so1669577oie.12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BuxoBgL5FPgzfyFK+h7t5twAipcFeEJzJUj49+jWv0Y=;
 b=HKtl4Uarr584790IuG2gsnR3/Aei1+QDg/BlBPxpLh8n7eJYHN/eCX3Lhlk5oeItA1
 Ync09fGa/mYUFkFGdxLkFr/ujXZSfuj1i7e/htPr1B+Zb1SRS1BuODuALCkx4CGRlnwZ
 fYAeN3osjtQSvMkDXx+42s97Q5nB2zGEslWnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BuxoBgL5FPgzfyFK+h7t5twAipcFeEJzJUj49+jWv0Y=;
 b=ApQ7LADtqaxZWaOPJTTklNrOflCAsbN46RK7ZmSgx5OuUQWUxP3X1VkdxE5icTPqDg
 8gWW7MT/E88/hA31EFTjbf7qx/Luep6Vl4KCG4w1RH0pKU0zEdNwIZTYW2PaBLxduq5N
 ogxP/+Z+P2YoJ9UfMi96nGiNl1HF88owyi65sJGaUwXn3/2usvQA+NIhc5JqpKrgIsJx
 Q0Wt2rniEe+OUCYsCkcsg9BMjBhsdYYdpJcbMh30RftJWzP4Pkb2Vq1Jp0VG68rxU31r
 OTgBcYe57gTj9UeTCMDr5eCTrtOmbuqM3TjTMhj0/A07UnAupBii4dp88HVb+SI3JnIQ
 JzNQ==
X-Gm-Message-State: AOAM532We7tfVjXpmY57K5AvmycC76Yn8Cf0EMGAfKFlQkLwiuBwa2kV
 bbqZwX+/Y1xEHMe5RgVtBKW+JeYG1h2rpkV5c2uOig==
X-Google-Smtp-Source: ABdhPJzcnsjVauaTFDfDVx6IhGqMOknuBHusqNFpDNGRR58fvEIZIM7Ej1pLcy6vYpd/R/I8KuOEDK6SUrUyAUTMhHY=
X-Received: by 2002:aca:52c4:: with SMTP id g187mr1677126oib.101.1602840615721; 
 Fri, 16 Oct 2020 02:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201016071254.2681-1-shawn.guo@linaro.org>
 <CAKMK7uHvDK6Cd2BBvUV-xtArD73gQVAp0ETBw=tLXrYUfOS-zw@mail.gmail.com>
 <20201016085407.GA5182@dragon>
In-Reply-To: <20201016085407.GA5182@dragon>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Oct 2020 11:30:04 +0200
Message-ID: <CAKMK7uHbhBzS=DdrDgpzYYaiCCkVLj=sAMUi3puLxjoF-Z+NbQ@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_vblank: use drm_warn_once() to warn undefined
 mode timing
To: Shawn Guo <shawn.guo@linaro.org>
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 16, 2020 at 10:54 AM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> On Fri, Oct 16, 2020 at 09:58:46AM +0200, Daniel Vetter wrote:
> > On Fri, Oct 16, 2020 at 9:13 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> > >
> > > Commit 5caa0feafcc6 ("drm/vblank: Lock down vblank->hwmode more") added
> > > WARN_ON_ONCE() for atomic drivers to warn the case that vsync is enabled
> > > before a mode has been set on CRTC.  This happens sometimes during the
> > > initial mode setting of a CRTC.  It also happens on Android running HWC2
> > > backed with drm_hwcomposer, where HWC2::SetVsyncEnabled could be called
> > > before the atomic mode setting on CRTC happens.
> > >
> > > In this case, there is nothing really bad to happen as kernel function
> > > returns as no-op.  So using WARN() version might be overkilled,
> > > considering some user space crash reporting services may treat kernel
> > > WARNINGS as crashes.  Let's drop WARN_ON_ONCE() and change drm_dbg_core()
> > > to drm_warn_once() for warning undefined mode timing.
> >
> > This indicates a bug in your driver. Please fix it there, not by
> > shutting up the core code complaining about that. Either you're
> > getting vblank timestamps when the vblank isn't set up yet
> > (drm_crtc_vblank_on/off) or there's some other race going on in your
> > driver code resulting in this.
>
> Thanks for the comment, Daniel.
>
> I'm hitting this warning on an Android running drm_hwcomposer.  I'm
> indeed getting vblank timestamps request before drm_crtc_vblank_on() is
> called.  I'm not sure this is a bug or race condition in the driver
> code, as both vblank timestamps and on/off requests are coming from user
> space ioctl for my case.  @Sean, that means the problem is in Android
> drm_hwcomposer code?

vblank request when the crtc is off should be rejected. Most drivers
got this wrong before I added the required drm_crtc_vblank_reset()
into atomic helpers in 51f644b40b4b ("drm/atomic-helper: reset vblank
on crtc reset")

Please make sure you have that, and that drm_crtc_vblank_reset is run
at driver load time. If the crtc is off, vblank ioctl should be
rejected. So this is definitely not a userspace bug, still a driver
bug. In general, userspace is not allowed to do anything that results
in dmesg spam at normal log levels. Anytime that happens it's a kernel
bug. And if it's a warning in core code, it's most likely a driver bug
since the core code tends to be better debugged about these things.
But there's ofc exceptions.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
