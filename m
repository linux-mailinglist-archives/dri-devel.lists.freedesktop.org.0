Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5186AC23
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 11:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBF010E25F;
	Wed, 28 Feb 2024 10:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qVdjMgNp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A0110E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709115933;
 bh=E8R79vstTtZYjkIXyTYbyYkKBTC6894FJU5MK2LqR20=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qVdjMgNpoJSKYoUGzNNif7MwqOIvRhO+7Z512Q1OpHtWr70VAn2rL29LyFCx5lcOu
 2A+3rlzaNSw1g91MWg9EOwDjy0uIXRvFQe8lG+ZfY76MTDsfoXPLs73Ne1Se/vBUbv
 VpOLc1vtuTvKRGQtbKDRuKGyfxcvr8ufYw5nC+/8DZYLodTszxLHzRryEYxFhssgrw
 oAphV7git0xKym3Y/vQWhfh+Yme1IfUOBmtbU7oTWRHVm9YqOMrnEIy7veaCQATzW8
 TjkxbCIEE9MER6XEM87oFe7lh0ZSRcN6OZPk/sUiDQ0VVSmBJM5WF1FdL6uC3PR8gA
 jemLx0f+CRKLA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 30B7E3780C6C;
 Wed, 28 Feb 2024 10:25:32 +0000 (UTC)
Message-ID: <bb86b986-ecd7-416a-9036-082a3cff2176@collabora.com>
Date: Wed, 28 Feb 2024 11:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-1-4fa1cea1667f@baylibre.com>
 <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
 <eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com>
 <bd4bf6ae-350e-4ee6-a924-7dd31b2c6034@linaro.org>
 <66e527af-0253-4565-9822-04ed84e5817c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <66e527af-0253-4565-9822-04ed84e5817c@baylibre.com>
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

Il 28/02/24 10:57, Alexandre Mergnat ha scritto:
> I think I got it.
> 
> - mediatek,i2s-shared-clock: will be remove from DT
> - mediatek,dmic-iir-on: will be remove from DT
> - mediatek,dmic-irr-mode: will be remove from DT
> - mediatek,dmic-two-wire-mode: rephrase description needed
> 
> I've did abstraction (despite me) that IIR settings are runtime config because the 
> driver implement its usage like a one-time-setup -_-'
> 

Yes but just one more thing I just noticed: `mediatek,dmic-two-wire-mode` - can we
please rename this to `mediatek,dmic-mode` ?

That'd be for consistency check mt6359.yaml and mt6358.txt

   mediatek,dmic-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       Indicates how many data pins are used to transmit two channels of PDM
       signal. 0 means two wires, 1 means one wire. Default value is 0.
     enum:
       - 0 # one wire
       - 1 # two wires

Cheers,
Angelo



> Thanks for the explanations, that help.
> 
> Regards,
> Alexandre
> 
> On 28/02/2024 08:28, Krzysztof Kozlowski wrote:
>> On 27/02/2024 16:18, Alexandre Mergnat wrote:
>>>>
>>>>> +    type: boolean
>>>>> +
>>>>> +  mediatek,dmic-iir-on:
>>>>> +    description:
>>>>> +      Boolean which specifies whether the DMIC IIR is enabled.
>>>>> +      If this property is not present the IIR is disabled.
>>>>
>>>> "is enabled" or "enable it"?
>>>>
>>>> You described the desired Linux feature or behavior, not the actual
>>>> hardware. The bindings are about the latter, so instead you need to
>>>> rephrase the property and its description to match actual hardware
>>>> capabilities/features/configuration etc.
>>>
>>> I will rephrase:
>>>
>>> True to enable the Infinite Impulse Response (IIR) filter
>>> on the digital microphone inputs.
>>
>> I still don't know why this is DT-specific. You still tell driver what
>> to do...
>>
>>>
>>>>
>>>>> +    type: boolean
>>>>> +
>>>>> +  mediatek,dmic-irr-mode:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description:
>>>>> +      Selects stop band of IIR DC-removal filter.
>>>>> +      0 = Software programmable custom coeff loaded by the driver.
>>>>
>>>> Bindings are for hardware, not drivers. Why is this a property of board DTS?
>>>
>>> Actually this is a hardware feature. Mode 1 t 5 are predefined filters.
>>> Mode 0, the HW will read some "coef filter registers" to setup the
>>> custom filter. the "coef filter regs" are written by the driver.
>>> Currently the coef values are hardcoded in the driver.
>>
>> You don't get the point. Just because you choose some mode it does not
>> mean is hardware feature for DT. Sampling frequency done by hardware is
>> also "hardware feature", but do you put it to DT? No.
>>
>> Explain why this is board-specific, not runtime configuration.
>>
>>>
>>>>
>>>>> +      1 = 5Hz if 48KHz mode.
>>>>> +      2 = 10Hz if 48KHz mode.
>>>>> +      3 = 25Hz if 48KHz mode.
>>>>> +      4 = 50Hz if 48KHz mode.
>>>>> +      5 = 65Hz if 48KHz mode.
>>>>
>>>> Use proper unit suffixes - hz.
>>>>
>>>>
>>>>> +    enum:
>>>>> +      - 0
>>>>> +      - 1
>>>>> +      - 2
>>>>> +      - 3
>>>>> +      - 4
>>>>> +      - 5
>>>>> +
>>>>> +  mediatek,dmic-two-wire-mode:
>>>>> +    description:
>>>>> +      Boolean which turns on digital microphone for two wire mode.
>>>>> +      If this property is not present the two wire mode is disabled.
>>>>
>>>> This looks like hardware property, but the naming looks like SW. Again
>>>> you instruct what driver should do. Standard disclaimer:
>>>>
>>>> You described the desired Linux feature or behavior, not the actual
>>>> hardware. The bindings are about the latter, so instead you need to
>>>> rephrase the property and its description to match actual hardware
>>>> capabilities/features/configuration etc.
>>>
>>> Actually this is a hardware feature. This is ALL I have to describe the
>>> HW behavior from the datasheet:
>>> "
>>> bit name: ul_dmic_two_wire_ctl
>>> Turns on digital microphone for two wire mode.
>>> 0: Turn off
>>> 1: Turn on
>>
>> That's rather suggestion it is not a description of hardware but you
>> want driver to do something...
>>
>>> "
>>>
>>> On the board schematic, SoC and DMIC and linked by 3 pins:
>>> - clk
>>> - data0
>>> - data1
>>>
>>> IMHO, "two-wire-mode" means the HW use 2 pins for data, and the SoC must
>>> be aware of that by reading the register value written by the driver,
>>> using the value found in the DTS.
>>
>> So this depends on type of connection of DMIC? Then rephrase description
>> property like this.
>>
>>>
>>> I don't get why you think it wouldn't be hardware behavior.
>>
>> Because telling what to write to the registers which is typical sign of
>> people stuffing to DT whatever they need to configure the hardware.
>>
>>>
>>> Rephrase description:
>>> "True to enable the two wire mode of the digital microphone"
>>> Is it better ?
>>
>> No, because again you describe some sort of mode. If you insist on such
>> description, then my answer is: it's runtime, so not suitable for DT.
>> Instead describe what is the hardware problem/configuration, e.g. "DMIC
>> is connected with only CLK and DATA0, without third pin" etc.
>>
>>>
>>> About the property name, "mediatek,dmic-two-wire-ctl" sound better for you ?
>>
>> To sound more like a register less like physical characteristic of the
>> board? No. The name can stay, I don't have better ideas.
>>
>>
>> Best regards,
>> Krzysztof
>>
> 

