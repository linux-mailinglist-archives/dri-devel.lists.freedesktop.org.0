Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F1737C87
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7568D10E0C3;
	Wed, 21 Jun 2023 07:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jun 2023 07:55:24 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3248210E0C3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1687334123; x=1718870123;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4elCiOXAO/1skXbd8OBCX9scHIUqUf+kd1BiTdR6iKw=;
 b=fygsYtf54uhYf6VtbBmyFHrzH/apEkoE8OPWTDWAfQKjpmdZ/Lv2KE/A
 oKaj40kXNqQA6uMl4X2anDXRSCRp1+TbqNxASYTKQbcz2mf2U+sf1FJIt
 l91MPUWuxsQXj+83qk5qXnCpcR981N+uzAtP91hargUUWafXsaddOkMmW
 0d43eihJI8JERqNv/4u06q3SkMXODtij+X44vPlXpK2okLHkioYpaEb+W
 jO74r8T1wv3MJgfmvwcp9ILZ1hQ4xv9y4EjJ1zgQkTA52Mja0TjlGfml3
 GiHbi8xD1Tlc8M+lV/AtJkRJIj4rwbgn0SxMcx4TrkYhv9DpOZeiLfyQG Q==;
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="231305443"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jun 2023 00:48:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 21 Jun 2023 00:48:14 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 21 Jun 2023 00:48:10 -0700
Message-ID: <ef09246c-9220-4c71-4ac2-2792d9ca519d@microchip.com>
Date: Wed, 21 Jun 2023 09:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add bindings for SAM9X7 LCD
 controller
Content-Language: en-US
To: Manikandan M - I67131 <Manikandan.M@microchip.com>, Conor Dooley
 <conor@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-2-manikandan.m@microchip.com>
 <a0b059d1-df4d-10ce-fb7c-7acea0a20793@linaro.org>
 <20230613-slider-coherent-d508d67afc91@spud>
 <423eef3c-54f0-5c88-9bc9-82c0198b6da6@microchip.com>
 <3a3f4463-981a-e8d8-8ec4-06f2abfa3b4d@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <3a3f4463-981a-e8d8-8ec4-06f2abfa3b4d@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
Cc: Nayab basha Sayed - I73920 <Nayabbasha.Sayed@microchip.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Balamanikandan Gunasundar - I64410 <Balamanikandan.Gunasundar@microchip.com>,
 "lee@kernel.org" <lee@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Varshini Rajendran - I67070 <Varshini.Rajendran@microchip.com>,
 Dharma B - I70843 <Dharma.B@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Durai Manickam KR - I66125 <Durai.ManickamKR@microchip.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 Hari Prasath G E - I63539 <Hari.PrasathGE@microchip.com>, Balakrishnan
 S - I71840 <Balakrishnan.S@microchip.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 Claudiu Beznea - M18063 <Claudiu.Beznea@microchip.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2023 at 08:44, Manikandan M - I67131 wrote:
> On 14/06/23 20:10, Nicolas Ferre wrote:
>> On 13/06/2023 at 20:21, Conor Dooley wrote:
>>> On Tue, Jun 13, 2023 at 08:17:13PM +0200, Krzysztof Kozlowski wrote:
>>>> On 13/06/2023 09:04, Manikandan Muralidharan wrote:
>>>>> Add new compatible string for the XLCD controller on SAM9X7 SoC.
>>>>>
>>>>> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
>>>>> b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
>>>>> index 5f8880cc757e..7c77b6bf4adb 100644
>>>>> --- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
>>>>> +++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
>>>>> @@ -8,6 +8,7 @@ Required properties:
>>>>>       "atmel,sama5d3-hlcdc"
>>>>>       "atmel,sama5d4-hlcdc"
>>>>>       "microchip,sam9x60-hlcdc"
>>>>> +   "microchip,sam9x7-xlcdc"
>>>> Google says sam9x7 is a series, not a SoC. Please add compatibles for
>>>> specific SoCs, not for series.
>>> We had this one a few weeks ago, see
>>> https://lore.kernel.org/all/add5e49e-8416-ba9f-819a-da944938c05f@microchip.com/
>>> and its parents. Outcome of that seemed to be that using "sam9x7" was
>>> fine.
>>
>> And it's where it begins to be funny, as the LCD is precisely one aspect
>> where we differentiate between sam9x75, sam9x72 and sam9x70...
>> So please Manikandan sort this out if difference between these chips
>> will be better handled with different compatibility string, in
>> particular about //, LVDS and MIPI-DSI variants!
> Yes Sure, I will replace the compatible as s/sam9x7/sam9x75/g to handle
> the different variants of sam9x7 better.

Moving to sam9x75 is probably good. But what is your plan for 
differentiating parallel and LVDS (on sam9x72) and precisely this 
sam9x75 variant which in addition has MIPI-DSI?

Regards,
  Nicolas


-- 
Nicolas Ferre

