Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B403809CA3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 07:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E47F10E9DC;
	Fri,  8 Dec 2023 06:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3965810E9DC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 06:58:10 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id C6C2817F11;
 Fri,  8 Dec 2023 14:58:05 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 8 Dec
 2023 14:58:05 +0800
Received: from [192.168.125.88] (183.27.97.199) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 8 Dec
 2023 14:58:04 +0800
Message-ID: <1242f790-7d4f-488a-9046-2b7e361e2da8@starfivetech.com>
Date: Fri, 8 Dec 2023 14:54:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: cdns: Add properties
 to support StarFive JH7110 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20231127113436.57361-1-shengyang.chen@starfivetech.com>
 <20231127113436.57361-2-shengyang.chen@starfivetech.com>
 <a1c651a3-31ed-4ee0-a7bf-a9f5e107bd33@linaro.org>
From: Shengyang Chen <shengyang.chen@starfivetech.com>
In-Reply-To: <a1c651a3-31ed-4ee0-a7bf-a9f5e107bd33@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.199]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 r-ravikumar@ti.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 u.kleine-koenig@pengutronix.de, conor+dt@kernel.org, jonas@kwiboo.se,
 mripard@kernel.org, robh+dt@kernel.org, neil.armstrong@linaro.org,
 keith.zhao@starfivetech.com, bbrezillon@kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,Krzysztof

Thanks for review and comment.

On 2023/11/27 20:22, Krzysztof Kozlowski wrote:
> On 27/11/2023 12:34, Shengyang Chen wrote:
>> From: Keith Zhao <keith.zhao@starfivetech.com>
>> 
>> Add properties in CDNS DSI yaml file to match with
>> CDNS DSI module in StarFive JH7110 SoC.
>> 
>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>> ---
>>  .../bindings/display/bridge/cdns,dsi.yaml     | 38 ++++++++++++++++++-
>>  1 file changed, 36 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
>> index 23060324d16e..3f02ee383aad 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
>> @@ -17,6 +17,7 @@ properties:
>>      enum:
>>        - cdns,dsi
>>        - ti,j721e-dsi
>> +      - starfive,cdns-dsi
> 
> Keep alphabetical order.
> 

ok, will keep it order

>>  
>>    reg:
>>      minItems: 1
>> @@ -27,14 +28,20 @@ properties:
>>            Register block for wrapper settings registers in case of TI J7 SoCs.
>>  
>>    clocks:
>> +    minItems: 2
>>      items:
>>        - description: PSM clock, used by the IP
>>        - description: sys clock, used by the IP
>> +      - description: apb clock, used by the IP
>> +      - description: txesc clock, used by the IP
>>  
>>    clock-names:
>> +    minItems: 2
>>      items:
>>        - const: dsi_p_clk
>>        - const: dsi_sys_clk
>> +      - const: apb
>> +      - const: txesc
>>  
>>    phys:
>>      maxItems: 1
>> @@ -46,10 +53,21 @@ properties:
>>      maxItems: 1
>>  
>>    resets:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: dsi sys reset line
>> +      - description: dsi dpi reset line
>> +      - description: dsi apb reset line
>> +      - description: dsi txesc reset line
>> +      - description: dsi txbytehs reset line
>>  
>>    reset-names:
>> -    const: dsi_p_rst
>> +    items:
>> +      - const: dsi_p_rst
>> +      - const: dsi_dpi
>> +      - const: dsi_apb
>> +      - const: dsi_txesc
>> +      - const: dsi_txbytehs
>>  
>>    ports:
>>      $ref: /schemas/graph.yaml#/properties/ports
>> @@ -90,6 +108,22 @@ allOf:
>>          reg:
>>            maxItems: 1
>>  
> 
> You need to restrict other variants, because you just relaxed several
> properties for everyone...
> 
> 

ok, will fix it

> Best regards,
> Krzysztof
> 

thanks.

Best Regards,
Shengyang
