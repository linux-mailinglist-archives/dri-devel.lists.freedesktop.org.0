Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589134EBD77
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495210E1FF;
	Wed, 30 Mar 2022 09:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0463310E1FF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:19:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso462509wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 02:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=BjvaahtIsng/TZTSS+ZLGH9DkC6uyw+QOr3R4CbvEwA=;
 b=PvZ2uaOMM804ZV6olrT1ose8FexLJBR86tzLTmt96xq+4DEZIepwKKqPLJGvhXkAk1
 ODIHx0dQWKaaX2xuMogIgrrOOr+hU9N+hGDuKq0vjvAYtj1+IJ1lOqQLEaShnODcLGPr
 HZjfBDaJb1ETDaXHPJp7q1z5KLR5oa62e926c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=BjvaahtIsng/TZTSS+ZLGH9DkC6uyw+QOr3R4CbvEwA=;
 b=WrSZOJa3imqhdMdXpGSCImItHXDDLDCN0ZZ8CeQsVyF0B3jxJDzKK8kQp9wbuPRPuH
 fmDH90AjLy4kGHKh1Pk0IIGjHw3muHiXuBY6Od4HupyyH1xkFG10gkasIWJi3HbclEty
 1gkATMJojhYS3V5x/VCn/lSP4KbdcMoilZqpj1ngmK8t/F2bOYNo0SmSd8Pb1eGGif2Z
 nZR5ZfGvcIOfK5o+6pRTVzdu3D3zgy9kZbO4IhpA3JWMewWwYbtB6SsnMa9NOUr0OaoU
 Ni9rXf7X+pD7TodQIhBY4LxJTz3ZU3sJ7Yy2L2bN+RxPRC/46idcv4ipGtOiW/iTJ59K
 nZWA==
X-Gm-Message-State: AOAM532gzQbdCbJohi/aHTLmIhyX9+u2rJoJUMQNhegNnmjp9rzQe8j5
 ejv6mTXd6Iv7WHw4IbEpDMKB5LF5ApJ6LyUi
X-Google-Smtp-Source: ABdhPJy+LT8MMat8kRBweRrDpiWhyLK1kwpF4rETyVQeSR73vutuwtBN875Ec14LZ77RQUXeBlbHKw==
X-Received: by 2002:a05:600c:4ec9:b0:38b:f1fd:b6b9 with SMTP id
 g9-20020a05600c4ec900b0038bf1fdb6b9mr3412692wmq.7.1648631966316; 
 Wed, 30 Mar 2022 02:19:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm16383776wrm.82.2022.03.30.02.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 02:19:25 -0700 (PDT)
Date: Wed, 30 Mar 2022 11:19:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 00/12] iio: buffer-dma: write() and new DMABUF based API
Message-ID: <YkQgmxlCMCzCWq8c@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Jonathan Cameron <jic23@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220213184616.669b490b@jic23-huawei>
 <N8XC7R.5FP2M8552CGT3@crapouillou.net>
 <YkLEXJzs8ukrxG8s@phenom.ffwll.local>
 <QI1I9R.GDPWLM86I45S@crapouillou.net>
 <YkMTZLea4+X39Fp8@phenom.ffwll.local>
 <80OI9R.QH1992Y5TBBX1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80OI9R.QH1992Y5TBBX1@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 06:16:56PM +0100, Paul Cercueil wrote:
> Hi Daniel,
> 
> Le mar., mars 29 2022 at 16:10:44 +0200, Daniel Vetter <daniel@ffwll.ch> a
> écrit :
> > On Tue, Mar 29, 2022 at 10:11:14AM +0100, Paul Cercueil wrote:
> > >  Hi Daniel,
> > > 
> > >  Le mar., mars 29 2022 at 10:33:32 +0200, Daniel Vetter
> > > <daniel@ffwll.ch> a
> > >  écrit :
> > >  > On Tue, Feb 15, 2022 at 05:43:35PM +0000, Paul Cercueil wrote:
> > >  > >  Hi Jonathan,
> > >  > >
> > >  > >  Le dim., févr. 13 2022 at 18:46:16 +0000, Jonathan Cameron
> > >  > >  <jic23@kernel.org> a écrit :
> > >  > >  > On Mon,  7 Feb 2022 12:59:21 +0000
> > >  > >  > Paul Cercueil <paul@crapouillou.net> wrote:
> > >  > >  >
> > >  > >  > >  Hi Jonathan,
> > >  > >  > >
> > >  > >  > >  This is the V2 of my patchset that introduces a new
> > > userspace
> > >  > >  > > interface
> > >  > >  > >  based on DMABUF objects to complement the fileio API, and
> > > adds
> > >  > >  > > write()
> > >  > >  > >  support to the existing fileio API.
> > >  > >  >
> > >  > >  > Hi Paul,
> > >  > >  >
> > >  > >  > It's been a little while. Perhaps you could summarize the
> > > various
> > >  > > view
> > >  > >  > points around the appropriateness of using DMABUF for this?
> > >  > >  > I appreciate it is a tricky topic to distil into a brief
> > > summary
> > >  > > but
> > >  > >  > I know I would find it useful even if no one else does!
> > >  > >
> > >  > >  So we want to have a high-speed interface where buffers of
> > > samples
> > >  > > are
> > >  > >  passed around between IIO devices and other devices (e.g. USB
> > > or
> > >  > > network),
> > >  > >  or made available to userspace without copying the data.
> > >  > >
> > >  > >  DMABUF is, at least in theory, exactly what we need. Quoting
> > > the
> > >  > >  documentation
> > >  > >
> > > (https://www.kernel.org/doc/html/v5.15/driver-api/dma-buf.html):
> > >  > >  "The dma-buf subsystem provides the framework for sharing
> > > buffers
> > >  > > for
> > >  > >  hardware (DMA) access across multiple device drivers and
> > >  > > subsystems, and for
> > >  > >  synchronizing asynchronous hardware access. This is used, for
> > >  > > example, by
> > >  > >  drm “prime” multi-GPU support, but is of course not limited to
> > > GPU
> > >  > > use
> > >  > >  cases."
> > >  > >
> > >  > >  The problem is that right now DMABUF is only really used by
> > > DRM,
> > >  > > and to
> > >  > >  quote Daniel, "dma-buf looks like something super generic and
> > >  > > useful, until
> > >  > >  you realize that there's a metric ton of gpu/accelerator bagage
> > >  > > piled in".
> > >  > >
> > >  > >  Still, it seems to be the only viable option. We could add a
> > > custom
> > >  > >  buffer-passing interface, but that would mean implementing the
> > > same
> > >  > >  buffer-passing interface on the network and USB stacks, and
> > > before
> > >  > > we know
> > >  > >  it we re-invented DMABUFs.
> > >  >
> > >  > dma-buf also doesn't support sharing with network and usb stacks,
> > > so I'm
> > >  > a
> > >  > bit confused why exactly this is useful?
> > > 
> > >  There is an attempt to get dma-buf support in the network stack,
> > > called
> > >  "zctap". Last patchset was sent last november. USB stack does not
> > > support
> > >  dma-buf, but we can add it later I guess.
> > > 
> > >  > So yeah unless there's some sharing going on with gpu stuff (for
> > > data
> > >  > processing maybe) I'm not sure this makes a lot of sense really.
> > > Or at
> > >  > least some zero-copy sharing between drivers, but even that would
> > >  > minimally require a dma-buf import ioctl of some sorts. Which I
> > > either
> > >  > missed or doesn't exist.
> > > 
> > >  We do want zero-copy between drivers, the network stack, and the
> > > USB stack.
> > >  It's not just about having a userspace interface.
> > 
> > I think in that case we need these other pieces too. And we need acks
> > from
> > relevant subsystems that these other pieces are a) ready for upstream
> > merging and also that the dma-buf side of things actually makes sense.
> 
> Ok...
> 
> > >  > If there's none of that then just hand-roll your buffer handling
> > > code
> > >  > (xarray is cheap to use in terms of code for this), you can
> > > always add
> > >  > dma-buf import/export later on when the need arises.
> > >  >
> > >  > Scrolling through patches you only have dma-buf export, but no
> > >  > importing,
> > >  > so the use-case that works is with one of the existing subsystems
> > > that
> > >  > supporting dma-buf importing.
> > >  >
> > >  > I think minimally we need the use-case (in form of code) that
> > > needs the
> > >  > buffer sharing here.
> > > 
> > >  I'll try with zctap and report back.
> > 
> > Do you have a link for this? I just checked dri-devel on lore, and it's
> > not there. Nor anywhere else.
> 
> The code is here: https://github.com/jlemon/zctap_kernel
> 
> I know Jonathan Lemon (Cc'd) was working on upstreaming it, I saw a few
> patchsets.

Yeah if the goal here is to zero-copy from iio to network sockets, then I
think we really need the full picture first, at least as a prototype.

And also a rough consensus among all involved subsystems that this is the
right approach and that there's no fundamental issues. I really have no
clue about network to make a call there.

I'm bringing this up because a few folks wanted to look into zero-copy
between gpu and nvme, using dma-buf. And after lots of
head-banging-against-solid-concrete-walls, at least my conclusion is that
due to locking issues it's really not possible without huge changes to the
block i/o. And those are not on the table.
-Daniel

> 
> Cheers,
> -Paul
> 
> > We really need all the pieces, and if block layer reaction is anything
> > to
> > judge by, dma-buf wont happen for networking either. There's some really
> > nasty and fairly fundamental issues with locking and memory reclaim that
> > make this utter pain or outright impossible.
> > -Daniel
> > 
> > > 
> > >  Cheers,
> > >  -Paul
> > > 
> > >  > >  > >
> > >  > >  > >  Changes since v1:
> > >  > >  > >
> > >  > >  > >  - the patches that were merged in v1 have been (obviously)
> > >  > > dropped
> > >  > >  > > from
> > >  > >  > >    this patchset;
> > >  > >  > >  - the patch that was setting the write-combine cache
> > > setting
> > >  > > has
> > >  > >  > > been
> > >  > >  > >    dropped as well, as it was simply not useful.
> > >  > >  > >  - [01/12]:
> > >  > >  > >      * Only remove the outgoing queue, and keep the
> > > incoming
> > >  > > queue,
> > >  > >  > > as we
> > >  > >  > >        want the buffer to start streaming data as soon as
> > > it is
> > >  > >  > > enabled.
> > >  > >  > >      * Remove IIO_BLOCK_STATE_DEQUEUED, since it is now
> > >  > > functionally
> > >  > >  > > the
> > >  > >  > >        same as IIO_BLOCK_STATE_DONE.
> > >  > >  > >  - [02/12]:
> > >  > >  > >      * Fix block->state not being reset in
> > >  > >  > >        iio_dma_buffer_request_update() for output buffers.
> > >  > >  > >      * Only update block->bytes_used once and add a comment
> > >  > > about
> > >  > >  > > why we
> > >  > >  > >        update it.
> > >  > >  > >      * Add a comment about why we're setting a different
> > > state
> > >  > > for
> > >  > >  > > output
> > >  > >  > >        buffers in iio_dma_buffer_request_update()
> > >  > >  > >      * Remove useless cast to bool (!!) in
> > > iio_dma_buffer_io()
> > >  > >  > >  - [05/12]:
> > >  > >  > >      Only allow the new IOCTLs on the buffer FD created
> > > with
> > >  > >  > >      IIO_BUFFER_GET_FD_IOCTL().
> > >  > >  > >  - [12/12]:
> > >  > >  > >      * Explicitly state that the new interface is optional
> > > and
> > >  > > is
> > >  > >  > >        not implemented by all drivers.
> > >  > >  > >      * The IOCTLs can now only be called on the buffer FD
> > >  > > returned by
> > >  > >  > >        IIO_BUFFER_GET_FD_IOCTL.
> > >  > >  > >      * Move the page up a bit in the index since it is core
> > >  > > stuff
> > >  > >  > > and not
> > >  > >  > >        driver-specific.
> > >  > >  > >
> > >  > >  > >  The patches not listed here have not been modified since
> > > v1.
> > >  > >  > >
> > >  > >  > >  Cheers,
> > >  > >  > >  -Paul
> > >  > >  > >
> > >  > >  > >  Alexandru Ardelean (1):
> > >  > >  > >    iio: buffer-dma: split iio_dma_buffer_fileio_free()
> > > function
> > >  > >  > >
> > >  > >  > >  Paul Cercueil (11):
> > >  > >  > >    iio: buffer-dma: Get rid of outgoing queue
> > >  > >  > >    iio: buffer-dma: Enable buffer write support
> > >  > >  > >    iio: buffer-dmaengine: Support specifying buffer
> > > direction
> > >  > >  > >    iio: buffer-dmaengine: Enable write support
> > >  > >  > >    iio: core: Add new DMABUF interface infrastructure
> > >  > >  > >    iio: buffer-dma: Use DMABUFs instead of custom solution
> > >  > >  > >    iio: buffer-dma: Implement new DMABUF based userspace
> > > API
> > >  > >  > >    iio: buffer-dmaengine: Support new DMABUF based
> > > userspace API
> > >  > >  > >    iio: core: Add support for cyclic buffers
> > >  > >  > >    iio: buffer-dmaengine: Add support for cyclic buffers
> > >  > >  > >    Documentation: iio: Document high-speed DMABUF based API
> > >  > >  > >
> > >  > >  > >   Documentation/driver-api/dma-buf.rst          |   2 +
> > >  > >  > >   Documentation/iio/dmabuf_api.rst              |  94 +++
> > >  > >  > >   Documentation/iio/index.rst                   |   2 +
> > >  > >  > >   drivers/iio/adc/adi-axi-adc.c                 |   3 +-
> > >  > >  > >   drivers/iio/buffer/industrialio-buffer-dma.c  | 610
> > >  > >  > > ++++++++++++++----
> > >  > >  > >   .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
> > >  > >  > >   drivers/iio/industrialio-buffer.c             |  60 ++
> > >  > >  > >   include/linux/iio/buffer-dma.h                |  38 +-
> > >  > >  > >   include/linux/iio/buffer-dmaengine.h          |   5 +-
> > >  > >  > >   include/linux/iio/buffer_impl.h               |   8 +
> > >  > >  > >   include/uapi/linux/iio/buffer.h               |  30 +
> > >  > >  > >   11 files changed, 749 insertions(+), 145 deletions(-)
> > >  > >  > >   create mode 100644 Documentation/iio/dmabuf_api.rst
> > >  > >  > >
> > >  > >  >
> > >  > >
> > >  > >
> > >  >
> > >  > --
> > >  > Daniel Vetter
> > >  > Software Engineer, Intel Corporation
> > >  > http://blog.ffwll.ch
> > > 
> > > 
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
