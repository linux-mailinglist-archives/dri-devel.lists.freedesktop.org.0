Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F9C6A60CD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 21:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C35310E05C;
	Tue, 28 Feb 2023 20:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C090010E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 20:59:53 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-536af432ee5so311608917b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H15Wgrg45uphokJUqJE+ge3DLPSULLnvrd4PVO7cLLc=;
 b=fF7yR1zieU4gkviG5qrWrdfSWhtKPGGWlvtMBXv4KHBDu0aJ3gWsucs0SnY/VXu9xI
 98ilQKazhvCJdc/WBewUB+5SWcdhorii7J1pOeAzos6f/dQqHZdg02M4AtOUfeTq8eOO
 f09htTPMG/pkdx7lHQGqeX5kSZIxN5OkkPfc77FKJnyPHYn11vG35NdgnRPHPkAFKcea
 XgImIWOsGyc18s8CqlKSzyo64N6r/4hd/TI5CyRtFIgPb+s+gMlpDT8KVNO9m7c21yRW
 SoYMoaCOLdsdFi4o18FJKo606Yo0hMRNZOz6SykPjzCGVDwzVDiSukBxaNiAwswCzVE4
 k7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H15Wgrg45uphokJUqJE+ge3DLPSULLnvrd4PVO7cLLc=;
 b=QFXpbvTBNqCrcuEllTQoUsI1+oVITZNAv7ZXT9ny6L40WPmQty1M8fViEI1Kn4oW5I
 LbLK22woHySHtTyjv674ga+MdUpcxXf6wRG8dpOd3vBXvbslqU7VkLusndOaMRm7l1Ba
 e46GEbbna4ElpHHLwFl51tgLe6GDo9Qe3M4kSGyzGyOM0Z5rCPEhxdFiDY1VZiiCGtoo
 ISyurddkGVHtj6zqOSQUuthYbtySqqHZWvQBuP1sN6BYvRawALdYrTqCgx4ATVMQaMRy
 ZebXNYJjaFYHuqsMdE4aTcN/GnwyDLGO7+0R0PukrzRC7DlXPBTwarkZMVykEaIomYCZ
 DV8g==
X-Gm-Message-State: AO0yUKWRDe1jpWQrcy4DQB6rhRn7I6NObf2efkbO430yfyZ6PymkBZFC
 S6Jd5GHdA45sOnw1CxkmuJ+adZDv24ZBrgXPvKpl9Q==
X-Google-Smtp-Source: AK7set+d6vs4ymgWzsVBho7zIKcb2AoIn1quNMhQ7GG855RnJ+2d+gNas87Vdn9aekeC5XgvBudues+ObsH6EIGw7ZY=
X-Received: by 2002:a5b:8b:0:b0:90d:af77:9ca6 with SMTP id
 b11-20020a5b008b000000b0090daf779ca6mr2178238ybp.7.1677617992660; 
 Tue, 28 Feb 2023 12:59:52 -0800 (PST)
MIME-Version: 1.0
References: <Y8v+qVZ8OmodOCQ9@nvidia.com>
In-Reply-To: <Y8v+qVZ8OmodOCQ9@nvidia.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 28 Feb 2023 12:59:41 -0800
Message-ID: <CABdmKX3kJZKsOQSi=4+RE8D3AF=-823B9WV11sC4WH67hjzqSQ@mail.gmail.com>
Subject: Re: [LSF/MM/BPF proposal]: Physr discussion
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: nvdimm@lists.linux.dev, lsf-pc@lists.linuxfoundation.org,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 Joao Martins <joao.m.martins@oracle.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 21, 2023 at 7:03 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> I would like to have a session at LSF to talk about Matthew's
> physr discussion starter:
>
>  https://lore.kernel.org/linux-mm/YdyKWeU0HTv8m7wD@casper.infradead.org/
>
> I have become interested in this with some immediacy because of
> IOMMUFD and this other discussion with Christoph:
>
>  https://lore.kernel.org/kvm/4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/
>
> Which results in, more or less, we have no way to do P2P DMA
> operations without struct page - and from the RDMA side solving this
> well at the DMA API means advancing at least some part of the physr
> idea.
>
> So - my objective is to enable to DMA API to "DMA map" something that
> is not a scatterlist, may or may not contain struct pages, but can
> still contain P2P DMA data. From there I would move RDMA MR's to use
> this new API, modify DMABUF to export it, complete the above VFIO
> series, and finally, use all of this to add back P2P support to VFIO
> when working with IOMMUFD by allowing IOMMUFD to obtain a safe
> reference to the VFIO memory using DMABUF. From there we'd want to see
> pin_user_pages optimized, and that also will need some discussion how
> best to structure it.
>
> I also have several ideas on how something like physr can optimize the
> iommu driver ops when working with dma-iommu.c and IOMMUFD.
>
> I've been working on an implementation and hope to have something
> draft to show on the lists in a few weeks. It is pretty clear there
> are several interesting decisions to make that I think will benefit
> from a live discussion.
>
> Providing a kernel-wide alternative to scatterlist is something that
> has general interest across all the driver subsystems. I've started to
> view the general problem rather like xarray where the main focus is to
> create the appropriate abstraction and then go about transforming
> users to take advatange of the cleaner abstraction. scatterlist
> suffers here because it has an incredibly leaky API, a huge number of
> (often sketchy driver) users, and has historically been very difficult
> to improve.
>
> The session would quickly go over the current state of whatever the
> mailing list discussion evolves into and an open discussion around the
> different ideas.
>
> Thanks,
> Jason
>

Hi, I'm interested in participating in this discussion!
