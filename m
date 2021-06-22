Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06B03B0387
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2011389FE6;
	Tue, 22 Jun 2021 12:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A491C89FE6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 12:01:44 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id c138so38747240qkg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 05:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uZXjrCktHYqiHY7Zuave3Zqe+nWlABu14O38dLKiRSc=;
 b=V1vGTztZADrEdhzlzySX29OAyznJd+LoMCj0Tl5HgSKC/gYfSvRa4RbGq1dowEhGfV
 daLDhPvM9+xafGLmtfuTCbex8YEiqsKJyrpDW4po9e16l0EgzUkVl44Hmyz39LGoO7xT
 TzLfvUBU/DW8f9Bi5bQpi35/7V2g6v30a9D8yfcA8rTZQB+vxYyM9vAI2U0vDLGGfIJy
 vutkFVFlx3zvB/LwkqKxO1Zhegmmb3Lh6V0Sj8MNmRXtTiRqKmKokko1doEKvfc01llt
 m1k5v66LhFEesVNI9Fs78siXiJEJKb+BhvYsnd/58x+uaR7+OOZwrnkeKi2AGgaPMM8m
 J+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uZXjrCktHYqiHY7Zuave3Zqe+nWlABu14O38dLKiRSc=;
 b=T2yA7J/bFzjGtnR4QnbMBdaH2BwJakV/vQ5FBEGwM9qMzrufZ1RAlbgitmCxLhN7sh
 BOSxXgtcGPszxiBv3Q65/IlCKM303gji/JMUqAqYAGL92NQTp8V+0i6HUEzQuCiTm6/N
 P0h6Xc6piWVPPe55jzgwaI7R1D7bYqBJ6xk6a5Xwjai3/IlcKpMSUcr0ut4P8i1rva0f
 KXDesaE2ICEzL04RiopNd4mPq5XV0ElD3Duwv+qLR2cIluiakNqddtxIpOmZViC53wRr
 nCRnxlCqLb4mtiJx3KI2HpHuCbeTbEeg/dlbsgMB2uZzAUTqL2yVGRRPmpiWFu+/ovK+
 ytxA==
X-Gm-Message-State: AOAM5337DFTC3VMdOMuhZSTebjIqZW0a8YQqDAj6JZITno+yPfEWU73l
 oL6ZTqNPA9s0EmIQ6/8UVXAyuw==
X-Google-Smtp-Source: ABdhPJya7BBhAOKrUhmySN3jYp1EpbKfOqKBSj+U+j//RgFUf85U7EK52a+yYa92TMoPjVXQfaSu4g==
X-Received: by 2002:a37:496:: with SMTP id 144mr3716033qke.456.1624363303727; 
 Tue, 22 Jun 2021 05:01:43 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id d23sm1485085qto.74.2021.06.22.05.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 05:01:43 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lvf66-00A9JB-Im; Tue, 22 Jun 2021 09:01:42 -0300
Date: Tue, 22 Jun 2021 09:01:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210622120142.GL1096940@ziepe.ca>
References: <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com> <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
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
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
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

On Tue, Jun 22, 2021 at 11:42:27AM +0300, Oded Gabbay wrote:
> On Tue, Jun 22, 2021 at 9:37 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
> > > On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
> > >
> > >> Another thing I want to emphasize is that we are doing p2p only
> > >> through the export/import of the FD. We do *not* allow the user to
> > >> mmap the dma-buf as we do not support direct IO. So there is no access
> > >> to these pages through the userspace.
> > > Arguably mmaping the memory is a better choice, and is the direction
> > > that Logan's series goes in. Here the use of DMABUF was specifically
> > > designed to allow hitless revokation of the memory, which this isn't
> > > even using.
> >
> > The major problem with this approach is that DMA-buf is also used for
> > memory which isn't CPU accessible.

That isn't an issue here because the memory is only intended to be
used with P2P transfers so it must be CPU accessible.

> > That was one of the reasons we didn't even considered using the mapping
> > memory approach for GPUs.

Well, now we have DEVICE_PRIVATE memory that can meet this need
too.. Just nobody has wired it up to hmm_range_fault()

> > > So you are taking the hit of very limited hardware support and reduced
> > > performance just to squeeze into DMABUF..
> 
> Thanks Jason for the clarification, but I honestly prefer to use
> DMA-BUF at the moment.
> It gives us just what we need (even more than what we need as you
> pointed out), it is *already* integrated and tested in the RDMA
> subsystem, and I'm feeling comfortable using it as I'm somewhat
> familiar with it from my AMD days.

You still have the issue that this patch is doing all of this P2P
stuff wrong - following the already NAK'd AMD approach.

> I'll go and read Logan's patch-set to see if that will work for us in
> the future. Please remember, as Daniel said, we don't have struct page
> backing our device memory, so if that is a requirement to connect to
> Logan's work, then I don't think we will want to do it at this point.

It is trivial to get the struct page for a PCI BAR.

Jason
