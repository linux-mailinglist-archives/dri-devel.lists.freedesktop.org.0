Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318A2647F35
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 09:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAC910E23E;
	Fri,  9 Dec 2022 08:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7EA10E23E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 08:26:23 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id l11so2142570edb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 00:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57Sj+uhR2FvC5sxbEqe8t1PzAICe2YPQ85fXVjZZi1E=;
 b=Crs0XFf46clvm81of3zwlmKT/pmGgKo1PSXaFGWhxewaXz4fnoV3+cHtroJNjpcd9W
 IbMMCkmlpXZiDeznUOelwjNNl2OnZcHfBjCHbf6UDzjA3en82pYpj78MbgFucK335nPI
 7fdznyhZ/iqB31vkI8GB4xG54AmIGXjXxrgww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=57Sj+uhR2FvC5sxbEqe8t1PzAICe2YPQ85fXVjZZi1E=;
 b=dEVz+rZAB/JVM7TCrHRYf9Kv3uKw3jMuFqELXhCfrLzB3kN2At/s+BEaWB8uDwpVtk
 NCqtG7YhMPczhdCKqln29W33e6HX2bQei7sUgBjXvajVG6+DNgeGwFI6AcoU5i1iGRR2
 6M2dYNiuA7eHTGphZaIYvsReckSZzrsM2KI46UIaZTz0BK6tqjcKNd9Xtoj61f+jJ11O
 anuV0pHNJ58itN3RLbxDYIV14w2wqYeTUC9k0wimmCXF3URL9zBkwVolEhwl6Nr0c0c2
 aYMxirtPwPlMPhuLywzv2uaUYOrfGYB1i/92jnuBZ6dZmq35EgPPSIdvFX24f8rFYapL
 lY6g==
X-Gm-Message-State: ANoB5pnzq9CzMKw59gLYHkjIw3xl7eTccBYV7Pdund2zzOORarTYoLiQ
 3VKjAG9Kv4FkArs/5ZrJWdtbUoHPr5PcgEd5
X-Google-Smtp-Source: AA0mqf5bR+7dWDEjQQvqbwbebKpF2sD0U1JH4p4rrMcNr/aBv6ttITr5GOq94Gkl95Z/v/wMn+4TYA==
X-Received: by 2002:a05:6402:e97:b0:461:6219:4b16 with SMTP id
 h23-20020a0564020e9700b0046162194b16mr3870412eda.33.1670574381528; 
 Fri, 09 Dec 2022 00:26:21 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 s19-20020a056402037300b0046c91fa5a4asm347645edw.70.2022.12.09.00.26.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 00:26:20 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id gh17so9790917ejb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 00:26:20 -0800 (PST)
X-Received: by 2002:a17:907:2a10:b0:7a7:9b01:2a6c with SMTP id
 fd16-20020a1709072a1000b007a79b012a6cmr80381988ejc.153.1670574379630; Fri, 09
 Dec 2022 00:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
 <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com>
In-Reply-To: <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 9 Dec 2022 17:26:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
Message-ID: <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 5, 2022 at 5:29 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Hi Tomasz,
>
> Am 05.12.22 um 07:41 schrieb Tomasz Figa:
> > [SNIP]
> >> In other words explicit ownership transfer is not something we would
> >> want as requirement in the framework, cause otherwise we break tons of
> >> use cases which require concurrent access to the underlying buffer.
> >>
> >> When a device driver needs explicit ownership transfer it's perfectly
> >> possible to implement this using the dma_fence objects mentioned above=
.
> >> E.g. drivers can already look at who is accessing a buffer currently a=
nd
> >> can even grab explicit ownership of it by adding their own dma_fence
> >> objects.
> >>
> >> The only exception is CPU based access, e.g. when something is written
> >> with the CPU a cache flush might be necessary and when something is re=
ad
> >> with the CPU a cache invalidation might be necessary.
> >>
> > Okay, that's much clearer now, thanks for clarifying this. So we
> > should be covered for the cache maintenance needs originating from CPU
> > accesses already, +/- the broken cases which don't call the begin/end
> > CPU access routines that I mentioned above.
> >
> > Similarly, for any ownership transfer between different DMA engines,
> > we should be covered either by the userspace explicitly flushing the
> > hardware pipeline or attaching a DMA-buf fence to the buffer.
> >
> > But then, what's left to be solved? :) (Besides the cases of missing
> > begin/end CPU access calls.)
>
> Well there are multiple problems here:
>
> 1. A lot of userspace applications/frameworks assume that it can
> allocate the buffer anywhere and it just works.
>
> This isn't true at all, we have tons of cases where device can only
> access their special memory for certain use cases.
> Just look at scanout for displaying on dGPU, neither AMD nor NVidia
> supports system memory here. Similar cases exists for audio/video codecs
> where intermediate memory is only accessible by certain devices because
> of content protection.

