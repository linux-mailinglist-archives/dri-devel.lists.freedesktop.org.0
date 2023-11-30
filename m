Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E07FEF25
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 13:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2950610E6F7;
	Thu, 30 Nov 2023 12:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m12793.qiye.163.com (mail-m12793.qiye.163.com
 [115.236.127.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF07F10E6F7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 12:32:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=e8MrUsVWZLiX5MpnY5R6sm2oBohVo8MnMibe6kRCFkSBnIsiD+m4tU4lt7VStHIPMC4O0io+WF1/sEzauJ5bh2lPIace3zvBT4tW5mQtvkpKJ/GFLPUVWFuQxtDGmPgf+xapi684hsW0bHdQoHXsjJOvfyxlA1MMTM0PUBpMbDg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=xw5s3z0kYWPrNZEeAkS1HnYylOFQxmO2lako+w4LWo0=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id E8F5E780310;
 Thu, 30 Nov 2023 20:32:16 +0800 (CST)
Message-ID: <4d6c5980-e573-4d85-bc9c-6726413a15d3@rock-chips.com>
Date: Thu, 30 Nov 2023 20:32:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] dt-bindings: display: vop2: Add rk3588 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Yan <andyshrk@163.com>, heiko@sntech.de
References: <20231122125316.3454268-1-andyshrk@163.com>
 <20231122125518.3454796-1-andyshrk@163.com>
 <e7693e9d-a46a-4dc2-9aee-36a2bbf74ade@linaro.org>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <e7693e9d-a46a-4dc2-9aee-36a2bbf74ade@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU4eHlZPSEMfSU5LHkxDSE5VEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8c20373177b24fkuuue8f5e780310
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ND46Lxw4KDw3TxdDPjUCPyo#
 GDZPFE5VSlVKTEtKSE9MTkhMQ05LVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBTkJOTTcG
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof:


On 11/23/23 03:07, Krzysztof Kozlowski wrote:
> On 22/11/2023 13:55, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> The vop2 on rk3588 is similar to which on rk356x
>> but with 4 video ports and need to reference
>> more grf modules.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - fix errors when running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>
>>   .../display/rockchip/rockchip-vop2.yaml       | 27 +++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>> index b60b90472d42..24148d9b3b14 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
>> @@ -20,6 +20,7 @@ properties:
>>       enum:
>>         - rockchip,rk3566-vop
>>         - rockchip,rk3568-vop
>> +      - rockchip,rk3588-vop
>>   
>>     reg:
>>       items:
>> @@ -42,26 +43,47 @@ properties:
>>         frame start (VSYNC), line flag and other status interrupts.
>>   
>>     clocks:
>> +    minItems: 3
>>       items:
>>         - description: Clock for ddr buffer transfer.
>>         - description: Clock for the ahb bus to R/W the phy regs.
>>         - description: Pixel clock for video port 0.
>>         - description: Pixel clock for video port 1.
>>         - description: Pixel clock for video port 2.
>> +      - description: Pixel clock for video port 4.
>> +      - description: Peripheral clock for vop on rk3588.
>>   
>>     clock-names:
>> +    minItems: 3
> 
> You relax requirements for all existing variants here which is not
> explained in commit msg. I assume this was not intentional, so you need
> to re-constrain them in allOf:if:then.
> 
> See for example:
> https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57
> for some ideas.
> 
>>       items:
>>         - const: aclk
>>         - const: hclk
>>         - const: dclk_vp0
>>         - const: dclk_vp1
>>         - const: dclk_vp2
>> +      - const: dclk_vp3
>> +      - const: pclk_vop
>>   
>>     rockchip,grf:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>>       description:
>>         Phandle to GRF regs used for misc control
>>   
>> +  rockchip,vo-grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to VO GRF regs used for misc control, required for rk3588
> 
> Drop last sentence, instead add it to required in allOf:if:then.
> 
> Is this valid for other variants? If not, should be disallowed in
> allOf:if:then: for them.

Only valid for rk3588 now.

> 
>> +
>> +  rockchip,vop-grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to VOP GRF regs used for misc control, required for rk3588
>> +
>> +  rockchip,pmu:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to PMU regs used for misc control, required for rk3588
> 
> For all these three: what is "misc control"? Way too vague. Everything
> is a misc and everything can be control. You must be here specific and
> much more descriptive.

improve in v3

> 
>> +
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>   
>> @@ -81,6 +103,11 @@ properties:
>>           description:
>>             Output endpoint of VP2
>>   
>> +      port@3:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Output endpoint of VP3
> 
> Valid for other variants?
> 

Only valid for rk3588 now.

Thanks for your review and guidance, I try to fix in v3 [0]

[0]https://patchwork.kernel.org/project/linux-rockchip/patch/20231130122418.13258-1-andyshrk@163.com/
> Best regards,
> Krzysztof
> 
