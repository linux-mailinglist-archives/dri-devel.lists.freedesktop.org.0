Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8A39B557
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974306F5DC;
	Fri,  4 Jun 2021 08:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEFA6F5D7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 08:57:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so7427039wmd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 01:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pQJQCHiUwe5QyvyV6oPQKU1BT1SmNXg4gOHtLZuSTLw=;
 b=KromvZGd0ZcDgjxEp5Df9u7PI8/Naar0sHnYWHtiEm2DCyPG8xVlTBl6DUnhQMOEAL
 Yk3opctYaxLGKR86AfIGMRLn4QIvV2au/RtkC2HulINyTLh1LKUvrGnEl6K5wVOI/R5V
 GHsAJCaaJd1ExJTpLFuLIgG1qx+kyWM5TZzxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pQJQCHiUwe5QyvyV6oPQKU1BT1SmNXg4gOHtLZuSTLw=;
 b=VQn7zRpy+EYQaTGmMO9c3PktEyhQcJQIJ2+wjbCwBlZHUDpJ0zntlCphe9rGQk1zhI
 /o21eeunY61Uo9Jz6AREJEyh8txuDSUUHhk2deG7OkkXocuR9hXRqYk6J3kHwtfPo0lG
 oZwt9+GyfTLznQ6/syuQvoyqELoCSKB32wfP9hpwx4KDR0+yO6u+986QcSk8kYRfGqZQ
 jcZUrFGhvysmyAdL1Kz5y/zeFCGtMJbfaucCA7GUMDd+QIcLK2nMvOmm47mO7ecp3Sje
 QvIoiDWMAEqQwHgIuR/ut1hAXGMSIOWYmKv/j0pzDkTLK8Uy7AbZ6PXZejqF135HDoiJ
 UUEg==
X-Gm-Message-State: AOAM530OKeUdjyqVD39HTkXlEYxD1AfVMCfvPU3/6PC1Cz9zEk0AgMfa
 AzElntAFDcXWR/Y+iSbWwyObUg==
X-Google-Smtp-Source: ABdhPJxEhbVrOGhgawrKNTPx39SPCtQFXmDUDF+wBcwbjmL9UyPTm5gl4jEl/+gwQkaxDE5udHJwNw==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr2561225wmc.104.1622797036605; 
 Fri, 04 Jun 2021 01:57:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t12sm7633597wre.9.2021.06.04.01.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 01:57:15 -0700 (PDT)
Date: Fri, 4 Jun 2021 10:57:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
Message-ID: <YLnq6Vuf4amZld3n@phenom.ffwll.local>
References: <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
 <a43f81f6-fe41-a6db-442e-83eb163124b9@gmail.com>
 <YLfZq5lAaR/RiFV8@phenom.ffwll.local>
 <0fbb1197-fa88-c474-09db-6daec13d3004@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fbb1197-fa88-c474-09db-6daec13d3004@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 09:00:31AM +0200, Christian König wrote:
> Am 02.06.21 um 21:19 schrieb Daniel Vetter:
> > On Wed, Jun 02, 2021 at 08:52:38PM +0200, Christian König wrote:
> > > 
> > > Am 02.06.21 um 20:48 schrieb Daniel Vetter:
> > > > On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Olšák wrote:
> > > > > On Wed, Jun 2, 2021 at 5:34 AM Marek Olšák <maraeo@gmail.com> wrote:
> > > > > 
> > > > > > Yes, we can't break anything because we don't want to complicate things
> > > > > > for us. It's pretty much all NAK'd already. We are trying to gather more
> > > > > > knowledge and then make better decisions.
> > > > > > 
> > > > > > The idea we are considering is that we'll expose memory-based sync objects
> > > > > > to userspace for read only, and the kernel or hw will strictly control the
> > > > > > memory writes to those sync objects. The hole in that idea is that
> > > > > > userspace can decide not to signal a job, so even if userspace can't
> > > > > > overwrite memory-based sync object states arbitrarily, it can still decide
> > > > > > not to signal them, and then a future fence is born.
> > > > > > 
> > > > > This would actually be treated as a GPU hang caused by that context, so it
> > > > > should be fine.
> > > > This is practically what I proposed already, except your not doing it with
> > > > dma_fence. And on the memory fence side this also doesn't actually give
> > > > what you want for that compute model.
> > > > 
> > > > This seems like a bit a worst of both worlds approach to me? Tons of work
> > > > in the kernel to hide these not-dma_fence-but-almost, and still pain to
> > > > actually drive the hardware like it should be for compute or direct
> > > > display.
> > > > 
> > > > Also maybe I've missed it, but I didn't see any replies to my suggestion
> > > > how to fake the entire dma_fence stuff on top of new hw. Would be
> > > > interesting to know what doesn't work there instead of amd folks going of
> > > > into internal again and then coming back with another rfc from out of
> > > > nowhere :-)
> > > Well to be honest I would just push back on our hardware/firmware guys that
> > > we need to keep kernel queues forever before going down that route.
> > I looked again, and you said the model wont work because preemption is way
> > too slow, even when the context is idle.
> > 
> > I guess at that point I got maybe too fed up and just figured "not my
> > problem", but if preempt is too slow as the unload fence, you can do it
> > with pte removal and tlb shootdown too (that is hopefully not too slow,
> > otherwise your hw is just garbage and wont even be fast for direct submit
> > compute workloads).
> 
> Have you seen that one here:
> https://www.spinics.net/lists/amd-gfx/msg63101.html :)
> 
> I've rejected it because I think polling for 6 seconds on a TLB flush which
> can block interrupts as well is just madness.

