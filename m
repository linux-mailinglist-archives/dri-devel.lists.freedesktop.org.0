Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204CC391D52
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 18:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C388B6EB44;
	Wed, 26 May 2021 16:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501326EB44
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 16:53:11 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s19so2139898oic.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3epjNFpJAI4qSvjYb6WoBeZ1EtNrStOGeknzRX6lpaI=;
 b=Hm4UGr7PkjU+C/3MIIYLMuIiuMaNnE3pDUHqD92gxcBF+jq3mhS4CxW66Pb1MvK87x
 /cpAlfPNis+UJ8zlmq5CvXJypKD2U2+/QOkUyq5ZNr6am+bYmC4m2uYESZevXWi0dvn2
 wslLKsH5UPLLBx2C00+NhFgJ3OHypPmrcnORU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3epjNFpJAI4qSvjYb6WoBeZ1EtNrStOGeknzRX6lpaI=;
 b=dPovO9fFW4n0G4t9QcXOHhUYDiTWw4kuEe74AnI9saM+T4bSbBXzzJLWWHzzA0C1xi
 FjCrZQ6EmpUmiR4QoF1HNsQw9HRh9XQRbEi/K7kKfaBtYiYMX016/imptaUIjPYam2pu
 oJKfRJeCHIydV03lmrWjraJJCkDlB/op9QgZfiqtevgdJIlDl1xqpQvAVfZlfS+Rfg32
 jTw5P5ETiHhkl7SBqVGJVYoHvk8JlZVA7r0DBp4dmvuka5RWSJEvdcvdeVw4ZEzAFQpN
 9KdLzEyxguaD93whkN3rRbtsmoXFlFyiGM5BEX4MJF5SSvLBv7qQ8OuAwLWzvXAb4QN3
 EBTA==
X-Gm-Message-State: AOAM5305JuoyBgOlgyDTMv+hPEQbZkp7o9lrI2eLdbkQnoKSuoZDwKxp
 FHgbdvBXU5rYuAgCJh18leMJhINQCyKy1NEayuW3Vw==
X-Google-Smtp-Source: ABdhPJyHuypFEBWEsk/wcHic2ukd73afak6nL/hS5hXPuor0CUsm3O2v/2QVDdlGD1PNryPZVMp20ffqEEyYA8W/ch4=
X-Received: by 2002:a05:6808:1142:: with SMTP id
 u2mr2542871oiu.101.1622047990566; 
 Wed, 26 May 2021 09:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
 <CAKMK7uHqxLe_CH_cOjfy-rouYcxwg=n6AkkxprzAKnb-y_A3NQ@mail.gmail.com>
 <CAPj87rOW_633K_n4nwq2qkPt5Q5efc3BpRnzT+=Npb=agWGTew@mail.gmail.com>
 <YK5QvIJYTJ7AJZNx@phenom.ffwll.local>
 <CAPj87rMgQiwdB+fTjoMkqtpKxs6JgxWSm=jrq1Oen0dKiFqSog@mail.gmail.com>
In-Reply-To: <CAPj87rMgQiwdB+fTjoMkqtpKxs6JgxWSm=jrq1Oen0dKiFqSog@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 May 2021 18:52:59 +0200
Message-ID: <CAKMK7uH9CLw5=-AYRjtMdFA0etjSMEng3UhoACunBq0Uqq+v6Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 5:13 PM Daniel Stone <daniel@fooishbar.org> wrote:
> On Wed, 26 May 2021 at 14:44, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, May 26, 2021 at 02:08:19PM +0100, Daniel Stone wrote:
> > > Are you saying that if a compositor imports a client-provided dmabuf
> > > as an EGLImage to use as a source texture for its rendering, and then
> > > provides it to VA-API or V4L2 to use as a media encode source (both
> > > purely read-only ops), that these will both serialise against each
> > > other? Like, my media decode job won't begin execution until the
> > > composition read has fully retired?
> > >
> > > If so, a) good lord that hurts, and b) what are shared fences actually ... for?
> >
> > Shared is shared, I just meant to say that we always add the shared fence.
> > So an explicit ioctl to add more shared fences is kinda pointless.
> >
> > So yeah on a good driver this will run in parallel. On a not-so-good
> > driver (which currently includes amdgpu and panfrost) this will serialize,
> > because those drivers don't have the concept of a non-exclusive fence for
> > such shared buffers (amdgpu does not sync internally, but will sync as
> > soon as it's cross-drm_file).
>
> When you say 'we always add the shared fence', add it to ... where?
> And which shared fence? (I'm going to use 'fence' below to refer to
> anything from literal sync_file to timeline-syncobj to userspace
> fence.)

In the current model, every time you submit anything to the gpu, we
create a dma_fence to track this work. This dma_fence is attached as a
shared fence to the dma_resv obj of every object in your working set.
Clarifications
you = both userspace or kernel, anything really, including fun stuff
like writing PTEs, or clearing PTEs and then flushing TLBs
working set = depends, but can be anything from "really just the
buffers the current gpu submission uses" to "everything bound into a
given gpu VM"

This is the fence I'm talking about here.

Since you can't escape this (not unless we do direct userspace submit
with userspace memory fences) and since there's no distinction of the
shared fences into "relevant for implicit sync" and "not relevant for
implicit sync" there's really not much point in adding implicit read
fences. For now at least, we might want to change this eventually.

