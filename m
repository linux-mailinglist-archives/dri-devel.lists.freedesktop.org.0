Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB03D24D9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 15:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BF28910D;
	Thu, 22 Jul 2021 13:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4B98910D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 13:50:09 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id a7so5425520iln.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tTWVd81ac2rDAKtJLNUUFCbfN2xjzN0t29bbX1t+k4k=;
 b=OncrXR8A5/2Shv1oK1pClmB6wTaZ6eOnz4FivGbQsFDLK0CDZeYdn3jJXEoGuHSYT5
 yIR+NC7hBJX5dBGWwGNsxCu0YLDbl7RYjwlYNuirX8gDzJI2Oqo/3XTsUFCFFVHXu0G5
 VgWbsnybWcpjhOBo+QZlckudgA9hRTk2dcLa6QH6L8YcfBWFm59HvM5y85JcrPfdmfJC
 Uo9V7TtWmiVnGSMxL3AaZvcLEJMOIjinCAP+/VqnWB1oTxzwZvQ4+6aYs5mkEZEV9zZu
 XUFmjyh7MrmNO46ciFTusi27dgNP0OiaQTJ8c0Tj2ERvVc12JC1U5RKZa4/smqg+trT3
 f1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tTWVd81ac2rDAKtJLNUUFCbfN2xjzN0t29bbX1t+k4k=;
 b=kt2aciNVfZ9xas9fm2XhZq9YgPj7ZpH40J1//EeT08WUQbpyo/KHG2G0zAkhauThj9
 1W1o8s7UyKiquxSriZTUnp8dHw+oeo4t14IuQcRK0C1JihXijNvwNqrL32Z1yX96rvYi
 c9kZYjGWOxTyq50Ml0VOXvXRImsNkJxn9iw7mIXv5Oum2SOmG4UUVLGezE4wYMzsOVeZ
 7CNU5oKa11ST3R/ctK7WWHwgPYoDsWL3OJVtSdkM+9lZ7F8v3mKB4aKYoIPWPfygdgQO
 CV275ovEddP5DMoVjJVVYXtO5J5pJUVXGS9D/LeHJRVZi7SRRnZ2NIIXsaIzCv8iBBOv
 MKzA==
X-Gm-Message-State: AOAM5310DZ+0RP8m0Se6fLoS9pn4wmNGQYPdMtTVvldXqP5CAjMyU5pY
 UkJ/X8x5EuRarBiXq2IlhpP8VUJbgoPNrVLUApaZww==
X-Google-Smtp-Source: ABdhPJyfoHuFEcSs66CBYHmhGfXDO9wXzV2aoQwA1qTGdqryAsOyjU6MVgRce7nmtsm8M/F08jmwZU297Mh8QYM+DII=
X-Received: by 2002:a92:d8d2:: with SMTP id l18mr27923842ilo.165.1626961807414; 
 Thu, 22 Jul 2021 06:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run>
 <20210722104921.594d604c@eldfell>
 <CAMavQKKSHTjYfbEAqNSy-TeRy=qURGbCNi2vBdZq7UgVrrS0yQ@mail.gmail.com>