Hm but I thought you had like 2 tlb flush modes, the shitty one (with
retrying page faults) and the not so shitty one?

But yeah at that point I think you just have to bite one of the bullets.

The thing is with hmm/userspace memory fence model this will be even
worse, because you will _have_ to do this tlb flush deep down in core mm
functions, so this is going to be userptr, but worse.

With the dma_resv/dma_fence bo memory management model you can at least
wrap that tlb flush into a dma_fence and push the waiting/pinging onto a
separate thread or something like that. If the hw really is that slow.

Somewhat aside: Personally I think that sriov needs to move over to the
compute model, i.e. indefinite timeouts, no tdr, because everything takes
too long. At least looking around sriov timeouts tend to be 10x bare
metal, across the board.

But for stuff like cloud gaming that's serious amounts of heavy lifting
since it brings us right back "the entire linux/android 3d stack is built
on top of dma_fence right now".

> > The only thing that you need to do when you use pte clearing + tlb
> > shootdown instad of preemption as the unload fence for buffers that get
> > moved is that if you get any gpu page fault, you don't serve that, but
> > instead treat it as a tdr and shot the context permanently.
> > 
> > So summarizing the model I proposed:
> > 
> > - you allow userspace to directly write into the ringbuffer, and also
> >    write the fences directly
> > 
> > - actual submit is done by the kernel, using drm/scheduler. The kernel
> >    blindly trusts userspace to set up everything else, and even just wraps
> >    dma_fences around the userspace memory fences.
> > 
> > - the only check is tdr. If a fence doesn't complete an tdr fires, a) the
> >    kernel shot the entire context and b) userspace recovers by setting up a
> >    new ringbuffer
> > 
> > - memory management is done using ttm only, you still need to supply the
> >    buffer list (ofc that list includes the always present ones, so CS will
> >    only get the list of special buffers like today). If you hw can't trun
> >    gpu page faults and you ever get one we pull up the same old solution:
> >    Kernel shots the entire context.
> > 
> >    The important thing is that from the gpu pov memory management works
> >    exactly like compute workload with direct submit, except that you just
> >    terminate the context on _any_ page fault, instead of only those that go
> >    somewhere where there's really no mapping and repair the others.
> > 
> >    Also I guess from reading the old thread this means you'd disable page
> >    fault retry because that is apparently also way too slow for anything.
> > 
> > - memory management uses an unload fence. That unload fences waits for all
> >    userspace memory fences (represented as dma_fence) to complete, with
> >    maybe some fudge to busy-spin until we've reached the actual end of the
> >    ringbuffer (maybe you have a IB tail there after the memory fence write,
> >    we have that on intel hw), and it waits for the memory to get
> >    "unloaded". This is either preemption, or pte clearing + tlb shootdown,
> >    or whatever else your hw provides which is a) used for dynamic memory
> >    management b) fast enough for actual memory management.
> > 
> > - any time a context dies we force-complete all it's pending fences,
> >    in-order ofc
> > 
> > So from hw pov this looks 99% like direct userspace submit, with the exact
> > same mappings, command sequences and everything else. The only difference
> > is that the rinbuffer head/tail updates happen from drm/scheduler, instead
> > of directly from userspace.
> > 
> > None of this stuff needs funny tricks where the kernel controls the
> > writes to memory fences, or where you need kernel ringbuffers, or anything
> > like thist. Userspace is allowed to do anything stupid, the rules are
> > guaranteed with:
> > 
> > - we rely on the hw isolation features to work, but _exactly_ like compute
> >    direct submit would too
> > 
> > - dying on any page fault captures memory management issues
> > 
> > - dying (without kernel recover, this is up to userspace if it cares) on
> >    any tdr makes sure fences complete still
> > 
> > > That syncfile and all that Android stuff isn't working out of the box with
> > > the new shiny user queue submission model (which in turn is mostly because
> > > of Windows) already raised some eyebrows here.
> > I think if you really want to make sure the current linux stack doesn't
> > break the _only_ option you have is provide a ctx mode that allows
> > dma_fence and drm/scheduler to be used like today.
> 
> Yeah, but I still can just tell our hw/fw guys that we really really need to
> keep kernel queues or the whole Linux/Android infrastructure needs to get a
> compatibility layer like you describe above.
> 
> > For everything else it sounds you're a few years too late, because even
> > just huge kernel changes wont happen in time. Much less rewriting
> > userspace protocols.
> 
> Seconded, question is rather if we are going to start migrating at some
> point or if we should keep pushing on our hw/fw guys.

So from what I'm hearing other hw might gain the sw compat layer too. Plus
I'm hoping that with the sw compat layer it'd be easier to smooth over
userspace to the new model (because there will be a long time where we
have to support both, maybe even with a runtime switch from userspace
memory fences to dma_fence kernel stuff).

But in the end it's up to you what makes more sense between sw work and
hw/fw work involved.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
