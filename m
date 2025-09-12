Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDBDB545E7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CE710EBC9;
	Fri, 12 Sep 2025 08:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b9k6Y/jY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CA010EBC9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757666976;
 bh=t2CbprpuSHyhZVsAXOvVA2HQNj6MCqFKJW6RdhauD7A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b9k6Y/jYHYRf1lBd3IVQs8MHuAF8Lp6WToReTrp1ENuOHC572Yy8h6K04o261v7Ua
 4yW19LAPpuImfWtnGkwQ0AI++cysclzDjM48otKS6QWxc3huIGYnfsD2EIhixgRlnB
 DASIixfeR12WRXjgbBInSPg9IQsTxZ3yVzg7gkK97V+olG00bTvwQxVTAQNjgQjLX8
 BuV3duQibBT6UOIh8+w26DohRm5Zwb+2dqew+bmZTDDDfA5DyuNbhJDKNQWRtzO5s7
 rixyPQa88tYz+a/WjvMPdPxtN1tP4M3Azs1f15mTHQRrIsynehoHJn87WgBxnP8tJx
 h179TIG0hlXKg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E66317E05BE;
 Fri, 12 Sep 2025 10:49:35 +0200 (CEST)
Message-ID: <181e1668-6efc-4dce-91e4-7b535e17dd46@collabora.com>
Date: Fri, 12 Sep 2025 10:49:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
To: Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
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
 tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-2-ariel.dalessandro@collabora.com>
 <20250912-alluring-turaco-of-conversion-dca193@kuoka>
 <CAGXv+5GovP7NuG042AwfmtC-sPJMGuFAm6iZ0iqNZgU0VE+qmQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5GovP7NuG042AwfmtC-sPJMGuFAm6iZ0iqNZgU0VE+qmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Il 12/09/25 10:27, Chen-Yu Tsai ha scritto:
> On Fri, Sep 12, 2025 at 2:06 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Thu, Sep 11, 2025 at 12:09:50PM -0300, Ariel D'Alessandro wrote:
>>> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
>>> Path to a DT schema.
>>>
>>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>> ---
>>>   .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>>>   .../bindings/media/mediatek-mdp.txt           |  95 ----------
>>>   2 files changed, 169 insertions(+), 95 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>> new file mode 100644
>>> index 0000000000000..8ca33a733c478
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>> @@ -0,0 +1,169 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek MT8173 Media Data Path
>>> +
>>> +maintainers:
>>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>> +
>>> +description:
>>> +  Media Data Path is used for scaling and color space conversion.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - enum:
>>> +          - mediatek,mt8173-mdp-rdma
>>> +          - mediatek,mt8173-mdp-rsz
>>> +          - mediatek,mt8173-mdp-wdma
>>> +          - mediatek,mt8173-mdp-wrot
>>
>> Why there is no mediatek,mt8173-mdp here? What does this compatible
>> represent?
>>
>>> +      - items:
>>> +          - const: mediatek,mt8173-mdp-rdma
>>
>> Still suspicious. Device cannot be simulatanously: compatible and not
>> compatible. This is not a well known cat that has superposition of two
>> states, whenenver you look the other way.
>>
>> Maybe the old binding was incorrect, maybe the in-tree DTS is incorrect.
>> Whichever the reason, this must be investigated and documented, because
>> by standard rules this is wrong. Each wrong code needs very clear
>> explanations (and "someone did it" is not a good enough explanation).
> 
> My guess is that "mediatek,mt8173-mdp" is meant to serve as a single
> entry point for the implementation to bind the driver to. The MDP is
> a Data Pipeline and there could be multiple instances of the same
> IP block, as seen in the original example.
> 

Yeah your guess is right.

Cheers,
Angelo

> The datasheet I have doesn't cover the "RDMA" block specifically, so
> I can't say whether there is an actual difference between the two RDMA
> blocks.
> 
> 
> ChenYu
> 
>>> +          - const: mediatek,mt8173-mdp
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  mediatek,vpu:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      phandle to Mediatek Video Processor Unit for HW Codec encode/decode and
>>> +      image processing.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - power-domains
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: mediatek,mt8173-mdp-rdma
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: Main clock
>>> +            - description: Mutex clock
>>> +    else:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: Main clock
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - mediatek,mt8173-mdp-rdma
>>> +              - mediatek,mt8173-mdp-wdma
>>> +              - mediatek,mt8173-mdp-wrot
>>> +    then:
>>> +      required:
>>> +        - iommus
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: mediatek,mt8173-mdp
>>> +    then:
>>> +      required:
>>> +        - mediatek,vpu
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/mt8173-clk.h>
>>> +    #include <dt-bindings/memory/mt8173-larb-port.h>
>>> +    #include <dt-bindings/power/mt8173-power.h>
>>> +
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        mdp_rdma0: rdma@14001000 {
>>> +            compatible = "mediatek,mt8173-mdp-rdma",
>>> +                         "mediatek,mt8173-mdp";
>>> +            reg = <0 0x14001000 0 0x1000>;
>>> +            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
>>> +                     <&mmsys CLK_MM_MUTEX_32K>;
>>> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>>> +            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
>>> +            mediatek,vpu = <&vpu>;
>>> +        };
>>> +
>>> +        mdp_rdma1: rdma@14002000 {
>>> +            compatible = "mediatek,mt8173-mdp-rdma";
>>> +            reg = <0 0x14002000 0 0x1000>;
>>> +            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
>>> +                     <&mmsys CLK_MM_MUTEX_32K>;
>>> +            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>>> +            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
>>> +        };
>>
>> My previous comment applies.
>>
>> Keep one or two examples.
>>
>> Best regards,
>> Krzysztof
>>

