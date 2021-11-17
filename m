Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D797F454CC9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 19:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEB76E08A;
	Wed, 17 Nov 2021 18:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA5A6E08A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 18:06:50 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id h63so2933748pgc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 10:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kEiryAVVZ/D8gLvMToaX9fceSwD/Bq+hkZKd0gW7iok=;
 b=i0RITzUYBRV0LjY37YCbHSEEpJMtjzsInL3RQzSoNCftFW++iGYSj70kL311wCFROG
 ST4qJSefVEEJs5pH/K9Y+EVP+ZSodmJ15oMa53zX60lK282+cUqJEzaiB/T2p8kS7Ya1
 Yga1NhFD4YrnR4nsJfK0OSbhOTlcUVpSeCLnmLPzBO7IAnZpxKJGG4nbNm1DwQucgmrP
 Em3jMouKLaAcdnQiwjaDCbefgptpjqY0nFJ7ueBLCMkfp8m5MiDmYMaUft9Z4fQOdlBL
 LhDBpxWyJIazWXo60BN7m3KT3OqStEzVhqKMNjy3lKdYJYtXBOJsmszQn816599QqzFv
 Ufig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kEiryAVVZ/D8gLvMToaX9fceSwD/Bq+hkZKd0gW7iok=;
 b=VOi+9niNh+oWnZOk32MEyAG8Wr5Jbr+uyuL7tmB+i9HPGAcLZ/Xd74QqZ1v8OwW4g7
 j3A8xi4t/B3Hz855Ny2kekgF6EGGXaJxu5+Q5IUiLC8qE7bu3wPoyG9+BD4R04uVdXKU
 EUDOZquo2ayXGfN7JP5FyEejzyOT9zPnxs+QERfIV4iprEemG16lgJUX7RM/VvcQR6Zd
 AO6xsHe3VAtMxulXb6orcY4SXo0cKUbHo8Xx6Tw7MZBOvYB7wfnMBveFmGLcjK57DENU
 o0xl1CvuhSMZRhXHikVv+7Ea4G4WkGl+jRjASe5LLHQ6zAtggsJ5L5k6xJKjsFdsXQ05
 WCPg==
X-Gm-Message-State: AOAM5339x2ezdxAaBYwT0FlXe9BhXBeIwMbbFzM7r9OQJFXYi3JhCpG8
 E2uawsRI1Twet+Tb21r3VCqp0NsvU3oW3gf5/W3p4A==
X-Google-Smtp-Source: ABdhPJzSC3pfdhJQCGKleY7misUlcM1F/lV9hyKH4JMy3q3t4ioTcFij6WMQpP3q6KXhXP7jG+BJ3gsbBeCH2odPz74=
X-Received: by 2002:a63:9042:: with SMTP id a63mr6444420pge.345.1637172409725; 
 Wed, 17 Nov 2021 10:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20211021031027.537-1-gurchetansingh@chromium.org>
 <YXFWYlC2nr4scxtz@phenom.ffwll.local>
 <CAC_TJvfZu2Y16WS1ZZAagvAyTo42wpGWeJnzhFiAw2iEAi65pg@mail.gmail.com>
 <CAC_TJvcmghJ25m=+Ai71Ftt3mW9nYAP8UwwZwL1R8GDLVzUnLA@mail.gmail.com>
In-Reply-To: <CAC_TJvcmghJ25m=+Ai71Ftt3mW9nYAP8UwwZwL1R8GDLVzUnLA@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 17 Nov 2021 10:06:38 -0800
Message-ID: <CAC_TJvcLcD37+Q4CNH3LutkvbiNjD3-y0FaH3T=2R6oUjjnZCQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] GPU memory tracepoints
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Mark Underwood <Mark.Underwood@arm.com>,
 Stephen Mansfield <Stephen.Mansfield@imgtec.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Kenny.Ho@amd.com,
 Lingfeng Yang <lfy@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Peiyong Lin <lpy@google.com>,
 John Reitan <John.Reitan@arm.com>, Yiwei Zhang <zzyiwei@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Gary Sweet <gary.sweet@broadcom.com>,
 android-kernel-team <android-kernel-team@google.com>,
 Hridya Valsaraju <hridya@google.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <Orjan.Eide@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Chris Forbes <chrisforbes@google.com>,
 John Reck <jreck@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 1, 2021 at 11:54 AM Kalesh Singh <kaleshsingh@google.com> wrote=
