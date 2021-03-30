Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6D34E82D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 15:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E03D6E8D4;
	Tue, 30 Mar 2021 13:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16336E8D3;
 Tue, 30 Mar 2021 13:00:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6723461959;
 Tue, 30 Mar 2021 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109224;
 bh=m3TvkxvqPC7Tpakpaq16UQpVjJGrx5gC57aV7gCm8GE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q+OSrGSvrWc7WYths8Js73WEMx795hdLZQgMXoL3dU2M1loRm7gpXJPstw5r96wE+
 MHERTkZdUmMqt0s1BPvMPCPEFoJZkJamnTKDq4K4rys4fqbm/nejUkGZhZ84T7bvZv
 Ler6sSRcp45AsVGHeW+zKyc/iZ0K+xWrwbiiAvOv9AdkdKTu7n28KdSWcWg3TCBiwH
 efhhakrMIGdlWHG5y8cLowYyjKPeJvPwVS1ZDVu/G3v2OfwKusR9D1kPYvmwIyRcwB
 RPVE1raY7AUORsYfBkgmuAg8ie5APSgAugC4iRu1nKmYUKDnrH6tc0xtIdlm9sb2o9
 UNwLXhfk0L68Q==
Date: Tue, 30 Mar 2021 14:00:19 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/18] iommu: remove DOMAIN_ATTR_GEOMETRY
Message-ID: <20210330130019.GM5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-14-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-14-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:19PM +0100, Christoph Hellwig wrote:
> The geometry information can be trivially queried from the iommu_domain
> struture.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/iommu.c           | 20 +++-----------------
>  drivers/vfio/vfio_iommu_type1.c | 26 ++++++++++++--------------
>  drivers/vhost/vdpa.c            | 10 +++-------
>  include/linux/iommu.h           |  1 -
>  4 files changed, 18 insertions(+), 39 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
