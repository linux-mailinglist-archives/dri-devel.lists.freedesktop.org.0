Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25DF6D98A4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BD710EBCA;
	Thu,  6 Apr 2023 13:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D327210EBCA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:54:23 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-502aa0f24daso150190a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680789261;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6IAw+w9FZQ7jDjRJq27qAY9c4XuwhViWVLB/Lio4RVQ=;
 b=KUt1ik1nEQ7opDVbPc0+qo1l68PyDK102Q81UoQaowFU8oZQnUfLRTEOuJ9PSGKkF9
 1A++BO2vwnWo6oGsrOMP/rydGG7O9rF5mope4P/Qj/zFDIW2ytENDapXtkf6DwjeImGW
 MHY6SgpblxvywBYjXMGqP2wvATzKf0VPUDBZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680789261;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6IAw+w9FZQ7jDjRJq27qAY9c4XuwhViWVLB/Lio4RVQ=;
 b=v378wBV4oDk90gZ3HSBfYULZtg+pJBRVv2RkuoKn1s+tWKSmj8BlGcFcvQ5JYtDJB5
 DCpjtC1zy2xdrZKPq9UNdDYEV+F2xXzMlfS8PiWjovq94arZjP+aqzwKakBX7QtCa3da
 QVafp50s1BSO79CX9s6EghOBGcOkhIjQ8bqKgkPHuT2peb+96sZYIZKkXy35eB55znzV
 QEsS/MzjAfzC8rmnexT9xnSp4mkK0uYPAzVpW/hTQ9EfEJcD1g/fqTs+zN0LYIzCLDpR
 ZswzgsME0dVLEON3gC53C7jRPHwQku7xxqM2dt0vcxC0IThoJIu4OMMAwGGjTDLrkVzW
 n9zQ==
X-Gm-Message-State: AAQBX9f4uBpqunLL8ojMFBI2m7qyIAF4e3AK4VMuswC71L2tHIEl8AvB
 czngRS3z4VeOWVP34EV953N7LQ==
X-Google-Smtp-Source: AKy350ZFFNJj4gsovzONFkSByKDMlu/5sletbJfi957R7h+pF/JrehHotXoowZWg8fkRD5nMlej5Mg==
X-Received: by 2002:a17:906:3f12:b0:947:8734:a058 with SMTP id
 c18-20020a1709063f1200b009478734a058mr4982175ejj.4.1680789261344; 
 Thu, 06 Apr 2023 06:54:21 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 e4-20020a17090681c400b00925ce7c7705sm839581ejx.162.2023.04.06.06.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 06:54:20 -0700 (PDT)
Date: Thu, 6 Apr 2023 15:54:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [Linaro-mm-sig] Re: [PATCH RFC 18/18] drm/asahi: Add the Asahi
 driver for Apple AGX GPUs
Message-ID: <ZC7PClluoKmfCMn6@phenom.ffwll.local>
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
 <ZC2JPR3fGm0uE9yW@phenom.ffwll.local>
 <6200f93d-6d95-5d03-cc1c-22d7924d66eb@asahilina.net>
 <ZC6sPBuH3vz7vMO2@phenom.ffwll.local>
 <5330cde5-2d04-200f-d606-5467f20a5f7f@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5330cde5-2d04-200f-d606-5467f20a5f7f@asahilina.net>
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

