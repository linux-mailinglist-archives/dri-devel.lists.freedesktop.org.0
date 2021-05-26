Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C7391E90
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 20:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592DA6E525;
	Wed, 26 May 2021 18:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF866E525
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 18:01:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g17so1825293wrs.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FkMEOt+2xLE860SyazsKg7PFSFQV4AtgbIsBcvpZYLk=;
 b=dJAR0/A0LdLcCQngGhW/zWg4bOpi+LQeQohW2W7zdM2t+MGpxHlERflqSTC4bN0ueq
 8WQIgaC+LuyGKSwKxl3ng8DBz4KSyhdzFpU2Q7yxvrb8uAstWO2y32rXgQ/mWCSRQH8O
 lbNHT7Fo1phExh5LMzVR81MT89OPEuEwU8ixU+BWCiZKUvFEZrdj4f3LqCUvMQpbgse1
 /a8tczhs+pxB1CdtyJlKrEir6Z9nt7ONAurQypcRkq+na9sszs4OVbq4DXvaE0W+szK5
 0i0UQz0y21srYrcZY0HqiMF3yF8wlP0bsuB7tN3aI5wcJn4oIV8PdfmfUE3NZqGSWWJ7
 b4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FkMEOt+2xLE860SyazsKg7PFSFQV4AtgbIsBcvpZYLk=;
 b=Nwi/eykelXUpBvYouT6IqNYRNj7igxq8PiRqo6p7kFuOLEtTRbjzEgt3qy2e2a5lUK
 OyTJGwGddbBRi/Iva0MB00B7n+/AgZ8LV6C1clukt6DbG5WgE/dcCi+eFJCV+BSX4B3M
 +ghBPy5GslA8/H0UHkB8GbFhwvrh4gWkBBGZNoGwbaee231p3Lkjp43a7Zc+qlyz7wOk
 DvYCzMGpe024JOccsv2GQKm0jDml/61SuAdcdMRojEo935j1hxOufAi0hDtOH+XVv8Ar
 nO+TgSyLfeeWdj9I6T7wWxRYmzbdKC7FJ+ewLiDEJETwRmtroE7di/xkYsbm2H6YU8mo
 JzEw==
X-Gm-Message-State: AOAM5333YmTtpV/AZUA/XeSk7YeSv6Q4crg9vcXaPwRRTxVykhtrSuQc
 SQ3VkuUmTZSKrkyd5KkfzSFL9+AkGx+I+4g+tlXqAw==
X-Google-Smtp-Source: ABdhPJy90ekYnxmp4VhEXM/sFSHh/XY7tufR5VKxwrD8zfSGcKro0Y2OttAqz7BiwLofGbCzYOG6BfGXqhsDEZANfT4=
X-Received: by 2002:adf:a404:: with SMTP id d4mr18419787wra.373.1622052078784; 
 Wed, 26 May 2021 11:01:18 -0700 (PDT)
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
 <CAKMK7uH9CLw5=-AYRjtMdFA0etjSMEng3UhoACunBq0Uqq+v6Q@mail.gmail.com>
In-Reply-To: <CAKMK7uH9CLw5=-AYRjtMdFA0etjSMEng3UhoACunBq0Uqq+v6Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 May 2021 19:01:07 +0100
Message-ID: <CAPj87rOpCkpSbAzaPDtJ1kkDNW89g_5V3LSy-LUb6rYL9w_Vmg@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Daniel Vetter <daniel@ffwll.ch>
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

Hey,

On Wed, 26 May 2021 at 17:53, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, May 26, 2021 at 5:13 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > > Shared is shared, I just meant to say that we always add the shared fence.
> > > So an explicit ioctl to add more shared fences is kinda pointless.
> > >
> > > So yeah on a good driver this will run in parallel. On a not-so-good
> > > driver (which currently includes amdgpu and panfrost) this will serialize,
> > > because those drivers don't have the concept of a non-exclusive fence for
> > > such shared buffers (amdgpu does not sync internally, but will sync as
> > > soon as it's cross-drm_file).
> >
> > When you say 'we always add the shared fence', add it to ... where?
> > And which shared fence? (I'm going to use 'fence' below to refer to
> > anything from literal sync_file to timeline-syncobj to userspace
> > fence.)
>
> In the current model, every time you submit anything to the gpu, we
> create a dma_fence to track this work. This dma_fence is attached as a
> shared fence to the dma_resv obj of every object in your working set.
> Clarifications
> you = both userspace or kernel, anything really, including fun stuff
> like writing PTEs, or clearing PTEs and then flushing TLBs
> working set = depends, but can be anything from "really just the
> buffers the current gpu submission uses" to "everything bound into a
> given gpu VM"
>
> This is the fence I'm talking about here.
>
> Since you can't escape this (not unless we do direct userspace submit
> with userspace memory fences) and since there's no distinction of the
> shared fences into "relevant for implicit sync" and "not relevant for
> implicit sync" there's really not much point in adding implicit read
> fences. For now at least, we might want to change this eventually.

Yeah, I agree. My own clarification is that I'm talking about an
explicit-first world, where synchronisation is done primarily through
unknowable UMF, and falling back to implicit sync is a painful and
expensive operation that we only do when we need to. So, definitely
not on every CS (command submission aka execbuf aka vkQueueSubmit aka
glFlush).

