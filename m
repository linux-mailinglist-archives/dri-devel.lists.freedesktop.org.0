Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD9A8858A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FAD10E5FC;
	Mon, 14 Apr 2025 14:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jRRFGXze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25C910E5FF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:46:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so3713375f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1744641970; x=1745246770; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=no5bFvSIqMVkjo+Bq+SAmUA40zgN0uwtUksiETOS5uE=;
 b=jRRFGXzeyVcsxAhs+5sYm2VA2FnTaClKpM2kOJUMSQfrm7UIeWEHA9W+wi/Sind9Jj
 K0u0jL1h5dx1xk+8ITXZGV7rRFbDprJs9deYLDXTSfk/ernaG5PquSbiTgR26z6sOHw3
 Vj2h1d6ntsJeU7y6wzoa+rvIcMnQ/CKm1LlVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744641970; x=1745246770;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=no5bFvSIqMVkjo+Bq+SAmUA40zgN0uwtUksiETOS5uE=;
 b=mDFM73vS7LgWx17DYWM58y20AtQM/qFkwDFX+jiVpBlk/8gPHHv15w41+Tk44hNLRM
 mxZ2nm9DkeMQPZ77B/sO/DBlzgh7+Vey3mtmrs/U7CWKnLOxecivlap1ecji3TwIcK6h
 e2nq6rUxD8H5EzE0kX6AeWtGMFMdpDUO6T6pLKuLocpy3lJKsOeiyOycSNcDNYTPViA3
 T2gm2/ZTxqvxqWIeX4Z71gQZT6HeA37IA91EeQdF12OCL/kDHsYD8BJQF5t1Ek8QYTcx
 uxY+JJfURkpl5Ofm01qOBiwjq/mGWxhUfqslzq2MSCQsTGBdG9NvfDcgnTzEvJl/BMuH
 8PGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVCqBVG7fdsL4xZCWTI/JA0zVB/V1htIKGth+BvkgpaE/36K5ws6FdBQ5O6ottRIaDXWBqQzTQFzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzViYbutbQLZM4HuF7dNkgEZ4AYQndPFNkSXcqspD8qYwKdqqIc
 ZLmLYlNm456aLqkpVNXBfQoSsg2dwwD//ER3H7bUx/LWc0EuI/gQxt8VGZKDeQQ=
X-Gm-Gg: ASbGncvxza6gIpAV/3CTBI2kb1+WSqn4djpGfqsLwnI5wB+oeYLfR/gpPxumf+l4yL4
 x4pYyhNJh3V+LmoNC1SkO3CcvIX2TtbuEdtwyw+Nm9GnlZ+f6m3HYG1UTC8sYv2h99n7Wce09rC
 WLv1SjoUyY9AUwPkJjoiDoYoily4T3MQZGb/Rwlm2EcSD59rOWZFW9No/tRJUgclrjJ4tu9juzP
 ImeoMvSemBLfe6NDCoT+CWaNm2w2GW8Za5SyoiEg0Ym5BrFt90Xw/pXz6GAgF3ysHS1jJ4uzlAX
 yxnJiH6UrzR9giyhQ1CHTY84jz8rPGeUbp8T4ySuJM6bjhAqkjdX2lB1mCeBYHo=
X-Google-Smtp-Source: AGHT+IGBuRbs1JxvYRDksTatB5k2XOGcQQQ+3orkSFQep/YLfAqpbMzOBLan6DFGWcqPa2RCLv30hQ==
X-Received: by 2002:a05:6000:2507:b0:390:e311:a8c7 with SMTP id
 ffacd0b85a97d-39ea51ecbecmr10388936f8f.5.1744641969288; 
 Mon, 14 Apr 2025 07:46:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c074sm10989059f8f.28.2025.04.14.07.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 07:46:08 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:46:06 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
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
Message-ID: <Z_0froKML_SsL2_Z@phenom.ffwll.local>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <Z_kEjFjmsumfmbfM@phenom.ffwll.local>
 <20250414132206.728eacb3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414132206.728eacb3@collabora.com>
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

