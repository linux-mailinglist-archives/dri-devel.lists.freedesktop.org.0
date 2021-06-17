Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEEB3ABD37
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4E06E0D7;
	Thu, 17 Jun 2021 19:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6046E0D7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:59:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e22so4490600wrc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pQ5KUlIj1LDMoS+tYQys9mdbO+xX/t1lEptbFTTmAzU=;
 b=PW2T6GCkCa7bHO39T4eD74miz1j5726BTD2SHHuCUtdQeC0BUNJgNMK06elLUrSqEA
 /cZZWvroTB3orrhaKDB2N/p3ZNDCFF3PGV8G+Dz3xsndoILPZ/JW+EHZYaz/uuDhBqVX
 Dm+w4+YNbwt+rCbt4pZoPyZAxU/lTjVEvXe/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pQ5KUlIj1LDMoS+tYQys9mdbO+xX/t1lEptbFTTmAzU=;
 b=XyAs9kFrArcxablUOWRsCS5pKhzmWpBoRgO3R6FYePPkL+p2akOCtOq7EiPJid2ibW
 YEyJGzGCL9bNfsJIDZwdpOnA4Adkv9qXMnMwW8gDs1Cw2gZC/UMtTbw+rAnIXW75Utdo
 YRuVxD6Fyh0mT/qF6rloZYG8L2KReDrm/UR67oGl8iWkw9duQNglSBfAu25euYgmezs8
 CuguPsw9djg/ioWdji9Nnf+UBVbnMwAiJTQbPEt9Q0SQ6NJQtZRpxmQJGCZONtIk6V/0
 +Trwza722sEx5z4eWvw9n96HYY0zgHGPRSp5D1dTJ0Y/A/NCpEf7O1WbehM71uYBna40
 glwg==
X-Gm-Message-State: AOAM530Xlbagfhe1c7OcO3n5Rf/YIzAOKG01ZhKhtirUZ+QvaQ9ksSk7
 l1KLo4rmAX1MjMw8Zy+38oYrtQ==
X-Google-Smtp-Source: ABdhPJyHmxx/2ARByxgW3nMMZ3Lpz8zrsytT33/sYhcmG8cCZ7eA725SLR4qud5PHP4AQhNR867hcA==
X-Received: by 2002:adf:908d:: with SMTP id i13mr7998184wri.237.1623959940458; 
 Thu, 17 Jun 2021 12:59:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t4sm6360299wru.53.2021.06.17.12.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:58:59 -0700 (PDT)
Date: Thu, 17 Jun 2021 21:58:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
Message-ID: <YMupgTffAfw8xw51@phenom.ffwll.local>
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
 <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 09:37:36AM +0200, Christian König wrote:
> Am 16.06.21 um 20:30 schrieb Jason Ekstrand:
> > On Tue, Jun 15, 2021 at 3:41 AM Christian König
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Hi Jason & Daniel,
> > > 
> > > maybe I should explain once more where the problem with this approach is
> > > and why I think we need to get that fixed before we can do something
> > > like this here.
> > > 
> > > To summarize what this patch here does is that it copies the exclusive
> > > fence and/or the shared fences into a sync_file. This alone is totally
> > > unproblematic.
> > > 
> > > The problem is what this implies. When you need to copy the exclusive
> > > fence to a sync_file then this means that the driver is at some point
> > > ignoring the exclusive fence on a buffer object.
> > Not necessarily.  Part of the point of this is to allow for CPU waits
> > on a past point in buffers timeline.  Today, we have poll() and
> > GEM_WAIT both of which wait for the buffer to be idle from whatever
> > GPU work is currently happening.  We want to wait on something in the
> > past and ignore anything happening now.
> 
> Good point, yes that is indeed a valid use case.
> 
> > But, to the broader point, maybe?  I'm a little fuzzy on exactly where
> > i915 inserts and/or depends on fences.
> > 
> > > When you combine that with complex drivers which use TTM and buffer
> > > moves underneath you can construct an information leak using this and
> > > give userspace access to memory which is allocated to the driver, but
> > > not yet initialized.
> > > 
> > > This way you can leak things like page tables, passwords, kernel data
> > > etc... in large amounts to userspace and is an absolutely no-go for
> > > security.
> > Ugh...  Unfortunately, I'm really out of my depth on the implications
> > going on here but I think I see your point.
> > 
> > > That's why I'm said we need to get this fixed before we upstream this
> > > patch set here and especially the driver change which is using that.
> > Well, i915 has had uAPI for a while to ignore fences.
> 
> Yeah, exactly that's illegal.

