Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA965BDB5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 11:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E27210E110;
	Tue,  3 Jan 2023 10:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C186210E110
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 10:11:43 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A6A16602CE1;
 Tue,  3 Jan 2023 10:11:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672740702;
 bh=iDxcTBwfqu1inbI6ClQj+J/Gk+ZBgBuM6mX2e/vswOo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M44qVGQFfORgub+nkagT98LCBMLVcctjM4qK7ke/N4CsekYf+FgG+ZKGiUrq8StK/
 8gXYgCiE8pDnJX4+MibzzWBugkzZsYXZTJz3csLYBW8WRm9hXf0I3DhdzaUmlZyJ7y
 k0QG2jh+mz8ChL6NLSLa8cnbkf9jlrxdriulXsKICbzRFgRQoF7TcSnnxqaOJ/3MBw
 jR6SToUTohDpDbYsUDrW1HcxVlU09SW3SbUovD6ZM3r3smTulmHKhjx+bqDzrz3/gX
 4ujbn0MMJe4gY8y8Q9kPxJWSHyB/mE4Y39jdfdbSFlQbtD4gx//J4fyUqLIbyg6E6Y
 vpaASmtsiWdVw==
Message-ID: <761791af-971d-8e64-857c-4b3cbf9487da@collabora.com>
Date: Tue, 3 Jan 2023 11:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 "oul@kernel.org" <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 "obh+dt@kernel.org" <robh+dt@kernel.org>, "kishon@ti.com" <kishon@ti.com>,
 Chunfeng Yun <Chunfeng.Yun@mediatek.com>,
 "hunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "atthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 ".zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "irlied@gmail.com" <airlied@gmail.com>,
 "zysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-2-a803f2660127@baylibre.com>
 <7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com>
 <CABnWg9tf8Sx8S0d8mGowZ80YmZLz6cX2iyxZyKYCGbH_RKMKyA@mail.gmail.com>
 <187044b3-b154-256a-c107-3dc9de57d60b@collabora.com>
 <CABnWg9tRveoZb8e7zGkGqb0MMoJiTxfS1NeJDtfFqMYsf-zJcg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CABnWg9tRveoZb8e7zGkGqb0MMoJiTxfS1NeJDtfFqMYsf-zJcg@mail.gmail.com>
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
Cc: "vicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "i-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mac Shen <Mac.Shen@mediatek.com>, Stuart Lee <Stuart.Lee@mediatek.com>,
 "zysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "nux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "inux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "nux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 02/01/23 16:19, Guillaume Ranquet ha scritto:
> On Mon, 02 Jan 2023 15:14, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Il 02/01/23 14:38, Guillaume Ranquet ha scritto:
>>> On Mon, 26 Dec 2022 06:18, CK Hu (胡俊光) <ck.hu@mediatek.com> wrote:
>>>> Hi, Guillaume:
>>>>
>>>> On Fri, 2022-11-04 at 15:09 +0100, Guillaume Ranquet wrote:
>>>>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>>>>
>>>>> On mt8195 the ddc i2c controller is part of the hdmi IP block and
>>>>> thus has no
>>>>> specific register range, power domain or interrupt, making it simpler
>>>>> than its the legacy "mediatek,hdmi-ddc" binding.
>>>>>
>>>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>>> ---
>>>>>
>>>>
>>>> [snip]
>>>>
>>>>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>>>> hdmi-ddc.yaml
>>>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>>>> hdmi-ddc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..2dc273689584
>>>>> --- /dev/null
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>>>> hdmi-ddc.yaml
>>>>> @@ -0,0 +1,51 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id:
>>>>> https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUkVXPWT8cIu96xdkn4tMams1E55qyxEZmgV1i0WfpOlq57w$
>>>>>
>>>>> +$schema:
>>>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUkVXPWT8cIu96xdkn4tMams1E55qyxEZmgV1i0WdSGOSxzw$
>>>>>
>>>>> +
>>>>> +title: Mediatek HDMI DDC for mt8195
>>>>> +
>>>>> +maintainers:
>>>>> +  - CK Hu <ck.hu@mediatek.com>
>>>>> +  - Jitao shi <jitao.shi@mediatek.com>
>>>>> +
>>>>> +description: |
>>>>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC
>>>>> pins.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - mediatek,mt8195-hdmi-ddc
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: ddc
>>>>> +
>>>>> +  mediatek,hdmi:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description:
>>>>> +      A phandle to the mt8195 hdmi controller
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +    hdmiddc0: i2c {
>>>>> +      compatible = "mediatek,mt8195-hdmi-ddc";
>>>>> +      mediatek,hdmi = <&hdmi0>;
>>>>> +      clocks = <&clk26m>;
>>>>> +      clock-names = "ddc";
>>>>> +    };
>>>>
>>>> I think we should not have a virtual device. This ddc is part of
>>>> mt8195-hdmi device, so just keep mt8195-hdmi, and let mt8195-hdmi
>>>> driver to probe the sub driver of ddc driver.
>>>>
>>>> Regards,
>>>> CK
>>>
>>> Hi CK,
>>>
>>> Thx for your input.
>>> Though I would strongly prefer to keep the ddc as a separate "virtual device".
>>>
>>> It aligns better with the goal of reusing as much code as possible
>>> from the HDMI V1 IP,
>>> which is something you have been advocating since V1 of this patch
>>> quite some time ago
>>> and has shaped this patch.
>>>
>>> To me we are in a state that is clean and avoids branching in the hdmi
>>> common code.
>>> Would you reconsider and allow the use of that virtual device?
>>>
>>> Thx,
>>> Guillaume.
>>>
>>
>> You can as well keep the DDC as a separated driver, but register in the HDMI v1 and
>> v2 driver at probe time.
>>
>> Doing that, you won't need any devicetree node specific to any virtual device :-)
>>
>> Cheers,
>> Angelo
>>
>>
> 
> Sure, but does it make any sense for HDMI v1?
> As the ddc in v1 is a real device which (in theory) can be reused by other IPs.
> 
> I would see either v1 and v2 ddc exposed as a devicetree node (which
> is what I favor).
> Or v1 as a devicetree node and v2 probed directly from the hdmi code base.
> 

The last option looks sensible, since v1 has an external ddc, but on v2 it's
integrated.

v1 -> dt probe
v2 -> driver probe

> Thx,
> Guillaume.


