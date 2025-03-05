Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E1A4F7E5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 08:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A30710E6F1;
	Wed,  5 Mar 2025 07:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WVqiVCFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6155410E6F1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 07:30:39 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so43746695e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 23:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741159838; x=1741764638; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6eIPjoywVHzslmjO8vs+eTHuxI6qCJTL5FwNFg9NfBw=;
 b=WVqiVCFjwzalirb4cus2iUb3umzYkVfR8m9FomRG4HNA9f/C7YRo1IwvnZVplvmtDm
 w1uEj+1q1Kf2+sLKFLTUL5+FRVYb+kqrzIR1PRDgVgTOWwP6T4BvS34zjjQHNZydAy1x
 cJIQZvD4FaO0d5AbtPF/iJZbja9oylZDJLUgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741159838; x=1741764638;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6eIPjoywVHzslmjO8vs+eTHuxI6qCJTL5FwNFg9NfBw=;
 b=tKRft6tsEHhXKQC9siwNsfTDMVLeZ5wjnYXRgJ9aEG04jEFoPRtcPhPk5/79YJ7usD
 frBa2xKBgkSDnVOHGx3a0BSTVao/jKhBE7Yu6HHx8GYbp4TlXAI7u+cP25izu9AgOF0x
 Y3H6zXi8s7t5iGF+E4xVUhIcVP/C0mlQX9yZE6RbFsuGlQR8xNtGTOWeDaGcqQEIwmrQ
 IdAnN2BN1wG4Fci6G4LPLy12lp2qycSF/zfDCzMREu+9YQPrqCVzbnV9eilFdiV6SW0T
 RSltIj3Ik2FtQL3EGVrRi3jmHIcqN5o4QcnVWuUOuUbRzy1e+Djw6VU1qzNAkuqb1JFG
 Op6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtCZkyH9GOmu6sOPJPzOHniadN85cLzfRzAzOR+8QeCawQTGjoPce9Ph0Enb3A15iwszXtfufcEYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYoP/pLqaDC7kV/HzHbVlXExLT1TmnZincLT9GSRwtL8h6AqMA
 j0AmkyUC3c2eN+nKHkyhMXczaiCvDjV3TAq2gl7f/+iZwqI1Tyi8R3hIdxuj3PY=
X-Gm-Gg: ASbGncscXWzjbjYB0SXY5DSktr8KrqY/P5lKG0CT+aLTMhfLiFb4GLicvVtHOu6iu4D
 RBIOnPtN/WD4f4akuMngPJcpbFKQUfvVI8m5/6LgD+H4os5AeqJRN6tepMET/M4tmGs+6/4nJ3O
 nhsOUQN1tjaPEMPZkioqHk462KnBeP3ru8nEYgcYikgr0Hox6jxaoSmpGF/E3cskKJNPDzjPp9I
 s79DyRkOpJ8WaI5bDhgvkpB2b1M/cwMqyR8HFYypM+BdTeCd3f+cSzTPyrvXQWpXWoQR5DdTxuk
 w9MTAWgW4aqd4qJK9cAz8A08nZbuJzfgzBRQf//eciTaWsVRaDayzp8U
X-Google-Smtp-Source: AGHT+IGLEHkW+RyaKKz2KrNndnwh4djhORTNBKpw376Kno8bWHtJQuS7EruIxE2wip3vv6xuWjSI3w==
X-Received: by 2002:a05:600c:1d0f:b0:43b:d203:da18 with SMTP id
 5b1f17b1804b1-43bd295494bmr11723085e9.13.1741159837590; 
 Tue, 04 Mar 2025 23:30:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426cbc2sm8898505e9.4.2025.03.04.23.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 23:30:37 -0800 (PST)
Date: Wed, 5 Mar 2025 08:30:34 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
References: <Z75riltJo0WvOsS5@cassiopeiae> <20250226172120.GD28425@nvidia.com>
 <Z7-IHgcVVS8XBurW@cassiopeiae> <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304164201.GN133783@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Mar 04, 2025 at 12:42:01PM -0400, Jason Gunthorpe wrote:
> On Tue, Mar 04, 2025 at 05:10:45PM +0100, Simona Vetter wrote:
> > On Fri, Feb 28, 2025 at 02:40:13PM -0400, Jason Gunthorpe wrote:
> > > On Fri, Feb 28, 2025 at 11:52:57AM +0100, Simona Vetter wrote:
> > > 
> > > > - Nuke the driver binding manually through sysfs with the unbind files.
> > > > - Nuke all userspace that might beholding files and other resources open.
> > > > - At this point the module refcount should be zero and you can unload it.
> > > > 
> > > > Except developers really don't like the manual unbind step, and so we're
> > > > missing try_module_get() in a bunch of places where it really should be.
> > > 
> > > IMHO they are not missing, we just have a general rule that if a
> > > cleanup function, required to be called prior to module exit, revokes
> > > any .text pointers then you don't need to hold the module refcount.
> > > 
> > > file_operations doesn't have such a cleanup function which is why it
> > > takes the refcount.
> > > 
> > > hrtimer does have such a function which is why it doesn't take the
> > > refcount.
> > 
> > I was talking about a bunch of other places, where it works like
> > file_operations, except we don't bother with the module reference count.
> > I've seen patches fly by where people "fix" these things because module
> > unload is "broken".
> 
> Sure, but there are only two correct API approaches, either you
> require the user to make a cancel call that sanitizes the module
> references, or you manage them internally.
> 
> Hope and pray isn't an option :)
> 
> > gpu drivers can hog console_lock (yes we're trying to get away from that
> > as much as possible), at that point a cavalier attitude of "you can just
> > wait" isn't very appreciated.
> 
> What are you trying to solve here? If the system is already stuck
> infinitely on the console lock why is module remove even being
> considered?
> 
> module remove shouldn't be a remedy for a crashed driver...

