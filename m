Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B9A6C54B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 22:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6720D10E06F;
	Fri, 21 Mar 2025 21:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y6Pa/Peh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497D010E050
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 21:40:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6C1CFA494F8;
 Fri, 21 Mar 2025 21:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122D9C4CEE3;
 Fri, 21 Mar 2025 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742593201;
 bh=uG1o0DY+GJVVCupYP5Q6vsH9tFoXa2TJsrh44k6zKl8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y6Pa/PehUaF69lIIfMgtgZhuBTeyvNMIWT92RiOv5dVZSKXU+jFqtBf9E6rJ8p2eZ
 VK2tHeM47fDed0TspAIxRkFMHC3qzJV/O19mCSLqWibA7Ayn6AKJYm+v9TyE6Q9DxX
 Md7ncFFXRUHqEwbPU2bw7Lm4WKtxD5fONIv2QtD8rT6Z34WVFUbUh3RDlARxfHeW0p
 T/8Fg3xf/aINftiEEbJsxfRRSOH9E8ihKcnev16YmXley9Se3ROglb0LtM6zCJyEc0
 ZSUz1cUoNZFimmffdMfE9thBVfyOA75lw3ynW/BmiHyrRkfc4S1aF8uLgJftulcEKj
 jfmKyRwQ5ABZQ==
Date: Fri, 21 Mar 2025 16:40:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Steven Price <steven.price@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document
 Freescale i.MX95 GPU reset
Message-ID: <174259137507.3955133.798395163716870826.robh@kernel.org>
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321200625.132494-2-marex@denx.de>
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


On Fri, 21 Mar 2025 21:05:51 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Document support for this reset register.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Fix dt_binding_check errors in example, temporarily use fixed
>       numbers to refer to IMX95_CLK_GPUAPB clock and IMX95_PD_GPU
>       power-domain
>     - Drop trailing pipe after description:
>     - Drop leading dash before const in compatible:
>     - Switch from fsl, to nxp, vendor prefix
> ---
>  .../reset/nxp,imx95-gpu-blk-ctrl.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

