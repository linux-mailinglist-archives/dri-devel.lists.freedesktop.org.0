Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59E55AB9B3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 22:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DE010E8F7;
	Fri,  2 Sep 2022 20:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC0810E618
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 18:16:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EE4DB82CE6;
 Fri,  2 Sep 2022 18:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67757C433C1;
 Fri,  2 Sep 2022 18:16:04 +0000 (UTC)
Date: Fri, 2 Sep 2022 19:16:00 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/3] iommu/dma: Move public interfaces to linux/iommu.h
Message-ID: <YxJIYD8gjP7yAXb2@arm.com>
References: <cover.1660668998.git.robin.murphy@arm.com>
 <9cd99738f52094e6bed44bfee03fa4f288d20695.1660668998.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cd99738f52094e6bed44bfee03fa4f288d20695.1660668998.git.robin.murphy@arm.com>
X-Mailman-Approved-At: Fri, 02 Sep 2022 20:57:28 +0000
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
Cc: jean-philippe@linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 maz@kernel.org, joro@8bytes.org, cohuck@redhat.com, sw0312.kim@samsung.com,
 alex.williamson@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 kyungmin.park@samsung.com, tglx@linutronix.de, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 06:28:04PM +0100, Robin Murphy wrote:
> The iommu-dma layer is now mostly encapsulated by iommu_dma_ops, with
> only a couple more public interfaces left pertaining to MSI integration.
> Since these depend on the main IOMMU API header anyway, move their
> declarations there, taking the opportunity to update the half-baked
> comments to proper kerneldoc along the way.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Note that iommu_setup_dma_ops() should also become internal in a future
> phase of the great IOMMU API upheaval - for now as the last bit of true
> arch code glue I consider it more "necessarily exposed" than "public".
> 
>  arch/arm64/mm/dma-mapping.c       |  2 +-

And here:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
