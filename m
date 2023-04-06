Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3156D9889
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571C110E65B;
	Thu,  6 Apr 2023 13:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B008010E65B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:48:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-947a47eb908so70945966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680788904;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fKgKoJHoDl3MpTRMguelkYc7mgAoYruz3cext5JdZuo=;
 b=h6oUiF6oROpZk3XhwSOJg3dBdWo33d+ulfHcW9wfpHIs+iEQSinfceakBAC172Uer8
 CE7IFNlpFIFQ091Mi/yu7uuAOIQ1umI8bL4ibcFqhFTEU8V86IH98Vc1xzhmkdnuU4Qo
 mYyE0QXKY/hi8T2P/NSpCY3yR+DdsJZ/w2bGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680788904;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fKgKoJHoDl3MpTRMguelkYc7mgAoYruz3cext5JdZuo=;
 b=JHn2UA9vtIFk2KRRY+abU7tG9CaCxGHUN/CRrZR4kyjS0vSwsPuXDHqnSX0cPaJXbe
 6aNad3eeNKeGWTFYIyKITbdznVjMVNzcYc40sMcOrxPWdLan2TcYR2NR/X17hUbMLI3L
 x+Ud8DQ1a5niJIL4fD5nLEQkSKka/q7RNxfu9LGeJ3Mtd93mDLuuWDVWGK8T4wyt+jL1
 sROeRzOck0nIdpXnXUBM73nQaIvTdZ4Hhp+LKW/MnjE3dm6QyDp1qN9T/n4XJTAYxOyc
 xMUj5113fhU2WxyuMG0LJDlfFk7+x8bqlEOgR9qkf7bjQouEnEJR4/9ECyRJCgmvjRlb
 bLyA==
X-Gm-Message-State: AAQBX9fJNIH0Qhm9PzOgCYIeaf55uWUH414lZPyNqzQaHnIj1/wdw+/R
 SOdcwtmKVZUdF3ErU43alyCesQ==
X-Google-Smtp-Source: AKy350Yq3xuEjpbUgaiDIDPAz+fkHDXiSQ7iDcIAQqpq/HOSOb0Cy6qp8DjViAL4FG1pUv+/jL/ulQ==
X-Received: by 2002:a05:6402:268e:b0:502:616b:cbd5 with SMTP id
 w14-20020a056402268e00b00502616bcbd5mr6760502edd.2.1680788903587; 
 Thu, 06 Apr 2023 06:48:23 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 b15-20020a50cccf000000b004c10b4f9ebesm784168edj.15.2023.04.06.06.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 06:48:23 -0700 (PDT)
Date: Thu, 6 Apr 2023 15:48:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 18/18] drm/asahi: Add the Asahi
 driver for Apple AGX GPUs
Message-ID: <ZC7NpGrZWm0EbFhz@phenom.ffwll.local>
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
 <ZC6zSnB6pSELiy+I@phenom.ffwll.local>
 <37e2861d-ab9f-6b83-9186-d9ffc6845e8a@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37e2861d-ab9f-6b83-9186-d9ffc6845e8a@asahilina.net>
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

