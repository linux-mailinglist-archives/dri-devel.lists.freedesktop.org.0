Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C60B5213A6E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 14:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0572A6EB81;
	Fri,  3 Jul 2020 12:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719F66EB81
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 12:59:10 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k22so15097973oib.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 05:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zr1lF3450DSxuFqXhjRn34T0R5zTcmtCY4N4o1JWXe0=;
 b=hCwpsHTSRdGek84FN/70FItJnOHiPFVrTltk3/JD+zXrShqk8qdBntWNs9nEBRW3Ep
 ZjypFftHjZMgtaMZtgVgast+B0mw7HLqDz0NmAdxntvWapwGiKyFLlr1S3xX+wcrQx1l
 mQq4Ju24G2h8VFHfgqZdTcdJlIw4DA3/1EAGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zr1lF3450DSxuFqXhjRn34T0R5zTcmtCY4N4o1JWXe0=;
 b=ZUEVOh426SSWp160PEgEY11Gd0IV0ztYiFuM0JvqS9ZJE/OPepbX/UhTdlhCVe5qIZ
 1hTih01T2IoIEpE9F0GqxtwhFGLydEv+yKG0WWNS/BWoE9ohGVJ+HT+7GFou0wlibblZ
 OwHKKmLj4MNOWy9/ZuAw40uTrSKe8tFdepxrMqtZr3i1bAasOVQEfCrIrFgZLkeTeYVQ
 uTydbqg4WusjYfWyAu8rxWI74nZ8fZSWIVSV5F6bIWPbCCrAu9Y6qxs7Kc7bAng2CnRa
 yD/L7Ya2+zyrWrcgQau1fII5TX/WW0sk6ZwAL3oCPKgwCM1yb0dGUB4eaBS5yvVaU0dY
 2hzQ==
X-Gm-Message-State: AOAM531mpHtPJMQSIOz7ZbneV2j+TJAVQE+ucv7K0HKLu+uGDjOEqk7b
 U/CtSA6/Fx4POqh5ho1rmcjMK31+tKV6ALKrZ6cpsA==
X-Google-Smtp-Source: ABdhPJzTJ7G40tK0RMXnLTRAJOxoZ5/KIeK3LP9kSrnk9HeXtWaLwaDcPKuknF7EJ3NZVSodUgAWpG+HkmB79sas8HA=
X-Received: by 2002:aca:cc8e:: with SMTP id
 c136mr27827190oig.128.1593781149594; 
 Fri, 03 Jul 2020 05:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
 <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
 <cc6021b0-d874-240e-9fda-1cec3dfe6648@suse.de>
 <4bd25272-cab4-1044-2cab-296ee2abb9d6@redhat.com>
