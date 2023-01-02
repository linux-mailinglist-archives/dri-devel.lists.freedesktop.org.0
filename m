Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC365B340
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 15:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680F810E1AC;
	Mon,  2 Jan 2023 14:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EA210E1AC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 14:14:44 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0C4BC660036F;
 Mon,  2 Jan 2023 14:14:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672668883;
 bh=KWofe4Ce3M/Z6MdezBB9cv+MoFevPlM9NxEfSRWWBKA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=B2tnzaFmBPW9eb1lm0Bvxs+jKedjx+VFazMTAfbf8W9bZwnH03CfodnQNZaIeySKp
 bSSpu9DS8xqW7Dtx4QSGFYGah8/nt992fuyejDrc2jspfCr7g1O7ck78zDGtCOlUA4
 Bgs6Kv+Sj5VMeqDYQailcnGXz97COiO1wsV4AxTeKizWPJrIEvUFUMVcOILQl2424E
 lv9wndKuIeFf3OdNLYNk3d05x+lpDW0H2aSrH8wIHsmLKQYGU6s3sNZpn9I6ZLYXQn
 WGPPttaVHML8D67T00cO/74PI7Wok64VMSJ8fYRdAfX+t90WnsTOHGHe0v6jV5lQ1d
 LQPYD1YMKEpXg==
Message-ID: <187044b3-b154-256a-c107-3dc9de57d60b@collabora.com>
Date: Mon, 2 Jan 2023 15:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, CK Hu <ck.hu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "kishon@ti.com" <kishon@ti.com>,
 Chunfeng Yun <Chunfeng.Yun@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "rzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "koul@kernel.org" <vkoul@kernel.org>
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-2-a803f2660127@baylibre.com>
 <7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com>
 <CABnWg9tf8Sx8S0d8mGowZ80YmZLz6cX2iyxZyKYCGbH_RKMKyA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CABnWg9tf8Sx8S0d8mGowZ80YmZLz6cX2iyxZyKYCGbH_RKMKyA@mail.gmail.com>
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
Cc: "evicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mac Shen <Mac.Shen@mediatek.com>, Stuart Lee <Stuart.Lee@mediatek.com>,
 "rzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "inux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "inux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 02/01/23 14:38, Guillaume Ranquet ha scritto:
> On Mon, 26 Dec 2022 06:18, CK Hu (胡俊光) <ck.hu@mediatek.com> wrote:
>> Hi, Guillaume:
>>
>> On Fri, 2022-11-04 at 15:09 +0100, Guillaume Ranquet wrote:
>>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>>
>>> On mt8195 the ddc i2c controller is part of the hdmi IP block and
>>> thus has no
>>> specific register range, power domain or interrupt, making it simpler
>>> than its the legacy "mediatek,hdmi-ddc" binding.
>>>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>> ---
>>>
>>
>> [snip]
>>
>>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>> hdmi-ddc.yaml
>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>> hdmi-ddc.yaml
>>> new file mode 100644
>>> index 000000000000..2dc273689584
>>> --- /dev/null
>>> +++
>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-
>>> hdmi-ddc.yaml
>>> @@ -0,0 +1,51 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id:
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUkVXPWT8cIu96xdkn4tMams1E55qyxEZmgV1i0WfpOlq57w$
>>>
>>> +$schema:
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!wwVQuq5lzW0lvUFUkVXPWT8cIu96xdkn4tMams1E55qyxEZmgV1i0WdSGOSxzw$
>>>
>>> +
>>> +title: Mediatek HDMI DDC for mt8195
>>> +
>>> +maintainers:
>>> +  - CK Hu <ck.hu@mediatek.com>
>>> +  - Jitao shi <jitao.shi@mediatek.com>
>>> +
>>> +description: |
>>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC
>>> pins.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt8195-hdmi-ddc
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: ddc
>>> +
>>> +  mediatek,hdmi:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      A phandle to the mt8195 hdmi controller
>>> +
>>> +required:
>>> +  - compatible
>>> +  - clocks
>>> +  - clock-names
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    hdmiddc0: i2c {
>>> +      compatible = "mediatek,mt8195-hdmi-ddc";
>>> +      mediatek,hdmi = <&hdmi0>;
>>> +      clocks = <&clk26m>;
>>> +      clock-names = "ddc";
>>> +    };
>>
>> I think we should not have a virtual device. This ddc is part of
>> mt8195-hdmi device, so just keep mt8195-hdmi, and let mt8195-hdmi
>> driver to probe the sub driver of ddc driver.
>>
>> Regards,
>> CK
> 
> Hi CK,
> 
> Thx for your input.
> Though I would strongly prefer to keep the ddc as a separate "virtual device".
> 
> It aligns better with the goal of reusing as much code as possible
> from the HDMI V1 IP,
> which is something you have been advocating since V1 of this patch
> quite some time ago
> and has shaped this patch.
> 
> To me we are in a state that is clean and avoids branching in the hdmi
> common code.
> Would you reconsider and allow the use of that virtual device?
> 
> Thx,
> Guillaume.
> 

You can as well keep the DDC as a separated driver, but register in the HDMI v1 and
v2 driver at probe time.

Doing that, you won't need any devicetree node specific to any virtual device :-)

Cheers,
Angelo


