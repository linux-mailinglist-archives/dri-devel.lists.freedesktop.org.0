Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66B4651E2D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA85210E372;
	Tue, 20 Dec 2022 09:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FE510E372
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:58:13 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y25so17768701lfa.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WQkIqaxBtB0Ewfz7A6he2wHq2KcHNaWctN054QYteZs=;
 b=Se8p7QFKTprIr1l5ziV9OgWwRWON80NMznYu6QzDl152RsVlSZNSRNk3SV/yPj53v5
 5GUyFMko3MHxyJV8ni/WPypCIFB/qwi1aWFUGegQBNXyVJCcfP2Q+KwWX4vQbMuqIQPW
 2Gtvnfo2rmkSO3uqI81ZVHYXA8glKSl8SZ4V/a50xOFnFkKgLTMiIlZ8VAXrQruweOXw
 AYAoWOUX2V8YB/UO9O+k8YcwhI7L0rt9wqSUfsMYg4BI86SxJMmra0anoxw06IEyYHHv
 8zkuCqbfgRCC+8Omkq0Pqqv5gAkFohFnQOLEz2yhMfYHpZBCYCEIBIlXRTwM0IUl0D27
 Cr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WQkIqaxBtB0Ewfz7A6he2wHq2KcHNaWctN054QYteZs=;
 b=mxf1qThd/VWpmUNdFxSZDaZMRP63lDfpwFkgymwgwDwFljC2/zx9c8MD1G8ModpMSp
 AzLmkmcPNV54mfLRTR+4NeVnTKr/v1TPsnUI0xe9NMsbklkAFVDN14N2/yuCT8FI8dNL
 sPPGLjks946tWfjbQV/nAYR43zXnMbVtPVEw97z0F5APV/+AIkHUoCyxw/e7ZEkAdJF8
 vg2hm8/8SLb8DkOUTiD3TySsyoagwrN3pzTch1RG54/OQMEgaDEwXBlS4LF9hHnGWxrV
 jW3IaV7ZXZdFjT3s5I7KXHia22vTZhG4dUckzLOEBsjr0g8UF5BurU+zWMoC2niA2ZSe
 khRA==
X-Gm-Message-State: ANoB5pnV5RvJmgIY5rf2bt95gpvklvx8B51JILMg5tbgBZgBhqhzMp+N
 ttVEsTQg7gkF4En2VKnO0ikevA==
X-Google-Smtp-Source: AA0mqf4fa83vKausq8IwFJxpg7iYptOZiAjPPBjemcwf6+O/3/Qq7ioCFbXlbZhwHmg6RAq9FFkVnw==
X-Received: by 2002:a05:6512:68f:b0:4b6:f595:cfde with SMTP id
 t15-20020a056512068f00b004b6f595cfdemr11279533lfe.12.1671530291883; 
 Tue, 20 Dec 2022 01:58:11 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a19a405000000b004b4ea0f4e25sm1397030lfc.301.2022.12.20.01.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:58:11 -0800 (PST)
Message-ID: <26471d96-804a-93e8-d866-e6c89ce52952@linaro.org>
Date: Tue, 20 Dec 2022 10:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
Content-Language: en-US
To: Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de
References: <fd51df66-147d-d40f-913e-385625a71984@gmail.com>
 <8db62d1a-365c-d41d-90aa-4c78c5d5e9ce@linaro.org>
 <5e05a6d5-bc89-fb66-fcae-2e1194e23c12@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5e05a6d5-bc89-fb66-fcae-2e1194e23c12@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/12/2022 15:23, Johan Jonker wrote:
> 
> 
> On 12/19/22 14:04, Krzysztof Kozlowski wrote:
>> On 19/12/2022 13:32, Johan Jonker wrote:
>>> Convert rockchip-lvds.txt to YAML.
>>>
>>> Changed:
>>>   Add power-domains property.
>>>   Requirements between PX30 and RK3288
>>>
>>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>>> ---
>>>
>>> Changed V3:
>>>   Filename matching compatible style
>>>   Drop "Regulator phandle for "
>>>   Specify properties and requirements per SoC
>>>   Sort order and restyle
>>>
>>> Changed V2:
>>>   Fix title
>>> ---
>>>  .../display/rockchip/rockchip,lvds.yaml       | 170 ++++++++++++++++++
>>>  .../display/rockchip/rockchip-lvds.txt        |  92 ----------
>>>  2 files changed, 170 insertions(+), 92 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>>> new file mode 100644
>>> index 000000000..03b002a05
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>>> @@ -0,0 +1,170 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,lvds.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Rockchip low-voltage differential signal (LVDS) transmitter
>>> +
>>> +maintainers:
>>> +  - Sandy Huang <hjc@rock-chips.com>
>>> +  - Heiko Stuebner <heiko@sntech.de>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - rockchip,px30-lvds
>>> +      - rockchip,rk3288-lvds
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    const: pclk_lvds
>>> +
>>> +  avdd1v0-supply:
>>> +    description: 1.0V analog power.
>>> +
>>> +  avdd1v8-supply:
>>> +    description: 1.8V analog power.
>>> +
>>> +  avdd3v3-supply:
>>> +    description: 3.3V analog power.
>>> +
>>> +  rockchip,grf:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: Phandle to the general register files syscon.
>>> +
>>> +  rockchip,output:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    enum: [rgb, lvds, duallvds]
>>> +    description: This describes the output interface.
>>> +
>>> +  phys:
>>> +    maxItems: 1
>>> +
>>> +  phy-names:
>>> +    const: dphy
>>> +
>>> +  pinctrl-names:
>>> +    const: lcdc
>>> +
>>> +  pinctrl-0: true
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description:
>>> +          Video port 0 for the VOP input.
>>> +          The remote endpoint maybe vopb or vopl.
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description:
>>> +          Video port 1 for either a panel or subsequent encoder.
>>> +
>>> +    required:
>>> +      - port@0
>>> +      - port@1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - rockchip,grf
>>> +  - rockchip,output
>>> +  - ports
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: rockchip,px30-lvds
>>> +
>>> +    then:
>>> +      properties:
>>> +        reg: false
>>> +        clocks: false
>>> +        clock-names: false
>>> +        avdd1v0-supply: false
>>> +        avdd1v8-supply: false
>>> +        avdd3v3-supply: false
>>> +
>>
> 
>> I see one compatible expects regmap from parent (grf is the parent here)
>> and other is directly on MMIO bus. Not the best combination... Maybe
>> this  should be just split to two separate bindings? Looking at driver,
>> their code is also very different between these two variants.
> 
> Looking at the manufacturer tree we can expect the rest with grf parent, but also in the same driver combined with different registers and common probe.
> Due to common probe I prefer one common document.

Bindings are not representing Linux driver structure, so common probe is
not really argument. If you create one driver (one probe) handling
different devices like RTC, extcon, regulator and clocks, does it mean
it must be one binding? No.

You are over-complicating bindings now.

These are entirely different devices - their programming model and how
they are modeled in the DTS.

Best regards,
Krzysztof

