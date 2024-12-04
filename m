Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721C69E440E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 20:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAD110E55A;
	Wed,  4 Dec 2024 19:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="dIH/ijqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028CE10E556
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 19:06:05 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7b676152a86so134404085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 11:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733339165; x=1733943965;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rwAMqF5C2/XSwGsn6tg9idQ+gKok1OrDZ/TQYQQC3ME=;
 b=dIH/ijqNdkAuAR96D7aSZBrkWisDs9HiTlYBgmHW72hcBIwORXgilSIARKc23wnj93
 FGzGj43ZJvnASjloCSEqRe/Nxp8kre+0vYadwccBPr5pptIvsWoVKreDm7IkVZ7fKeWS
 o4/gNtexZ8wk9//gH01DokkfMYx5AlnDlIShc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733339165; x=1733943965;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwAMqF5C2/XSwGsn6tg9idQ+gKok1OrDZ/TQYQQC3ME=;
 b=AiVpAKCINooxVZmSHBppTMBlUjt/99hWaa+E6RCCNFeukjlHk5Am1psbeYVMkEncFk
 80creoipisbeaZn/khNkH5X8K2bQCW5RJM3b7lAmYGDbQDPGy7OlnINdpR2EMcNaLkVk
 HkRDr0oEu3BKGhIG0XNQ6MPwBEsgIFRjDSLv/aaQK/gi9fO9cAKZDBiuDBbw1oj8noPX
 ryRGWrwZuJLXYbC/7K71Krsg3/WuzxuP0p6nEXbf7mgMd7gjyZH4BdtyQMboT2FdCKxm
 YQlb+Q/4p9JySyl1TdokrvjaNIFBBHIxH193yWyZKbloAhdOXwsUXMpydU+2No5qbcNk
 dOPw==
X-Gm-Message-State: AOJu0Yzk2eeZ+xOt0engj15PT8PlnTaBhZdqvQRBVugpILYde+hdkwyk
 0sj3Ii/Iwo/UBIySpkvVBsUGEv1vQPPPq0jvNWT9/0XwAd07r0niNfuX8yvTpw==
X-Gm-Gg: ASbGncv/nexSsAKY+ZNqYp/wAAsoJn5jQG7A2hg4ym4qGfX61n4XoCJoJwvWUg1faZY
 DnfpxxQjBEHwJs/XyUC9qCSsSlPjJvWRa38EgDJ3Nm9Zcl6PIS/sPiDd74JFKxXBVRRsmYcArkL
 SAQ7uD0kxvMrDOzDRcOROHOFo5fNEydcIiKnGXeFagyizRRHfHSuNlBTvy1M6FHnefZrPdm9BCJ
 G3+cAsFg2Cjqg00YcmqmR+x8SBnzTD9jbb8zxr+rw/fOFiJosdZ0J1Axoap74EjyLchXKRv2K4e
 IRhf8jYnb6VrNw==
X-Google-Smtp-Source: AGHT+IET8ru0K2M3tO3OOrXNHAiQ22hdOskTrfOZXT2O7Z5zjNnzqqS/g1Ime/BQv4SnXZ/y8604qA==
X-Received: by 2002:a05:620a:6005:b0:7b1:48d1:574d with SMTP id
 af79cd13be357-7b6b4185bdfmr97267185a.8.1733339164891; 
 Wed, 04 Dec 2024 11:06:04 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6849aac82sm635574085a.94.2024.12.04.11.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 11:06:04 -0800 (PST)
Message-ID: <5b36a3c7-f691-49e5-a4c6-803ddccdd5ea@broadcom.com>
Date: Wed, 4 Dec 2024 11:05:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-gpio@vger.kernel.org
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-4-fac67cc2f98a@raspberrypi.com>
 <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>
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
In-Reply-To: <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/2/24 07:20, Krzysztof Kozlowski wrote:
> On 02/12/2024 15:31, Dave Stevenson wrote:
>> Fixes up errors on HDMI and interrupt controllers that weren't
> 
> What errors? I can't find anything in the commit. Describe the error.
> 
>> noticed before merging.
>>
>> Fixes: de9bc2dba3db ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> ---
>>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> index 39305e0869ec..f42fad2d8b37 100644
>> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> @@ -336,7 +336,7 @@ ddc1: i2c@7d508280 {
>>   			#size-cells = <0>;
>>   		};
>>   
>> -		bsc_irq: intc@7d508380 {
>> +		bsc_irq: interrupt-controller@7d508380 {
> 
> 
> Do not mix cleanups with bugfixes.
> 
> BTW, do not mix DTS to DRM. DRM has its own development style. DTS
> *cannot* be merged there, so combining these series is not welcomed and
> leads to issues (like DRM applying DTS!).

That is not what was done, I took the DTS patches via the Broadcom ARM 
SoC tree, as I usually do, unless someone tells me otherwise.

We got a number of DTS warnings after I took Dave's patches so I asked 
for those to be fixed, as it turns out there are binding and DTS fixes.

I intend to squash these fixes with their original commit, so all of 
those commit messages will be discarded, they are only meant to be 
transitional.
-- 
Florian
