Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88EA59547
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F6910E253;
	Mon, 10 Mar 2025 12:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M5VLUjbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0196910E253
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:55:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A21795C5D41;
 Mon, 10 Mar 2025 12:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9635C4CEE5;
 Mon, 10 Mar 2025 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741611317;
 bh=FKHx3hmkGeOEpcIh5h+GlCH3fd6fGXZt7R80JKQ3PbE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M5VLUjbtCcPc3+4syWE7Ssk/AZZiJLFZnMCE+OaJZyOKl7MlddliiJ63d15Z6zNhW
 lKwu7Wdx2YNX54StXvzA2gKiUFUWN2e2c/kT38vBPDcKBiC+ewiGWPps40YzPSmRA3
 P1Dclzjg92vnb9ZmUGj81xEKoWyJYMFH+E+p5Pa2zMYVVykB70Ikl6xFbp9VOAMN+7
 xD361vB54s7aY7fYtQv8anbA8n8l2fyBbmbTJ3vVC72YxOfeCM0NabAMWwMmYM9fe1
 WAA+NmjQ0feMmXDziYxyrurcdmucpAu86M2n+ALEybFcWXTyM1iG0FwVrcXc8Z2QXh
 DuWcQDOHK6GqQ==
Message-ID: <6f87918b-b4ca-4404-8f1e-e1100190c0f6@kernel.org>
Date: Mon, 10 Mar 2025 13:55:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] dt-bindings: gpu: v3d: Add SMS to the registers'
 list
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <4d224fc2-d077-47aa-8b52-edba30c62d19@igalia.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/03/2025 12:57, Maíra Canal wrote:
>>
>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>> ---
>>>   .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 60 ++++++++++++++++++++--
>>>   1 file changed, 55 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>> index dc078ceeca9ac3447ba54a7c8830821f0b2a7f9f..c0caee055e8c18dbcac0e51aa192951996545695 100644
>>> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>> @@ -27,15 +27,12 @@ properties:
>>>         - description: core0 register (required)
>>>         - description: GCA cache controller register (if GCA controller present)
>>>         - description: bridge register (if no external reset controller)
>>> +      - description: SMS register (if SMS controller present)
>>
>> This lists five items, but you say you have max 4?
> 
> V3D 3.1 uses hub, core0, gca, and bridge (optional)
> V3D 4.1 and 4.2 uses hub, core, and bridge (optional)
> V3D 7.1 uses hub, core0, sms, and bridge (optional)
> 
> Therefore, for a given DT, you will have 4 items max.

And how many items do you have here?

> 
>>
>>>       minItems: 2
>>>   
>>>     reg-names:
>>> -    items:
>>> -      - const: hub
>>> -      - const: core0
>>> -      - enum: [ bridge, gca ]
>>> -      - enum: [ bridge, gca ]
>>>       minItems: 2
>>> +    maxItems: 4
>>
>> So here 4, but earlier 5? These must come in sync.
> 
> I added maxItems for reg in the allOf section.

I don't think you answer the comments. I said you listed earlier 5 items
and then you answered with saying devices have 4 items. Here I said
these properties must be synced and you said why you added maxItems...
Not related, read again the feedback.


> 
>>
>>>   
>>>     interrupts:
>>>       items:
>>> @@ -60,6 +57,59 @@ required:
>>>   
>>>   additionalProperties: false
>>>   
>>> +allOf:
>>
>> This goes above additionalProperties.
> 
> Got it.
> 
>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - brcm,2711-v3d
>>> +              - brcm,7278-v3d
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          minItems: 2
>>> +          maxItems: 3
>>> +        reg-names:
>>> +          items:
>>> +            - const: hub
>>> +            - const: core0
>>> +            - const: bridge
>>
>> Again un-synced lists.
> 
> Sorry, what do you mean by un-synced lists?

xxx and xxx-names must have the same constraints. They do not have here.
You have two different constraints and you can test your DTS to see that.

> 
>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: brcm,2712-v3d
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          minItems: 3
>>> +          maxItems: 4
>>> +        reg-names:
>>> +          items:
>>> +            - const: hub
>>> +            - const: core0
>>> +            - enum: [ bridge, sms ]
>>> +            - enum: [ bridge, sms ]
>>> +          minItems: 3
>>
>> Why is this flexible?
> 
> I cannot guarantee the order and bridge is optional.

Hm? You must guarantee the order and I do not understand why this needs
some sort of exception from all other bindings that only here you cannot
guarantee the order.


Best regards,
Krzysztof
