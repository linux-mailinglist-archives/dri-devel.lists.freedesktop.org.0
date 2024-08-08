Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1090594B862
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 09:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB54E10E687;
	Thu,  8 Aug 2024 07:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gT9XD+Dt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C9010E687
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 07:59:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BA09614FC;
 Thu,  8 Aug 2024 07:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619B1C32782;
 Thu,  8 Aug 2024 07:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723103959;
 bh=gWg/r/1SvXDtl8mHhSTr6bVgnFi9se9px6nxtby4afo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gT9XD+DtkP2sOGMCsCMBMBcBc2edggYdxMyfaVr2HosFjVU+PB2Z7x/+FLZ90NvwW
 ZMa1th8LDVyiZiR7PyoYOdB7F3swfuRUlwbCjKo/hW8e8YGlwaE87mV7bwAdleV8Qr
 0+yYXVZzA12yJAmlgqMsMg2mmR1UBVI3bMlFLox8ruXSCymBXcYTh1w1h40Tz9Moz9
 Pu5H2OmErH1JmiHa3PL9bLSKd6c4goEzlEsYtBtIqVhaQ8L6258Sv+gfNKo/SEFudW
 g4SdnfX7HA4EHUG5JIjknF/SD7oNj365o30yZ6PONVw86hVIZZl7f+kHnDMfFyGgCO
 hJVMJtMo1jDOw==
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rdma@vger.kernel.org, Michael Margolin <mrgolin@amazon.com>, 
 Mustafa Ismail <mustafa.ismail@intel.com>, netdev@vger.kernel.org, 
 Saeed Mahameed <saeedm@nvidia.com>, 
 Selvin Xavier <selvin.xavier@broadcom.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Tariq Toukan <tariqt@nvidia.com>, 
 Tatyana Nikolova <tatyana.e.nikolova@intel.com>, 
 Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>
In-Reply-To: <cover.1722512548.git.leon@kernel.org>
References: <cover.1722512548.git.leon@kernel.org>
Subject: Re: (subset) [PATCH rdma-next 0/8] Introducing Multi-Path DMA
 Support for mlx5 RDMA Driver
Message-Id: <172310395487.1779734.12051360068889087637.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 10:59:14 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
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


On Thu, 01 Aug 2024 15:05:09 +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> From Yishai,
> 
> Overview
> --------
> This patch series aims to enable multi-path DMA support, allowing an
> mlx5 RDMA device to issue DMA commands through multiple paths. This
> feature is critical for improving performance and reaching line rate
> in certain environments where issuing PCI transactions over one path
> may be significantly faster than over another. These differences can
> arise from various PCI generations in the system or the specific system
> topology.
> 
> [...]

Applied, thanks!

[2/8] RDMA/mlx5: Introduce the 'data direct' driver
      https://git.kernel.org/rdma/rdma/c/281658bd04e7b9
[3/8] RDMA/mlx5: Add the initialization flow to utilize the 'data direct' device
      https://git.kernel.org/rdma/rdma/c/302b01afc28b1e
[4/8] RDMA/umem: Add support for creating pinned DMABUF umem with a given dma device
      https://git.kernel.org/rdma/rdma/c/b047ecbd7672d2
[5/8] RDMA/umem: Introduce an option to revoke DMABUF umem
      https://git.kernel.org/rdma/rdma/c/bc9be75e01373c
[6/8] RDMA: Pass uverbs_attr_bundle as part of '.reg_user_mr_dmabuf' API
      https://git.kernel.org/rdma/rdma/c/83f44068da564d
[7/8] RDMA/mlx5: Add support for DMABUF MR registrations with Data-direct
      https://git.kernel.org/rdma/rdma/c/19ae08911f8be1
[8/8] RDMA/mlx5: Introduce GET_DATA_DIRECT_SYSFS_PATH ioctl
      https://git.kernel.org/rdma/rdma/c/d222b19c595f63

Best regards,
-- 
Leon Romanovsky <leon@kernel.org>

