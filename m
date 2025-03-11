Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF5A5D23B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 23:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B358C10E2C8;
	Tue, 11 Mar 2025 22:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JmzRFW+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6C210E2C8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 22:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BFgeDQs7T81DuVwZSrA2gicEi650fh+L/fGa0KPyxlI=; b=JmzRFW+xH12FRytGOW/Majhs4m
 nczpqJjm0wg3oCPgTZeUFHopI7oc19kvP8pWF81GmP05h3epoGDFh4fKlgGr8Jpg9U5g4q5NAveh6
 aSA6kt3qanUZJ90BUDJPuiX3BQnvGu+ao3/KeeS7UQRWbZps7AvbXxqXaWszfg3Q+ImvqTLKT5M1j
 mEFTjuvlk2KkZziJy6yEPbyWWBv9FB3SryLTzEcFbxK8Jny9CyKNgDWjzJfupBFsP/i0uBZZSbnv0
 gno3sFM+qVwpVJdgzhX4qED/Hd0DobpyxfSFl6pVMm7uzv1oMGPsIQHAivqwkxWT1Qt+X2P/HhqRh
 9G13OJww==;
Received: from [143.107.224.66] (helo=[172.25.74.207])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ts7iD-007I6Q-Sl; Tue, 11 Mar 2025 23:04:40 +0100
Message-ID: <7324785d-8af9-48b4-b9c6-55ac22c82426@igalia.com>
Date: Tue, 11 Mar 2025 19:05:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] dt-bindings: gpu: v3d: Add SMS register to BCM2712
 compatible
To: Rob Herring <robh@kernel.org>
Cc: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
References: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
 <20250311-v3d-gpu-reset-fixes-v3-5-64f7a4247ec0@igalia.com>
 <20250311202359.GA54828-robh@kernel.org>
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
In-Reply-To: <20250311202359.GA54828-robh@kernel.org>
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

Hi Rob,

On 3/11/25 17:23, Rob Herring wrote:
> On Tue, Mar 11, 2025 at 03:13:47PM -0300, Maíra Canal wrote:
>> V3D 7.1 exposes a new register block, called V3D_SMS. As BCM2712 has a
>> V3D 7.1 core, add a new register item to its compatible. Similar to the
>> GCA, which is specific for V3D 3.3, SMS is optional and should only be
>> added for V3D 7.1 variants (such as brcm,2712-v3d).
> 
> Based on the schema, that is not what optional means for bindings.
> Optional is within a specific compatible, not present for one compatible
> and not present for another compatible.

Sorry for the poor writing! I'll improve it in the next version.

> 
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>> index 141f2ed540bb4ddb85a933d7d44a4078c386ba39..7349347da1c0034a8849deaa6d64dde6d9d5a81a 100644
>> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>> @@ -57,7 +57,6 @@ allOf:
>>             contains:
>>               enum:
>>                 - brcm,2711-v3d
>> -              - brcm,2712-v3d
>>                 - brcm,7278-v3d
>>       then:
>>         properties:
>> @@ -71,6 +70,27 @@ allOf:
>>               - const: hub
>>               - const: core0
>>               - const: bridge
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: brcm,2712-v3d
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: hub register (required)
>> +            - description: core0 register (required)
>> +            - description: SMS register (required)
> 
> minItems tells us these are all 'required'.
> 
>> +            - description: bridge register (if no external reset controller)
>> +          minItems: 3
>> +        reg-names:
>> +          items:
>> +            - const: hub
>> +            - const: core0
>> +            - const: sms
>> +            - const: bridge
> 
> This is an ABI change because previously the 3rd entry was bridge and
> you moved it. Put new entries on the end to keep compatibility. If
> there's no users yet, then that's fine, but the commit message needs to
> say that.
> 

Again, I'm sorry about the naive question, but "bridge" is an optional
register. AFAIU if I add "sms" in the end, I won't be able to make
"bridge" optional. Am I missing something?

Initially, I thought about using "enum: [ bridge, sms ]", but from
Krzysztof’s feedback on v2, I'm not sure if it is the correct approach.

Thanks for your review!

Best Regards,
- Maíra

>> +          minItems: 3
>>     - if:
>>         properties:
>>           compatible:
>>
>> -- 
>> Git-154)
>>

