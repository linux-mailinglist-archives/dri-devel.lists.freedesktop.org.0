Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338F442059
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 19:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D516E23B;
	Mon,  1 Nov 2021 18:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1191F6E23B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 18:54:58 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id b13so744795plg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Nov 2021 11:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jE4EmXPxzPjHYSVUsCVNkTKVW+O+LxX4PMsksPUHGx4=;
 b=n4ExXP2WU6Zf5cFPTRWbPRvruPiz7yD4ryrc3g3HLM43Y56eXwNo5WeffaQC5LZ17f
 dWEpsEiL5aZr/LJnCTIaoIv67XzSWNnsada9aUyF8whEW/8EsNgkhzlF7R82kOBmaZJC
 +KZWD++WdNbyV2er1kYgz5krbCieKDIVMBbxN3TPX14xUVibGCS4KIlX/Ec7dT1YcJKn
 8Mi7X+Zp2tX+Q1WdGAbQ15ZeOH1qguhT6CyhgYRcwwrPaSabL4btMyUCP2nXtPTUScEc
 DQwSCHoRCairKfWIRCuDebQo6Tc1gDlgKAFuBY9vMuYVcaryK1Qww7u+vtKzJF6e3Qor
 UyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jE4EmXPxzPjHYSVUsCVNkTKVW+O+LxX4PMsksPUHGx4=;
 b=VrCQfTvlsxzMEyhU95KeQNQO9u/Z+oXbWg0kC8gxTVNZL58r+PS2j1KznhLUZMng93
 dqAahhHszlVDuoElT5//mjG4OM+b3FAdZjkYelCTlccNfKD66gEK/z91SSMaMmwi0ovJ
 UrSCEV72C857gSY9EWxV0XMtmJ3ZiE8A+5dS9gVj8auRvUVV2PgRAeIAyA9Do7AGRsD7
 XvrH0jUIkQaMsKPBHEtuZevrRbpcLAdqF0OV5kIqFFHo49nkHcnioCBTynh8MVPgSq5Q
 seRviAXPRaJ3c9smoSrqCiry1VytjqbTkhqQktoTQLO2V/BlMzMTWOyzlU1nmFt1R7g8
 Nkkg==
X-Gm-Message-State: AOAM532JcZlnKAOnRUGsxxhh/wP/GZuhsB9ZbFkq+QBDsNeNd/uwVQbY
 OoyOJafmEyvVPpy7lYQ/i1SV7b13IPdZ44Ehvd3YRQ==
X-Google-Smtp-Source: ABdhPJxEDzZo9BSAdZaPyL7ujJq4yNyrhjwC59t2VVjzlemKe/5as05xzZOtuIa9F2Nc2G02IqsrWFkTvJWstIDXqlk=
X-Received: by 2002:a17:90b:3e8e:: with SMTP id
 rj14mr824888pjb.170.1635792897284; 
 Mon, 01 Nov 2021 11:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211021031027.537-1-gurchetansingh@chromium.org>
 <YXFWYlC2nr4scxtz@phenom.ffwll.local>
 <CAC_TJvfZu2Y16WS1ZZAagvAyTo42wpGWeJnzhFiAw2iEAi65pg@mail.gmail.com>
In-Reply-To: <CAC_TJvfZu2Y16WS1ZZAagvAyTo42wpGWeJnzhFiAw2iEAi65pg@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Mon, 1 Nov 2021 11:54:46 -0700
Message-ID: <CAC_TJvcmghJ25m=+Ai71Ftt3mW9nYAP8UwwZwL1R8GDLVzUnLA@mail.gmail.com>
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

