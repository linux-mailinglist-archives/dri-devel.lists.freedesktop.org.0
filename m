Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF3275288
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E8A6E44E;
	Wed, 23 Sep 2020 07:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C73A6E8E1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:43:33 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id q26so5848337uaa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 12:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U2U3GOaRfYBLiWdDzWYpTA0S5D9hRXxTJsne4bjhiC0=;
 b=YfHLbF/csSMPO0LY9zNo/gaGy4nj+jXMUD3B9zfkRjXhcPq9yUvHTmRioN+1xosT0w
 YToEhDcyCq4X41vNH9FQ/2fV8p3LKqw/ogwbIeNGwYQmoR/3O8bH5Jzb5+A+zItNYq/m
 ChrG1tXNn9gfzTfPtvo9ubcehM6iTwhIoezXMUa7HCqkA+46D2n/IlV/5sg6+4mzD1A4
 T75e9+vgvcJveCNt8GocXUvXamYqTTNyss9KfGGNfKflRLusY/3Lo6Ps5CpfCNdGZbCa
 UbeH9CQh/+oCveqpRwla25jypYOv82ZndhDGPODWyYOuJ+6KzvWTfFAqGgOtQ9pCbgJp
 +mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2U3GOaRfYBLiWdDzWYpTA0S5D9hRXxTJsne4bjhiC0=;
 b=PRl2G091KEUjybNIIIlL3ezS1ITggqbml0G+beu8bllv5F3HebCnKj37YJGeM58Kwz
 6Tjdm8MLVRM42unJV9wSrOlzDHzP0JTT4BndUewbt1aTkpHRxyOyDWUEj1ID7EQD5Sud
 vYANVRjuuUFgaKWTgVSKvXMR+e9gFDE80hZdpc4XrQQd8rwvxSTRr0PDaBeHQdCaPZXs
 vYcwbcL0WPVz2/LwadyKUASjyMrni+nrXpF9Cmt8I2p/fqP3Hz/CdLxutevnQl/X5ngo
 98Yd2VUrdQUp4Flz+h1WWyFmyE2VTXF3lvNEK3qjsa18XHN9jpOJeUA1COYPRnAwjnvZ
 XILA==
X-Gm-Message-State: AOAM531pi3RP9EquW+u/BZ3CvMuj4wLvTdm3kil9bv9uvljenKQF+I8O
 t0zk1MuNCgyqL9u4Oa1gE4McxXG7rz69qGWBOyyVcg==
X-Google-Smtp-Source: ABdhPJxEKUbHW5GT7Wui+Tiaii8oMFjC/sqsoZx7zGfofO7gnKlFTOuU/XjsR4bJAUUM2VVx2ZRY0hfplKLrQxB4NFg=
X-Received: by 2002:ab0:c11:: with SMTP id a17mr3805793uak.141.1600803812624; 
 Tue, 22 Sep 2020 12:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200609200446.153209-1-linus.walleij@linaro.org>
 <20200609200446.153209-2-linus.walleij@linaro.org>
 <CAMn1gO52PQ-dFbCU49FCnJZz=gyLEE3F2vZ5rtbF_C-H+ur7qw@mail.gmail.com>
 <CACRpkdYnXXvPAbCMdG8OOPYqWqDHFh_=z9mR5vKZ+ri8sDyAgA@mail.gmail.com>
 <CAMn1gO5svZNrzWYMO5mbcCYbQ8St5UjksztcXQ7OubtOTpdZyw@mail.gmail.com>
In-Reply-To: <CAMn1gO5svZNrzWYMO5mbcCYbQ8St5UjksztcXQ7OubtOTpdZyw@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 22 Sep 2020 12:43:21 -0700
Message-ID: <CAMn1gO7cmvPCk+3t=5G0qPu9X1bRQpaSARWGGRV4ntoWrBEHbQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] video: fbdev: amba-clcd: Retire elder CLCD driver
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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

