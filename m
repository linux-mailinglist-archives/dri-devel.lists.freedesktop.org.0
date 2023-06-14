Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3C730249
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 16:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8986C10E009;
	Wed, 14 Jun 2023 14:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jun 2023 14:48:22 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483CD10E009
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686754102; x=1718290102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2H0918Rqgl2h0POEbvxjKrAOS5koy+0gr8134epCcvI=;
 b=1WEeokuV1euCtvvfgdwmAOGz5NwPSFPfizc01NaPgr7LhXQ6FZ1fc6X5
 K8YkGcPLLZrXA+dngAIw2qE1f4Y4s2QxK1xb3RsaRPYqJU3fEzLOlvEE9
 STtedUl1H9mPW91LRInYkfTFksb5KgEPL5qlGmmprjbw+Jbk2hywIjMSj
 snDSmiRCxbD4PX3Y8O5L90QSFssJN4P92et90z4Xr1khovlIxK+JK8pCH
 5nAkofsYPOCG0FeOfoO95wohIsEurJhrcQ9o9MK6D11LVeDGecCCq/p2x
 l0VJiopOW3jRw0iDbGRBzvvvHVP0S5rmBIRaryt0wCCpn+Epfc/kzmoZo A==;
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="220274370"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jun 2023 07:41:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 07:41:05 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 14 Jun 2023 07:41:00 -0700
Message-ID: <423eef3c-54f0-5c88-9bc9-82c0198b6da6@microchip.com>
Date: Wed, 14 Jun 2023 16:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add bindings for SAM9X7 LCD
 controller
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-2-manikandan.m@microchip.com>
 <a0b059d1-df4d-10ce-fb7c-7acea0a20793@linaro.org>
 <20230613-slider-coherent-d508d67afc91@spud>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230613-slider-coherent-d508d67afc91@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
Cc: alexandre.belloni@bootlin.com, Nayabbasha.Sayed@microchip.com,
 dri-devel@lists.freedesktop.org, Hari.PrasathGE@microchip.com,
 krzysztof.kozlowski+dt@linaro.org, Varshini.Rajendran@microchip.com,
 Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 Balamanikandan.Gunasundar@microchip.com, lee@kernel.org,
 Dharma.B@microchip.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 robh+dt@kernel.org, Durai.ManickamKR@microchip.com,
 linux-arm-kernel@lists.infradead.org, Balakrishnan.S@microchip.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/06/2023 at 20:21, Conor Dooley wrote:
> On Tue, Jun 13, 2023 at 08:17:13PM +0200, Krzysztof Kozlowski wrote:
>> On 13/06/2023 09:04, Manikandan Muralidharan wrote:
>>> Add new compatible string for the XLCD controller on SAM9X7 SoC.
>>>
>>> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>
>>> ---
>>>   Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
>>> index 5f8880cc757e..7c77b6bf4adb 100644
>>> --- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
>>> +++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
>>> @@ -8,6 +8,7 @@ Required properties:
>>>      "atmel,sama5d3-hlcdc"
>>>      "atmel,sama5d4-hlcdc"
>>>      "microchip,sam9x60-hlcdc"
>>> +   "microchip,sam9x7-xlcdc"
>> Google says sam9x7 is a series, not a SoC. Please add compatibles for
>> specific SoCs, not for series.
> We had this one a few weeks ago, see
> https://lore.kernel.org/all/add5e49e-8416-ba9f-819a-da944938c05f@microchip.com/
> and its parents. Outcome of that seemed to be that using "sam9x7" was fine.

And it's where it begins to be funny, as the LCD is precisely one aspect 
where we differentiate between sam9x75, sam9x72 and sam9x70...
So please Manikandan sort this out if difference between these chips 
will be better handled with different compatibility string, in 
particular about //, LVDS and MIPI-DSI variants!

Regards,
   Nicolas

-- 
Nicolas Ferre

