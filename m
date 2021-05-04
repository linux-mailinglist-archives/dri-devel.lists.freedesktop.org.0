Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 208EF3730BD
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 21:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18866EB6C;
	Tue,  4 May 2021 19:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8054E6EB6B;
 Tue,  4 May 2021 19:22:45 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 g15-20020a9d128f0000b02902a7d7a7bb6eso2524916otg.9; 
 Tue, 04 May 2021 12:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OxhkXQH7eIfKy25nqi1qtUtgNEekDlVBh8mfZ3Ysbu4=;
 b=V7LOgsxsHtvIAf0Mk/WcgEN5dV6B+vCgZYgcZu0Vnxxp0tuXK8aMQiknrpigs5I5y9
 zbESnUojO/aPUx/hWSdnYThb9i8xqIPd05Ss5bUdJaH5v0BfbovRVAnp1LZP1nlhqlmc
 Hcn4Qcdn7K//JLVweRcdakSHPKSh0BOMs9TmZGQz4fM3X8HqNI+leSVEVd9W6jXHsFG0
 ise6TyMJCzM2z4JIatHW4znJcHEapx4gykRWmBRsrmEH7/08HlpzG0BoiDsELoyCRPuT
 n+GqQso0Hy6js/R7DdbnOiHuv5hYQ/m2ZmTjSfL9tFtF+5dqiNpTAH7WydQf3BtdNQ6L
 ht8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OxhkXQH7eIfKy25nqi1qtUtgNEekDlVBh8mfZ3Ysbu4=;
 b=d0ma40/MjWcJcy6K/n7LBP0VgMXNuKIv6IIjLJe7Ux8kF+hy9bzXFmOYAlbfwxJSN5
 TdcI7vC4kzrUipeVuCINbUF+yAVUkTlAyNrnVHFSQr3lJ+QlIRCi7ppw133rRj6QbXXU
 aRF7xnTA+Y0SqwbvQljpBIoL9zu9VTgmU4+dK4JyL63RdhsdDJgBzcj5r6LVgOv/iyQ+
 T9m8szltT13gNvARAFn3c1VOmmKwclAQIfc15wopm6VJz2IOSCf95Lh9fDPCC/jr0fVN
 qgHxoq+egad67hsjwiKc901yIUlIjkT0vVgK2ospJaPGOfz69clGN86nsijvrqFN+1M+
 hTdA==
X-Gm-Message-State: AOAM533fUHQwt1eQFyASymYjGaAqczrB0h18TK7XE6kYOmvP4We+g8lP
 QRjarNQGSFvcEHr4rPJZUbyBihsfOskUYFowmSo=
X-Google-Smtp-Source: ABdhPJzDYZdmqpF3D9yq8+KoQV2vfZo9Yf3qKGqvu+SFLlSN3Am81fQ7OLbKA3qohBAPTTgl6+bVnf27Jfln13aXRjs=
X-Received: by 2002:a9d:8d1:: with SMTP id 75mr20821928otf.23.1620156164799;
 Tue, 04 May 2021 12:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
 <CAEsyxygq1k4pTT-8ASuJn=rSzHBXyhy5jRStoBVmniR2B_MrJg@mail.gmail.com>
 <CADnq5_OtKZ3=pZR_F4zx2Bz1zvEzuxb4fQU41c-XTBT8-H4Byw@mail.gmail.com>
 <CADnq5_P16wMm4gyZJYndkVtLs5n85o95u3jm6DdU7mN7+o6P9w@mail.gmail.com>
In-Reply-To: <CADnq5_P16wMm4gyZJYndkVtLs5n85o95u3jm6DdU7mN7+o6P9w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 May 2021 15:22:33 -0400
Message-ID: <CADnq5_NgkXaV2s6K5cq6yijg0cT+a6ySdg33z5imYkt6n89grg@mail.gmail.com>
Subject: Re: 16 bpc fixed point (RGBA16) framebuffer support for core and AMD.
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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

On Wed, Apr 28, 2021 at 5:21 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Apr 20, 2021 at 5:25 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Fri, Apr 16, 2021 at 12:29 PM Mario Kleiner
> > <mario.kleiner.de@gmail.com> wrote:
> > >
> > > Friendly ping to the AMD people. Nicholas, Harry, Alex, any feedback?
> > > Would be great to get this in sooner than later.
> > >
> >
> > No objections from me.
> >
>
> I don't have any objections to merging this.  Are the IGT tests available?
>

