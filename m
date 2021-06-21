Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC053AF510
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 20:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56A36E3A0;
	Mon, 21 Jun 2021 18:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D806E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 18:27:45 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id h9so8400782oih.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 11:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9i28EclvSZx+uiFhNgb+3CTRZV2qMxp0Q3wXipsI8Q=;
 b=K0UUo78vVrHTzSDrMgj0jT+MLT+AozMScbVhmJ6rhysrPfzfwQKb0T9CTxpGrXfVIc
 t5jj9sX3IfqrbDRI8CthGXRxYKpUQX+02UsBeDhQ6gGIxzzzrj03gPnZr1/CyOuvjIls
 QcmPSnajwhf1oF905MYpKHACKSXHp6adH5P4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9i28EclvSZx+uiFhNgb+3CTRZV2qMxp0Q3wXipsI8Q=;
 b=a/Vj43hGKW0eszkKIN59u33a3LhBvWDpugbPziNBUL2y0rvVjEhFxECmkZWO3MbUFL
 /CW62YE1l/pILDuZe+oTqFwS+cRO/dqyl+V/GpTt2PdJBYhePl/2Huf2FW1upLhQQQSq
 Etg4mac9iCPaeBSgsdhOhE+HGU6IIIaTwMkNuhf8x2qGI0vYTJb78IVY8FZ8OCRdxB0Q
 lP/qUAcyx4seggRhe4SAzyx9x/vqXgKi/Nk1eFAqLTHXocKSNJdG4a+oi7gyVc8HnzPD
 R73t+Kw7V5hAVONToeUlpKSs7t44bHfT8lbM59n59DaRjNlzMuVH3fMr2EnhMvMJ4aFK
 5l7w==
X-Gm-Message-State: AOAM53258cWmAv77RrKIGzT6ctEcCOdxfDQINqqYS7mFLdKmYpjk0b5G
 JQWdmiMSwG3XxIoybZvtFFPR0khw6qCqWHreOTt/fg==
X-Google-Smtp-Source: ABdhPJwgGuTgLpKPpXIxr+AX3ujExHAGAGTWRhPWtYA2l25rchz9pzcPelTwjoCbaEdcWSxXHh9lYgsv8xRxuaFrFw8=
X-Received: by 2002:a54:4889:: with SMTP id r9mr11213515oic.101.1624300063935; 
 Mon, 21 Jun 2021 11:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com> <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
In-Reply-To: <20210621175511.GI1096940@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 21 Jun 2021 20:27:32 +0200
Message-ID: <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] habanalabs: define uAPI to export FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leon Romanovsky <leonro@nvidia.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 7:55 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Mon, Jun 21, 2021 at 07:26:14PM +0300, Oded Gabbay wrote:
> > On Mon, Jun 21, 2021 at 5:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Mon, Jun 21, 2021 at 03:02:10PM +0200, Greg KH wrote:
> > > > On Mon, Jun 21, 2021 at 02:28:48PM +0200, Daniel Vetter wrote:
> > >
> > > > > Also I'm wondering which is the other driver that we share buffers
> > > > > with. The gaudi stuff doesn't have real struct pages as backing
> > > > > storage, it only fills out the dma_addr_t. That tends to blow up with
> > > > > other drivers, and the only place where this is guaranteed to work is
> > > > > if you have a dynamic importer which sets the allow_peer2peer flag.
> > > > > Adding maintainers from other subsystems who might want to chime in
> > > > > here. So even aside of the big question as-is this is broken.
> > > >
> > > > From what I can tell this driver is sending the buffers to other
> > > > instances of the same hardware,
> > >
> > > A dmabuf is consumed by something else in the kernel calling
> > > dma_buf_map_attachment() on the FD.
> > >
> > > What is the other side of this? I don't see any
> > > dma_buf_map_attachment() calls in drivers/misc, or added in this patch
> > > set.
> >
> > This patch-set is only to enable the support for the exporter side.
> > The "other side" is any generic RDMA networking device that will want
> > to perform p2p communication over PCIe with our GAUDI accelerator.
> > An example is indeed the mlnx5 card which has already integrated
> > support for being an "importer".
>
> It raises the question of how you are testing this if you aren't using
> it with the only intree driver: mlx5.

For p2p dma-buf there's also amdgpu as a possible in-tree candiate
driver, that's why I added amdgpu folks. Otoh I'm not aware of AI+GPU
combos being much in use, at least with upstream gpu drivers (nvidia
blob is a different story ofc, but I don't care what they do in their
own world).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
