Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F472BA25C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 07:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBDC6E86C;
	Fri, 20 Nov 2020 06:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176706E86C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 06:32:59 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h23so8872816ljg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 22:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EvWUGbwSraVs6ukN8hay7tuFs9ZWzBKsGVI7NzOXAmE=;
 b=ErrXRL+3x25mRtwhh7zt139WVEQXpcWhIO+pkABzCPYCtB1/F1TJ5xO0cjBXts7Jdt
 AZ+Dn2dnBXZBX8QSLrJNkQ+UQhrCs4E4WSnb4SeOMl8jahB9WOuzHmO7evtDCfbedTNj
 3eRp6kiT4Xul7pn9Of4iZAKnUeuyk9zCcou1UXctmVqyrN2qqG5CKeoNuABy/VPZibVO
 p2EJqw1j95oJYmb0r5pxoMXF7yf7tbskVUvCQxIXa4WluMyCwtIkXqJNEHJOCvh1X1mr
 nDGJMyAZbo9DSS5ZTqG2wTkQQ5zeBUCXAClB7jHnDEcNOtYdLOYIz98eS92FFhGTd7E9
 y24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EvWUGbwSraVs6ukN8hay7tuFs9ZWzBKsGVI7NzOXAmE=;
 b=S2FAmodUNQ+7pwffg36MfI1M2QNMx48ekTpYHN+GS06GivQUjlOvViJRjemWffkMpC
 GNuNwLWlI+BJcyijeDeeH/evUWp8Si2RN630bNXLShsKz5/pkfKshTdZtJXRWIWdoyke
 Q+UnlHakRXI3vv9IYovl4bWtV+J4rdchZGCoKN2O5amvpcJRtQk6cb95bzKUyf0Bdmw2
 9p5knTtmOTTrN3ZgaEs0bUxE2860uc7lKQCFEve07KPypTJqYLoaWEuTMV13K7Qdqjyc
 9hgYahft/bKsUtwAHQ3FNjxj+KmeOS/wS/5O9hBbc+0NEOH4SpDmQCPCELRYrg2EqoWd
 lCAw==
X-Gm-Message-State: AOAM530R2pJiR4PAZFNhwhnmMGplXOjUm4zlcje8E9BPoPomiznDhYiA
 ydDGw07/4+UfnDLCi3pfYIGfEGaWdHXReE7GdTRsOA==
X-Google-Smtp-Source: ABdhPJxHVBQmsR367b+JT3t3jfLxQaNPSvI2MNIraG8WGvwdHUkM8AV5nQtc5uMcxOeIJlBYOGqONXCRu+VvEYVHl4s=
X-Received: by 2002:a2e:b059:: with SMTP id d25mr7732176ljl.304.1605853977149; 
 Thu, 19 Nov 2020 22:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20201110034934.70898-1-john.stultz@linaro.org>
 <CAO_48GHNE6AyKv4k=3=2EVjfSZsgz4pjuMJ1xJojbuFU9a90EQ@mail.gmail.com>
 <20201112093237.GS401619@phenom.ffwll.local>
 <CALAqxLWWBaOc3W1s3xBe-innHZ0pAon7UCfumjjQftPqf7bO0Q@mail.gmail.com>
 <20201113203933.GT401619@phenom.ffwll.local>
 <CALAqxLU886mjGaNx3cvXB0hyOd=tTo7G=tw6iQ1uAxcXShN+kg@mail.gmail.com>
 <CAKMK7uGew_sdw=NPrzuAQ_-5_kQnn-qvLHK9DGqSk=k22tQGDg@mail.gmail.com>
In-Reply-To: <CAKMK7uGew_sdw=NPrzuAQ_-5_kQnn-qvLHK9DGqSk=k22tQGDg@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 20 Nov 2020 12:02:45 +0530
Message-ID: <CAO_48GHLFJi+DKYf4fBs7NZr+f+Q0USoGEtL6nW_FQFv+OOJ5Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] dma-buf: Performance improvements for system heap
 & a system-uncached implementation
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Sandeep Patil <sspatil@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christian Koenig <christian.koenig@amd.com>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,


