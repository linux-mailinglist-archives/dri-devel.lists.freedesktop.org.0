Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53564230C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 07:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923EA10E0ED;
	Mon,  5 Dec 2022 06:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD1710E0ED
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 06:41:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id t17so30333eju.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Dec 2022 22:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cLvxndCeos8hyT4Bm6CFhchSLgt7+2e7WBuxPD+OxA=;
 b=kuj1OCNbrpTTiriRycS9fbCeaHgbunM+8i4MP9J7YQWz6kcULHxmyZbZ32JVIfPsCu
 wbPnEElYq5rSv5mOUAq02xxeKPYBGwc0/l/pPpCWLWaA5ynMMPJsHzOmPhGjSTu3IbnO
 gzjg9uz73US3OMMfv0cRQxmDCDRj3HlhHjPGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3cLvxndCeos8hyT4Bm6CFhchSLgt7+2e7WBuxPD+OxA=;
 b=HJDs9aWGWWPTKwJymBI4JkkEXVlv34OUu1DPRGXazBskt9roxm62cMynsiRpn7VC60
 LO7OZ650E639aovtJDFr9DincN9V+21IGveptaN5rdgFitdipWtY2ZjGURHQl/nHBj4T
 w3eENzACDuL/zhrOQLPPedRZrNjJ44nDi4ywJhOv8Oj5OHZhI/wMV4Nd/vZW1FkcBJOk
 89wFjhn0hvGm0bvJH20ISQu5tplB7scq3JC4r7MgW2jyjCmpzNjpbQdRflCBAYfbjBQ+
 SgqpIx9+Z476L5rUEtbxnZauBVTNFkRnHZ7w/WCXrHslg0N6XOuzDC2XN1Zrb71d0Mcr
 oqcw==
X-Gm-Message-State: ANoB5pm1mpviMMoQWpLXzBYjtIpP1MjFwKn5sttpSTbyznTgA8TW+iTM
 rBQ1IPTON35Xvrqw/gFrlbz14W0WKICtPJIS
X-Google-Smtp-Source: AA0mqf69CuDC3G14dAgFewAKmoBqoLYhhE9ziyctXgAo6+qsv7NqQVFlCHfhN+B8lbzTSlC2xbmMqA==
X-Received: by 2002:a17:906:49c4:b0:7c0:d23c:ead5 with SMTP id
 w4-20020a17090649c400b007c0d23cead5mr8300315ejv.606.1670222475711; 
 Sun, 04 Dec 2022 22:41:15 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 u2-20020a1709061da200b007b8a8fc6674sm5877737ejh.12.2022.12.04.22.41.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 22:41:14 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id c66so8096231edf.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Dec 2022 22:41:14 -0800 (PST)
X-Received: by 2002:a05:6402:289d:b0:46c:2460:cdf with SMTP id
 eg29-20020a056402289d00b0046c24600cdfmr11816634edb.103.1670222473654; Sun, 04
 Dec 2022 22:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
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
In-Reply-To: <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 5 Dec 2022 15:41:00 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
Message-ID: <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
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

Hi Christian,

