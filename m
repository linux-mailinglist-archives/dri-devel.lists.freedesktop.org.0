Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD3E4536A6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 17:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5F56E044;
	Tue, 16 Nov 2021 16:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A8D6E044
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 16:02:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso2122758wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 08:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=wR86pjAKDcIIUjt4g0ysng9Tddgdb2GO7C//iSJkn0k=;
 b=FftBZOyVFz0PYRsL59Z0G8+qAi7RSjGedwAPQPPtbfF5SsCowVTzSBy3p0mssJB21z
 Cadco0sNSqDTxiKuvu8X3O5kJSAu1Ihr2jIxiQJnP3rroZAp6sXuoluwDXsq2xPShhsj
 D1QoP4+qDRLuNWU8JoSwUas/UnXTDhsXeVDJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=wR86pjAKDcIIUjt4g0ysng9Tddgdb2GO7C//iSJkn0k=;
 b=euBn/vv5hkOiIivrf+K+jIFvn/1iHkp3myPA+lrcqjCj/r1LICRGreHfI4QQJrs54H
 jSbjp5mHfjLg15u3rzCd2YTtHZ346vcuxlLBpZ4eLflTw/dXmye+9fRqALh+NiolgTGA
 KNIFr0MSyPcZru3Ryv2AENot5B+HnOD2QMG4dCeGGFqltxvRqOp8AT8/7OUs0VmHGpcW
 omOtnUKbU23j4SyUk03D+6e9h909rf86+RG0dlpd1O/xoyC4SC8GRWJLVNqLS2QdDrb3
 4Zc19inXbQSKZsHDn0vrJeXH2QNDoh+ZgoZrSMyBpsk2CHKoSvYgUgpfE5cNJShsnEjQ
 qOVA==
X-Gm-Message-State: AOAM531i7Z45HuxY6Dy03hyBPniRIf6UI38cVQJRfawEK/MCuSIUFJyt
 82eFYmWj1fXNPcAAT5f1MnwYPw==
X-Google-Smtp-Source: ABdhPJxVC3Ayf3ujyTs1tnzW1O0d4iFKas9hSskyyJx1LFP+DqbDyiOzSuzf3vWlKhxoGmALSZFsHQ==
X-Received: by 2002:a1c:20cc:: with SMTP id g195mr70520481wmg.42.1637078548445; 
 Tue, 16 Nov 2021 08:02:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm20799672wrs.17.2021.11.16.08.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:02:27 -0800 (PST)
Date: Tue, 16 Nov 2021 17:02:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
Message-ID: <YZPWEU2zRCY0En4l@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Jonathan Cameron <jic23@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
References: <20211115141925.60164-1-paul@crapouillou.net>
 <YZJwnPbgCOdeKq6S@phenom.ffwll.local>
 <18CM2R.6UYFWJDX5UQD@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18CM2R.6UYFWJDX5UQD@crapouillou.net>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 02:57:37PM +0000, Paul Cercueil wrote:
> Hi Daniel,
> 
> Le lun., nov. 15 2021 at 15:37:16 +0100, Daniel Vetter <daniel@ffwll.ch> a
> écrit :
> > On Mon, Nov 15, 2021 at 02:19:10PM +0000, Paul Cercueil wrote:
> > >  Hi Jonathan,
> > > 
> > >  This patchset introduces a new userspace interface based on DMABUF
> > >  objects, to complement the existing fileio based API.
> > > 
> > >  The advantage of this DMABUF based interface vs. the fileio
> > >  interface, is that it avoids an extra copy of the data between the
> > >  kernel and userspace. This is particularly userful for high-speed
> > >  devices which produce several megabytes or even gigabytes of data
> > > per
> > >  second.
> > > 
> > >  The first few patches [01/15] to [03/15] are not really related, but
> > >  allow to reduce the size of the patches that introduce the new API.
> > > 
> > >  Patch [04/15] to [06/15] enables write() support to the buffer-dma
> > >  implementation of the buffer API, to continue the work done by
> > >  Mihail Chindris.
> > > 
> > >  Patches [07/15] to [12/15] introduce the new DMABUF based API.
> > > 
> > >  Patches [13/15] and [14/15] add support for cyclic buffers, only
> > > through
> > >  the new API. A cyclic buffer will be repeated on the output until
> > > the
> > >  buffer is disabled.
> > > 
> > >  Patch [15/15] adds documentation about the new API.
> > > 
> > >  For now, the API allows you to alloc DMABUF objects and mmap() them
> > > to
> > >  read or write the samples. It does not yet allow to import DMABUFs
> > >  parented to other subsystems, but that should eventually be possible
> > >  once it's wired.
> > > 
> > >  This patchset is inspired by the "mmap interface" that was
> > > previously
> > >  submitted by Alexandru Ardelean and Lars-Peter Clausen, so it would
> > > be
> > >  great if I could get a review from you guys. Alexandru's commit was
> > >  signed with his @analog.com address but he doesn't work at ADI
> > > anymore,
> > >  so I believe I'll need him to sign with a new email.
> > 
> > Why dma-buf? dma-buf looks like something super generic and useful,
> > until
> > you realize that there's a metric ton of gpu/accelerator bagage piled
> > in.
> > So unless buffer sharing with a gpu/video/accel/whatever device is the
> > goal here, and it's just for a convenient way to get at buffer handles,
> > this doesn't sound like a good idea.
> 
> Good question. The first reason is that a somewhat similar API was intented
> before[1], but refused upstream as it was kind of re-inventing the wheel.
> 
> The second reason, is that we want to be able to share buffers too, not with
> gpu/video but with the network (zctap) and in the future with USB
> (functionFS) too.
> 
> [1]: https://lore.kernel.org/linux-iio/20210217073638.21681-1-alexandru.ardelean@analog.com/T/