On Thu, Apr 06, 2023 at 10:32:29PM +0900, Asahi Lina wrote:
> On 06/04/2023 20.25, Daniel Vetter wrote:
> > On Thu, Apr 06, 2023 at 02:02:55PM +0900, Asahi Lina wrote:
> > > On 05/04/2023 23.44, Daniel Vetter wrote:
> > > > On Tue, Mar 07, 2023 at 11:25:43PM +0900, Asahi Lina wrote:
> > > > > +/// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
> > > > > +pub(crate) fn lookup_handle(file: &DrmFile, handle: u32) -> Result<ObjectRef> {
> > > > > +    Ok(ObjectRef::new(shmem::Object::lookup_handle(file, handle)?))
> > > > > +}
> > > > 
> > > > So maybe my expectations for rust typing is a bit too much, but I kinda
> > > > expected this to be fully generic:
> > > > 
> > > > - trait Driver (drm_driver) knows the driver's object type
> > > > - a generic create_handle function could ensure that for drm_file (which
> > > >     is always for a specific drm_device and hence Driver) can ensure at the
> > > >     type level that you only put the right objects into the drm_file
> > > > - a generic lookup_handle function on the drm_file knows the Driver trait
> > > >     and so can give you back the right type right away.
> > > > 
> > > > Why the wrapping, what do I miss?
> > > 
> > > Sigh, so this is one of the many ways I'm trying to work around the "Rust
> > > doesn't do subclasses" problem (so we can figure out what the best one is
> > > ^^).
> > > 
> > > The generic shmem::Object::lookup_handle() call *is* fully generic and will
> > > get you back a driver-specific object. But since Rust doesn't do
> > > subclassing, what you get back isn't a driver-specific type T, but rather a
> > > (reference to a) shmem::Object<T>. T represents the inner driver-specific
> > > data/functionality (only), and the outer shmem::Object<T> includes the
> > > actual drm_gem_shmem_object plus a T. This is backwards from C, where you
> > > expect the opposite situation where T contains a shmem object, but that just
> > > doesn't work with Rust because there's no way to build a safe API around
> > > that model as far as I know.
> > 
> > Ah I think I just got confused. I did untangle (I think at least) the
> > Object<T> trick, I guess the only thing that confused me here is why this
> > is in the shmem module? Or is that the rust problem again?
> > 
> > I'd kinda have expected that we'd have a gem::Object<T> here that the
> > lookup_handle function returns. So for the shmem case I guess that would
> > then be gem::Object<shmem::Object<T>> for the driver type T with driver
> > specific stuff? I guess not very pretty ...
> 
> Ahh, uh... Yeah, so shmem objects are allocated their own way (the shmem
> core expects to kfree them in drm_gem_shmem_free) and
> bindings::drm_gem_shmem_object already contains a bindings::drm_gem_object.
> Since the composition is already done in the C side, we can't just do it
> again in Rust cleanly. That's why I have this weird setup with both a common
> trait for common GEM functionality and separate actual types that both
> implement it.

Hm this is annoying. For a single driver it doesn't matter, but I do
expect that once we have more, and especially once we have more libraries
wrapped (ttm, gpuva, execbuf submit helpers, ...) then the common glue
really becomes the gem_bo for many of these things.

Could we have a GemObject trait which covers this? sole function is an
unsafe one that gives you the raw C pointer :-) It still means that every
gem memory manager library needs to impl that trait, but all the
manager-agnostic bits in the wrappers would be generic? trait would then
also have the right dependent type to ensure type safety in all this.

Maybe something to discuss in the next meeting with the rust folks.

> Honestly the whole GEM codepath is untested other than the bits inherited by
> shmem. I'm not sure I'll be able to verify that this all makes sense until
> another Rust driver comes along that needs something other than shmem. I
> just felt I had to do *something* for GEM since the hierarchy is there and I
> needed shmem...
> 
> This whole gem stuff is IMO the messiest part of the abstractions though, so
> I'm happy to turn it on its head if it makes it better and someone has an
> idea of how to do that ^^

Yeah I still haven't worked up enough courage to type up my gem
abstraction review :-/

> > > Now the problem is from the higher layers I want object operations that
> > > interact with the shmem::Object<T> (that is, they call generic GEM functions
> > > on the object). Options so far:
> > > 
> > > 1. Add an outer wrapper and put that functionality there.
> > > 2. Just have the functions on T as helpers, so you need to call T::foo(obj)
> > > instead of obj.foo().
> > > 3. Use the undocumented method receiver trait thing to make shmem::Object<T>
> > > a valid `self` type, plus add auto-Deref to shmem::Object. Then obj.foo()
> > > works.
> > > 
> > > #1 is what I use here. #2 is how the driver-specific File ioctl callbacks
> > > are implemented, and also sched::Job<T>. #3 is used for fence callbacks
> > > (FenceObject<T>). None of them are great, and I'd love to hear what people
> > > think of the various options...
> > > 
> > > There are other unexplored options, like in this GEM case it could be
> > > covered with a driver-internal auxiliary trait impl'd on shmem::Object<T>
> > > buuut that doesn't work when you actually need callbacks on T itself to
> > > circle back to shmem::Object<T>, as is the case with File/Job/FenceObject.
> > 
> > Ok I think I'm completely lost here. But I also havent' looked at how this
> > is all really used in the driver, it's really just the shmem:: module in
> > the lookup_handle function which looked strange to me.
> 
> Ah, sorry, I misunderstood what you were talking about in my previous email
> then. That's just a default trait function. It comes from common
> functionality in the gem module, but shmem::Object implements the trait so
> it ends up offering it too (lookup_handle() is not duplicated, it only lives
> in gem, shmem only has to implement going to/from the drm_gem_object pointer
> so the rest of the methods can use it). That's part of why the type/trait
> hierarchy is kind of messy here, it's so I can share functionality between
> both types even though they are pre-composed on the C side.

Ok, so it's all already what I expect and I'm just confused with rust
syntax.

> In the end the object types are specialized for any given driver, so you're
> always getting your own unique kind of object anyway. It's just that drivers
> based on shmem will go through it to reach the common code and work with a
> shmem::Object<T>, and drivers using raw gem will use gem::Object<T> instead.

Ok, sounds all good.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
