Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D7A01FE5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 08:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5563C10E5A0;
	Mon,  6 Jan 2025 07:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="ai/xbz6e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973181.qiye.163.com (mail-m1973181.qiye.163.com
 [220.197.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D4C10E5A0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 07:28:20 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 7d0a3508;
 Mon, 6 Jan 2025 15:28:16 +0800 (GMT+08:00)
Message-ID: <2d9c71cf-6612-44cb-a223-a2184e027d1c@rock-chips.com>
Date: Mon, 6 Jan 2025 15:28:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/17] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3588
To: Krzysztof Kozlowski <krzk@kernel.org>, heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-3-damon.ding@rock-chips.com>
 <63c14ff2-d3c2-4bbb-8d54-376b75c62fd4@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <63c14ff2-d3c2-4bbb-8d54-376b75c62fd4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5DSlZISk1PGEIZQk5DTENWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a943a83aeb503a3kunm7d0a3508
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OVE6Thw5DjIIFx8iATNILD4U
 PBEwCxRVSlVKTEhNSk9DT0JMTU1NVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSElJNwY+
DKIM-Signature: a=rsa-sha256;
 b=ai/xbz6eBCaRmZIOhnTAI58fU8w5eQMTuuFWwyKYYDz/RALnEKKosakJy2RwfTWOzfoGPf+ChfE47Xyjl8zNYpnraWRC+3qO2Y9klUpIT/V3rTgD3djlhMWpcuCCDw0H6ScoQ57DO4Hg/ybZ9xipULhPIG0uJiX0vMXVyWZbuRA=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=OGrkyu2TC7xLdj/Df8CnWXafSpzpS9J9hFV3qgsUsbY=;
 h=date:mime-version:subject:message-id:from;
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

Hi Krzysztof,

On 2024/12/27 15:13, Krzysztof Kozlowski wrote:
> On 26/12/2024 07:32, Damon Ding wrote:
>> Compared with RK3288/RK3399, the HBR2 link rate support is the main
>> improvement of RK3588 eDP TX controller, and there are also two
>> independent eDP display interfaces on RK3588 Soc.
>>
>> The newly added 'apb' reset is to ensure the APB bus of eDP controller
>> works well on the RK3588 SoC.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Add the main defferences of the RK3588 eDP and the previous versions
>>    in commit message
>>
>> Changes in v3:
>> - Expand the property clock-names, resets and reset-names
>>
>> Changes in v4:
>> - Remove 'spdif' clock which added in v3
>> - Add the comment of newly added 'apb' reset in commit message
>> ---
>>   .../bindings/display/rockchip/rockchip,analogix-dp.yaml  | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index 60dedf9b2be7..200703905b29 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -15,6 +15,7 @@ properties:
>>       enum:
>>         - rockchip,rk3288-dp
>>         - rockchip,rk3399-edp
>> +      - rockchip,rk3588-edp
>>   
>>     clocks:
>>       minItems: 2
>> @@ -31,10 +32,14 @@ properties:
>>       maxItems: 1
>>   
>>     resets:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>>   
>>     reset-names:
>> -    const: dp
>> +    minItems: 1
>> +    items:
>> +      - const: dp
>> +      - const: apb
> 
> I asked why existing variants get this new reset. This is not supposed
> to be flexible (which I wrote as well), but constrained per variant. Or
> explain why not.
> 
> 
> 

I misunderstood you before. Indeed, the new reset is only for RK3588, so 
the patch should be similar to the modifications made for RK3576 HDPTX 
PHY dt-bindings [0].

Best regards
Damon

[0]https://patchwork.kernel.org/project/linux-rockchip/patch/20241231092721.252405-1-andyshrk@163.com/