I mean hotunplug here, and trying to make that correct.

This confusion is is why this is so hard, because there's really two main
users for all this:

- developers who want to quickly test new driver versions without full
  reboot. They're often preferring convenience over correctness, like with
  the removal of module refcounting that's strictly needed but means they
  first have to unbind drivers in sysfs before they can unload the driver.

  Another one is that this use-case prefers that the hw is cleanly shut
  down, so that you can actually load the new driver from a well-known
  state. And it's entirely ok if this all fails occasionally, it's just
  for development and testing.

- hotunplug as an actual use-case. Bugs are not ok. The hw can go away at
  any moment. And it might happen while you're holding console_lock. You
  generally do not remove the actual module here, which is why for the
  actual production use-case getting that part right isn't really
  required. But getting the lifetimes of all the various
  structs/objects/resources perfectly right is required.

So the "stuck on console_lock" is the 2nd case, not the first. Module
unload doesn't even come into play on that one.

> > > But so is half removing the driver while it is doing *anything* and
> > > trying to mitigate that with a different kind of hard to do locking
> > > fix. *shrug*
> > 
> > The thing is that rust helps you enormously with implementing revocable
> > resources and making sure you're not cheating with all the bail-out paths.
> 
> Assuming a half alive driver with MMIO and interrupts ripped away
> doesn't lock up.

Rust's drop takes care of that for you. It's not guaranteed, but it's a
case of "the minimal amount of typing yields correct code", unlike C,
where that just blows up for sure.

> Assuming all your interrupt triggered sleeps have gained a shootdown
> mechanism.

Hence why I want revocable to only be rcu, not srcu.

> Assuming all the new extra error paths this creates don't corrupt the
> internal state of the driver and cause it to lockup.

Yeah this one is a bit scary. Corrupting the state is doable, locking up
is much less likely I think, it seems to be more leaks that you get if
rust goes wrong.

> Meh. It doesn't seem like such an obvious win to me. Personally I'm
> terrified of the idea of a zombie driver half sitting around in a
> totally untestable configuration working properly..

Yeah agreed. I might really badly regret this all. But I'm not sold that
switching to message passing design is really going to be better, while
it's definitely going to be a huge amount of work.

> > It cannot help you with making sure you have interruptible/abortable
> > sleeps in all the right places. 
> 
> :(
> 
> > > Like, I see a THIS_MODULE in driver->fops == amdgpu_driver_kms_fops ?
> > 
> > Yeah it's there, except only for the userspace references and not for the
> > kernel internal ones. Because developers get a bit prickle about adding
> > those unfortunately due to "it breaks module unload". Maybe we just should
> > add them, at least for rust.
> 
> Yeah, I think such obviously wrong things should be pushed back
> against. We don't want EAF bugs in the kernel, we want security...

Maybe the two different use-cases above help explain why I'm a bit more
pragmatic here. As long as the hotunplug case does not gain bugs (or gets
some fixed) I'm fairly lax with hacks for the driver developer use-case of
reloading modules.

> > You've missed the "it will upset developers part". I've seen people remove
> > module references that are needed, to "fix" driver unloading.
> 
> When done properly the module can be unloaded. Most rdma driver
> modules are unloadable, live, while FDs are open.
> 
> > The third part is that I'm not aware of anything in rust that would
> > guarantee that the function pointer and the module reference actually
> > belong to each another. Which means another runtime check most likely, and
> > hence another thing that shouldn't fail which kinda can now.
> 
> I suspect it has to come from the C code API contracts, which leak
> into the binding design.
> 
> If the C API handles module refcounting internally then rust is fine
> so long as it enforces THIS_MODULE.

You could do contrived stuff and pass function pointers around, so that
THIS_MODULE doesn't actually match up with the function pointer. Sure it's
really stupid, but the idea with rust is that for memory safety stuff like
this, it's not just stupid, but impossible and the compiler will catch
you. So we need a tad more for rust.

> If the C API requires cancel then rust is fine so long as the binding
> guarantees cancel before module unload.

Yeah this is again where I think rust needs a bit more, because the
compiler can't always nicely proof this for you in all the "obvious"
cases.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
