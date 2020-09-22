Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D33273C89
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A9B6E829;
	Tue, 22 Sep 2020 07:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7460B89D7F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 04:11:11 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id q13so9465507vsj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 21:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=82DxSWpxsHCA8jyBc1KAE4+/FRKa8lh8HBsyuhDwhbw=;
 b=V0tFx2/61mzkwTOAmhe0jZOoeQmUoIfy2i05w7LAWCe+/WSVKXzmKCVNh4a/BayTvx
 Fqs/6BNZ9vEvnjsBxko+FfKCAe+B6hSVg8uGQVZIo7l0gpF4SyRpkDYzUk0an+56ksPR
 iA2MuPI/5KaT+6elwp/mvAYq4LAfd3ifMq5lXfCvBdEmxwCGnapYmliDlkJT+i3FknUy
 Nt49Ly1K6+giiXxVAAdnBQkOqF7yAb+a8pHzqgjTB1GaP+SsQt28qE/y6dlXRYvL1/cl
 i1O8PZIqtmxdU3ipTRu8fXVvgICGhgpnKBxLA6SoB/fzyxxCiStDRXs/GCim/S7Km0V/
 jPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=82DxSWpxsHCA8jyBc1KAE4+/FRKa8lh8HBsyuhDwhbw=;
 b=ubE07pu1AWxpAWeSclfqy8lGTaNYLeTz/c0kRl+xPtH/mPagW+BzCoDKBXGVqBV2fu
 BsZVNvjFDC8fJf89PEM4QaHtP9mOrRdQnVT5k6GzV4K3DLVgWW/o+5OEPAVURfP84CXT
 kE8AqZDzaTUSBqIdJ6xf99ibb8awlxZUPtjG+FFfH0pGQFTM9Efr1QlNMWHo/HEWL0Ma
 m7BjSTzV+av5uZ+hsn2+v4fe2s1JtDDNZnKLY+1X2HxYJz8d5zeZ1gCg3sqQmgwET1px
 XYPsELtUOcnen5Nev5aSV0dyOeYmJPipLq00jdDKHY81JInPxDpPOJFmupaF7Q775Ci5
 FnFA==
X-Gm-Message-State: AOAM533wx1arHkH0TsLVqoVcLyNCND0i6H4tnlJxPhPLxkhFyAJSBWnV
 JeAhaX5aplzUh1oz/636uFiaIYTTc4xYkLunqjYwng==
X-Google-Smtp-Source: ABdhPJy2gZHYson/kOX5GXKhm2EP3dJOn9icv/4vxx9r8Ppg/qJuqw0fvmemdOll7KLYP+eJZkckmAvSKNrXH8TBzWE=
X-Received: by 2002:a67:8a8a:: with SMTP id m132mr2006215vsd.14.1600747869833; 
 Mon, 21 Sep 2020 21:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200609200446.153209-1-linus.walleij@linaro.org>
 <20200609200446.153209-2-linus.walleij@linaro.org>
 <CAMn1gO52PQ-dFbCU49FCnJZz=gyLEE3F2vZ5rtbF_C-H+ur7qw@mail.gmail.com>
 <CACRpkdYnXXvPAbCMdG8OOPYqWqDHFh_=z9mR5vKZ+ri8sDyAgA@mail.gmail.com>
