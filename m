Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED38399367
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 21:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5F26E598;
	Wed,  2 Jun 2021 19:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4726E598
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 19:19:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so2291605wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 12:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eUENJ8IFVfyuEIR6EvsJ1XRveroP2COJUQKbXp+QSIs=;
 b=jrv6dYTJesnR7SFafmMVlPBYL0uwrdWD3/fVHuWImOUcB6JFSXUkMw+B5pVbVZbAOK
 +kmX2LkIXmotrUfvVA0mCwspGBs1kFyDehUiqKT9FJMix84MVMm4zcD45BV3nQIkx8iD
 lh9yuLJueXKNpTKldmzGHyhp+MGwsZedfIjvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eUENJ8IFVfyuEIR6EvsJ1XRveroP2COJUQKbXp+QSIs=;
 b=DiJMabG2n/HugtJ5nrN5u4HdSbI9gj6AfPBE0hOdupsECqcHfdASbIslOom7UJ5Jhu
 cpp6Fzrx+pvZm1yLYv1cDPQHjxmAP8hIlPwDq82UUO+2/mU0n7sxBkfUzOUyshqPam8A
 DDPci11uR4j6I6BC54Rm7KUQGlkR2qm9lPScPDGKD9oTHBJ8sAdNK3FZHZZxP8GtfMDS
 DaYSyccioQvEdKaWMVzzH4jA3B08cJ4X9EETNWUemhQ4sClemZ0zQUFu2P+mxqT75Xbs
 880/eeitvoqK6sZPxRDUK7/4E9d1g3oO5nvNPDKEUKOoePyirkkfUMbArD2bs6Fii1Up
 y/pA==
X-Gm-Message-State: AOAM5315dBToFABesSpESWi0Izm6DosNNohEKqzuPFOfePIZLzGiPAUZ
 XJzkctLf8R40kcWLDGXsjCDGGw==
X-Google-Smtp-Source: ABdhPJzHexJFaFRGofqLk07sCaIJNzh501NCGToLbjzHqOyeJiF8ofNIlbuZdtWyXRHPrsQgDTnr2g==
X-Received: by 2002:a1c:7fd0:: with SMTP id
 a199mr33324776wmd.161.1622661550098; 
 Wed, 02 Jun 2021 12:19:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j18sm532474wmq.27.2021.06.02.12.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 12:19:09 -0700 (PDT)
Date: Wed, 2 Jun 2021 21:19:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
Message-ID: <YLfZq5lAaR/RiFV8@phenom.ffwll.local>
References: <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
 <a43f81f6-fe41-a6db-442e-83eb163124b9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a43f81f6-fe41-a6db-442e-83eb163124b9@gmail.com>
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

On Wed, Jun 02, 2021 at 08:52:38PM +0200, Christian König wrote:
> 
> 
> Am 02.06.21 um 20:48 schrieb Daniel Vetter:
> > On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Olšák wrote:
> > > On Wed, Jun 2, 2021 at 5:34 AM Marek Olšák <maraeo@gmail.com> wrote:
> > > 
> > > > Yes, we can't break anything because we don't want to complicate things
> > > > for us. It's pretty much all NAK'd already. We are trying to gather more
> > > > knowledge and then make better decisions.
> > > > 
> > > > The idea we are considering is that we'll expose memory-based sync objects
> > > > to userspace for read only, and the kernel or hw will strictly control the
> > > > memory writes to those sync objects. The hole in that idea is that
> > > > userspace can decide not to signal a job, so even if userspace can't
> > > > overwrite memory-based sync object states arbitrarily, it can still decide
> > > > not to signal them, and then a future fence is born.
> > > > 
> > > This would actually be treated as a GPU hang caused by that context, so it
> > > should be fine.
> > This is practically what I proposed already, except your not doing it with
> > dma_fence. And on the memory fence side this also doesn't actually give
> > what you want for that compute model.
> > 
> > This seems like a bit a worst of both worlds approach to me? Tons of work
> > in the kernel to hide these not-dma_fence-but-almost, and still pain to
> > actually drive the hardware like it should be for compute or direct
> > display.
> > 
> > Also maybe I've missed it, but I didn't see any replies to my suggestion
> > how to fake the entire dma_fence stuff on top of new hw. Would be
> > interesting to know what doesn't work there instead of amd folks going of
> > into internal again and then coming back with another rfc from out of
> > nowhere :-)
> 
> Well to be honest I would just push back on our hardware/firmware guys that
> we need to keep kernel queues forever before going down that route.

