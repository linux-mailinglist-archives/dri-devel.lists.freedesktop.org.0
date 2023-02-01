Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C5686153
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 09:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548EB10E398;
	Wed,  1 Feb 2023 08:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C041610E37C;
 Wed,  1 Feb 2023 08:10:38 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gr7so24344450ejb.5;
 Wed, 01 Feb 2023 00:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sAw/2Lb4WEMKODNRpea0RgUuW7spEUL/UcL2ikpdsPM=;
 b=hypU2ywqUPnhOFmO53k3vWMtaI3TZk9w/pAiV2phxid8BLcmhkZuK41q9GCZhvKV4U
 4FAOXwwT1jJ8UXX7p9DBkJ6FiBkXRkRgMRGUVbmqizXWe1WW/yJxWJG49X3dwnUb3y6g
 oDsp1vtU4rMVLRJV+Cg2QfEpBiQeivDtiRBzQA0L6Ks/OAa8NjlK4BUv1jQ8DEtELsDk
 tlnIDtN+/JKx1I1e3XEblB03aMsxjz6GYdutVfrTzF5am6rYxqnU1LA/lA7yj0QVQqu+
 YjP65yHGatxQtbF3C7VAGtHlIK+cJk9MwDVHTDLDYMYnUtrlbzTBJagHwxfnhSJwUNjH
 CE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sAw/2Lb4WEMKODNRpea0RgUuW7spEUL/UcL2ikpdsPM=;
 b=12t84DMyi5ZwkBkK+T+jHod/k4BjTvHjf8sw/c82XeeofjaPPr+A4/TTtiLBiYe/is
 Z2oZ8GfRIuPejP6DYGytSw1w51fVuy04jLds+QU6yQD64wUndn+Tpk6Q03yO6w/R68YM
 ntw3bRL89kpgwRwcCy2NS4MnHdH0oH1GtZI/k89MEK4ase7UxOQz+PnPOktppzlsGEhc
 HxZJpptUD425EGMzxOXWPYh0egjV5ZuhdVI20YwMaxRCftNJonuZQphUEBiXy0n1t1jA
 0UohMc9Ud3pxAzrZfYSr4voEH7GFZTi/08j4EaYZBXD9sHKjy9dkQD/7+9yONzNeeC1z
 zmJA==
X-Gm-Message-State: AO0yUKVSYq2dgb5Q/3jmnO96PVFs+9/NGV7lpD+FAN62LaLBAV3/5BxR
 FDyKfcIdbGdQzA1k4Ac7khewr8MF2rl4jg6Vmm0=
X-Google-Smtp-Source: AK7set+9h23A/qVuAHRJqdAxWAXuK7e3mK/l4CvEdFLsZLVp6YEZc8fcyuPeZ7PdWPEF2EwqPFPsM2fTVnMzSM05ZfA=
X-Received: by 2002:a17:906:2c53:b0:83d:2544:a11 with SMTP id
 f19-20020a1709062c5300b0083d25440a11mr387344ejh.226.1675239037037; Wed, 01
 Feb 2023 00:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