You're a few years too late with closing that barn door. The following
drives have this concept
- i915
- msm
- etnaviv

Because you can't write a competent vulkan driver without this. This was
discussed at absolute epic length in various xdcs iirc. We did ignore a
bit the vram/ttm/bo-moving problem because all the people present were
hacking on integrated gpu (see list above), but that just means we need to
treat the ttm_bo->moving fence properly.

> At least the kernel internal fences like moving or clearing a buffer object
> needs to be taken into account before a driver is allowed to access a
> buffer.

Yes i915 needs to make sure it never ignores ttm_bo->moving.

For dma-buf this isn't actually a problem, because dma-buf are pinned. You
can't move them while other drivers are using them, hence there's not
actually a ttm_bo->moving fence we can ignore.

p2p dma-buf aka dynamic dma-buf is a different beast, and i915 (and fwiw
these other drivers) need to change before they can do dynamic dma-buf.

> Otherwise we have an information leak worth a CVE and that is certainly not
> something we want.

Because yes otherwise we get a CVE. But right now I don't think we have
one.

We do have a quite big confusion on what exactly the signaling ordering is
supposed to be between exclusive and the collective set of shared fences,
and there's some unifying that needs to happen here. But I think what
Jason implements here in the import ioctl is the most defensive version
possible, so really can't break any driver. It really works like you have
an ad-hoc gpu engine that does nothing itself, but waits for the current
exclusive fence and then sets the exclusive fence with its "CS" completion
fence.

That's imo perfectly legit use-case.

Same for the export one. Waiting for a previous snapshot of implicit
fences is imo perfectly ok use-case and useful for compositors - client
might soon start more rendering, and on some drivers that always results
in the exclusive slot being set, so if you dont take a snapshot you
oversync real bad for your atomic flip.

> > Those changes are years in the past.  If we have a real problem here (not sure on
> > that yet), then we'll have to figure out how to fix it without nuking
> > uAPI.
> 
> Well, that was the basic idea of attaching flags to the fences in the
> dma_resv object.
> 
> In other words you clearly denote when you have to wait for a fence before
> accessing a buffer or you cause a security issue.

Replied somewhere else, and I do kinda like the flag idea. But the problem
is we first need a ton more encapsulation and review of drivers before we
can change the internals. One thing at a time.

