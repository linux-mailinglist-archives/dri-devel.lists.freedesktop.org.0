Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A2C96B743
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD8689F01;
	Wed,  4 Sep 2024 09:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="f2tCW11Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED5889F01
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:46:58 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42bb81e795bso51879335e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725443217; x=1726048017; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=T6BUkIfRxZhJ4+sNbutGI5NyA8MD87SuwTWqAR1wz+c=;
 b=f2tCW11ZnpDxuxNPsDHIB5UdxLBaMAe39C4Dfoe3wj5qWP4v5UKjdsCxJC3uKs6k+l
 Ow0JN16Z2qLuV+t+OF5buCb9Cdt5gEZWDJ5PVBpGQeMWcHjDffUk930fUC4kYku/Qo8v
 9sFd5zrYhtyTjpEWIKrZ4I3Or8AeLNgrj7dnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725443217; x=1726048017;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6BUkIfRxZhJ4+sNbutGI5NyA8MD87SuwTWqAR1wz+c=;
 b=g9ZlrVcDe+7BuMFv24E5qZkAfcSkWGJek8Uub740wQdlXHO3S330tZ1i0cxDTEKb8/
 n6r4xkcSSJtFNCQ9I32EGWe0NsscG+9lX8rNmFY7ewMgdWlIrqW1XVJVNUvEbb7JnSgI
 S5e0zfD4P4feE6zQnjLu1xL9q5qrznvd4K4MYcrB3jBFuB4x5UEoVrRY1NLPui67sDhT
 HQlK2deUcP/Gx/8EtrxWY9Iuq6vbTbhr7fMmQ5sjGJhX9nY2LLyPs19ocKLqoInGgK08
 TRKMWn1fdVe7uhMGW8/pkBF/uPWA9cpQVqThV0A2WlDkG90dqlumfIsBDZyF+K5xTrKb
 twyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhxLDrR+B5ZKOUO0LcNNBR+Et7Fs7/ALQe91g3CbBQpi+hSepYjYZHlp9VLb8ZAYhPw9ugkR7mHxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7IFsJQVjJPOeAeJjZbfLe49c+gCd2OyHp9SeMFkheitG+9R/n
 Rgx5WinsYScQz2undKM0a08puAhqUzp0Cu+KOoIG91/sH059nPP+RKfAwgI1FsjAbyXGkdluhjS
 H
X-Google-Smtp-Source: AGHT+IHHZ2njdpkFBpYapxZTjNiEE5085/pPphTzasiwKLjfXy8Gi8570cqXHjqv+8agxWGaIcqhuw==
X-Received: by 2002:a5d:4a09:0:b0:374:bd0c:40e0 with SMTP id
 ffacd0b85a97d-374bd0c4565mr8277757f8f.14.1725443216834; 
 Wed, 04 Sep 2024 02:46:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c61a7f03sm9436475f8f.55.2024.09.04.02.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:46:56 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:46:54 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <ZtgsjoCWI4aDWpSi@phenom.ffwll.local>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
 <710b6946-ce8e-42ed-8df6-aa76bf0d5f3f@amd.com>
 <ZtW8aiIhBA5KBLR6@phenom.ffwll.local>
 <b6185b8e-148a-494e-a336-e4290c38b700@amd.com>
 <ZtbFJRZKA4UghVai@phenom.ffwll.local>
 <77ce6514-7050-4b17-b7f8-096b7933dcfb@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77ce6514-7050-4b17-b7f8-096b7933dcfb@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Wed, Sep 04, 2024 at 09:40:36AM +0200, Christian König wrote:
> Am 03.09.24 um 10:13 schrieb Simona Vetter:
> > [SNIP]
> > > > So I think the issue is much, much bigger, and there's more. And the
> > > > issue is I think a fundamental design issue of dma_fence itself, not
> > > > individual users.
> > > IIRC both Alex and me pointed out this issue on the very first dma_fence
> > > code and nobody really cared.
> > I guess way back then we didn't really sort out any of the hotunplug
> > issues, and there wasn't any fw ctx schedulers at least on our horizons
> > yet. Thin excuse, I know ...
> 
> Well it's just when you have a bee string and a broken leg, what do you
> attend first? :)

Yeah ...

> > > >    I think at the core it's two constraints:
> > > > 
> > > > - dma_fence can stick around practically forever in varios container
> > > >     objects. We only garbage collect when someone looks, and not even then
> > > >     consistently.
> > > > 
> > > > - fences are meant to be cheap, so they do not have the big refcount going
> > > >     on like other shared objects like dma_buf
> > > > 
> > > > Specifically there's also no refcounting on the module itself with the
> > > > ->owner and try_module_get stuff. So even if we fix all these issues on
> > > > the data structure lifetime side of things, you might still oops calling
> > > > into dma_fence->ops->release.
> > > > 
> > > > Oops.
> > > Yes, exactly that. I'm a bit surprised that you realize that only now :)
> > > 
> > > We have the issue for at least 10 years or so and it pops up every now and
> > > then on my desk because people complain that unloading amdgpu crashes.
> > Yeah I knew about the issue. The new idea that popped into my mind is that
> > I think we cannot plug this properly unless we do it in dma_fence.c for
> > everyone, and essentially reshape the lifetime rules for that from yolo
> > to something actually well-defined.
> > 
> > Kinda similar work to how dma_resv locking rules and fence book-keeping
> > were unified to something that actually works across drivers ...
> 
> Well sounds like I've just got more items on my TODO list.
> 
> I have patches waiting to be send out going into this direction anyway, will
> try to get them out by the end of the week and then we can discuss what's
> still missing.

Quick addition, another motivator from the panthor userspace submit
discussion: If the preempt ctx fence concept spreads, that's another
non-drm_sched fence that drivers will need and are pretty much guaranteed
to get wrong.

Also maybe Boris volunteers to help out with some of the work here? Or
perhaps some of the nova folks, it seems to be even more a pain for rust
drivers ...

Cheers, Sima

> 
> Christian.
> 
> > > > I think the complete solution is if we change this code all so that core
> > > > dma-fence.c code guarantees to never ever again call into any driver code
> > > > after dma_fence_signal has been called, and takes over the final kfree_rcu
> > > > itself. But that's a giantic change. But I think it's the only way to
> > > > really fix this mess:
> > > > 
> > > > - drivers will clean up any of their own references in a timely fashion,
> > > >     so no more accidentally lingering gpu context or vms and the bo they
> > > >     have mapped lying around.
> > > > 
> > > > - there's no lifetime or other use-after-free issues anywhere for fences
> > > >     anymore
> > > > 
> > > > Downside is that some of the debugging stuff becomes a bit less useful.
> > > > But e.g. tracepoints could just dump the timeline once at creation or when
> > > > signalling, and so you don't need to dump it anymore when freeing. And a
> > > > signalled fence is generally not a problem anymore, so in a compositor
> > > > that's also all fine (iirc you can get at some of this stuff through the
> > > > sync_file interfaces too).
> > > > 
> > > > The other downside is that it's a huge pile of work, but I don't think we
> > > > can get to an actually solid design with less headaches and pain ...
> > > > 
> > > > Thoughts?
> > > The alternative is to use the scheduler fence(s) to decouple hardware fences
> > > from the containers. That would be rather cheap to implement.
> > > 
> > > The only downside would be that the scheduler module probably keeps loaded
> > > forever once used. But at least I can live with that.
> > Yeah I think interim it's an ok stop-gap. But aside from keeping the
> > scheduler code pinned forever I think there's some more things:
> > 
> > - I'm not sure we can do it, without digging into dma_fence.c locking
> >    internals too much.
> > 
> > - It defacto means you can use dma_fence that are fence containers and
> >    drm_sched_job_fence, and nothing else. And drivers will get this wrong
> >    and do dma_fence ad-hoc for stuff like tlb flushing, or pte writing, and
> >    whatever else, that won't necessairly go through a drm_sched.
> > 
> > So not great imo, and hence why I've shifted towards that we should fix
> > this in dma_fence.c code for everyone.
> > -Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
