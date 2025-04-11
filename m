Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44502A85C65
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859E910EB81;
	Fri, 11 Apr 2025 12:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fSddQI+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B6D10EB82
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 12:01:21 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so1548595f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1744372879; x=1744977679; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nUdrEJs6eydnOum3lwi1YAf3frPD/LwUuf6Wyo+tFwI=;
 b=fSddQI+43d0Fb93xWlMw21lqFqZH56q1vrCmCS0URuCGUgg0rzW3fjs3HdDM5n8eNy
 nC6wE2PM6VKda6lpQ9Ss8+WT5JVGQM76akF4J0++QHatRbUh/smkKEKrg6dXg0NKP0EN
 1Rkw6H30lBlKLBquc+efHrqzdrjDkI8GJGh2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744372879; x=1744977679;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nUdrEJs6eydnOum3lwi1YAf3frPD/LwUuf6Wyo+tFwI=;
 b=tREOpqdJVpnnKpGZSLIj9DcXj3aKawBhO9OZfNfFHbpDTdRtShzHza6mS+gYVKX1Ju
 k+lFAr1E2VCMUJiyQgvlap9sQNacZ6SR9bpZ3Jxsx2t7WwAz8SFx8gkOq0E5RXev5Tgh
 o5k4VzBqp+AGl1XDW+v4hvF/Gx9ClG+O0GuBR2vuR0CkkM2vSeVFCFmbEQeHOYyU99qw
 pSf9QrpuPMyyf5BY17iy9EUGolSf7RTcQBhyDe0Jik8FY/zg1addpMZrU3NR6hZvva4O
 OUk3QxY9KKYWmh/IYPcyaBJh4V2IdisfZJPT9bSEd322ItxpOBeFR5cNcLTeHI3NayFj
 MQVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDk3AFLGbil5Xv/uioAdRk8/pIsaLJLBw/U/mjC1NqxnD0EW+bAB8qRJlzL19yKOU38Z/+ilYhmys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9XSEjpEjLzcNOC2SroDAbuIvvkJldCsarP+b4n+xzIKbH4aIm
 LGgQOVSv2xiPowAEfF5mtlvpCqdsUz0lpPKVbxfGfdl6JHfiP1vUnrz+P0kcQEs=
X-Gm-Gg: ASbGncuEj9ROkkz3K4cgdTAGZYjpms8Y226CW+JW2jKREIpLpogaCSToq7PXIWcmo44
 zUtDVQaWmbydi27X91qvM03oG5FsmGQ8VjnqcEMwjM/MFEFBKIPiywR+hXuEDqLK7RhsDsA2Lwd
 OMbOBUpQ2hEVf3bRkJi8I/ul4LeHnutaTIn7Y3c0y71pJkewq2hme9HdwUTfROrMwiEpWp3vylv
 Quo8UlsZNT7BANEyc4zk+YgbWhXNPHZgtxoRswYeW+z0hsigFs7RGeRiaVE23YNjFtU3XIbefxF
 AIc1xuxuFypiFYjcla35h/4p9R7tjeKzbshZGs3jvNxZCESIHhoE
X-Google-Smtp-Source: AGHT+IHZEbDBtV2Z6iFiUunyqYzLsnZK9hCnDUU00zMy/3aohPYEpcO+NlNNaojDB8SVWp/RCIZLrA==
X-Received: by 2002:a05:6000:1acc:b0:390:e9b5:d69c with SMTP id
 ffacd0b85a97d-39ea54fd090mr2047636f8f.25.1744372878755; 
 Fri, 11 Apr 2025 05:01:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d6ebsm85045855e9.2.2025.04.11.05.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 05:01:18 -0700 (PDT)
