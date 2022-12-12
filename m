Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06864981D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 04:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E9010E072;
	Mon, 12 Dec 2022 03:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542A410E072
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 03:01:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id m18so24606081eji.5
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 19:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b5xVESgi+u7TAbJ7EvkYkJx0xVOQrYRtZP7UZaMzw78=;
 b=HV98tz4LKEDxl6CV8zijJx0FyWQcxwgAP9lcJHvjYMp6JvGBIlyEdoE5wV2mgDyAq/
 MdPcAveOQV699dw6y0ccel1dN1PmA7V5I/NIOL8HulJq00gRBi98X9JnB+DiOXSJGjxR
 I61IcmGhdvS1yEGnXfUekbm2kCxaye3KOEMVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5xVESgi+u7TAbJ7EvkYkJx0xVOQrYRtZP7UZaMzw78=;
 b=6DRRZSG6sSFrulQYvPCw9A02Ke9967ouY2UFQ3BjLmg7mravkh5/dph6wNNXKFAoUJ
 bkperw02C1Ga3FQmeizmAmF+Fgbz5BViiuWpvb/OcdByuN/G0iKUygFw6rLE4nr75IaS
 Xr/TiLCz2r+J010826uIaKpDHIUQEvO424QpTvZoiZ/k2/N6urk5WwDb9mLDp6I4t0tM
 Wvrt0WjHS8fkFOvmkfAC70KmCncD76c08Tx+J0wDC24HQ+whRHN/H4VqOyrSGL5iItq4
 4d+MzfQYefvKKCn+oxIAiSZXHgT7MyUYp99ePn0Q2Ofs4DJ6NJS1Sqe+G4cKZ6wBgBWZ
 iewg==
X-Gm-Message-State: ANoB5pliNYwowyxXxJb+3aasU2QYzAox72QW3+kBysaw/PIeeRtIv32B
 ehYDGEmqvwMXBEUm0hJzCzhaOrqtu5qz8Prh
X-Google-Smtp-Source: AA0mqf6uRDA6Vm2e84jC7CGUsJIFOgucJjS/Zog7mkr6u0e5jcZgg5cwgb7lrDb5ynKetR2d+wcQUQ==
X-Received: by 2002:a17:907:a64a:b0:7c1:64dc:ac25 with SMTP id
 vu10-20020a170907a64a00b007c164dcac25mr3910414ejc.23.1670814070236; 
 Sun, 11 Dec 2022 19:01:10 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b007c081cf2d25sm2669353ejg.204.2022.12.11.19.01.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 19:01:09 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id m18so24605958eji.5
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 19:01:09 -0800 (PST)
X-Received: by 2002:a17:906:13d3:b0:7c1:297c:4c5c with SMTP id
 g19-20020a17090613d300b007c1297c4c5cmr3823122ejc.306.1670814068887; Sun, 11
 Dec 2022 19:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
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
 <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
 <a4f56b61-7609-5424-b04c-9462764ac73b@amd.com>
In-Reply-To: <a4f56b61-7609-5424-b04c-9462764ac73b@amd.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 12 Dec 2022 12:00:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ATVNQRdVUdiCqJP3kyT4ETP4pvdsSypt89KSEgsH-7Vg@mail.gmail.com>
Message-ID: <CAAFQd5ATVNQRdVUdiCqJP3kyT4ETP4pvdsSypt89KSEgsH-7Vg@mail.gmail.com>
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

On Fri, Dec 9, 2022 at 7:27 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 09.12.22 um 09:26 schrieb Tomasz Figa:
[snip]
> Yes, same what Daniel said as well. We need to provide some more hints
> which allocator to use from the kernel.
>
> >>>>>> So if a device driver uses cached system memory on an architecture=
 which
> >>>>>> devices which can't access it the right approach is clearly to rej=
ect
> >>>>>> the access.
> >>>>> I'd like to accent the fact that "requires cache maintenance" !=3D =
"can't access".
> >>>> Well that depends. As said above the exporter exports the buffer as =
it
> >>>> was allocated.
> >>>>
> >>>> If that means the the exporter provides a piece of memory which requ=
ires
> >>>> CPU cache snooping to access correctly then the best thing we can do=
 is
> >>>> to prevent an importer which can't do this from attaching.
> >>> Could you elaborate more about this case? Does it exist in practice?
> >>> Do I assume correctly that it's about sharing a buffer between one DM=
A
> >>> engine that is cache-coherent and another that is non-coherent, where
> >>> the first one ends up having its accesses always go through some kind
> >>> of a cache (CPU cache, L2/L3/... cache, etc.)?
> >> Yes, exactly that. What happens in this particular use case is that on=
e
> >> device driver wrote to it's internal buffer with the CPU (so some cach=
e
> >> lines where dirty) and then a device which couldn't deal with that tri=
ed
> >> to access it.
> > If so, shouldn't that driver surround its CPU accesses with
> > begin/end_cpu_access() in the first place?
>
> The problem is that the roles are reversed. The callbacks let the
> exporter knows that it needs to flush the caches when the importer is
> done accessing the buffer with the CPU.
>
> But here the exporter is the one accessing the buffer with the CPU and
> the importer then accesses stale data because it doesn't snoop the caches=
.
>
> What we could do is to force all exporters to use begin/end_cpu_access()
> even on it's own buffers and look at all the importers when the access
> is completed. But that would increase the complexity of the handling in
> the exporter.

