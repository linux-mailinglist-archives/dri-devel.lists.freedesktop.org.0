Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F64D3B2DC0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 13:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B536EAC0;
	Thu, 24 Jun 2021 11:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446586EAC2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 11:23:12 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 s20-20020a4ae9940000b02902072d5df239so1527417ood.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N+fO1NsT3+/4WEZxEBub8Q8BkuWwxoPBEqlhTKIIJ8I=;
 b=LErNrksWX0Hro3gbvdvl4cVQOtiy4YZm09Vx9j9lXlVrSvgcAvUjT6iPRyvEgdMQ44
 sBbgi+egQRnw/DzL0cvqnxItRW5i32edhtifHYwpuq2Zdeehd29+5q3mginxbdl8lhSc
 RrJGulitXJjVyxyKf2cVmEmpjO7lAVmsZUhCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N+fO1NsT3+/4WEZxEBub8Q8BkuWwxoPBEqlhTKIIJ8I=;
 b=UM4TRQ9vjms7CJwQSQF51skH97gQJ+2VQWaG7LchRgradaCngXuaWe0wfPkprZN8uT
 AYHOWW91cOtbpwP3XHNOxlJQ72kKXnhgSZova95mOaAdlrYpbHaLQkJ5TGqOaqELTcfo
 xYRA/jG0rKOyf8OP6bPK6cRAuSd6RQ8k2KEoo0pdwOUDPZFN5+O+54bQo7dy7p1F8jt7
 5VplJGQuevcxA1JLV/j+u2BBssM73JyDN5pVdE7TWirO7DjoOCesJIkQpv6+yNjsKnQK
 wkXNbpw6zzO/HMsmphO39To4vfMGJVLtAq4RtXaihlVa19HyZSHND5fDQUOEJkDnVq0h
 vCcA==
X-Gm-Message-State: AOAM531hF/7CJnppdDb7HFnVQBWvW3HFec9MBWexK2BUii14spPfwZXr
 Vxln/J8dpJxCjQxHL2tma0AA0E4GYmY58I/bVfcmEg==
X-Google-Smtp-Source: ABdhPJy2FkxP9uCAjgHSVGAUyuIAzs5LoJI255+ysGzmVAqm+Q5JlQU0zgPPhXz524KDDzM/bcIN5sXvCDie8V++BiA=
X-Received: by 2002:a4a:ab07:: with SMTP id i7mr3943321oon.89.1624533791640;
 Thu, 24 Jun 2021 04:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-4-daniel.vetter@ffwll.ch>
 <20210623161955.3371466-1-daniel.vetter@ffwll.ch>
 <CAPj87rN_P7u5JGWBOHc5BEXiz1Znek6fDTyj-uVr2nwEcGX_XA@mail.gmail.com>
In-Reply-To: <CAPj87rN_P7u5JGWBOHc5BEXiz1Znek6fDTyj-uVr2nwEcGX_XA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 24 Jun 2021 13:23:00 +0200
Message-ID: <CAKMK7uF-79a8Q7M49ynhcoBRcD1qmvRQ7DvZ6USeuKyxV4t0zQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH] dma-buf: Document dma-buf implicit
 fencing/resv fencing rules
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dennis Li <Dennis.Li@amd.com>,
 Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 1:08 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Wed, 23 Jun 2021 at 17:20, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > +        *
> > +        * IMPLICIT SYNCHRONIZATION RULES:
> > +        *
> > +        * Drivers which support implicit synchronization of buffer access as
> > +        * e.g. exposed in `Implicit Fence Poll Support`_ should follow the
> > +        * below rules.
>
> 'Should' ... ? Must.

Yeah  I guess I can upgrade a bunch of them.

