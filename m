Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501E934E860
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 15:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620B46E8D5;
	Tue, 30 Mar 2021 13:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF3E88E38;
 Tue, 30 Mar 2021 13:05:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9376C619C7;
 Tue, 30 Mar 2021 13:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109553;
 bh=9DMOAy0WF/TXjALvJ8cxeKA4ftJYf/NNqPLbi+DnD68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASq3k8Nq/tvCuQ2EmFyEMaSv7t7NeIApY9eI7x9ee+vSZV/QpfSPyj4afiU/w/YeA
 V6T+ShFu6z2IUCDRNQ5m2kI8xpNcjbpAZt7wh1Hoef8T0oxlu6hh9L/d/mfulZ1C25
 aJP3lB5UTHltpSOc3b20Y5nFKnkgQr6MzMzUL42CpuN89rPVZfrbrXFVd/iN0moIwb
 4Yh8HJjmloXXxeWDqJdJoIHBvugrH2WjPBifz2Y5tDyWWy+l5Cv1lueJ8YoDy4u18r
 eKOzHPNwfXiotj2ibhvmC+6DxLpk2ngR797aZOhmV45MM2MizHt0h9oBwa887iRPan
 0tJ7tm6PImUDw==
Date: Tue, 30 Mar 2021 14:05:47 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/18] iommu: remove iommu_set_cmd_line_dma_api and
 iommu_cmd_line_dma_api
Message-ID: <20210330130546.GO5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-16-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-16-hch@lst.de>
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
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 04:38:21PM +0100, Christoph Hellwig wrote:
> Don't obsfucate the trivial bit flag check.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/iommu.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
