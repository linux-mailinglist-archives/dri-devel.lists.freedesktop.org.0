Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60FD34E729
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 14:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514436E8B8;
	Tue, 30 Mar 2021 12:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D23F6E8B8;
 Tue, 30 Mar 2021 12:10:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB48A61989;
 Tue, 30 Mar 2021 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617106256;
 bh=x9ekBX8ubp5TbQCSOWJz4iBqTKfUoj1TbGKvNKFHBCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6AwhAf1QgHJ9X1lDR7o2HkHOdHkt3V8vAvvWfz2AHqpyY2l/Fep/z6lg9kDQbauC
 4y1XZlSQfHxkf5nJp7n5VKoSDsRpRIvd7Q6K6T95XjE1o61jNca8OXezTBC5axyzuh
 IT3g9JXwM1vLMOLl3yOYj0aMGjfEXTlmIQtAF1IbGF0fPyxLKJtpZY5UsEQWkilqqL
 SGdhmOricP9XMO5hJycrVsxTgSV8ERQtWAgJsZ1LV7210oSFaZQl7d6atPYq+EP12r
 93GDdaLCudVDSgkEgkxYlhKl24qbesurPj6XXgDMZa+OVe889sGvMT7cy4P/XVi4Mb
 eXvJGcyvHpaGw==
Date: Tue, 30 Mar 2021 13:10:50 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/18] iommu/fsl_pamu: remove fsl_pamu_get_domain_attr
Message-ID: <20210330121050.GB5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-3-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:08PM +0100, Christoph Hellwig wrote:
> None of the values returned by this function are ever queried.  Also
> remove the DOMAIN_ATTR_FSL_PAMUV1 enum value that is not otherwise used.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 30 ------------------------------
>  include/linux/iommu.h           |  4 ----
>  2 files changed, 34 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
