Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762A9AB8441
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 12:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2F110E82F;
	Thu, 15 May 2025 10:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u7DeagEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71F110E82F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 10:48:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 557895C55AC;
 Thu, 15 May 2025 10:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2176DC4CEE7;
 Thu, 15 May 2025 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747306112;
 bh=adxalg7H3lV44b62vZBcg+BCmQflj5misd5wybzAhrk=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=u7DeagEUEiexQGncuTRbIUiVohH0r9Yv/kmqm+EZaKWZsCoK4Cfh43a3y4gqdXWtx
 lG6aDJSr5GlY/zwP4+xtCu2IF3yYaRcpqqFQ7pEP2YbEMl9tafTCc3Wbg1T3ZetDx+
 S7Dr07ViBTwbdcoPp3xMI+BYPcipOz9cYhdVQzdlCZycbA4WVjGWgZVPctUru/smxt
 rsHP4HksXSkcOoNoA5LazlUNOsY+b/bD3A1t5cctBTq/wTVSXxaS4xITr1QLGQBs+v
 cD7aJmx+dm7h97l6Jlh/aeIifn55CJmfS8E2QMtqOB7wrnd21eRq0VP1ZOklrxxBgr
 4Vy7hhIETPFYw==
Date: Thu, 15 May 2025 05:48:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: fshao@chromium.org, devicetree@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 xiandong.wang@mediatek.com, krzk+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, nancy.lin@mediatek.com, 
 linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com, 
 singo.chang@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 p.zabel@pengutronix.de, treapking@chromium.org, jason-jh.lin@mediatek.com, 
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, conor+dt@kernel.org, 
 chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, 
 sunny.shen@mediatek.com
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250515093454.1729720-3-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-3-paul-pl.chen@mediatek.com>
Message-Id: <174730611044.164934.18396756831118218280.robh@kernel.org>
Subject: Re: [PATCH v3 02/17] dt-bindings: display: mediatek: add EXDMA
 yaml for MT8196
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


On Thu, 15 May 2025 17:34:14 +0800, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> The MediaTek display overlap extended DMA engine, namely
> OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> for reading data from DRAM with various DRAM footprints
> and data formats.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/mediatek,exdma.example.dtb: dma-controller@32850000 (mediatek,mt8196-exdma): 'mediatek,larb' is a required property
	from schema $id: http://devicetree.org/schemas/dma/mediatek,exdma.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250515093454.1729720-3-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

