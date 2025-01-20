Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B3A166E5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 08:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA63010E315;
	Mon, 20 Jan 2025 07:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="hvLcnqb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3275.qiye.163.com (mail-m3275.qiye.163.com
 [220.197.32.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302B310E315
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 07:08:13 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 92ac8289;
 Mon, 20 Jan 2025 15:08:08 +0800 (GMT+08:00)
Message-ID: <d6211c5e-a38d-46aa-8d33-6dba2a71e018@rock-chips.com>
Date: Mon, 20 Jan 2025 15:08:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v5 13/20] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3588
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, dmitry.baryshkov@linaro.org,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-14-damon.ding@rock-chips.com>
 <gmwmnjc4pzyzzstyozlfcdaw2ntfxg6ixofio2j746hmixhblc@sjbcvwcgitmy>
Content-Language: en-US
In-Reply-To: <gmwmnjc4pzyzzstyozlfcdaw2ntfxg6ixofio2j746hmixhblc@sjbcvwcgitmy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhCHlYaHhkfTRlOQ0gaHU5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a94828a484603a3kunm92ac8289
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTI6Hgw*ITIVSzcfAx8VFAgj
 OD5PChBVSlVKTEhMSE5NQ0NCQ0xNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIT0tPNwY+
DKIM-Signature: a=rsa-sha256;
 b=hvLcnqb6GgruYOfRwgMuBJZ5apTXhXgbcphlrkpMcxbPR5AkNTHTqVs27FdGFp2qS4UbOwsMJtceiuvVU3BYIcVm87yzf0e7mntk7p3YiHcAdCM+LrQ54/L6zU9oFUg93nqycd1I8fukZYoTuqCY5ssqkZGmSlzKRMo0UPBECpc=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=d9x5PVUE1JktG04GVLVpq/qvvHEgshZnb4IAcFz1hy0=;
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

On 2025/1/9 16:54, Krzysztof Kozlowski wrote:
> On Thu, Jan 09, 2025 at 11:27:18AM +0800, Damon Ding wrote:
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
>>
>> Changes in v5:
>> - Put the differences between RK3288/RK3399 and RK3588 into 'allOf'
>> ---
>>   .../rockchip/rockchip,analogix-dp.yaml        | 37 ++++++++++++++++---
>>   1 file changed, 31 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index eaf4e67e232e..3cdea9e63522 100644
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
>> @@ -30,12 +31,6 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> -  resets:
>> -    maxItems: 1
>> -
>> -  reset-names:
>> -    const: dp
> 
> Widest constraints are always here. You only needed to add allOf.
> 
> https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> 
> 

I see. I will keep the widest constraints of 'resets' and 'reset-names', 
and only add RK3588 related constraints in allOf.

And I may also need to add the 'minItems' and 'maxItems' for 'resets' 
and 'reset-names' like the 'qcom,ufs.yaml':

diff --git 
a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml 
b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
index a4c0c3a5de5a..baee021314e7 100644
--- 
a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
+++ 
b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
@@ -32,9 +32,12 @@ properties:
      maxItems: 1

    resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2

    reset-names:
+    minItems: 1
+    maxItems: 2
      const: dp

    rockchip,grf:

If not, the CHECK_DTBS will failed with the logs:

/linux/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: 
resets: [[31, 469], [31, 468]] is too long
         from schema $id: 
http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
/linux/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000: 
reset-names: ['dp', 'apb'] is too long
         from schema $id: 
http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#


Best regards
Damon


