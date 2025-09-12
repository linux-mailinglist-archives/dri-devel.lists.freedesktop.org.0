Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5152BB544A1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE2D10E18D;
	Fri, 12 Sep 2025 08:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mjESWjIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1258110E18D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757664691;
 bh=CzesZ0+83XgeIbXL6u4EnFLvcQwKX0MimNmWx+DMUmA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mjESWjIKXRwZVDydET4lIeaI2BUyFqWGWT6Asttm4aF5IV7TCbY64i3KVe3SFvp1m
 zJ2cF6z0RJm5hhJh8/m+NdT/F3od9v7fDRXhyW/+eq5viQpRdCV5HSQnbLjZ/xc9n+
 tvutCB33fYeaQQ/sjE2gmmlRRwCzOyenC5oVYCY3CEChAf5dclzUyWDHVn+100ldl4
 A+mk2crY1sSjswYOvdhQNAcif4ADPpaTOSLdWeUrv621E2NCndrFeRavnqVmjqL0RK
 Ky9ikvwGpz9bZk6zS58reSv5qz2R6PZGO0RuYuoG3BDkIfGuSmLun0R/aRpvUx0eoB
 PNZFWtzaQjM6A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B03017E0100;
 Fri, 12 Sep 2025 10:11:29 +0200 (CEST)
Message-ID: <f44a0f08-1b00-49b4-82e6-17135138c55e@collabora.com>
Date: Fri, 12 Sep 2025 10:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] dt-bindings: media: Convert MediaTek mt8173-vpu
 bindings to DT schema
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-3-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-3-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
> Convert the existing text-based DT bindings for Mediatek MT8173 Video
> Processor Unit to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../bindings/media/mediatek,mt8173-vpu.yaml   | 74 +++++++++++++++++++
>   .../bindings/media/mediatek-vpu.txt           | 31 --------
>   2 files changed, 74 insertions(+), 31 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
> new file mode 100644
> index 0000000000000..8a47761f1e6b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-vpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8173 Video Processor Unit
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +description:
> +  Video Processor Unit is a HW video controller. It controls HW Codec including
> +  H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color
> +  convert).
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8173-vpu
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: tcm
> +      - const: cfg_reg
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: main
> +
> +  memory-region:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - memory-region
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        vpu: vpu@10020000 {
> +            compatible = "mediatek,mt8173-vpu";
> +            reg = <0 0x10020000 0 0x30000>,
> +                  <0 0x10050000 0 0x100>;
> +            reg-names = "tcm", "cfg_reg";
> +            interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&topckgen CLK_TOP_SCP_SEL>;
> +            clock-names = "main";
> +            memory-region = <&vpu_dma_reserved>;
> +        };
> +    };
> +
> +...
