Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057CA436D9C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 00:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BC06E209;
	Thu, 21 Oct 2021 22:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920886E209
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 22:39:06 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 o4-20020a17090a3d4400b001a1c8344c3fso2155862pjf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 15:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u3mqWaXU7rqwo/TWDeTnHdGs0ITI4S49iyRKehjXXcA=;
 b=RLIpnaGJBxN8U9SPGIBWFEHMP4HiOyPbtEl9M73GC08X3eRBVJ6+ZFSqL6xNPYuBGx
 Ou8+O24w5cZCDDfg4TVoybFxHVcjLZl/ptaI3tghjgC1snZZ44GUMunVkdKRib2KrF/L
 ijMhZZ9njamLl43juZrItNrNHtDJ0Kcf+1kw0D+LoOx87IkXzAIEvQ6WFhm8dbScN7Gw
 iO7DmJh2cy2QoBLwurPlxjZQJYiz738P50EaD15cTlKOftv1nywyzF+QnJiHduXGrZFQ
 1sOcZ/xbWhm0hCODo5UIVEDNMi4g2SftTjm8xJsX/lF8vD/jLLLgJModycKkklJex0Wz
 pe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u3mqWaXU7rqwo/TWDeTnHdGs0ITI4S49iyRKehjXXcA=;
 b=xEXuKKKF4+XIaLlE/Tdx/VCfqKrBx5vwWXh4UgHTxQfCqpfqEenuvYz1kccF9xPNMU
 izLYJutvn4DSa27QtIbguThH9ryLAY07KNRWHZ4B7AHX2Lbb+bmMByzF9I4AMErT9AsF
 V9KUdW3YPSP/CcBhZeJLbfkH5TCvvU90P04w/4gurMA33KIKYdgFkXaLGHPDIscSLClh
 xzV53JTDR1tFAMI/DkemG9plkGOVJRiYEy7H/YSUU1os9Xk5LJWsndFVSDlempOf5xua
 7XhgSFU0SEfAwHC1Si07+zR/7DKFhGhLs/uh6VUhVpEOXaWrRNPln91if9OQZiP2j9WZ
 dQgg==
X-Gm-Message-State: AOAM531ZMZvKS9YeVvHSpDsNMSVENqAL8jmhzJOpQX8kNrh8N9S9//S9
 mB2uHgCjm7sVCtT0aT9iuICYNLSElu1L5M6aQ9x52w==
X-Google-Smtp-Source: ABdhPJxiHYF5OYuVp7nHSZYIoLw18VB9X3QXkBovdQ1vs8pIE+Qy13Goc3nHtL5cCxsF4ikg4cPXkd+2LU30ZrrusRo=
X-Received: by 2002:a17:903:18d:b0:13f:ada:9df4 with SMTP id
 z13-20020a170903018d00b0013f0ada9df4mr7733740plg.69.1634855945776; Thu, 21
 Oct 2021 15:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211021031027.537-1-gurchetansingh@chromium.org>
 <YXFWYlC2nr4scxtz@phenom.ffwll.local>
In-Reply-To: <YXFWYlC2nr4scxtz@phenom.ffwll.local>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 21 Oct 2021 15:38:54 -0700
Message-ID: <CAC_TJvfZu2Y16WS1ZZAagvAyTo42wpGWeJnzhFiAw2iEAi65pg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] GPU memory tracepoints
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Suren Baghdasaryan <surenb@google.com>, Hridya Valsaraju <hridya@google.com>,
 Yiwei Zhang <zzyiwei@google.com>, John Reitan <john.reitan@arm.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>, 
 Mark Underwood <mark.underwood@arm.com>, Gary Sweet <gary.sweet@broadcom.com>, 
 Stephen Mansfield <stephen.mansfield@imgtec.com>, Kenny.Ho@amd.com, 
 android-kernel-team <android-kernel-team@google.com>,
 Lingfeng Yang <lfy@google.com>, 
 John Reck <jreck@google.com>, Chris Forbes <chrisforbes@google.com>,
 Peiyong Lin <lpy@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 5:00 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Oct 20, 2021 at 08:10:19PM -0700, Gurchetan Singh wrote:
> > This is latest iteration of GPU memory tracepoints [1].
> >
> > In the past, there were questions about the "big picture" of memory
> > accounting [2], especially given related work on dma-buf heaps and DRM
> > cgroups [3].  Also, there was a desire for a non-driver specific soluti=
on.
> >
> > The great news is the dma-buf heaps work as recently landed [4].  It us=
es
> > sys-fs and the plan is to use it in conjunction with the tracepoint
> > solution [5].  We're aiming for the GPU tracepoint to calculate totals
> > per DRM-instance (a proxy for per-process on Android) and per-DRM devic=
e.
> >
> > The cgroups work looks terrific too and hopefully we can deduplicate co=
de once
> > that's merged.  Though that's abit of an implementation detail, so long=
 as
> > the "GPU tracepoints" +  "dma-buf heap stats" plan sounds good for Andr=
oid.
>
> Can we please start out with depulicated code, and integrate this with
> cgroups?

Thanks for the comments Dan,

The cgroups work is currently targeting allocator attribution so it
wouldn=E2=80=99t give insight to shared / imported memory - this is include=
d
as part of the totals in the tracepoint. We will start a separate
discussion with the gpu community on including imported memory into
cgroups design. Who would you recommend to be included? (in case we
don't already know all the interested parties).

The current tracepoint and the cgroups are not conflicting designs but
rather complimentary. These are some of the gaps which the tracepoint
helps to cover:
1. Imported gpu memory accounting
2. The tracepoint can be used to track gpu memory usage over time
(useful to detect memory usage spikes, for example), while cgroups can
be used to view usage as a more granular and static state.
3. For systems where cgroups aren't enabled the tracepoint data can be
a good alternative to identify memory issues.
4. Non-drm devices can make use of the tracepoint for reporting.

It would be great if we can also keep the tracepoint, as we don=E2=80=99t h=
ave
another alternative that provides all it offers (cgroups can certainly
be extended to cover some of these),  and it's currently being used by
all Android devices.

Thanks,
Kalesh

>
> The problem with gpu memory account is that everyone wants their own
> thing, they're all slightly differently, and all supported by a different
> subset of drivers. That doesn't make sense to support in upstream at all.
>
> Please huddle together so that there's one set of "track gpu memory"
> calls, and that does cgroups, tracepoints and everything else that an OS
> might want to have.
>
> Also ideally this thing works for both integrated soc gpu (including an
> answer for special memory pools like cma) _and_ discrete gpus using ttm.
> Or at least has an answer to both, because again if we end up with totall=
y
> different tracking for the soc vs the discrete gpu world, we've lost.
> -Daniel
>
> >
> > This series modifies the GPU memory tracepoint API in a non-breaking fa=
shion
> > (patch 1), and adds accounting via the GEM subsystem (patches 2 --> 7).=
 Given
> > the multiple places where memory events happen, there's a bunch trace e=
vents
> > scattered in various places.  The hardest part is allocation, where eac=
h driver
> > has their own API.  If there's a better way, do say so.
> >
> > The last patch is incomplete; we would like general feedback before pro=
ceeding
> > further.
> >
> > [1] https://lore.kernel.org/lkml/20200302235044.59163-1-zzyiwei@google.=
com/
> > [2] https://lists.freedesktop.org/archives/dri-devel/2021-January/29512=
0.html
> > [3] https://www.spinics.net/lists/cgroups/msg27867.html
> > [4] https://www.spinics.net/lists/linux-doc/msg97788.html
> > [5] https://source.android.com/devices/graphics/implement-dma-buf-gpu-m=
em
> >
> > Gurchetan Singh (8):
> >   tracing/gpu: modify gpu_mem_total
> >   drm: add new tracepoint fields to drm_device and drm_file
> >   drm: add helper functions for gpu_mem_total and gpu_mem_instance
> >   drm: start using drm_gem_trace_gpu_mem_total
> >   drm: start using drm_gem_trace_gpu_mem_instance
> >   drm: track real and fake imports in drm_prime_member
> >   drm: trace memory import per DRM file
> >   drm: trace memory import per DRM device
> >
> >  drivers/gpu/drm/Kconfig        |  1 +
> >  drivers/gpu/drm/drm_gem.c      | 65 +++++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/drm_internal.h |  4 +--
> >  drivers/gpu/drm/drm_prime.c    | 22 +++++++++---
> >  include/drm/drm_device.h       | 16 +++++++++
> >  include/drm/drm_file.h         | 16 +++++++++
> >  include/drm/drm_gem.h          |  7 ++++
> >  include/trace/events/gpu_mem.h | 61 +++++++++++++++++++++----------
> >  8 files changed, 166 insertions(+), 26 deletions(-)
> >
> > --
> > 2.25.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
