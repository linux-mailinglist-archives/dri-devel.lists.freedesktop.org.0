Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01DBB39EEC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 15:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA5010E9AE;
	Thu, 28 Aug 2025 13:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TwweZqIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD6610E9AE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:30:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4000D434A7;
 Thu, 28 Aug 2025 13:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0467BC4CEEB;
 Thu, 28 Aug 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756387827;
 bh=Pp+mUIl9DaMYLcizWDp98QlTF7nc4qrOwFHsc6v7+TQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=TwweZqITjVRYZRGj/vPSwPYU+UtXXfCd7962Xofky57MrVDYEefi6ytNHNM/1pMAr
 gS91QN2ZgTy1WqjajoriR9lBkyVMZhy5B1qonweQHmhRxQJTCh4uINMC6WjdGy2h5G
 yuQqN1G1TpGQwjg6Rj1krDl1hHHMBncEzOzu20RzOJJoQHvzZam5AERan/IwNloBsJ
 DSORi/1S7rGER8QbPP7/KkrRLJ54G5t4n9iklDI9tLBfhW4nWkeMn0ShjrhvaIVM8t
 ZWKB+pjIT2PBGMkhZ984seK9kn+1q8MfFSousLJm5EvZYwt2Te0Yy1hpX/aCn9V/l6
 LSDmscGzpEqoA==
Date: Thu, 28 Aug 2025 08:30:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: xiandong.wang@mediatek.com, angelogioacchino.delregno@collabora.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, p.zabel@pengutronix.de, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, sunny.shen@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, singo.chang@mediatek.com, 
 linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org, 
 linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com, 
 jason-jh.lin@mediatek.com, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
 fshao@chromium.org, treapking@chromium.org
To: Paul Chen <paul-pl.chen@mediatek.com>
In-Reply-To: <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-4-paul-pl.chen@mediatek.com>
Message-Id: <175638709894.1370676.14730988453056252892.robh@kernel.org>
Subject: Re: [PATCH v4 03/19] dt-bindings: display: mediatek: add EXDMA
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


On Thu, 28 Aug 2025 16:06:58 +0800, Paul Chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediatek,exdma.yaml to support EXDMA for MT8196.
> The MediaTek display overlap extended DMA engine, namely
> OVL_EXDMA or EXDMA, primarily functions as a DMA engine
> for reading data from DRAM with various DRAM footprints
> and data formats.
> 
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250828080855.3502514-4-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

