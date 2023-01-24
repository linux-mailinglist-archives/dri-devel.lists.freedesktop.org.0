Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C725867A6BC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 00:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB72010E272;
	Tue, 24 Jan 2023 23:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D1010E272
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 23:14:33 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id 129so16917719ybb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krDGb1uU0XHSs1OnKklnaD4UaHKK3uJv8fDw9pZZXWY=;
 b=QJLIIsqDx5aF75RhrTgSXc88brM8P88THPq/9Ks/gGtMI6/ruL7ih5m5TKdPmzFe8v
 r3GgHKG7J+BvhtQS7v+gGM86NRt3vR5l7fX2ImGSWCReg/ableZF5jFnqoRKYug/m3g9
 KuYJRXs6GVCbmIPfHjrwwvX5Hme4xkkzeDx3tGpQj9guG0aUGeJI5+ghe0zpU+COcUwz
 3ldPV7o5TN7MG4BtWLx252cjPUpqsg0RprhxjzD8E7QnN+I2mcUkjo7BhDIhJe4DmQfz
 iJIc8H+AWSOU5lpjONDYFN/vvT+rPBfiEyK/NBfrciqmf+qvJP4xceczLYl60L94iRaW
 DJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=krDGb1uU0XHSs1OnKklnaD4UaHKK3uJv8fDw9pZZXWY=;
 b=tBS9kKcd87tmP7O6LllpH4KJwjY7crn86wCBrS7rIRmkUo8eVzm1rk6aMVbQ4RJ4J9
 BZKCFgEdUm7q8m11F9StCQND0hjuNHNUGyiOyXPlGMsLpEspzq29ki71PIDa0v4rG5+V
 cqI7WF910L3YLGacmHHxatSfYxbpJ1I2nlSK6x0MeSZ3CLfOwVmxSsLRbDr/bINbfR/v
 wt7gYBIaC8xZ4vyMFi9Ay+/Z2/zwOqcbPZsjtz/jUEowH9KnqtYIOyGVlE9/KsGioDLe
 07v09/iMRmqoycjg2xpAIPG9luQ5kqnfVtifwrtSRLPes1koESq1Er4ejQ+W5CfRa1r2
 S0Hg==
X-Gm-Message-State: AFqh2krY6XG2O2wlAKvmHGkb1Clwk5bhw7HW5c1JXyHOK4cOQgI1GZMT
 XVXmKtWSKfaLEjhzszKBOFt1qVBVV+ZlRcUpUO0gVw==
X-Google-Smtp-Source: AMrXdXubk+Lhh+dwul+T/ENR0j11N91K9dth8kAHH0RZnrUK5eD84S4y2OMxqlPJsIRr6fpzEPZDFosLo2Ap7VrIZBE=
X-Received: by 2002:a25:4d54:0:b0:7b3:d193:23ac with SMTP id
 a81-20020a254d54000000b007b3d19323acmr3387694ybb.97.1674602071880; Tue, 24
 Jan 2023 15:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
 <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
 <Y868mG7Oa5bI1wB7@pendragon.ideasonboard.com>
 <349797d3-2406-cb78-4d3d-61a4628f762b@nvidia.com>
 <ece8638d-01a3-6e25-c68c-c9e225200b08@amd.com>
In-Reply-To: <ece8638d-01a3-6e25-c68c-c9e225200b08@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Jan 2023 15:14:20 -0800
Message-ID: <CABdmKX2ufe2ufuoZL8GzSJAT8mNGOcrb2P2=Of27cWhCNtLEPg@mail.gmail.com>
Subject: Re: DMA-heap driver hints
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: hverkuil@xs4all.nl, sebastian.wick@redhat.com, mchehab@kernel.org,
 benjamin.gaignard@collabora.com, lmark@codeaurora.org,
 James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org,
 nicolas@ndufresne.ca, linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
 jstultz@google.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tfiga@chromium.org, labbott@redhat.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 11:49 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 24.01.23 um 04:56 schrieb James Jones:
> > On 1/23/23 08:58, Laurent Pinchart wrote:
> >> Hi Christian,
> >>
> >> On Mon, Jan 23, 2023 at 05:29:18PM +0100, Christian K=C3=B6nig wrote:
> >>> Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
> >>>> Hi Christian,
> >>>>
> >>>> CC'ing James as I think this is related to his work on the unix devi=
ce
> >>>> memory allocator ([1]).
> >
> > Thank you for including me.
>
> Sorry for not having you in initially. I wasn't aware of your previous
> work in this area.
>
> >
> >>>> [1]
> >>>> https://lore.kernel.org/dri-devel/8b555674-1c5b-c791-4547-2ea7c16aee=
6c@nvidia.com/
> >>>>
> >>>> On Mon, Jan 23, 2023 at 01:37:54PM +0100, Christian K=C3=B6nig wrote=
:
> >>>>> Hi guys,
> >>>>>
> >>>>> this is just an RFC! The last time we discussed the DMA-buf coheren=
cy
> >>>>> problem [1] we concluded that DMA-heap first needs a better way to
> >>>>> communicate to userspace which heap to use for a certain device.
> >>>>>
> >>>>> As far as I know userspace currently just hard codes that informati=
on
> >>>>> which is certainly not desirable considering that we should have th=
is
> >>>>> inside the kernel as well.
> >>>>>
> >>>>> So what those two patches here do is to first add some
> >>>>> dma_heap_create_device_link() and dma_heap_remove_device_link()
> >>>>> function and then demonstrating the functionality with uvcvideo
> >>>>> driver.
> >>>>>
> >>>>> The preferred DMA-heap is represented with a symlink in sysfs betwe=
en
> >>>>> the device and the virtual DMA-heap device node.
> >>>>
> >>>> I'll start with a few high-level comments/questions:
> >>>>
> >>>> - Instead of tying drivers to heaps, have you considered a system
> >>>> where
> >>>>     a driver would expose constraints, and a heap would then be
> >>>> selected
> >>>>     based on those constraints ? A tight coupling between heaps and
> >>>>     drivers means downstream patches to drivers in order to use
> >>>>     vendor-specific heaps, that sounds painful.
> >>>
> >>> I was wondering the same thing as well, but came to the conclusion th=
at
> >>> just the other way around is the less painful approach.
> >>
> >>  From a kernel point of view, sure, it's simpler and thus less painful=
.
> >>  From the point of view of solving the whole issue, I'm not sure :-)
> >>
> >>> The problem is that there are so many driver specific constrains that=
 I