In-Reply-To: <4bd25272-cab4-1044-2cab-296ee2abb9d6@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 3 Jul 2020 14:58:58 +0200
Message-ID: <CAKMK7uFOYHRnOnxfWg9mwY-=2e47M2TDJJRCO-U44sfL5eEFwA@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 3, 2020 at 12:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 7/1/20 4:10 PM, Thomas Zimmermann wrote:
> > Hi Daniel,
> >
> > thanks for reviewing most of the patchset.
> >
> > Am 30.06.20 um 11:06 schrieb Daniel Vetter:
> >> On Mon, Jun 29, 2020 at 11:39 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>
> >>> Hi,
> >>>
> >>> On 6/25/20 2:00 PM, Thomas Zimmermann wrote:
> >>>> This patchset adds support for simple-framebuffer platform devices and
> >>>> a handover mechanism for native drivers to take-over control of the
> >>>> hardware.
> >>>>
> >>>> The new driver, called simplekms, binds to a simple-frambuffer platform
> >>>> device. The kernel's boot code creates such devices for firmware-provided
> >>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> >>>> loader sets up the framebuffers. Description via device tree is also an
> >>>> option.
> >>>>
> >>>> Simplekms is small enough to be linked into the kernel. The driver's main
> >>>> purpose is to provide graphical output during the early phases of the boot
> >>>> process, before the native DRM drivers are available. Native drivers are
> >>>> typically loaded from an initrd ram disk. Occationally simplekms can also
> >>>> serve as interim solution on graphics hardware without native DRM driver.
> >>>
> >>> Cool, thank you for doing this, this is a very welcome change,
> >>> but ... (see below).
> >>>
> >>>> So far distributions rely on fbdev drivers, such as efifb, vesafb or
> >>>> simplefb, for early-boot graphical output. However fbdev is deprecated and
> >>>> the drivers do not provide DRM interfaces for modern userspace.
> >>>>
> >>>> Patches 1 and 2 prepare the DRM format helpers for simplekms.
> >>>>
> >>>> Patches 3 to 7 add the simplekms driver. It's build on simple DRM helpers
> >>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> >>>> pageflips, SHMEM buffers are copied into the framebuffer memory, similar
> >>>> to cirrus or mgag200. The code in patches 6 and 7 handles clocks and
> >>>> regulators. It's based on the simplefb drivers, but has been modified for
> >>>> DRM.
> >>>>
> >>>> Patches 8 and 9 add a hand-over mechanism. Simplekms acquires it's
> >>>> framebuffer's I/O-memory range and provides a callback function to be
> >>>> removed by a native driver. The native driver will remove simplekms before
> >>>> taking over the hardware. The removal is integrated into existing helpers,
> >>>> so drivers use it automatically.
> >>>>
> >>>> I tested simplekms with x86 EFI and VESA framebuffers, which both work
> >>>> reliably. The fbdev console and Weston work automatically. Xorg requires
> >>>> manual configuration of the device. Xorgs current modesetting driver does
> >>>> not work with both, platform and PCI device, for the same physical
> >>>> hardware. Once configured, X11 works.
> >>>
> >>> Ugh, Xorg not working OOTB is a bit of a showstopper, we cannot just go
> >>> around and break userspace. OTOH this does seem like an userspace issue
> >>> and not something which we can (or should try to) fix in the kernel.
> >>>
> >>> I guess the solution will have to be to have this default to N for now
> >>> in Kconfig and clearly mention in the Kconfig help text that this needs
> >>> a fixed Xorg modesetting driver before it can be enabled.
> >>>
> >>> Any chance you have time to work on fixing the Xorg modesetting driver
> >>> so that this will just work with the standard Xorg autoconfiguration
> >>> stuff?
> >>
> >> Hm, why do we even have both platform and pci drivers visible at the
> >> same time? I thought the point of this is that simplekms is built-in,
> >> then initrd loads the real drm driver, and by the time Xorg is
> >> running, simplekms should be long gone.
> >>
> >> Maybe a few more details of what's going wrong and why to help unconfuse me?
> >
> > I tested simplekms with PCI graphics cards.
> >
> > Xorg does it's own scanning of the busses. It supports a platform bus,
> > where it finds the simple-framebuffer device that is driven by
> > simplekms. Xorg also scans the PCI bus, where is finds the native PCI
> > device; usually driven by the native driver. It's the same hardware, but
> > on different busses.
> >
> > For each device, Xorg tries to configure a screen, the Xorg modeset
> > driver tried to open the DRM device file and acquire DRM master status
> > on it. This works for the first screen, but DRM master status can only
> > be acquired once, so it fails for the second screen. Xorg then aborts
> > and asks for manual configuration of the display device.
> >
> > This can be solved by setting the platform device's bus id in the
> > xorg.conf device section. It just doesn't happen automatically.
> >
> > I found it hard to find a solution to this. Weston just opens a DRM
> > device file and uses whatever it gets. Ideally, Xorg would do the same.
> > That whole bus-scanning exercise gives it a wrong idea on which graphics
> > devices are available.
> >
> > One idea for a fix is to compare the device I/O-memory ranges and filter
> > out duplicates on the Xorg modeset driver. I don't know how reliable
> > this works in practice or if their are false positives.
>
> I think that this should work nicely, although I wonder how Xorg will
> get the memory-range for the simplefb platform device, it looks like
> it will need to parse /dev/iomem for this, or we need to add a
> new sysfs attr to the simplefb device for this. Adding the new sysfs
> attr has the added bonus that we only enable the duplicate based
> resource check for simplefb devices.

Uh why exactly does Xorg even need to do all this parsing? We're not
in a ums world anymore ...

Also, you'll never have a simplekms driver _and_ the real drm driver
bound at the same time, that's a kernel bug.

Really all this bus scanning is vestiges in Xorg from the old pre-kms
days, and there's no point. Scan all drm device nodes (not physical
devices) like anything remotely modern, and it's all good. Maybe that
means Xorg needs a drm bus to fit into this world, and only if that
gives you nothing, fall back to the historical real bus scanning.

> Hmm, I think we can actually fix this quite simply, for the platform
> device, check the basename of where the
> /sys/bus/platform/devices/XXXX/driver symlink points to and if it
> is simplekms ignore it, assuming that there will be another PCI
> or platform device which is the actual GPU.

Again, you're not going to have simplekms and the real driver bound at
the same time. Kernel guarantees that. Userspace isn't in the business
of second-guessing the kernel's device model, that only leads to pain
like the one we have here, were Xorg can't both use platform and pci
devices for some oddball reason :-/

> I guess that might cause a problem where the output-device driven
> through simplekms is not visible to Xorg in any other way, but
> I don't think that that ever happens?  And even if it does, then it
> is probably better to teach Xorg about it, since we likely want to
> replace simplekms with a more full-featured driver at some point
> anyways.
>
> Can you try commenting out the platform bus scanning code in Xorg's
> autoconfigure code and see if that fixes the no Xorg.conf case ?
>
> If it does the driver symlink trick will probably fix 99.9 %
> of all cases here, and we can worry about the others if we
> ever encounter them.
>
> > A more fundamental solution is to introduce a DRM bus in Xorg that
> > enumerates all available DRM device files. If there are any, no other
> > busses would be scanned.
>
> That would break the case where there are 2 cards and 1 has a kms
> driver and the other only supports fbdev. Admittedly this is a
> corner case, but I do believe that we cannot just go and break this.

Yeah but even for this case can't Xorg simply first scan drm drivers,
and then fbdev drivers (excluding the drm ones, that's pretty easy to
do since they're both bound to the same physical device in sysfs). Not
magic guesses at how the platform model works.

Also, we don't have to make this work with current Xorg code, since
it's a new driver that distros need to enable explicitly. So fixing
Xorg should be on the table.

Or we just forget about Xorg, and tell distros that this only works if
they have a reasonable wayland compositor that doesn't have an entire
hand-rolled device model.

-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
