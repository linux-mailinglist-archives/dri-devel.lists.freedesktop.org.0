Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1525C53BF80
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A64112F6B;
	Thu,  2 Jun 2022 20:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B50112F6B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:16:15 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-30c1b401711so63315397b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cJ940/0/K4n2fKUmdFFf8fsiiQHFai4rJTUsu0zNYkE=;
 b=F/P9XQemjYr+YrbHycFNEy9KzFfyj1tfd59+rBMY5qSQdMzUxwqAKrZAgMpA9MsYhf
 L3Dj1fWCumnouDVJgloakAQaoH09jEudR9cDpVD52Yzxj8Ga//5dYZ5tU8TDq3B9RAK6
 ibIZOz+F+V4nB0ghIW7nEJz2+axacdioANJKeIffOqch61jQMkzcN9ubVRv51WJPTd0C
 anw7UuZgeUxyW4OJS+RkfDxf/XtwuZ83uk0g3vo2K+oMysXzTjwEpO1gjwd794ixHl8u
 t/LCt3WUScQJdbe7gMCz02WOggs/YwMyAp4f3gVw4bJZ2YwhpHitvt6NignOilcrEoQK
 Gt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cJ940/0/K4n2fKUmdFFf8fsiiQHFai4rJTUsu0zNYkE=;
 b=oO0W33svPLNdM5QCFzgH0CD83XWJkyL55p8f5kokC+aVHMA1nrPEm53g+mFse5zQHP
 ++s46pFMnhPoYudOWdH1MV+uB1dao7Zn8GG4gPTsiejbkqdiHfJa8GSTGeRv4gj11thR
 s9I9eRKbiC2DWVsqOO27r5bleCX2h2Q33orvDnD9tiiizLlVPZK0exTh7q8RPnjHkTj/
 Y1EVfFDE64itBhahtNvlZpuxp7zzQgZWVuisKhf03C0RCCyxN3jWEkyaOdBOxWNZIbBm
 4noRRx1v+KGWlVXiWk3wptzfZ+NRzNtF1MLFg0stViu4j9TssFx/MImOEIvWeZlYE5E8
 RgCQ==
X-Gm-Message-State: AOAM5336+6KvHYjVQMAb7Jq63F5jvCZNYyNGDSJT9t3R9TMmQ2m9gjCY
 vJavlBq6SYuC42pCfn3QvxuuV/pRdx3yT9qGASffjQ==
X-Google-Smtp-Source: ABdhPJycWKG6zll7r7Fa85IbZRsjfj2Tq2j0eOyGWFqpb+gsDzWPLLngXZwQR7Erb8seoleHmP3Tv5OOXoEaTYn+vME=
X-Received: by 2002:a81:881:0:b0:2f8:46f4:7c6d with SMTP id
 123-20020a810881000000b002f846f47c6dmr8218179ywi.444.1654200974670; Thu, 02
 Jun 2022 13:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601211849.GA30517@jons-linux-dev-box>
 <2508922c-dae7-af05-0feb-9c4b63411a8c@intel.com>
In-Reply-To: <2508922c-dae7-af05-0feb-9c4b63411a8c@intel.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Thu, 2 Jun 2022 22:16:26 +0200
Message-ID: <CAP+8YyHO8DWcNc9sUZ87KS+i9owOGNTvmUFtjtWexeuWwgFigg@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 chris.p.wilson@intel.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, "Koenig,
 Christian" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 7:42 AM Lionel Landwerlin
