Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06448A62E53
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 15:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B2810E034;
	Sat, 15 Mar 2025 14:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="f3tEPdAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6901F10E034
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 14:44:11 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-72bc3987a05so687264a34.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1742049851; x=1742654651;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6T85d8d8ZYjCBGjp7D0o39PKUN1tyOYBbRPk0L4DYrU=;
 b=f3tEPdAzp1Ive7KnFnA9nuLlTIgr216PLSTSTO50tbe/8E3qJCrfN12v/EGh+KB+87
 pLcwZlhru/wZDx9iayKDH9x5yZ4BAHioEO2EUTXYetdxV5MbyBIsXBRABf2XkKfoBeu3
 cq9C9T3zSkst3Zzv3IJWBVlhfb4jDeqv1BDPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742049851; x=1742654651;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6T85d8d8ZYjCBGjp7D0o39PKUN1tyOYBbRPk0L4DYrU=;
 b=r2OZwsoILhLfS3AYZiJa+lzR9HEu8eS5Vxu1B+oJXQ1B5uRR1pnlFlMcXqaaVG6L/P
 w16HrGD7bpBifyUJTCAuV0vyuY7wO7/P0/aWo63SHRcEdNQr5+z3b5turMXdvBViKxSd
 dqGddH/WYQ0gdqXC893wjHi7q81fpN6l7RfHWSP5uATQqHnf+v6OyBIDD5Fb0E5NQoxu
 5pu+EFlHE2m3vZdUMjEjNdYJ7BKUo9u7LDhvfa1NgSM+teUUOazOjRddMkjLA+ZvHnOt
 lbqi4O1Fnkg9yS2wI6ir+mW0Ve6AtDuW4wysrEHd368vjWrr9JKLDHl5FWI9tsvF9y5Y
 yEHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDiZ6e0wkPYhdtbb0pl7ykwA+oL8F7mDBARX1qGd0UsDg9pTVJZxyvd6Y88FXlrPNvSK0KELuTWvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSA7uZhCdhHhlZYQJwEVZP52UmeikD10ZwAT3LXBzu0AGDlKJu
 AVVPYKjfUoB1Y0rR8ED1jKoc2Ub/1LRqOApfk3S98pmvlzlRokI/cmf3C+746w==
X-Gm-Gg: ASbGncvDjd84mTKj6NxTbHdPYSez4NUPEp5MTrrqqqPFIdM/KKZqqUOZTRPdYJrGEKH
 teOMFnCXJdubC/Am0fcJclns0be9uFo07aFHM28blPlwpEv2qKRgxid9D8LyJJI3b2ovj1dFIB+
 sXTByfxvldVzjNzgwfEGBkUAlph2IBjwdeB0udH9iuXr/Dbf+946gDz287f8B/AsRp84ylXDuCC
 TQdMRwKPqx18H8ZfoXVk4SI53osFhc6o0jaYwn462GcwPIP1YCoAMiDwUlVcISMaqjqdXPurXtg
 fU1MBspSnM3schybOlxWkY4PDKkrNmIH8dmf1s9vr7j2mWt+zhftddZ8T8Yc+oUTi70fdMTH9TP
 U7gyKVb7bs2XMF5bTKRI=
X-Google-Smtp-Source: AGHT+IH5qYEDmreB7kt+jEHjwiSU85jBzFVSAdXS2c0XkzxLhcKRY0iFk1+jrQAKc/kSzyZoJpuw6g==
X-Received: by 2002:a9d:5e09:0:b0:727:20db:dd5b with SMTP id
 46e09a7af769-72bb18ae5efmr5528461a34.2.1742049850655; 
 Sat, 15 Mar 2025 07:44:10 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72bb274e99csm1018613a34.42.2025.03.15.07.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Mar 2025 07:44:09 -0700 (PDT)
Message-ID: <825d1133-122c-4c39-8041-684e77e24ce0@broadcom.com>
Date: Sat, 15 Mar 2025 07:44:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] dt-bindings: gpu: v3d: Add per-compatible register
 restrictions
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com,
 Maxime Ripard <mripard@kernel.org>
