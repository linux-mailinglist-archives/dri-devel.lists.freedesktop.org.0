Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E4B38F03
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 01:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA43210E04C;
	Wed, 27 Aug 2025 23:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QtsKBq+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1EA10E04C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 23:18:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8FAC143BE7;
 Wed, 27 Aug 2025 23:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09407C4CEEB;
 Wed, 27 Aug 2025 23:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756336733;
 bh=P3Gwl+lAuDqgDiDkyAWigr2MsRQaffh+XaK4v35OqV8=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=QtsKBq+nK77vpdMFc6YGd0q5ra4VwIImjBUpJ0wanHju86ppAa4o2o8ZskSAHDAn5
 K/L4DUPu4hpuDj4Ej9tr8/J2HI2KwOuDSWO0mozMmhfJ86HxZjRKjtx7IxheFYDdCh
 VFbflN5sVkBAgdK/7Lz9xlBdpPvGdY6ztcOwLOp5kS+oqLt1wbXlISuwIqHKYulNnE
 ZLQSYDE/QA1MDIjmyFznQjlK8nPXGHkAgwi3hJ0ECfu+wORP9tezj3h3O27+M0SDZN
 e87vU25vIIWGsM18VZf8pDHLZxFVuJsa+asDFI9xpRYzYH+owC77b+Oc2mQgtkDhDW
 WbZuFrCywF33A==
Date: Wed, 27 Aug 2025 18:18:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>
To: Kisung Lee <kiisung.lee@samsung.com>
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
References: <CGME20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7@epcas2p2.samsung.com>
 <20250827044720.3751272-1-kiisung.lee@samsung.com>
Message-Id: <175633664976.3746763.8435177839932085825.robh@kernel.org>
Subject: Re: [PATCH 0/4] Add DT bindings and driver code for Scaler
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


On Wed, 27 Aug 2025 04:47:16 +0000, Kisung Lee wrote:
> This patch series adds device tree bindings and driver support
> for the ExynosAuto scaler hardware. It adds YAML binding docs,
> updates Kconfig and Makefile, and provides initial driver
> code to register the Scaler device as a V4L2 video node for
> video processing.
> 
> Kisung Lee (4):
>   dt-bindings: soc: samsung: scaler: exynos: Add ExynosAutov920
>     compatible
>   media: samsung: scaler: add scaler driver code
>   arm64: dts: exynosautov920: enable support for scaler device
>   media: samsung: scaler: Add Kconfig and Makefile
> 
>  .../bindings/gpu/samsung-scaler.yaml          |    1 +
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi |   22 +
>  drivers/media/platform/samsung/Kconfig        |    1 +
>  drivers/media/platform/samsung/Makefile       |    1 +
>  .../platform/samsung/v920-scaler/Kconfig      |   17 +
>  .../platform/samsung/v920-scaler/Makefile     |    9 +
>  .../samsung/v920-scaler/scaler-core.c         | 3640 +++++++++++++++++
>  .../samsung/v920-scaler/scaler-regs.c         |  744 ++++
>  .../samsung/v920-scaler/scaler-regs.h         |  406 ++
>  .../platform/samsung/v920-scaler/scaler.h     |  621 +++
>  .../v920-scaler/videodev2_exynos_media.h      |  162 +
>  11 files changed, 5624 insertions(+)
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/Kconfig
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/Makefile
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-core.c
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.c
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.h
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler.h
>  create mode 100644 drivers/media/platform/samsung/v920-scaler/videodev2_exynos_media.h
> 
> --
> 2.25.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250825 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250827044720.3751272-1-kiisung.lee@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: scaler@1A830000 (samsung,exynos5-scaler): 'mscl_ppc_table', 'mscl_qos_table' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpu/samsung-scaler.yaml#





