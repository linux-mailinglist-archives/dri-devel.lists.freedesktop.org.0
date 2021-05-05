Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01A373CDA
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 16:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E346E4B5;
	Wed,  5 May 2021 14:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6106E4AB;
 Wed,  5 May 2021 14:01:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s6so2145651edu.10;
 Wed, 05 May 2021 07:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+tjD7BwmbcLC3Q/caRj6z2/yE71cSDcwJUhEqIIsp0=;
 b=fL+y1bfkn2pOJKVQBTVZRDAuVbBsUjb+LNH17mPHI3NnEBA3MOkNeZ+uwWs+3KxQqc
 BTNb/UKMNWH3X42jwRlYv1XV/7ey1YB75TwxTpkMiIYtoT4L5iarXAfOWWKznq/U0eE9
 GsefF2nJzZDkUVLgcst3F1m1mGeIxHkDcNVvCaSHHJtzsWleUOdscpoq62GTD7avN3/J
 Lehj3olaPDgNsYDbpblhe65AwpZHfeS8GpovKjrCAj9zBUZ7lUcuNnP4mnEBA2uYCAc7
 ocIM96PeEEGGOQ2AdbtAHX2EAKUmrQiHV3lWYVCvPPwsCxBmNjxxv/mzItxV+DXIz3ej
 dkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+tjD7BwmbcLC3Q/caRj6z2/yE71cSDcwJUhEqIIsp0=;
 b=EUyIzX1KDqqUSXUeRoucJO1FqDWyEx8GzS9V+e1ggQzjKrXvGkVE5148/AeevHABmp
 pWAwnVJ8E+f/y8/mAAY1uHGBvA+tB74BcnxmGeujJ3vb6W5ImcAeCrljxMvOpmDRrfim
 x4L3y9DPykPjdZF+Lk+FFOKaTO8lR/tQtbsyftImAAJs+J9dmlL9VlXyYlBTgNcdlxEj
 njzJkyYBv0bsZpOSzNYYKY8eb4DbQPu1pzOL8eOoyTPUfb5jKDLxwNpwqKdQAi+0dMKb
 5sua60sxlBiIG1nMqcruWghpIIp/Zq15RZ8BXoYOT9zCZo/CN+Pfkwjh0y4iYEgExPmK
 qBQQ==
X-Gm-Message-State: AOAM531xKZ6sJRCaiOactmcPQPy9E/3nG1MQFpZ4jePpV8tLfXOb251g
 Q6R1IcOq0H7LfmHnbaTuGqtIPFDWaCmmJ7J9j81sAZVD
X-Google-Smtp-Source: ABdhPJyRkr1SLHfxPB34/VJWr01Um05S++Z7zxPr2leO4/OAdac0FliS8Y5LctB39epizujGtm06xdJi4q8zNALKyP0=
X-Received: by 2002:a05:6402:644:: with SMTP id
 u4mr13858089edx.386.1620223275261; 
 Wed, 05 May 2021 07:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
 <CAEsyxygq1k4pTT-8ASuJn=rSzHBXyhy5jRStoBVmniR2B_MrJg@mail.gmail.com>
 <CADnq5_OtKZ3=pZR_F4zx2Bz1zvEzuxb4fQU41c-XTBT8-H4Byw@mail.gmail.com>
 <CADnq5_P16wMm4gyZJYndkVtLs5n85o95u3jm6DdU7mN7+o6P9w@mail.gmail.com>
 <CADnq5_NgkXaV2s6K5cq6yijg0cT+a6ySdg33z5imYkt6n89grg@mail.gmail.com>
In-Reply-To: <CADnq5_NgkXaV2s6K5cq6yijg0cT+a6ySdg33z5imYkt6n89grg@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Wed, 5 May 2021 16:01:03 +0200
Message-ID: <CAEsyxyistPRDs5tYNx5yN5pNs_QymXPf9tEyoVvOYZbmeEAq1g@mail.gmail.com>
Subject: Re: 16 bpc fixed point (RGBA16) framebuffer support for core and AMD.
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 4, 2021 at 9:22 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Apr 28, 2021 at 5:21 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Tue, Apr 20, 2021 at 5:25 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Fri, Apr 16, 2021 at 12:29 PM Mario Kleiner
> > > <mario.kleiner.de@gmail.com> wrote:
> > > >
> > > > Friendly ping to the AMD people. Nicholas, Harry, Alex, any feedback?
> > > > Would be great to get this in sooner than later.
> > > >
> > >
> > > No objections from me.
> > >
> >
> > I don't have any objections to merging this.  Are the IGT tests available?
> >
>
> Any preference on whether I merge this through the AMD tree or drm-misc?
>
> Alex
>

