Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE6A4E51C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD03010E64B;
	Tue,  4 Mar 2025 16:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fNBg+yFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4D810E649
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:10:51 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-390f69e71c8so2525325f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741104649; x=1741709449; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iIy9PeTTsN4YAiA2ClJKxcubBrW079aT6S1+RxVahlY=;
 b=fNBg+yFQpDDnY8iawwWojKC1fEP9AyR0FJrRGSJuVRLyeq149Erzx/RP/u5zUoCep9
 v9M8L45Ngv/pbXWpQ7dUctlMFUf9J3+IErQczW6n0ex+YujHZqJ1wKFlXcUJ3uxqsf4y
 kTca8AzBTzYjL8SkiuE24PjSoxs495fZcND9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741104649; x=1741709449;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iIy9PeTTsN4YAiA2ClJKxcubBrW079aT6S1+RxVahlY=;
 b=bRq32L/HvJ/XzL9kG151EOLF7gnIlmzi/aDL3UQZc4uCI4Vm+wfFdBsQS1fbF37Skz
 FwFAywAWcUWMoCbqEst03enh2mpMlhy15QwxqaVXPLjKkl1onH1RPmeX65o/1Ys7KcE+
 b8zRJJ8+xoBaz+Bs1CksvRu6Rlca1o3yaGRdiDUjDPu7+OUVkMAvVVoYImq93/S0aJty
 DXkB4bsgTx97s1dWHBWyyYDyTraZK8j1GhZkTJAFonehYP3dV7DLxkWKtO66AHjWdCxW
 TCbjP/9vC587qd9qDrLnWjWfNKVoJ9o4IWJWiZg+qIRaMZW/c3Can7P/0nMXqrWfeA8t
 pkLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxXiKXNDGZJyJGxSF+GgFQ86wWZTblZEX50IehTeopU6h+1zi7+LT9/B/6bv76LBFkkzqo4gDQhsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0hK/k6a5ohTgGNKQvLHXgTVZUz2NepBX2NPGK7WSr19iRjV3v
 LXJUFmRIH9ExjiUih2N7V4iGZMTUweXnd/LrlKA19jaEOS+Ymt2ordpUcNjJTng=
X-Gm-Gg: ASbGncuOTJsp5+SaaZmmsVDLhU8b7fxUspS2T6FkXYvz7VSm/8mYdxEiXm2E8tw+64d
 CyN5wUouBhCikHXcOnDGrr0PbYxWUlldrLiYzbkcJ7vtqZ8zqlOzT60HiTE9Z65/NP+FSKyD8xf
 jLc622s4x7KvzxTBvRKIyGNjbMefuxEE0NAhEZID4U3SdzpObx860+GWt0tPfs2nqLXnmiL7C/k
 AzS9qlR8eZX9xJeLEph2qeKTDdW0yxcy/tkBtSjDusKF0c7+0GHPJQ0wfX3/j2kOf1OdUdGPzkk
 wJkShTLGgxBc5VK5SPh7r5Ip1fLwG/XkA6PFl0gay5chCi05BuoNVQSg
X-Google-Smtp-Source: AGHT+IGYstbykxSLckXcDtbIvHnaqvWhbPG4L7oRKtT9m1rH0Ss1kauZrIqVjxI5p2CBcuWK44nyyA==
X-Received: by 2002:a05:6000:402b:b0:38f:3224:65e5 with SMTP id
 ffacd0b85a97d-39115605344mr3132563f8f.12.1741104649374; 
 Tue, 04 Mar 2025 08:10:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485db82sm17762968f8f.88.2025.03.04.08.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 08:10:47 -0800 (PST)
Date: Tue, 4 Mar 2025 17:10:45 +0100
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
Message-ID: <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
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
References: <Z75WKSRlUVEqpysJ@cassiopeiae> <20250226004916.GB4959@nvidia.com>
 <Z75riltJo0WvOsS5@cassiopeiae> <20250226172120.GD28425@nvidia.com>
 <Z7-IHgcVVS8XBurW@cassiopeiae> <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228184013.GF39591@nvidia.com>
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

On Fri, Feb 28, 2025 at 02:40:13PM -0400, Jason Gunthorpe wrote:
> On Fri, Feb 28, 2025 at 11:52:57AM +0100, Simona Vetter wrote:
> 
> > - Nuke the driver binding manually through sysfs with the unbind files.
> > - Nuke all userspace that might beholding files and other resources open.
> > - At this point the module refcount should be zero and you can unload it.
> > 
> > Except developers really don't like the manual unbind step, and so we're
> > missing try_module_get() in a bunch of places where it really should be.
> 
> IMHO they are not missing, we just have a general rule that if a
> cleanup function, required to be called prior to module exit, revokes
> any .text pointers then you don't need to hold the module refcount.
> 
> file_operations doesn't have such a cleanup function which is why it
> takes the refcount.
> 
> hrtimer does have such a function which is why it doesn't take the
> refcount.

I was talking about a bunch of other places, where it works like
file_operations, except we don't bother with the module reference count.
I've seen patches fly by where people "fix" these things because module
unload is "broken".

> > Now wrt why you can't just solve this all at the subsystem level and
> > guarantee that after drm_dev_unplug no code is running in driver callbacks
> > anymore:
> > 
> > In really, really simple subsystems like backlight this is doable. In drm
> > with arbitrary ioctl this isn't, and you get to make a choice:
> 
> It is certainly doable, you list the right way to do it right below
> and RDMA implements that successfully.
> 
> The subsytem owns all FDs and proxies all file_opertions to the driver
> (after improving them :) and that is protected by a rwsem/SRCU that
> is safe against the removal path setting all driver ops to NULL.

I'm not saying that any of these approaches are bad. For some cases we
plan to use them in gpu code too even. The above is pretty much the plan
we have for dma_fence.

