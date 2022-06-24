Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A93559815
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 12:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA7710E352;
	Fri, 24 Jun 2022 10:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5707A10E352
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 10:45:11 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id h23so3806031ejj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 03:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=2t+7HTFw4Am9k5wfnt+zpTYwsim5TZ2i9yEsItPpeso=;
 b=xcoXh7yCPrSwwOXsVEte8S9NR0zXlkpvvmSX4mcTWFeTdYGxCOjXXMGpaIaqsIAE1K
 bp0d/k4GmQ8d8KFLm3LHJNOZx0WMiu4WZUX7HLNDAsZEJN1sptGsrLYyPxjY9ktKrSY+
 anicQhYWBm83eN/+nf24xt/88s2e96BqLLMqqV5kNG1Cun51WNovucO46nd97ihvrKZF
 dnLW7i1sNcOp3Mp4GU7oElU9RGuLLHZTaYOd/EiSoahcaoQ1ovR0ARSV/9WojV7BCFK1
 Svcita+pSItq8jdZ6ZzrgytfqP0wj21BQU9Nqu6VjwpUbWuvEYZFpH+8A2yDStdJm384
 PEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=2t+7HTFw4Am9k5wfnt+zpTYwsim5TZ2i9yEsItPpeso=;
 b=4rlugD080MPy5aHz490zIb9AmFKkjeJfHySOP0BYKmx0KTaQ4v0+vPhyQLtzy2O8iB
 zB8D+nduaM6C9sG7521OKLZxAs7ggUBPUwhch9Oz30dn9nI/pbZboKzfsLTXm4qiOy+/
 I3E9wNK8mAFSDDOKN7Vhl7d4KNpF4DTBy0YzrJpjBHPvIDLTUuqAwJuCwpUHtVl0YY5w
 +9DWLMt7p+1vPJDJEdWB7LwOoe+noZZyQDzMv3bdLt9pnDQ4/uxOzoYxFqZ6zHAoSR1e
 adpKaquPtbLvnrixRmHvNXgvuXt/EBM2R/cuZa0twLt2HVdEb6tfsZGRiQGd5H9zbLFU
 CJrQ==
X-Gm-Message-State: AJIora/BCPK/ffxMq2yVDD2dMZm1nis/L8qlRRwwk/IbyVJH/3jd78DD
 riMPQuaEEInWicLQT1LtW8HLTA==
X-Google-Smtp-Source: AGRyM1tk6j4mNtQk9qRRyVUy6ecFx8pKAt3xM74yrIfZScw1NM4v+j/hr8GYVIcM+2p5oRpQfs7mBA==
X-Received: by 2002:a17:906:2dd:b0:712:1293:3dd8 with SMTP id
 29-20020a17090602dd00b0071212933dd8mr12766549ejk.448.1656067509878; 
 Fri, 24 Jun 2022 03:45:09 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ci25-20020a170906c35900b006fe921fcb2dsm906732ejb.49.2022.06.24.03.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 03:45:09 -0700 (PDT)
Message-ID: <237b1ecc-9a87-b37f-46fd-4612a7ae56f6@linaro.org>
Date: Fri, 24 Jun 2022 12:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-4-peterwu.pub@gmail.com>
 <aec8ecdb-7c76-1261-216b-b40e450d1bf8@linaro.org>
In-Reply-To: <aec8ecdb-7c76-1261-216b-b40e450d1bf8@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2022 12:35, Krzysztof Kozlowski wrote:
> On 23/06/2022 13:56, ChiaEn Wu wrote:
>> From: ChiYuan Huang <cy_huang@richtek.com>
>>
>> Add Mediatek mt6370 current sink type LED indicator binding documentation.
>>
>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>> ---
>>
>> v3
>> - Use leds-class-multicolor.yaml instead of common.yaml.
>> - Split multi-led and led node.
>> - Add subdevice "led" in "multi-led".
>> ---
>>  .../bindings/leds/mediatek,mt6370-indicator.yaml   | 77 ++++++++++++++++++++++
>>  1 file changed, 77 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>> new file mode 100644
>> index 0000000..45030f3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>> @@ -0,0 +1,77 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: LED driver for MT6370 PMIC from MediaTek Integrated.
>> +
>> +maintainers:
>> +  - Alice Chen <alice_chen@richtek.com>
>> +
>> +description: |
>> +  This module is part of the MT6370 MFD device.
>> +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
>> +
>> +allOf:
>> +  - $ref: leds-class-multicolor.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt6370-indicator
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^multi-led@[0-3]$":
>> +    type: object
> 
> Here as well unevaluatedProperties:false (on the type level)

Ah, no, it does not work currently. Your code looks good.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
