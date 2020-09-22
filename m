Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E9B275291
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112FF6E459;
	Wed, 23 Sep 2020 07:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426BF6E8BF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 16:26:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 88251299052
Date: Tue, 22 Sep 2020 12:25:57 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 0/3] drm: panfrost: Coherency support
Message-ID: <20200922162557.GA2406@kevin>
References: <cover.1600780574.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1600780574.git.robin.murphy@arm.com>
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: tomeu.vizoso@collabora.com, narmstrong@baylibre.com, khilman@baylibre.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, linux-amlogic@lists.infradead.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is:

	Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Tue, Sep 22, 2020 at 03:16:47PM +0100, Robin Murphy wrote:
> Hi all,
> 
> Here's a quick v2 with the tags so far picked up and some inline
> commentary about the shareability domains for the pagetable code.
> 
> Robin.
> 
> 
> Robin Murphy (3):
>   iommu/io-pgtable-arm: Support coherency for Mali LPAE
>   drm/panfrost: Support cache-coherent integrations
>   arm64: dts: meson: Describe G12b GPU as coherent
> 
>  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi |  4 ++++
>  drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c     |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_gem.c     |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_mmu.c     |  1 +
>  drivers/iommu/io-pgtable-arm.c              | 11 ++++++++++-
>  6 files changed, 20 insertions(+), 1 deletion(-)
> 
> -- 
> 2.28.0.dirty
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
