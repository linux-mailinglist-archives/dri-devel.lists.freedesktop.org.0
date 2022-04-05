Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DBE4F340A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CC910E902;
	Tue,  5 Apr 2022 13:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF65710E905;
 Tue,  5 Apr 2022 13:24:55 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id b18so10894182qtk.13;
 Tue, 05 Apr 2022 06:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBCPhJo5YyS6XSPC6qSR2NczndtrlVmfcRjGORmxI/A=;
 b=DQ0ovByA1YEDF2Qxk3uOjxB06EnbFTDJRFD3IITrbG6YX9SGT3A68IdJr2fx1f8G6a
 lR/pWm9IdxYcycEV83K/WHomgeVSpKUoAGtrDssfBQVVkHVyZC3VHe7uGOhT+bRzfYvo
 0WMLFoDoy7Nr+ky5cwkvjYgKp/vo+I65GQbXmhtp5PERoEdqJngJBKNbZLpn7gbOrk1p
 BMoM7NQM4Kq5bS1Iyk8v3X4dc6l19S6+spNIyppVwbvY2QPR8EXCPu8CHc4M2vpFZ/3b
 ebzhgDwT1UspTfGGdfFbw31nR0KidZeuaYYi8QxtumX14Uy/nT4fcrHGfnhPvDqypEwc
 uZJw==
X-Gm-Message-State: AOAM531AnawFKkfVbt19OrlPVLCAijMtLNj21mg7tJ+EeT9IJXqgcJ7y
 5m17ss2WUPPzAFvvNWKGwWqIe9KsVLHQQw==
X-Google-Smtp-Source: ABdhPJyVlxjAHfAcWHZ6udh/swia7X/HPDbpZYnCiTmAUhp4opkb7saHxZskWQ5CwgJjwl5qbPmH2A==
X-Received: by 2002:a05:620a:2585:b0:680:f1f5:23ac with SMTP id
 x5-20020a05620a258500b00680f1f523acmr2126899qko.656.1649165093847; 
 Tue, 05 Apr 2022 06:24:53 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05622a174800b002e1e3f7d4easm11459454qtk.86.2022.04.05.06.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 06:24:52 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2db2add4516so135941807b3.1; 
 Tue, 05 Apr 2022 06:24:52 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr2679880ywb.132.1649165091759; Tue, 05
 Apr 2022 06:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-19-daniel.vetter@ffwll.ch>
 <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
 <Ykv/k/WoVemoCJJA@phenom.ffwll.local> <YkwAhSt9HlbxcuZo@phenom.ffwll.local>
 <408ffe9b-f09f-dc7e-7f5e-a93b311a06fa@redhat.com>
 <CAKMK7uHf6H8mhSm6eDHUruWK5Xc2cSPkJUX6v-jpeQfjS19dKw@mail.gmail.com>
 <e124af06-4f24-277a-543a-82b383f48cea@redhat.com>
 <CAKMK7uH4GgDQJZguT-k0QmgEAHYHuDEbBtjYje51_Rtqzud0yw@mail.gmail.com>