Ack.

Although I think the most common case on mainstream Linux today is
properly allocating for device X (e.g. V4L2 video decoder or DRM-based
GPU) and hoping that other devices would accept the buffers just fine,
which isn't a given on most platforms (although often it's just about
pixel format, width/height/stride alignment, tiling, etc. rather than
the memory itself). That's why ChromiumOS has minigbm and Android has
gralloc that act as the central point of knowledge on buffer
allocation.

>
> 2. We don't properly communicate allocation requirements to userspace.
>
> E.g. even if you allocate from DMA-Heaps userspace can currently only
> guess if normal, CMA or even device specific memory is needed.

DMA-buf heaps actually make it even more difficult for the userspace,
because now it needs to pick the right heap. With allocation built
into the specific UAPI (like V4L2), it's at least possible to allocate
for one specific device without having any knowledge about allocation
constraints in the userspace.

>
> 3. We seem to lack some essential parts of those restrictions in the
> documentation.
>

Ack.

> >>>> So if a device driver uses cached system memory on an architecture w=
hich
> >>>> devices which can't access it the right approach is clearly to rejec=
t
> >>>> the access.
> >>> I'd like to accent the fact that "requires cache maintenance" !=3D "c=
an't access".
> >> Well that depends. As said above the exporter exports the buffer as it
> >> was allocated.
> >>
> >> If that means the the exporter provides a piece of memory which requir=
es
> >> CPU cache snooping to access correctly then the best thing we can do i=
s
> >> to prevent an importer which can't do this from attaching.
> > Could you elaborate more about this case? Does it exist in practice?
> > Do I assume correctly that it's about sharing a buffer between one DMA
> > engine that is cache-coherent and another that is non-coherent, where
> > the first one ends up having its accesses always go through some kind
> > of a cache (CPU cache, L2/L3/... cache, etc.)?
>
> Yes, exactly that. What happens in this particular use case is that one
> device driver wrote to it's internal buffer with the CPU (so some cache
> lines where dirty) and then a device which couldn't deal with that tried
> to access it.

If so, shouldn't that driver surround its CPU accesses with
begin/end_cpu_access() in the first place?

The case that I was suggesting was of a hardware block that actually
sits behind the CPU cache and thus dirties it on writes, not the
driver doing that. (I haven't personally encountered such a system,
though.)

>
> We could say that all device drivers must always look at the coherency
> of the devices which want to access their buffers. But that would
> horrible complicate things for maintaining the drivers because then
> drivers would need to take into account requirements from other drivers
> while allocating their internal buffers.

I think it's partially why we have the allocation part of the DMA
mapping API, but currently it's only handling requirements of one
device. And we don't have any information from the userspace what
other devices the buffer would be used with...

Actually, do we even have such information in the userspace today?
Let's say I do a video call in a web browser on a typical Linux
system. I have a V4L2 camera, VAAPI video encoder and X11 display. The
V4L2 camera fills in buffers with video frames and both encoder and
display consume them. Do we have a central place which would know that
a buffer needs to be allocated that works with the producer and all
consumers?

>
> That's essentially the reason why we have DMA-buf heaps. Those heaps
> expose system memory buffers with certain properties (size, CMA, DMA bit
> restrictions etc...) and also implement the callback functions for CPU
> cache maintenance.
>

