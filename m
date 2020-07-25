Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D35122D896
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 17:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3A66E25B;
	Sat, 25 Jul 2020 15:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D136E25B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 15:54:18 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id y22so10676988oie.8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7BjkiE1GN+mh3yOkUNEJsHhkZ6KsGJ1P6f7ZdAty3Jc=;
 b=GcEseSQX/ZY/yzXt4/evGDbqxoqUKrU1b7V6U1nn0kb9tbsrUu8sxbo0i1s4VGmQMY
 Z8aEue4FMAqkmS5v4Ai5Mgs4tJNYPLdnG1qzuiuCHCiabR4f1YTUb10eBP4eLChx60jD
 QJALmHTm+Oir2mxrR6e1sMTU1KxAjgf2jXVc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7BjkiE1GN+mh3yOkUNEJsHhkZ6KsGJ1P6f7ZdAty3Jc=;
 b=hVQlGYdnyxKebFDCiu+eUM33BqnBG/X71og0YO06+63p2Cw037zJIDefn1GxIMRk7b
 qiSOfxn65SAuttAoA5ABffHDDvsbbDcEzF7nSoiqONSzmVjXq2D4uphiPLpap9cxxTYn
 TVeIhRiq4lHhtgiVY40XL4YSZTsIbeKjS4xZ2ZRgOQyrlmSaProPXayNbeQRG/MCiu5O
 5rYjwMY4nTfoKCP1fq49W85ZciTXI1SfW3WGQFdxg5ymwt/hMDM9syBXbmEmKx8NH/L4
 PBlotGJUWj97tt2NdqJ80HuxbprWPTSUc3cWrANmBrjQBcdWpqGxTVSaDew36Gch1Xmh
 BvIA==
X-Gm-Message-State: AOAM533yZtEz63Qmy0evSzA2g+9Dj6bCDhqvR6smPSU65r49HF3ILAF0
 l5T4MLAthRQ39HEImoitkvgnA2A1E58nlN9zo5MGmw==
X-Google-Smtp-Source: ABdhPJzcQZJr/JigGR3ib8O5dLHrOjcSyBbnZtVsiMK4UbfLwAhTGKnd06RjYBUpOMABOphSdi7YP78Z440PXU0V45M=
X-Received: by 2002:a05:6808:88:: with SMTP id
 s8mr11568435oic.101.1595692457203; 
 Sat, 25 Jul 2020 08:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200722181332.26995-1-knaerzche@gmail.com>
 <CAKMK7uGKyYea_9MamAQw2=ebjW=raYCDeFCf_5jyyJPHL9AZWA@mail.gmail.com>
 <47599ce1-2a3b-87eb-c46e-8f7f79ca945e@gmail.com>
In-Reply-To: <47599ce1-2a3b-87eb-c46e-8f7f79ca945e@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 25 Jul 2020 17:54:06 +0200
Message-ID: <CAKMK7uEn0552JuTuwpL-XdYSVk7OA=fEsphpivS8ouE-10--Zg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm: rockchip: various ports for older VOPs
To: Alex Bee <knaerzche@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 25, 2020 at 3:52 PM Alex Bee <knaerzche@gmail.com> wrote:
>
>
> Am 22.07.20 um 23:43 schrieb Daniel Vetter:
> > On Wed, Jul 22, 2020 at 8:13 PM Alex Bee <knaerzche@gmail.com> wrote:
> >> Hi,
> >>
> >> this series mainly ports existining functionality to older SoCs - most
> >> importantly enables alpha blending for RK3036, RK3066, RK3126 and
> >> RK3188.
> >> Besides that, it also changes the window type from DRM_PLANE_TYPE_CURSOR
> >> to DRM_PLANE_TYPE_OVERLAY for VOPs that have only one (1) overlay window.
> > This doesn't make much sense, the cursor overlay is really just a hint
> > for legacy ioctls that this is the overlay that should be used for
> > cursors. Compositors should try to use such planes as full overlays
> > (if they don't want to use them as a cursor). So sounds like a case of
> > "fix your compositor".
> I agree here - but: If HWC windows would have been implemented in this
> particular driver, their max size would be 128x128 on some SoCs - so
> they woudn't be really suitable to create an OSD overlay at 4K, for
> example. I don't know, but I guess other vendors implement their HWC
> windows on this reduced HW resources as well. I guess that is one of the
> reasons, why userspace, which aims to be cross-plattfrom, avoids
> DRM_PLANE_TYPE_CURSOR when its looking for an usable overlay plane. (a
> heuristic, indeed)

Which userspace does that? We should fix that, not try to work around
that in all the drivers in upstream, that wont work.
-Daniel

> > For atomic there's 0 difference between a overlay or a cursor (primary
> > plane is still treated somewhat special in the RMFB ioctl, but again
> > that's for backwards compat reasons with existing uapi, not because
> > the primary plane is different).
> >
> > What does happen though is that this breaks cursor for legacy
> > userspace, which is probably not really what you want.
>
> Indeed not.
>
> Beforhand I was submiiting this, I looked arround and couldn't find
> anything which relies or even depends of a cursor window to be
> available. Even if: as per spec only one DRM_PLANE_TYPE_PRIMARY is
> mandatory, everything else is optional.
>
> > -Daniel
> >
> >
> >> Regards,
> >> Alex
> >>
> >> Changes in v2:
> >> - drop not yet upstreamed dsp_data_swap from RK3188 regs
> >> - rephrase most commit messages
> >>
> >> Alex Bee (5):
> >>    drm: rockchip: add scaling for RK3036 win1
> >>    drm: rockchip: add missing registers for RK3188
> >>    drm: rockchip: add alpha support for RK3036, RK3066, RK3126 and RK3188
> >>    drm: rockchip: set alpha_en to 0 if it is not used
> >>    drm: rockchip: use overlay windows as such
> >>
> >>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  1 +
> >>   drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 42 ++++++++++++++++++---
> >>   drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
> >>   3 files changed, 38 insertions(+), 6 deletions(-)
> >>
> >> --
> >> 2.17.1
> >>
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
> Best Regards
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