On Mon, Apr 14, 2025 at 01:22:06PM +0200, Boris Brezillon wrote:
> Hi Sima,
> 
> On Fri, 11 Apr 2025 14:01:16 +0200
> Simona Vetter <simona.vetter@ffwll.ch> wrote:
> 
> > On Thu, Apr 10, 2025 at 08:41:55PM +0200, Boris Brezillon wrote:
> > > On Thu, 10 Apr 2025 14:01:03 -0400
> > > Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> > >   
> > > > > > > In Panfrost and Lima, we don't have this concept of "incremental
> > > > > > > rendering", so when we fail the allocation, we just fail the GPU job
> > > > > > > with an unhandled GPU fault.      
> > > > > > 
> > > > > > To be honest I think that this is enough to mark those two drivers as
> > > > > > broken.  It's documented that this approach is a no-go for upstream
> > > > > > drivers.
> > > > > > 
> > > > > > How widely is that used?    
> > > > > 
> > > > > It exists in lima and panfrost, and I wouldn't be surprised if a similar
> > > > > mechanism was used in other drivers for tiler-based GPUs (etnaviv,
> > > > > freedreno, powervr, ...), because ultimately that's how tilers work:
> > > > > the amount of memory needed to store per-tile primitives (and metadata)
> > > > > depends on what the geometry pipeline feeds the tiler with, and that
> > > > > can't be predicted. If you over-provision, that's memory the system won't
> > > > > be able to use while rendering takes place, even though only a small
> > > > > portion might actually be used by the GPU. If your allocation is too
> > > > > small, it will either trigger a GPU fault (for HW not supporting an
> > > > > "incremental rendering" mode) or under-perform (because flushing
> > > > > primitives has a huge cost on tilers).    
> > > > 
> > > > Yes and no.
> > > > 
> > > > Although we can't allocate more memory for /this/ frame, we know the
> > > > required size is probably constant across its lifetime. That gives a
> > > > simple heuristic to manage the tiler heap efficiently without
> > > > allocations - even fallible ones - in the fence signal path:
> > > > 
> > > > * Start with a small fixed size tiler heap
> > > > * Try to render, let incremental rendering kick in when it's too small.
> > > > * When cleaning up the job, check if we used incremental rendering.
> > > > * If we did - double the size of the heap the next time we submit work.
> > > > 
> > > > The tiler heap still grows dynamically - it just does so over the span
> > > > of a couple frames. In practice that means a tiny hit to startup time as
> > > > we dynamically figure out the right size, incurring extra flushing at
> > > > the start, without needing any "grow-on-page-fault" heroics.
> > > > 
> > > > This should solve the problem completely for CSF/panthor. So it's only
> > > > hardware that architecturally cannot do incremental rendering (older
> > > > Mali: panfrost/lima) where we need this mess.  
> > > 
> > > OTOH, if we need something
> > > for Utgard(Lima)/Midgard/Bifrost/Valhall(Panfrost), why not use the same
> > > thing for CSF, since CSF is arguably the sanest of all the HW
> > > architectures listed above: allocation can fail/be non-blocking,
> > > because there's a fallback to incremental rendering when it fails.  
> > 
> > So this is a really horrible idea to sort this out for panfrost hardware,
> > which doesn't have a tiler cache flush as a fallback. It's roughly three
> > stages:
> > 
> > 1. A pile of clever tricks to make the chances of running out of memory
> > really low. Most of these also make sense for panthor platforms, just as a
> > performance optimization.
> > 
> > 2. I terrible way to handle the unavoidable VK_DEVICE_LOST, but in a way
> > such that the impact should be minimal. This is nasty, and we really want
> > to avoid that for panthor.
> > 
> > 3. Mesa quirks so that 2 doesn't actually ever happen in practice.
> > 
> > 1. Clever tricks
> > ----------------
> > 
> > This is a cascade of tricks we can pull in the gpu fault handler:
> > 
> > 1a. Allocate with GFP_NORECLAIM. We want this first because that triggers
> >   background reclaim, and that might be enough to get us through and free
> >   some easy caches (like clean fs cache and stuff like that which can just
> >   be dropped).
> 
> There's no GFP_NORECLAIM, and given the discussions we had before, I
> guess you meant GFP_NOWAIT. Otherwise it's the __GFP_NOWARN |
> __GFP_NORETRY I used in this series, and it probably doesn't try hard
> enough as pointed out by you and Christian.

Yeah it's GFP_NOWAIT. What I mean with GFP_NORECLAIM is
!GFP_DIRECT_RECLAIM, which is the nasty one that's not allowed in
dma_fence signalling critical paths.

> > 1b Userspace needs to guesstimate a good guess for how much we'll need. I'm
> >   hoping that between render target size and maybe counting the total
> >   amounts of vertices we can do a decent guesstimate for many workloads.
> 
> There are extra parameters to take into account, like the tile
> hierarchy mask (number of binning lists instantiated) and probably
> other things I forget, but for simple vertex+fragment pipelines and
> direct draws, guessing the worst memory usage case is probably doable.
> Throw indirect draws into the mix, and it suddenly becomes a lot more
> complicated. Not even talking about GEOM/TESS stages, which makes the
> guessing even harder AFAICT.

The point here is not to make a pessimistic guess, but one that's roughly
a good ballpark for most games/workloads, so that we don't eat too much
into the various emergency watermarks.

