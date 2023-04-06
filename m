Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2786D966F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E6A10EB89;
	Thu,  6 Apr 2023 11:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A387A10EB78
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:55:59 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-947a47eb908so69206566b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 04:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680782157;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMDNQu1XzLS5jMXdeJJxT4z+oXW0t1tuPCxJshT2ALg=;
 b=N5oQP3trdu5pC1JrmFTjX9Nd7vIym5cFs0ob/3XH2wTkuemsHHFm0uVeXV+bsxLdfv
 YaZyukmqvg13LwinhJHWhbpQOLTCN92J89IsjsuiHFR/Xp+biwvfIMk+tRAv/N63p/Oj
 dZ/AxheqPi+ffW9mGcRNf9Nxyhvm+rJTTap9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680782157;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oMDNQu1XzLS5jMXdeJJxT4z+oXW0t1tuPCxJshT2ALg=;
 b=VCR3hIwssYWl6oUf7ERN7fr8pOBFANx1jy1cujLPpDtoJltwnuGe9Qy77VKa65iDHr
 wUUCxRmHEP5maUGqcIy03d5STRDY4bPidCdQRurHaJDi4IMTLyZOWETm3kXPn8ELi17L
 bKm5CT5XPKK4Cu7quYWl4tS+Tv71ukyFwpZBszJA/J4V55l/o/v/IBtd1YqgIn0LXXbN
 5zN+dlRMm9LzatGrKvu6LTp0SREcoHRJXXmGr6xh6x6GEh0j+kU7rk8UGqoX3r/Z4s4f
 ouZH2ZEnc3DpLhJ0q8g66fOHwldFD2C3O5gBQwgPQ06UTuZ1dfpEIO+Bjz35731cOVg2
 mxIQ==
X-Gm-Message-State: AAQBX9f2inGEbQQziUrf2RiSzUKD4h8rIY06B4JCgwHdWmwDKg3cvN3p
 zVblAZjSWoNFRoC4UHIHD/pSjw==
X-Google-Smtp-Source: AKy350ZOxZo4QQ3mtTdEBkJo/LXRvuTs1QCISStGn2WK9B8ac8jui8PsnQYOH6+5h0nWhBZXUsWKLA==
X-Received: by 2002:a17:906:114:b0:947:f415:db23 with SMTP id
 20-20020a170906011400b00947f415db23mr5899622eje.1.1680782157452; 
 Thu, 06 Apr 2023 04:55:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 gl25-20020a170906e0d900b0092d16623eeasm713482ejb.138.2023.04.06.04.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 04:55:57 -0700 (PDT)
Date: Thu, 6 Apr 2023 13:55:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 18/18] drm/asahi: Add the Asahi
 driver for Apple AGX GPUs
Message-ID: <ZC6zSnB6pSELiy+I@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-18-917ff5bc80a8@asahilina.net>
 <ZC2HtBOaoUAzVCVH@phenom.ffwll.local>
 <8d28f1d3-14b0-78c5-aa16-e81e2a8a3685@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d28f1d3-14b0-78c5-aa16-e81e2a8a3685@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 01:44:22PM +0900, Asahi Lina wrote:
> On 05/04/2023 23.37, Daniel Vetter wrote:
> > On Tue, Mar 07, 2023 at 11:25:43PM +0900, Asahi Lina wrote:
> > > +/// A generic monotonically incrementing ID used to uniquely identify object instances within the
> > > +/// driver.
> > > +pub(crate) struct ID(AtomicU64);
> > > +
> > > +impl ID {
> > > +    /// Create a new ID counter with a given value.
> > > +    fn new(val: u64) -> ID {
> > > +        ID(AtomicU64::new(val))
> > > +    }
> > > +
> > > +    /// Fetch the next unique ID.
> > > +    pub(crate) fn next(&self) -> u64 {
> > > +        self.0.fetch_add(1, Ordering::Relaxed)
> > > +    }
> > > +}
> > 
> > Continuing the theme of me commenting on individual things, I stumbled
> > over this because I noticed that there's a lot of id based lookups where I
> > don't expect them, and started chasing.
> > 
> > - For ids use xarray, not atomic counters. Yes I know dma_fence timelines
> >    gets this wrong, this goes back to an innocent time where we didn't
> >    allocate more than one timeline per engine, and no one fixed it since
> >    then. Yes u64 should be big enough for everyone :-/
> > 
> > - Attaching ID spaces to drm_device is also not great. drm is full of
> >    these mistakes. Much better if their per drm_file and so private to each
> >    client.
> > 
> > - They shouldn't be used for anything else than uapi id -> kernel object
> >    lookup at the beginning of ioctl code, and nowhere else. At least from
> >    skimming it seems like these are used all over the driver codebase,
> >    which does freak me out. At least on the C side that's a clear indicator
> >    for a refcount/lockin/data structure model that's not thought out at
> >    all.
> > 
> > What's going on here, what do I miss?
> 
> These aren't UAPI IDs, they are driver-internal IDs (the UAPI IDs do use
> xarray and are per-File). Most of them are just for debugging, so that when
> I enable full debug spam I have some way to correlate different things that
> are happening together (this subset of interleaved log lines relate to the
> same submission). Basically just object names that are easier to read (and
> less of a security leak) than pointers and guaranteed not to repeat. You
> could get rid of most of them and it wouldn't affect the driver design, it
> just makes it very hard to see what's going on with debug logs ^^;
> 
> There are only two that are ever used for non-debugging purposes: the VM ID,
> and the File ID. Both are per-device global IDs attached to the VMs (not the
> UAPI VM objects, but rather the underlyng MMU address space managers they
> represent, including the kernel-internal ones) and to Files themselves. They
> are used for destroying GEM objects: since the objects are also
> device-global across multiple clients, I need a way to do things like "clean
> up all mappings for this File" or "clean up all mappings for this VM".
> There's an annoying circular reference between GEM objects and their
> mappings, which is why this is explicitly coded out in destroy paths instead
> of naturally happening via Drop semantics (without that cleanup code, the
> circular reference leaks it).
> 
> So e.g. when a File does a GEM close or explicitly asks for all mappings of
> an object to be removed, it goes out to the (possibly shared) GEM object and
> tells it to drop all mappings marked as owned by that unique File ID. When
> an explicit "unmap all in VM" op happens, it asks the GEM object to drop all
> mappings for that underlying VM ID. Similarly, when a UAPI VM object is
> dropped (in the Drop impl, so both explicitly and when the whole File/xarray
> is dropped and such), that does an explicit unmap of a special dummy object
> it owns which would otherwise leak since it is not tracked as a GEM object
> owned by that File and therefore not handled by GEM closing. And again along
> the same lines, the allocators in alloc.rs explicitly destroy the mappings
> for their backing GEM objects on Drop. All this is due to that annoying
> circular reference between VMs and GEM objects that I'm not sure how to fix.
> 
> Note that if I *don't* do this (or forget to do it somewhere) the
> consequence is just that we leak memory, and if you try to destroy the wrong
> IDs somehow the worst that can happen is you unmap things you shouldn't and
> fault the GPU (or, in the kernel or kernel-managed user VM cases,
> potentially the firmware). Rust safety guarantees still keep things from
> going entirely off the rails within the kernel, since everything that
> matters is reference counted (which is why these reference cycles are
> possible at all).
> 
> This all started when I was looking at the panfrost driver for reference. It
> does the same thing except it uses actual pointers to the owning entities
> instead of IDs, and pointer comparison (see panfrost_gem_close). Of course
> you could try do that in Rust too (literally storing and comparing raw
> pointers that aren't owned references), but then you're introducing a Pin<>
> requirement on those objects to make their addresses stable and it feels way
> more icky and error-prone than unique IDs (since addresses can be reused).
> panfrost only has a single mmu (what I call the raw VM) per File while I
> have an arbitrary number, which is why I end up with the extra
> distinction/complexity of both File and VM IDs, but the concept is the same.
> 
> Some of this is going to be refactored when I implement arbitrary VM range
> mapping/unmapping, which would be a good time to improve this... but is
> there something particularly wrong/broken about the way I'm doing it now
> that I missed? I figured unique u64 IDs would be a pretty safe way to
> identify entities and cleanup the mappings when needed.

Ok, some attempt at going through the vm_id/file_id stuff. Extremely
high-level purely informed by having read too many drivers:

First on the drm_file/struct file/file_id. This is the uapi interface
object, and it's refcounted in the vfs, but that's entirely the vfs'
business and none of the driver (or even subsystem). Once userspace has
done the final close() the file is gone, there's no way to ever get
anything meaningfully out of it because userspace dropped it. So if the
driver has any kind of backpointer to that's a design bug, because in all
the place you might want to care (ioctl, fdinfo for schedu stats, any
other file_operations callback) the vfs ensures it stays alive during the
callback and you essentially have a borrowed reference.

I've seen a lot of drivers try to make clever backpointings to stuff
that's essentially tied to the drm_file, and I've not found a single case
that made sense. iow, file_id as a lookup thingie needs to go. In
principle it's the same argument I've made already for the syncobj rust
wrappers. For specific uses I guess I need some rust reading help, but
from your description it sounds like the vm_id is much more the core
piece.

So for that we have the gpu ctx -> vm -> gem_bos chain of reference. Now
on the C side if you have a modern driver that uses the
vm_bind/unbind/gpuva manager approach, the reference counts go in that
single direction only, anything else is essentially borrowed references
under protection of a mutex/lock or similar thing (for e.g. going from the
bo to the vm for eviction).

In addition to the above chain the xarray in the drm_file also holds
references to each of these. So far so good, in the drm_file ->postclose
callback you just walk the xarrays and drop all the references, and
everything gets cleaned up, at least in the C world.

Aside: I'm ignoring the entire sched/job/gpu-ctx side because that's a
separate can of worms and big other threads floating around already.

But if either due to the uabi being a bit more legacy, or Rust requiring
that the backpointers are reference-counted from the gem_bo->vma->vm and
can't follow borrow semantics (afaiui the usual linux list_head pattern of
walking the list under a lock giving you a borrowed reference for each
element doesn't work too well in rust?) then that's not a problem, you can
still all clean it out:

- The key bit is that your vm struct needs both a refcount like kref and
  a separate open count. Each gpu ctx and the xarray for vm objects in
  drm_file hold _both_ the kref and the open refcount (in rust the open
  refcount implies the Arc or things go sideways).

- the other key bit is that drm_file ->postclose does _not_ have simple
  Drop semantics, it's more explicit.

- in the drm_file lastclose you first walk all the gpu ctx. The simplest
  semantics is that close() synchronously tears down all leftover gpu ctx,
  i.e. you unload them from the gpu. Details are under a lot of discussion
  in the various scheduler threads, but essentially this should ensure
  that the gpu ctx destruction completely removes all references to the
  ctx. If instead you have the legacy problem of apps expecting that
  rendering continues even if they called exit() before it finishes, then
  it gets more messy. I have no idea whether that's still a problem for
  new drivers or can be avoided.

- Next up you do the same thing for the vm xarray (which drops both the
  kref an open refcounts).

- At this point there might still be a ton of vm objects around with
  elevated kref. Except not, because at this point the open refcount of
  each vm should have dropped to zero. When that happens the vm object
  itself is still alive, plus even better for rust, you are in the
  vm_close(vm) function call so you have a full borrowed reference to
  that. Which means you can walk the entire address space and unmap
  everything explicit. Which should get rid of any gem_bo->vma->vm
  backpointers you have lying around.

- At that point all your vm objects are gone too, because the kref managed
  backpointers are gone.

- You walk the xarray of gem_bo (well the drm subsystem does that for
  you), which cleans out the reamining references to gem_bo. Only the
  gem_bo which are shared with other process or have a dma_buf will
  survive, like they should.

No leak, no funky driver-internal vm_id based lookup, and with rust we
should even be able to guarantee you never mix up Arc<Vm> with OpenRef<Vm>
(or however that exactly works in rust types, I have not much real clue).

If you have any other functional needs for vm_id then I guess I need to go
through them, but they should be all fixable.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