On Mon, Sep 21, 2020 at 9:10 PM Peter Collingbourne <pcc@google.com> wrote:
>
> On Mon, Sep 21, 2020 at 2:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Tue, Sep 15, 2020 at 3:10 AM Peter Collingbourne <pcc@google.com> wrote:
> > > On Tue, Jun 9, 2020 at 1:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > >
> > > > All the functionality in this driver has been reimplemented
> > > > in the new DRM driver in drivers/gpu/drm/pl111/* and all
> > > > the boards using it have been migrated to use the DRM driver
> > > > with all configuration coming from the device tree.
> > >
> > > Android's FVP configuration still uses FBDEV.
> >
> > But all DRM drivers support frame buffer emulation so I don't
> > see how this can be a problem? The new DRM driver provides
> > a framebuffer.
>
> Okay, I was unaware of that feature and it is disabled in Android
> kernels. I am now testing the DRM driver by applying this diff to
> FVP's kernel config:
>
> diff --git a/fvp.fragment b/fvp.fragment
> index b12be37278a4..481767c06ac9 100644
> --- a/fvp.fragment
> +++ b/fvp.fragment
> @@ -1,5 +1,6 @@
> -CONFIG_FB=m
> -CONFIG_FB_ARMCLCD=m
> +CONFIG_DRM_PANEL_SIMPLE=m
> +CONFIG_DRM_PL111=m
> +CONFIG_DRM_FBDEV_EMULATION=y
>  CONFIG_MOUSE_PS2=m
>  CONFIG_SERIO_AMBAKMI=m
>  CONFIG_MMC_ARMMMCI=m
>
> > I'm also confused about how this can be in use.
> > fvp-base-revc.dts includes rtsm_ve-motherboard.dtsi
> > where the PL111 is defined.
> >
> > commit f1fe12c8bf33241e04c57a0fc5b25b16ba77ba2d
> > "ARM: dts: Modernize the Vexpress PL111 integration"
> > changes the DTS for the FVP such that only the new DRM
> > driver really works with it: it removes the panel-dpi encoded
> > panel and defines the panel
> > "arm,rtsm-display" for FVP and that is *only* supported
> > by drivers/gpu/drm/panel/panel-simple.c from DRM.
>
> That commit predates commit fa083b99eb284186ae65193ae856ef2801a1646d
> which added the DTS for FVP, along with a panel-dpi compatible panel
> which is still present:
> https://github.com/torvalds/linux/blob/98477740630f270aecf648f1d6a9dbc6027d4ff1/arch/arm64/boot/dts/arm/fvp-base-revc.dts#L189
>
> > The upstream FVP has been using the new DRM driver
> > by default since
> > commit 37ad688497785c9ad1471236e28efda1e2f39741
> > "arm64: defconfig: Switch to PL11x DRM driver"
> > in january 2019.
>
> That only affected defconfig though which Android doesn't use.
>
> > Are you using old or outoftree devicetrees with a newer
> > kernel?
>
> No, I'm using an up-to-date device tree (pretty sure about that
> otherwise I wouldn't have hit problems like
> https://android-review.googlesource.com/c/device/generic/goldfish/+/1394347
> ).
>
> > > While it would be great
> > > to see it migrated to DRM, this first requires resolving a design
> > > incompatibility between Android's composer and DRM devices that only
> > > support software rendering. I proposed a patch that would help resolve
> > > this [1], but there was disagreement about the approach and I haven't
> > > had time to get back to this.
> > >
> > > Can this please be reverted until FVP on Android can be migrated to DRM?
> >
> > We need a clear technical reason, I understand that using DRM
> > directly might be a problem, but DRM supports full framebuffer
> > emulation and from a userspace point of view, what the new
> > driver provides should be equivalent.
> >
> > I can think of problems like Android seeing the new fancy
> > DRM userspace ABI but surely it can be instructed to
> > ignore that and just use the framebuffer emulation instead?
> >
> > If there is anything else making DRMs framebuffer emulation
> > substandard I am sure the DRM developers would like to know,
> > especially if it makes Android unhappy.
>
> Okay, I found at least two issues so far. The first is that the driver
> does not come up in 32bpp mode, seemingly because of this line of code
> here:
> https://github.com/torvalds/linux/blob/98477740630f270aecf648f1d6a9dbc6027d4ff1/drivers/gpu/drm/pl111/pl111_versatile.c#L368
>
> The second problem seems to be that Android's calls to
> ioctl(FBIOPUT_VSCREENINFO) fail. I thought that this might be related
> to the declared lack of 32bpp support, but even with the above line
> changed to .fb_bpp = 32 (probably not the right fix given the comment
> above it would probably break any users of the "real" Versatile
> Express board; the driver probably instead needs to select the bpp
> based on the max-memory-bandwidth like the old fbdev driver did) I
> still get this logcat output:
>
> 09-22 01:31:08.807   272   272 W gralloc : FBIOPUT_VSCREENINFO failed,
> page flipping not supported
> 09-22 01:31:08.807   272   272 W gralloc : page flipping not supported
> (yres_virtual=768, requested=1536)
> 09-22 01:31:08.807   272   272 I gralloc : using (fd=7)
> 09-22 01:31:08.807   272   272 I gralloc : id           = pl111drmfb
> 09-22 01:31:08.807   272   272 I gralloc : xres         = 1024 px
> 09-22 01:31:08.807   272   272 I gralloc : yres         = 768 px
> 09-22 01:31:08.807   272   272 I gralloc : xres_virtual = 1024 px
> 09-22 01:31:08.807   272   272 I gralloc : yres_virtual = 768 px
> 09-22 01:31:08.807   272   272 I gralloc : bpp          = 32
> 09-22 01:31:08.807   272   272 I gralloc : r            = 16:8
> 09-22 01:31:08.807   272   272 I gralloc : g            =  8:8
> 09-22 01:31:08.807   272   272 I gralloc : b            =  0:8
> 09-22 01:31:08.807   272   272 I gralloc : width        = 400 mm (65.024002 dpi)
> 09-22 01:31:08.807   272   272 I gralloc : height       = 300 mm (65.023994 dpi)
> 09-22 01:31:08.807   272   272 I gralloc : refresh rate = 60.00 Hz
>
> which is coming from the code starting here:
> https://cs.android.com/android/platform/superproject/+/master:hardware/libhardware/modules/gralloc/framebuffer.cpp;l=185
> (you can ignore the part of the log message that talks about page
> flipping; in this context the main purpose of the ioctl is to give
> effect to the code on lines 166-172 that sets the pixel format, and as
> can be seen from the subsequent output the format remains BGRX888
> rather than RGBX8888).
>
> The output from a successful boot with the old fbdev driver looks like this:
>
> 09-22 00:54:57.750   272   272 W gralloc : page flipping not supported
> (yres_virtual=768, requested=1536)
> 09-22 00:54:57.750   272   272 I gralloc : using (fd=7)
> 09-22 00:54:57.750   272   272 I gralloc : id           = CLCD FB
> 09-22 00:54:57.750   272   272 I gralloc : xres         = 1024 px
> 09-22 00:54:57.750   272   272 I gralloc : yres         = 768 px
> 09-22 00:54:57.750   272   272 I gralloc : xres_virtual = 1024 px
> 09-22 00:54:57.750   272   272 I gralloc : yres_virtual = 768 px
> 09-22 00:54:57.750   272   272 I gralloc : bpp          = 32
> 09-22 00:54:57.750   272   272 I gralloc : r            =  0:8
> 09-22 00:54:57.750   272   272 I gralloc : g            =  8:8
> 09-22 00:54:57.750   272   272 I gralloc : b            = 16:8
> 09-22 00:54:57.750   272   272 I gralloc : width        = 163 mm
> (159.568100 dpi)
> 09-22 00:54:57.750   272   272 I gralloc : height       = 122 mm
> (159.895081 dpi)
> 09-22 00:54:57.750   272   272 I gralloc : refresh rate = 65.34 Hz
>
> which aside from the pixel format indicates some differences with the
> width, height and refresh rate which may be significant.
>
> As a result of FBIOPUT_VSCREENINFO failing, the FVP window fails to
> resize so I don't see any graphical output (this ioctl in the fbdev
> driver set the magic registers that caused FVP to resize its window;
> my investigation into DRM earlier this year revealed the equivalent
> register-setting operation in DRM to be DRM_IOCTL_MODE_ATOMIC).
>
> I'll try to look at this closer tomorrow to see whether Android is
> doing something wrong, but it seems plausible that DRM's FBDEV
> emulation is missing a critical feature, at least for pl111.

This does indeed appear to be the case. Among other reasons, Android's
ioctl would fail because of this code, which forbids changing the
pixel format in fbdev emulation:
https://github.com/torvalds/linux/blob/eff48ddeab782e35e58ccc8853f7386bbae9dec4/drivers/gpu/drm/drm_fb_helper.c#L1317

Android's generic fbdev userspace driver (which FVP uses) is only
compatible with the RGBX8888 pixel format. So there is a fundamental
incompatibility here, as long as the kernel driver comes up in a
different format. We could change the driver's default format to match
what Android requires, but then that could break some other
application that requires a format other than RGBX8888, which would
fail when changing to its required format because of the above linked
code.

There is a less important issue where the new driver fails the syscall
if yres_virtual exceeds a limit:
https://github.com/torvalds/linux/blob/eff48ddeab782e35e58ccc8853f7386bbae9dec4/drivers/gpu/drm/drm_fb_helper.c#L1288

whereas the old driver would reset yres_virtual based on the value of yres:
https://github.com/torvalds/linux/blob/3f1f6981afed9fa21efa12ce396b35ca684b8a29/include/linux/amba/clcd.h#L245

With the current userspace implementation which sets yres_virtual =
yres * 2 this leads to the driver not even reaching the code that
rejects based on pixel format. This can be fixed on the userspace side
(by reissuing the syscall with yres_virtual set to its original value)
but API stability would seem to require the behavior to match here as
well, and this of course does nothing for the pixel format issue.

So I think we should bring the old driver back, at least until fbdev
emulation gains the ability to change the pixel format.

Peter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