Date: Fri, 11 Apr 2025 14:01:16 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 kernel@collabora.com, Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <Z_kEjFjmsumfmbfM@phenom.ffwll.local>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410204155.55d5cfc7@collabora.com>
X-Operating-System: Linux phenom 6.12.17-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 10, 2025 at 08:41:55PM +0200, Boris Brezillon wrote:
> On Thu, 10 Apr 2025 14:01:03 -0400
> Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> 
> > > > > In Panfrost and Lima, we don't have this concept of "incremental
> > > > > rendering", so when we fail the allocation, we just fail the GPU job
> > > > > with an unhandled GPU fault.    
> > > > 
> > > > To be honest I think that this is enough to mark those two drivers as
> > > > broken.  It's documented that this approach is a no-go for upstream
> > > > drivers.
> > > > 
> > > > How widely is that used?  
> > > 
> > > It exists in lima and panfrost, and I wouldn't be surprised if a similar
> > > mechanism was used in other drivers for tiler-based GPUs (etnaviv,
> > > freedreno, powervr, ...), because ultimately that's how tilers work:
> > > the amount of memory needed to store per-tile primitives (and metadata)
> > > depends on what the geometry pipeline feeds the tiler with, and that
> > > can't be predicted. If you over-provision, that's memory the system won't
> > > be able to use while rendering takes place, even though only a small
> > > portion might actually be used by the GPU. If your allocation is too
> > > small, it will either trigger a GPU fault (for HW not supporting an
> > > "incremental rendering" mode) or under-perform (because flushing
> > > primitives has a huge cost on tilers).  
> > 
> > Yes and no.
> > 
> > Although we can't allocate more memory for /this/ frame, we know the
> > required size is probably constant across its lifetime. That gives a
> > simple heuristic to manage the tiler heap efficiently without
> > allocations - even fallible ones - in the fence signal path:
> > 
> > * Start with a small fixed size tiler heap
> > * Try to render, let incremental rendering kick in when it's too small.
> > * When cleaning up the job, check if we used incremental rendering.
> > * If we did - double the size of the heap the next time we submit work.
> > 
> > The tiler heap still grows dynamically - it just does so over the span
> > of a couple frames. In practice that means a tiny hit to startup time as
> > we dynamically figure out the right size, incurring extra flushing at
> > the start, without needing any "grow-on-page-fault" heroics.
> > 
> > This should solve the problem completely for CSF/panthor. So it's only
> > hardware that architecturally cannot do incremental rendering (older
> > Mali: panfrost/lima) where we need this mess.
> 
> OTOH, if we need something
> for Utgard(Lima)/Midgard/Bifrost/Valhall(Panfrost), why not use the same
> thing for CSF, since CSF is arguably the sanest of all the HW
> architectures listed above: allocation can fail/be non-blocking,
> because there's a fallback to incremental rendering when it fails.

So this is a really horrible idea to sort this out for panfrost hardware,
which doesn't have a tiler cache flush as a fallback. It's roughly three
stages:

1. A pile of clever tricks to make the chances of running out of memory
really low. Most of these also make sense for panthor platforms, just as a
performance optimization.

2. I terrible way to handle the unavoidable VK_DEVICE_LOST, but in a way
such that the impact should be minimal. This is nasty, and we really want
to avoid that for panthor.

3. Mesa quirks so that 2 doesn't actually ever happen in practice.

1. Clever tricks
----------------

This is a cascade of tricks we can pull in the gpu fault handler:

1a. Allocate with GFP_NORECLAIM. We want this first because that triggers
  background reclaim, and that might be enough to get us through and free
  some easy caches (like clean fs cache and stuff like that which can just
  be dropped).

1b Userspace needs to guesstimate a good guess for how much we'll need. I'm
  hoping that between render target size and maybe counting the total
  amounts of vertices we can do a decent guesstimate for many workloads.
  Note that goal here is not to ensure success, but just to get the rough
  ballpark. The actual starting number here should aim fairly low, so that
  we avoid wasting memory since this is memory wasted on every context
  (that uses a feature which needs dynamic memory allocation, which I
  guess for pan* is everything, but for apple it would be more limited).

