Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B9ABB7CB
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507A110E19B;
	Mon, 19 May 2025 08:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="ZPU7PwL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Mon, 19 May 2025 08:49:34 UTC
Received: from mail-m15577.qiye.163.com (mail-m15577.qiye.163.com
 [101.71.155.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F2210E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:49:32 +0000 (UTC)
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes
 [58.22.7.114]) by smtp.qiye.163.com (Hmail) with ESMTP id 158ccae3f;
 Mon, 19 May 2025 16:44:14 +0800 (GMT+08:00)
Message-ID: <6dac10df-d410-4d52-8711-4c8046f90fbd@rock-chips.com>
Date: Mon, 19 May 2025 16:43:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250519012632.94-1-kernel@airkyi.com>
 <20250519012632.94-3-kernel@airkyi.com>
 <20a565da-296c-4920-b962-e9de9af464d9@kernel.org>
 <632f9f4d-ec0f-4512-a153-d2abfd9f6841@rock-chips.com>
 <20250519-tall-glistening-quokka-9ffa6f@kuoka>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20250519-tall-glistening-quokka-9ffa6f@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMeT1ZLThpIHxhJHkgdTUpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96e7b7094a03aekunm158ccae3f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCo6HSo5LjExDC0zLio4FRhI
 STMwCS5VSlVKTE9MTU9PSU1KSEpDVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0pOTzcG
DKIM-Signature: a=rsa-sha256;
 b=ZPU7PwL+nAfueycpdY2yJue2tLZTRMoaiSKoIlGm+G9Xi5nboCuoO35Wc21TaIz7dmKHezIH5NNK7VX/AwNFNGs4VT9yz1RQ8ILaIY3w7ZNE2aSZPqay6utDnKSNSgECauwziW8cxvAKh6tB/lrJCpw5w5MseqaRQIiz8er641o=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=UN9mV4Ay8ghFsuFemLHGgtg/VXgBJG+F9kHs6DqrncA=;
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

On 2025/5/19 16:23, Krzysztof Kozlowski wrote:
> On Mon, May 19, 2025 at 02:56:03PM GMT, Chaoyi Chen wrote:
>> Hi Krzysztof,
>>
>> On 2025/5/19 14:16, Krzysztof Kozlowski wrote:
>>> On 19/05/2025 03:26, Chaoyi Chen wrote:
>>>> +maintainers:
>>>> +  - Andy Yan <andy.yan@rock-chip.com>
>>>> +  - Heiko Stuebner <heiko@sntech.de>
>>>> +  - Sandy Huang <hjc@rock-chips.com>
>>>> +
>>>> +allOf:
>>>> +  - $ref: /schemas/sound/dai-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - const: rockchip,rk3399-cdn-dp
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: DP core work clock
>>>> +      - description: APB clock
>>>> +      - description: SPDIF interface clock
>>>> +      - description: GRF clock
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core-clk
>>>> +      - const: pclk
>>>> +      - const: spdif
>>>> +      - const: grf
>>>> +
>>>> +  extcon:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    items:
>>>> +      maxItems: 1
>>>> +    maxItems: 2
>>> Instead of this, list the items. Old binding said only "specifier", so
>>> this is technically a change, which should be explained in commit msg.
>> Will fix in v5.
>>
>>
>>>> +    description:
>>>> +      List of phandle to the extcon device providing the cable state for the DP PHY.
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  phys:
>>>> +    items:
>>>> +      maxItems: 1
>>>> +    maxItems: 2
>>>> +    description: |
>>>> +      List of phandle to the PHY device for DP output.
>>>> +      RK3399 have two DP-TPYEC PHY, specifying one PHY which want to use,
>>>> +      or specify two PHYs here to let the driver determine which PHY to use.
>>> You do not allow one phy, so your description is not accurate. OTOH,
>>> original binding did not allow two phandles, so that's another change in
>>> the binding. You need to document all changes done to the binding in the
>>> commit msg.
>> Oh, the original binding example use two phandles. I think only one PHY can
> Example is not the binding, just an example.
>
>> also pass the dtb check here, or maybe I'm missing something else?
> You think or you tested it? What is the minItems value? 2, so even if
> this works it's rather a bug in dtschema.

Yes I tested it. Both of "phys = <&tcphy0_dp>", "phys = <&tcphy0_dp>, 
<&tcphy1_dp>" pass the dtb check.


>
> Also, inner maxItems:1 is not really correct. Why can't this work with
> different phy providers?

I'll see what other bindings do. Thanks for the clarification!