> >   Note that goal here is not to ensure success, but just to get the rough
> >   ballpark. The actual starting number here should aim fairly low, so that
> >   we avoid wasting memory since this is memory wasted on every context
> >   (that uses a feature which needs dynamic memory allocation, which I
> >   guess for pan* is everything, but for apple it would be more limited).
> 
> Ack.
> 
> > 
> > 1c The kernel then keeps an additional global memory pool. Note this would
> >   not have the same semantics as mempool.h, which is aimed GFP_NOIO
> >   forward progress guarantees, but more as a preallocation pool. In every
> >   CS ioctl we'll make sure the pool is filled, and we probably want to
> >   size the pool relative to the context with the biggest dynamic memory
> >   usage. So probably this thing needs a shrinker, so we can reclaim it
> >   when you don't run an app with a huge buffer need on the gpu anymore.
> 
> Okay, that's a technique Arm has been using in their downstream driver
> (it named JIT-allocation there).
> 
> > 
> >   Note that we're still not sizing this to guarantee success, but together
> >   with the userspace heuristics it should be big enough to almost always
> >   work out. And since it's global reserve we can afford to waste a bit
> >   more memory on this one. We might also want to scale this pool by the
> >   total memory available, like the watermarks core mm computes. We'll only
> >   hang onto this memory when the gpu is in active usage, so this should be
> >   fine.
> 
> Sounds like a good idea.
> 
> > 
> >   Also the preallocation would need to happen without holding the memory
> >   pool look, so that we can use GFP_KERNEL.
> > 
> > Up to this point I think it's all tricks that panthor also wants to
> > employ.
> > 
> > 1d Next up is scratch dynamic memory. If we can assume that the memory does
> >   not need to survive a batchbuffer (hopefully the case with vulkan render
> >   pass) we could steal such memory from other contexts. We could even do
> >   that for contexts which are queued but not yet running on the hardware
> >   (might need unloading them to be doable with fw renderers like
> >   panthor/CSF) as long as we keep such stolen dynamic memory on a separate
> >   free list. Because if we'd entirely free this, or release it into the
> >   memory pool we'll make things worse for these other contexts, we need to
> >   be able to guarantee that any context can always get all the stolen
> >   dynamic pages back before we start running it on the gpu.
> 
> Actually, CSF stands in the way of re-allocating memory to other
> contexts, because once we've allocated memory to a tiler heap, the FW
> manages this pool of chunks, and recycles them. Mesa can intercept
> the "returned chunks" and collect those chunks instead of re-assiging
> then to the tiler heap through a CS instruction (which goes thought
> the FW internallu), but that involves extra collaboration between the
> UMD, KMD and FW which we don't have at the moment. Not saying never,
> but I'd rather fix things gradually (first the blocking alloc in the
> fence-signalling path, then the optimization to share the extra mem
> reservation cost among contexts by returning the chunks to the global
> kernel pool rather than directly to the heap).
> 
> This approach should work fine with JM GPUs where the tiler heap is
> entirely managed by the KMD though.

Yeah stealing scratch memory is probably way too expensive if you can just
flush. And if the fw already does that, there's no point. But for hw where
you cannot flush it might just be enough to get you out of a bind.

> > Since the tracking for the memory pool in 1c and the stolen memory in 1d
> > has a bunch of tricky corner cases we probably want that as a drm helper
> > which globally does that book-keeping for all drm/sched instances. That
> > might even help if some NN accel thing also needs this on the same SoC.
> 
> Yeah, I think whatever we go for here should be exposed as generic
> helpers with proper documentation to explain when and how to use those,
> because otherwise we're back to the original situation where each
> driver copies the pattern of another driver and adjust it to its needs,
> even when the original design was unsound.
> 
> > 
> > 1e Finally, if all else is lost we can try GFP_ATOMIC. This will eat into
> >   reserve memory pools the core mm maintains. And hopefully we've spent
> >   enough time between this step and the initial GFP_NORECLAIM that
> >   background reclaim had a chance to free some memory, hence why all the
> >   memory pool and memory stealing tricks should be in between.
> 
> Any reason not to use GFP_NOWAIT on this last attempt?
> I'm not sure I like the idea of stealing memory from the reserved
> amount of atomic mem. I mean, if we get there and there's still not
> enough memory to satisfy a "normal" allocation, it's probably a good
> time to fail with a actual OOM.

GFP_ATOMIC includes __GFP_HIGH, which allows you to dip into emergency
watermarks (meaning more memory reserves before this fails). We might
actually want GFP_ATOMIC | __GPF_NOWARN though.

If you just try once more with GFP_NOWAIT then there's not really much of
a point.

