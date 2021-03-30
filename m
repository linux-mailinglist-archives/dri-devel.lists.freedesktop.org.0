Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C661534E7F4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 14:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701476E8C4;
	Tue, 30 Mar 2021 12:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF3C6E8C4;
 Tue, 30 Mar 2021 12:54:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBEC161955;
 Tue, 30 Mar 2021 12:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617108844;
 bh=MUsAReQl36x7SR3EX7iZh5BEyF4eEO7patp68iu3zYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RvhuDRnnjbhKmZxor1XvWHCMInipWXvRtxAnhtWSHyskQigqXOQJZBpmkmtBZyI42
 Hzk9YR+zXiAqh+GqCuQsV/e9VwUlbbLL2WBWuGxyEgIjksxNm4QjWpE80+c+eJgjxa
 CDgfI0Go46YGTQMxgFvBCCBuNUOdQ5A9e4RX4fJZrV2JQkPw15LXMK/zAx+kh0z7vL
 kyRwRMIu/q/vE1ATdrsCa4384znPHm83guJWxqP2Cv0dXtUc4fw5FRdDw0Q8vG1MD6
 rhCut5ZrQW9EjJtIgqABXSUdPcCMBGGg98+FfQp3aOd/QWoqSzA6/B7VI2jDOm1MH1
 7esynnh6eCt1Q==
Date: Tue, 30 Mar 2021 13:53:58 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/18] iommu/fsl_pamu: enable the liodn when attaching a
 device
Message-ID: <20210330125358.GJ5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-11-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:16PM +0100, Christoph Hellwig wrote:
> Instead of a separate call to enable all devices from the list, just
> enablde the liodn one the device is attached to the iommu domain.

(typos: "enablde" and "one" probably needs to be "once"?)

> This also remove the DOMAIN_ATTR_FSL_PAMU_ENABLE iommu_attr.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c     | 47 ++---------------------------
>  drivers/iommu/fsl_pamu_domain.h     | 10 ------
>  drivers/soc/fsl/qbman/qman_portal.c | 11 -------
>  include/linux/iommu.h               |  1 -
>  4 files changed, 3 insertions(+), 66 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
