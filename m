Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A2E86AC17
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 11:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B380A10E2A6;
	Wed, 28 Feb 2024 10:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h4O3mRLM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FB410E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:23:37 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-513173e8191so1386228e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 02:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709115815; x=1709720615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dVcUvvXZrBFdTpa2aLeHCeaL3QuL+vTylsLEbLtu/l4=;
 b=h4O3mRLMoh/wNeIgpmB/F3ETyPHxPqf3MnPaSkA5kZLD5SEOAiW/6sVOxr+E64Gurr
 pwbWQ3eamphxX68rIeAwMmHFNmlrLHatVF7bt+NuTB7GUp3Ocn7g0iypshiu5qN/uXm/
 Tcokx98y02dlRIpzikSSB218LFU4QJh5ZCayE5JLkTW9qu/d7oDq4sd1Azg6qHG6BYui
 v58fL8WIFhsPr++2rkThI6By0G9/IcIlbvtxL9f9bNfwQnDuRRJs745X0XUQP0ScVVhm
 2p18bsfpEJWFz2AK0CNchjeJxcte00/NXpEK4dlnmZs/ujDM7v1O7ObaEDkuJzcoYSS9
 4uwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709115815; x=1709720615;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVcUvvXZrBFdTpa2aLeHCeaL3QuL+vTylsLEbLtu/l4=;
 b=W+vkDD1T8GzyIQOtNEfbKxkH/NdMyiNyV+5VcyFsiNCWRb77JcFCiqzqjwUtooO80e
 aNXGArVievzPHb50awDFVt2j7FTdsh1AO/aO9/j2jz6gszwo3l7ipSyn3jBeu6dHegNz
 wjcfR3pro+h05uEdQtFgq9mR1IwlJJ41L8qjv5Bepb/4Sens4dB8+n43mRdZ2aTwObms
 LvDT7WCNoswi1iEySYCcivKE/fZ7cWrOs45Y2FGgZ0ZXF+O1sQz7KpVPYMh3eyjy7Vw3
 cqGNH0oX6RZPGawEBB6qD7j2GmO3lLiK5TDMHoLVq82VPhxB2WSHluxo7HXBSO8OnHIV
 wQ5Q==
X-Gm-Message-State: AOJu0YziayzT7kukk87dSB2eVWCbQsSRr3uFvOAlHLsQ2R8Wxk2G5nQN
 bTnC+9khedr07dxfE3t1iS1J22M8ocfx1Jkrir+l/AEM3SS3CUXeVmZmkC1O4fc=
X-Google-Smtp-Source: AGHT+IGOXaWyrpVv0kqPh0Xchx+fy0yzA6ElOGQFI4V+3AZo4ZnDBxZhSKXbVZ+kjBoBo1fB2luwBg==
X-Received: by 2002:a19:ee16:0:b0:512:bea2:f002 with SMTP id
 g22-20020a19ee16000000b00512bea2f002mr7525070lfb.6.1709115815619; 
 Wed, 28 Feb 2024 02:23:35 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 qo8-20020a170907874800b00a441c8c56d0sm9662ejc.218.2024.02.28.02.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 02:23:35 -0800 (PST)
Message-ID: <34388175-7d5b-4f6b-b264-e85b84e98677@linaro.org>
Date: Wed, 28 Feb 2024 11:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: atmel,lcdc: convert to dtschema
To: Dharma.B@microchip.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com>
 <796652d5-af57-4aca-87c2-10a7b0b55959@linaro.org>
 <11c545e2-45df-4587-a5c7-12b05c2f01e0@microchip.com>
 <9bf7e492-891c-4d8f-b388-3b2ebae611c1@linaro.org>
 <e5cb705f-56cc-47cc-beb5-700c9a35c8cf@microchip.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e5cb705f-56cc-47cc-beb5-700c9a35c8cf@microchip.com>
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

On 28/02/2024 11:18, Dharma.B@microchip.com wrote:
> On 28/02/24 12:43 pm, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 28/02/2024 07:59, Dharma.B@microchip.com wrote:
>>>
>>>>
>>>> I don't know what's this exactly, but if embedded display then maybe
>>>> could be part of this device node. If some other display, then maybe you
>>>> need another schema, with compatible? But first I would check how others
>>>> are doing this.
>>>
>>> Okay, then I think the driver also needs to be modified, currently the
>>> driver parses the phandle and looks for these properties. Also the
>>> corresponding dts files.
>>
>> Driver does not have to be modified in my proposal. You would still have
>> phandle.
> 
> If I understand correctly, I could define the dt bindings as below
> 
>    display:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: A phandle pointing to the display node.
> 
>    panel:
>      $ref: panel/panel-common.yaml#
>      properties:
> 

So these are standard panel bindings? Then the node should live outside
of lcdc. If current driver needs to poke inside panel and panel could be
anything, then probably you need peripheral-props-like approach. :/

Best regards,
Krzysztof

