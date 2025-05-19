Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DAABB57B
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E5C10E378;
	Mon, 19 May 2025 07:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Ka8twIly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 19 May 2025 07:01:44 UTC
Received: from mail-m21469.qiye.163.com (mail-m21469.qiye.163.com
 [117.135.214.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66E110E370
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 07:01:44 +0000 (UTC)
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes
 [58.22.7.114]) by smtp.qiye.163.com (Hmail) with ESMTP id 1587f7efd;
 Mon, 19 May 2025 14:56:29 +0800 (GMT+08:00)
Message-ID: <632f9f4d-ec0f-4512-a153-d2abfd9f6841@rock-chips.com>
Date: Mon, 19 May 2025 14:56:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250519012632.94-1-kernel@airkyi.com>
 <20250519012632.94-3-kernel@airkyi.com>
 <20a565da-296c-4920-b962-e9de9af464d9@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20a565da-296c-4920-b962-e9de9af464d9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUoaHlZOQk1KQxlMSktIH0lWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96e754661603aekunm1587f7efd
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAg6LBw5FzE0Ii4jMSsLPxlL
 MxAKCzpVSlVKTE9MTUhMTEJNQk1JVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBT01NSTcG
DKIM-Signature: a=rsa-sha256;
 b=Ka8twIlywrsVRoj8joZuMcW3eNbHX7gY7ch+iU1OHqX+6+7zslvXArine9mFteoTl/apcyN/gJRi0rs4lA8aCiHKEcxuT/dJ7AIfildpe4TLr1kzqyGoOPdKAdnX7qs7DB+0IGfmX/oWgPABuzmw66/CvdowapfJaSyrpYJzR+0=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=eU+WAthWlgyCACOPm0qsanWlkKCLEJIXdLnn+HPfHms=;
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

On 2025/5/19 14:16, Krzysztof Kozlowski wrote:
> On 19/05/2025 03:26, Chaoyi Chen wrote:
>> +maintainers:
>> +  - Andy Yan <andy.yan@rock-chip.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +  - Sandy Huang <hjc@rock-chips.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/sound/dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: rockchip,rk3399-cdn-dp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: DP core work clock
>> +      - description: APB clock
>> +      - description: SPDIF interface clock
>> +      - description: GRF clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core-clk
>> +      - const: pclk
>> +      - const: spdif
>> +      - const: grf
>> +
>> +  extcon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      maxItems: 1
>> +    maxItems: 2
> Instead of this, list the items. Old binding said only "specifier", so
> this is technically a change, which should be explained in commit msg.

Will fix in v5.


>
>> +    description:
>> +      List of phandle to the extcon device providing the cable state for the DP PHY.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    items:
>> +      maxItems: 1
>> +    maxItems: 2
>> +    description: |
>> +      List of phandle to the PHY device for DP output.
>> +      RK3399 have two DP-TPYEC PHY, specifying one PHY which want to use,
>> +      or specify two PHYs here to let the driver determine which PHY to use.
>
> You do not allow one phy, so your description is not accurate. OTOH,
> original binding did not allow two phandles, so that's another change in
> the binding. You need to document all changes done to the binding in the
> commit msg.

Oh, the original binding example use two phandles. I think only one PHY 
can also pass the dtb check here, or maybe I'm missing something else?


>
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input of the CDN DP
>> +        properties:
>> +          endpoint@0:
>> +            description: Connection to the VOPB
>> +          endpoint@1:
>> +            description: Connection to the VOPL
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output of the CDN DP
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 4
>> +
>> +  reset-names:
>> +    items:
>> +      - const: spdif
>> +      - const: dptx
>> +      - const: apb
>> +      - const: core
>> +
>> +  rockchip,grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to GRF register to control HPD.
>> +
>> +  "#sound-dai-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - phys
>> +  - ports
>> +  - resets
>> +  - reset-names
>> +  - rockchip,grf
>
> sound-dai-cells was a required property.
>
Okay, will add in v5.

