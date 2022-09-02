Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2BC5AB9B2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 22:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B1810E400;
	Fri,  2 Sep 2022 20:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACAD10E618
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 18:15:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B04416222C;
 Fri,  2 Sep 2022 18:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B8EC433C1;
 Fri,  2 Sep 2022 18:15:21 +0000 (UTC)
Date: Fri, 2 Sep 2022 19:15:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] iommu/dma: Clean up Kconfig
Message-ID: <YxJINWLzESn/Rwhp@arm.com>
References: <cover.1660668998.git.robin.murphy@arm.com>
 <2e33c8bc2b1bb478157b7964bfed976cb7466139.1660668998.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e33c8bc2b1bb478157b7964bfed976cb7466139.1660668998.git.robin.murphy@arm.com>
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

On Tue, Aug 16, 2022 at 06:28:03PM +0100, Robin Murphy wrote:
> Although iommu-dma is a per-architecture chonce, that is currently
> implemented in a rather haphazard way. Selecting from the arch Kconfig
> was the original logical approach, but is complicated by having to
> manage dependencies; conversely, selecting from drivers ends up hiding
> the architecture dependency *too* well. Instead, let's just have it
> enable itself automatically when IOMMU API support is enabled for the
> relevant architectures. It can't get much clearer than that.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  arch/arm64/Kconfig          | 1 -

For this change:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
