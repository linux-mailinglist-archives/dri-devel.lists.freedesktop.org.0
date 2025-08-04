Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AFAB1A461
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E1B10E525;
	Mon,  4 Aug 2025 14:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rcZdA0LS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B143810E363
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 14:18:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF9BE5C611E;
 Mon,  4 Aug 2025 14:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED16C4CEE7;
 Mon,  4 Aug 2025 14:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754317096;
 bh=Zr3kPkorN9J0wHoU77coJxVhd5vO47zAf6WxVna9oFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rcZdA0LSgVnIJ/ja+rzujOZjYxEuQpnBSSJNlhmM+uIS36PMWIvxGnxJBKVGS0y/k
 vBjKAwytVDKvxwg3o4C9JLt2cc5Xf3Ulyggy/L7MyOHzWrqYM35ShQ8xJDtl2YOAB7
 3wGRmkXADNX6dFnB5tDVmYtUzfYrZkmqh/fAJX007BI21XLotatJs14FAYy7dz2Pqv
 Eb7LFQAA4+jV/XnEzEvrRUpolhq+I8mzh+IQZcnXLb5j7+5cmwoKzIv7/4Y2lgrdRR
 b8oxjcA0vaYNH78RQuyAh19r+u1Tc+UWreSga05cOcSy8fmAwfSkJk+8HgQjXZFhcc
 /nh+mNJsc6Ehw==
Date: Mon, 4 Aug 2025 17:18:11 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 00/10] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20250804141811.GT402218@unreal>
References: <cover.1754311439.git.leon@kernel.org>
 <20250804141032.GA30056@kvack.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804141032.GA30056@kvack.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 04, 2025 at 10:10:32AM -0400, Benjamin LaHaise wrote:
> FYI: this entire patch series was rejected as spam by large numbers of
> linux-mm subscribers using @gmail.com email addresses.

Thanks for the heads-up. Are you aware of any issues from my side?
I'm sending patches with git-send-email through mail.kernel.org SMTP.

Thanks

> 
> 		-ben (owner-linux-mm)
