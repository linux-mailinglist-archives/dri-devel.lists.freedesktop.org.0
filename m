Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E5EA9E9B4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F70510E3C6;
	Mon, 28 Apr 2025 07:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eLd46ipQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9D310E3C3;
 Mon, 28 Apr 2025 07:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745826133;
 bh=HkTYRf+EY1szzPKBRZM4KxxPdu8LOGbELTFXtYplEKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eLd46ipQkZj79grs2Q+pFFRlsjFJl/7gF4uvxjp50s1m4O20bteyRpPZ5LM2QM1oU
 EswDei9gMOQrHV7u7OzX0DoaHfPXl6K5b317dXF1n5wkKx1k+yhp1pMLkBBF0K58kP
 d87jzGKrB2aUY6EbRIrtRKFNiOfnNXG75rY1No6h8iUvyLqSeI2lVpX62JxrMFHeCF
 C5WHEulJYaHQhG7Mzie8iqwsk1b5FzSDMqVdauUqZSP2+F6uPOQ7RklMv7XQ363TAT
 MvJQoaT58Rebwx5gulD8qFHvBV1twysHQS9InmZzR1aCPhijeF82vjXJh+QEB2ZPQw
 sr3vlFrpOe+2g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E6FEC17E0F93;
 Mon, 28 Apr 2025 09:42:12 +0200 (CEST)
Date: Mon, 28 Apr 2025 09:42:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, lima@lists.freedesktop.org, Qiang Yu
 <yuq825@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Christian Koenig <christian.koenig@amd.com>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH] drm/doc: Start documenting aspects specific to
 tile-based renderers
Message-ID: <20250428094204.5b128a96@collabora.com>
In-Reply-To: <aAj9eRRXS-kHE_hH@blossom>
References: <20250418122524.410448-1-boris.brezillon@collabora.com>
 <aAj9eRRXS-kHE_hH@blossom>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi Alyssa,

On Wed, 23 Apr 2025 10:47:21 -0400
Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:

> Steven wanted non-Mali eyes, so with my Imaginapple hat on...
> 
> > +All lot of embedded GPUs are using tile-based rendering instead of immediate  
> 
> s/All lot of/Many/

Will change that.

> 
> > +- Complex geometry pipelines: if you throw geometry/tesselation/mesh shaders
> > +  it gets even trickier to guess the number of primitives from the number
> > +  of vertices passed to the vertex shader.  
> 
> Tessellation, yes. Geometry shaders, no. Geometry shaders must declare
> the maximum # of vertices they output, so by themselves geometry shaders
> don't make the problem much harder - unless you do an indirect draw with
> a GS, the emulated GS draw can still be direct.

Right, GS is simpler to cap, so I'll distinguish them from tessellation
shaders.

> 
> But I guess "even trickier" is accurate still...
> 
> > +For all these reasons, the tiler usually allocates memory dynamically, but
> > +DRM has not been designed with this use case in mind. Drivers will address
> > +these problems differently based on the functionality provided by their
> > +hardware, but all of them almost certainly have to deal with this somehow.
> > +
> > +The easy solution is to statically allocate a huge buffer to pick from when
> > +tiler memory is needed, and fail the rendering when this buffer is depleted.
> > +Some drivers try to be smarter to avoid reserving a lot of memory upfront.
> > +Instead, they start with an almost empty buffer and progressively populate it
> > +when the GPU faults on an address sitting in the tiler buffer range.  
> 
> This all seems very Mali-centric.

How surprising :-).

> Imaginapple has had partial renders
> since forever.

Yep, I've noticed that Imagination had partial renders too, but didn't
it had been present from the start.

Anyway, I'll make it clear that all sane HW should have a partial
render fallback, but that it's sometimes not the case, and in that
case, we have to work around this HW limitation.

> 
> > +More and more hardware vendors don't bother providing hardware support for
> > +geometry/tesselation/mesh stages  
> 
> I wouldn't say that... Mali is the only relevant hardware that has *no*
> hardware support for any of geom/tess/mesh. All the desktop vendors +
> Qualcomm have full hardware support, Apple has hardware mesh on m3+,
> Broadcom has geom/tess, and I think Imagination has geom/tess on certain
> parts.

Okay. I'll name Arm/Mali specifically here then.