In-Reply-To: <CACRpkdYnXXvPAbCMdG8OOPYqWqDHFh_=z9mR5vKZ+ri8sDyAgA@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 21 Sep 2020 21:10:57 -0700
Message-ID: <CAMn1gO5svZNrzWYMO5mbcCYbQ8St5UjksztcXQ7OubtOTpdZyw@mail.gmail.com>
Subject: Re: [PATCH 2/4] video: fbdev: amba-clcd: Retire elder CLCD driver
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:36 +0000
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
Cc: Kevin Brodsky <Kevin.Brodsky@arm.com>, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 21, 2020 at 2:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Sep 15, 2020 at 3:10 AM Peter Collingbourne <pcc@google.com> wrote:
> > On Tue, Jun 9, 2020 at 1:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > All the functionality in this driver has been reimplemented
> > > in the new DRM driver in drivers/gpu/drm/pl111/* and all
> > > the boards using it have been migrated to use the DRM driver
> > > with all configuration coming from the device tree.
> >
> > Android's FVP configuration still uses FBDEV.
>
> But all DRM drivers support frame buffer emulation so I don't
> see how this can be a problem? The new DRM driver provides
> a framebuffer.

Okay, I was unaware of that feature and it is disabled in Android
kernels. I am now testing the DRM driver by applying this diff to
FVP's kernel config:

diff --git a/fvp.fragment b/fvp.fragment
index b12be37278a4..481767c06ac9 100644
--- a/fvp.fragment
+++ b/fvp.fragment
@@ -1,5 +1,6 @@
-CONFIG_FB=m
-CONFIG_FB_ARMCLCD=m
+CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PL111=m
+CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_MOUSE_PS2=m
 CONFIG_SERIO_AMBAKMI=m
 CONFIG_MMC_ARMMMCI=m

> I'm also confused about how this can be in use.
> fvp-base-revc.dts includes rtsm_ve-motherboard.dtsi
> where the PL111 is defined.
>
> commit f1fe12c8bf33241e04c57a0fc5b25b16ba77ba2d
> "ARM: dts: Modernize the Vexpress PL111 integration"
> changes the DTS for the FVP such that only the new DRM
> driver really works with it: it removes the panel-dpi encoded
> panel and defines the panel
> "arm,rtsm-display" for FVP and that is *only* supported
> by drivers/gpu/drm/panel/panel-simple.c from DRM.

That commit predates commit fa083b99eb284186ae65193ae856ef2801a1646d
which added the DTS for FVP, along with a panel-dpi compatible panel
which is still present:
https://github.com/torvalds/linux/blob/98477740630f270aecf648f1d6a9dbc6027d4ff1/arch/arm64/boot/dts/arm/fvp-base-revc.dts#L189

> The upstream FVP has been using the new DRM driver
> by default since
> commit 37ad688497785c9ad1471236e28efda1e2f39741
> "arm64: defconfig: Switch to PL11x DRM driver"
> in january 2019.

That only affected defconfig though which Android doesn't use.

> Are you using old or outoftree devicetrees with a newer
> kernel?

No, I'm using an up-to-date device tree (pretty sure about that
otherwise I wouldn't have hit problems like
https://android-review.googlesource.com/c/device/generic/goldfish/+/1394347
).

> > While it would be great
> > to see it migrated to DRM, this first requires resolving a design
> > incompatibility between Android's composer and DRM devices that only
> > support software rendering. I proposed a patch that would help resolve
> > this [1], but there was disagreement about the approach and I haven't
> > had time to get back to this.
> >
> > Can this please be reverted until FVP on Android can be migrated to DRM?
>
> We need a clear technical reason, I understand that using DRM
> directly might be a problem, but DRM supports full framebuffer
> emulation and from a userspace point of view, what the new
> driver provides should be equivalent.
>
> I can think of problems like Android seeing the new fancy
> DRM userspace ABI but surely it can be instructed to
> ignore that and just use the framebuffer emulation instead?
>
> If there is anything else making DRMs framebuffer emulation
> substandard I am sure the DRM developers would like to know,
> especially if it makes Android unhappy.

Okay, I found at least two issues so far. The first is that the driver
does not come up in 32bpp mode, seemingly because of this line of code
here:
https://github.com/torvalds/linux/blob/98477740630f270aecf648f1d6a9dbc6027d4ff1/drivers/gpu/drm/pl111/pl111_versatile.c#L368

The second problem seems to be that Android's calls to
ioctl(FBIOPUT_VSCREENINFO) fail. I thought that this might be related
to the declared lack of 32bpp support, but even with the above line
changed to .fb_bpp = 32 (probably not the right fix given the comment
above it would probably break any users of the "real" Versatile
Express board; the driver probably instead needs to select the bpp
based on the max-memory-bandwidth like the old fbdev driver did) I
still get this logcat output:

09-22 01:31:08.807   272   272 W gralloc : FBIOPUT_VSCREENINFO failed,
page flipping not supported
09-22 01:31:08.807   272   272 W gralloc : page flipping not supported
(yres_virtual=768, requested=1536)
09-22 01:31:08.807   272   272 I gralloc : using (fd=7)
09-22 01:31:08.807   272   272 I gralloc : id           = pl111drmfb
09-22 01:31:08.807   272   272 I gralloc : xres         = 1024 px
09-22 01:31:08.807   272   272 I gralloc : yres         = 768 px
09-22 01:31:08.807   272   272 I gralloc : xres_virtual = 1024 px
09-22 01:31:08.807   272   272 I gralloc : yres_virtual = 768 px
09-22 01:31:08.807   272   272 I gralloc : bpp          = 32
09-22 01:31:08.807   272   272 I gralloc : r            = 16:8
09-22 01:31:08.807   272   272 I gralloc : g            =  8:8
09-22 01:31:08.807   272   272 I gralloc : b            =  0:8
09-22 01:31:08.807   272   272 I gralloc : width        = 400 mm (65.024002 dpi)
09-22 01:31:08.807   272   272 I gralloc : height       = 300 mm (65.023994 dpi)
09-22 01:31:08.807   272   272 I gralloc : refresh rate = 60.00 Hz

which is coming from the code starting here:
https://cs.android.com/android/platform/superproject/+/master:hardware/libhardware/modules/gralloc/framebuffer.cpp;l=185
(you can ignore the part of the log message that talks about page
flipping; in this context the main purpose of the ioctl is to give
effect to the code on lines 166-172 that sets the pixel format, and as
can be seen from the subsequent output the format remains BGRX888
rather than RGBX8888).

The output from a successful boot with the old fbdev driver looks like this:

09-22 00:54:57.750   272   272 W gralloc : page flipping not supported
(yres_virtual=768, requested=1536)
09-22 00:54:57.750   272   272 I gralloc : using (fd=7)
09-22 00:54:57.750   272   272 I gralloc : id           = CLCD FB
09-22 00:54:57.750   272   272 I gralloc : xres         = 1024 px
09-22 00:54:57.750   272   272 I gralloc : yres         = 768 px
09-22 00:54:57.750   272   272 I gralloc : xres_virtual = 1024 px
09-22 00:54:57.750   272   272 I gralloc : yres_virtual = 768 px
09-22 00:54:57.750   272   272 I gralloc : bpp          = 32
09-22 00:54:57.750   272   272 I gralloc : r            =  0:8
09-22 00:54:57.750   272   272 I gralloc : g            =  8:8
09-22 00:54:57.750   272   272 I gralloc : b            = 16:8
09-22 00:54:57.750   272   272 I gralloc : width        = 163 mm
(159.568100 dpi)
09-22 00:54:57.750   272   272 I gralloc : height       = 122 mm
(159.895081 dpi)
09-22 00:54:57.750   272   272 I gralloc : refresh rate = 65.34 Hz

which aside from the pixel format indicates some differences with the
width, height and refresh rate which may be significant.

As a result of FBIOPUT_VSCREENINFO failing, the FVP window fails to
resize so I don't see any graphical output (this ioctl in the fbdev
driver set the magic registers that caused FVP to resize its window;
my investigation into DRM earlier this year revealed the equivalent
register-setting operation in DRM to be DRM_IOCTL_MODE_ATOMIC).

I'll try to look at this closer tomorrow to see whether Android is
doing something wrong, but it seems plausible that DRM's FBDEV
emulation is missing a critical feature, at least for pl111.

Peter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
