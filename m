Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D2A60066
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 20:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBDE10E919;
	Thu, 13 Mar 2025 19:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Htxt1zX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5B710E919
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2fLniOSY2zCra/pu7rqU9zlOAdGKZAl7RLky/QUsxQM=; b=Htxt1zX6GNYGasRq4piuMwdLZp
 4IaI70XSw0wUOS78kkdXZcT4bPJeRUkRbXb/tOcsYEBd0R5mRPqixEgbcmilXGlBgRBBUr2v4s6dJ
 D/au9ntrdb2cSsCLwEvvcGGF6G8xPBmOaUel/3VR7dzBuTJLu6I2jgRC4Qk9ndyUeQs3mUfVWTgtr
 rF+dhcRDWs6JTHSdYiVJIF8lFL3Y2RgEmQeYDfWXo2+E/pijNepesVygkchPaQA+mckeVmV00maKW
 6GU90Moe+qkYkXjN3epdvchTi/8TOva3N2TjbK3EqCJ15yG/avAzq/x5pQFsN7dVMcSKI/pLHzjNV
 iiD+IWrw==;
Received: from [189.7.87.170] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tsnqc-008IpU-Ci; Thu, 13 Mar 2025 20:04:08 +0100
Message-ID: <701c71cb-47a6-4970-bd21-ae61cf971f7c@igalia.com>
Date: Thu, 13 Mar 2025 16:04:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] dt-bindings: gpu: v3d: Add per-compatible register
 restrictions
To: Krzysztof Kozlowski <krzk@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
References: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
 <20250313-v3d-gpu-reset-fixes-v4-4-c1e780d8e096@igalia.com>
 <3fbaa5ed-e70f-4293-99d0-faf22f3c4adf@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <3fbaa5ed-e70f-4293-99d0-faf22f3c4adf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

+Cc Stefan

Hi Krzysztof,

On 13/03/25 12:03, Krzysztof Kozlowski wrote:
> On 13/03/2025 15:43, Maíra Canal wrote:
>> In order to enforce per-SoC register rules, add per-compatible
>> restrictions. V3D 3.3 (represented by brcm,7268-v3d) has a cache
>> controller (GCA), which is not present in other V3D generations.
>> Declaring these differences helps ensure the DTB accurately reflect
>> the hardware design.
>>
>> While not ideal, this commit keeps the register order flexible for
>> brcm,7268-v3d with the goal to keep the ABI backwards compatible.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 73 ++++++++++++++++++----
>>   1 file changed, 61 insertions(+), 12 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>> index dc078ceeca9ac3447ba54a7c8830821f0b2a7f9f..9867b617c60c6fe34a0f88a3ee2f581a94b69a5c 100644
>> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>> @@ -22,20 +22,10 @@ properties:
>>         - brcm,7278-v3d
>>   
>>     reg:
>> -    items:
>> -      - description: hub register (required)
>> -      - description: core0 register (required)
>> -      - description: GCA cache controller register (if GCA controller present)
>> -      - description: bridge register (if no external reset controller)
>> -    minItems: 2
> 
> Widest constraints always stay here, so you cannot remove minItems.
> 
>> +    maxItems: 4
> 
>>   
>>     reg-names:
>> -    items:
>> -      - const: hub
>> -      - const: core0
>> -      - enum: [ bridge, gca ]
>> -      - enum: [ bridge, gca ]
>> -    minItems: 2
> 
> Same problem.
> 
>> +    maxItems: 4
>>   
>>     interrupts:
>>       items:
>> @@ -58,6 +48,65 @@ required:
>>     - reg-names
>>     - interrupts
> 
> ...
> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: brcm,7268-v3d
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: hub register
>> +            - description: core0 register
>> +            - description: GCA cache controller register
>> +            - description: bridge register (if no external reset controller)
>> +          minItems: 3
>> +        reg-names:
>> +          items:
>> +            - const: hub
>> +            - const: core0
>> +            - enum: [ bridge, gca ]
> 
 > So GCA is always there? Then this should be just 'gca'. Your list for

GCA is always there for V3D 3.3, therefore it is always there for
brcm,7268-v3d.

> 'reg' already says that third item must be GCA. I understand that you do
> not want to affect the ABI, but it already kind of is with enforcing GCA
> in 'reg'.

I'm adding Stefan to the loop as he was the one that converted this DT
binding to YAML. Stefan, could you share your thoughts about breaking
the ABI for BCM7268? We would enforce the following order: hub, core0,
bridge, and gca.

> 
> I anyway do not understand why 'gca' or 'bridge' are supposed to be
> optional. Does the given SoC differ between boards? What is the external
> reset controller here? External like outside of SoC?

TBH I never saw BCM7268 or BCM7278 in the wild, but you are correct,
"bridge" shouldn't change for the same SoC. I'll do my diligence and
research more about those SoCs.

Best Regards,
- Maíra

> 
> Best regards,
> Krzysztof

