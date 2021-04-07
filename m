Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AA9356758
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6666E8DE;
	Wed,  7 Apr 2021 08:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D86E8D9;
 Wed,  7 Apr 2021 08:57:26 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 29AFC418; Wed,  7 Apr 2021 10:57:21 +0200 (CEST)
Date: Wed, 7 Apr 2021 10:57:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: cleanup unused or almost unused IOMMU APIs and the FSL PAMU
 driver v3
Message-ID: <YG1z7/b0i8WYOMHA@8bytes.org>
References: <20210401155256.298656-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401155256.298656-1-hch@lst.de>
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
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 05:52:36PM +0200, Christoph Hellwig wrote:
> Diffstat:
>  arch/powerpc/include/asm/fsl_pamu_stash.h   |   12 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |    5 
>  drivers/iommu/amd/iommu.c                   |   23 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   75 ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |    1 
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  111 +---
>  drivers/iommu/arm/arm-smmu/arm-smmu.h       |    2 
>  drivers/iommu/dma-iommu.c                   |    9 
>  drivers/iommu/fsl_pamu.c                    |  293 -----------
>  drivers/iommu/fsl_pamu.h                    |   12 
>  drivers/iommu/fsl_pamu_domain.c             |  688 ++--------------------------
>  drivers/iommu/fsl_pamu_domain.h             |   46 -
>  drivers/iommu/intel/iommu.c                 |   95 ---
>  drivers/iommu/iommu.c                       |  118 +---
>  drivers/soc/fsl/qbman/qman_portal.c         |   55 --
>  drivers/vfio/vfio_iommu_type1.c             |   31 -
>  drivers/vhost/vdpa.c                        |   10 
>  include/linux/io-pgtable.h                  |    4 
>  include/linux/iommu.h                       |   76 ---
>  19 files changed, 203 insertions(+), 1463 deletions(-)

Applied, thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