> I'll admit that I've typed out an argument twice for always export
> from excl+shared, and always import to excl, results in oversync. And
> I keep tying myself in knots trying to do it. It's arguably slightly
> contrived, but here's my third attempt ...
>
> Vulkan Wayland client, full-flying-car-sync Wayland protocol,
> Vulkan-based compositor. Part of the contract when the server exposes
> that protocol is that it guarantees to do explicit sync in both
> directions, so the client provides a fence at QueueSubmit time and the
> server provides one back when releasing the image for return to ANI.
> Neither side ever record fences into the dma_resv because they've
> opted out by being fully explicit-aware.
>
> Now add media encode out on the side because you're streaming. The
> compositor knows this is a transition between explicit and implicit
> worlds, so it imports the client's fence into the exclusive dma_resv
> slot, which makes sense: the media encode has to sync against the
> client work, but is indifferent to the parallel compositor work. The
> shared fence is exported back out so the compositor can union the
> encode-finished fence with its composition-finished fence to send back
> to the client with release/ANI.
>
> Now add a second media encode because you want a higher-quality local
> capture to upload to YouTube later on. The compositor can do the exact
> same import/export dance, and the two encodes can safely run in
> parallel. Which is good.

So the example which works is really clear ...

> Where it starts to become complex is: what if your compositor is fully
> explicit-aware but your clients aren't, so your compositor has more
> import/export points to record into the resv? What if you aren't
> actually a compositor but a full-blown media pipeline, where you have
> a bunch of threads all launching reads in parallel, to the extent
> where it's not practical to manage implicit/explicit transitions
> globally, but each thread has to more pessimistically import and
> export around each access?

... but the example where we oversync is hand-waving?

:-P

> I can make the relatively simple usecases work, but it really feels
> like in practice we'll end up with massive oversync in some fairly
> complex usecases, and we'll regret not having had it from the start,
> plus people will just rely on implicit sync for longer because it has
> better (more parallel) semantics in some usecases.

Things fall apart in implicit sync if you have more than one logical
writer into the same buffer. Trivial example is two images in one
buffer, but you could also do funky stuff like interleaved/tiled
rendering with _indepedent_ consumers. If the consumers are not
independent, then you can again just stuff the two writer fences into
the exclusive slot with the new ioctl (they'll get merged without
additional overhead into one fence array fence).

And the fundamental thing is: This is just not possible with implicit
sync. There's only one fence slot (even if that resolves to an array
of fences for all the producers), so anytime you do multiple
independent things in the same buffer you either:
- must split the buffers so there's again a clear&unique handoff at
each stage of the pipeline
- or use explicit sync

So in your example, options are
- per-client buffers, which you then blend into a composite buffer to
handle the N implicit fences from N buffers into a single implicit
fence for libva conversion. This single buffer then also allows you to
again fan out to M libva encoders, or whatever it is that you fancy
- explicit fencing and clients render into a single buffer with no
copying, and libva encodes from that single buffer (but again needs
explicit fences or it all comes crashing down)

There's really no option C where you somehow do multiple implicitly
fenced things into a single buffer and expect it to work out in
parallel.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