> > The above will need quite some tuning to make sure it works as often as
> > possible, without wasting undue amounts of memory. It's classic memory
> > overcommit tuning.
> > 
> > 2. Device Lost
> > --------------
> > 
> > At this point we're left with no other choice than to kill the context.
> > And userspace should be able to cope with VK_DEVICE_LOST (hopefully zink
> > does), but it will probably not cope well with an entire strom of these
> > just to get the first frame out.
> > 
> > Here comes the horrible trick:
> > 
> > We'll keep rendering the entire frame by just smashing one single reserve
> > page (per context) into the pte every time there's a fault. It will result
> > in total garbage, and we probably want to shot the context the moment the
> > VS stages have finished, but it allows us to collect an accurate estimate
> > of how much memory we'd have needed. We need to pass that to the vulkan
> > driver as part of the device lost processing, so that it can keep that as
> > the starting point for the userspace dynamic memory requirement
> > guesstimate as a lower bound. Together with the (scaled to that
> > requirement) gpu driver memory pool and the core mm watermarks, that
> > should allow us to not hit a device lost again hopefully.
> 
> If the intent is to progressively increase the size of this
> global memory pool, and the min-resident-size of the growable buffer
> that triggered the OOM, I guess we can just go for something dumb like
> double-the-size or increment-it-in-steps and flag the buffer on which
> the fault happened such that userspace can query that at DEVICE_LOST
> time and properly resize this internal buffer next time a
> CreateDevice() coming from the same process/thread is created. I'm not
> sure we need to actually execute the shader after the OOM to accurately
> guess the size.

The point is to not incrementally increase, but get it right with just one
crash. I think incrementally increasing through a DEVICE_LOST is a no-go
design. Or at least I think we should aim better.

> > I think if the CS ioctl both takes the current guesstimate from userspace,
> > and passes back whatever the current maximum known to the kernel is (we
> > need that anyway for the steps in stage 1 to make sense I think), then
> > that should also work for dead context where the CS ioctl returns -EIO or
> > something like that.
> > 
> > 3. Mesa quirks
> > --------------
> > 
> > A database of the fixed dynamic memory requirements we get from step 2
> > (through bug reports), so that we can avoid that mess going forward.
> 
> Yeah, we already have a dri-conf to force the initial size of the tiler
> heap on CSF hardware, so we could easily ship a DB of per-app initial
> size.
> 
> > 
> > If there's too many of those, we'll probably need to improve the
> > guesstimation 1b if it's systematically off by too much. We might even
> > need to store that on-disk, like shader caches, so that you get a crash
> > once and then it should work even without an explicit mesa quirk.
> 
> Makes sense. Maybe some sort of implicit dri-conf DB that overloads the
> explicit one?

Yeah, maybe something like that. And then take the maximum of both.

> > Documentation
> > -------------
> > 
> > Assuming this is not too terrible an idea and we reach some consensus, I
> > think it'd be good to bake this into a doc patch somewhere in the
> > dma_fence documentation. Also including Alyssa recipe for when you have
> > hardware support for flushing partial rendering. And maybe generalized so
> > it makes sense for the GS/streamout/... fun on apple hardware.
> 
> I think the tricky part is properly guessing the amount of memory
> needed for a draw. For simple vertex+fragment pipelines with direct
> draws, that's doable, but for more complex stuff like GEOM/TESS and
> indirect draws, that gets tricky, because some of the parameters are
> not known at CS recording time. So my gut feeling is that, rather than
> trying to find a smart way to guesstimate those stuff, we should rely
> on simple heuristics like the
> double-the-resident-size-on-the-faulty-sparse-GEM thing suggested by
> Alyssa.

The point is to not correctly guess, but guess at 80/99% confidence
intervals. Memory overcommit is a statistical game, not a correctness
game. So for the guesstimates userspace does you essentially take some
interesting things like:

- tiler layout or whatever really has a big impact, which probably
  includes framebuffer size
- draw sizes
- does it use GS/streamout/whatever else has a big impact

Then gather a _lot_ of data from different games and make a linear
regression model that captures like 80% (wild guess, no idea whether
that's good) of games for the 1b estimate, 99% of everything you have for
the kernel pool (maybe a bit less, depends how much the emergency pools
from core mm) provides.

And the probably a different estimate to add a notch more when you have a
data from step 2.

It's not about the perfect estimates here at all, just heuristics.

> Many thanks to all the people who chimed in. I'll wait until the
> discussion settles on something that works for everyone and try to
> sum-up the outcome of this discussion in some
> drm-tile-based-renderer.rst doc file (or any other file name you think
> this should be put in) so we have a clear plan of what we want to
> do/how we want it done.

Yeah sounds like we have a plan.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