<lionel.g.landwerlin@intel.com> wrote:
>
> On 02/06/2022 00:18, Matthew Brost wrote:
> > On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:
> >> On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
> >>> +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the mapping in an
> >>> +async worker. The binding and unbinding will work like a special GPU engine.
> >>> +The binding and unbinding operations are serialized and will wait on specified
> >>> +input fences before the operation and will signal the output fences upon the
> >>> +completion of the operation. Due to serialization, completion of an operation
> >>> +will also indicate that all previous operations are also complete.
> >> I guess we should avoid saying "will immediately start binding/unbinding" if
> >> there are fences involved.
> >>
> >> And the fact that it's happening in an async worker seem to imply it's not
> >> immediate.
> >>
> >>
> >> I have a question on the behavior of the bind operation when no input fence
> >> is provided. Let say I do :
> >>
> >> VM_BIND (out_fence=fence1)
> >>
> >> VM_BIND (out_fence=fence2)
> >>
> >> VM_BIND (out_fence=fence3)
> >>
> >>
> >> In what order are the fences going to be signaled?
> >>
> >> In the order of VM_BIND ioctls? Or out of order?
> >>
> >> Because you wrote "serialized I assume it's : in order
> >>
> >>
> >> One thing I didn't realize is that because we only get one "VM_BIND" engine,
> >> there is a disconnect from the Vulkan specification.

Note that in Vulkan not every queue has to support sparse binding, so
one could consider a dedicated sparse binding only queue family.

> >>
> >> In Vulkan VM_BIND operations are serialized but per engine.
> >>
> >> So you could have something like this :
> >>
> >> VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
> >>
> >> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
> >>
> > Question - let's say this done after the above operations:
> >
> > EXEC (engine=ccs0, in_fence=NULL, out_fence=NULL)
> >
> > Is the exec ordered with respected to bind (i.e. would fence3 & 4 be
> > signaled before the exec starts)?
> >
> > Matt
>
>
> Hi Matt,
>
>  From the vulkan point of view, everything is serialized within an
> engine (we map that to a VkQueue).
>
> So with :
>
> EXEC (engine=ccs0, in_fence=NULL, out_fence=NULL)
> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
>
> EXEC completes first then VM_BIND executes.
>
>
> To be even clearer :
>
> EXEC (engine=ccs0, in_fence=fence2, out_fence=NULL)
> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
>
>
> EXEC will wait until fence2 is signaled.
> Once fence2 is signaled, EXEC proceeds, finishes and only after it is done, VM_BIND executes.
>
> It would kind of like having the VM_BIND operation be another batch executed from the ringbuffer buffer.
>
> -Lionel
>
>
> >
> >> fence1 is not signaled
> >>
> >> fence3 is signaled
> >>
> >> So the second VM_BIND will proceed before the first VM_BIND.
> >>
> >>
> >> I guess we can deal with that scenario in userspace by doing the wait
> >> ourselves in one thread per engines.
> >>
> >> But then it makes the VM_BIND input fences useless.

I posed the same question on my series for AMD
(https://patchwork.freedesktop.org/series/104578/), albeit for
slightly different reasons.: if one creates a new VkMemory object, you
generally want that mapped ASAP, as you can't track (in a
VK_KHR_descriptor_indexing world) whether the next submit is going to
use this VkMemory object and hence have to assume the worst (i.e. wait
till the map/bind is complete before executing the next submission).
If all binds/unbinds (or maps/unmaps) happen in-order that means an
operation with input fences could delay stuff we want ASAP.

Of course waiting in userspace does have disadvantages:

1) more overhead between fence signalling and the operation,
potentially causing slightly bigger GPU bubbles.
2) You can't get an out fence early. Within the driver we can mostly
work around this but sync_fd exports, WSI and such will be messy.
3) moving the queue to a thread might make things slightly less ideal
due to scheduling delays.

Removing the in-order working in the kernel generally seems like
madness to me as it is very hard to keep track of the state of the
virtual address space (to e.g. track umapping stuff before freeing
memory or moving memory around)

the one game I tried (FH5 over vkd3d-proton) does sparse mapping as follows:

separate queue:
1) 0 cmdbuffer submit with 0 input semaphores and 1 output semaphore
2) sparse bind with input semaphore from 1 and 1 output semaphore
3) 0 cmdbuffer submit with input semaphore from 2 and 1 output fence
4) wait on that fence on the CPU

which works very well if we just wait for the sparse bind input
semaphore in userspace, but I'm still working on seeing if this is the
common usecase or an outlier.



> >>
> >>
> >> Daniel : what do you think? Should be rework this or just deal with wait
> >> fences in userspace?
> >>
> >>
> >> Sorry I noticed this late.
> >>
> >>
> >> -Lionel
> >>
> >>
>