And yes for amdgpu this gets triple-hard because you both have the
ttm_bo->moving fence _and_ the current uapi of using fence ownership _and_
you need to figure out how to support vulkan properly with true opt-in
fencing. I'm pretty sure it's doable, I'm just not finding any time
anywhere to hack on these patches - too many other fires :-(

Cheers, Daniel

> 
> Christian.
> 
> > 
> > --Jason
> > 
> > 
> > > Regards,
> > > Christian.
> > > 
> > > Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
> > > > Modern userspace APIs like Vulkan are built on an explicit
> > > > synchronization model.  This doesn't always play nicely with the
> > > > implicit synchronization used in the kernel and assumed by X11 and
> > > > Wayland.  The client -> compositor half of the synchronization isn't too
> > > > bad, at least on intel, because we can control whether or not i915
> > > > synchronizes on the buffer and whether or not it's considered written.
> > > > 
> > > > The harder part is the compositor -> client synchronization when we get
> > > > the buffer back from the compositor.  We're required to be able to
> > > > provide the client with a VkSemaphore and VkFence representing the point
> > > > in time where the window system (compositor and/or display) finished
> > > > using the buffer.  With current APIs, it's very hard to do this in such
> > > > a way that we don't get confused by the Vulkan driver's access of the
> > > > buffer.  In particular, once we tell the kernel that we're rendering to
> > > > the buffer again, any CPU waits on the buffer or GPU dependencies will
> > > > wait on some of the client rendering and not just the compositor.
> > > > 
> > > > This new IOCTL solves this problem by allowing us to get a snapshot of
> > > > the implicit synchronization state of a given dma-buf in the form of a
> > > > sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
> > > > instead of CPU waiting directly, it encapsulates the wait operation, at
> > > > the current moment in time, in a sync_file so we can check/wait on it
> > > > later.  As long as the Vulkan driver does the sync_file export from the
> > > > dma-buf before we re-introduce it for rendering, it will only contain
> > > > fences from the compositor or display.  This allows to accurately turn
> > > > it into a VkFence or VkSemaphore without any over- synchronization.
> > > > 
> > > > This patch series actually contains two new ioctls.  There is the export
> > > > one mentioned above as well as an RFC for an import ioctl which provides
> > > > the other half.  The intention is to land the export ioctl since it seems
> > > > like there's no real disagreement on that one.  The import ioctl, however,
> > > > has a lot of debate around it so it's intended to be RFC-only for now.
> > > > 
> > > > Mesa MR: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fmerge_requests%2F4037&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cb094e69c94814727939508d930f4ca94%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637594650220923783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=xUwaiuw8Qt3d37%2F6NYOHU3K%2FMFwsvg79rno9zTNodRs%3D&amp;reserved=0
> > > > IGT tests: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90490%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cb094e69c94814727939508d930f4ca94%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637594650220923783%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=wygYaeVg%2BXmfeEUC45lWH5GgNBukl0%2B%2FMpT5u9LKYDI%3D&amp;reserved=0
> > > > 
> > > > v10 (Jason Ekstrand, Daniel Vetter):
> > > >    - Add reviews/acks
> > > >    - Add a patch to rename _rcu to _unlocked
> > > >    - Split things better so import is clearly RFC status
> > > > 
> > > > v11 (Daniel Vetter):
> > > >    - Add more CCs to try and get maintainers
> > > >    - Add a patch to document DMA_BUF_IOCTL_SYNC
> > > >    - Generally better docs
> > > >    - Use separate structs for import/export (easier to document)
> > > >    - Fix an issue in the import patch
> > > > 
> > > > v12 (Daniel Vetter):
> > > >    - Better docs for DMA_BUF_IOCTL_SYNC
> > > > 
> > > > v12 (Christian König):
> > > >    - Drop the rename patch in favor of Christian's series
> > > >    - Add a comment to the commit message for the dma-buf sync_file export
> > > >      ioctl saying why we made it an ioctl on dma-buf
> > > > 
> > > > Cc: Christian König <christian.koenig@amd.com>
> > > > Cc: Michel Dänzer <michel@daenzer.net>
> > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > > Cc: Daniel Stone <daniels@collabora.com>
> > > > Cc: mesa-dev@lists.freedesktop.org
> > > > Cc: wayland-devel@lists.freedesktop.org
> > > > Test-with: 20210524205225.872316-1-jason@jlekstrand.net
> > > > 
> > > > Christian König (1):
> > > >     dma-buf: Add dma_fence_array_for_each (v2)
> > > > 
> > > > Jason Ekstrand (5):
> > > >     dma-buf: Add dma_resv_get_singleton (v6)
> > > >     dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
> > > >     dma-buf: Add an API for exporting sync files (v12)
> > > >     RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unlocked
> > > >     RFC: dma-buf: Add an API for importing sync files (v7)
> > > > 
> > > >    Documentation/driver-api/dma-buf.rst |   8 ++
> > > >    drivers/dma-buf/dma-buf.c            | 103 +++++++++++++++++++++++++
> > > >    drivers/dma-buf/dma-fence-array.c    |  27 +++++++
> > > >    drivers/dma-buf/dma-resv.c           | 110 +++++++++++++++++++++++++++
> > > >    include/linux/dma-fence-array.h      |  17 +++++
> > > >    include/linux/dma-resv.h             |   2 +
> > > >    include/uapi/linux/dma-buf.h         | 103 ++++++++++++++++++++++++-
> > > >    7 files changed, 369 insertions(+), 1 deletion(-)
> > > > 
> 
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
