Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7D5C0FEE4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B2110E547;
	Mon, 27 Oct 2025 18:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hcOw3B6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5291310E547
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:34:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 13EB344244;
 Mon, 27 Oct 2025 18:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32138C4CEF1;
 Mon, 27 Oct 2025 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761590053;
 bh=Sjtta4buWzcQQnNBIyYVFESl5qf6B112yZ9sf+V7RlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hcOw3B6lf9oxjJTjftncCDpwlUt2yrNGODV2N6B9UbzbWoYuWLIIfAJG8fGn55XDq
 XxUqYjtDesWP4JGFiTebJN74VNQk47kNcrSgL7ZZyJ/Sn7cSlbbA+DWgHdWwl2FqvO
 9g1wV05Ym5OBWOMFiBvPtcJR93d4W0mNeQICsbkJWSfiMqtdDVdiV4jyxaCikFVZaH
 3AxJFgdThBjGR/8FqQQ0rtNTgOvWDxvwbxQ4cG3ovGFkgePgBdOOz7bE7QPfcSMVtv
 P9fYGH8FzU3VGwM2da/CvNJk33SuLt54GCoggM9zF/1TuZbaXMwOZWTVwGGFeYClrD
 V42LSpx3BFjug==
Date: Mon, 27 Oct 2025 20:34:09 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
 patches@lists.linux.dev, Simona Vetter <simona.vetter@ffwll.ch>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH 0/8] Initial DMABUF support for iommufd
Message-ID: <20251027183409.GO12554@unreal>
References: <0-v1-64bed2430cdb+31b-iommufd_dmabuf_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-64bed2430cdb+31b-iommufd_dmabuf_jgg@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 27, 2025 at 02:30:59PM -0300, Jason Gunthorpe wrote:
> This series is the start of adding full DMABUF support to
> iommufd. Currently it is limited to only work with VFIO's DMABUF exporter.
> It sits on top of Leon's series to add a DMABUF exporter to VFIO:
> 
>   https://lore.kernel.org/all/cover.1760368250.git.leon@kernel.org/

<...>

> This is on github: https://github.com/jgunthorpe/linux/commits/iommufd_dmabuf
> 
> The branch has various modifications to Leon's series I've suggested.

I'm working on v6 these days.

Thanks
