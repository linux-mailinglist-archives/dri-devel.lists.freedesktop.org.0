Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF92B06B30
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 03:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6673110E717;
	Wed, 16 Jul 2025 01:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="WzL1xQNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 603 seconds by postgrey-1.36 at gabe;
 Wed, 16 Jul 2025 01:34:16 UTC
Received: from mail-m81159.netease.com (mail-m81159.netease.com [47.88.81.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BB210E717
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 01:34:16 +0000 (UTC)
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes
 [58.22.7.114]) by smtp.qiye.163.com (Hmail) with ESMTP id 1c20f26cc;
 Wed, 16 Jul 2025 09:18:56 +0800 (GMT+08:00)
Message-ID: <9e6c432a-9bed-474c-afa9-fd6ada8bb8f8@rock-chips.com>
Date: Wed, 16 Jul 2025 09:18:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip: rk3399-typec-phy: Support
 mode/orientation switch
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-3-kernel@airkyi.com>
 <4dfed94c-665d-4e04-b527-ddd34fd3db8f@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <4dfed94c-665d-4e04-b527-ddd34fd3db8f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh0eSVZKSEpKS0pIQh5KHR1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
X-HM-Tid: 0a9810d0310c03abkunmd19fa1411423d24
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBg6LTo*FDE0NwlMMVFCFTc8
 KTUKCSlVSlVKTE5JTUlDTE9NS01JVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSExITTcG
DKIM-Signature: a=rsa-sha256;
 b=WzL1xQNdru/zKe4DMlBTqwjgA2IwGOyI3/txUXdcBAVE1KQqUbQT9JBMVDdMm8ZIMgaP0HN8jb4iceyiqmOwPb0XX7j6gmpr27mF8e13nD8gV8pFdhA9hTR5AW1FxVdoVWvT2k+f5qv827ZzKc29N2+W2JtkLU7e4ajVmc3kr0g=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=y9UGnpqAWUlGLKMTmekl851slDMZjV5j64meupx2I6w=;
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

On 2025/7/15 19:34, Krzysztof Kozlowski wrote:
> On 15/07/2025 13:24, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Add support for Type-C orientation and altmode switch.
>> The Type-C controller can be specified to handling switching.
> Please describe the hardware in details. Above sentences don't help me
> to understand this.

I will add more description in v2.


>
>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   .../bindings/phy/rockchip,rk3399-typec-phy.yaml    | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>> index 91c011f68cd0..a885c6893a90 100644
>> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>> @@ -43,6 +43,20 @@ properties:
>>       description:
>>         Phandle to the syscon managing the "general register files" (GRF).
>>   
>> +  orientation-switch:
>> +    description: Flag the port as possible handler of orientation switching
>> +    type: boolean
>> +
>> +  mode-switch:
>> +    description: Flag the port as possible handler of altmode switching
>> +    type: boolean
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description:
>> +      A port node to link the PHY to a TypeC controller for the purpose of
>> +      handling orientation switching.
>
> You are using usb-switch.yaml properties in phy node, which raises
> questions whether this is actually complete. It might be, but commit msg
> is so vague that I have doubts.
>
> Also, why only one port?
>
> Or wait... you already have ports! two of them. This needs to stop, why
> are you adding more?

Oh, I will try to reuse them. Will fix in v2.


>
> Best regards,
> Krzysztof
>
>
