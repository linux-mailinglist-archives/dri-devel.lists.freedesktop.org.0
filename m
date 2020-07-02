Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750D7212BF7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 20:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8053D6E39E;
	Thu,  2 Jul 2020 18:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE726E39E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 18:15:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 22so28199072wmg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 11:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qF98tY/UtOPH/MuBaKMM3aDJdg7Q3Nk5wfl/7KEgWoU=;
 b=FkouPLoRIAP2/Zvzd1HT0er1nSeLYZXLfgtChU9vTX6cWTmpX2FJna3yLUuGKkD9Iv
 9e3cKfab0wDqpHEngNHbsRgvKDZpFrhs6u/t5E33t0ZIWRdCZXk+1l1OfGb1zALLWcUc
 0j7X/SGTy5vaUzUn4at0z0Y9DXYmRxwpT1lDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qF98tY/UtOPH/MuBaKMM3aDJdg7Q3Nk5wfl/7KEgWoU=;
 b=RTMKAa5fCwdfovlyEaPaf20hFBJxU1+qobedzT5av9ekBScP8liau4UHQywO0o/Ffj
 +N+/y5gOUAXensOFrDhcutuGs1zc8JkPz3tRKBg2LEDFL8io+UMQK489P6E58GdpKA5G
 YdnKF4sud1N14jhmc5n6g7HvfK5WsuVKyA+79YP7DZDcY0TR0KCWvIb248T4BG7ciXqT
 Hv57depSLAsNxfQOAulKSdd8Gej2RCKunWEBW12Q0nj/t+PS4kfVgsUpWhWrlQbqU79x
 DCEfcQlmGLbSvZ828FsjO05nTCcNodHuh6LmYvjXcznUSMA6a+7JzQdEMcX/emjF+0CL
 WAUQ==
X-Gm-Message-State: AOAM532YFuYwLFO6PrX1sYEaIntvC6aVSIhuKM2fJREUBAU582YYa5ye
 CkgzP19wNtzhV5q6wISYq8ZSNg==
X-Google-Smtp-Source: ABdhPJziPSjjE/NMYFMBsnpWNlswP8ygmDt8kyB+GOmCSABy+Al7XKgDrbQ1pZ63IFBO2v08h7AXtA==
X-Received: by 2002:a1c:7717:: with SMTP id t23mr32399211wmi.75.1593713743709; 
 Thu, 02 Jul 2020 11:15:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w13sm11307032wrr.67.2020.07.02.11.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 11:15:42 -0700 (PDT)
Date: Thu, 2 Jul 2020 20:15:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Message-ID: <20200702181540.GC3278063@phenom.ffwll.local>
References: <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
 <20200701123904.GM25301@ziepe.ca>
 <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
 <CAKMK7uFf3_a+BN8CM7G8mNQPNtVBorouB+R5kxbbmFSB9XbeSg@mail.gmail.com>
 <20200701171524.GN25301@ziepe.ca>
 <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 04:50:32PM +0200, Christian K=F6nig wrote:
> Am 02.07.20 um 15:29 schrieb Jason Gunthorpe:
> > On Thu, Jul 02, 2020 at 03:10:00PM +0200, Daniel Vetter wrote:
> > > On Wed, Jul 01, 2020 at 02:15:24PM -0300, Jason Gunthorpe wrote:
> > > > On Wed, Jul 01, 2020 at 05:42:21PM +0200, Daniel Vetter wrote:
> > > > > > > > All you need is the ability to stop wait for ongoing access=
es to end and
> > > > > > > > make sure that new ones grab a new mapping.
> > > > > > > Swap and flush isn't a general HW ability either..
> > > > > > > =

> > > > > > > I'm unclear how this could be useful, it is guarenteed to cor=
rupt
> > > > > > > in-progress writes?
> > > > > > > =

> > > > > > > Did you mean pause, swap and resume? That's ODP.
> > > > > > Yes, something like this. And good to know, never heard of ODP.
> > > > > Hm I thought ODP was full hw page faults at an individual page
> > > > > level,
> > > > Yes
> > > > =

> > > > > and this stop&resume is for the entire nic. Under the hood both a=
pply
> > > > > back-pressure on the network if a transmission can't be received,
> > > > > but
> > > > NIC's don't do stop and resume, blocking the Rx pipe is very
> > > > problematic and performance destroying.
> > > > =

> > > > The strategy for something like ODP is more complex, and so far no =
NIC
> > > > has deployed it at any granularity larger than per-page.
> > > > =

> > > > > So since Jason really doesn't like dma_fence much I think for rdma
> > > > > synchronous it is. And it shouldn't really matter, since waiting =
for a
> > > > > small transaction to complete at rdma wire speed isn't really that
> > > > > long an operation.
> > > > Even if DMA fence were to somehow be involved, how would it look?
> > > Well above you're saying it would be performance destroying, but let's
> > > pretend that's not a problem :-) Also, I have no clue about rdma, so =
this
> > > is really just the flow we have on the gpu side.
> > I see, no, this is not workable, the command flow in RDMA is not at
> > all like GPU - what you are a proposing is a global 'stop the whole
> > chip' Tx and Rx flows for an undetermined time. Not feasible

Yeah, I said I have no clue about rdma :-)

> > What we can do is use ODP techniques and pause only the MR attached to
> > the DMA buf with the process you outline below. This is not so hard to
> > implement.
> =

> Well it boils down to only two requirements:
> =

> 1. You can stop accessing the memory or addresses exported by the DMA-buf.
> =

> 2. Before the next access you need to acquire a new mapping.
> =

> How you do this is perfectly up to you. E.g. you can stop everything, just
> prevent access to this DMA-buf, or just pause the users of this DMA-buf..=
..

Yeah in a gpu we also don't stop the entire world, only the context that
needs the buffer. If there's other stuff to run, we do keep running that.
Usually the reason for a buffer move is that we do actually have other
stuff that needs to be run, and which needs more vram for itself, so we
might have to throw out a few buffers from vram that can also be placed in
system memory.

Note that a modern gpu has multiple engines and most have or are gaining
hw scheduling of some sort, so there's a pile of concurrent gpu context
execution going on at any moment. The days where we just push gpu work
into a fifo are (mostly) long gone.

> > > 3. rdma driver worker gets busy to restart rx:
> > > 	1. lock all dma-buf that are currently in use (dma_resv_lock).
> > > 	thanks to ww_mutex deadlock avoidance this is possible
> > Why all? Why not just lock the one that was invalidated to restore the
> > mappings? That is some artifact of the GPU approach?
> =

> No, but you must make sure that mapping one doesn't invalidate others you
> need.
> =

> Otherwise you can end up in a nice live lock :)

Also if you don't have pagefaults, but have to track busy memory at a
context level, you do need to grab all locks of all buffers you need, or
you'd race. There's nothing stopping a concurrent ->notify_move on some
other buffer you'll need otherwise, and if you try to be clever and roll
you're own locking, you'll anger lockdep - you're own lock will have to be
on both sides of ww_mutex or it wont work, and that deadlocks.

So ww_mutex multi-lock dance or bust.

> > And why is this done with work queues and locking instead of a
> > callback saying the buffer is valid again?
> =

> You can do this as well, but a work queue is usually easier to handle tha=
n a
> notification in an interrupt context of a foreign driver.

Yeah you can just install a dma_fence callback but
- that's hardirq context
- if you don't have per-page hw faults you need the multi-lock ww_mutex
  dance anyway to avoid races.

On top of that the exporter has no idea whether the importer still really
needs the mapping, or whether it was just kept around opportunistically.
pte setup isn't free, so by default gpus keep everything mapped. At least
for the classic gl/vk execution model, compute like rocm/amdkfd is a bit
different here.

Cheers, Daniel

> =

> Regards,
> Christian.
> =

> > =

> > Jason
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
