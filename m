Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B023B08BA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BEF6E580;
	Tue, 22 Jun 2021 15:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764A26E580
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 15:23:45 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id f5so9400047qvu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=r42ocVEmWIA//O7Vp0R5aVeKrTj4f+CjM19TgcLu7yI=;
 b=JbYlgSzYmG1Fc66FYJM2c7uKHMNG0BKhfYRhDl/t4HfZIXCTkXkNOXDsHPqa4n2peB
 ysI6mqNNkHNeAKm8LsjMNdQE2b2zkO/XX6peVaIj0AMNhYUfmW34UNv99J2ObeyW/O4M
 AlP7HDwJNBY8OgpUgjTTorTmyLUlsVUZnNJdeZZN3fBd9t94MplJeK/FtWbF5wQXcwR5
 J/44W0pKR1bz4Y8dMUyaa9V35Pyl3Yzhscasz1N63ZBqjUGbU5HIxyMOZAlZZ1TDg33w
 laau+inbi3QaWeLqDwOYYzVVpGP9v4S02gOhgQLFCKQspXRAAzDLVW1nl9ri0zrdJ0n3
 86Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r42ocVEmWIA//O7Vp0R5aVeKrTj4f+CjM19TgcLu7yI=;
 b=q1FqgKzcD4ieIRFnzsaSTTqwI6ucWb9DOwpaLxrZZz8u3VBPWn7dZGT8MvwnT8LtE2
 eAZqsVo3n64EEALuNzXqeTb3J/kDg3TfSItO4ZSX3AynYvt3IQ/oLEk/jgiRmzOSi/bm
 hl4SW8aeVqIT72VZmnpt6Tkw+yS9WyGoPjieWbTBng7VXP/D3+9VftMPJoCK86BtiQho
 lWgMYCGdVy7554E0W7HaPa58zq7zbGiQfFVt3kVG7JIbGax+pvvf23YOp5g9UIyKXy3c
 8SqsMAJxze2NmcMyh0QC+fOt+xpR0NiAlAUdlmzh1lT6w8/k5egJgERrNGKwPMbFU7VK
 +w3A==
X-Gm-Message-State: AOAM531n+rLedOZ8vaAbtFWn9S7ZsxDFdnpugncf2uF0rIuTrUwIYexZ
 w7F2wZXBS/WOR+muhojFzE9lYQ==
X-Google-Smtp-Source: ABdhPJwYy9rg7mWFRLoue2Gvxh5Qw5S6GBldIL56hi68CLiY+GrTF6D8VqH249atgxPW27LFsL858w==
X-Received: by 2002:ad4:56e5:: with SMTP id cr5mr25603185qvb.7.1624375424489; 
 Tue, 22 Jun 2021 08:23:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id z3sm13252730qkj.40.2021.06.22.08.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:23:44 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lviFb-00ADEI-G0; Tue, 22 Jun 2021 12:23:43 -0300
Date: Tue, 22 Jun 2021 12:23:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210622152343.GO1096940@ziepe.ca>
References: <20210621141217.GE1096940@ziepe.ca>
 <CAFCwf10KvCh0zfHEHqYR-Na6KJh4j+9i-6+==QaMdHHpLH1yEA@mail.gmail.com>
 <20210621175511.GI1096940@ziepe.ca>
 <CAKMK7uEO1_B59DtM7N2g7kkH7pYtLM_WAkn+0f3FU3ps=XEjZQ@mail.gmail.com>
 <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca>
 <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
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

On Tue, Jun 22, 2021 at 02:23:03PM +0200, Christian König wrote:
> Am 22.06.21 um 14:01 schrieb Jason Gunthorpe:
> > On Tue, Jun 22, 2021 at 11:42:27AM +0300, Oded Gabbay wrote:
> > > On Tue, Jun 22, 2021 at 9:37 AM Christian König
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > Am 22.06.21 um 01:29 schrieb Jason Gunthorpe:
> > > > > On Mon, Jun 21, 2021 at 10:24:16PM +0300, Oded Gabbay wrote:
> > > > > 
> > > > > > Another thing I want to emphasize is that we are doing p2p only
> > > > > > through the export/import of the FD. We do *not* allow the user to
> > > > > > mmap the dma-buf as we do not support direct IO. So there is no access
> > > > > > to these pages through the userspace.
> > > > > Arguably mmaping the memory is a better choice, and is the direction
> > > > > that Logan's series goes in. Here the use of DMABUF was specifically
> > > > > designed to allow hitless revokation of the memory, which this isn't
> > > > > even using.
> > > > The major problem with this approach is that DMA-buf is also used for
> > > > memory which isn't CPU accessible.
> > That isn't an issue here because the memory is only intended to be
> > used with P2P transfers so it must be CPU accessible.
> 
> No, especially P2P is often done on memory resources which are not even
> remotely CPU accessible.

That is a special AMD thing, P2P here is PCI P2P and all PCI memory is
CPU accessible.

> > > > > So you are taking the hit of very limited hardware support and reduced
> > > > > performance just to squeeze into DMABUF..
> > You still have the issue that this patch is doing all of this P2P
> > stuff wrong - following the already NAK'd AMD approach.
> 
> Well that stuff was NAKed because we still use sg_tables, not because we
> don't want to allocate struct pages.

sg lists in general.
 
> The plan is to push this forward since DEVICE_PRIVATE clearly can't handle
> all of our use cases and is not really a good fit to be honest.
> 
> IOMMU is now working as well, so as far as I can see we are all good here.

How? Is that more AMD special stuff?

This patch series never calls to the iommu driver, AFAICT.

> > > I'll go and read Logan's patch-set to see if that will work for us in
> > > the future. Please remember, as Daniel said, we don't have struct page
> > > backing our device memory, so if that is a requirement to connect to
> > > Logan's work, then I don't think we will want to do it at this point.
> > It is trivial to get the struct page for a PCI BAR.
> 
> Yeah, but it doesn't make much sense. Why should we create a struct page for
> something that isn't even memory in a lot of cases?

Because the iommu and other places need this handle to setup their
stuff. Nobody has yet been brave enough to try to change those flows
to be able to use a physical CPU address.

This is why we have a special struct page type just for PCI BAR
memory.

Jason