On Wed, 18 Nov 2020 at 13:16, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Nov 18, 2020 at 3:40 AM John Stultz <john.stultz@linaro.org> wrote:
> > On Fri, Nov 13, 2020 at 12:39 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Thu, Nov 12, 2020 at 08:11:02PM -0800, John Stultz wrote:
> > > > On Thu, Nov 12, 2020 at 1:32 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > On Thu, Nov 12, 2020 at 11:09:04AM +0530, Sumit Semwal wrote:
> > > > > > On Tue, 10 Nov 2020 at 09:19, John Stultz <john.stultz@linaro.org> wrote:
> > > > > > >
> > > > > > > Hey All,
> > > > > > >   So just wanted to send my last revision of my patch series
> > > > > > > of performance optimizations to the dma-buf system heap.
> > > > > >
> > > > > > Thanks very much for your patches - I think the first 5 patches look good to me.
> > > > > >
> > > > > > I know there was a bit of discussion over adding a new system-uncached
> > > > > > heap v/s using a flag to identify that; I think I prefer the separate
> > > > > > heap idea, but lets ask one last time if any one else has any real
> > > > > > objections to it.
> > > > > >
> > > > > > Daniel, Christian: any comments from your side on this?
> > > > >
> > > > > I do wonder a bit where the userspace stack for this all is, since tuning
> > > > > allocators without a full stack is fairly pointless. dma-buf heaps is a
> > > > > bit in a limbo situation here it feels like.
> > > >
> > > > As mentioned in the system-uncached patch:
> > > > Pending opensource users of this code include:
> > > > * AOSP HiKey960 gralloc:
> > > >   - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
> > > >   - Visibly improves performance over the system heap
> > > > * AOSP Codec2 (possibly, needs more review):
> > > >   - https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325
> > > >
> > > > Additionally both the HiKey, HiKey960 grallocs  and Codec2 are already
> > > > able to use the current dmabuf heaps instead of ION.
> > > >
> > > > So I'm not sure what you mean by limbo, other than it being in a
> > > > transition state where the interface is upstream and we're working on
> > > > moving vendors to it from ION (which is staged to be dropped in 5.11).
> > > > Part of that work is making sure we don't regress the performance
> > > > expectations.
> > >
> > > The mesa thing below, since if we test this with some downstream kernel
> > > drivers or at least non-mesa userspace I'm somewhat worried we're just
> > > creating a nice split world between the android gfx world and the
> > > mesa/linux desktop gfx world.
> > >
> > > But then that's kinda how android rolls, so *shrug*
> > >
> > > > > Plus I'm vary of anything related to leaking this kind of stuff beyond the
> > > > > dma-api because dma api maintainers don't like us doing that. But
> > > > > personally no concern on that front really, gpus need this. It's just that
> > > > > we do need solid justification I think if we land this. Hence back to
> > > > > first point.
> > > > >
> > > > > Ideally first point comes in the form of benchmarking on android together
> > > > > with a mesa driver (or mesa + some v4l driver or whatever it takes to
> > > > > actually show the benefits, I have no idea).
> > > >
> > > > Tying it with mesa is a little tough as the grallocs for mesa devices
> > > > usually use gbm (gralloc.gbm or gralloc.minigbm). Swapping the
> > > > allocation path for dmabuf heaps there gets a little complex as last I
> > > > tried that (when trying to get HiKey working with Lima graphics, as
> > > > gbm wouldn't allocate the contiguous buffers required by the display),
> > > > I ran into issues with the drm_hwcomposer and mesa expecting the gbm
> > > > private handle metadata in the buffer when it was passed in.
> > > >
> > > > But I might take a look at it again. I got a bit lost digging through
> > > > the mesa gbm allocation paths last time.
> > > >
> > > > I'll also try to see if I can find a benchmark for the codec2 code
> > > > (using dmabuf heaps with and without the uncached heap) on on db845c
> > > > (w/ mesa), as that is already working and I suspect that might be
> > > > close to what you're looking for.
> > >
> > > tbh I think trying to push for this long term is the best we can hope for.
> > >
> > > Media is also a lot more *meh* since it's deeply fragmented and a lot less
> > > of it upstream than on the gles/display side.
> > >
> > > I think confirming that this at least doesn't horrible blow up on a
> > > gralloc/gbm+mesa stack would be useful I think.
> >
> > Sorry, I'm still a little foggy on precisely what you're suggesting here.
> >
> > The patch stack I have has already been used with db845c (mesa +
> > gbm_grallloc), with the codec2 (sw decoders) using dmabuf heaps.
> > So no blowing up there. And I'm working with Hridya to find a
> > benchmark for codec2 so we can try to show the performance delta.
> >
> > However, if you're wanting a dma-buf gralloc implementation with mesa,
> > that may be a little tougher to do, but I guess I can give it a go.
> >
> > Hopefully this will address concerns about the system-uncached heap
> > patch (the last two patches in this series)?
> >
> > In the meantime I hope we can queue the first five patches, as it
> > would be nice to get the code rearranging in as there are others
> > trying to stage their own heaps, and I'd like to avoid dragging that
> > churn out for too long (in addition to improving the allocation
> > performance). Those changes have no ABI implications.
>
> Maybe I'm also misunderstanding what dma-buf heaps is used for in
> Android, at least usually. I thought it's used to allocate all the
> winsys/shared buffers through gralloc (at least in the blobby stacks),
> to handle the allocation constraints problem. In the open stacks we
> don't seem to have a platform with both mesa and v4l (or some other
> codec) with "interesting" allocations constraints, so no one using
> that gralloc+dma-buf heaps combo for what it was meant for. Hence why
> I'm a bit vary that we're creating something here which just misses
> the point a bit when we try to actually use it (in that glorious
> forever-future world where an android platform has enough drivers in
> upstream to do so).
>
> For other "this solves a system problem" we tend to be quite a bit
> more picky with the demonstration use case, to make sure we're
> actually creating something that solves the problem in reality.
>
> But it also looks like Android's just not there yet, so *shrug* ...

For me, looking at the first 5 patches (listed below, for quick
reference), they are only doing code reorganisation and minor updates
for already existing heaps, and no ABI change, I am not able to
clearly see your objection here. To me, these seem to be required
updates that the existing system heap users can benefit from.

dma-buf: system_heap: Rework system heap to use sgtables instead of
    pagelists
  dma-buf: heaps: Move heap-helper logic into the cma_heap
    implementation
  dma-buf: heaps: Remove heap-helpers code
  dma-buf: heaps: Skip sync if not mapped
  dma-buf: system_heap: Allocate higher order pages if available

If we talk about the last two patches - the ones that add system
uncached heap, I somewhat agree that we should be able to show the
performance gains with this approach (which has been in use on ION and
in devices) using dma-buf gralloc or similar.

We can discuss the system-uncached heap when the dma-buf gralloc or
similar demonstration for performance benefits is done, but I am
inclined to push these 5 patches listed above through.

Best,
Sumit.

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
