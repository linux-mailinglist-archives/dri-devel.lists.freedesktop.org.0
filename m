Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEC213A46
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 14:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EA16EB84;
	Fri,  3 Jul 2020 12:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E4F6EB84
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 12:52:15 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w17so25715853oie.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d3u1KZN5ZlKpHOmDO6RUvjkz9kTnQwFP6vsb5Eol2/c=;
 b=QWXYOQy+VCuf2WjDWQ7KYQMe6r/uIH21Bj1A8nJsn0Y4hqb6p8dGunYf/n6+n4+Yda
 tEfCpNnuX5GhQxIwAIruYqpK3+wTH1b0Cj7uUleXWHQZYI1vpj2WiP96B86UaB4r2iCu
 zp4i0BYfDL7piO2qGoBTyvzWHp1G1uyfbXhwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3u1KZN5ZlKpHOmDO6RUvjkz9kTnQwFP6vsb5Eol2/c=;
 b=AKnzTxKTaSsKEL1YXo9cIS5NnkatsTyzZecQIdWjvCFxubtk/UwDgvW183nLDF9DXi
 /pKWz762h/FMmpRrQphNSDKDxhJjTsQ7RCj6tVu1CTe3hvRikKiwfQNazbpv16KqlDU2
 EeSPS4/znVtGV6ZMw/rYNbuVWrZdnhqAflAB1T82wDqqSZ9lKGhGC1waZYn0PpXtCtfx
 iVZbB50cdoz5JIbw767YvIxooJ4AdG9bt5AUARGsgf+qIsLKrsobgLewlNUuooiAedaM
 GpvAsVLkUBQrX1VcnxyRB2nygKlChRqFYCmJDvkzdSon1gfVGmJNjxqWta0y3rhd5fl2
 +CQQ==
X-Gm-Message-State: AOAM532kbpptlVsR3PiQTJuxBZk55HHd21U6/PsY0lgnZ2SOGlNyvH/v
 zCUq1JhDnY1krbff47dNs31/HhbRHomNHr1UScOBTg==
X-Google-Smtp-Source: ABdhPJxlOQ/PDQ5h3P/q8vKmmg8FCcGhoy+KucS9/nEmOeXfn/9JDfWP1jvPSTo15Kr4cT8LMx+M0RaZewXR/lEfpMg=
X-Received: by 2002:a05:6808:88:: with SMTP id
 s8mr11143882oic.101.1593780734495; 
 Fri, 03 Jul 2020 05:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
 <20200701123904.GM25301@ziepe.ca>
 <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
 <CAKMK7uFf3_a+BN8CM7G8mNQPNtVBorouB+R5kxbbmFSB9XbeSg@mail.gmail.com>
 <20200701171524.GN25301@ziepe.ca>
 <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
 <20200702181540.GC3278063@phenom.ffwll.local>
 <20200703120335.GT25301@ziepe.ca>
In-Reply-To: <20200703120335.GT25301@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 3 Jul 2020 14:52:03 +0200
Message-ID: <CAKMK7uGqABchpPLTm=vmabkwK3JJSzWTFWhfU+ywbwjw-HgSzw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 3, 2020 at 2:03 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Jul 02, 2020 at 08:15:40PM +0200, Daniel Vetter wrote:
> > > > > 3. rdma driver worker gets busy to restart rx:
> > > > >         1. lock all dma-buf that are currently in use (dma_resv_lock).
> > > > >         thanks to ww_mutex deadlock avoidance this is possible
> > > > Why all? Why not just lock the one that was invalidated to restore the
> > > > mappings? That is some artifact of the GPU approach?
> > >
> > > No, but you must make sure that mapping one doesn't invalidate others you
> > > need.
> > >
> > > Otherwise you can end up in a nice live lock :)
> >
> > Also if you don't have pagefaults, but have to track busy memory at a
> > context level, you do need to grab all locks of all buffers you need, or
> > you'd race. There's nothing stopping a concurrent ->notify_move on some
> > other buffer you'll need otherwise, and if you try to be clever and roll
> > you're own locking, you'll anger lockdep - you're own lock will have to be
> > on both sides of ww_mutex or it wont work, and that deadlocks.
>
> So you are worried about atomically building some multi buffer
> transaction? I don't think this applies to RDMA which isn't going to
> be transcational here..

So maybe I'm just totally confused about the rdma model. I thought:
- you bind a pile of memory for various transactions, that might
happen whenever. Kernel driver doesn't have much if any insight into
when memory isn't needed anymore. I think in the rdma world that's
called registering memory, but not sure.

- for hw with hw faults you can pull in the memory when it's needed,
and if concurrently another cpu is taking away pages and invalidating
rdma hw mappings, then that's no problem.

So far so good, 0 need for atomic transactions anything.

But the answer I gave here is for when you don't have per-page hw
faulting on the rdma nic, but something that works at a much larger
level. For a gpu it would be a compute context, no idea what the
equivalent for rdma is. This could go up to and including the entire
nic stalling all rx with link level back pressure, but not
necessarily.

Once you go above a single page, or well, at least a single dma-buf
object, you need some way to know when you have all buffers and memory
mappings present again, because you can't restart with only partial
memory.

Now if the rdma memory programming is more like traditional
networking, where you have a single rx or tx buffer, then yeah you
don't need fancy multi-buffer locking. Like I said I have no idea how
many of the buffers you need to restart the rdma stuff for hw which
doesn't have per-page hw faulting.

> > > > And why is this done with work queues and locking instead of a
> > > > callback saying the buffer is valid again?
> > >
> > > You can do this as well, but a work queue is usually easier to handle than a
> > > notification in an interrupt context of a foreign driver.
> >
> > Yeah you can just install a dma_fence callback but
> > - that's hardirq context
> > - if you don't have per-page hw faults you need the multi-lock ww_mutex
> >   dance anyway to avoid races.
>
> It is still best to avoid the per-page faults and preload the new
> mapping once it is ready.

Sure, but I think that's entirely orthogonal.

Also even if you don't need the multi-buffer dance (either because hw
faults, or because the rdma rx/tx can be stopped at least at a
per-buffer level through some other means) then you still need the
dma_resv_lock to serialize with the exporter. So needs a sleeping
context either way. Hence some worker is needed.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
