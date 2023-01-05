Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 422BB65EA36
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 12:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB7B10E6F2;
	Thu,  5 Jan 2023 11:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81DF10E6F2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 11:51:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id co23so35881001wrb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 03:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pilBQq/am+7Xn3SB+/G0ZuyGogoWHoP795sjsb50Au8=;
 b=bjhH6asBbg6lnY7PxuszTnGgx5B0SL4IZiPhChdDbL8JvIo8ffrQiyeBF8VFCsAdSq
 tmOLZSyFFeM7aTL8jZlIj5CWHtEKvSrmV1/5klGJw+CjvKhFu5zEYsXQ0V6LXMBMtLjE
 LCsWGq4TMeGA9F2CVklSJPH2TXUD7d359JLjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pilBQq/am+7Xn3SB+/G0ZuyGogoWHoP795sjsb50Au8=;
 b=kdx+10Bj3miYUPHkZL9It7PHbR6My45ymZaE0H9U0kU6j5/CCL/eLUzz6E+UFKy/rf
 CRzzvU6s7FHLpEGkEFHRMrvluQW9hTZLE+o2VSjLPcBdWZIVzrz0zSrAqav4dS7dClle
 O4Npgn//zrx9SQF0iwxWCteypnMfMPRXxlAvCzXvXravru6vmEegkhWMZVdejSd3efrp
 V9lbwdi0nfnKHICYlpqCGb+2tOEDvs/zHjfhc8B4rGR/47l2xYyCxqLPb8V5opejJNKm
 Y2IUnmM9YM67NODo2s9dcDgRCVfEChPNHY8JdGfGIuSxBd6wYQddzJCMJHC3MXQhSZA+
 9EcA==
X-Gm-Message-State: AFqh2koSBh5yqVJTAEMKvFoIoc7zSYlucq2zUKq3aIr7E9BPSaRYoebF
 PA67KoZoj9CN3pUNaDsLi4Me6g==
X-Google-Smtp-Source: AMrXdXuvFfy5jqGxRqZxKYswRSymhlK0Fmlp7Wu40Il2kJm2h+cI99njaLpAatwkF8tCMnVfzfXfeQ==
X-Received: by 2002:a05:6000:694:b0:26c:e7a9:97a9 with SMTP id
 bo20-20020a056000069400b0026ce7a997a9mr37972994wrb.60.1672919461236; 
 Thu, 05 Jan 2023 03:51:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h15-20020adfaa8f000000b002421888a011sm36866472wrc.69.2023.01.05.03.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:51:00 -0800 (PST)
Date: Thu, 5 Jan 2023 12:50:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Linaro-mm-sig] Re: Try to address the DMA-buf coherency problem
Message-ID: <Y7a5ojhH9Yf1LueC@phenom.ffwll.local>
References: <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
 <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com>
 <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
 <20221209113202.234b413a@eldfell>
 <CADnq5_N8MCvHJH8pzvDjmNo5U3WnJRk0Un3sFB+i=0cV_9TXAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_N8MCvHJH8pzvDjmNo5U3WnJRk0Un3sFB+i=0cV_9TXAg@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>, sumit.semwal@linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 09, 2022 at 12:07:49PM -0500, Alex Deucher wrote:
> On Fri, Dec 9, 2022 at 4:32 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Fri, 9 Dec 2022 17:26:06 +0900
> > Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > > On Mon, Dec 5, 2022 at 5:29 PM Christian König <christian.koenig@amd.com> wrote:
> > > >
> > > > Hi Tomasz,
> > > >
> > > > Am 05.12.22 um 07:41 schrieb Tomasz Figa:
> > > > > [SNIP]
> > > > >> In other words explicit ownership transfer is not something we would
> > > > >> want as requirement in the framework, cause otherwise we break tons of
> > > > >> use cases which require concurrent access to the underlying buffer.
> > > > >>
> > > > >> When a device driver needs explicit ownership transfer it's perfectly
> > > > >> possible to implement this using the dma_fence objects mentioned above.
> > > > >> E.g. drivers can already look at who is accessing a buffer currently and
> > > > >> can even grab explicit ownership of it by adding their own dma_fence
> > > > >> objects.
> > > > >>
> > > > >> The only exception is CPU based access, e.g. when something is written
> > > > >> with the CPU a cache flush might be necessary and when something is read
> > > > >> with the CPU a cache invalidation might be necessary.
> > > > >>
> > > > > Okay, that's much clearer now, thanks for clarifying this. So we
> > > > > should be covered for the cache maintenance needs originating from CPU
> > > > > accesses already, +/- the broken cases which don't call the begin/end
> > > > > CPU access routines that I mentioned above.
> > > > >
> > > > > Similarly, for any ownership transfer between different DMA engines,
> > > > > we should be covered either by the userspace explicitly flushing the
> > > > > hardware pipeline or attaching a DMA-buf fence to the buffer.
> > > > >
> > > > > But then, what's left to be solved? :) (Besides the cases of missing
> > > > > begin/end CPU access calls.)
> > > >
> > > > Well there are multiple problems here:
> > > >
> > > > 1. A lot of userspace applications/frameworks assume that it can
> > > > allocate the buffer anywhere and it just works.
> > > >
> > > > This isn't true at all, we have tons of cases where device can only
> > > > access their special memory for certain use cases.
> > > > Just look at scanout for displaying on dGPU, neither AMD nor NVidia
> > > > supports system memory here. Similar cases exists for audio/video codecs
> > > > where intermediate memory is only accessible by certain devices because
> > > > of content protection.
> > >
> > > Ack.
> > >
> > > Although I think the most common case on mainstream Linux today is
> > > properly allocating for device X (e.g. V4L2 video decoder or DRM-based
> > > GPU) and hoping that other devices would accept the buffers just fine,
> > > which isn't a given on most platforms (although often it's just about
> > > pixel format, width/height/stride alignment, tiling, etc. rather than
> > > the memory itself). That's why ChromiumOS has minigbm and Android has
> > > gralloc that act as the central point of knowledge on buffer
> > > allocation.
> >
> > Hi,
> >
> > as an anecdote, when I was improving Mutter's cross-DRM-device handling
> > (for DisplayLink uses) a few years ago, I implemented several different
> > approaches of where to allocate, to try until going for the slowest but
> > guaranteed to work case of copying every update into and out of sysram.
> >
> > It seems there are two different approaches in general for allocation
> > and sharing:
> >
> > 1. Try different things until it works or you run out of options
> >
> > pro:
> > - no need for a single software component to know everything about
> >   every device in the system
> >
> > con:
> > - who bothers with fallbacks, if the first try works on my system for
> >   my use case I test with? I.e. cost of code in users.
> > - trial-and-error can be very laborious (allocate, share with all
> >   devices, populate, test)
> > - the search space might be huge
> >
> 
> Even that is fraught with difficulty.  We had a ton of bug reports
> over the years claiming amdgpu was broken when users tried to use
> displaylink devices in combination with AMD dGPUs because the
> performance was so slow.  The problem was that rather than using
> dma-buf, the compositor was just mmaping the the dGPU BAR,  which
> happens to be uncached write combined and across the PCI bus, and
> copying the data to the displaylink device.  Read access to a PCI BAR
> with the CPU is on the order of 10s of MB per second.

Yeah you shouldn't readback dma-buf directly when you get them from a
gl/vk driver, but instead use the tools these apis provide for cpu access.

But that just puts us even more firmly into the "who even bothers"
territory because people just hack up something that happens to work on
their igpu (where at least on x86 you nowadays tend to get fully cpu
cached buffers).
-Daniel

