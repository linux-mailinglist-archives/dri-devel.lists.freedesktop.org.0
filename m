Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1CF6A0A4C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D8110E201;
	Thu, 23 Feb 2023 13:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E5B10E201
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:15:51 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A1E136602206;
 Thu, 23 Feb 2023 13:15:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677158149;
 bh=Us76hl3M67F4tYLgk1qrZB7e6/ZLVJuaAxtfQ+sOh5s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G3BhFgpPjGQDWxS0SJIystijE1dRfuglShVLZeqng66gOtNFf/usYwCEfXh+9eCjc
 K8E6jEmeA15GBbYMN9fexcAQa+pFXp6P+Ec4x889/Y9c9jRX3OSixJLXLdXmY7lOtR
 jBzbYMiIigDLLGaGy0GmibUcTJY0tFtCw9agV/sXNSWVS58w2yxv7DAZpCpTfWTC9E
 ufGps3myqqJrEdhvd635IFaVhI2mBT1pTzRIuxoYVrFycvxlVr/Gd8mvj9m3vqGYo4
 Oq53Dhn7u6Z0G9DoC0AEe/Hu3rzsrlu8qk5099ZOYF5LM4hmjqxotVrBP3bPSThPkq
 R5neIsJYFn+Wg==
Message-ID: <68a91707-78e7-7a39-900f-18ade966befc@collabora.com>
Date: Thu, 23 Feb 2023 14:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/10] dt-bindings: gpu: mali-bifrost: Add a compatible
 for MediaTek MT8186
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-7-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Ed-5Nq0zNzCGzez3fnW2yxW7zFx9B6k58Y4yb8P+hvpw@mail.gmail.com>
 <88a3fa09-60cb-bb3c-c392-286efd983627@collabora.com>
 <CAGXv+5H3XMF7ov_WfNFA=HC0frD003MRdVuBOFiBvu8zxE_rwg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5H3XMF7ov_WfNFA=HC0frD003MRdVuBOFiBvu8zxE_rwg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/02/23 03:43, Chen-Yu Tsai ha scritto:
> On Wed, Feb 22, 2023 at 5:13 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 22/02/23 09:37, Chen-Yu Tsai ha scritto:
>>> On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Get GPU support on MT8186 by adding its compatible.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>>>> index be18b161959b..43a841d4e94d 100644
>>>> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>>>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>>>> @@ -15,6 +15,11 @@ properties:
>>>>
>>>>      compatible:
>>>>        oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - mediatek,mt8186-mali
>>>> +          - const: mediatek,mt8183b-mali
>>>> +          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
>>>
>>> The MT8186 has Mali-G52 MC2 2EE, while the MT8183 has Mali-G72 MP3.
>>
>> Keeping in mind the obvious - which is that G52 and G72 are both Bifrost....
>>
>>> So we actually need a new entry with two power domains.
>>>
>>
>> ...This is my node for MT8186:
>>
>>                  gpu: gpu@13040000 {
>>                          compatible = "mediatek,mt8186-mali",
>>                                       "mediatek,mt8183b-mali",
>>                                       "arm,mali-bifrost";
>>                          reg = <0 0x13040000 0 0x4000>;
>>
>>                          clocks = <&mfgsys CLK_MFG_BG3D>;
>>                          interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH 0>,
>>                                       <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
>>                                       <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH 0>;
>>                          interrupt-names = "job", "mmu", "gpu";
>>                          power-domains = <&spm MT8186_POWER_DOMAIN_MFG1>,
>>                                          <&spm MT8186_POWER_DOMAIN_MFG2>,
>>                                          <&spm MT8186_POWER_DOMAIN_MFG3>;
>>                          power-domain-names = "core0", "core1", "core2";
>>
>>                          /* Please ignore speedbin, that's for another time :-) */
>>                          nvmem-cells = <&gpu_volt_bin>;
>>                          nvmem-cell-names = "speed-bin";
>>                          #cooling-cells = <2>;
>>                  };
>>
>> There are three MFG power domains... MFG2 and MFG3 are parents of MFG1, on that
>> I agree, but we can avoid adding a new entry just for MT8186 and use the MT8183-b
>> one while still being technically correct.
>>
>> Besides, Mali G52 and Mali G72 are both Bifrost... so I don't think that this
>> commit is incorrect. For the sake of simplicity, I would push on getting this
>> one picked.
> 
> I'm aware. In case it wasn't obvious, Mali-G52 MC2 2EE has 2 cores, while
> Mali-G72 MP3 has 3 cores. I think that is reason enough to do a new entry.
> Otherwise you are describing power domains for 3 cores for a GPU that only
> has two.
> 
>> Unless there are any real-strong opinions against...
> 
> Yes.
> 

Ok, I will do that for v3!

Cheers,
Angelo

> ChenYu


