Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD65A5A463
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 21:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219B210E4D7;
	Mon, 10 Mar 2025 20:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YxWKLKkd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD97C10E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 20:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HLLjr37JFfsgHE45pv/RVp8Xm1ReKxZjl7TJMhTCiiQ=; b=YxWKLKkd5y8wMfA54BDxyolkIj
 4uWon87tT8OoMG6O6Em2BNKsKvzxYb150CrJtl4rlSoe82iMyyXKUQvrvdUZoWNJ9dfbYCiwC1HHE
 Otcv4Swj10CWUvDWfPVQYWJPpq3D6h+chSUBjNkgIdf8lwjzeO2PXKMT301VYU1yb/BA1FP51DnTL
 bQd+gUGHtRPWJODdSzx10IjCeUE39Aaz3W5ofCyQCoV9Xm2bTIXeLaJsNzKv81GNWI0SqO+FFp4uF
 FGSvFnfRh/ou/0eiMluLuQKxdb4PD3zUPQ5HtiGcElngbaNylE4vcF9mCMiDMafqh19AxrceUYDkA
 StSUBYyg==;
Received: from [143.107.183.66] (helo=[172.21.12.174])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1trjOT-006dbp-N4; Mon, 10 Mar 2025 21:06:39 +0100
Message-ID: <4c658ba0-aa3b-4f8c-b1eb-fc7993a33ffa@igalia.com>
Date: Mon, 10 Mar 2025 17:07:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] dt-bindings: gpu: v3d: Add SMS to the registers'
 list
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, devicetree@vger.kernel.org
References: <20250308-v3d-gpu-reset-fixes-v2-0-2939c30f0cc4@igalia.com>
 <20250308-v3d-gpu-reset-fixes-v2-4-2939c30f0cc4@igalia.com>
 <20250310-calculating-flat-cuttlefish-4c9fc2@krzk-bin>
 <4d224fc2-d077-47aa-8b52-edba30c62d19@igalia.com>
 <6f87918b-b4ca-4404-8f1e-e1100190c0f6@kernel.org>
 <2bc573c6-e44f-441b-9b13-baa7df64a641@igalia.com>
 <130b6c9e-9e11-433c-881f-1a7ea8b0f86e@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <130b6c9e-9e11-433c-881f-1a7ea8b0f86e@kernel.org>
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

Hi Krzysztof,

On 3/10/25 14:34, Krzysztof Kozlowski wrote:
> On 10/03/2025 14:15, Maíra Canal wrote:
>> Hi Krzysztof,
>>
>> On 3/10/25 09:55, Krzysztof Kozlowski wrote:
>>> On 10/03/2025 12:57, Maíra Canal wrote:
>>>>>
>>>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>>>> ---
>>>>>>     .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 60 ++++++++++++++++++++--
>>>>>>     1 file changed, 55 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>>>>> index dc078ceeca9ac3447ba54a7c8830821f0b2a7f9f..c0caee055e8c18dbcac0e51aa192951996545695 100644
>>>>>> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>>>>> @@ -27,15 +27,12 @@ properties:
>>>>>>           - description: core0 register (required)
>>>>>>           - description: GCA cache controller register (if GCA controller present)
>>>>>>           - description: bridge register (if no external reset controller)
>>>>>> +      - description: SMS register (if SMS controller present)
>>>>>
>>>>> This lists five items, but you say you have max 4?
>>>>
>>>> V3D 3.1 uses hub, core0, gca, and bridge (optional)
>>>> V3D 4.1 and 4.2 uses hub, core, and bridge (optional)
>>>> V3D 7.1 uses hub, core0, sms, and bridge (optional)
>>>>
>>>> Therefore, for a given DT, you will have 4 items max.
>>>
>>> And how many items do you have here?
>>>
>>>>
>>>>>
>>>>>>         minItems: 2
>>>>>>     
>>>>>>       reg-names:
>>>>>> -    items:
>>>>>> -      - const: hub
>>>>>> -      - const: core0
>>>>>> -      - enum: [ bridge, gca ]
>>>>>> -      - enum: [ bridge, gca ]
>>>>>>         minItems: 2
>>>>>> +    maxItems: 4
>>>>>
>>>>> So here 4, but earlier 5? These must come in sync.
>>>>
>>>> I added maxItems for reg in the allOf section.
>>>
>>> I don't think you answer the comments. I said you listed earlier 5 items
>>> and then you answered with saying devices have 4 items. Here I said
>>> these properties must be synced and you said why you added maxItems...
>>> Not related, read again the feedback.
>>
>> I'm sorry, I don't usually write DTBs. I believe what I need is to
>> specify the reg items for each compatible, right?
> 
> You need to list four items in 'reg' and last items' description would
> need to describe two different sets.
> 
> And commit msg must explain why now this device needs to use sms, not
> gca. Why you cannot use the gca range instead of sms? So many questions.

