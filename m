Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BBD690308
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1334A8924F;
	Thu,  9 Feb 2023 09:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD7A10E977
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:15:38 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E48966020B9;
 Thu,  9 Feb 2023 09:15:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675934137;
 bh=8edIGnmtJ1NrcW68pSHJQfhqO7Od8cz1RPWn+l0cH7g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e/Ni+IP7bUf1+wNovwd5vyh4UKNhtU+KHCLfOlNd4MqQoE7qe1vzU3cT6UBUHklbK
 0Wgwaea/4bQV139qiPB4PxTFgoEf8PVHzpNJkKztb5sdcSAOTmxs5kturOk/S211Uc
 4DImxXdQqRJbFFc4vfuBd8R88sTPfi9XvNOxKrSZQDjGAMV6WwoaFAJFC2eILgj+0Z
 aiQk/SHHPVqqd2C4c1hVyMZ2xS1d1u8JB2MZHe3nbHG5Nf7UywFprjykJ/tt1n3FHJ
 A10ciIkixCQKUYrGnylx90tXmvZVh431qQEuDciYH2s1g4tZBykE6KClzguv8fUAiG
 DLMJNWWa01NzQ==
Message-ID: <0faf89cb-4709-17c9-0d67-da7ef2ddb7e6@collabora.com>
Date: Thu, 9 Feb 2023 10:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/9] dt-bindings: gpu: mali-bifrost: Don't allow
 sram-supply by default
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gm=Onu2RK+skLgN4Kzo9yP1n5Zb48oQNkQ019838QeEQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gm=Onu2RK+skLgN4Kzo9yP1n5Zb48oQNkQ019838QeEQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/02/23 03:50, Chen-Yu Tsai ha scritto:
> On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The sram-supply is MediaTek-specific, it is and will ever be used
>> only for the mediatek,mt8183-mali compatible due to the addition of
>> the mediatek-regulator-coupler driver: change the binding to add
>> this supply when mediatek,mt8183-mali is present as a compatible
>> instead of disabling it when not present.
>>
>> This is done in preparation for adding new bindings for other
>> MediaTek SoCs, such as MT8192 and others.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> index 78964c140b46..69212f3b1328 100644
>> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> @@ -57,8 +57,6 @@ properties:
>>
>>     mali-supply: true
>>
>> -  sram-supply: true
>> -
> 
> Have you tried actually validating the device trees against this?
> Based on my previous tests this gives out errors.

I did... and I didn't get any complaint... but perhaps something went wrong
on my side?

I mean, I can retry just to be sure.

> 
> The reason is that each conditional is a separate sub-schema, and the
> validator is run against each schema and sub-schema separately, instead
> of collapsing matching schemas and sub-schemas together and validating
> once. So we'll get a validation error on sram-supply not being a valid
> property when validating current mt8183 against the base schema.
> 
> We have a similar issue with power-domain-names, for which I'll send
> a patch to fix. See the following for the fix:
> 
>      http://git.kernel.org/wens/c/d1adb38ab2ad0442755607c2bcc726cc17cce2c7
> 
> and the following for what I did for MT8192 on top of the previous patch:
> 
>      http://git.kernel.org/wens/c/049bd164884398d7e5f72c710da6aaa9a95bc10a
> 

Thanks for the pointer, btw

Cheers,
Angelo

> 
> Regards
> ChenYu
> 
>>     operating-points-v2: true
>>
>>     power-domains:
>> @@ -157,6 +155,7 @@ allOf:
>>               - const: core0
>>               - const: core1
>>               - const: core2
>> +        sram-supply: true
>>
>>         required:
>>           - sram-supply
>> @@ -166,7 +165,6 @@ allOf:
>>         properties:
>>           power-domains:
>>             maxItems: 1
>> -        sram-supply: false
>>     - if:
>>         properties:
>>           compatible:
>> --
>> 2.39.1
>>



