Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8064874D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 18:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AAF10E034;
	Fri,  9 Dec 2022 17:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67D010E034
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 17:08:02 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso434308fac.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 09:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxzFRiH8/a9wYiXRkKxdRnRUmch2IkKgIPltFud3IdQ=;
 b=Ibu1qGxEwS+SjdTi8KUt4U/m6FBO+N60nCCl3l8cNQ4TpicsprG6GggGvBRcs/WNFm
 7RO3CqZYbOcMPHmA0dJKAXjCfZcEYx8PLasp9cVAXHoNfTuMNc4HqeiK+dGoAgLA4HN4
 hh/O5u8eEqUVoC35Rg72BOFBS+/F/zpKiMjSEjUkKl/kR7xT/W+j5oEoWZUGlrniUv2Q
 OqWqXf/V03qljtNDsbosXX9e9cq4FNzOCWXfMrd7xOVqoLFIg4RdyoBNAvNXWuqKtJxB
 8sVetvy245cxh1T2Eu3DnvRqnhf/t6Q+MO19HCPCyzcaf3Ns2oXLRxMPfjMf5UpIeEYL
 KWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wxzFRiH8/a9wYiXRkKxdRnRUmch2IkKgIPltFud3IdQ=;
 b=0QPj2r328nn5PSEjzJ0f48u1j7RZs/qbTqTIVNxgH9yPjTGkwxK6mxzpna9F/R+iRL
 nbp8K9TKFaXzJmKQyk+xnO4tgv+Q1+tz/30fi3r8zvmqD4G7wQ5W7mgd0lebykuOCXGC
 9EWAdzfxwxOXtHwDmaaXgJpmoElHewKkITjrzpxyW8RbIOUC7p2CauSCn1CHgBaMfg1Y
 l5p3nfAGfeeZHhuQ1tUq5SGXXz4U3LCMVBAnbNuVoN4nS16pDBceXIgJjDIiOViWeVJw
 iLBV1/JPv3zXTz5OsPrkLd9mdiZsoJgkStsDd8EO5mvWVIUNmw6zc/n++UsS7w0s9NtM
 wttw==
X-Gm-Message-State: ANoB5pnD6SpxQe7sPJj9ViYJVO8g55PgLb6nLENZEz42mT118+NgOJ97
 4SxuIjfGr1YaAO0O+EpKPUt627F27l2MTYOVSfM=
X-Google-Smtp-Source: AA0mqf7Dn/4JzHH4YbsyRGqfTbPAjulCdXCuGNr6kUFk6BL59V3PkVo7vePm8a6xtBLHZIwj8VLqMtJAJGW1HBG2Eg8=
X-Received: by 2002:a05:6870:7a0c:b0:143:8a81:116c with SMTP id
 hf12-20020a0568707a0c00b001438a81116cmr30827312oab.96.1670605681896; Fri, 09
 Dec 2022 09:08:01 -0800 (PST)
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
 <20221209113202.234b413a@eldfell>
In-Reply-To: <20221209113202.234b413a@eldfell>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Dec 2022 12:07:49 -0500
Message-ID: <CADnq5_N8MCvHJH8pzvDjmNo5U3WnJRk0Un3sFB+i=0cV_9TXAg@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linaro-mm-sig@lists.linaro.org, Tomasz Figa <tfiga@chromium.org>,
 sumit.semwal@linaro.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 9, 2022 at 4:32 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri, 9 Dec 2022 17:26:06 +0900
> Tomasz Figa <tfiga@chromium.org> wrote:
>
> > On Mon, Dec 5, 2022 at 5:29 PM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > Am 05.12.22 um 07:41 schrieb Tomasz Figa:
> > > > [SNIP]
> > > >> In other words explicit ownership transfer is not something we wou=
ld
> > > >> want as requirement in the framework, cause otherwise we break ton=
s of
> > > >> use cases which require concurrent access to the underlying buffer=
.
> > > >>
> > > >> When a device driver needs explicit ownership transfer it's perfec=
tly
> > > >> possible to implement this using the dma_fence objects mentioned a=
bove.
> > > >> E.g. drivers can already look at who is accessing a buffer current=
ly and
> > > >> can even grab explicit ownership of it by adding their own dma_fen=
ce
> > > >> objects.
> > > >>
> > > >> The only exception is CPU based access, e.g. when something is wri=
tten
> > > >> with the CPU a cache flush might be necessary and when something i=
s read
> > > >> with the CPU a cache invalidation might be necessary.
> > > >>
> > > > Okay, that's much clearer now, thanks for clarifying this. So we
> > > > should be covered for the cache maintenance needs originating from =
CPU
> > > > accesses already, +/- the broken cases which don't call the begin/e=
nd
> > > > CPU access routines that I mentioned above.
> > > >
> > > > Similarly, for any ownership transfer between different DMA engines=
,
> > > > we should be covered either by the userspace explicitly flushing th=
e
> > > > hardware pipeline or attaching a DMA-buf fence to the buffer.
> > > >
> > > > But then, what's left to be solved? :) (Besides the cases of missin=
g
> > > > begin/end CPU access calls.)
> > >
> > > Well there are multiple problems here:
> > >
> > > 1. A lot of userspace applications/frameworks assume that it can
> > > allocate the buffer anywhere and it just works.
> > >
> > > This isn't true at all, we have tons of cases where device can only
> > > access their special memory for certain use cases.
> > > Just look at scanout for displaying on dGPU, neither AMD nor NVidia
> > > supports system memory here. Similar cases exists for audio/video cod=
ecs
> > > where intermediate memory is only accessible by certain devices becau=
se
> > > of content protection.
> >
> > Ack.
> >
> > Although I think the most common case on mainstream Linux today is
> > properly allocating for device X (e.g. V4L2 video decoder or DRM-based
> > GPU) and hoping that other devices would accept the buffers just fine,
> > which isn't a given on most platforms (although often it's just about
> > pixel format, width/height/stride alignment, tiling, etc. rather than
> > the memory itself). That's why ChromiumOS has minigbm and Android has
> > gralloc that act as the central point of knowledge on buffer
> > allocation.
>
> Hi,
>
> as an anecdote, when I was improving Mutter's cross-DRM-device handling
> (for DisplayLink uses) a few years ago, I implemented several different
> approaches of where to allocate, to try until going for the slowest but
> guaranteed to work case of copying every update into and out of sysram.
>
> It seems there are two different approaches in general for allocation
> and sharing:
>
> 1. Try different things until it works or you run out of options
>
> pro:
> - no need for a single software component to know everything about
>   every device in the system
>
> con:
> - who bothers with fallbacks, if the first try works on my system for
>   my use case I test with? I.e. cost of code in users.
> - trial-and-error can be very laborious (allocate, share with all
>   devices, populate, test)
> - the search space might be huge
>