I believe I understood the issue now. From my point of view, the idea is
preserving the semantics of the register bank names. GCA is a cache
controller that it is only available in V3D 3.3 (so, only brcm,7268-v3d
has it). SMS is a power controller that it is only available in V3D 7.1
(so, only brcm,2712-v3d has it).

Each one of those compatibles represent different V3D generations (3.3,
4.1, 4.2, 7.1).

 From my understanding, I'm keeping the ABI preserved, as brcm,7268-v3d
needs to have a GCA register (otherwise, you won't be able to flush the
cache) and brcm,2711-v3d doesn't even have this piece of hardware.

I understand that now I'm imposing per-compatible restrictions that
didn't exist in the spec, but the new restrictions are compatible to the
hardware specification. I'd like to understand if I can:

1. Use two register items (gca and sms) to preserve the semantics of the
register names.

2. Can I add per-compatible restrictions to the DT even if the original
bindings didn't do it? If not, can I just add a new register to the
register list? Like:

    reg-names:
      items:
        - const: hub
        - const: core0
-      - enum: [ bridge, gca ]
-      - enum: [ bridge, gca ]
+      - enum: [ bridge, gca, sms ]
+      - enum: [ bridge, gca, sms ]
+      - enum: [ bridge, gca, sms ]
      minItems: 2

Best Regards,
- Maíra

> 
>>
>>>
>>>
>>>>
>>>>>bcm
>>>>>>     
>>>>>>       interrupts:
>>>>>>         items:
>>>>>> @@ -60,6 +57,59 @@ required:
>>>>>>     
>>>>>>     additionalProperties: false
>>>>>>     
>>>>>> +allOf:
>>>>>
>>>>> This goes above additionalProperties.
>>>>
>>>> Got it.
>>>>
>>>>>
>>>>>> +  - if:
>>>>>> +      properties:
>>>>>> +        compatible:
>>>>>> +          contains:
>>>>>> +            enum:
>>>>>> +              - brcm,2711-v3d
>>>>>> +              - brcm,7278-v3d
>>>>>> +    then:
>>>>>> +      properties:
>>>>>> +        reg:
>>>>>> +          minItems: 2
>>>>>> +          maxItems: 3
>>>>>> +        reg-names:
>>>>>> +          items:
>>>>>> +            - const: hub
>>>>>> +            - const: core0
>>>>>> +            - const: bridge
>>>>>
>>>>> Again un-synced lists.
>>>>
>>>> Sorry, what do you mean by un-synced lists?
>>>
>>> xxx and xxx-names must have the same constraints. They do not have here.
>>> You have two different constraints and you can test your DTS to see that.
>>   >
>>
>> I used `make dt_binding_check` to test it and it didn't catch any
>> errors.
> 
> So change the example to have one list with two items and second list
> with three items. Is it correct DTS? No. Does this pass tests? Yes.
> 
>>
>>>>
>>>>>
>>>>>> +  - if:
>>>>>> +      properties:
>>>>>> +        compatible:
>>>>>> +          contains:
>>>>>> +            const: brcm,2712-v3d
>>>>>> +    then:
>>>>>> +      properties:
>>>>>> +        reg:
>>>>>> +          minItems: 3
>>>>>> +          maxItems: 4
>>>>>> +        reg-names:
>>>>>> +          items:
>>>>>> +            - const: hub
>>>>>> +            - const: core0
>>>>>> +            - enum: [ bridge, sms ]
>>>>>> +            - enum: [ bridge, sms ]
>>>>>> +          minItems: 3
>>>>>
>>>>> Why is this flexible?
>>>>
>>>> I cannot guarantee the order and bridge is optional.
>>>
>>> Hm? You must guarantee the order and I do not understand why this needs
>>> some sort of exception from all other bindings that only here you cannot
>>> guarantee the order.
>>
>> I'm trying to keep backwards compatibility. This binding exists for many
>> years and it always used "enum: [ bridge, gca ]".
> 
> But it is now sms, not gca,, so I do not see how the ABI is preserved.
> 
> Best regards,
> Krzysztof

