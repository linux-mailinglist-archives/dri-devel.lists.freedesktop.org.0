Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534EB397411
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 15:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0811A6EA64;
	Tue,  1 Jun 2021 13:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id B38466EA64;
 Tue,  1 Jun 2021 13:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1962920201D;
 Tue,  1 Jun 2021 15:24:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id LrLIqePfdT4s; Tue,  1 Jun 2021 15:24:46 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id B28B520201A;
 Tue,  1 Jun 2021 15:24:46 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1lo4Nx-001qWW-TU; Tue, 01 Jun 2021 15:24:45 +0200
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAAxE2A6OHPSqmARKS_M1dxKJ-vuTcqn7dJQgW8T1qE6AahnzXw@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
Message-ID: <64e720f1-d96f-0d6d-97dd-aade5eebbe6d@daenzer.net>
Date: Tue, 1 Jun 2021 15:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAAxE2A6OHPSqmARKS_M1dxKJ-vuTcqn7dJQgW8T1qE6AahnzXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-01 3:01 p.m., Marek Olšák wrote:
> 
> 
> On Tue., Jun. 1, 2021, 08:51 Christian König, <ckoenig.leichtzumerken@gmail.com <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
> 
>     Am 01.06.21 um 14:30 schrieb Daniel Vetter:
>     > On Tue, Jun 1, 2021 at 2:10 PM Christian König
>     > <ckoenig.leichtzumerken@gmail.com <mailto:ckoenig.leichtzumerken@gmail.com>> wrote:
>     >> Am 01.06.21 um 12:49 schrieb Michel Dänzer:
>     >>> On 2021-06-01 12:21 p.m., Christian König wrote:
>     >>>> Am 01.06.21 um 11:02 schrieb Michel Dänzer:
>     >>>>> On 2021-05-27 11:51 p.m., Marek Olšák wrote:
>     >>>>>> 3) Compositors (and other privileged processes, and display flipping) can't trust imported/exported fences. They need a timeout recovery mechanism from the beginning, and the following are some possible solutions to timeouts:
>     >>>>>>
>     >>>>>> a) use a CPU wait with a small absolute timeout, and display the previous content on timeout
>     >>>>>> b) use a GPU wait with a small absolute timeout, and conditional rendering will choose between the latest content (if signalled) and previous content (if timed out)
>     >>>>>>
>     >>>>>> The result would be that the desktop can run close to 60 fps even if an app runs at 1 fps.
>     >>>>> FWIW, this is working with
>     >>>>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 <https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880> , even with implicit sync (on current Intel GPUs; amdgpu/radeonsi would need to provide the same dma-buf poll semantics as other drivers and high priority GFX contexts via EGL_IMG_context_priority which can preempt lower priority ones).
>     >>>> Yeah, that is really nice to have.
>     >>>>
>     >>>> One question is if you wait on the CPU or the GPU for the new surface to become available?
>     >>> It's based on polling dma-buf fds, i.e. CPU.
>     >>>
>     >>>> The former is a bit bad for latency and power management.
>     >>> There isn't a choice for Wayland compositors in general, since there can be arbitrary other state which needs to be applied atomically together with the new buffer. (Though in theory, a compositor might get fancy and special-case surface commits which can be handled by waiting on the GPU)
>     >>>
>     >>> Latency is largely a matter of scheduling in the compositor. The latency incurred by the compositor shouldn't have to be more than single-digit milliseconds. (I've seen total latency from when the client starts processing a (static) frame to when it starts being scanned out as low as ~6 ms with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620 <https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620>, lower than typical with Xorg)
>     >> Well let me describe it like this:
>     >>
>     >> We have an use cases for 144 Hz guaranteed refresh rate. That
>     >> essentially means that the client application needs to be able to spit
>     >> out one frame/window content every ~6.9ms. That's tough, but doable.
>     >>
>     >> When you now add 6ms latency in the compositor that means the client
>     >> application has only .9ms left for it's frame which is basically
>     >> impossible to do.
>     >>
>     >> See for the user fences handling the display engine will learn to read
>     >> sequence numbers from memory and decide on it's own if the old frame or
>     >> the new one is scanned out. To get the latency there as low as possible.
>     > This won't work with implicit sync at all.
>     >
>     > If you want to enable this use-case with driver magic and without the
>     > compositor being aware of what's going on, the solution is EGLStreams.
>     > Not sure we want to go there, but it's definitely a lot more feasible
>     > than trying to stuff eglstreams semantics into dma-buf implicit
>     > fencing support in a desperate attempt to not change compositors.

EGLStreams are a red herring here. Wayland has atomic state transactions, similar to the atomic KMS API. These semantics could be achieved even with EGLStreams, at least via additional EGL extensions.

Any fancy technique we're discussing here would have to be completely between the Wayland compositor and the kernel, transparent to anything else.


>     > I still think the most reasonable approach here is that we wrap a
>     > dma_fence compat layer/mode over new hw for existing
>     > userspace/compositors. And then enable userspace memory fences and the
>     > fancy new features those allow with a new model that's built for them.
> 
>     Yeah, that's basically the same direction I'm heading. Question is how
>     to fix all those details.
> 
>     > Also even with dma_fence we could implement your model of staying with
>     > the previous buffer (or an older buffer at that's already rendered),
>     > but it needs explicit involvement of the compositor. At least without
>     > adding eglstreams fd to the kernel and wiring up all the relevant
>     > extensions.
> 
>     Question is do we already have some extension which allows different
>     textures to be selected on the fly depending on some state?
> 
> 
> There is no such extension for sync objects, but it can be done with queries, like occlusion queries. There is also no timeout option and it can only do "if" and "if not", but not "if .. else"

The Wayland compositor would also need to know which texture the shader ended up sampling from.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