On Thu, Oct 21, 2021 at 3:38 PM Kalesh Singh <kaleshsingh@google.com> wrote=
:
>
> On Thu, Oct 21, 2021 at 5:00 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Oct 20, 2021 at 08:10:19PM -0700, Gurchetan Singh wrote:
> > > This is latest iteration of GPU memory tracepoints [1].
> > >
> > > In the past, there were questions about the "big picture" of memory
> > > accounting [2], especially given related work on dma-buf heaps and DR=
M
> > > cgroups [3].  Also, there was a desire for a non-driver specific solu=
tion.
> > >
> > > The great news is the dma-buf heaps work as recently landed [4].  It =
uses
> > > sys-fs and the plan is to use it in conjunction with the tracepoint
> > > solution [5].  We're aiming for the GPU tracepoint to calculate total=
s
> > > per DRM-instance (a proxy for per-process on Android) and per-DRM dev=
ice.
> > >
> > > The cgroups work looks terrific too and hopefully we can deduplicate =
code once
> > > that's merged.  Though that's abit of an implementation detail, so lo=
ng as
> > > the "GPU tracepoints" +  "dma-buf heap stats" plan sounds good for An=
droid.
> >
> > Can we please start out with depulicated code, and integrate this with
> > cgroups?
>
> Thanks for the comments Dan,
>
> The cgroups work is currently targeting allocator attribution so it
> wouldn=E2=80=99t give insight to shared / imported memory - this is inclu=
ded
> as part of the totals in the tracepoint. We will start a separate
> discussion with the gpu community on including imported memory into
> cgroups design. Who would you recommend to be included? (in case we
> don't already know all the interested parties).
>
> The current tracepoint and the cgroups are not conflicting designs but
> rather complimentary. These are some of the gaps which the tracepoint
> helps to cover:
> 1. Imported gpu memory accounting
> 2. The tracepoint can be used to track gpu memory usage over time
> (useful to detect memory usage spikes, for example), while cgroups can
> be used to view usage as a more granular and static state.
> 3. For systems where cgroups aren't enabled the tracepoint data can be
> a good alternative to identify memory issues.
> 4. Non-drm devices can make use of the tracepoint for reporting.
>
> It would be great if we can also keep the tracepoint, as we don=E2=80=99t=
 have
> another alternative that provides all it offers (cgroups can certainly
> be extended to cover some of these),  and it's currently being used by
> all Android devices.

Hi Daniel,

We had a follow up discussion with Kenny on using drm cgroups. In
summary, we think that the tracepoints and croups here are orthogonal
and should not block each other. Would appreciate any advice you have
on moving this forward.

Thanks,
Kalesh

>
> Thanks,
> Kalesh
>
> >
> > The problem with gpu memory account is that everyone wants their own
> > thing, they're all slightly differently, and all supported by a differe=
nt
> > subset of drivers. That doesn't make sense to support in upstream at al=
l.
> >
> > Please huddle together so that there's one set of "track gpu memory"
> > calls, and that does cgroups, tracepoints and everything else that an O=
S
> > might want to have.
> >
> > Also ideally this thing works for both integrated soc gpu (including an
> > answer for special memory pools like cma) _and_ discrete gpus using ttm=
.
> > Or at least has an answer to both, because again if we end up with tota=
lly
> > different tracking for the soc vs the discrete gpu world, we've lost.
> > -Daniel
> >
> > >
> > > This series modifies the GPU memory tracepoint API in a non-breaking =
fashion
> > > (patch 1), and adds accounting via the GEM subsystem (patches 2 --> 7=
). Given
> > > the multiple places where memory events happen, there's a bunch trace=
 events
> > > scattered in various places.  The hardest part is allocation, where e=
ach driver
> > > has their own API.  If there's a better way, do say so.
> > >
> > > The last patch is incomplete; we would like general feedback before p=
roceeding
> > > further.
> > >
> > > [1] https://lore.kernel.org/lkml/20200302235044.59163-1-zzyiwei@googl=
e.com/
> > > [2] https://lists.freedesktop.org/archives/dri-devel/2021-January/295=
120.html
> > > [3] https://www.spinics.net/lists/cgroups/msg27867.html
> > > [4] https://www.spinics.net/lists/linux-doc/msg97788.html
> > > [5] https://source.android.com/devices/graphics/implement-dma-buf-gpu=
-mem
> > >
> > > Gurchetan Singh (8):
> > >   tracing/gpu: modify gpu_mem_total
> > >   drm: add new tracepoint fields to drm_device and drm_file
> > >   drm: add helper functions for gpu_mem_total and gpu_mem_instance
> > >   drm: start using drm_gem_trace_gpu_mem_total
> > >   drm: start using drm_gem_trace_gpu_mem_instance
> > >   drm: track real and fake imports in drm_prime_member
> > >   drm: trace memory import per DRM file
> > >   drm: trace memory import per DRM device
> > >
> > >  drivers/gpu/drm/Kconfig        |  1 +
> > >  drivers/gpu/drm/drm_gem.c      | 65 ++++++++++++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/drm_internal.h |  4 +--
> > >  drivers/gpu/drm/drm_prime.c    | 22 +++++++++---
> > >  include/drm/drm_device.h       | 16 +++++++++
> > >  include/drm/drm_file.h         | 16 +++++++++
> > >  include/drm/drm_gem.h          |  7 ++++
> > >  include/trace/events/gpu_mem.h | 61 +++++++++++++++++++++----------
> > >  8 files changed, 166 insertions(+), 26 deletions(-)
> > >
> > > --
> > > 2.25.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
