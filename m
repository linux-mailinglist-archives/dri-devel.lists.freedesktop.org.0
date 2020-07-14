Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF7721EB43
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 10:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E654A6E105;
	Tue, 14 Jul 2020 08:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43076E105
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:26:58 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C99E21835;
 Tue, 14 Jul 2020 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594715218;
 bh=rkHskXC0fiwa6QUMtcIea2p7i/6OpQKyeZInBl3W1JQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lcclkXtI6xPp5/1tsah+tsY4T4lVY3Dinfx5gzN3lmgiev/hCZ9q8C3ykXyXyNw+D
 rZKK1DCidNuCplg0/JzhvaiYgJidPKjCuFRlTALJMHMrGfZ20EivrOEkbCKuv3CieV
 SLO6dVBOWw7JYumLD1zzF9sVCOTiq10Z7ma3wZ9g=
Date: Tue, 14 Jul 2020 09:26:52 +0100
From: Will Deacon <will@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 1/2] iommu: Mark __iommu_map/__iommu_map_sg as static
Message-ID: <20200714082652.GB4516@willie-the-truck>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <ab722e9970739929738066777b8ee7930e32abd5.1591930156.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab722e9970739929738066777b8ee7930e32abd5.1591930156.git.baolin.wang@linux.alibaba.com>
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
Cc: linux-kernel@vger.kernel.org, tomeu.vizoso@collabora.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, joro@8bytes.org,
 iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, baolin.wang7@gmail.com, agross@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 matthias.bgg@gmail.com, steven.price@arm.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 11:39:54AM +0800, Baolin Wang wrote:
> Now the __iommu_map() and __iommu_map_sg() are used only in iommu.c
> file, so mark them as static.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  drivers/iommu/iommu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

(I'm assuming Joerg will pick this up for 5.9)

Thanks,

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