On Thu, Nov 17, 2022 at 9:11 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi Tomasz,
>
> Am 17.11.22 um 10:35 schrieb Tomasz Figa:
> > Hi Christian and everyone,
> >
> > On Thu, Nov 3, 2022 at 4:14 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 02.11.22 um 18:10 schrieb Lucas Stach:
> >>> Am Mittwoch, dem 02.11.2022 um 13:21 +0100 schrieb Christian K=C3=B6n=
ig:
> >>> [SNIP]
> >>>> It would just be doing this for the importer and exactly that
> >>>> would be bad design because we then have handling for the display dr=
iver
> >>>> outside of the driver.
> >>>>
> >>> The driver would have to do those cache maintenance operations if it
> >>> directly worked with a non-coherent device. Doing it for the importer
> >>> is just doing it for another device, not the one directly managed by
> >>> the exporter.
> >>>
> >>> I really don't see the difference to the other dma-buf ops: in
> >>> dma_buf_map_attachment the exporter maps the dma-buf on behalf and in=
to
> >>> the address space of the importer. Why would cache maintenance be any
> >>> different?
> >> The issue here is the explicit ownership transfer.
> >>
> >> We intentionally decided against that because it breaks tons of use
> >> cases and is at least by me and a couple of others seen as generally
> >> design failure of the Linux DMA-API.
> > First of all, thanks for starting the discussion and sorry for being
> > late to the party. May I ask you to keep me on CC for any changes that
> > touch the V4L2 videobuf2 framework, as a maintainer of it? I'm okay
> > being copied on the entire series, no need to pick the specific
> > patches. Thanks in advance.
>
> Sorry for that, I've only added people involved in the previous
> discussion. Going to keep you in the loop.
>

No worries. Thanks.

Sorry, for being late with the reply, had a bit of vacation and then
some catching up last week.

> > I agree that we have some design issues in the current DMA-buf
> > framework, but I'd try to approach it a bit differently. Instead of
> > focusing on the issues in the current design, could we write down our
> > requirements and try to come up with how a correct design would look
> > like? (A lot of that has been already mentioned in this thread, but I
> > find it quite difficult to follow and it might not be a complete view
> > either.)
>
> Well, exactly that's what we disagree on.
>
> As far as I can see the current design of DMA-buf is perfectly capable
> of handling all the requirements.
>
> A brief summary of the requirements with some implementation notes:
>
> 1. Device drivers export their memory as it is. E.g. no special handling
> for importers on the exporter side.
>      If an importer can't deal with a specific format, layout, caching
> etc... of the data the correct approach is to reject the attachment.
>      Those parameters are controlled by userspace and negotiating them
> is explicitly not part of the framework.

Ack. I believe it matches the current implementation of the DMA-buf
framework, although as you mentioned, the swiotlb feature of the DMA
mapping framework kind of violates this.

>
> 2. Accesses of the CPU to a buffer are bracket int begin_cpu_access()
> and end_cpu_access() calls.
>      Here we can insert the CPU cache invalidation/flushes as necessary.

Ack. I think a part of the problem today is that there exist userspace
and kernel code instances that don't insert them and assume that some
magic keeps the cache clean...

>
> 3. Accesses of the device HW to a buffer are represented with dma_fence
> objects.
>      It's explicitly allowed to have multiple devices access the buffer
> at the same time.
>

Ack. Again there exists kernel code that doesn't honor or provide DMA
fences (e.g. V4L2).

> 4. Access to the DMA-buf by the HW of an importer is setup by the exporte=
r.
>      In other words the exporter provides a bunch of DMA addresses the
> importer should access.
>      The importer should not try to come up with those on its own.
>
> > That said, let me address a few aspects already mentioned, to make
> > sure that everyone is on the same page.
> >
> >> DMA-Buf let's the exporter setup the DMA addresses the importer uses t=
o
> >> be able to directly decided where a certain operation should go. E.g. =
we
> >> have cases where for example a P2P write doesn't even go to memory, bu=
t
> >> rather a doorbell BAR to trigger another operation. Throwing in CPU
> >> round trips for explicit ownership transfer completely breaks that con=
cept.
> > It sounds like we should have a dma_dev_is_coherent_with_dev() which
> > accepts two (or an array?) of devices and tells the caller whether the
> > devices need explicit ownership transfer.
>
> No, exactly that's the concept I'm pushing back on very hard here.
>
> In other words explicit ownership transfer is not something we would
> want as requirement in the framework, cause otherwise we break tons of
> use cases which require concurrent access to the underlying buffer.
>
> When a device driver needs explicit ownership transfer it's perfectly
> possible to implement this using the dma_fence objects mentioned above.
> E.g. drivers can already look at who is accessing a buffer currently and
> can even grab explicit ownership of it by adding their own dma_fence
> objects.
>
> The only exception is CPU based access, e.g. when something is written
> with the CPU a cache flush might be necessary and when something is read
> with the CPU a cache invalidation might be necessary.
>