In-Reply-To: <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 Feb 2023 18:10:24 +1000
Message-ID: <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, airlied@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Jan 2023 at 23:02, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 29.01.23 um 19:46 schrieb Danilo Krummrich:
> > On 1/27/23 22:09, Danilo Krummrich wrote:
> >> On 1/27/23 16:17, Christian K=C3=B6nig wrote:
> >>> Am 27.01.23 um 15:44 schrieb Danilo Krummrich:
> >>>> [SNIP]
> >>>>>>>
> >>>>>>> What you want is one component for tracking the VA allocations
> >>>>>>> (drm_mm based) and a different component/interface for tracking
> >>>>>>> the VA mappings (probably rb tree based).
> >>>>>>
> >>>>>> That's what the GPUVA manager is doing. There are gpuva_regions
> >>>>>> which correspond to VA allocations and gpuvas which represent the
> >>>>>> mappings. Both are tracked separately (currently both with a
> >>>>>> separate drm_mm, though). However, the GPUVA manager needs to
> >>>>>> take regions into account when dealing with mappings to make sure
> >>>>>> the GPUVA manager doesn't propose drivers to merge over region
> >>>>>> boundaries. Speaking from userspace PoV, the kernel wouldn't
> >>>>>> merge mappings from different VKBuffer objects even if they're
> >>>>>> virtually and physically contiguous.
> >>>>>
> >>>>> That are two completely different things and shouldn't be handled
> >>>>> in a single component.
> >>>>
> >>>> They are different things, but they're related in a way that for
> >>>> handling the mappings (in particular merging and sparse) the GPUVA
> >>>> manager needs to know the VA allocation (or region) boundaries.
> >>>>
> >>>> I have the feeling there might be a misunderstanding. Userspace is
> >>>> in charge to actually allocate a portion of VA space and manage it.
> >>>> The GPUVA manager just needs to know about those VA space
> >>>> allocations and hence keeps track of them.
> >>>>
> >>>> The GPUVA manager is not meant to be an allocator in the sense of
> >>>> finding and providing a hole for a given request.
> >>>>
> >>>> Maybe the non-ideal choice of using drm_mm was implying something
> >>>> else.
> >>>
> >>> Uff, well long story short that doesn't even remotely match the
> >>> requirements. This way the GPUVA manager won't be usable for a whole
> >>> bunch of use cases.
> >>>
> >>> What we have are mappings which say X needs to point to Y with this
> >>> and hw dependent flags.
> >>>
> >>> The whole idea of having ranges is not going to fly. Neither with
> >>> AMD GPUs and I strongly think not with Intels XA either.
> >>
> >> A range in the sense of the GPUVA manager simply represents a VA
> >> space allocation (which in case of Nouveau is taken in userspace).
> >> Userspace allocates the portion of VA space and lets the kernel know
> >> about it. The current implementation needs that for the named
> >> reasons. So, I think there is no reason why this would work with one
> >> GPU, but not with another. It's just part of the design choice of the
> >> manager.
> >>
> >> And I'm absolutely happy to discuss the details of the manager
> >> implementation though.
> >>
> >>>
> >>>>> We should probably talk about the design of the GPUVA manager once
> >>>>> more when this should be applicable to all GPU drivers.
> >>>>
> >>>> That's what I try to figure out with this RFC, how to make it
> >>>> appicable for all GPU drivers, so I'm happy to discuss this. :-)
> >>>
> >>> Yeah, that was really good idea :) That proposal here is really far
> >>> away from the actual requirements.
> >>>
> >>
> >> And those are the ones I'm looking for. Do you mind sharing the
> >> requirements for amdgpu in particular?
> >>
> >>>>>> For sparse residency the kernel also needs to know the region
> >>>>>> boundaries to make sure that it keeps sparse mappings around.
> >>>>>
> >>>>> What?
> >>>>
> >>>> When userspace creates a new VKBuffer with the
> >>>> VK_BUFFER_CREATE_SPARSE_BINDING_BIT the kernel may need to create
> >>>> sparse mappings in order to ensure that using this buffer without
> >>>> any memory backed mappings doesn't fault the GPU.
> >>>>
> >>>> Currently, the implementation does this the following way:
> >>>>
> >>>> 1. Userspace creates a new VKBuffer and hence allocates a portion
> >>>> of the VA space for it. It calls into the kernel indicating the new
> >>>> VA space region and the fact that the region is sparse.
> >>>>
> >>>> 2. The kernel picks up the region and stores it in the GPUVA
> >>>> manager, the driver creates the corresponding sparse mappings /
> >>>> page table entries.
> >>>>
> >>>> 3. Userspace might ask the driver to create a couple of memory
> >>>> backed mappings for this particular VA region. The GPUVA manager
> >>>> stores the mapping parameters, the driver creates the corresponding
> >>>> page table entries.
> >>>>
> >>>> 4. Userspace might ask to unmap all the memory backed mappings from
> >>>> this particular VA region. The GPUVA manager removes the mapping
> >>>> parameters, the driver cleans up the corresponding page table
> >>>> entries. However, the driver also needs to re-create the sparse
> >>>> mappings, since it's a sparse buffer, hence it needs to know the
> >>>> boundaries of the region it needs to create the sparse mappings in.
> >>>
> >>> Again, this is not how things are working. First of all the kernel
> >>> absolutely should *NOT* know about those regions.
> >>>
> >>> What we have inside the kernel is the information what happens if an
> >>> address X is accessed. On AMD HW this can be:
> >>>
> >>> 1. Route to the PCIe bus because the mapped BO is stored in system
> >>> memory.
> >>> 2. Route to the internal MC because the mapped BO is stored in local
> >>> memory.
> >>> 3. Route to other GPUs in the same hive.
> >>> 4. Route to some doorbell to kick of other work.
> >>> ...
> >>> x. Ignore write, return 0 on reads (this is what is used for sparse
> >>> mappings).
> >>> x+1. Trigger a recoverable page fault. This is used for things like
> >>> SVA.
> >>> x+2. Trigger a non-recoverable page fault. This is used for things
> >>> like unmapped regions where access is illegal.
> >>>
> >>> All this is plus some hw specific caching flags.
> >>>
> >>> When Vulkan allocates a sparse VKBuffer what should happen is the
> >>> following:
> >>>
> >>> 1. The Vulkan driver somehow figures out a VA region A..B for the
> >>> buffer. This can be in userspace (libdrm_amdgpu) or kernel (drm_mm),
> >>> but essentially is currently driver specific.
> >>
> >> Right, for Nouveau we have this in userspace as well.
> >>
> >>>
> >>> 2. The kernel gets a request to map the VA range A..B as sparse,
> >>> meaning that it updates the page tables from A..B with the sparse
> >>> setting.
> >>>
> >>> 3. User space asks kernel to map a couple of memory backings at
> >>> location A+1, A+10, A+15 etc....
> >>>
> >>> 4. The VKBuffer is de-allocated, userspace asks kernel to update
> >>> region A..B to not map anything (usually triggers a non-recoverable
> >>> fault).
> >>
> >> Until here this seems to be identical to what I'm doing.
> >>
> >> It'd be interesting to know how amdgpu handles everything that
> >> potentially happens between your 3) and 4). More specifically, how
> >> are the page tables changed when memory backed mappings are mapped on
> >> a sparse range? What happens when the memory backed mappings are
> >> unmapped, but the VKBuffer isn't de-allocated, and hence sparse
> >> mappings need to be re-deployed?
> >>
> >> Let's assume the sparse VKBuffer (and hence the VA space allocation)
> >> is pretty large. In Nouveau the corresponding PTEs would have a
> >> rather huge page size to cover this. Now, if small memory backed
> >> mappings are mapped to this huge sparse buffer, in Nouveau we'd
> >> allocate a new PT with a corresponding smaller page size overlaying
> >> the sparse mappings PTEs.
> >>
> >> How would this look like in amdgpu?
> >>
> >>>
> >>> When you want to unify this between hw drivers I strongly suggest to
> >>> completely start from scratch once more.
> >>>
> >
> > I just took some time digging into amdgpu and, surprisingly, aside
> > from the gpuva_regions it seems like amdgpu basically does exactly the
> > same as I do in the GPU VA manager. As explained, those region
> > boundaries are needed for merging only and, depending on the driver,
> > might be useful for sparse mappings.
> >
> > For drivers that don't intend to merge at all and (somehow) are
> > capable of dealing with sparse regions without knowing the sparse
> > region's boundaries, it'd be easy to make those gpuva_regions optional.
>
> Yeah, but this then defeats the approach of having the same hw
> independent interface/implementation for all drivers.

I think you are running a few steps ahead here. The plan isn't to have
an independent interface, it's to provide a set of routines and
tracking that will be consistent across drivers, so that all drivers
once using them will operate in mostly the same fashion with respect
to GPU VA tracking and VA/BO lifetimes. Already in the tree we have
amdgpu and freedreno which I think end up operating slightly different
around lifetimes. I'd like to save future driver writers the effort of
dealing with those decisions and this should drive their user api
design so to enable vulkan sparse bindings.

Now if merging is a feature that makes sense to one driver maybe it
makes sense to all, however there may be reasons amdgpu gets away
without merging that other drivers might not benefit from, there might
also be a benefit to amdgpu from merging that you haven't looked at
yet, so I think we could leave merging as an optional extra driver
knob here. The userspace API should operate the same, it would just be
the gpu pagetables that would end up different sizes.

Dave.
