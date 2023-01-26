Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9D67D56E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5905910E021;
	Thu, 26 Jan 2023 19:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32F510E021
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:38:18 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id e8so2221926qts.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=548u3Fp4tscAsRqm8ZTE2VWhUoxZOCMAGUWVcX6Go58=;
 b=epV5VW3hrViYljNLAdWJDqX3fAl4wYMv55qfvqUl+cZybWCeeDvqryFJs7Zk1z1ge0
 +YfWxsTDgetquN/yOeHPal429etypXOBpel4tIAV8vd4EP8H055kKatEvKe6oZxMs3PT
 LcO0xq4K0msdWtCUNqYN4NK0vLHs5L0h44+WlAHrYWvJgXcgjDmqAFXJlLbfBB/UTvvN
 9vIhPdjjmCe8giVOUtXcRKZC0HKhopCXDpNQUBIZSpW7Qbo2/7o+/aS/ZPpfQVm1O7vS
 K1a26f+LNFd2YzHSgykx3DHZbq9/58TJ23dpXqRpwr3NjRuHpKkuas3uu7YQGuqzHxWI
 HpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=548u3Fp4tscAsRqm8ZTE2VWhUoxZOCMAGUWVcX6Go58=;
 b=Eb+yURs++Q/ce1D9zOfF0ruSXrpn2v2Ytv1xDHgoGoRM4wxHe3jEhnLLzH8aSfZVqb
 tUxsYJZWH7EaXkVJy/oC0NFKZvYz2RDi5ISUNuWLmtTJQ36H50vryupRKY51Za/KGskB
 lxTF4VfJbCMhchHLg0FwffAtxzA3au0JwToilM/GjMhSlj4ACuT9wiiUXFdnqNWnddHw
 7tG7CSwNzN8gIMpoLXlBjqxRiNgEo17YeKVRVjYtTyevsq2uPdIuO9OswdUY7HyLpkeB
 FJYXOlppEKRh6BD7mbbshHLt/gfbwWPTE9ePy8Wyb+XwLnrkGqtliEKeZz6naJbelW0e
 Wa6Q==
X-Gm-Message-State: AFqh2koAh2Ss9U7wPisukR/KtSqcJt8xKqVA/rU3Vk34MoRhPARLhdZf
 ErNPxssDiKuLupP+cxjNp9Amhw==
X-Google-Smtp-Source: AMrXdXv+huCHA7ip/FVnskiv66KzYaO0gWPYCPL7QS4WBmaP67lWrrmrdvcrLuRJ9ZU3cV/x/SyhoQ==
X-Received: by 2002:ac8:70a:0:b0:3b1:c477:eb65 with SMTP id
 g10-20020ac8070a000000b003b1c477eb65mr52142649qth.60.1674761897975; 
 Thu, 26 Jan 2023 11:38:17 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-167-59-176.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.59.176]) by smtp.gmail.com with ESMTPSA id
 v3-20020ac87283000000b003b62e9c82ebsm1276806qto.48.2023.01.26.11.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:38:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1pL84e-00HP8B-92;
 Thu, 26 Jan 2023 15:38:16 -0400
Date: Thu, 26 Jan 2023 15:38:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [Lsf-pc] [LSF/MM/BPF proposal]: Physr discussion
Message-ID: <Y9LWqEtmkmsMrHne@ziepe.ca>
References: <Y8v+qVZ8OmodOCQ9@nvidia.com>
 <63cee1d3eaaef_3a36e529488@dwillia2-xfh.jf.intel.com.notmuch>
 <Y87p9i0vCZo/3Qa0@casper.infradead.org>
 <63cef32cbafc3_3a36e529465@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63cef32cbafc3_3a36e529465@dwillia2-xfh.jf.intel.com.notmuch>
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
 dri-devel@lists.freedesktop.org, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org,
 Joao Martins <joao.m.martins@oracle.com>,
 Jason Gunthorpe via Lsf-pc <lsf-pc@lists.linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 12:50:52PM -0800, Dan Williams wrote:
> Matthew Wilcox wrote:
> > On Mon, Jan 23, 2023 at 11:36:51AM -0800, Dan Williams wrote:
> > > Jason Gunthorpe via Lsf-pc wrote:
> > > > I would like to have a session at LSF to talk about Matthew's
> > > > physr discussion starter:
> > > > 
> > > >  https://lore.kernel.org/linux-mm/YdyKWeU0HTv8m7wD@casper.infradead.org/
> > > > 
> > > > I have become interested in this with some immediacy because of
> > > > IOMMUFD and this other discussion with Christoph:
> > > > 
> > > >  https://lore.kernel.org/kvm/4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/
> > > 
> > > I think this is a worthwhile discussion. My main hangup with 'struct
> > > page' elimination in general is that if anything needs to be allocated
> > 
> > You're the first one to bring up struct page elimination.  Neither Jason
> > nor I have that as our motivation.
> 
> Oh, ok, then maybe I misread the concern in the vfio discussion. I
> thought the summary there is debating the ongoing requirement for
> 'struct page' for P2PDMA?

The VFIO problem is we need a unique pgmap at 4k granuals (or maybe
smaller, technically), tightly packed, because VFIO exposes PCI BAR
space that can be sized in such small amounts.

So, using struct page means some kind of adventure in the memory
hotplug code to allow tightly packed 4k pgmaps.

And that is assuming that every architecture that wants to support
VFIO supports pgmap and memory hot plug. I was just told that s390
doesn't, that is kind of important..

If there is a straightforward way to get a pgmap into VFIO then I'd do
that and give up this quest :)

I've never been looking at this from the angle of eliminating struct
page, but from the perspective of allowing the DMA API to correctly do
scatter/gather IO to non-struct page P2P memory because I *can't* get
a struct page for it. Ie make dma_map_resource() better. Make P2P
DMABUF work properly.

This has to come along with a different way to store address ranges
because the basic datum that needs to cross all the functional
boundaries we have is an address range list.

My general current sketch is we'd allocate some 'DMA P2P provider'
structure analogous to the MEMORY_DEVICE_PCI_P2PDMA pgmap and a single
provider would cover the entire MMIO aperture - eg the providing
device's MMIO BAR. This is enough information for the DMA API to do
its job.

We get this back either by searching an interval treey thing on the
physical address or by storing it directly in the address range list.

Jason