:
>
> On Thu, Oct 21, 2021 at 3:38 PM Kalesh Singh <kaleshsingh@google.com> wro=
te:
> >
> > On Thu, Oct 21, 2021 at 5:00 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Oct 20, 2021 at 08:10:19PM -0700, Gurchetan Singh wrote:
> > > > This is latest iteration of GPU memory tracepoints [1].
> > > >
> > > > In the past, there were questions about the "big picture" of memory
> > > > accounting [2], especially given related work on dma-buf heaps and =
DRM
> > > > cgroups [3].  Also, there was a desire for a non-driver specific so=
lution.
> > > >
> > > > The great news is the dma-buf heaps work as recently landed [4].  I=
t uses
> > > > sys-fs and the plan is to use it in conjunction with the tracepoint
> > > > solution [5].  We're aiming for the GPU tracepoint to calculate tot=
als
> > > > per DRM-instance (a proxy for per-process on Android) and per-DRM d=
evice.
> > > >
> > > > The cgroups work looks terrific too and hopefully we can deduplicat=
e code once
> > > > that's merged.  Though that's abit of an implementation detail, so =
long as
> > > > the "GPU tracepoints" +  "dma-buf heap stats" plan sounds good for =
Android.
> > >
> > > Can we please start out with depulicated code, and integrate this wit=
h
> > > cgroups?
> >
> > Thanks for the comments Dan,
> >
> > The cgroups work is currently targeting allocator attribution so it
> > wouldn=E2=80=99t give insight to shared / imported memory - this is inc=
luded
> > as part of the totals in the tracepoint. We will start a separate
> > discussion with the gpu community on including imported memory into
> > cgroups design. Who would you recommend to be included? (in case we
> > don't already know all the interested parties).
> >
> > The current tracepoint and the cgroups are not conflicting designs but
> > rather complimentary. These are some of the gaps which the tracepoint
> > helps to cover:
> > 1. Imported gpu memory accounting
> > 2. The tracepoint can be used to track gpu memory usage over time
> > (useful to detect memory usage spikes, for example), while cgroups can
> > be used to view usage as a more granular and static state.
> > 3. For systems where cgroups aren't enabled the tracepoint data can be
> > a good alternative to identify memory issues.
> > 4. Non-drm devices can make use of the tracepoint for reporting.
> >
> > It would be great if we can also keep the tracepoint, as we don=E2=80=
=99t have
> > another alternative that provides all it offers (cgroups can certainly
> > be extended to cover some of these),  and it's currently being used by
> > all Android devices.
>
> Hi Daniel,
>
> We had a follow up discussion with Kenny on using drm cgroups. In
> summary, we think that the tracepoints and croups here are orthogonal
> and should not block each other. Would appreciate any advice you have
> on moving this forward.

Hi Daniel,

Friendly ping on this. After discussion with Kenny, we think the
tracepoint and cgroups are complimentary accounting mechanisms. One of
the main use cases for the tracepoint in Android is for profiling GPU
memory using tools like perfetto [1], instead of using periodic
polling. Are there still objections to this? Please advise.

[1] https://perfetto.dev/docs/quickstart/android-tracing

Thanks,
Kalesh

>
> Thanks,
> Kalesh
>
> >
> > Thanks,
> > Kalesh
> >
> > >
> > > The problem with gpu memory account is that everyone wants their own
> > > thing, they're all slightly differently, and all supported by a diffe=
rent
> > > subset of drivers. That doesn't make sense to support in upstream at =
all.
> > >
> > > Please huddle together so that there's one set of "track gpu memory"
> > > calls, and that does cgroups, tracepoints and everything else that an=
 OS
> > > might want to have.
> > >
> > > Also ideally this thing works for both integrated soc gpu (including =
an
> > > answer for special memory pools like cma) _and_ discrete gpus using t=
tm.
> > > Or at least has an answer to both, because again if we end up with to=
tally
> > > different tracking for the soc vs the discrete gpu world, we've lost.
> > > -Daniel
> > >
> > > >
> > > > This series modifies the GPU memory tracepoint API in a non-breakin=
g fashion
> > > > (patch 1), and adds accounting via the GEM subsystem (patches 2 -->=
 7). Given
> > > > the multiple places where memory events happen, there's a bunch tra=
ce events
> > > > scattered in various places.  The hardest part is allocation, where=
 each driver
> > > > has their own API.  If there's a better way, do say so.
> > > >
> > > > The last patch is incomplete; we would like general feedback before=
 proceeding
> > > > further.
> > > >
> > > > [1] https://lore.kernel.org/lkml/20200302235044.59163-1-zzyiwei@goo=
gle.com/
> > > > [2] https://lists.freedesktop.org/archives/dri-devel/2021-January/2=
95120.html
> > > > [3] https://www.spinics.net/lists/cgroups/msg27867.html
> > > > [4] https://www.spinics.net/lists/linux-doc/msg97788.html
> > > > [5] https://source.android.com/devices/graphics/implement-dma-buf-g=
pu-mem
> > > >
> > > > Gurchetan Singh (8):
> > > >   tracing/gpu: modify gpu_mem_total
> > > >   drm: add new tracepoint fields to drm_device and drm_file
> > > >   drm: add helper functions for gpu_mem_total and gpu_mem_instance
> > > >   drm: start using drm_gem_trace_gpu_mem_total
> > > >   drm: start using drm_gem_trace_gpu_mem_instance
> > > >   drm: track real and fake imports in drm_prime_member
> > > >   drm: trace memory import per DRM file
> > > >   drm: trace memory import per DRM device
> > > >
> > > >  drivers/gpu/drm/Kconfig        |  1 +
> > > >  drivers/gpu/drm/drm_gem.c      | 65 ++++++++++++++++++++++++++++++=
+++-
> > > >  drivers/gpu/drm/drm_internal.h |  4 +--
> > > >  drivers/gpu/drm/drm_prime.c    | 22 +++++++++---
> > > >  include/drm/drm_device.h       | 16 +++++++++
> > > >  include/drm/drm_file.h         | 16 +++++++++
> > > >  include/drm/drm_gem.h          |  7 ++++
> > > >  include/trace/events/gpu_mem.h | 61 +++++++++++++++++++++---------=
-
> > > >  8 files changed, 166 insertions(+), 26 deletions(-)
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
