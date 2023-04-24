Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2E6ED43B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 20:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C916A10E5AE;
	Mon, 24 Apr 2023 18:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCEA10E5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 18:17:02 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-63b64a32fd2so6486091b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682360222; x=1684952222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H4jpD+0lOC76rH99UvClr3/xF+i6hb/rLXs4X6IWyWs=;
 b=QIPeXC4jltT7/4WYGrzKIVDR+5t2x0I4ktVMVbEMrkNwDV6fQVfhU5xM7uoMFFqbUL
 o7uPorQh8h4ypnFph3M+wMrwqf6qSCSAzuyEhDOcSS4ccMNj+IjMYn6YJeNuzxRODdC4
 Qu/0zByG8IiCk709QAsMmDFUZCfSXNCnNsG4D8JbccYF7dgaTADSG+BlsviSVixAT9Cq
 XZ7+uMceJPu4T6X5ckKdIQEPs7Qorv/r8pp0r41HcmNV3FrpzNATvk3BYj0GKJoBoi6K
 zeNO+4a+vvsNtbpDkRzcI/gLhqkRipZy3fMklHa5XGioxWbDxvlmpTJWC6oPA6hI8M9S
 eHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682360222; x=1684952222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H4jpD+0lOC76rH99UvClr3/xF+i6hb/rLXs4X6IWyWs=;
 b=fw4Bqji5LDu+7AW+7B4zBaW51NPlClrkGnnt47UErbwJ2Q2DsLwh2Ys2hRg9YcyJTp
 UlYt5yehSwwyoPni1rZMIUaSURyRd814v4cFD8OvtrcswZPnuWf5QKaf+Pk4w7N33DbY
 daUKimNwbPbTvnye9crmtsB/pKpz28+YDPU5GaCfrfsV6Ujb98s4xai1aof3ZwOSEjeu
 1oytfNiPe9v3ztMk/N4Q4jSWENfDpbvwgdruRIDjfVjc/41t7CyCMcU29eIgeS8Xavcx
 LHfqD+VknJ7omCrO47AGfGTFk9XekuG3NeRGNZFDagqADuvxHPlj/vpnq++QIlm5lR+1
 pMCA==
X-Gm-Message-State: AAQBX9f4aHir38v6uZLGe9EqtPARES1ymcPv2P8obixhhgJPynSWVYlO
 KNPd8Lql2wc8PEIfKtVKePI=
X-Google-Smtp-Source: AKy350ZEJp+tXoj2zx+EUvJDSy7p4UR1enEVI+rM/GeLTTiRNS5bDnOjRaAqwuLkpBRktmd+Mj50Mw==
X-Received: by 2002:a05:6a20:a111:b0:f3:ae06:c4e6 with SMTP id
 q17-20020a056a20a11100b000f3ae06c4e6mr6588752pzk.6.1682360221838; 
 Mon, 24 Apr 2023 11:17:01 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 p19-20020a056a000b5300b0063b1b84d54csm2862604pfo.213.2023.04.24.11.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 11:17:01 -0700 (PDT)
Message-ID: <8cddf126-d410-aac1-a92d-d15e2fd4b66b@gmail.com>
Date: Mon, 24 Apr 2023 11:16:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next 1/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Content-Language: en-US
To: Justin Chen <justinpopo6@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
 <1681863018-28006-2-git-send-email-justinpopo6@gmail.com>
 <e2069707-3f09-f1e7-6973-a2e115af7536@linaro.org>
 <CAJx26kXnYy9oQiXZ+dbAbzf-jAO9M6ggWL164_67MDS_3cfNnA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAJx26kXnYy9oQiXZ+dbAbzf-jAO9M6ggWL164_67MDS_3cfNnA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, opendmb@gmail.com, andrew@lunn.ch,
 linux@armlinux.org.uk, netdev@vger.kernel.org, richardcochran@gmail.com,
 hkallweit1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, justin.chen@broadcom.com,
 linaro-mm-sig@lists.linaro.org, edumazet@google.com, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, krzysztof.kozlowski+dt@linaro.org,
 kuba@kernel.org, christian.koenig@amd.com, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/24/23 11:14, Justin Chen wrote:
