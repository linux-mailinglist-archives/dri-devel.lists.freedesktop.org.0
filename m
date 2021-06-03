Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C340E399E68
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 12:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07A86E8AA;
	Thu,  3 Jun 2021 10:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCDC6E8AA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 10:03:31 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id h24so8398387ejy.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 03:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ldprfd697gquwl7J5tMr9JccbAsne9zo5nSIMBMfeKo=;
 b=AxiwtXY/+R3cFmGEx8MrQ6z5h8v8KvjBCbN76U0aVgCTlVO52pFkpCxAVDSbxMvr6/
 XKTD+gMvDsKAMsvQno9LTyDxAuCj7P5QwmsGoa0CIu807dy79mXhtyvB6yQjNKVkHJwj
 xVQfzPe5PDZjNAof4xv9X+hf2ZI/3RrsjH51E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ldprfd697gquwl7J5tMr9JccbAsne9zo5nSIMBMfeKo=;
 b=kIcdJhRSeDDzKNfLVFL4k6JVmexf26ipupfueYP60g3LsxphIOycJtw6o7bElYt9Sn
 ctGO4uJvH6S1n2VCMGMlY9TWugFrvbhnHqwG3E0beRJpklsaL8wKQBQDLoiDmJN9QPCW
 hCPS0xIsHGn7O6qJrOUjRleOhEKqpjk+sWD4rWFvLWyWQBQSSeA0K5oQK796XP6POh19
 gwLtQIkPTGlFaEbXcBASPv1cYDXSg0DsNThBzzWXW3q36eFtp7CgK1sdk+wU2XtRSZ2x
 aXBF+h23l+w4Jd8GYUrCHHPml2Tax7SG8nNeoYCbWAVFlghVAoJUpjxwf5q9a/CXItDW
 wJxw==
X-Gm-Message-State: AOAM530TfOqyAb6mIayZEweswl3KjL8jP1/Q8NUOR/AUkiTP6KoiVB0x
 hZUuXiVpL6txhuNBq1BVptutrA==
X-Google-Smtp-Source: ABdhPJwj94XvBEERNRuM0LxQP/qg7UUlkP4MHX6F0r8Jzo0ma39StJ9NDa9KM4QuqaFYDQxTUpAwMQ==
X-Received: by 2002:a17:906:dfea:: with SMTP id
 lc10mr20296031ejc.148.1622714609786; 
 Thu, 03 Jun 2021 03:03:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bc4sm1480058edb.63.2021.06.03.03.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 03:03:29 -0700 (PDT)
Date: Thu, 3 Jun 2021 12:03:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
Message-ID: <YLio7wyoMRJyFoO/@phenom.ffwll.local>
References: <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
 <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
 <YLfSbxhyDQmHjV4r@phenom.ffwll.local>
 <CAAxE2A7uK7zumDiaU1XpEi_RNv8Q+QQHU-dLB0HrES2BkdP-cw@mail.gmail.com>
 <YLiJFdcaxzXsstt6@phenom.ffwll.local>
 <CAAxE2A4VPYMrjbq1W9z3pNXHP_Msn9HCFMPew9jf2h72rfK3dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A4VPYMrjbq1W9z3pNXHP_Msn9HCFMPew9jf2h72rfK3dA@mail.gmail.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 04:20:18AM -0400, Marek Olšák wrote:
> On Thu, Jun 3, 2021 at 3:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Wed, Jun 02, 2021 at 11:16:39PM -0400, Marek Olšák wrote:
> > > On Wed, Jun 2, 2021 at 2:48 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > > On Wed, Jun 02, 2021 at 05:38:51AM -0400, Marek Olšák wrote:
> > > > > On Wed, Jun 2, 2021 at 5:34 AM Marek Olšák <maraeo@gmail.com> wrote:
> > > > >
> > > > > > Yes, we can't break anything because we don't want to complicate
> > things
> > > > > > for us. It's pretty much all NAK'd already. We are trying to gather
> > > > more
> > > > > > knowledge and then make better decisions.
> > > > > >
> > > > > > The idea we are considering is that we'll expose memory-based sync
> > > > objects
> > > > > > to userspace for read only, and the kernel or hw will strictly
> > control
> > > > the
> > > > > > memory writes to those sync objects. The hole in that idea is that
> > > > > > userspace can decide not to signal a job, so even if userspace
> > can't
> > > > > > overwrite memory-based sync object states arbitrarily, it can still
> > > > decide
> > > > > > not to signal them, and then a future fence is born.
> > > > > >
> > > > >
> > > > > This would actually be treated as a GPU hang caused by that context,
> > so
> > > > it
> > > > > should be fine.
> > > >
> > > > This is practically what I proposed already, except your not doing it
> > with
> > > > dma_fence. And on the memory fence side this also doesn't actually give
> > > > what you want for that compute model.
> > > >
> > > > This seems like a bit a worst of both worlds approach to me? Tons of
> > work
> > > > in the kernel to hide these not-dma_fence-but-almost, and still pain to
> > > > actually drive the hardware like it should be for compute or direct
> > > > display.
> > > >
> > > > Also maybe I've missed it, but I didn't see any replies to my
> > suggestion
> > > > how to fake the entire dma_fence stuff on top of new hw. Would be
> > > > interesting to know what doesn't work there instead of amd folks going
> > of
> > > > into internal again and then coming back with another rfc from out of
> > > > nowhere :-)
> > > >
> > >
> > > Going internal again is probably a good idea to spare you the long
> > > discussions and not waste your time, but we haven't talked about the
> > > dma_fence stuff internally other than acknowledging that it can be
> > solved.
> > >
> > > The compute use case already uses the hw as-is with no inter-process
> > > sharing, which mostly keeps the kernel out of the picture. It uses
> > glFinish
> > > to sync with GL.
> > >
> > > The gfx use case needs new hardware logic to support implicit and
> > explicit
> > > sync. When we propose a solution, it's usually torn apart the next day by
> > > ourselves.
> > >
> > > Since we are talking about next hw or next next hw, preemption should be
> > > better.
> > >
> > > user queue = user-mapped ring buffer
> > >
> > > For implicit sync, we will only let userspace lock access to a buffer
> > via a
> > > user queue, which waits for the per-buffer sequence counter in memory to
> > be
> > > >= the number assigned by the kernel, and later unlock the access with
> > > another command, which increments the per-buffer sequence counter in
> > memory
> > > with atomic_inc regardless of the number assigned by the kernel. The
> > kernel
> > > counter and the counter in memory can be out-of-sync, and I'll explain
> > why
> > > it's OK. If a process increments the kernel counter but not the memory
> > > counter, that's its problem and it's the same as a GPU hang caused by
> > that
> > > process. If a process increments the memory counter but not the kernel
> > > counter, the ">=" condition alongside atomic_inc guarantee that
> > signaling n
> > > will signal n+1, so it will never deadlock but also it will effectively
> > > disable synchronization. This method of disabling synchronization is
> > > similar to a process corrupting the buffer, which should be fine. Can you
> > > find any flaw in it? I can't find any.
> >
> > Hm maybe I misunderstood what exactly you wanted to do earlier. That kind
> > of "we let userspace free-wheel whatever it wants, kernel ensures
> > correctness of the resulting chain of dma_fence with reset the entire
> > context" is what I proposed too.
> >
> > Like you say, userspace is allowed to render garbage already.
> >
> > > The explicit submit can be done by userspace (if there is no
> > > synchronization), but we plan to use the kernel to do it for implicit
> > sync.
> > > Essentially, the kernel will receive a buffer list and addresses of wait
> > > commands in the user queue. It will assign new sequence numbers to all
> > > buffers and write those numbers into the wait commands, and ring the hw
> > > doorbell to start execution of that queue.
> >
> > Yeah for implicit sync I think kernel and using drm/scheduler to sort out
> > the dma_fence dependencies is probably best. Since you can filter out
> > which dma_fence you hand to the scheduler for dependency tracking you can
> > filter out your own ones and let the hw handle those directly (depending
> > how much your hw can do an all that). On i915 we might do that to be able
> > to use MI_SEMAPHORE_WAIT/SIGNAL functionality in the hw and fw scheduler.
> >
> > For buffer tracking with implicit sync I think cleanest is probably to
> > still keep them wrapped as dma_fence and stuffed into dma_resv, but
> > conceptually it's the same. If we let every driver reinvent their own
> > buffer tracking just because the hw works a bit different it'll be a mess.
> >
> > Wrt wait commands: I'm honestly not sure why you'd do that. Userspace gets
> > to keep the pieces if it gets it wrong. You do still need to handle
> > external dma_fence though, hence drm/scheduler frontend to sort these out.
> >
> 
> The reason is to disallow lower-privileged process to deadlock/hang a
> higher-privileged process where the kernel can't tell who did it. If the
> implicit-sync sequence counter is read only to userspace and only
> incrementable by the unlock-signal command after the lock-wait command
> appeared in the same queue (both together forming a critical section),
> userspace can't manipulate it arbitrarily and we get almost the exact same
> behavior as implicit sync has today. That means any implicitly-sync'd
> buffer from any process can be fully trusted by a compositor to signal in a
> finite time, and possibly even trusted by the kernel. The only thing that's
> different is that a malicious process can disable implicit sync for a
> buffer in all processes/kernel, but it can't hang other processes/kernel
> (it can only hang itself and the kernel will be notified). So I'm a happy
> panda now. :)

Yeah I think that's not going to work too well, and is too many piled up
hacks. Within a drm_file fd you can do whatever you feel like, since it's
just one client.

But once implicit sync kicks in I think you need to go with dma_fence and
drm/scheduler to handle the dependencies, and tdr kicking it. With the
dma_fence you do know who's the offender - you might not know why, but
that doesn't matter, you just shred the entire context and let that
userspace figure out the details.

I think trying to make memory fences work as implicit sync directly,
without wrapping them in a dma_fence and assorted guarantees, will just
not work.

And once you do wrap them in dma_fence, then all the other problems go
away: cross-driver sync, syncfiles, ... So I really don't see the benefit
of this half-way approach.

Yes there's going to be a tad bit of overhead, but that's already there in
the current model. And it can't hurt to have a bit of motivation for
compositors to switch over to userspace memory fences properly.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
