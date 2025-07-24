Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31179B108F5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 13:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277C10E931;
	Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CStr8z/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6ED210E930
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:19:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E49685C6664;
 Thu, 24 Jul 2025 11:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BD5C4CEEF;
 Thu, 24 Jul 2025 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753355971;
 bh=s3ZnbItH7r6cLHTy+VwbS1Kg3RPe/mzeNlY5FzZW73M=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=CStr8z/rOsij9S3z3BJm9fHa9iakjiAXVR9PdOK5taBZURJfAPAAkHbj0KuQviY7p
 KiL6Uvucdwz8LxwOWz7lwhX5I2qtRnTp09/USJTZHE24W+o2XT/5ls0Mo+DqJ/EQGy
 4vOkkwAzobpebJvh+VgDfNRDeqyhbjww7Rd7PHdXbcy0KDnMtuIOIRC83Uv6MAlwmL
 VYSko7BVS+mI+5gLRGV68wZS0TlpY3UDdnSSzeclWayt2BApahaiftZuAN6c9obWp0
 2tUwExST1V+igIM59xAHMg7CBzYem4LQ8BDzMMNqgOtJqDmA0vvctgoZdBWhL20O8G
 xRs89hLXeFgbA==
Date: Thu, 24 Jul 2025 06:19:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: frank-w@public-files.de, herbert@gondor.apana.org.au, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 linux-phy@lists.infradead.org, krzk+dt@kernel.org, eugen.hristev@linaro.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 jiaxin.yu@mediatek.com, jitao.shi@mediatek.com, daniel.lezcano@linaro.org, 
 linux-remoteproc@vger.kernel.org, granquet@baylibre.com, 
 lgirdwood@gmail.com, linux-crypto@vger.kernel.org, 
 tinghan.shen@mediatek.com, mwalle@kernel.org, sam.shih@mediatek.com, 
 sean.wang@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, 
 vkoul@kernel.org, mripard@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, olivia.wen@mediatek.com, 
 dri-devel@lists.freedesktop.org, atenart@kernel.org, arnd@arndb.de, 
 conor+dt@kernel.org, shane.chien@mediatek.com, houlong.wei@mediatek.com, 
 devicetree@vger.kernel.org, kishon@kernel.org, fparent@baylibre.com, 
 airlied@gmail.com, tglx@linutronix.de, linux-sound@vger.kernel.org, 
 broonie@kernel.org, andy.teng@mediatek.com, jieyy.yang@mediatek.com, 
 mathieu.poirier@linaro.org, chunfeng.yun@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, 
 linux-media@vger.kernel.org, davem@davemloft.net, simona@ffwll.ch, 
 linus.walleij@linaro.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
 andersson@kernel.org, linux-mediatek@lists.infradead.org, 
 mchehab@kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
Message-Id: <175335596838.1587473.6783798436849190740.robh@kernel.org>
Subject: Re: [PATCH 04/38] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks
 and clock-names
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


On Thu, 24 Jul 2025 10:38:40 +0200, AngeloGioacchino Del Regno wrote:
> Both clocks and clock-names are missing (a lot of) entries: add
> all the used audio clocks and their description and also fix the
> example node.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 106 +++++++++++++++++-
>  1 file changed, 104 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clock-names:3: 'aud_adc_clk' was expected
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clock-names:4: 'aud_adda6_adc_clk' was expected
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_clk', 'aud_infra_clk', 'aud_infra_26m_clk'] is too short
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dtb: mt8192-afe-pcm (mediatek,mt8192-audio): clocks: [[4294967295, 0], [4294967295, 7], [4294967295, 8], [4294967295, 47], [4294967295, 58]] is too short
	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-5-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

