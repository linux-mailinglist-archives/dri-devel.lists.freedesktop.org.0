Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4F432E3BD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 09:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A83B6E303;
	Fri,  5 Mar 2021 08:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 555 seconds by postgrey-1.36 at gabe;
 Thu, 04 Mar 2021 11:19:26 UTC
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAFB6EA19;
 Thu,  4 Mar 2021 11:19:26 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A5EF3321; Thu,  4 Mar 2021 12:10:08 +0100 (CET)
Date: Thu, 4 Mar 2021 12:10:04 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: cleanup unused or almost unused IOMMU APIs and the FSL PAMU driver
Message-ID: <20210304111004.GA26414@8bytes.org>
References: <20210301084257.945454-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301084257.945454-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 05 Mar 2021 08:36:53 +0000
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

On Mon, Mar 01, 2021 at 09:42:40AM +0100, Christoph Hellwig wrote:
> Diffstat:
>  arch/powerpc/include/asm/fsl_pamu_stash.h   |   12 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |    2 
>  drivers/iommu/amd/iommu.c                   |   23 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   85 ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  122 +---
>  drivers/iommu/dma-iommu.c                   |    8 
>  drivers/iommu/fsl_pamu.c                    |  264 ----------
>  drivers/iommu/fsl_pamu.h                    |   10 
>  drivers/iommu/fsl_pamu_domain.c             |  694 ++--------------------------
>  drivers/iommu/fsl_pamu_domain.h             |   46 -
>  drivers/iommu/intel/iommu.c                 |   55 --
>  drivers/iommu/iommu.c                       |   75 ---
>  drivers/soc/fsl/qbman/qman_portal.c         |   56 --
>  drivers/vfio/vfio_iommu_type1.c             |   31 -
>  drivers/vhost/vdpa.c                        |   10 
>  include/linux/iommu.h                       |   81 ---
>  16 files changed, 214 insertions(+), 1360 deletions(-)

Nice cleanup, thanks. The fsl_pamu driver and interface has always been
a little bit of an alien compared to other IOMMU drivers. I am inclined
to merge this after -rc3 is out, given some reviews. Can you also please
add changelogs to the last three patches?

Thanks,

	Joerg
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
