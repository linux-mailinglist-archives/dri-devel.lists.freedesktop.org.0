Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2F9AB23A7
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 13:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352E410E0E3;
	Sat, 10 May 2025 11:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 09 May 2025 07:40:10 UTC
Received: from mail-m49248.qiye.163.com (mail-m49248.qiye.163.com
 [45.254.49.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158CC10E9CC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 07:40:09 +0000 (UTC)
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes
 [58.22.7.114]) by smtp.qiye.163.com (Hmail) with ESMTP id 147cae3e8;
 Fri, 9 May 2025 15:34:58 +0800 (GMT+08:00)
Message-ID: <5a4f6229-1450-4c96-bfac-5257f66b2ddf@rock-chips.com>
Date: Fri, 9 May 2025 15:34:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: display: rockchip: Convert
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
References: <20250509070247.868-1-kernel@airkyi.com>
 <20250509070247.868-3-kernel@airkyi.com>
 <ccf4b15a-8399-4a7f-ae40-d01d0975921c@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <ccf4b15a-8399-4a7f-ae40-d01d0975921c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUkfGVYYSUxJHhgdSBhLShpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96b3f8063203abkunm147cae3e8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M1E6Kgw*HDJWFQI4FToPDCIW
 Fx0aCUhVSlVKTE9NTExNSktPQkhMVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSEJOTzcG
DKIM-Signature: a=rsa-sha256;
 b=hJ7NikvuDJyHiU7TZoYgd87OzKAxhsDgv4cKFeiFgwAnYpwpLeSMndEsG6yjBhRVE4W7w8ioYZpdvRBjJX0LT/gbPHUp9B3ZkZA+9kh6jciL3KWKe7lrhHOr8J8qyQdAE0rM7L+7JAmxljZqr+wVdMoLy7f0nS6OQxx/RUC+BZE=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=BQYBVB8p8nqMgWuckxW3aKVVBX+ixBeiwRuXnWXYxag=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Sat, 10 May 2025 11:45:19 +0000
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

On 2025/5/9 15:11, Krzysztof Kozlowski wrote:
> On 09/05/2025 09:02, Chaoyi Chen wrote:
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
>> +    description:
>> +      Phandle to the extcon device providing the cable state for the DP PHY.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> Just phandle. If this is an array (but why?), you need maxItems for
> outer and inner dimensions.

I think it could be phandle or phandle-array. Since the RK3399 DP has 
two PHYs, if we put in two PHYs here, the driver will pick one PHY port 
that is already plugged into the DP for output. If we fill in only one 
PHY here, then output is only allowed on the corresponding PHY.

Will add restrictions and add more descriptions in v3.


>
>> +    description:
>> +      Phandle to the PHY device for DP output.
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
>> +
>> +additionalProperties: false
> Well, if you added dai-common $ref then this could have stayed as
> unevaluatedProperties, so you will allow names for the DAI as well.

Thanks for your clarification. Will fix in v3.


>
>
> Best regards,
> Krzysztof
>
>
