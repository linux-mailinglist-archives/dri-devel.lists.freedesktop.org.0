Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD7B2EE82
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 08:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7405110E2D8;
	Thu, 21 Aug 2025 06:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qWVE8Im2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3ECC10E2D8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 06:46:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 28592601E9;
 Thu, 21 Aug 2025 06:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E33C4CEED;
 Thu, 21 Aug 2025 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755758777;
 bh=i+n/4B/MiYix4PhRatm6mvUq8Z++Ah+iaPndzC5npow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWVE8Im28bcNByDb4nmbii+MVUYW1gsPh1TPxiVjMbVj3iGap2s3VVKOPiLVFPKnd
 4Eu+45zODx7dsxT4FLsoLUe0zDJrLe5xa06Y4lRzGAeJkKV+7Q3eT3SmSmt7R0F38z
 ra0pegJVHDO71R+XeH/4/xx8U4aL3pNN3wGmeUw2uRh0CQ0qpXe4RFtix1Xr1djnbJ
 MJGnBfQGKhAyz67jrXPCbdi1Q5DUERLN2mJz5bq4a9VH+9MpAN986KJJnQD3D9pdrV
 POjph9k+6aZgMrrQ5ZAoMjAy48TcKN2O+H2a4/6p5ClojOr7JIlJnE6/E4UsYZ4wFd
 c5wAQG7EG7dcg==
Date: Thu, 21 Aug 2025 08:46:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, 
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, 
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
 houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com,
 kernel@collabora.com, 
 krzk+dt@kernel.org, kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org, louisalexis.eyraud@collabora.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
 minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de,
 pabeni@redhat.com, 
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
 support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v1 01/14] media: dt-bindings: Convert MediaTek mt8173-mdp
 bindings to YAML
Message-ID: <20250821-silky-slug-of-novelty-e4bb64@kuoka>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-2-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-2-ariel.dalessandro@collabora.com>
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

On Wed, Aug 20, 2025 at 02:12:49PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data Path
> to a YAML schema.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-mdp.yaml   | 174 ++++++++++++++++++
>  .../bindings/media/mediatek-mdp.txt           |  95 ----------
>  2 files changed, 174 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> new file mode 100644
> index 0000000000000..f3a08afc305b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8173 Media Data Path
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +description:
> +  Media Data Path is used for scaling and color space conversion.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Just enum, no items here


> +          - enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-rsz
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +      - items:
> +          - enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-rsz
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +          - const: mediatek,mt8173-mdp

This makes no sense. How devices can be compatible and can not be
compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks: true

No, there's no such syntax. Look at other bindings.


> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    description: |

Drop |

> +      This property should point to the respective IOMMU block with master port as argument,
> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.

Drop entire description, completely redundant. I don't know why my patch
fixing this was not applied, so you keep repeating same mistakes...

> +    maxItems: 1
> +
> +  mediatek,vpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Describes point to vpu.

Useless description. We see that from the property name. Explain the
purpose in the hardware.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp-rdma
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +            - description: Mutex clock
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Main clock
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8173-mdp-rdma
> +              - mediatek,mt8173-mdp-wdma
> +              - mediatek,mt8173-mdp-wrot
> +    then:
> +      required:
> +        - iommus
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-mdp

This makes no sense either.

> +    then:
> +      required:
> +        - mediatek,vpu
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/memory/mt8173-larb-port.h>
> +    #include <dt-bindings/power/mt8173-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        mdp_rdma0: rdma@14001000 {

One example is enough. Two could be fine if they differ significantly.

Best regards,
Krzysztof

