Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AD19F57D7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 21:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9587910E168;
	Tue, 17 Dec 2024 20:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kirq7Q2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6DB10E168
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 20:36:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81E7FA40B0B;
 Tue, 17 Dec 2024 20:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871DEC4CED3;
 Tue, 17 Dec 2024 20:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734467758;
 bh=SZGp4CTjOcCd0WqvLX/C50ngjabrzlSD0TRHgdbC4BE=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=kirq7Q2LQQV5FEB/0mqwL3QNWxPg7bH1f2k3Ek3ba/2d/H3SX/cfJH2oAP2ou8IhT
 xO1LjRCc8CNQvlQMLtV/Vad2wYLQ4mskd+a8z+YrJ+SG7tJfs3vtyvnMJJ+RbhJQqU
 aI3JOiN7Y7as2Izf1VzA1xn/noqhxMTAQ1SK6A7dZzHKRDg8foTzsPv7meNZlEEXY4
 Hla0/QiSB+/dWJWBEW9eL2NYgcJvgypIQrrWJepWaME9j1v+VEw3Uc9Cfoyr72GIm1
 YHzs9lRzlfiqkk4/wZo0lhlJ5j+Nh1JDjctClGWKbiEk5bgZfy7x9LSvBor3fac9qL
 cdWJb/0fXU0fw==
Date: Tue, 17 Dec 2024 14:35:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 tzimmermann@suse.de, mripard@kernel.org, junzhi.zhao@mediatek.com, 
 simona@ffwll.ch, p.zabel@pengutronix.de, airlied@gmail.com, 
 linux-mediatek@lists.infradead.org, maarten.lankhorst@linux.intel.com, 
 matthias.bgg@gmail.com, kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 jie.qiu@mediatek.com, ck.hu@mediatek.com, krzk+dt@kernel.org, 
 chunkuang.hu@kernel.org, dri-devel@lists.freedesktop.org, 
 jitao.shi@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
Message-Id: <173446775715.3082463.16696683643191966577.robh@kernel.org>
Subject: Re: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding
 for MT8195 HDMI-TX v2
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


On Tue, 17 Dec 2024 16:43:19 +0100, AngeloGioacchino Del Regno wrote:
> Add a binding for the HDMI TX v2 Encoder found in MediaTek MT8195
> and MT8188 SoCs.
> 
> This fully supports the HDMI Specification 2.0b, hence it provides
> support for 3D-HDMI, Polarity inversion, up to 16 bits Deep Color,
> color spaces including RGB444, YCBCR420/422/444 (ITU601/ITU709) and
> xvYCC, with output resolutions up to 3840x2160p@60Hz.
> 
> Moreover, it also supports HDCP 1.4 and 2.3, Variable Refresh Rate
> (VRR) and Consumer Electronics Control (CEC).
> 
> This IP also includes support for HDMI Audio, including IEC60958
> and IEC61937 SPDIF, 8-channel PCM, DSD, and other lossless audio
> according to HDMI 2.0.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi.yaml        | 154 ++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dtb: hdmi-tx@1c300000: i2c: False schema does not allow {'compatible': ['mediatek,mt8195-hdmi-ddc'], 'clocks': [[4294967295]]}
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dtb: hdmi-tx@1c300000: i2c: Unevaluated properties are not allowed ('clocks', 'compatible' were unexpected)
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dtb: /example-0/soc/hdmi-tx@1c300000/i2c: failed to match any schema with compatible: ['mediatek,mt8195-hdmi-ddc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241217154345.276919-8-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