On Thu, Apr 06, 2023 at 10:15:56PM +0900, Asahi Lina wrote:
> On 06/04/2023 20.55, Daniel Vetter wrote:
> > On Thu, Apr 06, 2023 at 01:44:22PM +0900, Asahi Lina wrote:
> > > On 05/04/2023 23.37, Daniel Vetter wrote:
> > > > On Tue, Mar 07, 2023 at 11:25:43PM +0900, Asahi Lina wrote:
> > > > > +/// A generic monotonically incrementing ID used to uniquely identify object instances within the
> > > > > +/// driver.
> > > > > +pub(crate) struct ID(AtomicU64);
> > > > > +
> > > > > +impl ID {
> > > > > +    /// Create a new ID counter with a given value.
> > > > > +    fn new(val: u64) -> ID {
> > > > > +        ID(AtomicU64::new(val))
> > > > > +    }
> > > > > +
> > > > > +    /// Fetch the next unique ID.
> > > > > +    pub(crate) fn next(&self) -> u64 {
> > > > > +        self.0.fetch_add(1, Ordering::Relaxed)
> > > > > +    }
> > > > > +}
> > > > 
> > > > Continuing the theme of me commenting on individual things, I stumbled
> > > > over this because I noticed that there's a lot of id based lookups where I
> > > > don't expect them, and started chasing.
> > > > 
> > > > - For ids use xarray, not atomic counters. Yes I know dma_fence timelines
> > > >     gets this wrong, this goes back to an innocent time where we didn't
> > > >     allocate more than one timeline per engine, and no one fixed it since
> > > >     then. Yes u64 should be big enough for everyone :-/
> > > > 
> > > > - Attaching ID spaces to drm_device is also not great. drm is full of
> > > >     these mistakes. Much better if their per drm_file and so private to each
> > > >     client.
> > > > 
> > > > - They shouldn't be used for anything else than uapi id -> kernel object
> > > >     lookup at the beginning of ioctl code, and nowhere else. At least from
> > > >     skimming it seems like these are used all over the driver codebase,
> > > >     which does freak me out. At least on the C side that's a clear indicator
> > > >     for a refcount/lockin/data structure model that's not thought out at
> > > >     all.
> > > > 
> > > > What's going on here, what do I miss?
> > > 
> > > These aren't UAPI IDs, they are driver-internal IDs (the UAPI IDs do use
> > > xarray and are per-File). Most of them are just for debugging, so that when
> > > I enable full debug spam I have some way to correlate different things that
> > > are happening together (this subset of interleaved log lines relate to the
> > > same submission). Basically just object names that are easier to read (and
> > > less of a security leak) than pointers and guaranteed not to repeat. You
> > > could get rid of most of them and it wouldn't affect the driver design, it
> > > just makes it very hard to see what's going on with debug logs ^^;
> > > 
> > > There are only two that are ever used for non-debugging purposes: the VM ID,
> > > and the File ID. Both are per-device global IDs attached to the VMs (not the
> > > UAPI VM objects, but rather the underlyng MMU address space managers they
> > > represent, including the kernel-internal ones) and to Files themselves. They
> > > are used for destroying GEM objects: since the objects are also
> > > device-global across multiple clients, I need a way to do things like "clean
> > > up all mappings for this File" or "clean up all mappings for this VM".
> > > There's an annoying circular reference between GEM objects and their
> > > mappings, which is why this is explicitly coded out in destroy paths instead
> > > of naturally happening via Drop semantics (without that cleanup code, the
> > > circular reference leaks it).
> > > 
> > > So e.g. when a File does a GEM close or explicitly asks for all mappings of
> > > an object to be removed, it goes out to the (possibly shared) GEM object and
> > > tells it to drop all mappings marked as owned by that unique File ID. When
> > > an explicit "unmap all in VM" op happens, it asks the GEM object to drop all
> > > mappings for that underlying VM ID. Similarly, when a UAPI VM object is
> > > dropped (in the Drop impl, so both explicitly and when the whole File/xarray
> > > is dropped and such), that does an explicit unmap of a special dummy object
> > > it owns which would otherwise leak since it is not tracked as a GEM object
> > > owned by that File and therefore not handled by GEM closing. And again along
> > > the same lines, the allocators in alloc.rs explicitly destroy the mappings
> > > for their backing GEM objects on Drop. All this is due to that annoying
> > > circular reference between VMs and GEM objects that I'm not sure how to fix.
> > > 
> > > Note that if I *don't* do this (or forget to do it somewhere) the
> > > consequence is just that we leak memory, and if you try to destroy the wrong
> > > IDs somehow the worst that can happen is you unmap things you shouldn't and
> > > fault the GPU (or, in the kernel or kernel-managed user VM cases,
> > > potentially the firmware). Rust safety guarantees still keep things from
> > > going entirely off the rails within the kernel, since everything that
> > > matters is reference counted (which is why these reference cycles are
> > > possible at all).
> > > 
> > > This all started when I was looking at the panfrost driver for reference. It
> > > does the same thing except it uses actual pointers to the owning entities
> > > instead of IDs, and pointer comparison (see panfrost_gem_close). Of course
> > > you could try do that in Rust too (literally storing and comparing raw
> > > pointers that aren't owned references), but then you're introducing a Pin<>
> > > requirement on those objects to make their addresses stable and it feels way
> > > more icky and error-prone than unique IDs (since addresses can be reused).
> > > panfrost only has a single mmu (what I call the raw VM) per File while I
> > > have an arbitrary number, which is why I end up with the extra
> > > distinction/complexity of both File and VM IDs, but the concept is the same.
> > > 
> > > Some of this is going to be refactored when I implement arbitrary VM range
> > > mapping/unmapping, which would be a good time to improve this... but is
> > > there something particularly wrong/broken about the way I'm doing it now
> > > that I missed? I figured unique u64 IDs would be a pretty safe way to
> > > identify entities and cleanup the mappings when needed.
> > 
> > Ok, some attempt at going through the vm_id/file_id stuff. Extremely
> > high-level purely informed by having read too many drivers:
> > 
> > First on the drm_file/struct file/file_id. This is the uapi interface
> > object, and it's refcounted in the vfs, but that's entirely the vfs'
> > business and none of the driver (or even subsystem). Once userspace has
> > done the final close() the file is gone, there's no way to ever get
> > anything meaningfully out of it because userspace dropped it. So if the
> > driver has any kind of backpointer to that's a design bug, because in all
> > the place you might want to care (ioctl, fdinfo for schedu stats, any
> > other file_operations callback) the vfs ensures it stays alive during the
> > callback and you essentially have a borrowed reference.
> 
> Right, there's none of that for the File, and it is not refcounted itself.
> Certainly there are no direct references, and as for the IDs: the IDs of
> relevant Files live in GEM objects that hold mappings owned by that file. As
> part of File close all the GEM objects get closed, which removes those
> mappings. So by the time the File goes away there should be no references to
> its ID anywhere (other than if I stashed some away for debugging, I forget
> whether I did in some child object).
> 
> If this process breaks for some reason (say, stray mappings remain indexed
> to a File ID that is gone), that means we leak the mappings, which leaks the
> GEM objects themselves and the VM they are mapped to. Not great but not
> fireworks either. As long as the DRM core properly calls the GEM close
> callback on everything before calling the File close callback though, that
> shouldn't happen.
> 
> > I've seen a lot of drivers try to make clever backpointings to stuff
> > that's essentially tied to the drm_file, and I've not found a single case
> > that made sense. iow, file_id as a lookup thingie needs to go. In
> > principle it's the same argument I've made already for the syncobj rust
> > wrappers. For specific uses I guess I need some rust reading help, but
> > from your description it sounds like the vm_id is much more the core
> > piece.
> 
> The file ID is simply how GEM mappings are identified as belonging to an
> active file within the mapping list of an object. GEM object close is
> literally the only place this ID is ever used for anything other than
> passing around:
> 
> /// Callback to drop all mappings for a GEM object owned by a given `File`
> fn close(obj: &Object, file: &DrmFile) {
>     mod_pr_debug!("DriverObject::close vm_id={:?} id={}\n", obj.vm_id,
> obj.id);
>     obj.drop_file_mappings(file.inner().file_id());
> }
> 
> I could also just iterate through the VM XArray for the File and drop
> mappings one VM at a time instead of doing all of them in one go, it's just
> slightly more cumbersome (though potentially less code because I could get
> rid of all the forwarding the file_id I do now).
> 
> On the other hand, once we implement arbitrary VM maps, I suspect this is
> going to go away anyway with the new design, so I'm not really very inclined
> to fix it until that happens... ^^

Yeah the driver-managed vm needs a bunch more reference loops and gets
awkward fast. the gpuva library might need to keep support for that, but I
really hope it's not needed.

> > So for that we have the gpu ctx -> vm -> gem_bos chain of reference. Now
> > on the C side if you have a modern driver that uses the
> > vm_bind/unbind/gpuva manager approach, the reference counts go in that
> > single direction only, anything else is essentially borrowed references
> > under protection of a mutex/lock or similar thing (for e.g. going from the
> > bo to the vm for eviction).
> 
> Right, so that is what is going to change with the pending refactor. What I
> have right now is a design that used to be the old driver-managed VM design
> (and still retains part of that for kernel-managed objects) for the old
> synchronous demo UAPI, that I then shoehorned into the redesigned vm_bind
> UAPI by just not supporting the interesting cases (partial
> maps/unmaps/remaps, etc.). This is all temporary, it's just to get us by for
> now since OpenGL doesn't need it and there is no usable Vulkan driver that
> cares yet... I wanted to focus on the explicit sync and general
> sched/queuing part of the new UAPI before I got to the VM bind stuff, since
> I figured that would be more interesting (and pulls in all the new
> abstractions, plus major perf benefit). So the UAPI itself has vm_bind but
> only the "easy" subset of cases are supported by the driver (whole object
> maps/unmaps) and the refcounting is still backwards.
> 
> As I said this originally came from the Panfrost design that doesn't have
> vm_bind but instead keeps a list of mappings with pointer equality checks in
> BOs... so that's why ^^
> 
> Thanks for explaining the design approach though, it's roughly what I had in
> mind but it's good to hear I'm on the right track! I'd love to go into more
> detail about how to implement vm_bind if you have time though (maybe a
> meeting?). In particular things like using the mm allocator to keep track of
> mapping ranges and supporting splitting and all that.

Yeah vm_bind sounds like a good topic to discuss. I don't think we'll get
all the pieces aligned to land that before asahi, but the driver internals
should at least match wrt semantics with that so that the refactoring
isn't total pain.

> > In addition to the above chain the xarray in the drm_file also holds
> > references to each of these. So far so good, in the drm_file ->postclose
> > callback you just walk the xarrays and drop all the references, and
> > everything gets cleaned up, at least in the C world.
> 
> In the Rust world you just do nothing since the XArray abstraction knows how
> to drop all of its contained objects!

Yeah xarray should work with Drop, but I guess you need a special
uapi/open-reference object that knows that it needs to perform additional
cleanup (like quiescent the gpu ctx or unamp everything for the vm).

> > But if either due to the uabi being a bit more legacy, or Rust requiring
> > that the backpointers are reference-counted from the gem_bo->vma->vm and
> > can't follow borrow semantics (afaiui the usual linux list_head pattern of
> > walking the list under a lock giving you a borrowed reference for each
> > element doesn't work too well in rust?) then that's not a problem, you can
> > still all clean it out:
> > 
> > - The key bit is that your vm struct needs both a refcount like kref and
> >    a separate open count. Each gpu ctx and the xarray for vm objects in
> >    drm_file hold _both_ the kref and the open refcount (in rust the open
> >    refcount implies the Arc or things go sideways).
> > 
> > - the other key bit is that drm_file ->postclose does _not_ have simple
> >    Drop semantics, it's more explicit.
> > 
> > - in the drm_file lastclose you first walk all the gpu ctx. The simplest
> >    semantics is that close() synchronously tears down all leftover gpu ctx,
> >    i.e. you unload them from the gpu. Details are under a lot of discussion
> >    in the various scheduler threads, but essentially this should ensure
> >    that the gpu ctx destruction completely removes all references to the
> >    ctx. If instead you have the legacy problem of apps expecting that
> >    rendering continues even if they called exit() before it finishes, then
> >    it gets more messy. I have no idea whether that's still a problem for
> >    new drivers or can be avoided.
> > 
> > - Next up you do the same thing for the vm xarray (which drops both the
> >    kref an open refcounts).
> > 
> > - At this point there might still be a ton of vm objects around with
> >    elevated kref. Except not, because at this point the open refcount of
> >    each vm should have dropped to zero. When that happens the vm object
> >    itself is still alive, plus even better for rust, you are in the
> >    vm_close(vm) function call so you have a full borrowed reference to
> >    that. Which means you can walk the entire address space and unmap
> >    everything explicit. Which should get rid of any gem_bo->vma->vm
> >    backpointers you have lying around.
> > 
> > - At that point all your vm objects are gone too, because the kref managed
> >    backpointers are gone.
> > 
> > - You walk the xarray of gem_bo (well the drm subsystem does that for
> >    you), which cleans out the reamining references to gem_bo. Only the
> >    gem_bo which are shared with other process or have a dma_buf will
> >    survive, like they should.
> > 
> > No leak, no funky driver-internal vm_id based lookup, and with rust we
> > should even be able to guarantee you never mix up Arc<Vm> with OpenRef<Vm>
> > (or however that exactly works in rust types, I have not much real clue).
> 
> That would totally work, and actually I already use somewhat analogous
> mechanisms in other places like firmware queues!
> 
> If this all weren't getting turned on its head for the new VM management I'd
> implement it, but hopefully we can agree there's not much point right now...
> I'd rather focus on the DRM abstraction design and work on improving the
> driver in parallel right now, and then about one kernel cycle or so from now
> it should definitely be in a better place for review. Honestly, there are
> bigger design problems with the driver right now than these IDs (that I
> already know about)... so I want to focus more on the abstractions and their
> usage right now than the internal driver design which I *know* has problems
> ^^

Yeah I think the only fundamental issue you have is that (if I get this
all right) you're trying to clean up mappings from the gem_bo, not from
the vm. The gem_bo (unlike the vm) is freely shareable (at least in
general), so tying anything else to the lifetime of a gem_bo in any way is
a design flaw.

This is similar to dma_fence that can end up absolutely everywhere, and
why drm/sched has this decoupling between hw_fence and drm_job fences with
wider visibility. i915-gem/i915-scheduler and a lot of the really old
drivers all get this wrong, and you end up with either terrible explicit
cleanup code that tries to go around looking for all the references that
it needs to drop. Or you just leak.

All these things need to be sorted out at design time so that they're
impossible.

> Rust is really good at getting you to come up with a *safe* design as far as
> memory and ownership, but that doesn't mean it's perfectly clean code and
> more importantly it does nothing for deadlocks and allocating in the wrong
> paths and getting resource allocation semantics right etc etc. The GPU FW
> queue stuff is at the very least due for another major refactor/cleanup to
> defer resource allocation and actual queuing to job prepare/run time (right
> now there's some horrible hacks to do it upfront at submit because I don't
> have a mechanism to back-patch job structures with those resource IDs later
> at exec time, but I want to add that), and along the way I can also fix the
> using job fences to block on pending job count thing that Christian really
> wants me to do instead of the can_run_job thing, and then getting all this
> resource stuff truly right is also going to mean eventually using fences to
> handle blocking on resource exhaustion too (though maybe I can get away with
> implementing that a bit later)...
> 
> The driver works stupidly well for how quickly I wrote it, but it still has
> all these rough edges that definitely need fixing before it's something I
> could say I'm happy with... I'm sure if you start hammering it with evil
> workloads you will hit some of its current problems (like I did yesterday
> with the deadlocks on GpuContext inval). I also need to learn more about the
> subtleties of fence signaling and all that, especially once a shrinker comes
> into play...

Yeah I think rust is impressive at creating working code. The real
challenge, and really where I see all the short term value at least, is in
clarifying the semantics. Because that'll help us to clarify the semantics
on the C side too, which gives immediate benefits for everyone. Not just
new drivers in rust.

But it's also the part that's really, really hard work.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