> On Fri, Apr 21, 2023 at 12:29 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 19/04/2023 02:10, Justin Chen wrote:
>>> From: Florian Fainelli <f.fainelli@gmail.com>
>>>
>>> Add a binding document for the Broadcom ASP 2.0 Ethernet
>>> controller.
>>>
>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
>>> ---
>>>   .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 146 +++++++++++++++++++++
>>>   1 file changed, 146 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
>>> new file mode 100644
>>> index 000000000000..3817d722244f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
>>> @@ -0,0 +1,146 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>
>> Drop quotes.
>>
>>> +
>>> +title: Broadcom ASP 2.0 Ethernet controller
>>> +
>>> +maintainers:
>>> +  - Justin Chen <justinpopo6@gmail.com>
>>> +  - Florian Fainelli <f.fainelli@gmail.com>
>>> +
>>> +description: Broadcom Ethernet controller first introduced with 72165
>>> +
>>> +properties:
>>> +  '#address-cells':
>>> +    const: 1
>>> +  '#size-cells':
>>> +    const: 1
>>> +
>>> +  compatible:
>>> +    enum:
>>> +      - brcm,bcm72165-asp-v2.0
>>> +      - brcm,asp-v2.0
>>> +      - brcm,asp-v2.1
>>
>> Is this part of SoC? If so, then SoC compatibles are preferred, not IP
>> block versions.
> We have the same IP on different chips. So no, it isn't tied to a specific SoC.
> 
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +    description: ASP registers
>>
>> Drop description.
>>
>>> +
>>> +  ranges: true
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: RX/TX interrupt
>>> +      - description: Port 0 Wake-on-LAN
>>> +      - description: Port 1 Wake-on-LAN
>>> +
>>> +  clocks:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Drop.
>>
>>> +    description: Phandle to clock controller
>>
>> Drop.
>>
>> Instead maxItems.
>>
>>> +
>>> +  clock-names:
>>> +    const: sw_asp
>>
>> Drop entire property.
>>
>>> +
>>> +  ethernet-ports:
>>> +    type: object
>>> +    properties:
>>> +      '#address-cells':
>>> +        const: 1
>>> +      '#size-cells':
>>> +        const: 0
>>
>> Missing additionalProperties:false. Look at existing bindings how it is
>> done.
>>
>>> +
>>> +    patternProperties:
>>> +      "^port@[0-9]+$":
>>> +        type: object
>>> +
>>> +        $ref: ethernet-controller.yaml#
>>> +
>>> +        properties:
>>> +          reg:
>>> +            maxItems: 1
>>> +            description: Port number
>>> +
>>> +          channel:
>>> +            maxItems: 1
>>> +            description: ASP channel number
>>> +
>>> +        required:
>>> +          - reg
>>> +          - channel
>>> +
>>> +patternProperties:
>>> +  "^mdio@[0-9a-f]+$":
>>> +    type: object
>>> +    $ref: "brcm,unimac-mdio.yaml"
>>> +
>>> +    description:
>>> +      ASP internal UniMAC MDIO bus
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +  - clock-names
>>> +  - ranges
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    asp@9c00000 {
>>
>> Node names should be generic.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>
>>> +        compatible = "brcm,asp-v2.0";
>>> +        reg = <0x9c00000 0x1fff14>;
>>> +        interrupts = <0x0 0x33 0x4>;
>>
>> Use proper defines for flags.
> Not understanding this comment. Can you elaborate?

I believe Krzysztof would prefer that you use:

	interrupts = <GIC_SPI 0x33 IRQ_TYPE_LEVEL_HIGH>

here, which would require using defined from 
include/dt-bindings/interrupt-controller/{arm-gic.h,irq.h}
-- 
Florian

