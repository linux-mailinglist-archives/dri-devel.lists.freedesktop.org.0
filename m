Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DC9F8A34
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 03:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B89710E04D;
	Fri, 20 Dec 2024 02:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="deB0Jb94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973185.qiye.163.com (mail-m1973185.qiye.163.com
 [220.197.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF7D10E04D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 02:49:02 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 64782b86;
 Fri, 20 Dec 2024 10:48:57 +0800 (GMT+08:00)
Message-ID: <c06381b7-1e38-4af4-9873-15862e91937d@rock-chips.com>
Date: Fri, 20 Dec 2024 10:48:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] dt-bindings: display: rockchip: analogix-dp: Add
 support to get panel from the DP AUX bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-11-damon.ding@rock-chips.com>
 <bjkcue3dfgaf5i66cqbiczifo7r3xngupghklxgevwqpwfeeix@i2jfd477igri>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <bjkcue3dfgaf5i66cqbiczifo7r3xngupghklxgevwqpwfeeix@i2jfd477igri>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhlNSFZIGR8fTklCTR1CQx1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e1f7db9703a3kunm64782b86
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NFE6Szo5QjIOEAo1SjlCL0IM
 Mw5PCxpVSlVKTEhPTU1JQkhCSUtOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSUlINwY+
DKIM-Signature: a=rsa-sha256;
 b=deB0Jb94udSAo7ZPYkOoiDXrtBIRVqu0+kLEM19169DFiIFcei1LSpKufWBIrzG6vYJv5PNC9OwrY6G8JVKp9RAHMygxg6l2KSWfpJn8SbqdhLiwpx2+U5psTdmjjWKAY+wR/edr5OSCkURTbAKVIwCMiFIC2KPVTL/z0ZaZ9oo=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=BnTG/sbpkXhlifAr32NESdvTHkU0t98XHfRuC7OuuwQ=;
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

Hi Dmitry,

On 2024/12/20 8:18, Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 04:05:59PM +0800, Damon Ding wrote:
>> According to Documentation/devicetree/bindings/display/dp-aux-bus.yaml,
>> it is a good way to get panel through the DP AUX bus.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../bindings/display/rockchip/rockchip,analogix-dp.yaml        | 3 +++
>>   1 file changed, 3 insertions(+)
> 
> Business before pleasure.^W^W^W Bindings before the driver.

I couldn't agree more. ;-)

> 
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index 4f84e8849876..c45d92a2d901 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -49,6 +49,9 @@ properties:
>>       description:
>>         This SoC makes use of GRF regs.
>>   
>> +  aux-bus:
>> +    $ref: /schemas/display/dp-aux-bus.yaml#
>> +
>>   required:
>>     - compatible
>>     - clocks
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon
