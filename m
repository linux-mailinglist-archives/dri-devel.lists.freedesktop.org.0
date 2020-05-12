Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36F1CFADA
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 18:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279FA6E938;
	Tue, 12 May 2020 16:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685BB6E938
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 16:37:17 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id i27so10986095ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wBA/X/8LEF2/kwe3eKVgHZUc/oSPTTRgLnnWRSdSQLs=;
 b=hiy/QtxlJN174UuHJPA8RQt/9OWdx2TwzKQIWY51S80pkCrD604gpSFQEqfc983O4t
 o61h+m+xWMkCJVrp0RmKoucQ9gsv/4+Gy3wYnhZjjMojz3mhlRKwNDJl2twbTJxUONMp
 Uu96Z6XsoFCT4+Uyfos6zuqf/X6BP5QaZluQke+VTMbHidGldzkqgDR7Px69cjpEP38h
 OXyWtiruYgRN+T/+Z0V9WpiPLrb+dIYpafNaSPSbbDhikc4ur0qeDrQgA5EDox0Dah/W
 Zh7a7HmZe6pLxgJrgu1Rg6CrywXQQTwJC2QXTeKoL+KHazb7O86Cjz9Z6b8jB9mI+r7I
 8bpg==
X-Gm-Message-State: AGi0PubfQGD5vSHT7idRKZDCsQl8N0AfG50zZnEMA8IObVkAXX1W0/V1
 nJ+I/Xfmjzq0bGdcj8ABAw==
X-Google-Smtp-Source: APiQypJPGJFpNg4zyPPhL4TuOM3za0wjxYJWn89WKnZvHZpHJujTR9ZomHIUQRCotEkQVHzDbu3bUA==
X-Received: by 2002:a9d:7a98:: with SMTP id l24mr18180169otn.79.1589301436443; 
 Tue, 12 May 2020 09:37:16 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 61sm3538453oty.56.2020.05.12.09.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:37:15 -0700 (PDT)
Received: (nullmailer pid 10735 invoked by uid 1000);
 Tue, 12 May 2020 16:37:14 -0000
Date: Tue, 12 May 2020 11:37:14 -0500
From: Rob Herring <robh@kernel.org>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [RFC][PATCH 3/4] dma-buf: cma_heap: Extend logic to export CMA
 regions tagged with "linux,cma-heap"
Message-ID: <20200512163714.GA22577@bogus>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-4-john.stultz@linaro.org>
 <20200501102143.xcckvsfecumbei3c@DESKTOP-E1NTVVP.localdomain>
 <47e7eded-7240-887a-39e1-97c55bf752e7@arm.com>
 <CALAqxLU6kmvJ+xPCFzc3N+RNMv4g=L9bmzgE0wrOXefiGfPoHg@mail.gmail.com>
 <20200504090628.d2q32dwyg6em5pp7@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504090628.d2q32dwyg6em5pp7@DESKTOP-E1NTVVP.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, nd <nd@arm.com>,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Christoph Hellwig <hch@lst.de>, Pratik Patel <pratikp@codeaurora.org>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-mm <linux-mm@kvack.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 04, 2020 at 10:06:28AM +0100, Brian Starkey wrote:
> On Fri, May 01, 2020 at 12:01:40PM -0700, John Stultz wrote:
> > On Fri, May 1, 2020 at 4:08 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > >
> > > On 2020-05-01 11:21 am, Brian Starkey wrote:
> > > > Hi John,
> > > >
> > > > On Fri, May 01, 2020 at 07:39:48AM +0000, John Stultz wrote:
> > > >> This patch reworks the cma_heap initialization so that
> > > >> we expose both the default CMA region and any CMA regions
> > > >> tagged with "linux,cma-heap" in the device-tree.
> > > >>
> > > >> Cc: Rob Herring <robh+dt@kernel.org>
> > > >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > >> Cc: "Andrew F. Davis" <afd@ti.com>
> > > >> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > >> Cc: Liam Mark <lmark@codeaurora.org>
> > > >> Cc: Pratik Patel <pratikp@codeaurora.org>
> > > >> Cc: Laura Abbott <labbott@redhat.com>
> > > >> Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > >> Cc: Chenbo Feng <fengc@google.com>
> > > >> Cc: Alistair Strachan <astrachan@google.com>
> > > >> Cc: Sandeep Patil <sspatil@google.com>
> > > >> Cc: Hridya Valsaraju <hridya@google.com>
> > > >> Cc: Christoph Hellwig <hch@lst.de>
> > > >> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > >> Cc: Robin Murphy <robin.murphy@arm.com>
> > > >> Cc: Andrew Morton <akpm@linux-foundation.org>
> > > >> Cc: devicetree@vger.kernel.org
> > > >> Cc: dri-devel@lists.freedesktop.org
> > > >> Cc: linux-mm@kvack.org
> > > >> Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > >> ---
> > > >>   drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++---------
> > > >>   1 file changed, 9 insertions(+), 9 deletions(-)
> > > >>
> > > >> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > > >> index 626cf7fd033a..dd154e2db101 100644
> > > >> --- a/drivers/dma-buf/heaps/cma_heap.c
> > > >> +++ b/drivers/dma-buf/heaps/cma_heap.c
> > > >> @@ -141,6 +141,11 @@ static int __add_cma_heap(struct cma *cma, void *data)
> > > >>   {
> > > >>      struct cma_heap *cma_heap;
> > > >>      struct dma_heap_export_info exp_info;
> > > >> +    struct cma *default_cma = dev_get_cma_area(NULL);
> > > >> +
> > > >> +    /* We only add the default heap and explicitly tagged heaps */
> > > >> +    if (cma != default_cma && !cma_dma_heap_enabled(cma))
> > > >> +            return 0;
> > > >
> > > > Thinking about the pl111 thread[1], I'm wondering if we should also
> > > > let drivers call this directly to expose their CMA pools, even if they
> > > > aren't tagged for dma-heaps in DT. But perhaps that's too close to
> > > > policy.
> > >
> > > That sounds much like what my first thoughts were - apologies if I'm
> > > wildly off-base here, but as far as I understand:
> > >
> > > - Device drivers know whether they have their own "memory-region" or not.
> > > - Device drivers already have to do *something* to participate in dma-buf.
> > > - Device drivers know best how they make use of both the above.
> > > - Therefore couldn't it be left to drivers to choose whether to register
> > > their CMA regions as heaps, without having to mess with DT at all?

+1, but I'm biased toward any solution not using DT. :)

> > I guess I'm not opposed to this. But I guess I'd like to see some more
> > details? You're thinking the pl111 driver would add the
> > "memory-region" node itself?
> > 
> > Assuming that's the case, my only worry is what if that memory-region
> > node isn't a CMA area, but instead something like a carveout? Does the
> > driver need to parse enough of the dt to figure out where to register
> > the region as a heap?
> 
> My thinking was more like there would already be a reserved-memory
> node in DT for the chunk of memory, appropriately tagged so that it
> gets added as a CMA region. 
> 
> The device's node would have "memory-region=<&blah>;" and would use
> of_reserved_mem_device_init() to link up dev->cma_area to the
> corresponding cma region.
> 
> So far, that's all in-place already. The bit that's missing is
> exposing that dev->cma_area to userspace as a dma_heap - so we could
> just have "int cma_heap_add(struct cma *cma)" or "int
> cma_heap_dev_add(struct device *dev)" or something exported for
> drivers to expose their device-assigned cma region if they wanted to.
> 
> I don't think this runs into the lifetime problems of generalised
> heaps-as-modules either, because the CMA region will never go away
> even if the driver does.
> 
> Alongside that, I do think the completely DT-driven approach can be
> useful too - because there may be regions which aren't associated with
> any specific device driver, that we want exported as heaps.

And they are associated with the hardware description rather than the 
userspace environment? 

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
