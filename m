Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C82414BAE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 16:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18136EBAC;
	Wed, 22 Sep 2021 14:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FF26EBAC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 14:19:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g41so12614808lfv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B8C7/gWlbkDT8Stsf8c/PbsXwT7Hdg5jN5OhgrNEJwA=;
 b=Mee6GSnEA3kTLoDtsVHPrillgwIfCrOQOIxaERagzTLphH/6HmImskGqRm7ZLjp/zb
 1HP2qeBs2Zi8j9SMTJXJAgeqIFsHiyL2VsCeZEVY8p0N6FdCYtKDYELWeyLiD4sqzNS6
 UMZIZ0sRv1USOUwHztEhbHNuASky37njfn9fo3Yp6VEtJGrT0Tq8byzW0eZtuepsdJpM
 xx6VzdzZgVUUOMDQm1wOrmaGYjWHG9EWBvXGQAMEUzVp8iFjF7IXINNATJPpGAxEjYjR
 djuHUWHsfHrsRJle65gYXa9fK4+gpTddNKOHvc5A7Ms3kvgaYpBFA11c6A1tfl0ylzhF
 S7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B8C7/gWlbkDT8Stsf8c/PbsXwT7Hdg5jN5OhgrNEJwA=;
 b=lYTCb+vyROlkT9LqceQ+Lbnx6LPEXH3jw/+zY5ELcU3ul5zrlQonYJzqAv+Uwoo2LP
 nT9VLrpxK32SQdcODNJr2tjSYOGE0oUJypzGSgMnqiejazObzGzhTzyTQtUAgjmRMFpg
 fiIvNoTSZXvuJ4j+p2kyutzTxxPEVQd4tV2q4lFHpTTwonEjQGuTZvaVBft/J6LMOEgg
 iilke5vvx3rSc0ha6YemKzfrV8DFXQPjT7KTf7GCMoO/mbcZE7KDT7unZzp7UkS3nxdZ
 HDr0Dr+Tfn6WGXZwWJv4bW+kwkfVjhoAlT7T/ZP0qz31+UXdWTMjWCuAX+KJuYmsEjyd
 B18w==
X-Gm-Message-State: AOAM530SoFjR99z7cJU1gxUsepjNUTqE35tO9lM+GZBUd7achx+Ctn3n
 Dtx8ghFjbx8QU8SC//byEP8lTEE8foMj/Gc6JdI=
X-Google-Smtp-Source: ABdhPJyo5YNCq2sULcZiR9F3fiDX5BwxhQp/xIj2mL9VRa0/INzHHet6PRjqjMLWnDUFAVwytzJeyne0PrFmbNHspHo=
X-Received: by 2002:a2e:a5c8:: with SMTP id n8mr14052548ljp.307.1632320249363; 
 Wed, 22 Sep 2021 07:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210920141051.30988-1-tzimmermann@suse.de>
In-Reply-To: <20210920141051.30988-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 22 Sep 2021 16:17:18 +0200
Message-ID: <CAMeQTsY0R2TuUNr_rCRx4Wbu3RxCYEbTy7WUqFGxT-axps69cg@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/gma500: Managed cleanup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 4:10 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Switch gma500 to managed cleanup and remove the manual cleanup
> code from the driver's PCI callbacks.
>
> Managed cleanup involves embedding the DRM device structure in the
> driver's structure. In preparation, patch 1 replaces references all
> references to dev_private with a helper function.
>
> Patch 2 adds managed cleanup for pci_enable_device().
>
> Patches 3 and 4 embed struct drm_device in struct_drm_psb_private. The
> structure's memory is being automatically released.
>
> Patch 5 adds managed cleanup for the device resources. Instead of
> calling the large, monolithic function psb_driver_unload(), the release
> code could be split up split into smaller helpers and reuse exising
> functionality from devres.
>
> Future work: for a number of drivers, the PCI remove callback contains
> only a single call to drm_device_unregister(). In a later patchset,
> this could be implemented as another shared helper within DRM.
>
> Tested on Atom N2800 hardware.

Thanks for the patches!

For the entire series:
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

I'll let you apply this to drm-misc-next yourself

Cheers
Patrik

>
> Thomas Zimmermann (5):
>   drm/gma500: Replace references to dev_private with helper function
>   drm/gma500: Disable PCI device during shutdown
>   drm/gma500: Embed struct drm_device in struct drm_psb_private
>   drm/gma500: Remove dev_priv branch from unload function
>   drm/gma500: Managed device release
>
>  drivers/gpu/drm/gma500/backlight.c         |  12 +-
>  drivers/gpu/drm/gma500/cdv_device.c        |  24 ++--
>  drivers/gpu/drm/gma500/cdv_intel_display.c |  10 +-
>  drivers/gpu/drm/gma500/cdv_intel_dp.c      |  12 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c    |  22 +--
>  drivers/gpu/drm/gma500/framebuffer.c       |  16 +--
>  drivers/gpu/drm/gma500/gem.c               |   2 +-
>  drivers/gpu/drm/gma500/gma_device.c        |   2 +-
>  drivers/gpu/drm/gma500/gma_display.c       |  14 +-
>  drivers/gpu/drm/gma500/gtt.c               |  18 +--
>  drivers/gpu/drm/gma500/intel_bios.c        |  10 +-
>  drivers/gpu/drm/gma500/intel_gmbus.c       |  12 +-
>  drivers/gpu/drm/gma500/mid_bios.c          |  11 +-
>  drivers/gpu/drm/gma500/mmu.c               |  12 +-
>  drivers/gpu/drm/gma500/oaktrail_crtc.c     |   8 +-
>  drivers/gpu/drm/gma500/oaktrail_device.c   |  20 +--
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c     |  18 +--
>  drivers/gpu/drm/gma500/oaktrail_lvds.c     |  14 +-
>  drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c |   2 +-
>  drivers/gpu/drm/gma500/opregion.c          |  14 +-
>  drivers/gpu/drm/gma500/power.c             |  20 +--
>  drivers/gpu/drm/gma500/psb_device.c        |  16 +--
>  drivers/gpu/drm/gma500/psb_drv.c           | 147 ++++++++++-----------
>  drivers/gpu/drm/gma500/psb_drv.h           |  24 ++--
>  drivers/gpu/drm/gma500/psb_intel_display.c |  10 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c    |  31 ++---
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c    |  10 +-
>  drivers/gpu/drm/gma500/psb_irq.c           |  26 ++--
>  drivers/gpu/drm/gma500/psb_lid.c           |   2 +-
>  29 files changed, 261 insertions(+), 278 deletions(-)
>
> --
> 2.33.0
>