Okay, that's much clearer now, thanks for clarifying this. So we
should be covered for the cache maintenance needs originating from CPU
accesses already, +/- the broken cases which don't call the begin/end
CPU access routines that I mentioned above.

Similarly, for any ownership transfer between different DMA engines,
we should be covered either by the userspace explicitly flushing the
hardware pipeline or attaching a DMA-buf fence to the buffer.

But then, what's left to be solved? :) (Besides the cases of missing
begin/end CPU access calls.)

> >> So if a device driver uses cached system memory on an architecture whi=
ch
> >> devices which can't access it the right approach is clearly to reject
> >> the access.
> > I'd like to accent the fact that "requires cache maintenance" !=3D "can=
't access".
>
> Well that depends. As said above the exporter exports the buffer as it
> was allocated.
>
> If that means the the exporter provides a piece of memory which requires
> CPU cache snooping to access correctly then the best thing we can do is
> to prevent an importer which can't do this from attaching.

Could you elaborate more about this case? Does it exist in practice?
Do I assume correctly that it's about sharing a buffer between one DMA
engine that is cache-coherent and another that is non-coherent, where
the first one ends up having its accesses always go through some kind
of a cache (CPU cache, L2/L3/... cache, etc.)?

>
> We do have the system and CMA dma-buf heap for cases where a device
> driver which wants to access the buffer with caches enabled. So this is
> not a limitation in functionality, it's just a matter of correctly using =
it.
>

V4L2 also has the ability to allocate buffers and map them with caches enab=
led.

> >> What we can do is to reverse the role of the exporter and importer and
> >> let the device which needs uncached memory take control. This way this
> >> device can insert operations as needed, e.g. flush read caches or
> >> invalidate write caches.
> >>
> > (Putting aside the cases when the access is really impossible at all.)
> > Correct me if I'm wrong, but isn't that because we don't have a proper
> > hook for the importer to tell the DMA-buf framework to prepare the
> > buffer for its access?
>
> No, we do have the explicit begin_cpu_access() and end_cpu_access()
> calls which are even exporter to userspace through IOCTLs for this.

Ack.

>
> The problem is that in this particular case the exporter provides the
> buffer as is, e.g. with dirty CPU caches. And the importer can't deal
> with that.

Why does the exporter leave the buffer with dirty CPU caches?

>
> Either reverting the roles of the importer or exporter or switching over
> to the common DMA-heaps implementation for the buffer would solve that.
>
> >> It's the job of the higher level to prepare the buffer a device work
> >> with, not the one of the lower level.
> > What are higher and lower levels here?
>
> The MM as higher level and the DMA mapping framework as lower level.
>

Hmm, I generally consider the DMA mapping framework a part of MM,
especially its allocation capabilities. It heavily relies on low level
MM primitives internally and exposes another set of low level
primitives that is more useful for device drivers. At least it should
be seen this way, but I agree that it currently includes things that
shouldn't necessarily be there, like the transparent bouncing.

> >
> > As per the existing design of the DMA mapping framework, the framework
> > handles the system DMA architecture details and DMA master drivers
> > take care of invoking the right DMA mapping operations around the DMA
> > accesses. This makes sense to me, as DMA master drivers have no idea
> > about the specific SoCs or buses they're plugged into, while the DMA
> > mapping framework has no idea when the DMA accesses are taking place.
>
> Yeah and exactly that's a bit problematic. In an ideal world device
> drivers wouldn't see memory they can't access in the first place.
>
> For example what we currently do is the following:
> 1. get_user_pages() grabs a reference to the pages we want to DMA to/from=
.
> 2. DMA mapping framework is called by the driver to create an sg-table.
> 3. The DMA mapping framework sees that this won't work and inserts
> bounce buffers.
> 4. The driver does the DMA to the bounce buffers instead.
> 5. The DMA mapping framework copies the data to the real location.
>
> This is highly problematic since it removes the control of what happens
> here. E.g. drivers can't prevent using bounce buffers when they need
> coherent access for DMA-buf for example.
>
> What we should have instead is that bounce buffers are applied at a
> higher level, for example by get_user_pages() or more general in the MM.
>

