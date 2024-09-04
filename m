Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECB796C227
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 17:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A5A10E7EB;
	Wed,  4 Sep 2024 15:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MPGc50lb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430CE10E7EB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 15:23:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BA035C57FA;
 Wed,  4 Sep 2024 15:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15488C4CEC6;
 Wed,  4 Sep 2024 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725463400;
 bh=Ne0Xbs1PRSEcuAHWf/+aKg9PM3rr774/phdtOfelanY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MPGc50lbURIexu4LjzS5ScZmPKBr0zLGkSAC1kGc0qcyqdU90gn8cwyd1J9AjQxuA
 QEikGsRpZlNEi4xB/FsolnUcMtoLg8cfK0pI0BF02gav+GanuvP7x+YHTT2KagnMnW
 Yr0M1OTF6oYj+rgt7sV3FHhPuwMNGciqecDtZ3zrOcuyqIlti3Me+aEdQJv/qcU5qx
 Ezz5c9Tb53xCu/YGjlLaLTsmTT5sFdb3OzRQoewFA8YarJL5EuU323nkZQmsIcGI1K
 iqVOOc4UzNnR61N0iWouZztYd9UnuIKI5xlwJsk2w/hM4FFxRBfFkasAZE9rG31YKp
 6RhH5WVSgoexQ==
Date: Wed, 4 Sep 2024 10:23:19 -0500
From: Rob Herring <robh@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, knoxchiou@google.com,
 hsinyi@google.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Message-ID: <20240904152319.GA2600949-robh@kernel.org>
References: <20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com>
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

On Wed, Sep 04, 2024 at 04:14:59PM +0800, Jianeng Ceng wrote:
> This is v3 of the MT8186 Chromebook device tree series.
> ---
> Changes in v3:
> - PATCH 0/2: Add the modify records.
> - PATCH 1/2: Modify lable to label.
> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v2:
> - PATCH 2/2: Modify the dtb name without rev2.
> - Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Jianeng Ceng (2):
>   dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
>   arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
> 
>  .../devicetree/bindings/arm/mediatek.yaml     | 11 +++++
>  arch/arm64/boot/dts/mediatek/Makefile         |  2 +
>  .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 24 ++++++++++
>  .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
>  .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
>  5 files changed, 108 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

Something is wrong in the threading of your series.

Rob
