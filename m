Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F1873CB1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 17:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94FF10E0E5;
	Wed,  6 Mar 2024 16:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="YKUiP8Vt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 06 Mar 2024 16:54:59 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0B410E7D8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 16:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709744100; x=1741280100;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8W7Dq7YatRAs2b0t73cA2kCx69/JJSpwmIKPnNBRLk4=;
 b=YKUiP8VtaQQVevgYkOjHV1cMFpTurX/lLxtZBKqNNJMHKpyoHGgx0eC3
 8iaOmMaaf6ZMy8snPWRPbcEuWIcrP+QloOC7YgZJLokhijSeiw+KgQ1j/
 yqYjtGOSF9wV1zddGMIEto2OcL3+2vRhoqWxRX6IQICxx2gG39F8tfgMd
 T1+hn+70hDSjE5uWNsk1oEd/xl5+fpzx00MWsCTV/miwxb+uTvG6qHT/L
 S1MdVNvVCqgmWB4vI6wr4pfKHEkJgM+pWVLKqXAB1KYynqt8DgEFsSJS6
 AIkGh/fMU9bCMBWzr02oIMRiqtsiovkC3DDTOvNQycv1HwUO28zsMSwsN g==;
X-CSE-ConnectionGUID: Utymty8TR7qygpmqy9lhLQ==
X-CSE-MsgGUID: 4QUS1VrJSxG6Nif7mvyF0g==
X-IronPort-AV: E=Sophos;i="6.06,208,1705388400"; d="scan'208";a="17834673"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Mar 2024 09:47:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 09:47:25 -0700
Received: from [10.180.117.170] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 09:47:21 -0700
Message-ID: <e6537742-d9be-4745-b457-b36e60ccaa9b@microchip.com>
Date: Wed, 6 Mar 2024 17:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: display: atmel,lcdc: convert to dtschema
Content-Language: en-US, fr-FR
To: Dharma B - I70843 <Dharma.B@microchip.com>, Rob Herring <robh@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <20240304-lcdc-fb-v3-1-8b616fbb0199@microchip.com>
 <20240304220154.GA1115739-robh@kernel.org>
 <d3ae3196-4e8a-4e73-bc36-f53541598ab2@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <d3ae3196-4e8a-4e73-bc36-f53541598ab2@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dharma, all,

On 06/03/2024 at 15:35, Dharma B - I70843 wrote:
> 
> On 05/03/24 3:31 am, Rob Herring wrote:
>> On Mon, Mar 04, 2024 at 08:00:03PM +0530, Dharma Balasubiramani wrote:
>>> Convert the atmel,lcdc bindings to DT schema.
>>> Changes during conversion: add missing clocks and clock-names properties.
>>>
>>> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
>>> ---
>>> This patch converts the existing lcdc display text binding to JSON schema.
>>> The binding is split into two namely
>>> lcdc.yaml
>>> - Holds the frame buffer properties
>>> lcdc-display.yaml
>>> - Holds the display panel properties which is a phandle to the display
>>> property in lcdc fb node.
>>>
>>> These bindings are tested using the following command.
>>> 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> ---
>>> Changes in v3:
>>> - Remove the generic property "bits-per-pixel"
>>> - Link to v2: https://lore.kernel.org/r/20240304-lcdc-fb-v2-1-a14b463c157a@microchip.com
>>>
>>> Changes in v2:
>>> - Run checkpatch and remove whitespace errors.
>>> - Add the standard interrupt flags.
>>> - Split the binding into two, namely lcdc.yaml and lcdc-display.yaml.
>>> - Link to v1: https://lore.kernel.org/r/20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com
>>> ---
>>>    .../bindings/display/atmel,lcdc-display.yaml       | 97 ++++++++++++++++++++++
>>>    .../devicetree/bindings/display/atmel,lcdc.txt     | 87 -------------------
>>>    .../devicetree/bindings/display/atmel,lcdc.yaml    | 70 ++++++++++++++++
>>>    3 files changed, 167 insertions(+), 87 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml b/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml
>>> new file mode 100644
>>> index 000000000000..5e0b706d695d

[..]

>>> +  atmel,lcd-wiring-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>
>> Isn't this just a single string rather than an array?
>>
>>> +    description: lcd wiring mode "RGB" or "BRG"
>>
>> enum:
>>     - RGB
>>     - BRG
>>
>> No BGR?
> 
> In the current driver implementation, we have interpreted the wiring
> mode represented by ATMEL_LCDC_WIRING_BGR as 'BRG' in the array
> atmel_lcdfb_wiring_modes. Considering conventional color representation,
> would it be appropriate to consider modifying the existing driver to use
> the 'BGR' string instead of 'BRG' for better alignment with standard
> naming conventions?

This "BRG" thing is definitively a typo. We never had such thing as a 
BRG color wiring but did have BGR wiring mode.

> static const char *atmel_lcdfb_wiring_modes[] = {
>           [ATMEL_LCDC_WIRING_BGR] = "BRG",
>           [ATMEL_LCDC_WIRING_RGB] = "RGB",

The thing is that we have one DT using that:
arch/arm/boot/dts/at91sam9261ek.dts

So, either I would leave it like that: it's only old product using it.
Or just focus on first character in the string so that it works for both 
"BRG" or "BGR", and maintains the backward compatibility.

Regards,
   Nicolas


> };
> 
> 
>>
>> But wait, the example shows the value is '1'. That should fail testing.
>> It didn't, but I've now fixed that.
> 
> It seems correctly configured in our dts files but didn't noticed the
> same in the bindings example, thanks for letting me know, I will correct
> it in the next revision.

