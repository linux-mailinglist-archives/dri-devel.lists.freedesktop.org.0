Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A215EC500
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA24E10E943;
	Tue, 27 Sep 2022 13:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B32210E943
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 13:54:34 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so15629880pjq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date;
 bh=5qwETXszsJHRG+KNZAfDuGy2+IIkJBoKDnABLfH60tQ=;
 b=f6CmSv0OlzXmED5tWFMSEinGTJEbhs3apO2o1WVlHEn+fFfXX/l+1/NWVY0KujLper
 X/2WcJl9nH8Xw5kR9mL+LHRjOMu43tSGWSUwpvW9zKPDPXKjDOCRlWV7xlNA4fU9O3uO
 EMLs8HS8JsxOPDDfvIp20W1TauC+8dKOsL0XnOUFHRZiSa+Zbjqid1dyRpVlomKM4otZ
 zh6z3rpfTqgJ1FKaCaI+uRceIOXR7ELINnOEvNzy5OSpCn6dwVULSLU4AeDcDUINb9b0
 wiTFGntz5cRLbyKXTdNoLvrKQdmT7WT5bwZGjE1l5eZ42VfsffuzvLg2MDN0nikd2ZHZ
 OhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
 bh=5qwETXszsJHRG+KNZAfDuGy2+IIkJBoKDnABLfH60tQ=;
 b=eKjUuGbThzjQscl0I6TuBDtDuD/FVStdwMWuN/bXuJrRY7WyWPKoE8Jt93UqW+54oE
 Fhum5JMdAHgcA9l454wju+Ynv0fHxp3DWSVyLxp2Ri1AZlwEn8ARiyv2tUq3UeBE/5I4
 uGQ+OXNOt3MR/69huHhCMtiHmParWBP+ATnx7sl5C55zNKrG/LNibmiCHVsQdooeHOfR
 +P2YzATrUapiFC9O6JrvY83YcrS+DxoMEMY1fKnVFOwoUv060JQBUk//i7FQAjY/Y9Ru
 XCvOmKu0dIxpNYEm1c2XfOq8Mg0ex7JwaMBQEbYswjaKiTsZi++Pa6hVieD27sUDPZ/S
 zVhw==
X-Gm-Message-State: ACrzQf3L2w7zOLBoekE9gqgQCW7kSbVBRl0n83XPtJS8OHDglY0p+39g
 WflmRMa+Pba9XQVr1naJ61KubyJAZUNnH67NoI9xGg==
X-Google-Smtp-Source: AMsMyM4+x7J4OZ7W3bVeH4hHPFvWPmyfihQv01BR+E1ukDBABSgNNIPaY8dNmMrk3y51NserN90WcMrsVcQRB6ZIwYk=
X-Received: by 2002:a17:90b:3807:b0:205:d746:93a0 with SMTP id
 mq7-20020a17090b380700b00205d74693a0mr3837620pjb.188.1664286873871; Tue, 27
 Sep 2022 06:54:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:54:33 -0700
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-4-4844816c9808@baylibre.com>
 <260bb17f-efc8-1287-3e03-f9b8e79a6e31@linaro.org>
In-Reply-To: <260bb17f-efc8-1287-3e03-f9b8e79a6e31@linaro.org>
MIME-Version: 1.0
Date: Tue, 27 Sep 2022 06:54:33 -0700
Message-ID: <CABnWg9vifOaAgwr7tkELUqbQA_1f-FfMFZ9o7sjZCaneo_FUmw@mail.gmail.com>
Subject: Re: [PATCH v1 04/17] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Sep 2022 09:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:56, Guillaume Ranquet wrote:
>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>
>> Make port1 optional for mt8195 as it only supports HDMI tx for now.
>> Requires a ddc-i2c-bus phandle.
>> Requires a power-domains phandle.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> index bdaf0b51e68c..abb231a0694b 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> @@ -21,6 +21,10 @@ properties:
>>        - mediatek,mt7623-hdmi
>>        - mediatek,mt8167-hdmi
>>        - mediatek,mt8173-hdmi
>> +      - mediatek,mt8195-hdmi
>> +
>> +  clocks: true
>> +  clock-names: true
>
>????
>Why is this moved?
>
>>
>>    reg:
>>      maxItems: 1
>> @@ -28,20 +32,6 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>
>> -  clocks:
>> -    items:
>> -      - description: Pixel Clock
>> -      - description: HDMI PLL
>> -      - description: Bit Clock
>> -      - description: S/PDIF Clock
>> -
>> -  clock-names:
>> -    items:
>> -      - const: pixel
>> -      - const: pll
>> -      - const: bclk
>> -      - const: spdif
>
>Clock definition with constraints should stay here. You just customize
>it per variant.
>
Clocks are different between the two hardwares, so I've tried moving everything
inside the if/else block.

