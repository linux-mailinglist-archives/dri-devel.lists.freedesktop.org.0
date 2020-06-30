Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E1F210495
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3E26E817;
	Wed,  1 Jul 2020 07:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49226E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:17:02 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id a11so10531966ilk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3Z8G4sY/3BGmyIjcdbfqV1osL+GlJtPN7I10BAIUxWU=;
 b=k1v79OlGEmtKhJ5piARsXMeK1rd/NK3yT/drkmMqpD3sXC7KYiKNDNNbQU+r+V8P4C
 CjGTxiqMrI3i1arOaNM1SxAIw27Nf3eW/fM3T1Wt70BrgGjUbjaUzNNquHHMMcMrvRxo
 Z1WI44Y3ZJ2/0oiL2+dhywTrG4XZSiNWCu2ho2lds0SEwWVpCix7WIVkmTgRV3qSbaVz
 AR0RbFd8IkNo4iwvYwvkXhbLFHgIqYJvTY1+HOPAUDIM7hLWg3aEP7mug/XM8kOhqY7q
 7PjvYb6sWZwyugTZGz5nOG+I5I9rsvncG7r0CNQ8/E4focEU5U6iRJreMTB6yiYhIoct
 jbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Z8G4sY/3BGmyIjcdbfqV1osL+GlJtPN7I10BAIUxWU=;
 b=tW7RCCpbQlcOlXEL0C2MDaKR+EFV9BWjzWjxCYj5CzBNABx7vDU05xReomGHir5E4S
 dq87anlwIO6qGyalf6rI7J2c5TJ5RT2xWBTYl/8s5cf6w2pS3toV3imFxipFToZXq3c1
 d1ts3KCAoyUr9TOihXwORf5XIVS2lNtxCKRb72WLRc7D53ZmFzG9BPZJzENwgtwAj4ou
 T46RdtqGNmMH1nzgrKZTFsQKjSIz/WJI4sbsSJW4ddFAvCquoQfURSIZZQdgV+0diBrZ
 NR48O8g/8X7aVTwcDMUdsNe7kZFJfV5bM/i8X3xMZOyYk9injr0XoNYwrn2oCVGZR5N+
 QcZA==
X-Gm-Message-State: AOAM530rAQbAmLhxw/rpxOuP9TWVK9suEnS3kZrScIRzPYou7XxhhREZ
 jpiNbIfA/DeydOA2gb7oVv/5tQ==
X-Google-Smtp-Source: ABdhPJzW4EQndHUYdS2/xV0eFxNWR3D/TY/epRvvziYytNeMu+qD0CnLv9714Fptw+qZ4z2bgWiF/A==
X-Received: by 2002:a92:4a09:: with SMTP id m9mr4283864ilf.79.1593544621848;
 Tue, 30 Jun 2020 12:17:01 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id y2sm1815038iox.22.2020.06.30.12.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 12:17:01 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jqLka-0026er-89; Tue, 30 Jun 2020 16:17:00 -0300
Date: Tue, 30 Jun 2020 16:17:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Message-ID: <20200630191700.GL25301@ziepe.ca>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
 <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 06:46:17PM +0000, Xiong, Jianxin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Tuesday, June 30, 2020 10:35 AM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; Doug Ledford <dledford@redhat.com>; Sumit Semwal <sumit.semwal@linaro.org>; Leon Romanovsky
> > <leon@kernel.org>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
> > Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
> > 
> > On Tue, Jun 30, 2020 at 05:21:33PM +0000, Xiong, Jianxin wrote:
> > > > > Heterogeneous Memory Management (HMM) utilizes
> > > > > mmu_interval_notifier and ZONE_DEVICE to support shared virtual
> > > > > address space and page migration between system memory and device
> > > > > memory. HMM doesn't support pinning device memory because pages
> > > > > located on device must be able to migrate to system memory when
> > > > > accessed by CPU. Peer-to-peer access is possible if the peer can
> > > > > handle page fault. For RDMA, that means the NIC must support on-demand paging.
> > > >
> > > > peer-peer access is currently not possible with hmm_range_fault().
> > >
> > > Currently hmm_range_fault() always sets the cpu access flag and device
> > > private pages are migrated to the system RAM in the fault handler.
> > > However, it's possible to have a modified code flow to keep the device
> > > private page info for use with peer to peer access.
> > 
> > Sort of, but only within the same device, RDMA or anything else generic can't reach inside a DEVICE_PRIVATE and extract anything useful.
> 
> But pfn is supposed to be all that is needed.

Needed for what? The PFN of the DEVICE_PRIVATE pages is useless for
anything.

> > Well, what do you want to happen here? The RDMA parts are
> > reasonable, but I don't want to add new functionality without a
> > purpose - the other parts need to be settled out first.
> 
> At the RDMA side, we mainly want to check if the changes are
> acceptable. For example, the part about adding 'fd' to the device
> ops and the ioctl interface. All the previous comments are very
> helpful for us to refine the patch so that we can be ready when GPU
> side support becomes available.

Well, I'm not totally happy with the way the umem and the fd is
handled so roughly and incompletely..

> > Hum. This is not actually so hard to do. The whole dma buf
> > proposal would make a lot more sense if the 'dma buf MR' had to be
> > the dynamic kind and the driver had to provide the faulting. It
> > would not be so hard to change mlx5 to be able to work like this,
> > perhaps. (the locking might be a bit tricky though)
> 
> The main issue is that not all NICs support ODP.

Sure, but there is lots of infrastructure work here to be done on dma
buf, having a correct consumer in the form of ODP might be helpful to
advance it.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
