Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB0820F121
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 11:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129F4899C4;
	Tue, 30 Jun 2020 09:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64587899C4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 09:06:49 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id n6so17872043otl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ua6KQmMz2zB2S0ojYXCHiljzMuoWlbIQTOHUIrgpyOg=;
 b=SIJgIcJNeGlNjJNR4QSHtTlBmx1LRaWpB2wWXf1bFgFRzEizcQxWn0K60pDboed1B4
 7lOBM16S9szhfFDVH1R5zYZ6xuEGWFqXAoaGVPcPosmUavgbWDrOFCsula++qWBh2vji
 2H/OmMvy0XEy5tL19ScokNOzEkqikbEqN+b8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ua6KQmMz2zB2S0ojYXCHiljzMuoWlbIQTOHUIrgpyOg=;
 b=JOiwzA2yd33nF7P1FFJpjHst4OZOjNBCRxDLtmQ5GEGrleFO3nhz4wmtx2d8l8NaEc
 ecdFMf3+EyhhSkitOSaDWkoutFo9UNxRHKiscnw/QDhrTJqS39VdMECdBvQDINeqJjve
 VHoBSsTDejEj/3Ni3E++L6+kZRdOzG4W+scLMhC2Op7tqu09mUttfV+2r2qcQLmFVmhT
 9Fj3JjpV4t9pZ/CDd5wglp9BgeA3DPLnPzZUaFVKldp11HJjTlJb9XWSCO8KYwMWTkZD
 glXI1tMYIZ97yhipnloPbNJ6CfBfcVRrIoeWvSvWa9gDADX4q8syJGpiP6gB+0cXuzM0
 xZiw==
X-Gm-Message-State: AOAM533RJraDu4+CrVdkbQ28/LMEFWUTNuJ9v5ihDw/9AoyXT12LhFQC
 oIlz1mBaiBeVBJh+FuXdVHqQ+mWU3E2lVTZwcsmyhA==
X-Google-Smtp-Source: ABdhPJzgA836terLUs01oRz6oRTzmO5gWL6oDUnI1udUmJ7qzwNE/XH9gK1VuJsQp2RgruVvk9kU7WESwJPFYoy7vxg=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr4344979ota.188.1593508008446; 
 Tue, 30 Jun 2020 02:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
In-Reply-To: <f23dcf97-52c7-682f-f713-a74839696fe3@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 30 Jun 2020 11:06:37 +0200
Message-ID: <CAKMK7uHd7_uR9U9B2x=9cxJ_eowNZ67RoxcJ-0vt8QvCSK=h5w@mail.gmail.com>
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

On Mon, Jun 29, 2020 at 11:39 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 6/25/20 2:00 PM, Thomas Zimmermann wrote:
> > This patchset adds support for simple-framebuffer platform devices and
> > a handover mechanism for native drivers to take-over control of the
> > hardware.
> >
> > The new driver, called simplekms, binds to a simple-frambuffer platform
> > device. The kernel's boot code creates such devices for firmware-provided
> > framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> > loader sets up the framebuffers. Description via device tree is also an
> > option.
> >
> > Simplekms is small enough to be linked into the kernel. The driver's main
> > purpose is to provide graphical output during the early phases of the boot
> > process, before the native DRM drivers are available. Native drivers are
> > typically loaded from an initrd ram disk. Occationally simplekms can also
> > serve as interim solution on graphics hardware without native DRM driver.
>
> Cool, thank you for doing this, this is a very welcome change,
> but ... (see below).
>
> > So far distributions rely on fbdev drivers, such as efifb, vesafb or
> > simplefb, for early-boot graphical output. However fbdev is deprecated and
> > the drivers do not provide DRM interfaces for modern userspace.
> >
> > Patches 1 and 2 prepare the DRM format helpers for simplekms.
> >
> > Patches 3 to 7 add the simplekms driver. It's build on simple DRM helpers
> > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> > pageflips, SHMEM buffers are copied into the framebuffer memory, similar
> > to cirrus or mgag200. The code in patches 6 and 7 handles clocks and
> > regulators. It's based on the simplefb drivers, but has been modified for
> > DRM.
> >
> > Patches 8 and 9 add a hand-over mechanism. Simplekms acquires it's
> > framebuffer's I/O-memory range and provides a callback function to be
> > removed by a native driver. The native driver will remove simplekms before
> > taking over the hardware. The removal is integrated into existing helpers,
> > so drivers use it automatically.
> >
> > I tested simplekms with x86 EFI and VESA framebuffers, which both work
> > reliably. The fbdev console and Weston work automatically. Xorg requires
> > manual configuration of the device. Xorgs current modesetting driver does
> > not work with both, platform and PCI device, for the same physical
> > hardware. Once configured, X11 works.
>
> Ugh, Xorg not working OOTB is a bit of a showstopper, we cannot just go
> around and break userspace. OTOH this does seem like an userspace issue
> and not something which we can (or should try to) fix in the kernel.
>
> I guess the solution will have to be to have this default to N for now
> in Kconfig and clearly mention in the Kconfig help text that this needs
> a fixed Xorg modesetting driver before it can be enabled.
>
> Any chance you have time to work on fixing the Xorg modesetting driver
> so that this will just work with the standard Xorg autoconfiguration
> stuff?

