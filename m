Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1312C7ADCC8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E35010E28A;
	Mon, 25 Sep 2023 16:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ED610E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 16:09:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 66F88B80D8F;
 Mon, 25 Sep 2023 16:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB61DC433C8;
 Mon, 25 Sep 2023 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695658196;
 bh=gcYDTYUu2Rp4Bf6iNJVLLlvth+kTKaTp+V7uWoNTvk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hu2v/FnFlxjU8frwOTv6HaE3GhqkL+iRiOrNGXeHONKhx+WqEGulB3iqEsO3IGGEy
 hgAxAAIBiVgi0fbqtFZJzQoffRDSYG8edHwQHI7nB+R1IdsW+9XyPHFjVb4u2EZiLY
 JBVpmpogNZg4gAdhy3ntRNlS1U9mG7GoKkWczxIV84y7xqI4WCiRcIQHYtqNhgXRBP
 704vKdl227PqSW7OAhjhl/wWj4vywJ+yrbw/EzARX1CuDXNFdDm7eSGy1cgYCAjguf
 aJnuvJGV82DqnjfRPknQoBcOHD90E7VyUwr1ytV1fLcLZgm21GlTTlXPGjygHgL2WS
 llt0nJ8BZyO4Q==
Received: (nullmailer pid 1450584 invoked by uid 1000);
 Mon, 25 Sep 2023 16:09:53 -0000
Date: Mon, 25 Sep 2023 11:09:53 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 09/16] dt-bindings: media: mediatek: mdp3: add
 component STITCH for MT8195
Message-ID: <20230925160953.GA1449445-robh@kernel.org>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-10-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922072116.11009-10-moudy.ho@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 03:21:09PM +0800, Moudy Ho wrote:
> Add the fundamental hardware configuration of component STITCH,

STITCH? You mean TCC?

> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-tcc.yaml     | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> new file mode 100644
> index 000000000000..245e2134c74a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 TCC
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to support
> +  HDR gamma curve conversion HDR displays.

Please say what the block does.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-tcc
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +
> +    display@1400b000 {
> +        compatible = "mediatek,mt8195-mdp3-tcc";
> +        reg = <0x1400b000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
> +    };
> -- 
> 2.18.0
> 
