Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0488FE5C6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4189710E917;
	Thu,  6 Jun 2024 11:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PZ/YEOyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0374F10E917
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717674700;
 bh=SFUVvxNAzAySqmVBXZpEMqURPC5o1K2Msw7qVhlZD7w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PZ/YEOyRAoxBUkfN+li+iJ1/+ZkdV/w7JLlLacBCUDLDV9OANKU6QDSE6wokKnPtD
 qwp2ftm8oXkHucZwZHZ+WGygAmw9YaS+Qf5LD7/sFrWXJYJ6BSIXgsIp3D1RaVhlpK
 Yv1I5RaN6tA/eJH9RoC3YrJqb0kzFdxNt0NwJLFhsPUZ90kCxRLGU7Zr/YOgjYGLAg
 nLO01RDhp37BawcBVwqjb0/9zx6W66O2aiwnAq6sJ2CqftiiKydfG4mRZm652iKz5c
 sDW6OJ7E2LTpFDMoyNAqQGcPve/jTspha6AxhF8PReN8chRmLIiUcTiSAn8JZCff37
 GHKLT36npbhSA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7AECB37821D4;
 Thu,  6 Jun 2024 11:51:38 +0000 (UTC)
Message-ID: <260aa607-099a-4f65-ae59-c4b6ea2256f1@collabora.com>
Date: Thu, 6 Jun 2024 14:51:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] dt-bindings: display: rockchip,dw-hdmi: Add
 compatible for RK3588
To: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <20240601-b4-rk3588-bridge-upstream-v1-12-f6203753232b@collabora.com>
 <20240605232206.GA3345910-robh@kernel.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20240605232206.GA3345910-robh@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/6/24 2:22 AM, Rob Herring wrote:
> On Sat, Jun 01, 2024 at 04:12:34PM +0300, Cristian Ciocaltea wrote:
>> Document the Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX controller
>> found on Rockchip RK3588 SoC family.
>>
>> Since RK3588 uses different clocks than previous Rockchip SoCs and also
>> requires a couple of reset lines and some additional properties, provide
>> the required changes in the binding to accommodate all variants.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  .../display/rockchip/rockchip,dw-hdmi.yaml         | 127 +++++++++++++++------
>>  1 file changed, 90 insertions(+), 37 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>> index 2aac62219ff6..60d6b815227f 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>> @@ -10,12 +10,10 @@ maintainers:
>>    - Mark Yao <markyao0591@gmail.com>
>>  
>>  description: |
>> -  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
>> -  with a companion PHY IP.
>> -
>> -allOf:
>> -  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
>> -  - $ref: /schemas/sound/dai-common.yaml#
>> +  For SoCs up to RK3568, the HDMI transmitter is a Synopsys DesignWare
>> +  HDMI 1.4 TX controller IP with a companion PHY IP.
>> +  The RK3588 SoC integrates the Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP)
>> +  TX controller IP and a HDMI/eDP TX Combo PHY based on a Samsung IP block.
>>  
>>  properties:
>>    compatible:
>> @@ -25,6 +23,7 @@ properties:
>>        - rockchip,rk3328-dw-hdmi
>>        - rockchip,rk3399-dw-hdmi
>>        - rockchip,rk3568-dw-hdmi
>> +      - rockchip,rk3588-dw-hdmi
>>  
>>    reg-io-width:
>>      const: 4
>> @@ -40,36 +39,6 @@ properties:
>>        A 1.8V supply that powers up the SoC internal circuitry. The pin name on the
>>        SoC usually is HDMI_TX_AVDD_1V8.
>>  
>> -  clocks:
>> -    minItems: 2
>> -    items:
>> -      - {}
>> -      - {}
>> -      # The next three clocks are all optional, but shall be specified in this
>> -      # order when present.
>> -      - description: The HDMI CEC controller main clock
>> -      - description: Power for GRF IO
>> -      - description: External clock for some HDMI PHY (old clock name, deprecated)
>> -      - description: External clock for some HDMI PHY (new name)
>> -
>> -  clock-names:
>> -    minItems: 2
>> -    items:
>> -      - {}
>> -      - {}
>> -      - enum:
>> -          - cec
>> -          - grf
>> -          - vpll
>> -          - ref
>> -      - enum:
>> -          - grf
>> -          - vpll
>> -          - ref
>> -      - enum:
>> -          - vpll
>> -          - ref
>> -
>>    ddc-i2c-bus:
>>      $ref: /schemas/types.yaml#/definitions/phandle
>>      description:
>> @@ -131,13 +100,97 @@ properties:
>>  required:
>>    - compatible
>>    - reg
>> -  - reg-io-width
>>    - clocks
>>    - clock-names
>>    - interrupts
>>    - ports
>>    - rockchip,grf
>>  
>> +allOf:
>> +  - $ref: /schemas/sound/dai-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,rk3588-dw-hdmi
>> +    then:
>> +      properties:
>> +        reg:
>> +          maxItems: 1
>> +
>> +        clocks:
>> +          minItems: 1
>> +          items:
>> +            - description: APB system interface clock
>> +            # The next clocks are optional, but shall be specified in this
>> +            # order when present.
>> +            - description: TMDS/FRL link clock
>> +            - description: EARC RX biphase clock
>> +            - description: Reference clock
>> +            - description: Audio interface clock
>> +            - description: Video datapath clock
>> +
>> +        clock-names:
>> +          minItems: 1
>> +          items:
>> +            - const: pclk
>> +            - enum: [hdp, earc, ref, aud, hclk_vo1]
>> +            - enum: [earc, ref, aud, hclk_vo1]
>> +            - enum: [ref, aud, hclk_vo1]
>> +            - enum: [aud, hclk_vo1]
>> +            - const: hclk_vo1
>> +
>> +        resets:
>> +          minItems: 2
>> +          maxItems: 2
>> +
>> +        reset-names:
>> +          items:
>> +            - const: ref
>> +            - const: hdp
>> +
>> +        interrupts:
>> +          minItems: 1
>> +          maxItems: 5
>> +
>> +        rockchip,vo1_grf:
>> +          $ref: /schemas/types.yaml#/definitions/phandle
>> +          description: Some QP related data is accessed through VO1 GRF regs
>> +
>> +      required:
>> +        - resets
>> +        - reset-names
>> +        - rockchip,vo1_grf
>> +
>> +    else:
>> +      $ref: ../bridge/synopsys,dw-hdmi.yaml#
> 
> This is odd... With this plus the amount of conditional schema, I think 
> this should be a new schema doc. Doesn't have to have a common 
> schema. You can let the 2nd user of this IP block do that. 

Yes, v2 is going to be a completely separated driver implementation.

> Though if you 
> have the Synopsys spec, then it would be good to use it and be sure the 
> binding corresponds to it.

Unfortunately I don't have it.

@Andy: Could you please help identifying the properties which should
belong to a common synopsys,dw-hdmi-qp schema?

Thanks,
Cristian
