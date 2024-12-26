Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0307D9FC78C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 03:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC8910E66D;
	Thu, 26 Dec 2024 02:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="AjwRRWxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m118112.qiye.163.com (mail-m118112.qiye.163.com
 [115.236.118.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369610E66D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 02:10:43 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6d43afb9;
 Thu, 26 Dec 2024 10:10:37 +0800 (GMT+08:00)
Message-ID: <573e04c0-6f41-4117-9b04-d2628266a34b@rock-chips.com>
Date: Thu, 26 Dec 2024 10:10:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3588
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-3-damon.ding@rock-chips.com>
 <tdhs45ac2ivdke7idrzxrhlgsqlnswkb2maorau3guzrrwpce3@emdq7xx6cpwz>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <tdhs45ac2ivdke7idrzxrhlgsqlnswkb2maorau3guzrrwpce3@emdq7xx6cpwz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNCSlZNTR5OGklCGRhOGRpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9400baec2b03a3kunm6d43afb9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OT46NDo*ATIPDE0IIRUaEj4p
 EU8wC0NVSlVKTEhOSkxCS0hCSE9JVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIS0xCNwY+
DKIM-Signature: a=rsa-sha256;
 b=AjwRRWxW2Lo9PBQrMB93fBRqQgmHVgRneeSxy1NxFuTPTplCxu8M1n6NHtCxIimsfW+zqimpyP+daoPBlzbBkrRD8AvpGH2CTSccCW74+ixNRnAbQApAMZW8u5SU/BIAn6146qlaGNtb6h3dvOIdYhq5ImgOX22F79eENRu6ztg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=IZzb2ZQ3hoZVRBl4yIEiLAbS1Ry1GkYmH+p0gvL9IqE=;
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

On 2024/12/19 16:28, Krzysztof Kozlowski wrote:
> On Thu, Dec 19, 2024 at 04:05:51PM +0800, Damon Ding wrote:
>> Compared with RK3288/RK3399, the HBR2 link rate support is the main
>> improvement of RK3588 eDP TX controller, and there are also two
>> independent eDP display interfaces on RK3588 Soc.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Drop, patch was very different.
> 
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Add the main defferences of the RK3588 eDP and the previous versions
>>    in commit message
>>
>> Changes in v3:
>> - expand the property clock-names, resets and reset-names
> 
> Adding new properties invalidates reviews. The patch is entirely, really
> significantly different so keeping the review is not acceptable.
> 
>> ---
>>   .../display/rockchip/rockchip,analogix-dp.yaml     | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index 60dedf9b2be7..4f84e8849876 100644
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
>> @@ -25,16 +26,23 @@ properties:
>>       items:
>>         - const: dp
>>         - const: pclk
>> -      - const: grf
>> +      - enum:
>> +          - grf
>> +          - spdif
> 
> No, this cannot be flexible for existing variants.

I will drop the 'spdif' because the audio feature has not been added to 
the analogix-dp driver in this patch series.

> 
>>   
>>     power-domains:
>>       maxItems: 1
>>   
>>     resets:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
> 
> No, you must list the items.
> 
>>   
>>     reset-names:
>> -    const: dp
>> +    minItems: 1
>> +    items:
>> +      - const: dp
>> +      - enum:
>> +          - apb
> 
> I don't understand what happened here but all this is NAK. Why suddenly
> existing variants became different/changed? Nothing in commit msg
> explains this.

The newly added 'apb' reset is to ensure the APB bus of eDP controller 
works well on the RK3588 SoC. I will mention it in commit message in the 
next version.

The fixed patch will be like:

@@ -31,10 +32,12 @@ properties:
      maxItems: 1

    resets:
-    maxItems: 1
+    maxItems: 2

    reset-names:
-    const: dp
+    items:
+      - const: dp
+      - const: apb

    rockchip,grf:
      $ref: /schemas/types.yaml#/definitions/phandle

And I will add the APB reset operation in Rockchip analogix-dp driver, 
which was forgotten in the [PATCH v3 03/15].

Best regards,
Damon