Hm is that code merged already in upstream already?

I know that dma-buf looks really generic, but like I said if there's no
need ever to interface with any of the gpu buffer sharing it might be
better to use something else (like get_user_pages maybe, would that work?).

> > Also if the idea is to this with gpus/accelerators then I'd really like
> > to
> > see the full thing, since most likely at that point you also want
> > dma_fence. And once we talk dma_fence things get truly horrible from a
> > locking pov :-( Or well, just highly constrained and I get to review
> > what
> > iio is doing with these buffers to make sure it all fits.
> 
> There is some dma_fence action in patch #10, which is enough for the
> userspace apps to use the API.
> 
> What "horribleness" are we talking about here? It doesn't look that scary to
> me, but I certainly don't have the complete picture.

You need to annotate all the code involved in signalling that dma_fence
using dma_fence_begin/end_signalling, and then enable full lockdep and
everything.

You can safely assume you'll find bugs, because we even have bugs about
this in gpu drivers (where that annotation isn't fully rolled out yet).

The tldr is that you can allocate memory in there. And a pile of other
restrictions, but not being able to allocate memory (well GFP_ATOMIC is
ok, but that can fail) is a very serious restriction.
-Daniel


> 
> Cheers,
> -Paul
> 
> > Cheers, Daniel
> > 
> > > 
> > >  Cheers,
> > >  -Paul
> > > 
> > >  Alexandru Ardelean (1):
> > >    iio: buffer-dma: split iio_dma_buffer_fileio_free() function
> > > 
> > >  Paul Cercueil (14):
> > >    iio: buffer-dma: Get rid of incoming/outgoing queues
> > >    iio: buffer-dma: Remove unused iio_buffer_block struct
> > >    iio: buffer-dma: Use round_down() instead of rounddown()
> > >    iio: buffer-dma: Enable buffer write support
> > >    iio: buffer-dmaengine: Support specifying buffer direction
> > >    iio: buffer-dmaengine: Enable write support
> > >    iio: core: Add new DMABUF interface infrastructure
> > >    iio: buffer-dma: Use DMABUFs instead of custom solution
> > >    iio: buffer-dma: Implement new DMABUF based userspace API
> > >    iio: buffer-dma: Boost performance using write-combine cache
> > > setting
> > >    iio: buffer-dmaengine: Support new DMABUF based userspace API
> > >    iio: core: Add support for cyclic buffers
> > >    iio: buffer-dmaengine: Add support for cyclic buffers
> > >    Documentation: iio: Document high-speed DMABUF based API
> > > 
> > >   Documentation/driver-api/dma-buf.rst          |   2 +
> > >   Documentation/iio/dmabuf_api.rst              |  94 +++
> > >   Documentation/iio/index.rst                   |   2 +
> > >   drivers/iio/adc/adi-axi-adc.c                 |   3 +-
> > >   drivers/iio/buffer/industrialio-buffer-dma.c  | 670
> > > ++++++++++++++----
> > >   .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
> > >   drivers/iio/industrialio-buffer.c             |  49 ++
> > >   include/linux/iio/buffer-dma.h                |  43 +-
> > >   include/linux/iio/buffer-dmaengine.h          |   5 +-
> > >   include/linux/iio/buffer_impl.h               |   8 +
> > >   include/uapi/linux/iio/buffer.h               |  30 +
> > >   11 files changed, 783 insertions(+), 165 deletions(-)
> > >   create mode 100644 Documentation/iio/dmabuf_api.rst
> > > 
> > >  --
> > >  2.33.0
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