> 
> Alex
> 
> >
> > 2. Have a central component that knows what to do
> >
> > pro:
> > - It might work on the first attempt, so no fallbacks in users.
> > - It might be optimal.
> >
> > con:
> > - You need a software component that knows everything about every
> >   single combination of hardware in existence, multiplied by use cases.
> >
> >
> > Neither seems good, which brings us back to https://github.com/cubanismo/allocator .
> >
> >
> > > > 2. We don't properly communicate allocation requirements to userspace.
> > > >
> > > > E.g. even if you allocate from DMA-Heaps userspace can currently only
> > > > guess if normal, CMA or even device specific memory is needed.
> > >
> > > DMA-buf heaps actually make it even more difficult for the userspace,
> > > because now it needs to pick the right heap. With allocation built
> > > into the specific UAPI (like V4L2), it's at least possible to allocate
> > > for one specific device without having any knowledge about allocation
> > > constraints in the userspace.
> > >
> > > >
> > > > 3. We seem to lack some essential parts of those restrictions in the
> > > > documentation.
> > > >
> > >
> > > Ack.
> > >
> > > > >>>> So if a device driver uses cached system memory on an architecture which
> > > > >>>> devices which can't access it the right approach is clearly to reject
> > > > >>>> the access.
> > > > >>> I'd like to accent the fact that "requires cache maintenance" != "can't access".
> > > > >> Well that depends. As said above the exporter exports the buffer as it
> > > > >> was allocated.
> > > > >>
> > > > >> If that means the the exporter provides a piece of memory which requires
> > > > >> CPU cache snooping to access correctly then the best thing we can do is
> > > > >> to prevent an importer which can't do this from attaching.
> > > > > Could you elaborate more about this case? Does it exist in practice?
> > > > > Do I assume correctly that it's about sharing a buffer between one DMA
> > > > > engine that is cache-coherent and another that is non-coherent, where
> > > > > the first one ends up having its accesses always go through some kind
> > > > > of a cache (CPU cache, L2/L3/... cache, etc.)?
> > > >
> > > > Yes, exactly that. What happens in this particular use case is that one
> > > > device driver wrote to it's internal buffer with the CPU (so some cache
> > > > lines where dirty) and then a device which couldn't deal with that tried
> > > > to access it.
> > >
> > > If so, shouldn't that driver surround its CPU accesses with
> > > begin/end_cpu_access() in the first place?
> > >
> > > The case that I was suggesting was of a hardware block that actually
> > > sits behind the CPU cache and thus dirties it on writes, not the
> > > driver doing that. (I haven't personally encountered such a system,
> > > though.)
> > >
> > > >
> > > > We could say that all device drivers must always look at the coherency
> > > > of the devices which want to access their buffers. But that would
> > > > horrible complicate things for maintaining the drivers because then
> > > > drivers would need to take into account requirements from other drivers
> > > > while allocating their internal buffers.
> > >
> > > I think it's partially why we have the allocation part of the DMA
> > > mapping API, but currently it's only handling requirements of one
> > > device. And we don't have any information from the userspace what
> > > other devices the buffer would be used with...
> > >
> > > Actually, do we even have such information in the userspace today?
> > > Let's say I do a video call in a web browser on a typical Linux
> > > system. I have a V4L2 camera, VAAPI video encoder and X11 display. The
> > > V4L2 camera fills in buffers with video frames and both encoder and
> > > display consume them. Do we have a central place which would know that
> > > a buffer needs to be allocated that works with the producer and all
> > > consumers?
> >
> > I have a vague belief that many, many years ago, in the early days of
> > dmabuf development, there was the idea of the sequence:
> > - create a dmabuf handle
> > - share the handle with all devices that would need access
> > - *then* do the allocation with kernel-internal negotiation to fill all
> >   devices' needs, if at all possible
> >
> > Obviously that didn't happen. I think today's dmabuf Wayland protocol
> > would support this though.
> >
> > Anyway, Wayland can tell the app which DRM devices a buffer
> > needs to work with as a GPU texture and potentially on same/another
> > DRM device as a KMS framebuffer, so theoretically the app could know.
> >
> >
> > Thanks,
> > pq
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
