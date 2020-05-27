Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A11E462A
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 16:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44ED89C9C;
	Wed, 27 May 2020 14:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1460B89C9C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 14:39:45 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id c3so19277123otr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UsOgyqTj6z/wyl0QX0JsjQ4RP50jUu+4BmmpHTyPz20=;
 b=kpvbs0R+Cw25sfx0TrD+OjNlEGXcgZjOqhbviQxuqngTqE35siQ0PQvKbSkb2XxCkx
 zwEh12abmpshAXgzi4KcGCVZvC7KvsqpiX8ZHVzFQJ1TIhK6FZ9h+BscDcJ6XQqL36K0
 vKgsh+A1vq7gzRrUB+SDGJN6WD+mj9n9y6Cd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UsOgyqTj6z/wyl0QX0JsjQ4RP50jUu+4BmmpHTyPz20=;
 b=Xg7f1v2tjP4tXiI4V/sbqLY0W1om7bdofoWRWUNinb2HmJC5nJHTV2jTav4307iQ5K
 J1bkSz61IgZQ7R7VI2gU3sBYPpPe0DImxzeRW7pa/AjuBYrPtXkumBVnLYw8FYgwMzd0
 auTWgLxVwY57vQLZI2vE5s6S76gYOqbXKMOXE6iUR6L1eD6ItCS5F8SzKsKwtR+BROwa
 YXYLw2ctgicZMhYARbP/zU7yef6loMOtLYufCuZYpeIhXe8fzxzWghGzgstQkn7JQMok
 Ah1QCwRw/yNrc30MlcvugBpF+8DkB7cCsBobl0XB/mPq1XxT4QseiFcQP8RgHe4qwAGO
 o1FQ==
X-Gm-Message-State: AOAM532uExt1/hVRV+1ZG1Jr+YUZimCztK6iV0sn2w7fEvRJ8++e0SE/
 dwOGrgW/8GblplOoawGB3tkqvvjvuKnXmfMhWATnWA==
X-Google-Smtp-Source: ABdhPJyo81e7av+1bJclK5YfILy9sCe0rMjsTp6jeMXYK69bs4aVzuUMJ2KTNOWLVveQO940d99Qx4aT3g1ycty2GLI=
X-Received: by 2002:a9d:600e:: with SMTP id h14mr5145175otj.281.1590590384275; 
 Wed, 27 May 2020 07:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <db6e57bd-a5c0-f156-93ca-80828d98064e@amd.com>
 <20200527094428.4b4a7ca6@eldfell.localdomain>
 <63d2e957-ae79-8c70-29c9-fd53a7de92cf@amd.com>
