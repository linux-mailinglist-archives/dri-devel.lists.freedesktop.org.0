Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB873B2081
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 20:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CA46E96F;
	Wed, 23 Jun 2021 18:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701926E96F;
 Wed, 23 Jun 2021 18:43:31 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 k21-20020a4a2a150000b029024955603642so969642oof.8; 
 Wed, 23 Jun 2021 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cpkWeMAkWCf76CjUWKr9rUiGHMNQHXwmEhD8GnECJcY=;
 b=FAdddLGyvRhCK6AccX0MB+lVTROAnOJkBjUEiLvKrGbCjDXg8cMuBvzhCKCYG+2wp/
 7FJ3bFXrVJfND52cISdONm5rVb5W9wcg0gd6yEuwoMBJliQ+FKvkdyDQWzozxNSwBNbs
 JO7eZe4ZccJ/2bx2xYR8vGk+3FNkZO8h7JpLwuS4w5BJ2EAXBGSDJEkL0jivD5z+gFEw
 7BIJX+4ApeN6hyu2dSaya30ciWfKtm1usu/9aEHqyXKsn8HrRL8Oik9b/5kIdMgkmffs
 40h8uV5SomFi6A7tfXs9WuHwRD2nn3EpgHQL1ljq24NiTrr2WkcWAikxIxKIRjiJG6dp
 7Gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cpkWeMAkWCf76CjUWKr9rUiGHMNQHXwmEhD8GnECJcY=;
 b=e33hJSvVdYth5atEGOG+XYXjaKB52SYAoRJw/RKKHYz/D2QzDRKDWc9xyWPjvkZCh0
 mfKs3taDWakBrkFQs6EfbyC9gILCQNN9NxWIJkWpF1EbP323qgAElfoiQ0LKrIK3QImv
 pht/X0QJlAdgF7lS7yUMb+7c07biiXRmIrq/tDR/Q0W4QyioXccjq7CSPFnN2XuZ8pO6
 ho7jPnVFVbO8ME8dK44IWNqewvAgZ28iNV6+Uxgw/QD9PFlKRS5fD+M8WMpfI3Qtnv8H
 37TXgodK18shFzzTxwydL0z6c6l5jRoSv/XjXgHYnV9t9HK6q+PuMQYLLMc2gl5gMC58
 72jw==
X-Gm-Message-State: AOAM532i8+Aa/2z/TAlPSNaSQbD8UniUI0B+UwRiBDTpbID1fPw/RhXO
 Jey1NPbkNrFbvsEkLh2BygsLQ9j8oDC39DT2xJw=
X-Google-Smtp-Source: ABdhPJztTw3IUTHnVPOKEUa+mzrtiHw343QNu8CeH1GRn9gntl2RUBK4RDrGb/9f1ZBukujNJOVgfhuumtOwviJ5UvE=
X-Received: by 2002:a4a:1a84:: with SMTP id 126mr976948oof.77.1624473810500;
 Wed, 23 Jun 2021 11:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
 <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
 <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
 <20210623182435.GX1096940@ziepe.ca>
In-Reply-To: <20210623182435.GX1096940@ziepe.ca>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 23 Jun 2021 21:43:04 +0300
Message-ID: <CAFCwf111O0_YB_tixzEUmaKpGAHMNvMaOes2AfMD4x68Am4Yyg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To: Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Leon Romanovsky <leonro@nvidia.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@lst.de>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 9:24 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Jun 23, 2021 at 10:57:35AM +0200, Christian K=C3=B6nig wrote:
>
> > > > No it isn't. It makes devices depend on allocating struct pages for=
 their
> > > > BARs which is not necessary nor desired.
> > > Which dramatically reduces the cost of establishing DMA mappings, a
> > > loop of dma_map_resource() is very expensive.
> >
> > Yeah, but that is perfectly ok. Our BAR allocations are either in chunk=
s of
> > at least 2MiB or only a single 4KiB page.
>
> And very small apparently
>
> > > > Allocating a struct pages has their use case, for example for expos=
ing VRAM
> > > > as memory for HMM. But that is something very specific and should n=
ot limit
> > > > PCIe P2P DMA in general.
> > > Sure, but that is an ideal we are far from obtaining, and nobody want=
s
> > > to work on it prefering to do hacky hacky like this.
> > >
> > > If you believe in this then remove the scatter list from dmabuf, add =
a
> > > new set of dma_map* APIs to work on physical addresses and all the
> > > other stuff needed.
> >
> > Yeah, that's what I totally agree on. And I actually hoped that the new=
 P2P
> > work for PCIe would go into that direction, but that didn't materialize=
d.
>
> It is a lot of work and the only gain is to save a bit of memory for
> struct pages. Not a very big pay off.
>
> > But allocating struct pages for PCIe BARs which are essentially registe=
rs
> > and not memory is much more hacky than the dma_resource_map() approach.
>
> It doesn't really matter. The pages are in a special zone and are only
> being used as handles for the BAR memory.
>
> > By using PCIe P2P we want to avoid the round trip to the CPU when one d=
evice
> > has filled the ring buffer and another device must be woken up to proce=
ss
> > it.
>
> Sure, we all have these scenarios, what is inside the memory doesn't
> realy matter. The mechanism is generic and the struct pages don't care
> much if they point at something memory-like or at something
> register-like.
>
> They are already in big trouble because you can't portably use CPU
> instructions to access them anyhow.
>
> Jason

Jason,
Can you please explain why it is so important to (allow) access them
through the CPU ?
In regard to p2p, where is the use-case for that ?
The whole purpose is that the other device accesses my device,
bypassing the CPU.

Thanks,
Oded
