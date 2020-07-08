Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB7C218429
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 11:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857BD89BF6;
	Wed,  8 Jul 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2955D89BF6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 09:49:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j4so45756139wrp.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 02:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GZShcKPFpqES2sTlaXu0+aLjhVaehBiP66MG6kX93c0=;
 b=GdCkVmFATenowtvtlQVSpSzElju4m414mKArdqAjU+5ulZjcLloKVWm5qk9JhB+Kja
 k+QoiAzYHZD+MAfkW6WxL1KJwx00iAi9DpiUR4fKJ86ybZ4hUe6Quu320Gg+F6oDtkY8
 SehTHojS0t5G8pCRlTYrmLi2s2cHnCCKtzyvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GZShcKPFpqES2sTlaXu0+aLjhVaehBiP66MG6kX93c0=;
 b=gtytA60guPRhrlL9kYs/Sop9LTXKa95adr8PBLgRKT1A1/B8V4MBMoSdQkJ2aktf73
 XTS57XdzPIAB3FWni+LtQlkrQLZzMJZ4TewRU24PNykO/BKfV4Pza7Ki2aHzFit0atLD
 3ok9Z8w3W3hJF+rNf+F49nfeLhU8VCzJ2SHwYHofEWyPX3nIkthTfecCRTBHDYSyOx9K
 x2zbonBYL5kZMzLkQ/MdjLZs19Vf5uG26q0Uj8Khp4nuzfQQ4wuAxDrgDwZG0KrK6jwT
 nDFaeQTcB1TuK31gFLtl3iUiEBC70ZLrjm7vSPEq9Lrs73UVxsUt/UmGhrMP8Qz4qRbg
 t07w==
X-Gm-Message-State: AOAM533huS9fE8QB9HdE39BvFww+GB6ZtyVnfv/5nzsEXlCH+A5qnAiM
 yxJJBQCpB2U07S9igP3ZE041+A==
X-Google-Smtp-Source: ABdhPJx/hCEDu3TifTBNO01a+XGP1RMbCshXrEjvlv8gStmFtSO/TgMoCQgSIRGd+mK7JKGoUvckPg==
X-Received: by 2002:adf:afc3:: with SMTP id y3mr60962970wrd.277.1594201776849; 
 Wed, 08 Jul 2020 02:49:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h23sm5082314wmb.3.2020.07.08.02.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 02:49:36 -0700 (PDT)
Date: Wed, 8 Jul 2020 11:49:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Message-ID: <20200708094934.GI3278063@phenom.ffwll.local>
References: <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
 <20200702181540.GC3278063@phenom.ffwll.local>
 <20200703120335.GT25301@ziepe.ca>
 <CAKMK7uGqABchpPLTm=vmabkwK3JJSzWTFWhfU+ywbwjw-HgSzw@mail.gmail.com>
 <20200703131445.GU25301@ziepe.ca>
 <f2ec5c61-a553-39b5-29e1-568dae9ca2cd@amd.com>
 <MW3PR11MB45553DB31AD67C8B870A345FE5660@MW3PR11MB4555.namprd11.prod.outlook.com>
 <d28286c7-b1c1-a4a8-1d38-264ed1761cdd@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d28286c7-b1c1-a4a8-1d38-264ed1761cdd@amd.com>
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

On Wed, Jul 08, 2020 at 11:38:31AM +0200, Christian K=F6nig wrote:
> Am 07.07.20 um 23:58 schrieb Xiong, Jianxin:
> > > -----Original Message-----
> > > From: Christian K=F6nig <christian.koenig@amd.com>
> > > Am 03.07.20 um 15:14 schrieb Jason Gunthorpe:
> > > > On Fri, Jul 03, 2020 at 02:52:03PM +0200, Daniel Vetter wrote:
> > > > =

> > > > > So maybe I'm just totally confused about the rdma model. I though=
t:
> > > > > - you bind a pile of memory for various transactions, that might
> > > > > happen whenever. Kernel driver doesn't have much if any insight i=
nto
> > > > > when memory isn't needed anymore. I think in the rdma world that's
> > > > > called registering memory, but not sure.
> > > > Sure, but once registered the memory is able to be used at any mome=
nt
> > > > with no visibilty from the kernel.
> > > > =

> > > > Unlike GPU the transactions that trigger memory access do not go
> > > > through the kernel - so there is no ability to interrupt a command
> > > > flow and fiddle with mappings.
> > > This is the same for GPUs with user space queues as well.
> > > =

> > > But we can still say for a process if that this process is using a DM=
A-buf which is moved out and so can't run any more unless the DMA-buf is
> > > accessible again.
> > > =

> > > In other words you somehow need to make sure that the hardware is not=
 accessing a piece of memory any more when you want to move it.
> > > =

> > While a process can be easily suspended, there is no way to tell the RD=
MA NIC not to process posted work requests that use specific memory regions=
 (or with any other conditions).
> > =

> > So far it appears to me that DMA-buf dynamic mapping for RDMA is only v=
iable with ODP support. For NICs without ODP, a way to allow pinning the de=
vice memory is still needed.
> =

> And that's exactly the reason why I introduced explicit pin()/unpin()
> functions into the DMA-buf API:
> https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-buf.c#=
L811
> =

> It's just that at least our devices drivers currently prevent P2P with
> pinned DMA-buf's for two main reasons:
> =

> a) To prevent deny of service attacks because P2P BARs are a rather rare
> resource.
> =

> b) To prevent failures in configuration where P2P is not always possible
> between all devices which want to access a buffer.

So the above is more or less the question in the cover letter (which
didn't make it to dri-devel). Can we somehow throw that limitation out, or
is that simply not a good idea?

Simply moving buffers to system memory when they're pinned does simplify a
lot of headaches. For a specific custom built system we can avoid that
maybe, but I think upstream is kinda a different thing.

Cheers, Daniel

> Regards,
> Christian.
> =

> > =

> > Jianxin
> > =

> > > Christian.
> > > =

> > > > Jason
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
