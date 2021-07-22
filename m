Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7143A3D24D6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 15:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFBD6E9B6;
	Thu, 22 Jul 2021 13:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A7C6E9B6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 13:48:36 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id u7so6401246ion.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 06:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ee+rDJSwDTAufCz725IILGCVFakNC7/Qfio2szrMb0M=;
 b=aoBVajMjr7kkHvNIQ8N/7paSDaa3D+fPKjOyUZc+f1QEB6pkVh2Et22GZRFSPMe6H5
 ETapMz4akshuevRidbpa2dHMKODNC67Q8oUWUdgdDA3fDj9ODHSY6aHub1dNy4GaBPDv
 qmsBQJkbCiglua0W2ATtNAB0lnpIG+gUEGbbHt0U/bAGlEB3VKBaCVGDE+9PifJunOm+
 ZD7a2Hxc9vhBxeFx7igtt5cKbZolSn+BmV/hiwvkj//uImNcFjizmikUXkjVIfXotpPF
 BYbDE8lhlOIQk+8+JR5RO+X85nH04ljgNlIoslzSqpug16wERAcHrKfg3hjuLQBj52wC
 ehEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ee+rDJSwDTAufCz725IILGCVFakNC7/Qfio2szrMb0M=;
 b=enulMyi3PhO+CC558Xu3m8UhKW+zorREZ9ULhJslVPO4PJlzcOB4GOG9U4EB3G82zI
 XBvyRYmfzXC9iPByyWH1Lp91XyRAPEpnt/QPGVPmb0arqaxgxdSoCVEKv+FMgIXL0t90
 pk2zb7urCdcXqRdmLdG4phDBhCh36R1qhGnSYHwQ42cFpr3IZ7k7sSWXyBprdKoOfPoT
 ZCiI9fAp2hfcy9MvCgAh2DOyTrRHNVJLO1t3vf72qaT3qcYkxNHMMwg6Hqw4MJAX++M5
 HUrd3w+4Vj8Fdg32QJ/RnMqUalHcvlgvQEmzcbtklYsGzFEia3+ifOwo2KIfpA/cuMIc
 Ms/w==
X-Gm-Message-State: AOAM530qB9q9n5iPEJgPPyMA5a/zrFDA4xI48AaoyXfEDwjk4Czk6gbw
 9PJNNxsrtTm+2MlIgNpcG6PhVhHDc2TRRSFCFjrNQw==
X-Google-Smtp-Source: ABdhPJyqA3Jp3jDA/WOJlDTJA0r5tYG32qlmOiCoyjd/9nh2jaXlNyWjCms7KA7rHs89E520zO7vZDgfY5ZGtzMdDe4=
X-Received: by 2002:a5d:93d3:: with SMTP id j19mr30496410ioo.184.1626961715948; 
 Thu, 22 Jul 2021 06:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run>
 <20210722104921.594d604c@eldfell>
In-Reply-To: <20210722104921.594d604c@eldfell>
From: Sean Paul <sean@poorly.run>
Date: Thu, 22 Jul 2021 09:48:00 -0400
Message-ID: <CAMavQKKSHTjYfbEAqNSy-TeRy=qURGbCNi2vBdZq7UgVrrS0yQ@mail.gmail.com>
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

On Thu, Jul 22, 2021 at 3:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Wed, 21 Jul 2021 13:55:07 -0400
> Sean Paul <sean@poorly.run> wrote:
>
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Hi all,
> > I just had the pleasure of rebasing this set on our CrOS downstream
> > kernel and wanted to resend it for consideration once again. There
> > hasn't been any resistence to the set AFAIK, just perhaps not enough
> > motivation for anyone to hit the go bit. There was some interest from
> > the msm folks about a month ago, and it has been an invaluable tool
> > on CrOS for the past ~year. Hopefully someone can dig into this and
> > provide some feedback so we can move this forward.
> >
> > Thanks!
> >
> > Sean
> >
> > Changes since last v6:
> > -Rebased on drm-tip
> >
> > Original v6 of the set available here:
> > https://patchwork.freedesktop.org/series/78133/
> > https://lore.kernel.org/dri-devel/20200818210510.49730-1-sean@poorly.run/
> >
>
> Woo! Yes!
>
> Do you have a link to your userspace?
>

Hi Pekka,
Probably less interesting that you're hoping for, but here are the
CrOS patches to enable and collect tracing:

https://chromium-review.googlesource.com/c/chromiumos/platform2/+/2354674
https://chromium-review.googlesource.com/c/chromiumos/platform/crosutils/+/2354392


> You wouldn't happen to have already written a privileged userspace
> service that would deliver on request the logs to non-privileged actors
> like a compositor to be dumped in an error report?

Our feedback report generation (log_tool.cc above) collects the logs
(depending on user log preferences) from across the system and
packages them up for submission when requested by the user. For
drm_trace, we grab them from debugfs since we don't have tracefs
mounted.

You could adapt this code to change the delivery method, but I'm not
sure how much value it would add beyond writing your own purpose-built
service.

Sean

>
>
> Thanks,
> pq
>
> > Sean Paul (14):
> >   drm/mipi_dbi: Convert pr_debug calls to DRM_DEBUG_DRIVER
> >   drm/sil164: Convert dev_printk to drm_dev_dbg
> >   drm/i915/utils: Replace dev_printk with drm helpers
> >   drm/msm/dpu: Replace definitions for dpu debug macros
> >   drm/print: rename drm_debug* to be more syslog-centric
> >   drm/amd: Gate i2c transaction logs on drm_debug_syslog
> >   drm/etnaviv: Change buffer dump checks to target syslog
> >   drm/nouveau: Change debug checks to specifically target syslog
> >   drm/i915: Change infoframe debug checks to specify syslog
> >   drm/print: Add drm_debug_category_printer
> >   drm/mst: Convert debug printers to debug category printers
> >   drm/i915: Use debug category printer for welcome message
> >   drm/atomic: Use debug category printer for atomic state printer
> >   drm/print: Add tracefs support to the drm logging helpers
> >
> >  Documentation/gpu/drm-uapi.rst               |   6 +
> >  drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |   4 +-
> >  drivers/gpu/drm/drm_atomic_uapi.c            |   2 +-
> >  drivers/gpu/drm/drm_dp_mst_topology.c        |   9 +-
> >  drivers/gpu/drm/drm_drv.c                    |   3 +
> >  drivers/gpu/drm/drm_mipi_dbi.c               |   8 +-
> >  drivers/gpu/drm/drm_print.c                  | 242 ++++++++++++++++---
> >  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   8 +-
> >  drivers/gpu/drm/i2c/sil164_drv.c             |  12 +-
> >  drivers/gpu/drm/i915/display/intel_display.c |   4 +-
> >  drivers/gpu/drm/i915/i915_drv.c              |   3 +-
> >  drivers/gpu/drm/i915/i915_utils.c            |   5 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  20 +-
> >  drivers/gpu/drm/nouveau/nouveau_drv.h        |   4 +-
> >  include/drm/drm_print.h                      |  96 +++++++-
> >  15 files changed, 331 insertions(+), 95 deletions(-)
> >
>
