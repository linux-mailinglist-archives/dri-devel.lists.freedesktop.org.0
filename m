Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E94E37FAFE
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 17:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560D66E0A0;
	Thu, 13 May 2021 15:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFBB6E0A0;
 Thu, 13 May 2021 15:48:19 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id b25so20494808oic.0;
 Thu, 13 May 2021 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+GO5+w645EiHITr/D4zuPstDFbJ45XRhHBEeznWAnxE=;
 b=Pc/1ZPjPEZdzKdjt5Ea89gfUdj420I59XZPx3t+i/VGxjG/F9vpIh0f7+bwNOxOdAO
 WJ5RpfpeD3YzAp5+wBwxogZyQHqQr8sGq4NblTm3OGWnkrsuXoEBWGFg9KwMltCBvdtV
 UpkGjwrSslMkNqZNQ9PMGbKXmVyRIC7j3camNIaNzkA+VqnmtBx+RQEddIdavn1VOwm9
 g/rsy74Aq4+m+IflNuajaE1S3/BjIL66GwPZ8EGRqMQFQMQ9B3F6s/5W/xXzhuPNAwo4
 BPCNFJuDWPpnumWVniLb1ObmZ751yUHM8c7uSkP8DR1Bw6VtjZkFlCVTrbzst8gYly1p
 b7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+GO5+w645EiHITr/D4zuPstDFbJ45XRhHBEeznWAnxE=;
 b=N7Z/U4xgylZytEh1z/q9jWCEIXNjVs+EqaNJrf4JddpE/R1OF9dXnrcbZgGj6CH1nK
 zIlekuL6dy9HmKzqmTEmTROirEWmFQMZ9YlsuKlAyX1zfp1wVd7aSYvWKTbfP003SpMY
 JvJLn2i2bstA0vaJCUcWRP6/yhze7Es+MyvrlP2VLudPZc7vto6Gj8KKRAhtNfP1uKEw
 xVCfz+8OmcDYBJZodL2QLlfWnStB1RcAYeOC5mna7tAtUZD8LS361Go+AVghDZigJ1K2
 ey8FW9s61DdCk6hZMt2cZXD4o0C5aFpROFtZzMAKlV1V0xQbU615pGNcCEAuRGgqYrWZ
 PAzA==
X-Gm-Message-State: AOAM530GHhXLcFWfI4LaYULs7dyTmJMNao4KAeQa1mxAqAd5Ybhli129
 vZyLDNw1B0VlBbUoqPwoy1UuqSVLaa0Lz4Pg1u4=
X-Google-Smtp-Source: ABdhPJwY6uEThQsc3EFeTI1GnbRzZ9lVdaczR5rcISuQLxuLpvEys8HSJh0ePR/DkZTRuU7kkgR+H5rGH9bMwVQG39g=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr30942408oii.123.1620920899101; 
 Thu, 13 May 2021 08:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 May 2021 11:48:08 -0400
Message-ID: <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 13, 2021 at 7:00 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Resurrect of the previosuly merged per client engine busyness patches. In=
 a
> nutshell it enables intel_gpu_top to be more top(1) like useful and show =
not
> only physical GPU engine usage but per process view as well.
>
> Example screen capture:
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
> intel-gpu-top -  906/ 955 MHz;    0% RC6;  5.30 Watts;      933 irqs/s
>
>       IMC reads:     4414 MiB/s
>      IMC writes:     3805 MiB/s
>
>           ENGINE      BUSY                                      MI_SEMA M=
I_WAIT
>      Render/3D/0   93.46% |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=8B  |      0%      0%
>        Blitter/0    0.00% |                                   |      0%  =
    0%
>          Video/0    0.00% |                                   |      0%  =
    0%
>   VideoEnhance/0    0.00% |                                   |      0%  =
    0%
>
>   PID            NAME  Render/3D      Blitter        Video      VideoEnha=
nce
>  2733       neverball |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=8C     ||            ||            ||            |
>  2047            Xorg |=E2=96=88=E2=96=88=E2=96=88=E2=96=8A        ||    =
        ||            ||            |
>  2737        glxgears |=E2=96=88=E2=96=8D          ||            ||      =
      ||            |
>  2128           xfwm4 |            ||            ||            ||        =
    |
>  2047            Xorg |            ||            ||            ||        =
    |
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
>
> Internally we track time spent on engines for each struct intel_context, =
both
> for current and past contexts belonging to each open DRM file.
>
> This can serve as a building block for several features from the wanted l=
ist:
> smarter scheduler decisions, getrusage(2)-like per-GEM-context functional=
ity
> wanted by some customers, setrlimit(2) like controls, cgroups controller,
> dynamic SSEU tuning, ...
>
> To enable userspace access to the tracked data, we expose time spent on G=
PU per
> client and per engine class in sysfs with a hierarchy like the below:
>
>         # cd /sys/class/drm/card0/clients/
>         # tree
>         .
>         =E2=94=9C=E2=94=80=E2=94=80 7
>         =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 busy
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 0
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 1
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 2
>         =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 3
>         =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 name
>         =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pid
>         =E2=94=9C=E2=94=80=E2=94=80 8
>         =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 busy
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 0
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 1
>         =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 2
>         =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 3
>         =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 name
>         =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pid
>         =E2=94=94=E2=94=80=E2=94=80 9
>             =E2=94=9C=E2=94=80=E2=94=80 busy
>             =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 0
>             =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 1
>             =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 2
>             =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 3
>             =E2=94=9C=E2=94=80=E2=94=80 name
>             =E2=94=94=E2=94=80=E2=94=80 pid
>
> Files in 'busy' directories are numbered using the engine class ABI value=
s and
> they contain accumulated nanoseconds each client spent on engines of a
> respective class.

We did something similar in amdgpu using the gpu scheduler.  We then
expose the data via fdinfo.  See
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D1774baa64f9395fa884e=
a9ed494bcb043f3b83f5
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D874442541133f78c78b6=
880b8cc495bab5c61704

Alex


>
> Tvrtko Ursulin (7):
>   drm/i915: Expose list of clients in sysfs
>   drm/i915: Update client name on context create
>   drm/i915: Make GEM contexts track DRM clients
>   drm/i915: Track runtime spent in closed and unreachable GEM contexts
>   drm/i915: Track all user contexts per client
>   drm/i915: Track context current active time
>   drm/i915: Expose per-engine client busyness
>
>  drivers/gpu/drm/i915/Makefile                 |   5 +-
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  61 ++-
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
>  drivers/gpu/drm/i915/gt/intel_context.c       |  27 +-
>  drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
>  drivers/gpu/drm/i915/gt/intel_context_types.h |  24 +-
>  .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
>  .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
>  drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 +-
>  drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 ++
>  drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
>  drivers/gpu/drm/i915/i915_drm_client.c        | 365 ++++++++++++++++++
>  drivers/gpu/drm/i915/i915_drm_client.h        | 123 ++++++
>  drivers/gpu/drm/i915/i915_drv.c               |   6 +
>  drivers/gpu/drm/i915/i915_drv.h               |   5 +
>  drivers/gpu/drm/i915/i915_gem.c               |  21 +-
>  drivers/gpu/drm/i915/i915_gpu_error.c         |  31 +-
>  drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
>  drivers/gpu/drm/i915/i915_sysfs.c             |   8 +
>  19 files changed, 716 insertions(+), 81 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
>  create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
>
> --
> 2.30.2
>
