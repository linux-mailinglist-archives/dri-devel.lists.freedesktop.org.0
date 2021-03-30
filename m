Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95CF34E7AF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 14:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB75D6E8C9;
	Tue, 30 Mar 2021 12:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308186E8C4;
 Tue, 30 Mar 2021 12:44:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94D82619A7;
 Tue, 30 Mar 2021 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617108264;
 bh=Cgba8HldB3p1zZnOmguZN9H7CCw3hn4+e9TzO2/HTCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XqjgVkeihtvV0muU9cRH6UOfyOCOIad3+p70dAR0KpfjquoAv9Udl7usitJx6k+BL
 QjydYcgHavFRbcWpgbvPPrWkiV/HoPSK0Y5Al7Wgn8qeEE7Dz7897ny039C66QZuRc
 Aj/mq1osuVlfi5bYrw8gZ7w0/xKHRj1it7sjuQIQuPs/7Lf2GPQHSGtch0QCHfcRhH
 54sfzj/rL7F2gyyuPDAkX+EUBI3YuPHKKPDrOQzuj0iQ59qI4wMM4uxguudNDIGvnN
 U1eVEzquLKFCOh3sFFHAV1h8ykTy7BSJi3dHezZk9HYl0EguBcQW/0R42/h/WW3C0M
 1/q4jESgaIcAw==
Date: Tue, 30 Mar 2021 13:44:18 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/18] iommu/fsl_pamu: replace DOMAIN_ATTR_FSL_PAMU_STASH
 with a direct call
Message-ID: <20210330124418.GG5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-8-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:13PM +0100, Christoph Hellwig wrote:
> Add a fsl_pamu_configure_l1_stash API that qman_portal can call directly
> instead of indirecting through the iommu attr API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  arch/powerpc/include/asm/fsl_pamu_stash.h | 12 +++---------
>  drivers/iommu/fsl_pamu_domain.c           | 16 +++-------------
>  drivers/iommu/fsl_pamu_domain.h           |  2 --
>  drivers/soc/fsl/qbman/qman_portal.c       | 18 +++---------------
>  include/linux/iommu.h                     |  1 -
>  5 files changed, 9 insertions(+), 40 deletions(-)

Heh, this thing is so over-engineered.

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