> > - You wait until all driver code finishes, which could be never if there's
> >   ioctl that wait for render to complete and don't handle hotunplug
> >   correctly. This is a deadlock.
> 
> Meh. We waited for all FDs to close for along time. It isn't a
> "deadlock" it is just a wait on userspace that extends to module
> unload. Very undesirable yes, but not the end of the world, it can
> resolve itself if userspace shutsdown.
> 
> But, IMHO, the subsystem and driver should shoot down the waits during
> remove.
> 
> Your infinite waits are all interruptable right? :)

So yeah userspace you can shoot down with SIGKILL, assuming really good
programming. But there's also all the in-kernel operations between various
work queues and other threads. This can be easily fixed by just rewriting
the entire thing into a strict message passing paradigm. Unfortunately
rust has to interop with the current existing mess.

gpu drivers can hog console_lock (yes we're trying to get away from that
as much as possible), at that point a cavalier attitude of "you can just
wait" isn't very appreciated.

And once you've made sure that really everything can bail out of you've
gotten pretty close to reimplementing revocable resources.

> >   In my experience this is theorically possible, practically no one gets
> >   this right and defacto means that actual hotunplug under load has a good
> >   chance of just hanging forever. Which is why drm doesn't do this.
> 
> See, we didn't have this problem as we don't have infinite waits in
> driver as part of the API. The API toward the driver is event driven..

Yeah rolling everything over to event passing and message queues would
sort this out a lot. It's kinda not where we are though.

> I can understand that adding the shootdown logic all over the place
> would be hard and you'd get it wrong.
> 
> But so is half removing the driver while it is doing *anything* and
> trying to mitigate that with a different kind of hard to do locking
> fix. *shrug*

The thing is that rust helps you enormously with implementing revocable
resources and making sure you're not cheating with all the bail-out paths.

It cannot help you with making sure you have interruptible/abortable
sleeps in all the right places. Yes this is a bit a disappointment, but
fundamentally rust cannot model negative contexts (unlike strictly
functional languages like haskell) where certain operations are not
allowed. But it is much, much better than C at "this could fail, you must
handle it and not screw up".

In some cases you can plug this gap with runtime validation, like fake
lockdep contexts behind the might_alloc_gfp() checks and similar tricks
we're using on the C side too. Given that I'm still struggling with
weeding out design deadlocks at normal operations. For example runtime pm
is an absolute disaster on this, and a lot of drivers fail real bad once
you add lockdep annotations for runtime pm. I'll probably retire before I
get to doing this for driver unload.

> >   This is why I like the rust Revocable so much, because it's a normal rcu
> >   section, so disallows all sleeping. You might still deadlock on a busy
> >   loop waiting for hw without having a timeout. But that's generally
> >   fairly easy to spot, and good drivers have macros/helpers for this so
> >   that there is always a timeout.
> 
> The Recovable version narrows the critical sections to very small
> regions, but having critical sections at all is still, IMHO, hacky.
> 
> What you should ask Rust to solve for you is the infinite waits! That
> is the root cause of your problem. Compiler enforces no waits with out
> a revocation option on DRM callbacks!
> 
> Wouldn't that be much better??

It would indeed be nice. I haven't seen that rust unicorn yet though, and
from my understanding it's just not something rust can give you. Rust
isn't magic, it's just a tool that can do a few fairly specific things a
lot better than C. But otherwise it's still the same mess.

> >   drm_dev_unplug uses sleepable rcu for practicality reasons and so has a
> >   much, much higher chance of deadlocks. Note that strictly speaking
> >   drm_device should hold a module reference on the driver, but see above
> >   for why we don't have that - developers prefer convenience over
> >   correctness in this area.
> 
> Doesn't DRM have a module reference because the fops is in the driver
> and the file core takes the driver module reference during
> fops_get()/replace_fops() in drm_stub_open()? Or do I misunderstand
> what that stub is for?
> 
> Like, I see a THIS_MODULE in driver->fops == amdgpu_driver_kms_fops ?

Yeah it's there, except only for the userspace references and not for the
kernel internal ones. Because developers get a bit prickle about adding
those unfortunately due to "it breaks module unload". Maybe we just should
add them, at least for rust.

> > We can and should definitely try to make this much better. I think we can
> > get to full correctness wrt the first 3 lifetime things in rust. I'm not
> > sure whether handling module unload/.text lifetime is worth the bother,
> > it's probably only going to upset developers if we try. 
> 
> It hurts to read a suggestion we should ignore .text lifetime rules :(
> DRM can be be like this, but please don't push that mess onto the rest
> of the world in the common rust bindings or common rust design
> patterns. Especially after places have invested alot to properly and
> fully fix these problems without EAF bugs, infinite wait problems or
> otherwise.
> 
> My suggestion is that new DRM rust drivers should have the file
> operations isolation like RDMA does and a design goal to have
> revocable sleeps. No EAF issue. You don't have to fix the whole DRM
> subsystem to get here, just some fairly small work that only new rust
> drivers would use. Start off on a good foot. <shrug>

You've missed the "it will upset developers part". I've seen people remove
module references that are needed, to "fix" driver unloading.

The other part is that rust isn't magic, the compiler cannot reasons
through every possible correct api. Which means that sometimes it forces a
failure path on you that you know cannot ever happen, but you cannot teach
the compiler how to prove that. You can side-step that by runtime death in
rust aka BUG_ON(). Which isn't popular really either.

The third part is that I'm not aware of anything in rust that would
guarantee that the function pointer and the module reference actually
belong to each another. Which means another runtime check most likely, and
hence another thing that shouldn't fail which kinda can now.

Hence my conclusion that maybe it's just not the top priority to get this
all perfect.

Cheers, Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
