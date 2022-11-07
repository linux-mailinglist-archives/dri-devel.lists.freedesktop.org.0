Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FA261F65E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951C710E379;
	Mon,  7 Nov 2022 14:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65CE10E379
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:42:27 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id o12so17036451lfq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 06:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZfXdjQhTZQkr1X94ZZoUwqUu1jkMou77X3rg8dG96a8=;
 b=YY/rIl083jijvHJKrVqGCLgKhx1v5KpSxBKiU1+0a9eewETgjWVakNpnGhGMKPrXgU
 cO1XJQO7ms2EabCorEz5LwdJjlGCPz21MpkLr+SLY5nglIWcT4dTmCAt7R2Wcv76yuWt
 p0Cgd/gsGoHIDF5So+E1NrRbe8cHiv3++mag11g+FaFv1hRcS8klQrwysIw0VTmqGBR6
 9HdC0oO1CFvTxOOtKywSXSkN7S5iDbHc2GMV/2PX7V2ItPNgLhh04mFuO6sjt605vxAd
 yM8BKtaJs2AvTjF3tQC58gaQ2CzGVEVzIZBoIhmPeANGprFmO3fgZwoQKGDEXFdPdXyb
 Yhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZfXdjQhTZQkr1X94ZZoUwqUu1jkMou77X3rg8dG96a8=;
 b=F67vzVNWhxQxYE8bCpM6x1qg1RYcQ8ysguBHdz/x9xj6E35KJ5rRIi9yzYVZh6a55u
 UzwFreoch9wbtpmEnOUiSH/0p1bRojouAw/tdl+PS0VMAJl/8gE99y38dW/Mo/0gywMP
 POroDDJczPOppeE0WE7PA7ekUbnEHsJWAbpBMW6y+msktPIlG4yd174RJxGv9qK5zwHJ
 Af/fin7cLkmGskBTqGNkeTNCm+0mMt1v+QrYgSZ0uKV5rL/aiclmtobG1IDjsi1FLXKO
 cLjq10MOmgu7d3OJHCh9c6EUeXpNUEZ+swR4J27zaUdofQq7yI4U6OgaAdR+Yv9W0eVb
 veaA==
X-Gm-Message-State: ACrzQf1cAKW7BH221rOYn3CgT392TzpywP02vTLBHcQDsiOD2r3VMLRO
 xA5rTnnFNaS9TaKsXyUCa0lvLfTT5NYXwLiBiSWfmg==
X-Google-Smtp-Source: AMsMyM4obaHSDFPifKElHvH7PBL0HAA5pZ3NjQn/6AtTpDJdt3UiOIE4TO8MH3JiH/CTme2Sfp3yxRp/Y7LOmjXfHcA=
X-Received: by 2002:a19:8c57:0:b0:4ae:2436:818c with SMTP id
 i23-20020a198c57000000b004ae2436818cmr368888lfj.346.1667832145955; Mon, 07
 Nov 2022 06:42:25 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Nov 2022 14:42:25 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-2-a803f2660127@baylibre.com>
 <ab8528cc-fa5d-35da-0c6e-cdebc694f646@linaro.org>
In-Reply-To: <ab8528cc-fa5d-35da-0c6e-cdebc694f646@linaro.org>
MIME-Version: 1.0
Date: Mon, 7 Nov 2022 14:42:25 +0000
Message-ID: <CABnWg9vNWiz+2Ms6oJ2e3fp502m4o3Vx12PWZCk-FoV-Vw55+Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Nov 2022 11:02, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 04/11/2022 15:09, Guillaume Ranquet wrote:
>> Add mt8195 SoC bindings for hdmi and hdmi-ddc
>>
>> On mt8195 the ddc i2c controller is part of the hdmi IP block and thus has no
>> specific register range, power domain or interrupt, making it simpler
>> than its the legacy "mediatek,hdmi-ddc" binding.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>> ---
>>  .../bindings/display/mediatek/mediatek,hdmi.yaml   | 61 ++++++++++++++++++----
>>  .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml | 51 ++++++++++++++++++
>>  2 files changed, 101 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> index bdaf0b51e68c..9710b7b6e9bf 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
>> @@ -21,6 +21,7 @@ properties:
>>        - mediatek,mt7623-hdmi
>>        - mediatek,mt8167-hdmi
>>        - mediatek,mt8173-hdmi
>> +      - mediatek,mt8195-hdmi
>>
>>    reg:
>>      maxItems: 1
>> @@ -29,18 +30,12 @@ properties:
>>      maxItems: 1
>>
>>    clocks:
>> -    items:
>> -      - description: Pixel Clock
>> -      - description: HDMI PLL
>> -      - description: Bit Clock
>> -      - description: S/PDIF Clock
>> +    minItems: 4
>
>Drop minItems, it's not needed when equal to maxItems.
>
>> +    maxItems: 4
>>
>>    clock-names:
>> -    items:
>> -      - const: pixel
>> -      - const: pll
>> -      - const: bclk
>> -      - const: spdif
>> +    minItems: 4
>
>Drop minItems, it's not needed when equal to maxItems.
>
>
>> +    maxItems: 4
>>
>>    phys:
>>      maxItems: 1
>> @@ -58,6 +53,9 @@ properties:
>>      description: |
>>        phandle link and register offset to the system configuration registers.
>>
>> +  power-domains:
>> +    maxItems: 1
>> +
>>    ports:
>>      $ref: /schemas/graph.yaml#/properties/ports
>>
>> @@ -86,9 +84,50 @@ required:
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
>> +
>> +      required:
>> +        - power-domains
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
>> +      required:
>> +        - mediatek,syscon-hdmi
>> +
>>  additionalProperties: false
>>
>>  examples:
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> new file mode 100644
>> index 000000000000..2dc273689584
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek HDMI DDC for mt8195
>> +
>> +maintainers:
>> +  - CK Hu <ck.hu@mediatek.com>
>> +  - Jitao shi <jitao.shi@mediatek.com>
>> +
>> +description: |
>> +  The HDMI DDC i2c controller is used to interface with the HDMI DDC pins.
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
>> +      - const: ddc
>
>Unless you expect it to grow, I propose to drop clock-names. It's not
>useful when the name is the same as name of hardware.
>
>Best regards,
>Krzysztof
>

Thx for your suggestions, I'll apply them in v4.

Thx,
Guillaume.