I feel like they should be doing so anyway, because it often depends
on the SoC integration whether the DMA can do cache snooping or not.

Although arguably, there is a corner case today where if one uses
dma_alloc_coherent() to get a buffer with a coherent CPU mapping for
device X that is declared as cache-coherent, one also expects not to
need to call begin/end_cpu_access(), but those would be needed if the
buffer was to be imported by device Y that is not cache-coherent...

Sounds like after all it's a mess. I guess your patches make it one
step closer to something sensible, import would fail in such cases.
Although arguably we should be able to still export from driver Y and
import to driver X just fine if Y allocated the buffer as coherent -
otherwise we would break existing users for whom things worked fine.

>
> In other words we would then have code in the exporters which is only
> written for handling the constrains of the importers. This has a wide
> variety of consequences, especially that this functionality of the
> exporter can't be tested without a proper importer.
>
> I was also thinking about reversing the role of exporter and importer in
> the kernel, but came to the conclusion that doing this under the hood
> without userspace knowing about it is probably not going to work either.
>
> > The case that I was suggesting was of a hardware block that actually
> > sits behind the CPU cache and thus dirties it on writes, not the
> > driver doing that. (I haven't personally encountered such a system,
> > though.)
>
> Never heard of anything like that either, but who knows.
>
> >> We could say that all device drivers must always look at the coherency
> >> of the devices which want to access their buffers. But that would
> >> horrible complicate things for maintaining the drivers because then
> >> drivers would need to take into account requirements from other driver=
s
> >> while allocating their internal buffers.
> > I think it's partially why we have the allocation part of the DMA
> > mapping API, but currently it's only handling requirements of one
> > device. And we don't have any information from the userspace what
> > other devices the buffer would be used with...
>
> Exactly that, yes.
>
> > Actually, do we even have such information in the userspace today?
> > Let's say I do a video call in a web browser on a typical Linux
> > system. I have a V4L2 camera, VAAPI video encoder and X11 display. The
> > V4L2 camera fills in buffers with video frames and both encoder and
> > display consume them. Do we have a central place which would know that
> > a buffer needs to be allocated that works with the producer and all
> > consumers?
>
> Both X11 and Wayland have protocols which can be used to display a
> certain DMA-buf handle, their feedback packages contain information how
> ideal your configuration is, e.g. if the DMA-buf handle could be used or
> if an extra copy was needed etc...
>
> Similar exists between VAAPI and V4L2 as far as I know, but as you noted
> as well here it's indeed more about negotiating pixel format, stride,
> padding, alignment etc...
>
> The best we can do is to reject combinations which won't work in the
> kernel and then userspace could react accordingly.
>

The question is whether userspace is able to deal with it, given the
limited amount of information it gets from the kernel. Sure, there is
always the ultimate fallback of memcpy(), but in many cases that would
be totally unusable due to severe performance impact. If we were to
remove the existing extent of implicit handling from the kernel, I
think we need to first give the userspace the information necessary to
explicitly handle the fallback to the same extent.

We also need to think about backwards compatibility. Simply removing
the implicit fallback cases would probably break a lot of userspace,
so an opt-in behavior is likely needed initially...

