Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F4534E817
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 14:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DB56E8D0;
	Tue, 30 Mar 2021 12:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FBB89FC5;
 Tue, 30 Mar 2021 12:58:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57D72619BC;
 Tue, 30 Mar 2021 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109102;
 bh=5U0XNBMr1VJpT/QJQ4fWikCzjX4441gkw/Sdm3D+wWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWN42kSzKc2/IQeLw9I9cnky9VKE8OZrRaxIp7imnahbv7MAIlCPAQOEf/2y5NMu8
 vScKgy/fFSn0Fhoux7qMTY9sZe6WF6VjaMVEZkplEDgA2afh3x+8zYKKjzvGPJlt06
 TgRQsOK9uVedQAZ/Jp8IqZ6ws7Nvou7AeWe16C/mwxZuyO+gjDcTWK3EQ4Q5CObwBj
 VbEcwCuxV+jbp7XKHFFopVyoBz4U9/TzMTSXuOeSy23hSGo2eadFh3veqGUn4ZV7xt
 6x9TFJiXvd7XE2fRBfyVs8VtDECvjUN4E+dczmX3kEuavFttoE7YeIPf2oxaLtcDm7
 ZIQdoQHPZqTlA==
Date: Tue, 30 Mar 2021 13:58:17 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/18] iommu/fsl_pamu: remove the snoop_id field
Message-ID: <20210330125816.GK5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-12-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:17PM +0100, Christoph Hellwig wrote:
> The snoop_id is always set to ~(u32)0.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 5 ++---
>  drivers/iommu/fsl_pamu_domain.h | 1 -
>  2 files changed, 2 insertions(+), 4 deletions(-)

pamu_config_ppaace() takes quite a few useless parameters at this stage,
but anyway:

Acked-by: Will Deacon <will@kernel.org>

Do you know if this driver is actually useful? Once the complexity has been
stripped back, the stubs and default values really stand out.

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
