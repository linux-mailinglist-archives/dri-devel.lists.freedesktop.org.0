Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC72867F6EA
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 11:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392B210E184;
	Sat, 28 Jan 2023 10:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91D710E184
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 10:10:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id k16so5045536wms.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 02:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aR5Dg7w2l0iykP9VsPNgegnDIXzxG8qSZnQngFSkNqc=;
 b=PnDXWGTqyGPIlfP8pAto4OWRpswlITQardjDL7yCDiKvkEhB9iRxuk6CQHyJOsVGG4
 M3KKuSzu9HeJiGZPsva3s4kQm3V75zh8+qdUEOaGnafbuDsAN9b/heeACuEQkOgZUnlQ
 L+Ej/Jz+UvWncau8THu+o82o52erILE//0HLfrcZjYWea1/pEj+yh8WKtUVPl/8aqbWo
 uBbmNiAPWmxjC6ibVlkJrd9bPMZPnx1pdLBgjUI1DYkNRsKdpCjfGXXXLIoa4aZv1su3
 lvdJcMFPR2dKbwFi5nSMdPXBBw2506bS5/p7wOAkax0kJAajeT2CjdsceuaieWMfIciD
 VP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aR5Dg7w2l0iykP9VsPNgegnDIXzxG8qSZnQngFSkNqc=;
 b=M21og+1fHk5yiRnQ0yM4HKVatKMWeD2Jmci2X+FdRP0jNy04MbQZC7XIoy4YmpktY/
 a074KzYIvvHsuEqaIROUFm1IromC+gyLwBtMIzb7VWf8LFaBIzAYpgWp4EN1t20EJujE
 eCyPsqCQdBcKnFLoeDMvcv8tN9UvG6STNESHKf28Wp91OoJO5xvQ/ncIom7WQwzq1UEN
 wyjlP1VRVacXSnQT5XsZUNUuI5jn49himNd0nNY416U4Z/tIhViLB4yyCFTlPzExAMOD
 onueRRXx1yvQiY/Dgr8UcKg4gUyyydBmLZpw9u9aOojnd9KUvGqUhazTt3ZB5EZsGeOl
 PMhA==
X-Gm-Message-State: AFqh2kp27+xsXlPpOvdUyf0Tm2sGvDzXRbDxtmT5AqqiPC1M0DoaJIke
 E++IoIv5jWgnkJpcHuNWN7WoAg==
X-Google-Smtp-Source: AMrXdXvDvA3UXuMrtLwp4bkpwXroSUQMWjSXQhCsdVW5TUW0VJJoU5KgeShQnWh1YGRlvL4EzDRNZw==
X-Received: by 2002:a05:600c:35d5:b0:3db:fc4:d018 with SMTP id
 r21-20020a05600c35d500b003db0fc4d018mr41023283wmq.40.1674900629290; 
 Sat, 28 Jan 2023 02:10:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 ip7-20020a05600ca68700b003dc433bb5e1sm2716551wmb.9.2023.01.28.02.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 02:10:28 -0800 (PST)
Message-ID: <518c3b72-9e54-018a-3876-ea18a64531da@linaro.org>
Date: Sat, 28 Jan 2023 11:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: display: bridge: sil,sii8620: convert to
 dtschema
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230127203525.198295-1-krzysztof.kozlowski@linaro.org>
 <Y9TdO9MeNxkesIQE@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y9TdO9MeNxkesIQE@pendragon.ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/01/2023 09:30, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> Thank you for the patch.
> 
> On Fri, Jan 27, 2023 at 09:35:25PM +0100, Krzysztof Kozlowski wrote:
>> Convert the Silicon Image SiI8620 HDMI/MHL bridge bindings to DT schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/display/bridge/sil,sii8620.yaml  | 107 ++++++++++++++++++
>>  .../bindings/display/bridge/sil-sii8620.txt   |  33 ------
>>  2 files changed, 107 insertions(+), 33 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
>> new file mode 100644
>> index 000000000000..90532bb99161
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/sil,sii8620.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Silicon Image SiI8620 HDMI/MHL bridge
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> +
>> +properties:
>> +  compatible:
>> +    const: sil,sii8620
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xtal
>> +
>> +  cvcc10-supply:
>> +    description: Digital Core Supply Voltage (1.0V)
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  iovcc18-supply:
>> +    description: I/O Supply Voltage (1.8V)
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Video port for HDMI (encoder) input
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          MHL to connector port
>> +
>> +    required:
>> +      - port@0
> 
> Why port@0 only ?

I am not the author of the original binding, but when it was introduced,
I think it came without MHL port support - only HDMI. This probably is
incomplete but I guess can work due to some default settings. Shall we
make both required? I don't know, sounds reasonable...

Best regards,
Krzysztof