I looked again, and you said the model wont work because preemption is way
too slow, even when the context is idle.

I guess at that point I got maybe too fed up and just figured "not my
problem", but if preempt is too slow as the unload fence, you can do it
with pte removal and tlb shootdown too (that is hopefully not too slow,
otherwise your hw is just garbage and wont even be fast for direct submit
compute workloads).

The only thing that you need to do when you use pte clearing + tlb
shootdown instad of preemption as the unload fence for buffers that get
moved is that if you get any gpu page fault, you don't serve that, but
instead treat it as a tdr and shot the context permanently.

So summarizing the model I proposed:

- you allow userspace to directly write into the ringbuffer, and also
  write the fences directly

- actual submit is done by the kernel, using drm/scheduler. The kernel
  blindly trusts userspace to set up everything else, and even just wraps
  dma_fences around the userspace memory fences.

- the only check is tdr. If a fence doesn't complete an tdr fires, a) the
  kernel shot the entire context and b) userspace recovers by setting up a
  new ringbuffer

- memory management is done using ttm only, you still need to supply the
  buffer list (ofc that list includes the always present ones, so CS will
  only get the list of special buffers like today). If you hw can't trun
  gpu page faults and you ever get one we pull up the same old solution:
  Kernel shots the entire context.

  The important thing is that from the gpu pov memory management works
  exactly like compute workload with direct submit, except that you just
  terminate the context on _any_ page fault, instead of only those that go
  somewhere where there's really no mapping and repair the others.

  Also I guess from reading the old thread this means you'd disable page
  fault retry because that is apparently also way too slow for anything.

- memory management uses an unload fence. That unload fences waits for all
  userspace memory fences (represented as dma_fence) to complete, with
  maybe some fudge to busy-spin until we've reached the actual end of the
  ringbuffer (maybe you have a IB tail there after the memory fence write,
  we have that on intel hw), and it waits for the memory to get
  "unloaded". This is either preemption, or pte clearing + tlb shootdown,
  or whatever else your hw provides which is a) used for dynamic memory
  management b) fast enough for actual memory management.

- any time a context dies we force-complete all it's pending fences,
  in-order ofc

So from hw pov this looks 99% like direct userspace submit, with the exact
same mappings, command sequences and everything else. The only difference
is that the rinbuffer head/tail updates happen from drm/scheduler, instead
of directly from userspace.

None of this stuff needs funny tricks where the kernel controls the
writes to memory fences, or where you need kernel ringbuffers, or anything
like thist. Userspace is allowed to do anything stupid, the rules are
guaranteed with:

- we rely on the hw isolation features to work, but _exactly_ like compute
  direct submit would too

- dying on any page fault captures memory management issues

- dying (without kernel recover, this is up to userspace if it cares) on
  any tdr makes sure fences complete still

> That syncfile and all that Android stuff isn't working out of the box with
> the new shiny user queue submission model (which in turn is mostly because
> of Windows) already raised some eyebrows here.

I think if you really want to make sure the current linux stack doesn't
break the _only_ option you have is provide a ctx mode that allows
dma_fence and drm/scheduler to be used like today.

For everything else it sounds you're a few years too late, because even
just huge kernel changes wont happen in time. Much less rewriting
userspace protocols.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