> 
> And I don't know of any vendors (except possibly Imagination) that
> removed hardware support, because it turns out having hardware support
> for core API features is a good thing actually. It doesn't need to look
> like "put the API in hardware" but some sort of hardware acceleration
> (like AMD's NGG) solves the problems in this doc and more.
> 
> So... just "Some hardware vendors omit hardware support for
> geometry/tessellation/mesh stages".

Sounds good.

> 
> > This being said, the same +"start small, grow on-demand" can be
> > applied to avoid over-allocating memory +upfront.  
> 
> [citation needed], if we overflow that buffer we're screwed and hit
> device_loss, and that's unacceptable in normal usage.

My bad, I went ahead and mentioned other geom stages here because Sima
seemed to think that the same tricks could be applied to those. I'll
just drop this section.

> 
> > +The problem with on-demand allocation is that suddenly, GPU accesses can
> > +fail on OOM, and the DRM components (drm_gpu_scheduler and drm_gem mostly)
> > +were not designed for that.  
> 
> It's not the common DRM scheduler that causes this problem, it
> fundamentally violates the kernel-wide dma_fence contract: signalling a
> dma-fence must not block on a fallible memory allocation, full stop.
> Nothing we do in DRM will change that contract (and it's not obvious to
> me that kbase is actually correct in all the corner cases).

Okay, I'll stop blaming DRM and hide behind the dma_fence contract here.

BTW, is there a piece of doc explaining the rational behind this
dma_fence contract, or is it just the usual informal knowledge shared
among DRM devs over IRC/email threads :-) ?

To be honest, I'm a bit unhappy with this "it's part of the dma_fence
contract" explanation, because I have a hard time remembering all the
details that led to these set of rules myself, so I suspect it's even
harder for new comers to reason about this. To me, it's one of the
reasons people fail to understand/tend to forget what the
problems/limitations are, and end up ignoring them (intentionally or
not).

FWIW, this is what I remember, but I'm sure there's more:

1. dma_fence must signal in finite time, so unbounded waits in the
   fence signalling path path is not good, and that's what happens with
   GFP_KERNEL allocations
2. if you're blocked in your GPU fault handler, that means you can't
   process further faults happening on other contexts
3. GPU drivers are actively participating in the memory reclaim
   process, which leads to deadlocks if the memory allocation in the
   fault handler is waiting on the very same GPU job fence that's
   waiting for its memory allocation to be satisfied

I'd really love if someone (Sima, Alyssa and/or Christian?) could sum it
up, so I can put the outcome of this discussion in some kernel doc
entry (or maybe it'd be better if this was one of you submitting a
patch for that ;-)). If it's already documented somewhere, I'll just
have to eat my hat and accept your RTFM answer :-).

> 
> > +The second trick to try to avoid over-allocation, even with this
> > +sub-optimistic estimate, is to have a shared pool of memory that can be
> > +used by all GPU contexts when they need tiler/geometry memory. This
> > +implies returning chunks to this pool at some point, so other contexts
> > +can re-use those. Details about what this global memory pool implementation
> > +would look like is currently undefined, but it needs to be filled to
> > +guarantee that pre-allocation requests for on-demand buffers used by a
> > +GPU job can be satisfied in the fault handler path.  
> 
> How do we clean memory between contexts? This is a security issue.
> Either we need to pin physical pages to single processes, or we need to
> zero pages when returning pages to the shared pool. Zeroing on the
> CPU side is an option but the performance hit may be unacceptable
> depending how it's implemented. Alternatively we can require userspace to
> clean up after itself on the gpu (with a compute shader) but that's
> going to burn memory b/w in the happy path where we have lots of memory
> free.

I would say memset(0) on allocation (when recycling pages returned to
the pool) since that's already where you're taking the hit for regular
allocations anyway (allocating pages is not free).

> 
> > For GL +drivers, the UMD is in control of the context recreation, so
> > it can easily +record the next buffer size to use.  
> 
> I'm /really/ skeptical of this. Once we hit a device loss in GL, it's
> game over, and I'm skeptical of any plan that expects userspace to
> magically recover, especially as soon as side effects are introduced
> (including transform feedback which is already gles3.0 required).

I can drop that one. I know we've always done that in gallium/panfrost
(that predates CSF/panthor BTW), but I trust you when you say it
doesn't comply with the GL spec.

Thanks a lot for chiming in BTW, that's truly appreciated.

Regards,

Boris