Is there a better way to express this?

>> -
>>    phys:
>>      maxItems: 1
>>
>> @@ -58,6 +48,16 @@ properties:
>>      description: |
>>        phandle link and register offset to the system configuration registers.
>>
>> +  ddc-i2c-bus:
>> +    $ref: '/schemas/types.yaml#/definitions/phandle'
>
>Drop quotes
>
>> +    description: Phandle to the ddc-i2c device
>
>Isn't this property of panel?
>
It's a property used in panels and connectors.
But since this IP doesn't use a connector per say, I've added the property here.

Which doesn't sound reasonnable when I'm explaining it like this...
I'll see what I can do to fit a connector and have things look a bit
more standard.

>> +
>> +  power-domains:
>> +    description:
>> +      A phandle and PM domain specifier as defined by bindings
>> +      of the power controller specified by phandle. See
>> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.
>
>No need for this text. This is standard property. You miss maxItems.
>
>
>> +
>>    ports:
>>      $ref: /schemas/graph.yaml#/properties/ports
>>
>> @@ -76,7 +76,6 @@ properties:
>>
>>      required:
>>        - port@0
>> -      - port@1
>>
>>  required:
>>    - compatible
>> @@ -86,9 +85,55 @@ required:
>>    - clock-names
>>    - phys
>>    - phy-names
>> -  - mediatek,syscon-hdmi
>>    - ports
>>
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8195-hdmi
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: APB
>> +            - description: HDCP
>> +            - description: HDCP 24M
>> +            - description: Split HDMI
>> +        clock-names:
>> +          items:
>> +            - const: hdmi_apb_sel
>> +            - const: hdcp_sel
>> +            - const: hdcp24_sel
>> +            - const: split_hdmi
>
>Clocks are entirely different. I am not sure there is benefit in keeping
>these devices in one bindings.
>

I agree with that, but it was requested by CK that the driver and bindings be
as common as possible.

>> +
>> +      required:
>> +        - power-domains
>> +        - ddc-i2c-bus
>
>Blank line,
>
>> +    else:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Pixel Clock
>> +            - description: HDMI PLL
>> +            - description: Bit Clock
>> +            - description: S/PDIF Clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: pixel
>> +            - const: pll
>> +            - const: bclk
>> +            - const: spdif
>> +
>> +        ports:
>> +          required:
>> +            - port@1
>> +
>> +      required:
>> +        - mediatek,syscon-hdmi
>> +
>>  additionalProperties: false
>>
>>  examples:
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> new file mode 100644
>> index 000000000000..3c80bcebe6d3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek HDMI DDC Device Tree Bindings for mt8195
>
>Drop Device Tree Bindings
>
>> +
>> +maintainers:
>> +  - CK Hu <ck.hu@mediatek.com>
>> +  - Jitao shi <jitao.shi@mediatek.com>
>> +
>> +description: |
>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
>
>Why is this different than existing ddc bindings?
>
This ddc is actually part of the MT8195 hdmi IP.

So it is a bit simpler than the mediatek,hdmi-ddc.yaml
As it has only one clock, no reg, no interrupts.

>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt8195-hdmi-ddc
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ddc-i2c
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    hdmiddc0: ddc_i2c {
>
>No underscores in node names. Generic node names.
>
>
>Best regards,
>Krzysztof
>
