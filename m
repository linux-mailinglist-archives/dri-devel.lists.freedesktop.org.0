Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25AF86FDD9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B9A10FECE;
	Mon,  4 Mar 2024 09:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uvWKZi0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C84D10FECE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:43:18 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so6322281a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 01:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709545396; x=1710150196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yK8SqcxIhmoA6CejGRLBhKEEdc3Rn2K3//Q0mP2oKj8=;
 b=uvWKZi0NMhouGqJvx0Y0lK+kEBToUV9i5buv/9GNiVKQYWwi/wdDzYKVqWXp6YeT2a
 b2ZZ7eOM/wM6DgIKECF2gMfFBOckIwcPJ4WX+IGeWdEeew+x1LHwPjGVfkwLeeODDUNN
 b7TekHJWzKFBreMgSePmaH/+CbTjbvVU92h0rej1j/V4S7aMvZhGHcvPnmFi2yz6vo4X
 S0PXaX/OM/edlsq8iDTnkdVD+9NzcdkrDIjq7l2QMW1zFSevpTk7XNjG6mWbC4ugPxVO
 4tU/oPGwFEBJagDu9Wa6Lc+a61UorHEix96YeziF5muw9e+waH8FDW+hpwLB66e5cZEL
 UGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709545396; x=1710150196;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yK8SqcxIhmoA6CejGRLBhKEEdc3Rn2K3//Q0mP2oKj8=;
 b=Ox28nk+Frcn/ybQhRinA4bvgcFStCh5/fZTxx3/aOcBzgL+7fvL2BRiPutQTJ4IU0z
 ndhJHLSgCdSVm5ebXAqoMW4DtdwyvDg1peh4MKV7lePsqlTYSH/fbPzmaPFnI+Wyn9Ur
 z/q7jLzO6Tt1zjZNdNAx3nTqHZDYk7XFIKMri6xo80TsTU/sHzKw7K0OzJeQTtDuib3X
 V+7jE+Mox4b4kpqK/s+y25eQZZnORpFXTcZuYlLp3RCcj8L6rtnRnZYC6d6l6CmRyngV
 PInOgdR4iCdNSY7VFnNho16K6HFvTX4Oid9cqo+SXOXVaQMZWQ3V990cLXOUhaiuoaij
 Pzyg==
X-Gm-Message-State: AOJu0YwauHubJU4KKNNw/AKN1FvRUT0gabxv7kqBUhUHgEPE43szlcxZ
 dovBj5sWPQK3wi8Pr/pHYoTUpTNBoJjl03thBPQhxLBNkKbTPZmku2/w62gudHA=
X-Google-Smtp-Source: AGHT+IFmSoDrBhWlA9UN6BUoLBhTux32lnDN7yof10B4mHitwZT1hvaN6WQ5dwaqXs50i2FzFCvvkA==
X-Received: by 2002:a05:6402:323:b0:566:5ea2:1257 with SMTP id
 q3-20020a056402032300b005665ea21257mr5792853edw.16.1709545396476; 
 Mon, 04 Mar 2024 01:43:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a056402518c00b00563ec73bbafsm4363211edd.46.2024.03.04.01.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 01:43:16 -0800 (PST)
Message-ID: <b14c8123-ee87-4b98-a616-008b252010d8@linaro.org>
Date: Mon, 4 Mar 2024 10:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display: atmel,lcdc: convert to dtschema
Content-Language: en-US
To: Dharma.B@microchip.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240304-lcdc-fb-v2-1-a14b463c157a@microchip.com>
 <ce1c5ba1-4f6a-4d20-8a12-fbae9003657a@linaro.org>
 <3d4e4b18-5318-4f1c-ab05-b925a0dfd317@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <3d4e4b18-5318-4f1c-ab05-b925a0dfd317@microchip.com>
Content-Type: text/plain; charset=UTF-8
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

On 04/03/2024 10:28, Dharma.B@microchip.com wrote:
> On 04/03/24 1:06 pm, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 04/03/2024 06:36, Dharma Balasubiramani wrote:
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
>>> These bindings are tested against the existing at91 dts files using
>>> dtbs_check.
>>> ---
>>> Changes in v2:
>>> - Run checkpatch and remove whitespace errors.
>>> - Add the standard interrupt flags.
>>> - Split the binding into two, namely lcdc.yaml and lcdc-display.yaml.
>>> - Link to v1: https://lore.kernel.org/r/20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com
>>> ---
>>>   .../bindings/display/atmel,lcdc-display.yaml       | 98 ++++++++++++++++++++++
>>>   .../devicetree/bindings/display/atmel,lcdc.txt     | 87 -------------------
>>>   .../devicetree/bindings/display/atmel,lcdc.yaml    | 70 ++++++++++++++++
>>>   3 files changed, 168 insertions(+), 87 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml b/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml
>>> new file mode 100644
>>> index 000000000000..ea4fd34b9e2c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/atmel,lcdc-display.yaml
>>> @@ -0,0 +1,98 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/atmel,lcdc-display.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Microchip's LCDC Display
>>> +
>>> +maintainers:
>>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>>> +  - Dharma Balasubiramani <dharma.b@microchip.com>
>>> +
>>> +description:
>>> +  The LCD Controller (LCDC) consists of logic for transferring LCD image data
>>> +  from an external display buffer to a TFT LCD panel. The LCDC has one display
>>> +  input buffer per layer that fetches pixels through the single bus host
>>> +  interface and a look-up table to allow palletized display configurations. The
>>> +  LCDC is programmable on a per layer basis, and supports different LCD
>>> +  resolutions, window sizes, image formats and pixel depths.
>>> +
>>> +# We need a select here since this schema is applicable only for nodes with the
>>> +# following properties
>>> +
>>> +select:
>>> +  anyOf:
>>> +    - required: [ 'atmel,dmacon' ]
>>> +    - required: [ 'atmel,lcdcon2' ]
>>> +    - required: [ 'atmel,guard-time' ]
>>> +    - required: [ bits-per-pixel ]
>>
>> Why quotes in other places? 
> 
> I got the following warnings when I tried to compile without adding the 
> quotes for atmel,*
> 
> "[warning] too few spaces after comma (commas)"

Ah, right, because it is a list. Looks fine.

> 
> and when I add quotes for "bits-per-pixel" it complained the following
> 
> "[error] string value is redundantly quoted with any quotes 
> (quoted-strings)"

Yep, right.

> 
> So I added quotes for properties with comma in them.
> 
>> bits-per-pixel is generic property, so you
>> are now selecting other bindings. Read carefully what Rob wrote.
> 
> My bad, I should have inquired before arriving at any conclusion.
> Thanks for letting me know.
> 
> Shall I send v3 by removing "- required: [ bits-per-pixel ]" in select?

Yes... and test entire bindings, not only your schema.

Best regards,
Krzysztof