References: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
 <20250313-v3d-gpu-reset-fixes-v4-4-c1e780d8e096@igalia.com>
 <3fbaa5ed-e70f-4293-99d0-faf22f3c4adf@kernel.org>
 <701c71cb-47a6-4970-bd21-ae61cf971f7c@igalia.com>
 <0edcd27d-64a6-494e-bc81-5a9ad89d4d90@gmx.net>
 <e3d70d16-8701-4096-ba4b-e21cb1da7905@igalia.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <e3d70d16-8701-4096-ba4b-e21cb1da7905@igalia.com>
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



On 3/15/2025 5:17 AM, Maíra Canal wrote:
> Hi Stefan,
> 
> On 15/03/25 06:52, Stefan Wahren wrote:
>> Hello,
>>
>> Am 13.03.25 um 20:04 schrieb Maíra Canal:
>>> +Cc Stefan
>>>
>>> Hi Krzysztof,
>>>
>>> On 13/03/25 12:03, Krzysztof Kozlowski wrote:
>>>> On 13/03/2025 15:43, Maíra Canal wrote:
>>>>> In order to enforce per-SoC register rules, add per-compatible
>>>>> restrictions. V3D 3.3 (represented by brcm,7268-v3d) has a cache
>>>>> controller (GCA), which is not present in other V3D generations.
>>>>> Declaring these differences helps ensure the DTB accurately reflect
>>>>> the hardware design.
>>>>>
>>>>> While not ideal, this commit keeps the register order flexible for
>>>>> brcm,7268-v3d with the goal to keep the ABI backwards compatible.
>>>>>
>>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>>> ---
>>>>>   .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 73
>>>>> ++++++++++++++++++----
>>>>>   1 file changed, 61 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>>>> b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>>>> index
>>>>> dc078ceeca9ac3447ba54a7c8830821f0b2a7f9f..9867b617c60c6fe34a0f88a3ee2f581a94b69a5c
>>>>> 100644
>>>>> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>>>> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> 
> [...]
> 
>>>>> +  - if:
>>>>> +      properties:
>>>>> +        compatible:
>>>>> +          contains:
>>>>> +            const: brcm,7268-v3d
>>>>> +    then:
>>>>> +      properties:
>>>>> +        reg:
>>>>> +          items:
>>>>> +            - description: hub register
>>>>> +            - description: core0 register
>>>>> +            - description: GCA cache controller register
>>>>> +            - description: bridge register (if no external reset
>>>>> controller)
>>>>> +          minItems: 3
>>>>> +        reg-names:
>>>>> +          items:
>>>>> +            - const: hub
>>>>> +            - const: core0
>>>>> +            - enum: [ bridge, gca ]
>>>>
>>> > So GCA is always there? Then this should be just 'gca'. Your list for
>>>
>>> GCA is always there for V3D 3.3, therefore it is always there for
>>> brcm,7268-v3d.
>>>
>>>> 'reg' already says that third item must be GCA. I understand that 
>>>> you do
>>>> not want to affect the ABI, but it already kind of is with enforcing 
>>>> GCA
>>>> in 'reg'.
>>>
>>> I'm adding Stefan to the loop as he was the one that converted this DT
>>> binding to YAML. Stefan, could you share your thoughts about breaking
>>> the ABI for BCM7268? We would enforce the following order: hub, core0,
>>> bridge, and gca.
>> Phew, that was over 4 years ago. To be honest, my only motivation back
>> then was to prepare support for the Raspberry Pi 4 (BCM2711). I did it
>> all in my spare time and never had access to any Broadcom documents. I
>> have no idea about all the other BCM chips, so a possible break of the
>> ABI for the BCM7268 was an accident. I don't know if Florian Fainelli or
>> Maxime Ripard can help here.
> 
> Thanks for providing your feedback! I did my diligence and now I know
> which SoCs have each register bank. For BCM2711, BCM2712, and BCM7278,
> the ABI will be preserved. As for BCM7268, I plan to enforce the order
> specified in the current DT binding example: hub, core0, bridge, and
> gca.

For 7268, if we were to enforce by ascending address/offset, the order 
ought to be hub, bridge, gca, and core0 (all are present). In practice I 
don't think this matters at all because the upstream v3d driver is not 
used on those STB chips at all.
-- 
Florian

