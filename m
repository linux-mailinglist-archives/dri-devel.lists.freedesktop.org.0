Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89201B31DCF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFAD10EB4F;
	Fri, 22 Aug 2025 15:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lcdvgiT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10BA10EB4F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 15:14:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C32D15C6EDA;
 Fri, 22 Aug 2025 15:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AE3C4CEED;
 Fri, 22 Aug 2025 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755875656;
 bh=LonE3rEgRMxIVsYfDjiHDPQfYMJ4W3TyT5tCihgHym0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lcdvgiT329HDpoh0VCPKjLOr0moxcH5cK28AAxLH4+gdXwe82hWMy5dQXf+hxi+SJ
 e5skJ6Ap3UNK0hxPe/1QnheFWVpdsPDuOEyu/CscLYWgU30HdVoKiMx0zfj5Wy/CwO
 cSBIRzhdLMkd6X6u2lLgcYTDtvl9pespreueOrlccrxtDtXBmjc4D3yOKhl7LjVwQ5
 WRahCkYy+4d50YdUNM+F8DB4LPVIQUwhjRHIh6Ac0h1fO7vCZVT1jWiRh9yW8JCFOw
 AZM9juQBSX/GvY2Z50e0J5uHQ1wlVf5cHwNZOkZXtCySwR9zTYxtOWABXBHT5B2nDf
 L8Yg2tntKVzEQ==
Date: Fri, 22 Aug 2025 10:14:15 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
 simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de,
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v1 05/14] sound: dt-bindings: Convert MediaTek RT5650
 codecs bindings to YAML
Message-ID: <20250822151415.GA3819434-robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-6-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-6-ariel.dalessandro@collabora.com>
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

On Wed, Aug 20, 2025 at 02:12:53PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
> codecs to a YAML schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
>  .../bindings/sound/mt8173-rt5650.txt          | 31 --------
>  2 files changed, 73 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
> new file mode 100644
> index 0000000000000..36e4f9c4c3d62
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8173 with RT5650 codecs and HDMI via I2S
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +properties:
> +  compatible:
> +    const: "mediatek,mt8173-rt5650"

Drop quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mediatek,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      The phandles of rt5650 codecs and of the HDMI encoder node.
> +    minItems: 2
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of MT8173 ASoC platform.
> +
> +  mediatek,mclk:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The MCLK source.
> +      0: external oscillator, MCLK = 12.288M
> +      1: internal source from mt8173, MCLK = sampling rate * 256
> +
> +  codec-capture:
> +    description: Subnode of rt5650 codec capture.
> +    type: object
> +
> +    properties:
> +      sound-dai:
> +        maxItems: 1
> +        description: phandle of the CPU DAI
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,audio-codec
> +  - mediatek,platform
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound: sound {

Drop unused label.

> +        compatible = "mediatek,mt8173-rt5650";
> +        mediatek,audio-codec = <&rt5650 &hdmi0>;
> +        mediatek,platform = <&afe>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&aud_i2s2>;
> +
> +        mediatek,mclk = <1>;
> +        codec-capture {
> +            sound-dai = <&rt5650 1>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> deleted file mode 100644
> index 29dce2ac8773a..0000000000000
> --- a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -MT8173 with RT5650 CODECS and HDMI via I2S
> -
> -Required properties:
> -- compatible : "mediatek,mt8173-rt5650"
> -- mediatek,audio-codec: the phandles of rt5650 codecs
> -                        and of the hdmi encoder node
> -- mediatek,platform: the phandle of MT8173 ASoC platform
> -
> -Optional subnodes:
> -- codec-capture : the subnode of rt5650 codec capture
> -Required codec-capture subnode properties:
> -- sound-dai: audio codec dai name on capture path
> -  <&rt5650 0> : Default setting. Connect rt5650 I2S1 for capture. (dai_name = rt5645-aif1)
> -  <&rt5650 1> : Connect rt5650 I2S2 for capture. (dai_name = rt5645-aif2)
> -
> -- mediatek,mclk: the MCLK source
> -  0 : external oscillator, MCLK = 12.288M
> -  1 : internal source from mt8173, MCLK = sampling rate*256
> -
> -Example:
> -
> -	sound {
> -		compatible = "mediatek,mt8173-rt5650";
> -		mediatek,audio-codec = <&rt5650 &hdmi0>;
> -		mediatek,platform = <&afe>;
> -		mediatek,mclk = <0>;
> -		codec-capture {
> -			sound-dai = <&rt5650 1>;
> -		};
> -	};
> -
> -- 
> 2.50.1
> 