I tend to agree with you on this, but I see a lot of challenges that
would need to be solved if we want to make it otherwise. The whole
reason for transparent bouncing came from the fact that many existing
subsystems didn't really care about the needs of the underlying
hardware, e.g. block or network subsystems would just pass random
pages to the drivers. I think the idea of DMA mapping handling this
internally was to avoid implementing the bouncing here and there in
each block or network driver that needs it. (Arguably, an optional
helper could be provided instead for use in those subsystems...)

> >> In other words in a proper design the higher level would prepare the
> >> memory in a way the device driver can work with it, not the other way
> >> around.
> >>
> >> When a device driver gets memory it can't work with the correct respon=
se
> >> is to throw an error and bubble that up into a layer where it can be
> >> handled gracefully.
> >>
> >> For example instead of using bounce buffers under the hood the DMA lay=
er
> >> the MM should make sure that when you call read() with O_DIRECT that t=
he
> >> pages in question are accessible by the device.
> >>
> > I tend to agree with you if it's about a costly software "emulation"
> > like bounce buffers, but cache maintenance is a hardware feature
> > existing there by default and it's often much cheaper to operate on
> > cached memory and synchronize the caches rather than have everything
> > in uncached (or write-combined) memory.
>
> Well that we should have proper cache maintenance is really not the
> question. The question is where to do that?
>
> E.g. in the DMA-mapping framework which as far as I can see should only
> take care of translating addresses.

The DMA mapping framework is actually a DMA allocation and mapping
framework. Generic memory allocation primitives (like alloc_pages(),
kmalloc()) shouldn't be used for buffers that are expected to be
passed to DMA engines - there exist DMA-aware replacements, like
dma_alloc_pages(), dma_alloc_coherent(), dma_alloc_noncontiguous(),
etc.

>
> Or the higher level (get_user_pages() is just one example of that) which
> says ok device X wants to access memory Y I need to make sure that
> caches are flushed/invalidated.

Okay, so here comes the userptr case, which I really feel like is just
doomed at the very start, because it does nothing to accommodate
hardware needs at allocation time and then just expects some magic to
happen to make it possible for the hardware to make use of the buffer.

That said, it should be still possible to handle that pretty well for
hardware that allows it, i.e. without much memory access constraints.
What would be still missing if we just use the existing gup() +
dma_map() + dma_sync() sequence?

>
> >>> It's a use-case that is working fine today with many devices (e.g. ne=
twork
> >>> adapters) in the ARM world, exactly because the architecture specific
> >>> implementation of the DMA API inserts the cache maintenance operation=
s
> >>> on buffer ownership transfer.
> >> Yeah, I'm perfectly aware of that. The problem is that exactly that
> >> design totally breaks GPUs on Xen DOM0 for example.
> >>
> >> And Xen is just one example, I can certainly say from experience that
> >> this design was a really really bad idea because it favors just one us=
e
> >> case while making other use cases practically impossible if not really
> >> hard to implement.
> > Sorry, I haven't worked with Xen. Could you elaborate what's the
> > problem that this introduces for it?
>
> That's a bit longer topic. The AMD XEN devs are already working on this
> as far as I know. I can ping internally how far they got with sending
> the patches out to avoid this problem.

Hmm, I see. It might be a good data point to understand in which
direction we should be going, but I guess we can wait until they send
some patches.

Best regards,
Tomasz
