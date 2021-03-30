Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7168C34E84F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 15:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE73D89B05;
	Tue, 30 Mar 2021 13:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662E088E38;
 Tue, 30 Mar 2021 13:04:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44FF2619B4;
 Tue, 30 Mar 2021 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109473;
 bh=Ai+ioablpsVCP2atsV7c8O/Yf3FVTPamywu1gCQBwQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HhMpk57DFGVpx4ab+L1MraoUiLI5kQLI2sEy2eeVU34m/M9hnmwHSf1BSYHb+BN7B
 OH/3kLJ4LRy/KSa51z3LwWQBZHM4JRe/0movK0avHRIMyQnkvWZ6oW5mEj0UPhv8kQ
 tn65df3bajqTqdrmTJ67rxDd1vixWUxfqPUxOhITAvzITPwIDd2ssDWDcbGhabIZQv
 5Bfl/YURDw2+T3/H6P/OVMEBHQMNsqzXCjXk8HuSfMiFNJSlcJ5meb25/4prvxBxMN
 lxUV8mLtcIaNFm0+8MyEBCfE8BxCcQpHQtJSeqiecPNHliWDi0EAvdK2kf87cH0eE7
 7QTL4O7hg9h0Q==
Date: Tue, 30 Mar 2021 14:04:27 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/18] iommu: remove DOMAIN_ATTR_NESTING
Message-ID: <20210330130427.GN5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-15-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:20PM +0100, Christoph Hellwig wrote:
> Use an explicit enable_nesting method instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 43 ++++++++-------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 30 +++++++-------
>  drivers/iommu/intel/iommu.c                 | 31 +++++----------
>  drivers/iommu/iommu.c                       | 10 +++++
>  drivers/vfio/vfio_iommu_type1.c             |  5 +--
>  include/linux/iommu.h                       |  4 +-
>  6 files changed, 55 insertions(+), 68 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