Any preference on whether I merge this through the AMD tree or drm-misc?

Alex


> Alex
>
> > Alex
> >
> >
> > > Thanks and have a nice weekend,
> > > -mario
> > >
> > > On Fri, Mar 19, 2021 at 10:03 PM Mario Kleiner
> > > <mario.kleiner.de@gmail.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > this patch series adds the fourcc's for 16 bit fixed point unorm
> > > > framebuffers to the core, and then an implementation for AMD gpu's
> > > > with DisplayCore.
> > > >
> > > > This is intended to allow for pageflipping to, and direct scanout of,
> > > > Vulkan swapchain images in the format VK_FORMAT_R16G16B16A16_UNORM.
> > > > I have patched AMD's GPUOpen amdvlk OSS driver to enable this format
> > > > for swapchains, mapping to DRM_FORMAT_XBGR16161616:
> > > > Link: https://github.com/kleinerm/pal/commit/a25d4802074b13a8d5f7edc96ae45469ecbac3c4
> > > >
> > > > My main motivation for this is squeezing every bit of precision
> > > > out of the hardware for scientific and medical research applications,
> > > > where fp16 in the unorm range is limited to ~11 bpc effective linear
> > > > precision in the upper half [0.5;1.0] of the unorm range, although
> > > > the hardware could do at least 12 bpc.
> > > >
> > > > It has been successfully tested on AMD RavenRidge (DCN-1), and with
> > > > Polaris11 (DCE-11.2). Up to two displays were active on RavenRidge
> > > > (DP 2560x1440@144Hz + HDMI 2560x1440@120Hz), the maximum supported
> > > > on my hw, both running at 10 bpc DP output depth.
> > > >
> > > > Up to three displays were active on the Polaris (DP 2560x1440@144Hz +
> > > > 2560x1440@100Hz USB-C DP-altMode-to-HDMI converter + eDP 2880x1800@60Hz
> > > > Apple Retina panel), all running at 10 bpc output depth.
> > > >
> > > > No malfunctions, visual artifacts or other oddities were observed
> > > > (apart from an adventureous mess of cables and adapters on my desk),
> > > > suggesting it works.
> > > >
> > > > I used my automatic photometer measurement procedure to verify the
> > > > effective output precision of 10 bpc DP native signal + spatial
> > > > dithering in the gpu as enabled by the amdgpu driver. Results show
> > > > the expected 12 bpc precision i hoped for -- the current upper limit
> > > > for AMD display hw afaik.
> > > >
> > > > So it seems to work in the way i hoped :).
> > > >
> > > > Some open questions wrt. AMD DC, to be addressed in this patch series, or follow up
> > > > patches if neccessary:
> > > >
> > > > - For the atomic check for plane scaling, the current patch will
> > > > apply the same hw limits as for other rgb fixed point fb's, e.g.,
> > > > for 8 bpc rgb8. Is this correct? Or would we need to use the fp16
> > > > limits, because this is also a 64 bpp format? Or something new
> > > > entirely?
> > > >
> > > > - I haven't added the new fourcc to the DCC tables yet. Should i?
> > > >
> > > > - I had to change an assert for DCE to allow 36bpp linebuffers (patch 4/5).
> > > > It looks to me as if that assert was inconsistent with other places
> > > > in the driver where COLOR_DEPTH121212 is supported, and looking at
> > > > the code, the change seems harmless. At least on DCE-11.2 the change
> > > > didn't cause any noticeable (by myself) or measurable (by my equipment)
> > > > problems on any of the 3 connected displays.
> > > >
> > > > - Related to that change, while i needed to increase lb pixelsize to 36bpp
> > > > to get > 10 bpc effective precision on DCN, i didn't need to do that
> > > > on DCE. Also no change of lb pixelsize was needed on either DCN or DCe
> > > > to get > 10 bpc precision for fp16 framebuffers, so something seems to
> > > > behave differently for floating point 16 vs. fixed point 16. This all
> > > > seems to suggest one could leave lb pixelsize at the old 30 bpp value
> > > > on at least DCE-11.2 and still get the > 10 bpc precision if one wanted
> > > > to avoid the changes of patch 4/5.
> > > >
> > > > Thanks,
> > > > -mario
> > > >
> > > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