> >> That's essentially the reason why we have DMA-buf heaps. Those heaps
> >> expose system memory buffers with certain properties (size, CMA, DMA b=
it
> >> restrictions etc...) and also implement the callback functions for CPU
> >> cache maintenance.
> >>
> > How do DMA-buf heaps change anything here? We already have CPU cache
> > maintenance callbacks in the DMA-buf API - the begin/end_cpu_access()
> > for CPU accesses and dmabuf_map/unmap_attachment() for device accesses
> > (which arguably shouldn't actually do CPU cache maintenance, unless
> > that's implied by how either of the involved DMA engines work).
>
> DMA-buf heaps are the neutral man in the middle.
>
> The implementation keeps track of all the attached importers and should
> make sure that the allocated memory fits the need of everyone.
> Additional to that calls to the cache DMA-api cache management functions
> are inserted whenever CPU access begins/ends.
>

I think in current design, it only knows all the importers after the
buffer is already allocated, so it doesn't necessarily have a way to
handle the allocation constraints. Something would have to be done to
get all the importers attached before the allocation actually takes
place.

> That's the best we can do for system memory sharing, only device
> specific memory can't be allocated like this.
>
> >>>> We do have the system and CMA dma-buf heap for cases where a device
> >>>> driver which wants to access the buffer with caches enabled. So this=
 is
> >>>> not a limitation in functionality, it's just a matter of correctly u=
sing it.
> >>>>
> >>> V4L2 also has the ability to allocate buffers and map them with cache=
s enabled.
> >> Yeah, when that's a requirement for the V4L2 device it also makes
> >> perfect sense.
> >>
> >> It's just that we shouldn't force any specific allocation behavior on =
a
> >> device driver because of the requirements of a different device.
> >>
> >> Giving an example a V4L2 device shouldn't be forced to use
> >> videobuf2-dma-contig because some other device needs CMA. Instead we
> >> should use the common DMA-buf heaps which implement this as neutral
> >> supplier of system memory buffers.
> > Agreed, but that's only possible if we have a central entity that
> > understands what devices the requested buffer would be used with. My
> > understanding is that we're nowhere close to that with mainstream
> > Linux today.
> >
> > // As a side note, videobuf2-dma-contig can actually allocate
> > discontiguous memory, if the device is behind an IOMMU. Actually with
> > the recent DMA API improvements, we could probably coalesce
> > vb2-dma-contig and vb2-dma-sg into one vb2-dma backend.
>
> That would probably make live a little bit simpler, yes.
>
> >>>> The problem is that in this particular case the exporter provides th=
e
> >>>> buffer as is, e.g. with dirty CPU caches. And the importer can't dea=
l
> >>>> with that.
> >>> Why does the exporter leave the buffer with dirty CPU caches?
> >> Because exporters always export the buffers as they would use it. And =
in
> >> this case that means writing with the CPU to it.
> >>
> > Sorry for the question not being very clear. I meant: How do the CPU
> > caches get dirty in that case?
>
> The exporter wrote to it. As far as I understand the exporter just
> copies things from A to B with memcpy to construct the buffer content.
>

Okay, so it's just due to CPU access and basically what we touched a
few paragraphs above.

> > [SNIP]
> >> Yes, totally agree. The problem is really that we moved bunch of MM an=
d
> >> DMA functions in one API.
> >>
> >> The bounce buffers are something we should really have in a separate
> >> component.
> >>
> >> Then the functionality of allocating system memory for a specific devi=
ce
> >> or devices should be something provided by the MM.
> >>
> >> And finally making this memory or any other CPU address accessible to =
a
> >> device (IOMMU programming etc..) should then be part of an DMA API.
> >>
> > Remember that actually making the memory accessible to a device often
> > needs to be handled already as a part of the allocation (e.g. dma_mask
> > in the non-IOMMU case). So I tend to think that the current division
> > of responsibilities is mostly fine - the dma_alloc family should be
> > seen as a part of MM already, especially with all the recent
> > improvements from Christoph, like dma_alloc_pages().
>
> Yes, that's indeed a very interesting development which as far as I can
> see goes into the right direction.
>
> > That said, it may indeed make sense to move things like IOMMU mapping
> > management out of the dma_alloc() and just reduce those functions to
> > simply returning a set of pages that satisfy the allocation
> > constraints. One would need to call dma_map() after the allocation,
> > but that's actually a fair expectation. Sometimes it might be
> > preferred to pre-allocate the memory, but only map it into the device
> > address space when it's really necessary.
>
> What I'm still missing is the functionality to allocate pages for
> multiple devices and proper error codes when dma_map() can't make the
> page accessible to a device.

Agreed. Although again, I think the more challenging part would be to
get the complete list of devices involved before the allocation
happens.

Best regards,
Tomasz

>
> Regards,
> Christian.
>
> >>>>>>> It's a use-case that is working fine today with many devices (e.g=
. network
> >>>>>>> adapters) in the ARM world, exactly because the architecture spec=
ific
> >>>>>>> implementation of the DMA API inserts the cache maintenance opera=
tions
> >>>>>>> on buffer ownership transfer.
> >>>>>> Yeah, I'm perfectly aware of that. The problem is that exactly tha=
t
> >>>>>> design totally breaks GPUs on Xen DOM0 for example.
> >>>>>>
> >>>>>> And Xen is just one example, I can certainly say from experience t=
hat
> >>>>>> this design was a really really bad idea because it favors just on=
e use
> >>>>>> case while making other use cases practically impossible if not re=
ally
> >>>>>> hard to implement.
> >>>>> Sorry, I haven't worked with Xen. Could you elaborate what's the
> >>>>> problem that this introduces for it?
> >>>> That's a bit longer topic. The AMD XEN devs are already working on t=
his
> >>>> as far as I know. I can ping internally how far they got with sendin=
g
> >>>> the patches out to avoid this problem.
> >>> Hmm, I see. It might be a good data point to understand in which
> >>> direction we should be going, but I guess we can wait until they send
> >>> some patches.
> >> There was just recently a longer thread on the amd-gfx mailing list
> >> about that. I think looking in there as well might be beneficial.
> > Okay, let me check. Thanks,
> >
> > Best regards,
> > Tomasz
>