1c The kernel then keeps an additional global memory pool. Note this would
  not have the same semantics as mempool.h, which is aimed GFP_NOIO
  forward progress guarantees, but more as a preallocation pool. In every
  CS ioctl we'll make sure the pool is filled, and we probably want to
  size the pool relative to the context with the biggest dynamic memory
  usage. So probably this thing needs a shrinker, so we can reclaim it
  when you don't run an app with a huge buffer need on the gpu anymore.

  Note that we're still not sizing this to guarantee success, but together
  with the userspace heuristics it should be big enough to almost always
  work out. And since it's global reserve we can afford to waste a bit
  more memory on this one. We might also want to scale this pool by the
  total memory available, like the watermarks core mm computes. We'll only
  hang onto this memory when the gpu is in active usage, so this should be
  fine.

  Also the preallocation would need to happen without holding the memory
  pool look, so that we can use GFP_KERNEL.

Up to this point I think it's all tricks that panthor also wants to
employ.

1d Next up is scratch dynamic memory. If we can assume that the memory does
  not need to survive a batchbuffer (hopefully the case with vulkan render
  pass) we could steal such memory from other contexts. We could even do
  that for contexts which are queued but not yet running on the hardware
  (might need unloading them to be doable with fw renderers like
  panthor/CSF) as long as we keep such stolen dynamic memory on a separate
  free list. Because if we'd entirely free this, or release it into the
  memory pool we'll make things worse for these other contexts, we need to
  be able to guarantee that any context can always get all the stolen
  dynamic pages back before we start running it on the gpu.

Since the tracking for the memory pool in 1c and the stolen memory in 1d
has a bunch of tricky corner cases we probably want that as a drm helper
which globally does that book-keeping for all drm/sched instances. That
might even help if some NN accel thing also needs this on the same SoC.

1e Finally, if all else is lost we can try GFP_ATOMIC. This will eat into
  reserve memory pools the core mm maintains. And hopefully we've spent
  enough time between this step and the initial GFP_NORECLAIM that
  background reclaim had a chance to free some memory, hence why all the
  memory pool and memory stealing tricks should be in between.

The above will need quite some tuning to make sure it works as often as
possible, without wasting undue amounts of memory. It's classic memory
overcommit tuning.

2. Device Lost
--------------

At this point we're left with no other choice than to kill the context.
And userspace should be able to cope with VK_DEVICE_LOST (hopefully zink
does), but it will probably not cope well with an entire strom of these
just to get the first frame out.

Here comes the horrible trick:

We'll keep rendering the entire frame by just smashing one single reserve
page (per context) into the pte every time there's a fault. It will result
in total garbage, and we probably want to shot the context the moment the
VS stages have finished, but it allows us to collect an accurate estimate
of how much memory we'd have needed. We need to pass that to the vulkan
driver as part of the device lost processing, so that it can keep that as
the starting point for the userspace dynamic memory requirement
guesstimate as a lower bound. Together with the (scaled to that
requirement) gpu driver memory pool and the core mm watermarks, that
should allow us to not hit a device lost again hopefully.

I think if the CS ioctl both takes the current guesstimate from userspace,
and passes back whatever the current maximum known to the kernel is (we
need that anyway for the steps in stage 1 to make sense I think), then
that should also work for dead context where the CS ioctl returns -EIO or
something like that.

3. Mesa quirks
--------------

A database of the fixed dynamic memory requirements we get from step 2
(through bug reports), so that we can avoid that mess going forward.

If there's too many of those, we'll probably need to improve the
guesstimation 1b if it's systematically off by too much. We might even
need to store that on-disk, like shader caches, so that you get a crash
once and then it should work even without an explicit mesa quirk.

Documentation
-------------

Assuming this is not too terrible an idea and we reach some consensus, I
think it'd be good to bake this into a doc patch somewhere in the
dma_fence documentation. Also including Alyssa recipe for when you have
hardware support for flushing partial rendering. And maybe generalized so
it makes sense for the GS/streamout/... fun on apple hardware.

And perhaps with a section added that points to actual code to help make
this happen like the sparse bo support in this series.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
