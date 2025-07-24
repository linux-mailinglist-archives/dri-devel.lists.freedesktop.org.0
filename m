Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE80B108FE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 13:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2363F10E936;
	Thu, 24 Jul 2025 11:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gtcIHEg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B0B10E934
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:19:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1139D613F7;
 Thu, 24 Jul 2025 11:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBABC4AF0B;
 Thu, 24 Jul 2025 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753355974;
 bh=xr9UfPrtsc/ykSfE3EhQN0BAiqLo6Aci+RNDYoh3hig=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=gtcIHEg+ph2IJp1WJwEVEk3R4hb7SfpYBo9kg5zwfeF9fN/WnQ/3g4N5KdsEraUxJ
 a4kPxnUb6bid5gAmKGKCF0eNsTLWvajd+kYVB4502wn7qiMsf11sjF4R9lpE6mCSR+
 P67vfBvqBl1xbYZsCu2vX1bxZGrZ52K4QMWbuo9F9vjdiw2jK+i6++M5BfJ5MP73Hc
 6kOllnuqTh9sjsC7d3K1OIsNLehSe8QcLzIASlA5D65JUPFShxhMhZJ0esq5Y2XylZ
 Kw+y5W5Hc6gxWxuEybtqyQNpcVHYHK+xTxB5pnUfeY2DDLHt8hF0/MdFi4v5IQxVVo
 BR6VL794/V8cg==
Date: Thu, 24 Jul 2025 06:19:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org, 
 olivia.wen@mediatek.com, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, andy.teng@mediatek.com, 
 eugen.hristev@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, frank-w@public-files.de, 
 linux-phy@lists.infradead.org, mripard@kernel.org, atenart@kernel.org, 
 sean.wang@kernel.org, ck.hu@mediatek.com, fparent@baylibre.com, 
 granquet@baylibre.com, p.zabel@pengutronix.de, simona@ffwll.ch, 
 tglx@linutronix.de, dri-devel@lists.freedesktop.org, 
 linux-gpio@vger.kernel.org, chunkuang.hu@kernel.org, 
 linux-crypto@vger.kernel.org, vkoul@kernel.org, 
 maarten.lankhorst@linux.intel.com, andersson@kernel.org, 
 linux-arm-kernel@lists.infradead.org, shane.chien@mediatek.com, 
 davem@davemloft.net, herbert@gondor.apana.org.au, broonie@kernel.org, 
 houlong.wei@mediatek.com, mathieu.poirier@linaro.org, 
 linus.walleij@linaro.org, conor+dt@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, daniel.lezcano@linaro.org, 
 mchehab@kernel.org, tzimmermann@suse.de, chunfeng.yun@mediatek.com, 
 mwalle@kernel.org, jiaxin.yu@mediatek.com, airlied@gmail.com, 
 jassisinghbrar@gmail.com, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 kishon@kernel.org, arnd@arndb.de, linux-media@vger.kernel.org, 
 jieyy.yang@mediatek.com, lgirdwood@gmail.com, sam.shih@mediatek.com, 
 jitao.shi@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-14-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-14-angelogioacchino.delregno@collabora.com>
Message-Id: <175335597061.1587930.6517956701582557579.robh@kernel.org>
Subject: Re: [PATCH 13/38] dt-bindings: remoteproc: mediatek: Remove l1tcm
 MMIO from MT8188 dual
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


On Thu, 24 Jul 2025 10:38:49 +0200, AngeloGioacchino Del Regno wrote:
> Even though the MT8188 SoC's Dual-Core SCP IP is practically the
> same as the one found on MT8195, it doesn't have a dedicated L1
> TCM and relies only on SRAM.
> 
> Set reg/reg-names minItems to 1 globally and override it in all of
> the conditionals for the SoCs that require more, and then split
> the mt8195/8188 conditionals to allow specifying only the cfg MMIO
> on MT8188.
> 
> Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml: allOf:1:then:properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'sram'}, {'const': 'cfg'}] is too long
	[{'const': 'sram'}, {'const': 'cfg'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml: allOf:3:then:properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'cfg'}] is too short
	False schema does not allow 1
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml: allOf:4:then:properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'cfg'}, {'const': 'l1tcm'}] is too long
	[{'const': 'cfg'}, {'const': 'l1tcm'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-14-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

