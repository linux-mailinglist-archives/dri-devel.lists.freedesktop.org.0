Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74EE3AA32C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 20:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373386E7D1;
	Wed, 16 Jun 2021 18:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3256E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 18:30:18 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id q21so4374288ybg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=34cq8IvIDwPVvyA3EOTOQ1r9UN4km1lSBDsnHtds6Js=;
 b=Emt3QzsgA2Lm5f9qWedRGqwGF8gdCVK7JGGt8D7/NYcV/2GxD33ecrPhHJOYadKwPH
 hl0LWa+YKKbpj4iT4r2pSDUqsKosI2qb7A6ka3eVBQB0A53pLdfaWgISMBrnmzeQzK7W
 9biutI97cXaUIwjf8IjzeOTP+nVoacG+MCSs8ReI/EdtXZjkDPeZEyXw44xbJRvVeAuM
 w47S5DbVuqSCZvuosRvwzhUQKm72iNE2DJgzwDGC5Jmzt8UHJT0p85E//iIZmfekslAq
 7dUMfw9sGl6H1HxXpGy0a9QYTJLK0ufnLkw9CxfcQSJkTxKS+GjJ/jTS+RsLzEkPmGkE
 LqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=34cq8IvIDwPVvyA3EOTOQ1r9UN4km1lSBDsnHtds6Js=;
 b=fT12StD155PBsu576dpyWc1YwoMFryhny2szu/F5XdAQV8uJpuZInbislvwnGcWv0o
 iwfL4PRXtO3Dvaup7xgwOxT0x+OAC3YCPK2LlBjxXiX3vDQyPiXuBpHp56H9MXByWikT
 O7gweXyhMKBaGj+tZNZ0tVE0Dv0XInESoT+AnO2CYw6TcZeLfmXNdGuvcdCBxjvShS3q
 4uXZDoCIVHRNb0N48UazNyH3B9BSZ33kByb+nm73ZbJwI/26/C8uQa580HJzGlr8PXDi
 Rup+IeGkCdyxuggVQpXp/UQtLhfg8SGKFhzfxmIQOcxKoCT9Pr4NeYPAuZJ24twbezPM
 beCA==
X-Gm-Message-State: AOAM530cHsVetp1IEmUCeRiIO9ywJGzIDz0xt1bSqWc7Z7B1eMGKTihD
 9KxMVLTkl8fgXdkNCxMRFrRT+VsSO1UjMygxx19CFA==
X-Google-Smtp-Source: ABdhPJzQY2z8IW3nYwDY2xni+se7Vj4b2Qv5VEUF/owSVW8geYgmQyHYlCTcI0/fZiJ2tutb7vvGXzyDD1dkqYmAQ3g=
X-Received: by 2002:a25:81c5:: with SMTP id n5mr510360ybm.323.1623868217012;
 Wed, 16 Jun 2021 11:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
In-Reply-To: <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 16 Jun 2021 13:30:05 -0500
Message-ID: <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 3:41 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi Jason & Daniel,
>
> maybe I should explain once more where the problem with this approach is
> and why I think we need to get that fixed before we can do something
> like this here.
>
> To summarize what this patch here does is that it copies the exclusive
> fence and/or the shared fences into a sync_file. This alone is totally
> unproblematic.
>
> The problem is what this implies. When you need to copy the exclusive
> fence to a sync_file then this means that the driver is at some point
> ignoring the exclusive fence on a buffer object.

Not necessarily.  Part of the point of this is to allow for CPU waits
on a past point in buffers timeline.  Today, we have poll() and
GEM_WAIT both of which wait for the buffer to be idle from whatever
GPU work is currently happening.  We want to wait on something in the
past and ignore anything happening now.

But, to the broader point, maybe?  I'm a little fuzzy on exactly where
i915 inserts and/or depends on fences.

> When you combine that with complex drivers which use TTM and buffer
> moves underneath you can construct an information leak using this and
> give userspace access to memory which is allocated to the driver, but
> not yet initialized.
>
> This way you can leak things like page tables, passwords, kernel data
> etc... in large amounts to userspace and is an absolutely no-go for
> security.

Ugh...  Unfortunately, I'm really out of my depth on the implications
going on here but I think I see your point.

> That's why I'm said we need to get this fixed before we upstream this
> patch set here and especially the driver change which is using that.