How do DMA-buf heaps change anything here? We already have CPU cache
maintenance callbacks in the DMA-buf API - the begin/end_cpu_access()
for CPU accesses and dmabuf_map/unmap_attachment() for device accesses
(which arguably shouldn't actually do CPU cache maintenance, unless
that's implied by how either of the involved DMA engines work).


> >> We do have the system and CMA dma-buf heap for cases where a device
> >> driver which wants to access the buffer with caches enabled. So this i=
s
> >> not a limitation in functionality, it's just a matter of correctly usi=
ng it.
> >>
> > V4L2 also has the ability to allocate buffers and map them with caches =
enabled.
>
> Yeah, when that's a requirement for the V4L2 device it also makes
> perfect sense.
>
> It's just that we shouldn't force any specific allocation behavior on a
> device driver because of the requirements of a different device.
>
> Giving an example a V4L2 device shouldn't be forced to use
> videobuf2-dma-contig because some other device needs CMA. Instead we
> should use the common DMA-buf heaps which implement this as neutral
> supplier of system memory buffers.

Agreed, but that's only possible if we have a central entity that
understands what devices the requested buffer would be used with. My
understanding is that we're nowhere close to that with mainstream
Linux today.

// As a side note, videobuf2-dma-contig can actually allocate
discontiguous memory, if the device is behind an IOMMU. Actually with
the recent DMA API improvements, we could probably coalesce
vb2-dma-contig and vb2-dma-sg into one vb2-dma backend.

>
> >> The problem is that in this particular case the exporter provides the
> >> buffer as is, e.g. with dirty CPU caches. And the importer can't deal
> >> with that.
> > Why does the exporter leave the buffer with dirty CPU caches?
>
> Because exporters always export the buffers as they would use it. And in
> this case that means writing with the CPU to it.
>

Sorry for the question not being very clear. I meant: How do the CPU
caches get dirty in that case?

> >> Either reverting the roles of the importer or exporter or switching ov=
er
> >> to the common DMA-heaps implementation for the buffer would solve that=
.
> >>
> >>>> It's the job of the higher level to prepare the buffer a device work
> >>>> with, not the one of the lower level.
> >>> What are higher and lower levels here?
> >> The MM as higher level and the DMA mapping framework as lower level.
> >>
> > Hmm, I generally consider the DMA mapping framework a part of MM,
> > especially its allocation capabilities. It heavily relies on low level
> > MM primitives internally and exposes another set of low level
> > primitives that is more useful for device drivers. At least it should
> > be seen this way, but I agree that it currently includes things that
> > shouldn't necessarily be there, like the transparent bouncing.
>
> Exactly that, yes! Good to hear that more people think that way.
>
> Christoph made some comments which sounded like he agreed to some of the
> points as well, but nobody ever said it so clearly.
>

An interesting anecdote would be a case where we had the dma_mask set
incorrectly for one of the devices, which ended up triggering the
implicit bouncing and hurting the performance a lot, despite all of
the functional testing passing just fine...

> >>> As per the existing design of the DMA mapping framework, the framewor=
k
> >>> handles the system DMA architecture details and DMA master drivers
> >>> take care of invoking the right DMA mapping operations around the DMA
> >>> accesses. This makes sense to me, as DMA master drivers have no idea
> >>> about the specific SoCs or buses they're plugged into, while the DMA
> >>> mapping framework has no idea when the DMA accesses are taking place.
> >> Yeah and exactly that's a bit problematic. In an ideal world device
> >> drivers wouldn't see memory they can't access in the first place.
> >>
> >> For example what we currently do is the following:
> >> 1. get_user_pages() grabs a reference to the pages we want to DMA to/f=
rom.
> >> 2. DMA mapping framework is called by the driver to create an sg-table=
.
> >> 3. The DMA mapping framework sees that this won't work and inserts
> >> bounce buffers.
> >> 4. The driver does the DMA to the bounce buffers instead.
> >> 5. The DMA mapping framework copies the data to the real location.
> >>
> >> This is highly problematic since it removes the control of what happen=
s
> >> here. E.g. drivers can't prevent using bounce buffers when they need
> >> coherent access for DMA-buf for example.
> >>
> >> What we should have instead is that bounce buffers are applied at a
> >> higher level, for example by get_user_pages() or more general in the M=
M.
> >>
> > I tend to agree with you on this, but I see a lot of challenges that
> > would need to be solved if we want to make it otherwise. The whole
> > reason for transparent bouncing came from the fact that many existing
> > subsystems didn't really care about the needs of the underlying
> > hardware, e.g. block or network subsystems would just pass random
> > pages to the drivers. I think the idea of DMA mapping handling this
> > internally was to avoid implementing the bouncing here and there in
> > each block or network driver that needs it. (Arguably, an optional
> > helper could be provided instead for use in those subsystems...)
>
> Yes, totally agree. The problem is really that we moved bunch of MM and
> DMA functions in one API.
>
> The bounce buffers are something we should really have in a separate
> component.
>
> Then the functionality of allocating system memory for a specific device
> or devices should be something provided by the MM.
>
> And finally making this memory or any other CPU address accessible to a
> device (IOMMU programming etc..) should then be part of an DMA API.
>

Remember that actually making the memory accessible to a device often
needs to be handled already as a part of the allocation (e.g. dma_mask
in the non-IOMMU case). So I tend to think that the current division
of responsibilities is mostly fine - the dma_alloc family should be
seen as a part of MM already, especially with all the recent
improvements from Christoph, like dma_alloc_pages().

That said, it may indeed make sense to move things like IOMMU mapping
management out of the dma_alloc() and just reduce those functions to
simply returning a set of pages that satisfy the allocation
constraints. One would need to call dma_map() after the allocation,
but that's actually a fair expectation. Sometimes it might be
preferred to pre-allocate the memory, but only map it into the device
address space when it's really necessary.

> >>>> In other words in a proper design the higher level would prepare the
> >>>> memory in a way the device driver can work with it, not the other wa=
y
> >>>> around.
> >>>>
> >>>> When a device driver gets memory it can't work with the correct resp=
onse
> >>>> is to throw an error and bubble that up into a layer where it can be
> >>>> handled gracefully.
> >>>>
> >>>> For example instead of using bounce buffers under the hood the DMA l=
ayer
> >>>> the MM should make sure that when you call read() with O_DIRECT that=
 the
> >>>> pages in question are accessible by the device.
> >>>>
> >>> I tend to agree with you if it's about a costly software "emulation"
> >>> like bounce buffers, but cache maintenance is a hardware feature
> >>> existing there by default and it's often much cheaper to operate on
> >>> cached memory and synchronize the caches rather than have everything
> >>> in uncached (or write-combined) memory.
> >> Well that we should have proper cache maintenance is really not the
> >> question. The question is where to do that?
> >>
> >> E.g. in the DMA-mapping framework which as far as I can see should onl=
y
> >> take care of translating addresses.
> > The DMA mapping framework is actually a DMA allocation and mapping
> > framework. Generic memory allocation primitives (like alloc_pages(),
> > kmalloc()) shouldn't be used for buffers that are expected to be
> > passed to DMA engines - there exist DMA-aware replacements, like
> > dma_alloc_pages(), dma_alloc_coherent(), dma_alloc_noncontiguous(),
> > etc.
> >
> >> Or the higher level (get_user_pages() is just one example of that) whi=
ch
> >> says ok device X wants to access memory Y I need to make sure that
> >> caches are flushed/invalidated.
> > Okay, so here comes the userptr case, which I really feel like is just
> > doomed at the very start, because it does nothing to accommodate
> > hardware needs at allocation time and then just expects some magic to
> > happen to make it possible for the hardware to make use of the buffer.
> >
> > That said, it should be still possible to handle that pretty well for
> > hardware that allows it, i.e. without much memory access constraints.
> > What would be still missing if we just use the existing gup() +
> > dma_map() + dma_sync() sequence?
>
> Error or rather fallback handling and *not* transparently inserting
> bounce buffers.
>
> The whole implicit bounce buffers concept falls apart as soon as you
> don't have a stream access any more.
>

I see. So I think we agree on that. :)

> >>>>> It's a use-case that is working fine today with many devices (e.g. =
network
> >>>>> adapters) in the ARM world, exactly because the architecture specif=
ic
> >>>>> implementation of the DMA API inserts the cache maintenance operati=
ons
> >>>>> on buffer ownership transfer.
> >>>> Yeah, I'm perfectly aware of that. The problem is that exactly that
> >>>> design totally breaks GPUs on Xen DOM0 for example.
> >>>>
> >>>> And Xen is just one example, I can certainly say from experience tha=
t
> >>>> this design was a really really bad idea because it favors just one =
use
> >>>> case while making other use cases practically impossible if not real=
ly
> >>>> hard to implement.
> >>> Sorry, I haven't worked with Xen. Could you elaborate what's the
> >>> problem that this introduces for it?
> >> That's a bit longer topic. The AMD XEN devs are already working on thi=
s
> >> as far as I know. I can ping internally how far they got with sending
> >> the patches out to avoid this problem.
> > Hmm, I see. It might be a good data point to understand in which
> > direction we should be going, but I guess we can wait until they send
> > some patches.
>
> There was just recently a longer thread on the amd-gfx mailing list
> about that. I think looking in there as well might be beneficial.

Okay, let me check. Thanks,

Best regards,
Tomasz