> > +        * - Drivers should add a shared fence through
> > +        *   dma_resv_add_shared_fence() for anything the userspace API
> > +        *   considers a read access. This highly depends upon the API and
> > +        *   window system: E.g. OpenGL is generally implicitly synchronized on
> > +        *   Linux, but explicitly synchronized on Android. Whereas Vulkan is
> > +        *   generally explicitly synchronized for everything, and window system
> > +        *   buffers have explicit API calls (which then need to make sure the
> > +        *   implicit fences store here in @resv are updated correctly).
> > +        *
> > +        * - [...]
>
> Mmm, I think this is all right, but it could be worded much more
> clearly. Right now it's a bunch of points all smashed into one, and
> there's a lot of room for misinterpretation.
>
> Here's a strawman, starting with most basic and restrictive, working
> through to when you're allowed to wriggle your way out:
>
> Rule 1: Drivers must add a shared fence through
> dma_resv_add_shared_fence() for any read accesses against that buffer.
> This appends a fence to the shared array, ensuring that any future
> non-read access will be synchronised against this operation to only
> begin after it has completed.
>
> Rule 2: Drivers must add an exclusive fence through
> dma_resv_add_excl_fence() for any write accesses against that buffer.
> This replaces the exclusive fence with the new operation, ensuring
> that all future access will be synchronised against this operation to
> only begin after it has completed.
>
> Rule 3: Drivers must synchronise all accesses to buffers against
> existing implicit fences. Read accesses must synchronise against the
> exclusive fence (read-after-write), and write accesses must
> synchronise against both the exclusive (write-after-write) and shared
> (write-after-read) fences.
>
> Note 1: Users like OpenGL and window systems on non-Android userspace
> are generally implicitly synchronised. An implicitly-synchronised
> userspace is unaware of fences from prior operations, so the kernel
> mediates scheduling to create the illusion that GPU work is FIFO. For
> example, an application will flush and schedule GPU write work to
> render its image, then immediately tell the window system to display
> that image; the window system may immediately flush and schedule GPU
> read work to display that image, with neither waiting for the write to
> have completed. The kernel provides coherence by synchronising the
> read access against the write fence in the exclusive slot, so that the
> image displayed is correct.
>
> Note 2: Users like Vulkan and Android window system are generally
> explicitly synchronised. An explicitly-synchronised userspace is
> responsible for tracking its own read and write access and providing
> the kernel with synchronisation barriers. For instance, a Vulkan
> application rendering to a buffer and subsequently using it as a read
> texture, must annotate the read operation with a read-after-write
> synchronisation barrier.
>
> Note 3: Implicit and explicit userspace can coexist. For instance, an
> explicitly-synchronised Vulkan application may be running as a client
> of an implicitly-synchronised window system which uses OpenGL for
> composition; an implicitly-synchronised OpenGL application may be
> running as a client of a window system which uses Vulkan for
> composition.
>
> Note 4: Some subsystems, for example V4L2, do not pipeline operations,
> and instead only return to userspace when the scheduled work against a
> buffer has fully retired.
>
> Exemption 1: Fully self-coherent userspace may skip implicit
> synchronisation barriers. For instance, accesses between two
> Vulkan-internal buffers allocated by a single application do not need
> to synchronise against each other's implicit fences, as the client is
> responsible for explicitly providing barriers for access. A
> self-contained OpenGL userspace also has no need to implicitly
> synchronise its access if the driver instead tracks all access and
> inserts the appropriate synchronisation barriers.
>
> Exemption 2: When implicit and explicit userspace coexist, the
> explicit side may skip intermediate synchronisation, and only place
> synchronisation barriers at transition points. For example, a Vulkan
> compositor displaying a buffer from an OpenGL application would need
> to synchronise its first access against the fence placed in the
> exclusive implicit-synchronisation slot. Once this read has fully
> retired, the compositor has no need to participate in implicit
> synchronisation until it is ready to return the buffer to the
> application, at which point it must insert all its non-retired
> accesses into the shared slot, which the application will then
> synchronise future write accesses against.

So I think this is excellent, but maybe better suited in the uapi
section as a sperate chapter? Essentially keep your rules in the
driver-internal docs, but move the Note/excemptions into the uapi
section under a "Implicit Sync Mode of Operation" or whatever heading?

The other thing to keep in mind is that this is very much incomplete:
I'm silent on what drivers should do exactly with these fences. That's
largely because I haven't fully completed that audit, and there's a
pile of bugs there still.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