> >>> don't even know where to start from.
> >>
> >> That's where I was hoping James would have some feedback for us, based
> >> on the work he did on the Unix device memory allocator. If that's not
> >> the case, we can brainstorm this from scratch.
> >
> > Simon Ser's and my presentation from XDC 2020 focused entirely on
> > this. The idea was not to try to enumerate every constraint up front,
> > but rather to develop an extensible mechanism that would be flexible
> > enough to encapsulate many disparate types of constraints and perform
> > set operations on them (merging sets was the only operation we tried
> > to solve). Simon implemented a prototype header-only library to
> > implement the mechanism:
> >
> > https://gitlab.freedesktop.org/emersion/drm-constraints
> >
> > The links to the presentation and talk are below, along with notes
> > from the follow-up workshop.
> >
> > https://lpc.events/event/9/contributions/615/attachments/704/1301/XDC_2=
020__Allocation_Constraints.pdf
> >
> > https://www.youtube.com/watch?v=3DHZEClOP5TIk
> > https://paste.sr.ht/~emersion/c43b30be08bab1882f1b107402074462bba3b64a
> >
> > Note one of the hard parts of this was figuring out how to express a
> > device or heap within the constraint structs. One of the better ideas
> > proposed back then was something like heap IDs, where dma heaps would
> > each have one,
>
> We already have that. Each dma_heap has it's own unique name.
>
> > and devices could register their own heaps (or even just themselves?)
> > with the heap subsystem and be assigned a locally-unique ID that
> > userspace could pass around.
>
> I was more considering that we expose some kind of flag noting that a
> certain device needs its buffer allocated from that device to utilize
> all use cases.
>
> > This sounds similar to what you're proposing. Perhaps a reasonable
> > identifier is a device (major, minor) pair. Such a constraint could be
> > expressed as a symlink for easy visualization/discoverability from
> > userspace, but might be easier to serialize over the wire as the
> > (major, minor) pair. I'm not clear which direction is better to
> > express this either: As a link from heap->device, or device->heap.
> >
> >>>>     A constraint-based system would also, I think, be easier to exte=
nd
> >>>>     with additional constraints in the future.
> >>>>
> >>>> - I assume some drivers will be able to support multiple heaps. How =
do
> >>>>     you envision this being implemented ?
> >>>
> >>> I don't really see an use case for this.
> >
> > One use case I know of here is same-vendor GPU local memory on
> > different GPUs. NVIDIA GPUs have certain things they can only do on
> > local memory, certain things they can do on all memory, and certain
> > things they can only do on memory local to another NVIDIA GPU,
> > especially when there exists an NVLink interface between the two. So
> > they'd ideally express different constraints for heap representing
> > each of those.
>
> I strongly think that exposing this complexity is overkill. We have
> pretty much the same on AMD GPUs with XGMI, but this is so vendor
> specific that I'm pretty sure we shouldn't have that in a common framewor=
k.
>
> We should concentrate on solving the problem at hand and not trying to
> come up with something to complex to be implementable by everybody.
> Extensibility is the key here not getting everything handled in the
> initial code drop.
>
> >
> > The same thing is often true of memory on remote devices that are at
> > various points in a PCIe topology. We've had situations where we could
> > only get enough bandwidth between two PCIe devices when they were less
> > than some number of hops away on the PCI tree. We hard-coded logic to
> > detect that in our userspace drivers, but we could instead expose it
> > as a constraint on heaps that would express which devices can
> > accomplish certain operations as pairs.
> >
> > Similarly to the last one, I would assume (But haven't yet run into in
> > my personal experience) similar limitations arise when you have a NUMA
> > memory configuration, if you had a heap representing each NUMA node or
> > something, some might have more coherency than others, or might have
> > different bandwidth limitations that you could express through
> > something like device tree, etc. This is more speculative, but seems
> > like a generalization of the above two cases.
> >
> >>> We do have some drivers which say: for this use case you can use
> >>> whatever you want, but for that use case you need to use specific
> >>> memory
> >>> (scan out on GPUs for example works like this).
> >>>
> >>> But those specific use cases are exactly that, very specific. And
> >>> exposing all the constrains for them inside a kernel UAPI is a futile
> >>> effort (at least for the GPU scan out case). In those situations it's
> >>> just better to have the allocator in userspace deal with device
> >>> specific
> >>> stuff.
> >>
> >> While the exact constraints will certainly be device-specific, is that
> >> also true of the type of constraints, or the existence of constraints =
in
> >> the first place ? To give an example, with a video decoder producing
> >> frames that are then rendered by a GPU, the tiling format that would
> >> produce the best result is device-specific, but the fact that the
> >> decoder can produce a tiled format that would work better for the GPU,
> >> or a non-tiled format for other consumers, is a very common constraint=
.
> >> I don't think we'll be able to do away completely with the
> >> device-specific code in userspace, but I think we should be able to
> >> expose constraints in a generic-enough way that many simple use cases
> >> will be covered by generic code.
> >
> > Yes, agreed, the design we proposed took pains to allow
> > vendor-specific constraints via a general mechanism. We supported both
> > vendor-specific types of constraints, and vendor-specific values for
> > general constraints. Some code repository would act as the central
> > registry of constraint types, similar to the Linux kernel's
> > drm_fourcc.h for modifiers, or the Khronos github repository for
> > Vulkan vendor IDs. If the definition needs to be used by the kernel,
> > the kernel is the logical repository for that role IMHO.
> >
> > In our 2020 discussion, there was some debate over whether the kernel
> > should expose and/or consume constraints directly, or whether it's
> > sufficient to expose lower-level mechanisms from the kernel and keep
> > the translation of constraints to the correct mechanism in userspace.
> > There are pros/cons to both. I don't know that we bottomed out on that
> > part of the discussion, and it could be the right answer is some
> > combination of the two, as suggested below.
> >
> >>> What I want to do is to separate the problem. The kernel only provide=
s
> >>> the information where to allocate from, figuring out the details like
> >>> how many bytes, which format, plane layout etc.. is still the job of
> >>> userspace.
> >>
> >> Even with UVC, where to allocate memory from will depend on the use
> >> case. If the consumer is a device that doesn't support non-contiguous
> >> DMA, the system heap won't work.
> >>
> >> Actually, could you explain why UVC works better with the system heap =
?
> >> I'm looking at videobuf2 as an importer, and it doesn't call the dmabu=
f
> >> as far as I can tell, so cache management provided by the exporter see=
ms
> >> to be bypassed in any case.
> >>
> >>> What we do have is compatibility between heaps. E.g. a CMA heap is
> >>> usually compatible with the system heap or might even be a subset of
> >>> another CMA heap. But I wanted to add that as next step to the heaps
> >>> framework itself.
> >>>
> >>>> - Devices could have different constraints based on particular
> >>>>     configurations. For instance, a device may require specific memo=
ry
> >>>>     layout for multi-planar YUV formats only (as in allocating the
> >>>> Y and C
> >>>>     planes of NV12 from different memory banks). A dynamic API may
> >>>> thus be
> >>>>     needed (but may also be very painful to use from userspace).
> >>>
> >>> Uff, good to know. But I'm not sure how to expose stuff like that.
> >>
> >> Let's see if James has anything to share with us :-) With a bit of luc=
k
> >> we won't have to start from scratch.
> >
> > Well, this is the hard example we keep using as a measure of success
> > for whatever we come up with. I don't know that someone ever sat down
> > and tried to express this in the mechanism Simon and I proposed in
> > 2020, but allowing the expression of something that complex was
> > certainly our goal. How to resolve it down to an allocation mechanism,
> > I believe, was further than we got, but we weren't that well versed in
> > DMA heaps back then, or at least I wasn't.
> >
> >>>>> What's still missing is certainly matching userspace for this since=
 I