In-Reply-To: <CAMavQKKSHTjYfbEAqNSy-TeRy=qURGbCNi2vBdZq7UgVrrS0yQ@mail.gmail.com>
From: Sean Paul <sean@poorly.run>
Date: Thu, 22 Jul 2021 09:49:31 -0400
Message-ID: <CAMavQKLF7Y6e3Hkb-EKU0+28oc5MmDc+5u1mYvyc8gEs+hfPrA@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 00/14] drm/trace: Mirror DRM debug logs to
 tracefs
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 9:48 AM Sean Paul <sean@poorly.run> wrote:
>
> On Thu, Jul 22, 2021 at 3:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Wed, 21 Jul 2021 13:55:07 -0400
> > Sean Paul <sean@poorly.run> wrote:
> >
> > > From: Sean Paul <seanpaul@chromium.org>
> > >
> > > Hi all,
> > > I just had the pleasure of rebasing this set on our CrOS downstream
> > > kernel and wanted to resend it for consideration once again. There
> > > hasn't been any resistence to the set AFAIK, just perhaps not enough
> > > motivation for anyone to hit the go bit. There was some interest from
> > > the msm folks about a month ago, and it has been an invaluable tool
> > > on CrOS for the past ~year. Hopefully someone can dig into this and
> > > provide some feedback so we can move this forward.
> > >
> > > Thanks!
> > >
> > > Sean
> > >
> > > Changes since last v6:
> > > -Rebased on drm-tip
> > >
> > > Original v6 of the set available here:
> > > https://patchwork.freedesktop.org/series/78133/
> > > https://lore.kernel.org/dri-devel/20200818210510.49730-1-sean@poorly.run/
> > >
> >
> > Woo! Yes!
> >
> > Do you have a link to your userspace?
> >
>
> Hi Pekka,
> Probably less interesting that you're hoping for, but here are the
> CrOS patches to enable and collect tracing:
>
> https://chromium-review.googlesource.com/c/chromiumos/platform2/+/2354674
> https://chromium-review.googlesource.com/c/chromiumos/platform/crosutils/+/2354392
>
>
> > You wouldn't happen to have already written a privileged userspace
> > service that would deliver on request the logs to non-privileged actors
> > like a compositor to be dumped in an error report?
>
> Our feedback report generation (log_tool.cc above) collects the logs
> (depending on user log preferences) from across the system and
> packages them up for submission when requested by the user. For
> drm_trace, we grab them from debugfs since we don't have tracefs
> mounted.
>

One more note:

If you have a chromebook with a 5.4+ kernel, you can check out the
output yourself by navigating to chrome://system and expanding the
"drm_trace" field.

Sean

> You could adapt this code to change the delivery method, but I'm not
> sure how much value it would add beyond writing your own purpose-built
> service.
>
> Sean
>
> >
> >
> > Thanks,
> > pq
> >
> > > Sean Paul (14):
> > >   drm/mipi_dbi: Convert pr_debug calls to DRM_DEBUG_DRIVER
> > >   drm/sil164: Convert dev_printk to drm_dev_dbg
> > >   drm/i915/utils: Replace dev_printk with drm helpers
> > >   drm/msm/dpu: Replace definitions for dpu debug macros
> > >   drm/print: rename drm_debug* to be more syslog-centric
> > >   drm/amd: Gate i2c transaction logs on drm_debug_syslog
> > >   drm/etnaviv: Change buffer dump checks to target syslog
> > >   drm/nouveau: Change debug checks to specifically target syslog
> > >   drm/i915: Change infoframe debug checks to specify syslog
> > >   drm/print: Add drm_debug_category_printer
> > >   drm/mst: Convert debug printers to debug category printers
> > >   drm/i915: Use debug category printer for welcome message
> > >   drm/atomic: Use debug category printer for atomic state printer
> > >   drm/print: Add tracefs support to the drm logging helpers
> > >
> > >  Documentation/gpu/drm-uapi.rst               |   6 +
> > >  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |   4 +-
> > >  drivers/gpu/drm/drm_atomic_uapi.c            |   2 +-
> > >  drivers/gpu/drm/drm_dp_mst_topology.c        |   9 +-
> > >  drivers/gpu/drm/drm_drv.c                    |   3 +
> > >  drivers/gpu/drm/drm_mipi_dbi.c               |   8 +-
> > >  drivers/gpu/drm/drm_print.c                  | 242 ++++++++++++++++---
> > >  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   8 +-
> > >  drivers/gpu/drm/i2c/sil164_drv.c             |  12 +-
> > >  drivers/gpu/drm/i915/display/intel_display.c |   4 +-
> > >  drivers/gpu/drm/i915/i915_drv.c              |   3 +-
> > >  drivers/gpu/drm/i915/i915_utils.c            |   5 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  20 +-
> > >  drivers/gpu/drm/nouveau/nouveau_drv.h        |   4 +-
> > >  include/drm/drm_print.h                      |  96 +++++++-
> > >  15 files changed, 331 insertions(+), 95 deletions(-)
> > >
> >
