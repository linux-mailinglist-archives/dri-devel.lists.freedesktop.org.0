Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D95234E8A8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 15:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3705D6E8E2;
	Tue, 30 Mar 2021 13:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03576E8E2;
 Tue, 30 Mar 2021 13:14:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CC5561969;
 Tue, 30 Mar 2021 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617110094;
 bh=/N2/wqR7fHjSlaXvMJl1cBMXpKNT/xsesoTMSv6L4kI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H6MULnqd9QB+NK7wZgljGNSyugWhqntzuA7hl6JZlcXm+z2v3zoJChkrFgo2shzTp
 7kWpdutfdv00Me8uRq6k4CXKfRgdJaXG0FfA9YbsG7wlg+Z7r07gTIgQWxT1LkYSkp
 DWVbOk8SbfrQM2yIud8rcAqs2GuTEOcAwOUAIWj8VuZr3tlHjGMQxciGj89GTcsI+6
 wA3QIpJx15k5zaCAI2i0QTwhK5h7hVXzLMWRdWcVoJrrjF7aHn1fmW9gVtnH0wdl2V
 3tX5hH0qrjR/RU13f5CzrPtpxHRIDR3ndCSVxdrE0CM6hBMj0APadZ/nh/M/gdHzKH
 JgeNVk/teVZHA==
Date: Tue, 30 Mar 2021 14:14:49 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 17/18] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
Message-ID: <20210330131448.GQ5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-18-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-18-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:23PM +0100, Christoph Hellwig wrote:
> Use an explicit set_pgtable_quirks method instead that just passes
> the actual quirk bitmask instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c   | 64 +++++--------------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h   |  2 +-
>  drivers/iommu/iommu.c                   | 11 +++++
>  include/linux/io-pgtable.h              |  4 --
>  include/linux/iommu.h                   | 12 ++++-
>  6 files changed, 35 insertions(+), 63 deletions(-)

I'm fine with this for now, although there has been talk about passing
things other than boolean flags as page-table quirks. We can cross that
bridge when we get there, so:

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
