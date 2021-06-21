Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 355613AF616
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 21:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7810A6E3E5;
	Mon, 21 Jun 2021 19:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9F66E3E5;
 Mon, 21 Jun 2021 19:24:45 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 6-20020a9d07860000b02903e83bf8f8fcso18820972oto.12; 
 Mon, 21 Jun 2021 12:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dBJ5d1VMITTeIiGdzPkAixCEDqtOI+Of2asfGh+UAZ4=;
 b=poWdRMlEM2ZoLHlzus9H+sJm2Gyv4Ad5UYLCdoksxIn2aeAMLa+dKaekWP8LifxgyJ
 n2jVVjTuonYLSxe3ETtsIuLK6gvACWCDRPmuF5tYeQjeJRX7OY/u7vWBpL0kZJzHl5sj
 Ny/XMZJGPL6fogHwoJFWsiHZjsbH13H9+wxt/q/eKq5DtLZntN4WMvAkk8EZkafocBEK
 6xqocdwV6n4EqRoI+ZBfp3axIcf4mR5Wn6oTb26BEs3yq9YTXbI3ZeEuQkoD5A+xRhEy
 Pckce+Y9OeKX2dihb865SJYvyNOs4TOMg3c3iU7fvPH++FHzFI5BYoTOBQOjmtC3BaTY
 AZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dBJ5d1VMITTeIiGdzPkAixCEDqtOI+Of2asfGh+UAZ4=;
 b=I01HTtfmzmQP3MoEGDvrESgSBQ+kn6rVBhFonmcn5Y+ZZ+/VqbBcuTAShHr/lv5elA
 uPmgEVHM1JUFbjwY9sNnX45xteh56aLmGNlOeZUJwDw6sZMKzSrCbTyGQWOSQ4RXGhKo
 yrdDnRv3g3p6NpfGiDmWeGwOANS5Fgt+iVvvBjfIAh5wmA8JZdmYxBKeuE3wMNFBXZMq
 rnnE8DfEQKYajsL8u2EA0I5dNiIhBCPRLZv5hRcGc3YN6d3mCKUBvGn1cERvIntagzXv
 yw1nnyRC4fx2WqN20BuQpcqAmzO3mQvNezTIp3C/FMIdEd6pUBF19RG4vn9bVKX2vseN
 TUgA==
X-Gm-Message-State: AOAM531E368gzRIuQqs2tljGdLkkgizJfQEcgbahMexIqi7xvgLeyvSo
 ss4EBe4brKabWaHrg2yaX945oUnp1HsWjOuiEoc=
X-Google-Smtp-Source: ABdhPJxgnG68naVmqaj9VbYQpqtCzzRUWIKZ1A7mHfJtyBXgRWCjJn597bAS85CrpNuYd9PVyrIs804CEiOHGbIXZSQ=
X-Received: by 2002:a9d:542:: with SMTP id 60mr12808otw.143.1624303483767;
 Mon, 21 Jun 2021 12:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com> <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 21 Jun 2021 22:24:16 +0300
Message-ID: <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] habanalabs: define uAPI to export FD for DMA-BUF
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leon Romanovsky <leonro@nvidia.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 9:27 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Mon, Jun 21, 2021 at 7:55 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Mon, Jun 21, 2021 at 07:26:14PM +0300, Oded Gabbay wrote:
> > > On Mon, Jun 21, 2021 at 5:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Mon, Jun 21, 2021 at 03:02:10PM +0200, Greg KH wrote:
> > > > > On Mon, Jun 21, 2021 at 02:28:48PM +0200, Daniel Vetter wrote:
> > > >
> > > > > > Also I'm wondering which is the other driver that we share buffers
> > > > > > with. The gaudi stuff doesn't have real struct pages as backing
> > > > > > storage, it only fills out the dma_addr_t. That tends to blow up with
> > > > > > other drivers, and the only place where this is guaranteed to work is
> > > > > > if you have a dynamic importer which sets the allow_peer2peer flag.
> > > > > > Adding maintainers from other subsystems who might want to chime in
> > > > > > here. So even aside of the big question as-is this is broken.
> > > > >
> > > > > From what I can tell this driver is sending the buffers to other
> > > > > instances of the same hardware,
> > > >
> > > > A dmabuf is consumed by something else in the kernel calling
> > > > dma_buf_map_attachment() on the FD.
> > > >
> > > > What is the other side of this? I don't see any
> > > > dma_buf_map_attachment() calls in drivers/misc, or added in this patch
> > > > set.
> > >
> > > This patch-set is only to enable the support for the exporter side.
> > > The "other side" is any generic RDMA networking device that will want
> > > to perform p2p communication over PCIe with our GAUDI accelerator.
> > > An example is indeed the mlnx5 card which has already integrated
> > > support for being an "importer".
> >
> > It raises the question of how you are testing this if you aren't using
> > it with the only intree driver: mlx5.
>
> For p2p dma-buf there's also amdgpu as a possible in-tree candiate
> driver, that's why I added amdgpu folks. Otoh I'm not aware of AI+GPU
> combos being much in use, at least with upstream gpu drivers (nvidia
> blob is a different story ofc, but I don't care what they do in their
> own world).
> -Daniel
> --
We have/are doing three things:
1. I wrote a simple "importer" driver that emulates an RDMA driver. It
calls all the IB_UMEM_DMABUF functions, same as the mlnx5 driver does.
And instead of using h/w, it accesses the bar directly. We wrote
several tests that emulated the real application. i.e. asking the
habanalabs driver to create dma-buf object and export its FD back to
userspace. Then the userspace sends the FD to the "importer" driver,
which attaches to it, get the SG list and accesses the memory on the
GAUDI device. This gave me the confidence that how we integrated the
exporter is basically correct/working.

2. We are trying to do a POC with a MLNX card we have, WIP.

3. We are working with another 3rd party RDMA device that its driver
is now adding support for being an "importer". also WIP

In both points 2&3 We haven't yet reached the actual stage of checking
this feature.

Another thing I want to emphasize is that we are doing p2p only
through the export/import of the FD. We do *not* allow the user to
mmap the dma-buf as we do not support direct IO. So there is no access
to these pages through the userspace.

Thanks,
Oded