Hi Alex, in case the question is addressed to myself: I prefer
whatever gets it into drm-next asap, so we can sync the drm_fourcc.h
headers from drm-next to the IGT tests, libdrm, amdvlk etc.

Another thing:Unless this would still make it into the Linux 5.13
merge window, we'd also need a KMS_DRIVER_MINOR bump 41 -> 42. This
way amdgpu-pro's Vulkan driver could know about the new 16 bpc pixel
formats for the out of tree amdgpu-dkms package when running against
older kernels.

thanks,
-mario

>
> > Alex
> >
> > > Alex
> > >
> > >
> > > > Thanks and have a nice weekend,
> > > > -mario
> > > >
> > > > On Fri, Mar 19, 2021 at 10:03 PM Mario Kleiner
> > > > <mario.kleiner.de@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > this patch series adds the fourcc's for 16 bit fixed point unorm
> > > > > framebuffers to the core, and then an implementation for AMD gpu's
> > > > > with DisplayCore.
> > > > >
> > > > > This is intended to allow for pageflipping to, and direct scanout of,
> > > > > Vulkan swapchain images in the format VK_FORMAT_R16G16B16A16_UNORM.
> > > > > I have patched AMD's GPUOpen amdvlk OSS driver to enable this format
> > > > > for swapchains, mapping to DRM_FORMAT_XBGR16161616:
> > > > > Link: https://github.com/kleinerm/pal/commit/a25d4802074b13a8d5f7edc96ae45469ecbac3c4
> > > > >
> > > > > My main motivation for this is squeezing every bit of precision
> > > > > out of the hardware for scientific and medical research applications,
> > > > > where fp16 in the unorm range is limited to ~11 bpc effective linear
> > > > > precision in the upper half [0.5;1.0] of the unorm range, although
> > > > > the hardware could do at least 12 bpc.
> > > > >
> > > > > It has been successfully tested on AMD RavenRidge (DCN-1), and with
> > > > > Polaris11 (DCE-11.2). Up to two displays were active on RavenRidge
> > > > > (DP 2560x1440@144Hz + HDMI 2560x1440@120Hz), the maximum supported
> > > > > on my hw, both running at 10 bpc DP output depth.
> > > > >
> > > > > Up to three displays were active on the Polaris (DP 2560x1440@144Hz +
> > > > > 2560x1440@100Hz USB-C DP-altMode-to-HDMI converter + eDP 2880x1800@60Hz
> > > > > Apple Retina panel), all running at 10 bpc output depth.
> > > > >
> > > > > No malfunctions, visual artifacts or other oddities were observed
> > > > > (apart from an adventureous mess of cables and adapters on my desk),
> > > > > suggesting it works.
> > > > >
> > > > > I used my automatic photometer measurement procedure to verify the
> > > > > effective output precision of 10 bpc DP native signal + spatial
> > > > > dithering in the gpu as enabled by the amdgpu driver. Results show
> > > > > the expected 12 bpc precision i hoped for -- the current upper limit
> > > > > for AMD display hw afaik.
> > > > >
> > > > > So it seems to work in the way i hoped :).
> > > > >
> > > > > Some open questions wrt. AMD DC, to be addressed in this patch series, or follow up
> > > > > patches if neccessary:
> > > > >
> > > > > - For the atomic check for plane scaling, the current patch will
> > > > > apply the same hw limits as for other rgb fixed point fb's, e.g.,
> > > > > for 8 bpc rgb8. Is this correct? Or would we need to use the fp16
> > > > > limits, because this is also a 64 bpp format? Or something new
> > > > > entirely?
> > > > >
> > > > > - I haven't added the new fourcc to the DCC tables yet. Should i?
> > > > >
> > > > > - I had to change an assert for DCE to allow 36bpp linebuffers (patch 4/5).
> > > > > It looks to me as if that assert was inconsistent with other places
> > > > > in the driver where COLOR_DEPTH121212 is supported, and looking at
> > > > > the code, the change seems harmless. At least on DCE-11.2 the change
> > > > > didn't cause any noticeable (by myself) or measurable (by my equipment)
> > > > > problems on any of the 3 connected displays.
> > > > >
> > > > > - Related to that change, while i needed to increase lb pixelsize to 36bpp
> > > > > to get > 10 bpc effective precision on DCN, i didn't need to do that
> > > > > on DCE. Also no change of lb pixelsize was needed on either DCN or DCe
> > > > > to get > 10 bpc precision for fp16 framebuffers, so something seems to
> > > > > behave differently for floating point 16 vs. fixed point 16. This all
> > > > > seems to suggest one could leave lb pixelsize at the old 30 bpp value
> > > > > on at least DCE-11.2 and still get the > 10 bpc precision if one wanted
> > > > > to avoid the changes of patch 4/5.
> > > > >
> > > > > Thanks,
> > > > > -mario
> > > > >
> > > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
