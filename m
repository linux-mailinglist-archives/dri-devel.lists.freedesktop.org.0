Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674393B2144
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 21:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971776E83A;
	Wed, 23 Jun 2021 19:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D4D6E982
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 19:34:57 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id d9so2999555qtx.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fGGtHhMjRxWC7q8u+QpLuSmAd2BS6BZvGpryakmPg+4=;
 b=C/ChLYKJjxWUduhsqQDH/y3KkPljvKtmE9gnR4RWqH26X4Hcl0BZhRk8uZJDDcRefS
 hGtO2MpvhYu1ncsQ4XftrvmDbf/mCW3wk2DupCuSLq+ie4Hyvpd20U48FGOE4dSGyEo0
 TmyxIGRf7/r6jILWVF9V3iqSjUzYoN6B2NHcRb+DpKV2v39TKfOUwHneZqFmzFyu8wZH
 aiub1NaEqGoa85Yu73CHqFp2wUJ1VM+8ZEE8HkUwdR6souayXVXN3DVtBP19SojfN0kr
 E2ju0T5nvVMTyB6NE6nPMbaB3NYTA1ab7ECOlaIw1r3lb29JeCcDEsxrLY1+NlKZ05e4
 b/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fGGtHhMjRxWC7q8u+QpLuSmAd2BS6BZvGpryakmPg+4=;
 b=LhjpaV/m7iXMuGQatiDxcFjg67k4Bn77Bjcr6lzR6tDw0rtDxCc/uxAhe+L3KddrEr
 KVa5JmVXq/efbo+fWlnw8jkkDfNi/g6G5QOsQ8RmT3+CVI0V+0hehHYEkDADx3/dXYU+
 Kkd2XPW/R5D6ZTx4rQY/D3vgVDbYTLxSH0F8C1pc0l99howDYtgHREBsR1xU6/zHPDsZ
 38oF0Rr6Mm/+l5cOcceWh46vZp5plnd9Wdgl4DG+0BrJEh1H4qWvZghih4MJvOSDVSPi
 YFuyAH9w2xQ1C4RLJvkcOvp17cjZ2+ca9vgd1JQdccSG6Yoll/t+dnlqn5e6VdyYncA6
 uw0w==
X-Gm-Message-State: AOAM5323Id4+8ZatKaEeSgcf5tuHHFcz78wxGuowOAlZw7PPNvstgBzK
 c3kkMa/24G/Q+MwLD1BPq/NbaQ==
X-Google-Smtp-Source: ABdhPJy4nm23YvC56EEKSx/Y/JuzrdTPRhd28eu5/vz3L6lZmXQMsZDuNXNFY8tXVtB6j1rc/ARD+w==
X-Received: by 2002:a05:622a:1051:: with SMTP id
 f17mr1494327qte.226.1624476897149; 
 Wed, 23 Jun 2021 12:34:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id x7sm598287qke.62.2021.06.23.12.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:34:56 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lw8eG-00BmnU-3D; Wed, 23 Jun 2021 16:34:56 -0300
Date: Wed, 23 Jun 2021 16:34:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210623193456.GZ1096940@ziepe.ca>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf12tW_WawFfAfrC8bgVhTRnDA7DuM+0V8w3JsUZpA2j84w@mail.gmail.com>
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
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Leon Romanovsky <leonro@nvidia.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@lst.de>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 10:00:29PM +0300, Oded Gabbay wrote:
> On Wed, Jun 23, 2021 at 9:50 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Jun 23, 2021 at 09:43:04PM +0300, Oded Gabbay wrote:
> >
> > > Can you please explain why it is so important to (allow) access them
> > > through the CPU ?
> >
> > It is not so much important, as it reflects significant design choices
> > that are already tightly baked into alot of our stacks.
> >
> > A SGL is CPU accessible by design - that is baked into this thing and
> > places all over the place assume it. Even in RDMA we have
> > RXE/SWI/HFI1/qib that might want to use the CPU side (grep for sg_page
> > to see)
> >
> > So, the thing at the top of the stack - in this case the gaudi driver
> > - simply can't assume what the rest of the stack is going to do and
> > omit the CPU side. It breaks everything.
> >
> > Logan's patch series is the most fully developed way out of this
> > predicament so far.
> 
> I understand the argument and I agree that for the generic case, the
> top of the stack can't assume anything.
> Having said that, in this case the SGL is encapsulated inside a dma-buf object.
>
> Maybe its a stupid/over-simplified suggestion, but can't we add a
> property to the dma-buf object,
> that will be set by the exporter, which will "tell" the importer it
> can't use any CPU fallback ? Only "real" p2p ?

The block stack has been trying to do something like this.

The flag doesn't solve the DMA API/IOMMU problems though.

Jason