Well, i915 has had uAPI for a while to ignore fences.  Those changes
are years in the past.  If we have a real problem here (not sure on
that yet), then we'll have to figure out how to fix it without nuking
uAPI.

--Jason


> Regards,
> Christian.
>
> Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
> > Modern userspace APIs like Vulkan are built on an explicit
> > synchronization model.  This doesn't always play nicely with the
> > implicit synchronization used in the kernel and assumed by X11 and
> > Wayland.  The client -> compositor half of the synchronization isn't to=
o
> > bad, at least on intel, because we can control whether or not i915
> > synchronizes on the buffer and whether or not it's considered written.
> >
> > The harder part is the compositor -> client synchronization when we get
> > the buffer back from the compositor.  We're required to be able to
> > provide the client with a VkSemaphore and VkFence representing the poin=
t
> > in time where the window system (compositor and/or display) finished
> > using the buffer.  With current APIs, it's very hard to do this in such
> > a way that we don't get confused by the Vulkan driver's access of the
> > buffer.  In particular, once we tell the kernel that we're rendering to
> > the buffer again, any CPU waits on the buffer or GPU dependencies will
> > wait on some of the client rendering and not just the compositor.
> >
> > This new IOCTL solves this problem by allowing us to get a snapshot of
> > the implicit synchronization state of a given dma-buf in the form of a
> > sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only=
,
> > instead of CPU waiting directly, it encapsulates the wait operation, at
> > the current moment in time, in a sync_file so we can check/wait on it
> > later.  As long as the Vulkan driver does the sync_file export from the
> > dma-buf before we re-introduce it for rendering, it will only contain
> > fences from the compositor or display.  This allows to accurately turn
> > it into a VkFence or VkSemaphore without any over- synchronization.
> >
> > This patch series actually contains two new ioctls.  There is the expor=
t
> > one mentioned above as well as an RFC for an import ioctl which provide=
s
> > the other half.  The intention is to land the export ioctl since it see=
ms
> > like there's no real disagreement on that one.  The import ioctl, howev=
er,
> > has a lot of debate around it so it's intended to be RFC-only for now.
> >
> > Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
> > IGT tests: https://patchwork.freedesktop.org/series/90490/
> >
> > v10 (Jason Ekstrand, Daniel Vetter):
> >   - Add reviews/acks
> >   - Add a patch to rename _rcu to _unlocked
> >   - Split things better so import is clearly RFC status
> >
> > v11 (Daniel Vetter):
> >   - Add more CCs to try and get maintainers
> >   - Add a patch to document DMA_BUF_IOCTL_SYNC
> >   - Generally better docs
> >   - Use separate structs for import/export (easier to document)
> >   - Fix an issue in the import patch
> >
> > v12 (Daniel Vetter):
> >   - Better docs for DMA_BUF_IOCTL_SYNC
> >
> > v12 (Christian K=C3=B6nig):
> >   - Drop the rename patch in favor of Christian's series
> >   - Add a comment to the commit message for the dma-buf sync_file expor=
t
> >     ioctl saying why we made it an ioctl on dma-buf
> >
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Cc: Daniel Stone <daniels@collabora.com>
> > Cc: mesa-dev@lists.freedesktop.org
> > Cc: wayland-devel@lists.freedesktop.org
> > Test-with: 20210524205225.872316-1-jason@jlekstrand.net
> >
> > Christian K=C3=B6nig (1):
> >    dma-buf: Add dma_fence_array_for_each (v2)
> >
> > Jason Ekstrand (5):
> >    dma-buf: Add dma_resv_get_singleton (v6)
> >    dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
> >    dma-buf: Add an API for exporting sync files (v12)
> >    RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unlocked
> >    RFC: dma-buf: Add an API for importing sync files (v7)
> >
> >   Documentation/driver-api/dma-buf.rst |   8 ++
> >   drivers/dma-buf/dma-buf.c            | 103 +++++++++++++++++++++++++
> >   drivers/dma-buf/dma-fence-array.c    |  27 +++++++
> >   drivers/dma-buf/dma-resv.c           | 110 ++++++++++++++++++++++++++=
+
> >   include/linux/dma-fence-array.h      |  17 +++++
> >   include/linux/dma-resv.h             |   2 +
> >   include/uapi/linux/dma-buf.h         | 103 ++++++++++++++++++++++++-
> >   7 files changed, 369 insertions(+), 1 deletion(-)
> >
>