Hm, why do we even have both platform and pci drivers visible at the
same time? I thought the point of this is that simplekms is built-in,
then initrd loads the real drm driver, and by the time Xorg is
running, simplekms should be long gone.

Maybe a few more details of what's going wrong and why to help unconfuse me?

> > One cosmetical issue is that simplekms's device file is card0 and the
> > native driver's device file is card1. After simplekms has been kicked out,
> > only card1 is left. This does not seem to be a practical problem however.
> >
> > TODO/IDEAS:
> >
> >       * provide deferred takeover
>
> I assume you mean akin to CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER ?
> I don't think you need to do anything for that, as long as you just
> leave the fb contents intact until requested to change it.

Yeah I think fastboot support is a requirement here, otherwise all the
deferred fb takeover should already happen automatically I think.

Also fastboot = flickerfree, depending whether you care more about
"fewer modesets to save time" or "less flickering because it's ugly"
:-)

Cheers, Daniel

> Right now with flickerfree boot we have fbcon on top of efifb and
> efifb does not do anything special wrt
> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
> ATM it does draw/restore the ACPI BGRT logo since since some firmwares
> don't draw that themselves, but that is not necessary in most cases
> and other then that all the deferred takeover magic is in the fbcon
> code, it does not bind to the fbdev (and thus does not draw to it)
> until the first time the kernel tries to output text to the console,
> together with the "quiet" kernel commandline argument that ensures
> that the fb is kept unmodified until e.g. a panic happens.
>
> With simplekms we would replace "fbcon on top of efifb" with
> "fbcon on top of emulated-fbdev on top of simplekms" so as long
> as the emulated-fbdev and simplekms code defer from say clearing
> the screen to black, but keep it as is. Then the fb contents
> should be preserved until fbcon decides to takeover the fbdev
> and draw to it.
>
> >       * provide bootsplash DRM client
>
> Hmm, I guess this might be interesting for simple cases, but
> although I would love to kill plymouth (I've become one of the
> upstream maintainers for it) I'm afraid it is not that easy,
> it does a bunch of stuff which will be tricky to do in the kernel:
>
> 1) Ask the user for diskcrypt passwords:
> https://ic.pics.livejournal.com/hansdegoede/13347631/1496/1496_900.png
>
> 2) Show a nice splash + progressbar when installing updates in
> offline updates mode:
> https://ic.pics.livejournal.com/hansdegoede/13347631/899/899_900.png
>
> Still this would be nice for the non diskcrypt case I guess, then
> we could not use plymouth during normal boot and only use it
> for offline updates and it would also be nice for various embedded
> cases.
>
> Regards,
>
> Hans
>
>
>
>
>
> >       * make simplekms usable with ARM-EFI fbs
> >
> > Thomas Zimmermann (9):
> >    drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
> >    drm/format-helper: Add blitter functions
> >    drm: Add simplekms driver
> >    drm/simplekms: Add fbdev emulation
> >    drm/simplekms: Initialize framebuffer data from device-tree node
> >    drm/simplekms: Acquire clocks from DT device node
> >    drm/simplekms: Acquire regulators from DT device node
> >    drm: Add infrastructure for platform devices
> >    drm/simplekms: Acquire memory aperture for framebuffer
> >
> >   MAINTAINERS                            |   6 +
> >   drivers/gpu/drm/Kconfig                |   6 +
> >   drivers/gpu/drm/Makefile               |   1 +
> >   drivers/gpu/drm/drm_format_helper.c    |  96 ++-
> >   drivers/gpu/drm/drm_platform.c         | 118 ++++
> >   drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
> >   drivers/gpu/drm/tiny/Kconfig           |  17 +
> >   drivers/gpu/drm/tiny/Makefile          |   1 +
> >   drivers/gpu/drm/tiny/cirrus.c          |   2 +-
> >   drivers/gpu/drm/tiny/simplekms.c       | 906 +++++++++++++++++++++++++
> >   include/drm/drm_fb_helper.h            |  18 +-
> >   include/drm/drm_format_helper.h        |  10 +-
> >   include/drm/drm_platform.h             |  42 ++
> >   13 files changed, 1217 insertions(+), 8 deletions(-)
> >   create mode 100644 drivers/gpu/drm/drm_platform.c
> >   create mode 100644 drivers/gpu/drm/tiny/simplekms.c
> >   create mode 100644 include/drm/drm_platform.h
> >
> > --
> > 2.27.0
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