> > I'll admit that I've typed out an argument twice for always export
> > from excl+shared, and always import to excl, results in oversync. And
> > I keep tying myself in knots trying to do it. It's arguably slightly
> > contrived, but here's my third attempt ...
> >
> > Vulkan Wayland client, full-flying-car-sync Wayland protocol,
> > Vulkan-based compositor. Part of the contract when the server exposes
> > that protocol is that it guarantees to do explicit sync in both
> > directions, so the client provides a fence at QueueSubmit time and the
> > server provides one back when releasing the image for return to ANI.
> > Neither side ever record fences into the dma_resv because they've
> > opted out by being fully explicit-aware.
> >
> > Now add media encode out on the side because you're streaming. The
> > compositor knows this is a transition between explicit and implicit
> > worlds, so it imports the client's fence into the exclusive dma_resv
> > slot, which makes sense: the media encode has to sync against the
> > client work, but is indifferent to the parallel compositor work. The
> > shared fence is exported back out so the compositor can union the
> > encode-finished fence with its composition-finished fence to send back
> > to the client with release/ANI.
> >
> > Now add a second media encode because you want a higher-quality local
> > capture to upload to YouTube later on. The compositor can do the exact
> > same import/export dance, and the two encodes can safely run in
> > parallel. Which is good.
>
> So the example which works is really clear ...
>
> > Where it starts to become complex is: what if your compositor is fully
> > explicit-aware but your clients aren't, so your compositor has more
> > import/export points to record into the resv? What if you aren't
> > actually a compositor but a full-blown media pipeline, where you have
> > a bunch of threads all launching reads in parallel, to the extent
> > where it's not practical to manage implicit/explicit transitions
> > globally, but each thread has to more pessimistically import and
> > export around each access?
>
> ... but the example where we oversync is hand-waving?
>
> :-P

Hey, I said I tied myself into knots! Maybe it's because my brain is
too deeply baked into implicit sync, maybe it's because the problem
cases aren't actually problems. Who knows.

I think what it comes down to is that we make it workable for (at
least current-generation, before someone bakes it into Unity) Wayland
compositors to work well with these modal switches, but really
difficult for more complex and variable pipeline frameworks like
GStreamer or PipeWire to work with it.

> > I can make the relatively simple usecases work, but it really feels
> > like in practice we'll end up with massive oversync in some fairly
> > complex usecases, and we'll regret not having had it from the start,
> > plus people will just rely on implicit sync for longer because it has
> > better (more parallel) semantics in some usecases.
>
> Things fall apart in implicit sync if you have more than one logical
> writer into the same buffer. Trivial example is two images in one
> buffer, but you could also do funky stuff like interleaved/tiled
> rendering with _indepedent_ consumers. If the consumers are not
> independent, then you can again just stuff the two writer fences into
> the exclusive slot with the new ioctl (they'll get merged without
> additional overhead into one fence array fence).
>
> And the fundamental thing is: This is just not possible with implicit
> sync. There's only one fence slot (even if that resolves to an array
> of fences for all the producers), so anytime you do multiple
> independent things in the same buffer you either:
> - must split the buffers so there's again a clear&unique handoff at
> each stage of the pipeline
> - or use explicit sync

Yeah no argument, this doesn't work & can't work in implicit sync.

But what I'm talking about is having a single writer (serialised) and
multiple readers (in parallel). Readers add to the shared slot,
serialising their access against all earlier exclusive fences, and
writers add to the exclusive slot, serialising their access against
all earlier fences (both exclusive and shared).

So if import can only add to the exclusive slot, then we can end up
potentially serialising readers against each other. We want readers to
land in the shared slot to be able to parallelise against each other
and let writers serialise after them, no?

> So in your example, options are
> - per-client buffers, which you then blend into a composite buffer to
> handle the N implicit fences from N buffers into a single implicit
> fence for libva conversion. This single buffer then also allows you to
> again fan out to M libva encoders, or whatever it is that you fancy
> - explicit fencing and clients render into a single buffer with no
> copying, and libva encodes from that single buffer (but again needs
> explicit fences or it all comes crashing down)
>
> There's really no option C where you somehow do multiple implicitly
> fenced things into a single buffer and expect it to work out in
> parallel.

All of my examples above are a single client buffer (GPU source which
places a fence into the exclusive slot for when the colour buffer
contents are fully realised), just working its way through multiple
stages and APIs. Like, your single Dota2 window ends up in a
Vulkan-based Wayland compositor, a pure VA-API encode stream to write
high-quality AV1 to disk, and also an EGL pipeline which overlays your
awesome logo and webcam stream before VA-API encoding to a
lower-quality H.264 stream for Twitch. This isn't a convoluted
example, it's literally what the non-geriatric millennials do all day.
It's a lot of potential boundaries between implicit & explicit world,
and if we've learned one thing from modifiers it's that we probably
shouldn't underthink the boundaries.

So:

1. Does every CS generate the appropriate resv entries (exclusive for
write, shared for read) for every access to every buffer? I think the
answer has to be no, because it's not necessarily viable in future.
2. If every CS doesn't generate the appropriate resv entries, do we go
for the middle ground where we keep interactions with implicit sync
implicit (e.g. every client API accessing any externally-visible BO
populates the appropriate resv slot, but internal-only buffers get to
skip it), or do we surface them and make it explicit (e.g. the Wayland
explicit-sync protocol is a contract between client/compositor that
the client doesn't have to populate the resv slots, because the
compositor will ensure every access it makes is appropriate
synchronised)? I think the latter, because the halfway house sounds
really painful for questionable if any benefit, and makes it maybe
impossible for us to one day deprecate implicit.
3. If we do surface everything and make userspace handle the
implicit/explicit boundaries, do we make every explicit -> implicit
boundary (via the import ioctl) populate the exclusive slot or allow
it to choose? I think allow it to choose, because I don't understand
what the restriction buys us.
4. Can the combination of dynamic modifier negotiation and explicit
synchronisation let us deliver the EGLStreams promise before
EGLStreams can? :)

Cheers,
Daniel