Even that is fraught with difficulty.  We had a ton of bug reports
over the years claiming amdgpu was broken when users tried to use
displaylink devices in combination with AMD dGPUs because the
performance was so slow.  The problem was that rather than using
dma-buf, the compositor was just mmaping the the dGPU BAR,  which
happens to be uncached write combined and across the PCI bus, and
copying the data to the displaylink device.  Read access to a PCI BAR
with the CPU is on the order of 10s of MB per second.

Alex

>
> 2. Have a central component that knows what to do
>
> pro:
> - It might work on the first attempt, so no fallbacks in users.
> - It might be optimal.
>
> con:
> - You need a software component that knows everything about every
>   single combination of hardware in existence, multiplied by use cases.
>
>
> Neither seems good, which brings us back to https://github.com/cubanismo/=
allocator .
>
>
> > > 2. We don't properly communicate allocation requirements to userspace=
.
> > >
> > > E.g. even if you allocate from DMA-Heaps userspace can currently only
> > > guess if normal, CMA or even device specific memory is needed.
> >
> > DMA-buf heaps actually make it even more difficult for the userspace,
> > because now it needs to pick the right heap. With allocation built
> > into the specific UAPI (like V4L2), it's at least possible to allocate
> > for one specific device without having any knowledge about allocation
> > constraints in the userspace.
> >
> > >
> > > 3. We seem to lack some essential parts of those restrictions in the
> > > documentation.
> > >
> >
> > Ack.
> >
> > > >>>> So if a device driver uses cached system memory on an architectu=
re which
> > > >>>> devices which can't access it the right approach is clearly to r=
eject
> > > >>>> the access.
> > > >>> I'd like to accent the fact that "requires cache maintenance" !=
=3D "can't access".
> > > >> Well that depends. As said above the exporter exports the buffer a=
s it
> > > >> was allocated.
> > > >>
> > > >> If that means the the exporter provides a piece of memory which re=
quires
> > > >> CPU cache snooping to access correctly then the best thing we can =
do is
> > > >> to prevent an importer which can't do this from attaching.
> > > > Could you elaborate more about this case? Does it exist in practice=
?
> > > > Do I assume correctly that it's about sharing a buffer between one =
DMA
> > > > engine that is cache-coherent and another that is non-coherent, whe=
re
> > > > the first one ends up having its accesses always go through some ki=
nd
> > > > of a cache (CPU cache, L2/L3/... cache, etc.)?
> > >
> > > Yes, exactly that. What happens in this particular use case is that o=
ne
> > > device driver wrote to it's internal buffer with the CPU (so some cac=
he
> > > lines where dirty) and then a device which couldn't deal with that tr=
ied
> > > to access it.
> >
> > If so, shouldn't that driver surround its CPU accesses with
> > begin/end_cpu_access() in the first place?
> >
> > The case that I was suggesting was of a hardware block that actually
> > sits behind the CPU cache and thus dirties it on writes, not the
> > driver doing that. (I haven't personally encountered such a system,
> > though.)
> >
> > >
> > > We could say that all device drivers must always look at the coherenc=
y
> > > of the devices which want to access their buffers. But that would
> > > horrible complicate things for maintaining the drivers because then
> > > drivers would need to take into account requirements from other drive=
rs
> > > while allocating their internal buffers.
> >
> > I think it's partially why we have the allocation part of the DMA
> > mapping API, but currently it's only handling requirements of one
> > device. And we don't have any information from the userspace what
> > other devices the buffer would be used with...
> >
> > Actually, do we even have such information in the userspace today?
> > Let's say I do a video call in a web browser on a typical Linux
> > system. I have a V4L2 camera, VAAPI video encoder and X11 display. The
> > V4L2 camera fills in buffers with video frames and both encoder and
> > display consume them. Do we have a central place which would know that
> > a buffer needs to be allocated that works with the producer and all
> > consumers?
>
> I have a vague belief that many, many years ago, in the early days of
> dmabuf development, there was the idea of the sequence:
> - create a dmabuf handle
> - share the handle with all devices that would need access
> - *then* do the allocation with kernel-internal negotiation to fill all
>   devices' needs, if at all possible
>
> Obviously that didn't happen. I think today's dmabuf Wayland protocol
> would support this though.
>
> Anyway, Wayland can tell the app which DRM devices a buffer
> needs to work with as a GPU texture and potentially on same/another
> DRM device as a KMS framebuffer, so theoretically the app could know.
>
>
> Thanks,
> pq
