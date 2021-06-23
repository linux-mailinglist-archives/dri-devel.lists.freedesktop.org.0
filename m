Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B93B2157
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 21:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAB36E98A;
	Wed, 23 Jun 2021 19:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551786E98A;
 Wed, 23 Jun 2021 19:40:15 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 v5-20020a0568301bc5b029045c06b14f83so3088577ota.13; 
 Wed, 23 Jun 2021 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDjEA/DLHJuJqbx7wc+mRyI0RJczQytGp1V6E75bd6s=;
 b=njxfplOx17G0/91fOLaiwVofE0DeSdGcCG3lxRi9OYVY6KYvRDAEsYT4a2X08avjYz
 uk9LS4BPT8B0ygh92FmzwsjnilNP75l1/gXEVq89GseCAdSIpq6YYw8fjjAPPxr4o+PW
 L1d2m01Uw4KLPxZ66w09nOVAPTd8mJoSjCCMU66jx/8k6x/Lf49D21aPA/ifhKbt2vkW
 jY4n3+MG8/wALoxr2cftjzWWAHPFat3vVo01kBbQP+RM7GGT5W4PQR6uFllaJRjFkjzQ
 vwcmftcSUgYfe5LpftZyXNntJzQ+Wo2BZqKzqtT+Ch7LKM5E+/AWX9vBPa/rH66Sg51K
 GNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDjEA/DLHJuJqbx7wc+mRyI0RJczQytGp1V6E75bd6s=;
 b=lu0nrWClQuj4N27dIZZDshhmTVymirb7us8By+6TyHIpCbcEBsBlgPlUscGpEo9ykp
 wRMMcatZPsdWGIt011da5Nxys/7o7Ux8BQJSd3fbErKT+e7vBTk9iXTi//e6nE+pJC/V
 HtwXu4G93CtSJQIEHq6SEtWrI3h0H5HdGoiCdnvmdvaYS5NwPqdjQIEhtvdYVyWRN0vg
 epXM33L0r14jQM+Fu6c3MuXUq+7yI2nbqTxQEJajVW1+m+XSgtK3+pTE8+YUnHKvyw1A
 x6lP+kbx0w0oBmm6GBc2i7f/KyeotmwICcbjMJTCe3bDE+vZ2BsyTlwnqHTtqXq7hNT7
 clIg==
X-Gm-Message-State: AOAM533SJpBeI4b1rd6Ld5rU/yo6a1Neg8Wm3qQJMSVt7d9DCeYUGdLb
 Etb945gO6FSiMNQZvDSwZhFdYHniGI7gEU/cYEE=
X-Google-Smtp-Source: ABdhPJznDm09EdJ4nc7aCaNiJgX/OzhaJax6fBkCDboeJEjZGy4mnzO3nT99DVOufQL4W+3P5HvD7FiPj986tjjoFdA=
X-Received: by 2002:a9d:542:: with SMTP id 60mr1364333otw.143.1624477214591;
 Wed, 23 Jun 2021 12:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
 <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
 <20210623182435.GX1096940@ziepe.ca>
 <CAFCwf111O0_YB_tixzEUmaKpGAHMNvMaOes2AfMD4x68Am4Yyg@mail.gmail.com>
 <20210623185045.GY1096940@ziepe.ca>
 <CAFCwf12tW_WawFfAfrC8bgVhTRnDA7DuM+0V8w3JsUZpA2j84w@mail.gmail.com>
 <20210623193456.GZ1096940@ziepe.ca>
In-Reply-To: <20210623193456.GZ1096940@ziepe.ca>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 23 Jun 2021 22:39:48 +0300
Message-ID: <CAFCwf13vM2T-eJUu42ht5jdXpRCF3UZh0Ow=vwN9QqZ=KNUBsQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
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

On Wed, Jun 23, 2021 at 10:34 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Jun 23, 2021 at 10:00:29PM +0300, Oded Gabbay wrote:
> > On Wed, Jun 23, 2021 at 9:50 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Wed, Jun 23, 2021 at 09:43:04PM +0300, Oded Gabbay wrote:
> > >
> > > > Can you please explain why it is so important to (allow) access them
> > > > through the CPU ?
> > >
> > > It is not so much important, as it reflects significant design choices
> > > that are already tightly baked into alot of our stacks.
> > >
> > > A SGL is CPU accessible by design - that is baked into this thing and
> > > places all over the place assume it. Even in RDMA we have
> > > RXE/SWI/HFI1/qib that might want to use the CPU side (grep for sg_page
> > > to see)
> > >
> > > So, the thing at the top of the stack - in this case the gaudi driver
> > > - simply can't assume what the rest of the stack is going to do and
> > > omit the CPU side. It breaks everything.
> > >
> > > Logan's patch series is the most fully developed way out of this
> > > predicament so far.
> >
> > I understand the argument and I agree that for the generic case, the
> > top of the stack can't assume anything.
> > Having said that, in this case the SGL is encapsulated inside a dma-buf object.
> >
> > Maybe its a stupid/over-simplified suggestion, but can't we add a
> > property to the dma-buf object,
> > that will be set by the exporter, which will "tell" the importer it
> > can't use any CPU fallback ? Only "real" p2p ?
>
> The block stack has been trying to do something like this.
>
> The flag doesn't solve the DMA API/IOMMU problems though.
hmm, I thought using dma_map_resource will solve the IOMMU issues, no ?
We talked about it yesterday, and you said that it will "work"
(although I noticed a tone of reluctance when you said that).

If I use dma_map_resource to set the addresses inside the SGL before I
export the dma-buf, and guarantee no one will use the SGL in the
dma-buf for any other purpose than device p2p, what else is needed ?

Oded

>
> Jason
