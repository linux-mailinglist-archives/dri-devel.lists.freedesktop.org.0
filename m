Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF667989D39
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 10:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6385210E0D2;
	Mon, 30 Sep 2024 08:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PEZEQAo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435C610E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727686147;
 bh=VJzCGMMRci/BiZjulnBSG77pRU6y2deSbKtvy/pU2pY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PEZEQAo4oB0HrZ6hyP//YB/w7n6xJyG5PinuwSHzdOx8AOmj5Ixfq89MPhXWSxLjH
 KEi+/4bQzhnDIybedEyuX/RZBdi7K8UmoiaXn2zHwV4nJFYdlPrA1AQlUVIEjBMKOm
 UHx623s1TF8BknFyk1paXHosCBPSeYgwLrIC5b+D9DMlPRCWVXDH24ixypfyzzCLyy
 EQcIcVE0GLjGByWkc7qohQpkONmrKnrc9nPPDH1iJi/2XuSWVxbgYUl9ANpMGPvYe7
 1skqXCgezJWh+s/+N3XhNKLqRLmKJhmHh7OtBnB7BywKpUWNuxu7j4Q6lMPCXeOAz4
 kdQ8HOqp53crQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 98BEC17E10AB;
 Mon, 30 Sep 2024 10:49:06 +0200 (CEST)
Message-ID: <8883c84d-8333-4b04-83b5-022be5b6153c@collabora.com>
Date: Mon, 30 Sep 2024 10:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Ben Lok <ben.lok@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240926111449.9245-1-macpaul.lin@mediatek.com>
 <20240926111449.9245-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240926111449.9245-2-macpaul.lin@mediatek.com>
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

Il 26/09/24 13:14, Macpaul Lin ha scritto:
> The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'interrupts' property. The error message was:
> 
>    infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
>                       [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
>                       is too long
> 
> To address this issue, add "minItems: 1" and "maxItems: 5" constraints to
> the 'interrupts' property in the DT binding schema. This change allows for
> flexibility in the number of interrupts for new SoCs.
> The purpose of these 5 interrupts is also added.
> 
> Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../bindings/iommu/mediatek,iommu.yaml        | 25 ++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> Changes for v2:
>   - commit message: re-formatting and add a description of adding 5 interrupts.
>   - add 'description' and 'maxItems: 5' for 'interrupt' property of
>     'mt8195-iommu-infra'
>   - others keeps 'maxItems: 1'
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index ea6b0f5f24de..fdd2996d2a31 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -96,7 +96,8 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5
>   
>     clocks:
>       items:
> @@ -210,6 +211,28 @@ allOf:
>         required:
>           - mediatek,larbs
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-iommu-infra
> +
> +    then:
> +      properties:
> +        interrupts:
> +          description: |

Do you really need to keep the formatting?

If you rephrase that as:

The infra IOMMU in MT8195 has five banks: each features one set
of APB registers for the normal world (set 0), one for the protected
world (sets 1-3) and one for the secure world (set 4), and each set
has its own interrupt. Therefore, five interrupts are needed.

...you won't need the bar :-)

> +            The IOMMU of MT8195 has 5 banks: 0/1/2/3/4.
> +            Each bank has a set of APB registers corresponding to the
> +            normal world, protected world 1/2/3, and secure world, respectively.
> +            Therefore, 5 interrupt numbers are needed.
> +          maxItems: 5

minItems: 5

Cheers,
Angelo


