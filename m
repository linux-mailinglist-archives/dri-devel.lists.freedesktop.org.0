Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017489F79E0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 11:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5E110E03F;
	Thu, 19 Dec 2024 10:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BKQJ395a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD35510E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734605654;
 bh=6DnBAetO0n/Dt6GuKQiaQjG4sHkyUy/qLhkhpG6lREU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BKQJ395aphVnmIKWFGKR7MYowS/uaeNkIdyc3+FbEH+RDwQ2n8YzBZKSniaLpT3td
 lBImymLI0EVILte+Nh3YXqhHNjbehfrVQ9JTAhQEsNufY2SS0CzqLMV6yHK9z59D0q
 pDmeqzq7MN3BZael32voW88hN8cWgX1e/IaHsPWBwEExo4T/puTKRwHEZEymzxvwqQ
 hO3pnzTH9U3pUInPhMHC2LcG8XfbVB/I0ibVKxUFDqKzYtoj4Y0ZZfaMO6LuKMiqPU
 /hTDVv3Ux3whEJ7iYvW4X+A2w4F05h8eUX3Q8va7rzzaeNUOblc+6wxMlzj5iRVdrc
 WRiGPms7XSrDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 31D5617E3612;
 Thu, 19 Dec 2024 11:54:13 +0100 (CET)
Message-ID: <9a75e88c-d90d-4ea8-b5c3-6d056d4f0498@collabora.com>
Date: Thu, 19 Dec 2024 11:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
 <rsnyljmkdf7i74bkrlf5nesp2sa3n6xcnzsqao4znmczjpfyq2@dsakz56s4ypt>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <rsnyljmkdf7i74bkrlf5nesp2sa3n6xcnzsqao4znmczjpfyq2@dsakz56s4ypt>
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

Il 18/12/24 09:20, Krzysztof Kozlowski ha scritto:
> On Tue, Dec 17, 2024 at 04:43:19PM +0100, AngeloGioacchino Del Regno wrote:
>> +  i2c:
>> +    type: object
>> +    $ref: /schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> +    unevaluatedProperties: false
>> +    description: HDMI DDC I2C controller
>> +
>> +  phys:
>> +    maxItems: 1
>> +    description: PHY providing clocking TMDS and pixel to controller
>> +
>> +  phy-names:
>> +    items:
>> +      - const: hdmi
>> +
>> +  pinctrl-0: true
>> +
>> +  pinctrl-names:
>> +    items:
>> +      - const: default
> 
> Drop both pinctrl entries.
> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Input port, usually connected to the output port of a DPI
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Output port that must be connected either to the input port of
>> +          a HDMI connector node containing a ddc-i2c-bus, or to the input
>> +          port of an attached bridge chip, such as a SlimPort transmitter.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
> 
> Please keep the same order of things here and in main properties
> section.
> 
>> +  - interrupts
>> +  - power-domains
>> +  - phys
>> +  - phy-names
>> +  - ports
>> +
> 
> You need allOf: with ref to dai-common.yaml.
> 
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mt8195-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/mt8195-power.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        hdmi-tx@1c300000 {
> 
> hdmi@
> 
> Best regards,
> Krzysztof
> 

Thanks for the great review krzk.

I was wondering if it'd be more straightforward to just send the bindings in a
different series, instead of sending another batch of 33 (actually, 34, because
I forgot one commit adding the DDC binding, ugh!) patches...

CK, any objections?

Cheers,
Angelo