In-Reply-To: <63d2e957-ae79-8c70-29c9-fd53a7de92cf@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 27 May 2020 16:39:33 +0200
Message-ID: <CAKMK7uGHrPfAeN-PVZ5ixf7hSGj-RatTebt-nR5pTsykWOMkAw@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 3:51 PM Andrey Grodzovsky
<Andrey.Grodzovsky@amd.com> wrote:
>
>
> On 5/27/20 2:44 AM, Pekka Paalanen wrote:
> > On Tue, 26 May 2020 10:30:20 -0400
> > Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:
> >
> >> On 5/19/20 6:06 AM, Pekka Paalanen wrote:
> >>> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> >>>
> >>> Set up the expectations on how hot-unplugging a DRM device should look like to
> >>> userspace.
> >>>
> >>> Written by Daniel Vetter's request and largely based on his comments in IRC and
> >>> from https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.html&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Ce8e13dc4c85648e5fcd408d7fbdc5f2b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637254796242596783&amp;sdata=bA%2FAy3VGvzNqmV1kGigNROSZQEws2E98JibDxvEICNs%3D&amp;reserved=0 .
> >>>
> >>> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> >>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>> Cc: Dave Airlie <airlied@redhat.com>
> >>> Cc: Sean Paul <sean@poorly.run>
> >>>
> >>> ---
> >>>
> >>> Disclaimer: I am a userspace developer writing for other userspace developers.
> >>> I took some liberties in defining what should happen without knowing what is
> >>> actually possible or what existing drivers already implement.
> >>> ---
> >>>    Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++++++++++
> >>>    1 file changed, 75 insertions(+)
> >>>
> >>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> >>> index 56fec6ed1ad8..80db4abd2cbd 100644
> >>> --- a/Documentation/gpu/drm-uapi.rst
> >>> +++ b/Documentation/gpu/drm-uapi.rst
> >>> @@ -1,3 +1,5 @@
> >>> +.. Copyright 2020 DisplayLink (UK) Ltd.
> >>> +
> >>>    ===================
> >>>    Userland interfaces
> >>>    ===================
> >>> @@ -162,6 +164,79 @@ other hand, a driver requires shared state between clients which is
> >>>    visible to user-space and accessible beyond open-file boundaries, they
> >>>    cannot support render nodes.
> >>>
> >>> +Device Hot-Unplug
> >>> +=================
> >>> +
> >>> +.. note::
> >>> +   The following is the plan. Implementation is not there yet
> >>> +   (2020 May 13).
> >>> +
> >>> +Graphics devices (display and/or render) may be connected via USB (e.g.
> >>> +display adapters or docking stations) or Thunderbolt (e.g. eGPU). An end
> >>> +user is able to hot-unplug this kind of devices while they are being
> >>> +used, and expects that the very least the machine does not crash. Any
> >>> +damage from hot-unplugging a DRM device needs to be limited as much as
> >>> +possible and userspace must be given the chance to handle it if it wants
> >>> +to. Ideally, unplugging a DRM device still lets a desktop to continue
> >>> +running, but that is going to need explicit support throughout the whole
> >>> +graphics stack: from kernel and userspace drivers, through display
> >>> +servers, via window system protocols, and in applications and libraries.
> >>> +
> >>> +Other scenarios that should lead to the same are: unrecoverable GPU
> >>> +crash, PCI device disappearing off the bus, or forced unbind of a driver
> >>> +from the physical device.
> >>> +
> >>> +In other words, from userspace perspective everything needs to keep on
> >>> +working more or less, until userspace stops using the disappeared DRM
> >>> +device and closes it completely. Userspace will learn of the device
> >>> +disappearance from the device removed uevent or in some cases specific
> >>> +ioctls returning EIO.
> >>> +
> >>> +This goal raises at least the following requirements for the kernel and
> >>> +drivers:
> >>> +
> >>> +- The kernel must not hang, crash or oops, no matter what userspace was
> >>> +  in the middle of doing when the device disappeared.
> >>> +
> >>> +- All GPU jobs that can no longer run must have their fences
> >>> +  force-signalled to avoid inflicting hangs to userspace.
> >>> +
> >>> +- KMS connectors must change their status to disconnected.
> >>> +
> >>> +- Legacy modesets and pageflips fake success.
> >>> +
> >>> +- Atomic commits, both real and TEST_ONLY, fake success.
> >>> +
> >>> +- Pending non-blocking KMS operations deliver the DRM events userspace
> >>> +  is expecting.
> >>> +
> >>> +- If underlying memory disappears, the mmaps are replaced with harmless
> >>> +  zero pages where access does not raise SIGBUS. Reads return zeros,
> >>> +  writes are ignored.
> >>
> >> Regarding this paragraph - what about exiting mappings ? In the first
> >> patchset we would actively invalidate all the existing CPU mappings to
> >> device memory and i think we still should do it otherwise we will see
> >> random crashes in applications as was before. I guess it's because TLBs
> >> and page tables are not updated to reflect the fact the device is gone.
> > Hi,
> >
> > I was talking about existing mappings. What I forgot to specify is how
> > new mmap() calls after the device disappearance should work (the end
> > result should be the same still, not failure).
> >
> > I'll clarify this in the next revision.
> >
> >
> > Thanks,
> > pq
>
>
> I see, that ok.
>
> Next related question is more for Daniel/Christian - about the
> implementation of this paragraph, I was thinking about something like
> checking for device disconnect in ttm_bo_vm_fault_reserved and if so
> remap the entire VA range for the VMA where the fault address belongs to
> the global zero page (i.e. (remap_pfn_range(vma, vma->vm_start,
> page_to_pfn(ZERO_PAGE(vma->vm_start), vma->vm_end - vma->vm_start,
> vma->vm_page_prot)). Question is, when the doc says 'writes are ignored'
> does it mean i should use copy on write for the vma->vm_page_prot and if
> so how i actually do it as i was not able to find what flags to set into
> vm_page_prot to force copy on write behavior.

Already discussed this with Pekka on irc, I think simply a private
page (per gpu ctx to avoid leaks) is good enough. Otherwise we need to
catch write faults and throw the writes away, and that's a) a bit
tricky to implement and b) slow, which we kinda don't want to. If the
desktop is stuck for a few seconds because we're trapping every write
of a 4k buffer that's getting uploaded, the user is going to have a
bad time :-/
-Daniel

>
> Andrey
>
>
>
>
> >
> >
> >>> +
> >>> +- dmabuf which point to memory that has disappeared are rewritten to
> >>> +  point to harmless zero pages, similar to mmaps. Imports still succeed
> >>> +  both ways: an existing device importing a dmabuf pointing to
> >>> +  disappeared memory, and a disappeared device importing any dmabuf.
> >>> +
> >>> +- Render ioctls return EIO which is then handled in userspace drivers,
> >>> +  e.g. Mesa, to have the device disappearance handled in the way
> >>> +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
> >>> +  Vulkan: VK_ERROR_DEVICE_LOST; etc.)
> >>> +
> >>> +Raising SIGBUS is not an option, because userspace cannot realistically
> >>> +handle it.  Signal handlers are global, which makes them extremely
> >>> +difficult to use correctly from libraries like Mesa produces. Signal
> >>> +handlers are not composable, you can't have different handlers for GPU1
> >>> +and GPU2 from different vendors, and a third handler for mmapped regular
> >>> +files.  Threads cause additional pain with signal handling as well.
> >>> +
> >>> +Only after userspace has closed all relevant DRM device and dmabuf file
> >>> +descriptors and removed all mmaps, the DRM driver can tear down its
> >>> +instance for the device that no longer exists. If the same physical
> >>> +device somehow comes back in the mean time, it shall be a new DRM
> >>> +device.
> >>> +
> >>>    .. _drm_driver_ioctl:
> >>>
> >>>    IOCTL Support on Device Nodes



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
