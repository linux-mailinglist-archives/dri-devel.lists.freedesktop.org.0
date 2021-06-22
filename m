Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B43B0952
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DDE6E5B0;
	Tue, 22 Jun 2021 15:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244FB6E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 15:40:29 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id t9so16321564qtw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NZpdOHQdlbhRQUdadvChaP2QioJ6XoeMWnvncTZxFBo=;
 b=bFrrHAW8qxNFpB4w6q6y0m3wG93Brg5eP/2CDB60bxAwrbV9T0MwsuqH9FqvvIRVEl
 azco9BZHD+pLNHUOUPd0/YqiC7g1TkaOLuSEdEPEQsK/HsRy3mej/q89Q1WOFE2N+Ro6
 7RjC3KVHi7qrQ6NaRAxH4v7ueHDnYI6mNr/5488SwgmJEmoF0yDk72Gp1+3yt3X1dN77
 SwYTmPDOKjoJcVDChtw4TAWYHg4XwJrbCQOByfoyvt7j1+S/eNeqEnvPfIhPHwupoX/C
 fllP05M4t8g69iCpBGPz31XolXRyxDJerhlIIoTtJYVOwqMlMtDxL7QTh8S+XznoKv7T
 C9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NZpdOHQdlbhRQUdadvChaP2QioJ6XoeMWnvncTZxFBo=;
 b=jZaifJGjz7tNtInmzorITNwuMhZ4zSYjpsiFCMjVFvWUHXEgYvV8SVf0GFRjtMZsV8
 vvcYw+9coQnFK9J+D4jARrYMbrS0T2YDhsm0GLYlCICGkhyAymh2SgFZ7ID7gKnKNNqv
 AxjVgkhXyiojb15bx79BZv0tJqX7He9sW12H7KmJUuKjEBCBGk8Ux8LEUOh3wXDw85Ci
 ZqzOkko9CEPQS834jDz8TjMBxnpV/4BEPZMCzihFbTMoPmEzfnixwJZgq3Er8XgUXzwo
 DgOlTY9MyKnIiNi15PT+tH4HHI/6HXS8IsPsPn183ZuX/O0KisYHLcvYD8iDLSAFQVZr
 d6uw==
X-Gm-Message-State: AOAM533x4S4bD90BkVSc6cKswKCrAGG8slZEvjc0xYaw7hpLIO/DnAWD
 Jg1Y0yBB2WXdxSTpdvYo7u9Xig==
X-Google-Smtp-Source: ABdhPJyBSBJ8ZnJGYH0mWoGpKu8dUURIzu/dEy/gWK1x7lcbRKJ6NR08GtWZTYux23s4RPq5jOQChQ==
X-Received: by 2002:ac8:4241:: with SMTP id r1mr4000088qtm.121.1624376428220; 
 Tue, 22 Jun 2021 08:40:28 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id y18sm1761588qtj.53.2021.06.22.08.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:40:27 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lviVn-00ADW0-73; Tue, 22 Jun 2021 12:40:27 -0300
Date: Tue, 22 Jun 2021 12:40:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210622154027.GS1096940@ziepe.ca>
References: <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
 <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
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
 sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 05:29:01PM +0200, Christian König wrote:
> Am 22.06.21 um 17:23 schrieb Jason Gunthorpe:
> > On Tue, Jun 22, 2021 at 02:23:03PM +0200, Christian König wrote:
> > > Am 22.06.21 um 14:01 schrieb Jason Gunthorpe:
> > > > On Tue, Jun 22, 2021 at 11:42:27AM +0300, Oded Gabbay wrote:
> > > > > On Tue, Jun 22, 2021 at 9:37 AM Christian König
> > > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > > Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
> > > > > > > On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
> > > > > > > 
> > > > > > > > Another thing I want to emphasize is that we are doing p2p only
> > > > > > > > through the export/import of the FD. We do *not* allow the user to
> > > > > > > > mmap the dma-buf as we do not support direct IO. So there is no access
> > > > > > > > to these pages through the userspace.
> > > > > > > Arguably mmaping the memory is a better choice, and is the direction
> > > > > > > that Logan's series goes in. Here the use of DMABUF was specifically
> > > > > > > designed to allow hitless revokation of the memory, which this isn't
> > > > > > > even using.
> > > > > > The major problem with this approach is that DMA-buf is also used for
> > > > > > memory which isn't CPU accessible.
> > > > That isn't an issue here because the memory is only intended to be
> > > > used with P2P transfers so it must be CPU accessible.
> > > No, especially P2P is often done on memory resources which are not even
> > > remotely CPU accessible.
> > That is a special AMD thing, P2P here is PCI P2P and all PCI memory is
> > CPU accessible.
> 
> No absolutely not. NVidia GPUs work exactly the same way.
>
> And you have tons of similar cases in embedded and SoC systems where
> intermediate memory between devices isn't directly addressable with the CPU.

None of that is PCI P2P.

It is all some specialty direct transfer.

You can't reasonably call dma_map_resource() on non CPU mapped memory
for instance, what address would you pass?

Do not confuse "I am doing transfers between two HW blocks" with PCI
Peer to Peer DMA transfers - the latter is a very narrow subcase.

> No, just using the dma_map_resource() interface.

Ik, but yes that does "work". Logan's series is better.

> > > > > I'll go and read Logan's patch-set to see if that will work for us in
> > > > > the future. Please remember, as Daniel said, we don't have struct page
> > > > > backing our device memory, so if that is a requirement to connect to
> > > > > Logan's work, then I don't think we will want to do it at this point.
> > > > It is trivial to get the struct page for a PCI BAR.
> > > Yeah, but it doesn't make much sense. Why should we create a struct page for
> > > something that isn't even memory in a lot of cases?
> > Because the iommu and other places need this handle to setup their
> > stuff. Nobody has yet been brave enough to try to change those flows
> > to be able to use a physical CPU address.
> 
> Well that is certainly not true. I'm just not sure if that works with all
> IOMMU drivers thought.

Huh? All the iommu interfaces except for the dma_map_resource() are
struct page based. dma_map_resource() is slow ad limited in what it
can do.

Jason
