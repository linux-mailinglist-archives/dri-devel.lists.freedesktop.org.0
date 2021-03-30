Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06C34E7CE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 14:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC0589F6B;
	Tue, 30 Mar 2021 12:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0541A6E8CD;
 Tue, 30 Mar 2021 12:48:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F1D46192C;
 Tue, 30 Mar 2021 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617108529;
 bh=CwVLHzAbIRGNmseGymZZt8ntYfUkMAx0Rqzxp8d9noQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pUD7C5DybyqHBKMsmQEivGH1hWwGa3N5OI6xd0qkt45xHAkRAjS5eAJuXzsJ2ZUeM
 1k8Lwt7u1XxXRUk+MdsVDvU1bcxY/2HJn97Ks1yj4DVG89JSTfQbMclWyrEVDHm0IO
 pEDTRRc99XbGsioMmRpeBMSqjSSQpm/HZwhe42CZnA6SwVo+4AtsPgEUQ1xNb2lmfl
 2FE8hJuJOxfsW78UaDpQTyuEZxpOndqdfZ+em1/Qt+6iZJJiqlsOtgOBqxNmZy8BZT
 14MeYEp9Teh87QbVXWBczJ7QWpGAx1XLwx0jiXFF/WOrHYVo4TBskmtFxafXnp9va5
 MiPidn4q2sDgg==
Date: Tue, 30 Mar 2021 13:48:43 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/18] iommu/fsl_pamu: merge handle_attach_device into
 fsl_pamu_attach_device
Message-ID: <20210330124843.GI5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-10-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:15PM +0100, Christoph Hellwig wrote:
> No good reason to split this functionality over two functions.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 59 +++++++++++----------------------
>  1 file changed, 20 insertions(+), 39 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
