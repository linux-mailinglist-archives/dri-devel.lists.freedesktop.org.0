Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A988B3B20B6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 21:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E1E6E97C;
	Wed, 23 Jun 2021 19:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF4C6E97C;
 Wed, 23 Jun 2021 19:00:56 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id r16so4496191oiw.3;
 Wed, 23 Jun 2021 12:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HU0njkEAFXSJ+n1VhC5vO37YX20GbDuiyUcRu8p0LjY=;
 b=rM3WDg9MMATVrxXbwamjLp8MYkt3nKZzzeXshLf8ILv5x6LgyXo2blESNLQIVeXsFD
 rpjPxLKs1h6HOwdPV14GthqwAemSKTrfW+nY32gCA+UIpPY6ihPofAgehpg7681KUIJo
 IxLdr13iGdEUHDNjN933QVGA/I/zGKtjSXUCfl9XFFp8gtAZxYi7iB3TIHJWaw+D725M
 voWKL6spbhaM8cvdeDxt2zl3XvfYn/ragq8k6CV6q9O/DUtK/a5Pnmd6TVv8UhbanjwQ
 P4Fo52HgvmP31qSnkL1NysqPThoMiJhTwMPxGzMMAHosCkhwP6CH4HFv2r6M9U3QsvSH
 iaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HU0njkEAFXSJ+n1VhC5vO37YX20GbDuiyUcRu8p0LjY=;
 b=l94RDj8IPWR8z0Ovqa7/zcLwSByTh8N2p+IDavhmn2duqdryVGIKXFqzI6pnWcGUKh
 aUsglEmdHqFoVeoeEq7ykKeogLSTfj70aQhLDVYhgCdcQSEJ0W3w9/qt7yhXrfeZ1yho
 /PN/RQEIw1YqUsont5e8BAQtU8/UD5OqJBdgnpzVWuAdNzZdyK0kXGmTxIBLaNENhz4Q
 IR6eKB3+LWh6vxuFCBKZebS7cPth4Mv/4Sc4yock+ZNc7d68T3QSRbvgdEKEWuueJ+Og
 U+gsUYtzfLji8BnkMZADQ3RWI6uUny4ZsPYpJEJv0fgMqYSs441tvT31hb4LOpZDLcAD
 9yrw==
X-Gm-Message-State: AOAM532C7cmEZScv+9hGD8CvA0W8uwlcxuNcRiR4M8CPUwFOtrt4rnAh
 EvVLLbK4vVKMV2XL1vwieAXbe+PZHmPH2kDI0GU=
X-Google-Smtp-Source: ABdhPJwZaqDGEAw39pokh5wKazMtsYd0U8zjcFHkgl/u/5WFqx2ojdszUYddCg8iZJyKUS2V1hzOATZO27SCBKnlQ9E=
X-Received: by 2002:aca:ac02:: with SMTP id v2mr4495297oie.154.1624474855653; 
 Wed, 23 Jun 2021 12:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210622120142.GL1096940@ziepe.ca>
 <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
 <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
 <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
 <20210623182435.GX1096940@ziepe.ca>
 <CAFCwf111O0_YB_tixzEUmaKpGAHMNvMaOes2AfMD4x68Am4Yyg@mail.gmail.com>
 <20210623185045.GY1096940@ziepe.ca>
In-Reply-To: <20210623185045.GY1096940@ziepe.ca>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 23 Jun 2021 22:00:29 +0300
Message-ID: <CAFCwf12tW_WawFfAfrC8bgVhTRnDA7DuM+0V8w3JsUZpA2j84w@mail.gmail.com>
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

On Wed, Jun 23, 2021 at 9:50 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Jun 23, 2021 at 09:43:04PM +0300, Oded Gabbay wrote:
>
> > Can you please explain why it is so important to (allow) access them
> > through the CPU ?
>
> It is not so much important, as it reflects significant design choices
> that are already tightly baked into alot of our stacks.
>
> A SGL is CPU accessible by design - that is baked into this thing and
> places all over the place assume it. Even in RDMA we have
> RXE/SWI/HFI1/qib that might want to use the CPU side (grep for sg_page
> to see)
>
> So, the thing at the top of the stack - in this case the gaudi driver
> - simply can't assume what the rest of the stack is going to do and
> omit the CPU side. It breaks everything.
>
> Logan's patch series is the most fully developed way out of this
> predicament so far.

I understand the argument and I agree that for the generic case, the
top of the stack can't assume anything.
Having said that, in this case the SGL is encapsulated inside a dma-buf object.

Maybe its a stupid/over-simplified suggestion, but can't we add a
property to the dma-buf object,
that will be set by the exporter, which will "tell" the importer it
can't use any CPU fallback ? Only "real" p2p ?
Won't that solve the problem by eliminating the unsupported access methods ?

Oded

>
> > The whole purpose is that the other device accesses my device,
> > bypassing the CPU.
>
> Sure, but you don't know that will happen, or if it is even possible
> in any given system configuration. The purpose is to allow for that
> optimization when possible, not exclude CPU based approaches.
>
> Jason