In-Reply-To: <CAKMK7uH4GgDQJZguT-k0QmgEAHYHuDEbBtjYje51_Rtqzud0yw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Apr 2022 15:24:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWr0L0r+MVU-=+_yeHKwK8BjF7_EJQxiJT5jMqS9FJUeQ@mail.gmail.com>
Message-ID: <CAMuHMdWr0L0r+MVU-=+_yeHKwK8BjF7_EJQxiJT5jMqS9FJUeQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Apr 5, 2022 at 1:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, 5 Apr 2022 at 11:52, Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> > On 4/5/22 11:24, Daniel Vetter wrote:
> > > On Tue, 5 Apr 2022 at 11:19, Javier Martinez Canillas
> > >> This is how I think that work, please let me know if you see something
> > >> wrong in my logic:
> > >>
> > >> 1) A PCI device of OF device is registered for the GPU, this attempt to
> > >>    match a registered driver but no driver was registered that match yet.
> > >>
> > >> 2) The efifb driver is built-in, will be initialized according to the link
> > >>    order of the objects under drivers/video and the fbdev driver is registered.
> > >>
> > >>    There is no platform device or PCI/OF device registered that matches.
> > >>
> > >> 3) The DRM driver is built-in, will be initialized according to the link
> > >>    order of the objects under drivers/gpu and the DRM driver is registered.
> > >>
> > >>    This matches the device registered in (1) and the DRM driver probes.
> > >>
> > >> 4) The DRM driver .probe kicks out any conflicting DRM drivers and pdev
> > >>    before registering the DRM device.
> > >>
> > >>    There are no conflicting drivers or platform device at this point.
> > >>
> > >> 5) Latter at some point the drivers/firmware/sysfb.c init function is
> > >>    executed, and this registers a platform device for the generic fb.
> > >>
> > >>    This device matches the efifb driver registered in (2) and the fbdev
> > >>    driver probes.
> > >>
> > >>    Since that happens *after* the DRM driver already matched, probed
> > >>    and registered the DRM device, that is a bug and what the reverted
> > >>    patch worked around.
> > >>
> > >> So we need to prevent (5) if (1) and (3) already happened. Having a flag
> > >> set in the fbdev core somewhere when remove_conflicting_framebuffers()
> > >> is called could be a solution indeed.
> > >>
> > >> That is, the fbdev core needs to know that a DRM driver already probed
> > >> and make register_framebuffer() fail if info->flag & FBINFO_MISC_FIRMWARE
> > >>
> > >> I can attempt to write a patch for that.
> > >
> > > Ah yeah that could be an issue. I think the right fix is to replace
> > > the platform dev unregister with a sysfb_unregister() function in
> > > sysfb.c, which is synced with a common lock with the sysfb_init
> > > function and a small boolean. I think I can type that up quickly for
> > > v3.
> >
> > It's more complicated than that since sysfb is just *one* of the several
> > places where platform devices can be registered for video devices.
> >
> > For instance, the vga16fb driver registers its own platform device in
> > its module_init() function so that can also happen after the conflicting
> > framebuffers (and associated devices) were removed by a DRM driver probe.
> >
> > I tried to minimize the issue for that particular driver with commit:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0499f419b76f
> >
> > But the point stands, it all boils down to the fact that you have two
> > different subsystems registering video drivers and they don't know all
> > about each other to take a proper decision.
> >
> > Right now the drm_aperture_remove_conflicting_framebuffers() call signals
> > in one direction from DRM to fbdev but there isn't a communication in the
> > other direction, from fbdev to DRM.
> >
> > I believe the correct fix would be for the fbdev core to keep a list of
> > the apertures struct that are passed to remove_conflicting_framebuffers(),
> > that way it will know what apertures are not available anymore and prevent
> > to register any fbdev framebuffer that conflicts with one already present.
>
> Hm that still feels like reinventing a driver model, badly.
>
> I think there's two cleaner solutions:
> - move all the firmware driver platform_dev into sysfb.c, and then
> just bind the special cases against that (e.g. offb, vga16fb and all
> these). Then we'd have one sysfb_try_unregister(struct device *dev)
> interface that fbmem.c uses.
> - let fbmem.c call into each of these firmware device providers, which
> means some loops most likely (like we can't call into vga16fb), so
> probably need to move that into fbmem.c and it all gets a bit messy.
>
> > Let me know if you think that makes sense and I can attempt to write a fix.
>
> I still think unregistering the platform_dev properly makes the most

That doesn't sound very driver-model-aware to me. The device is what
the driver binds to; it does not cease to exist.

> sense, and feels like the most proper linux device model solution
> instead of hacks on top - if the firmware fb is unuseable because a
> native driver has taken over, we should nuke that. And also the
> firmware fb driver would then just bind to that platform_dev if it
> exists, and only if it exists. Also I think it should be the
> responsibility of whichever piece of code that registers these
> platform devices to ensure that platform_dev actually still exists.
> That's why I think pushing all that code into sysfb.c is probably the
> cleanest solution.

Can't you unbind the generic driver first, and bind the specific driver
afterwards? Alike writing to sysfs unbind/driver_override/bind,
but from code?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
