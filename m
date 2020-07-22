Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A622A17D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 23:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F8389B84;
	Wed, 22 Jul 2020 21:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325D7898CC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 21:43:16 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id v26so733303ood.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 14:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j1t7HIxSpiPGVW8HIfsz8uFGun9cV3Lrnc1zjHDooMI=;
 b=lqELnH6haUXcDzCle4zBg4k9gYJ4kbFDCMVzzBCAbdY4yNoOnmUv00/yYP8npCFb6J
 f/7877AGDD3uB3UGQHTMGN18cYu1HyBrNoRB+9q7wqJa86XCzpFc3D5fvRJrhnDRB3ou
 lhT6TOYzeIYVJl3pRGIunfRB9Ah5D7XRQcq8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j1t7HIxSpiPGVW8HIfsz8uFGun9cV3Lrnc1zjHDooMI=;
 b=Z+6HDck9wCDC1sNLcsn2egaf4QBMHdvaGVMAeB3J7UOaz9bx6Fk/vhOFb8wOrtBdc+
 z+Y9+WqZTp1d9WKEWJvtnCTGXya9eU1x7VKocROfAWbKUGk4cZA6wmvSlHtgc5Sj42Rd
 k3+t4LLPnIne4f0eqfSE9CHVE5ML4aD1VnAqmtbZPB2ja7o3xSnOjUzJg5pX+sOm7nzl
 he5bbQshxPseqFK3YojRjicL1S7haAgnGQYlKtttEO85vepaeisCVujuoLEEO/XvJO3w
 1FAvaYeccfLpu6/3Ii4lPRzRCidrmklk368GL3K0t5dimCRUqYBNa+nxPoLXkfa7Z5lf
 a8Uw==
X-Gm-Message-State: AOAM532XbBCFRq+JfAu1lmqCgB/2UnvugLCLMUR9G8gk43HGZHpyDYGV
 Wzk36AKiZKF48SEN+GmhI7EjZcowcBuHgH68lJC+7g==
X-Google-Smtp-Source: ABdhPJwjGGPeDONT2CFs/OlUi7TXL081AoFouDVflV6BT6q3DATGHn0IPyzh2/J5KJpEfVEBMr7X4irba2fq0ljn80s=
X-Received: by 2002:a4a:b6c5:: with SMTP id w5mr1809420ooo.89.1595454195461;
 Wed, 22 Jul 2020 14:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200722181332.26995-1-knaerzche@gmail.com>
In-Reply-To: <20200722181332.26995-1-knaerzche@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 Jul 2020 23:43:04 +0200
Message-ID: <CAKMK7uGKyYea_9MamAQw2=ebjW=raYCDeFCf_5jyyJPHL9AZWA@mail.gmail.com>
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

On Wed, Jul 22, 2020 at 8:13 PM Alex Bee <knaerzche@gmail.com> wrote:
>
> Hi,
>
> this series mainly ports existining functionality to older SoCs - most
> importantly enables alpha blending for RK3036, RK3066, RK3126 and
> RK3188.
> Besides that, it also changes the window type from DRM_PLANE_TYPE_CURSOR
> to DRM_PLANE_TYPE_OVERLAY for VOPs that have only one (1) overlay window.

This doesn't make much sense, the cursor overlay is really just a hint
for legacy ioctls that this is the overlay that should be used for
cursors. Compositors should try to use such planes as full overlays
(if they don't want to use them as a cursor). So sounds like a case of
"fix your compositor".

For atomic there's 0 difference between a overlay or a cursor (primary
plane is still treated somewhat special in the RMFB ioctl, but again
that's for backwards compat reasons with existing uapi, not because
the primary plane is different).

What does happen though is that this breaks cursor for legacy
userspace, which is probably not really what you want.
-Daniel


>
> Regards,
> Alex
>
> Changes in v2:
> - drop not yet upstreamed dsp_data_swap from RK3188 regs
> - rephrase most commit messages
>
> Alex Bee (5):
>   drm: rockchip: add scaling for RK3036 win1
>   drm: rockchip: add missing registers for RK3188
>   drm: rockchip: add alpha support for RK3036, RK3066, RK3126 and RK3188
>   drm: rockchip: set alpha_en to 0 if it is not used
>   drm: rockchip: use overlay windows as such
>
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  1 +
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 42 ++++++++++++++++++---
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
>  3 files changed, 38 insertions(+), 6 deletions(-)
>
> --
> 2.17.1
>


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
