Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77013AEE65
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 18:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B3F6E20F;
	Mon, 21 Jun 2021 16:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D796E20F;
 Mon, 21 Jun 2021 16:26:38 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 v22-20020a0568301416b029044e2d8e855eso9094942otp.8; 
 Mon, 21 Jun 2021 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yoCwDUxZJP3Ut8z/hr4sZH2+48UBBB2zck9Vy5dLtgU=;
 b=pM+MoLSU0LSJh98DQrRsTPmTh+95pmfRHHbTmKcyhP9ovDKRhZcvBC02S/55ftG/og
 ruYrldynFgVUzXcJ5cpWd8IKQzedGdpH4I+1WfQpqdIufPWiWf72S0LDFysmflufYM4y
 4wEreRKEOPdT1VnnTfvE5bFAmShhQkzdbAuUs7Mj25c7MYRwZ3OzmCVuPeHzDrwJTziw
 rDSCsQLsvjXiYpI4vGyZmIa5HkJhW6dIjnKxwkKEFk6v9qnpGL7nodqGKszpOHNAzcK7
 CHo/Eex5i6JrEqmb0tCi7M7hZujczlekBuIR9iw4PZd+ucMGW5rl9ynK99eEaKLIYyZD
 Yulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yoCwDUxZJP3Ut8z/hr4sZH2+48UBBB2zck9Vy5dLtgU=;
 b=rpLOWEW/hasjgA9Xm3B42x2aQQjYRtOnqRz1lT/0pKMUBX4YmwMXoTB9U3j58OtKGa
 4RlmnSwSZHeEkoh5G6/Z/1TZVoosNkpLGrZ7fTbVC/53sK14Y7HpGdYMd54Kcp/JXKQl
 ATq7pdVXFp+gJMYvvXOQFVMOoPojlcmMKKEax5uCYbbCOtPHQSjKnLUuwpH2pndkaovF
 OuDdMrtdhHgucN2sD9MJTkLRikYyrkg2u1SPB/PgQRKayvnOIAC2GmzH4pveecaZR7Cu
 aVY+ya75D+UdaGxviYMA2anQhOezpCbji0k50m8MObkIxVCzYhhyMx73W+pCjMOjL7/I
 WeFg==
X-Gm-Message-State: AOAM531fthivmoJdRgyFmv4XcQLN+y49SJ/IOy3C9eWoxU7OPf3D2Ovt
 jMXzTntplABUlDvFRD0SssCzUx1rIrTdZBbpEr4=
X-Google-Smtp-Source: ABdhPJyCAxXTkhs7AspbVL/ypAtCWxFLyf2+jHwkfD8UredO9wC4bcv1TQdaRkBRCIklexFbhcAJuyI6ee0+SeGt/NU=
X-Received: by 2002:a9d:4581:: with SMTP id x1mr22307079ote.145.1624292797889; 
 Mon, 21 Jun 2021 09:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com> <20210621141217.GE1096940@ziepe.ca>
In-Reply-To: <20210621141217.GE1096940@ziepe.ca>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 21 Jun 2021 19:26:14 +0300
Message-ID: <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Leon Romanovsky <leonro@nvidia.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 5:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Jun 21, 2021 at 03:02:10PM +0200, Greg KH wrote:
> > On Mon, Jun 21, 2021 at 02:28:48PM +0200, Daniel Vetter wrote:
>
> > > Also I'm wondering which is the other driver that we share buffers
> > > with. The gaudi stuff doesn't have real struct pages as backing
> > > storage, it only fills out the dma_addr_t. That tends to blow up with
> > > other drivers, and the only place where this is guaranteed to work is
> > > if you have a dynamic importer which sets the allow_peer2peer flag.
> > > Adding maintainers from other subsystems who might want to chime in
> > > here. So even aside of the big question as-is this is broken.
> >
> > From what I can tell this driver is sending the buffers to other
> > instances of the same hardware,
>
> A dmabuf is consumed by something else in the kernel calling
> dma_buf_map_attachment() on the FD.
>
> What is the other side of this? I don't see any
> dma_buf_map_attachment() calls in drivers/misc, or added in this patch
> set.

This patch-set is only to enable the support for the exporter side.
The "other side" is any generic RDMA networking device that will want
to perform p2p communication over PCIe with our GAUDI accelerator.
An example is indeed the mlnx5 card which has already integrated
support for being an "importer".

This is *not* used for communication with another GAUDI device. If I
want to communicate with another GAUDI device, our userspace
communications library will use our internal network links, without
any need for dma-buf.

Oded

>
> AFAIK the only viable in-tree other side is in mlx5 (look in
> umem_dmabuf.c)
>
> Though as we already talked habana has their own networking (out of
> tree, presumably) so I suspect this is really to support some out of
> tree stuff??
>
> Jason