> >>>>> wanted to discuss the initial kernel approach first.
> >>>>
> >>>> https://git.libcamera.org/libcamera/libcamera.git/ would be a good
> >>>> place
> >>>> to prototype userspace support :-)
> >>>
> >>> Thanks for the pointer and the review,
> >>
> >> By the way, side question, does anyone know what the status of dma hea=
ps
> >> support is in major distributions ? On my Gentoo box,
> >> /dev/dma_heap/system is 0600 root:root. That's easy to change for a
> >> developer, but not friendly to end-users. If we want to move forward
> >> with dma heaps as standard multimedia allocators (and I would really
> >> like to see that happening), we have to make sure they can be used.
> >
> > We seem to have reached a world where display (primary nodes) are
> > carefully guarded, and some mildly trusted group of folks (video) can
> > access render nodes, but then there's some separate group generally
> > for camera/video/v4l and whatnot from what I've seen (I don't survey
> > this stuff that often. I live in my developer bubble). I'm curious
> > whether the right direction is a broader group that encompasses all of
> > render nodes, multimedia, and heaps, or if a more segmented design is
> > right. The latter is probably the better design from first principles,
> > but might lead to headaches if the permissions diverge.
>
> The main argument is that this memory is not properly accounted, but
> this also counts for things like memory file descriptors returned by
> memfd_create().
>
> I have proposed multiple times now that we extend the OOM handling to
> take memory allocated through file descriptors into account as well, but
> I can't find the time to fully upstream this.
>
> T.J. Mercier is working on some memcg based tracking which sounds like
> it might resolve this problem as well.
>
Gosh I hope so. How Android currently does this is with heavy use of
sepolicy to control access to the individual heaps, sometimes even at
a per-application/service level:

raven:/dev/dma_heap # ls -lZ
total 0
cr--r--r-- 1 system audio    u:object_r:dmabuf_heap_device:s0
      248,  15 2023-01-23 16:14 aaudio_capture_heap
cr--r--r-- 1 system audio    u:object_r:dmabuf_heap_device:s0
      248,  14 2023-01-23 16:14 aaudio_playback_heap
cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
      248,   3 2023-01-23 16:14 faceauth_tpu-secure
cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
      248,   4 2023-01-23 16:14 faimg-secure
cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
      248,   7 2023-01-23 16:14 famodel-secure
cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
      248,   6 2023-01-23 16:14 faprev-secure
cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
      248,   5 2023-01-23 16:14 farawimg-secure
cr--r--r-- 1 system graphics u:object_r:sensor_direct_heap_device:s0
      248,  13 2023-01-23 16:14 sensor_direct_heap
cr--r--r-- 1 system system   u:object_r:dmabuf_system_heap_device:s0
      248,   9 2023-01-23 16:14 system
cr--r--r-- 1 system system   u:object_r:dmabuf_system_heap_device:s0
      248,  10 2023-01-23 16:14 system-uncached
cr--r--r-- 1 system graphics u:object_r:dmabuf_heap_device:s0
      248,   8 2023-01-23 16:14 tui-secure
cr--r--r-- 1 system drmrpc
u:object_r:dmabuf_system_secure_heap_device:s0  248,   1 2023-01-23
16:14 vframe-secure
cr--r--r-- 1 system drmrpc   u:object_r:dmabuf_heap_device:s0
      248,  11 2023-01-23 16:14 video_system
cr--r--r-- 1 system drmrpc   u:object_r:dmabuf_heap_device:s0
      248,  12 2023-01-23 16:14 video_system-uncached
cr--r--r-- 1 system graphics u:object_r:vscaler_heap_device:s0
      248,   2 2023-01-23 16:14 vscaler-secure
cr--r--r-- 1 system drmrpc
u:object_r:dmabuf_system_secure_heap_device:s0  248,   0 2023-01-23
16:14 vstream-secure

I hope we can get to a point where we don't actually need to protect
anything but the unicorns. One of my earlier attempts involved a
counter for each heap that would allow you to limit each one
individually, but that's not what's proposed now.

> Regards,
> Christian.
>
>
> >
> > Thanks,
> > -James
> >
> >>>>> Please take a look and comment.
> >>>>>
> >>>>> Thanks,
> >>>>> Christian.
> >>>>>
> >>>>> [1]
> >>>>> https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gm=
ail.com/T/
> >>
> >
>
