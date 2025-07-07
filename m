Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3690AFA9C8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 04:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD6010E3F0;
	Mon,  7 Jul 2025 02:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="duwN0/KF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6230810E3EE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 02:46:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3DC5A5C4A69;
 Mon,  7 Jul 2025 02:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48BFC4CEF2;
 Mon,  7 Jul 2025 02:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751856374;
 bh=Z7aWQ9So+xlnwsCVx6yoE8yP6pTBwpth7HMkM+BK+Ww=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=duwN0/KF3JGook/rqYvpM9WAyxMITcPajCXLEbnDnS/H4ai9ZNyB3CL6MBprotE/A
 mGdxbUmAJ5AdCb2WjxyhoaXgftyZgmKgaKf5gb1ChzigNCjt0OGcW5kL4F2GnN/2ci
 iMTbFft5sb2UWSpE+iP0Shu+LIpZDA+c1oVb3HyhKbE1IiJR8AxCSAfgVsTcNDWtPW
 Wj0wV4vvxpR/TOTBQbuKoulRVx/EKSkKH9aDgHPhcRZC10TV2BX02QXSXcm2A1scEu
 fLZ0ecOQ2OgLP5pnCl82BUsfDyd1GV6fWCUZYW8yXJOTVCdbtBWhxXHLnUbn8sBY3R
 ub+My+dtipybg==
Date: Sun, 06 Jul 2025 21:46:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linaro-mm-sig@lists.linaro.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: shangyao lin <shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-5-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-5-shangyao.lin@mediatek.com>
Message-Id: <175185636950.997517.4974488495469369107.robh@kernel.org>
Subject: Re: [PATCH v2 04/13] dt-bindings: media: mediatek: add cam-yuv binding
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


On Mon, 07 Jul 2025 09:31:45 +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-yuv.yaml
>   - Various fixes per review comments
>   - Update maintainers list
> 
> Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
> ---
>  .../mediatek/mediatek,mt8188-cam-yuv.yaml     | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml: properties:reg-names: {'items': [{'const': 'base'}, {'const': 'inner_base'}], 'minItems': 1, 'maxItems': 2, 'description': 'Names for each register region. Must be "base" and optionally "inner_base".'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml: properties:clock-names: {'items': [{'const': 'camsys_cam2mm0_cgpdn'}, {'const': 'camsys_cam2mm1_cgpdn'}, {'const': 'camsys_cam2sys_cgpdn'}, {'const': 'camsys_yuva_larbx'}, {'const': 'camsys_yuva_cam_cgpdn'}, {'const': 'camsys_yuva_camtg_cgpdn'}, {'const': 'camsys_yuvb_larbx_cgpdn'}, {'const': 'camsys_yuvb_cam_cgpdn'}, {'const': 'camsys_yuvb_camtg_cgpdn'}], 'minItems': 4, 'maxItems': 16, 'description': 'Names of the clocks, must match the order of the clocks property.'} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-yuv.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dts:33.13-43: Warning (reg_format): /example-0/soc/yuv@16050000:reg: property has invalid length (16 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dts:37.13-59: Warning (dma_ranges_format): /example-0/soc/yuv@16050000:dma-ranges: "dma-ranges" property has invalid length (24 bytes) (parent #address-cells == 2, child #address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dts:31.24-58.13: Warning (avoid_default_addr_size): /example-0/soc/yuv@16050000: Relying on default #address-cells value
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dts:31.24-58.13: Warning (avoid_default_addr_size): /example-0/soc/yuv@16050000: Relying on default #size-cells value
Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: yuv@16050000 (mediatek,mt8188-cam-yuv): clock-names:3: 'camsys_yuva_larbx' was expected
	from schema $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-yuv.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.example.dtb: yuv@16050000 (mediatek,mt8188-cam-yuv): dma-ranges: [[2], [0], [0], [1073741824], [1], [0]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-yuv.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250707013154.4055874-5-shangyao.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

