Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 753F920099E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 15:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A186ECAB;
	Fri, 19 Jun 2020 13:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5C96ECA9;
 Fri, 19 Jun 2020 13:12:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r15so9067362wmh.5;
 Fri, 19 Jun 2020 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:in-reply-to
 :references:subject:from:to:cc:message-id:user-agent:date;
 bh=GkCNCBDLTGNPQOWA3LlDB+HVQOoFNOeRv8FRTeVEIsM=;
 b=O2IoOtXTfwDLnURJ+oPXILPR4bZC5yfvkimT/xe7sHph7oSWi+9ZBJeMgu8VpB3O29
 ry7T5AuBz/T6GsCRSKV57xS6lXox0wOBXO8sjeaiphnDq1DCuvVEW2v4bqnwaVh/2QPf
 /0wtqTvZCSwapDz1xOsN6Mu0PnC3VB0PLCIHTsJT9jVJRXpbEC0mqIgCAd23/Xj6iIme
 h41kY/cj1d4TZuuhdwGtSzI8WXAiTVpGeedX/ZRocox5N/ealOWbJt3k2FWnmLx3ON2B
 h5X1CEinnZWXMmTGjhjnsyM7tqY9OpSHy2JEtUoNXVA5mL6gs8baEUtVkUR64tvx3vdi
 GC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:to:cc:message-id:user-agent
 :date;
 bh=GkCNCBDLTGNPQOWA3LlDB+HVQOoFNOeRv8FRTeVEIsM=;
 b=uOnVbfjonA5lhxH8IL5RR5GTOF7+U/7/WtoT73bV3hvVsMCfNH1zooYCEUT6mp14tn
 FgBWTjJt9LrcLCidkDLrPsqgXzvIn5GiVBR64V8wf0RCD96B7+66WK7I1ayAO5nsyWln
 le+NdCUuxMcds4t6DL0HsLDFIEAVRp4bqYddb/GEJYDORZq5nk7ESC1R3g92TB8uvlFX
 lAk4kt5V5nurHPxvEraKiADTK+dbL2CMJ+8d/nnG7aTr35izIWkOpSJgs7oteSUyhUdU
 ucAfdGq1PJsnhkcEwfNXdGWzceC/flsKLpyOu7Yns22pXWgpCJlhaxMh8Gf7NpGstyzZ
 LaSg==
X-Gm-Message-State: AOAM5324d2PSjZFplUU4BhrNAH+aJau/5xhnGVWjGrGPvo7ytoiwGQ4/
 3mn6a4JH/Ni7caoVgFhPsug=
X-Google-Smtp-Source: ABdhPJwSjmILeC2LcTtTmmx0JTtIYZ95VNY2hAQJPzgz/V8uF2EioBLqs1vbWGMXNu2IaPLP58n7IA==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr3494639wmi.7.1592572341541;
 Fri, 19 Jun 2020 06:12:21 -0700 (PDT)
Received: from localhost ([78.156.65.138])
 by smtp.gmail.com with ESMTPSA id v24sm8375716wrd.92.2020.06.19.06.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 06:12:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200619094309.GT20149@phenom.ffwll.local>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-4-daniel.vetter@ffwll.ch>
 <159186243606.1506.4437341616828968890@build.alporthouse.com>
 <CAPM=9ty6r1LuXAH_rf98GH0R9yN3x8xzKPjZG3QyvokpQBR-Hg@mail.gmail.com>
 <CAPj87rM0S2OPssf+WA+pjanT-0Om3yuUM1zUJCv4qTx5VYE=Fw@mail.gmail.com>
 <159255511144.7737.12635440776531222029@build.alporthouse.com>
 <CAKMK7uHEwj6jiZkRZ5PaCUNWcuU9oE4KYm4XHZwHnFzEuChZ7w@mail.gmail.com>
 <159255801588.7737.4425728073225310839@build.alporthouse.com>
 <20200619094309.GT20149@phenom.ffwll.local>
