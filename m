Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E455271B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 00:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81E310FB67;
	Mon, 20 Jun 2022 22:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD0D10FB65
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 22:49:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id a10so6532609wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hy0Xdesz3zE5Os2cbPhgUWle+TPKNOoLmrTtPiHUQEo=;
 b=ZYwDRlfKOOYKL+WIoMVmcZBHfH2hZEk5UjfT4f00kyzA1TsSsZ+LLvooOGasTgLcId
 /NSAyz9yGyNuvDaS+3NY3LrQJux2Kre3iqsxIzfjtaHz8yP2JPfiqTY0iIx54VZsLF75
 Bzqxx5NujcXuLdNFG/rKZtgfRcfumIOzcQjIFXgkYjJoapiB7NEOxkt7XIo+thbkpsDZ
 AXPYAD+vnORi81F2kP1c7A3xKDez+YBlJvfQsHH8b+VCDdx2BVjR6HFF0zFQyv0Thecj
 nsZQUG8VQSsn6ub9nbGGdLWLOvXLQCQP14tjSUiP3G3d/xo+501S04egjJ0MAwRhGLpS
 4+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hy0Xdesz3zE5Os2cbPhgUWle+TPKNOoLmrTtPiHUQEo=;
 b=6SK64bIV+L/P44j0JEPiYWHaB+nTk1t48ZS26f5hIho3R9iPpNF8LK2D5es20ODltE
 fPhCl2CzFRFmdxw9nCZwZN9tIAxm6mOm8kKBosK2Uh0o4xgCJJVwhOURWJF/bvcfYQ3h
 P87Z5ZFXZ6Y0bfv6g2JMhV62k8IC1k/znUnvHXnRppaYosPDE9wYeqF2PMXEUIsvLG0h
 wa2DLjqBndUyuUq5l4by3SpTd7usc8JaFth7U8H+WO8o/Kma3h8ShUKIf3VNu5g9ioOT
 JH0/pIkeesSYyvdayCQiksSiV0idqGvXHn7LZ1x4NJ4Z6EPBQj39nI+xvfYN0HElxAHc
 hCwQ==
X-Gm-Message-State: AJIora+EIYDsyS8kRZ1frVEWLI50zs+F5m5KjVPrMF73ZkKV3PAAN+uO
 OFCCYIFv38UwslFPeL8ye8lJ8Q==
X-Google-Smtp-Source: AGRyM1sWkC5yVB3Vh70iYg5zpUyg3STH8l29UNOqYvK+YL6zEEjsIRVCZulowHoh/WC9YX4xPFr8HA==
X-Received: by 2002:a05:600c:4f51:b0:39c:7f6c:a8d6 with SMTP id
 m17-20020a05600c4f5100b0039c7f6ca8d6mr26961636wmq.143.1655765344601; 
 Mon, 20 Jun 2022 15:49:04 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d6989000000b0020c5253d8dcsm14187651wru.40.2022.06.20.15.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 15:49:03 -0700 (PDT)
Message-ID: <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
Date: Mon, 20 Jun 2022 23:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Conor.Dooley@microchip.com, fancer.lancer@gmail.com
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, masahiroy@kernel.org, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, jee.heng.sia@intel.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20/06/2022 23:46, Damien Le Moal wrote:
> On 6/21/22 06:06, Conor.Dooley@microchip.com wrote:
>> On 20/06/2022 21:56, Serge Semin wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>>>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>>>> this.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> index e25d44c218f2..f2b9e3f062cd 100644
>>>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> @@ -135,19 +135,41 @@ properties:
>>>>        of the designware controller, and the upper limit is also subject to
>>>>        controller configuration.
>>>>
>>>> -patternProperties:
>>>> -  "^.*@[0-9a-f]+$":
>>>> -    type: object
>>>> -    properties:
>>>> -      reg:
>>>> -        minimum: 0
>>>> -        maximum: 3
>>>> -
>>>> -      spi-rx-bus-width:
>>>> -        const: 1
>>>> -
>>>> -      spi-tx-bus-width:
>>>> -        const: 1
>>>> +if:
>>>> +  properties:
>>>> +    compatible:
>>>> +      contains:
>>>> +        const: snps,dwc-ssi-1.01a
>>>> +
>>>> +then:
>>>> +  patternProperties:
>>>> +    "^.*@[0-9a-f]+$":
>>>> +      type: object
>>>> +      properties:
>>>> +        reg:
>>>> +          minimum: 0
>>>> +          maximum: 3
>>>> +
>>>> +        spi-rx-bus-width:
>>>> +          const: 4
>>>> +
>>>> +        spi-tx-bus-width:
>>>> +          const: 4
>>>> +
>>>> +else:
>>>> +  patternProperties:
>>>> +    "^.*@[0-9a-f]+$":
>>>> +      type: object
>>>> +      properties:
>>>> +        reg:
>>>> +          minimum: 0
>>>> +          maximum: 3
>>>> +
>>>> +        spi-rx-bus-width:
>>>> +          const: 1
>>>> +
>>>> +        spi-tx-bus-width:
>>>> +          const: 1
>>>
>>> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
>>
>> 8 too? sure.
>>
>>> irrespective from the compatible string. The modern DW APB SSI
>>> controllers of v.4.* and newer also support the enhanced SPI Modes too
>>> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
>>> run-time there is no way to create a DT-schema correctly constraining
>>> the Rx/Tx SPI bus widths. So let's keep the
>>> compatible-string-independent "patternProperties" here but just extend
>>> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
>>> properties values.
>>
>> SGTM!
>>
>>>
>>> Note the DW APB SSI/AHB SSI driver currently doesn't support the
>>> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
>>> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
>>> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
>>> activated by means of the corresponding CSR. So most likely the DW AHB
>>> SSI controllers need some specific setups too.
>>
>> hmm, well I'll leave that up to people that have Canaan hardware!
> 
> I will test this series.
> 

Cool, thanks.
I'll try to get a respin out tomorrow w/ the memory node "unfixed".
Conor.

>> Thanks,
>> Conor.
>>
>>>
>>> -Sergey
>>>
>>>>
>>>>  unevaluatedProperties: false
>>>>
>>>> --
>>>> 2.36.1
>>>>
>>
> 
> 