Subject: Re: [Intel-gfx] [PATCH 03/18] dma-fence: basic lockdep annotations
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <159257233754.7737.17318605310513355800@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Fri, 19 Jun 2020 14:12:17 +0100
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, Thomas Hellstrom <thomas.hellstrom@intel.com>, amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Christian König <christian.koenig@amd.com>, Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-06-19 10:43:09)
> On Fri, Jun 19, 2020 at 10:13:35AM +0100, Chris Wilson wrote:
> > Quoting Daniel Vetter (2020-06-19 09:51:59)
> > > On Fri, Jun 19, 2020 at 10:25 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > > Forcing a generic primitive to always be part of the same global map is
> > > > horrible.
> > > 
> > > And  no concrete example or reason for why that's not possible.
> > > Because frankly it's not horrible, this is what upstream is all about:
> > > Shared concepts, shared contracts, shared code.
> > > 
> > > The proposed patches might very well encode the wrong contract, that's
> > > all up for discussion. But fundamentally questioning that we need one
> > > is missing what upstream is all about.
> > 
> > Then I have not clearly communicated, as my opinion is not that
> > validation is worthless, but that the implementation is enshrining a
> > global property on a low level primitive that prevents it from being
> > used elsewhere. And I want to replace completion [chains] with fences, and
> > bio with fences, and closures with fences, and what other equivalencies
> > there are in the kernel. The fence is as central a locking construct as
> > struct completion and deserves to be a foundational primitive provided
> > by kernel/ used throughout all drivers for discrete problem domains.
> > 
> > This is narrowing dma_fence whereby adding
> >       struct lockdep_map *dma_fence::wait_map
> > and annotating linkage, allows you to continue to specify that all
> > dma_fence used for a particular purpose must follow common rules,
> > without restricting the primitive for uses outside of this scope.
> 
> Somewhere else in this thread I had discussions with Jason Gunthorpe about
> this topic. It might maybe change somewhat depending upon exact rules, but
> his take is very much "I don't want dma_fence in rdma". Or pretty close to
> that at least.
> 
> Similar discussions with habanalabs, they're using dma_fence internally
> without any of the uapi. Discussion there has also now concluded that it's
> best if they remove them, and simply switch over to a wait_queue or
> completion like every other driver does.
> 
> The next round of the patches already have a paragraph to at least
> somewhat limit how non-gpu drivers use dma_fence. And I guess actual
> consensus might be pointing even more strongly at dma_fence being solely
> something for gpus and closely related subsystem (maybe media) for syncing
> dma-buf access.
> 
> So dma_fence as general replacement for completion chains I think just
> wont happen.

That is sad. I cannot comprehend going back to pure completions after a
taste of fence scheduling. And we are not even close to fully utilising
them, as not all the async cpu [allocation!] tasks are fully tracked by
fences yet and are still stuck in a FIFO workqueue.

> What might make sense is if e.g. the lockdep annotations could be reused,
> at least in design, for wait_queue or completion or anything else
> really. I do think that has a fair chance compared to the automagic
> cross-release annotations approach, which relied way too heavily on
> guessing where barriers are. My experience from just a bit of playing
> around with these patches here and discussing them with other driver
> maintainers is that accurately deciding where critical sections start and
> end is a job for humans only. And if you get it wrong, you will have a
> false positive.
> 
> And you're indeed correct that if we'd do annotations for completions and
> wait queues, then that would need to have a class per semantically
> equivalent user, like we have lockdep classes for mutexes, not just one
> overall.
> 
> But dma_fence otoh is something very specific, which comes with very
> specific rules attached - it's not a generic wait_queue at all. Originally
> it did start out as one even, but it is a very specialized wait_queue.
> 
> So there's imo two cases:
> 
> - Your completion is entirely orthogonal of dma_fences, and can never ever
>   block a dma_fence. Don't use dma_fence for this, and no problem. It's
>   just another wait_queue somewhere.
> 
> - Your completion can eventually, maybe through lots of convolutions and
>   depdencies, block a dma_fence. In that case full dma_fence rules apply,
>   and the only thing you can do with a custom annotation is make the rules
>   even stricter. E.g. if a sub-timeline in the scheduler isn't allowed to
>   take certain scheduler locks. But the userspace visible/published fence
>   do take them, maybe as part of command submission or retirement.
>   Entirely hypotethical, no idea any driver actually needs this.

I think we are faced with this very real problem.

The papering we have today over userptr is so very thin, and if you
squint you can already see it is coupled into the completion signal. Just
it happens to be on the other side of the fence.

The next batch of priority inversions involve integrating the async cpu
tasks into the scheduler, and have full dependency tracking over every
internal fence. I do not see any way to avoid coupling the completion
signal from the GPU to the earliest resource allocation, as it's an
unbroken chain of work, at least from the user's perspective. [Next up
for annotations is that we need to always assume that userspace has an
implicit lock on GPU resources; having to break that lock with a GPU
reset should be a breach of our data integrity, and best avoided, for
compute does not care one iota about system integrity and insist
userspace knows best.] Such allocations have to be allowed to fail and
for that failure to propagate cancelling the queued work, such that I'm
considering what rules we need for gfp_t. That might allow enough
leverage to break any fs_reclaim loops, but userptr is likely forever
doomed [aside from its fs_reclaim loop is as preventable as the normal
shrinker paths], but we still need to suggest to pin_user_pages that
failure is better than oom and that is not clear atm. Plus the usual
failure can happen at any time after updating the user facing
bookkeeping, but that is just extra layers in the execution monitor
ready to step in and replacing failing work with the error propagation.
Or where the system grinds to a halt, requiring the monitor to patch in
a new page / resource.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
