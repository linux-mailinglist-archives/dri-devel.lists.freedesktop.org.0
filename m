Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFECB650D2A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 15:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0191910E2A9;
	Mon, 19 Dec 2022 14:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1499F10E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 14:23:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id qk9so21865866ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 06:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gkz73r1Eb7Lcu2UFxAAgyawdXAVgK+nUDNDZI6NypmI=;
 b=lrK6/UvA0iB5QyZKs21O4DDtfVksA/wJmDdFI3vbYuBtAGlQGsgPT2fh0Cf4N2QS6x
 oamZ0dNV7Qyl2NQRqZAx42e2t8jodmut605Os1ZviwfCuRiKPFa7UIqCkRYYjq5iIE55
 hEIjMexAke+0iT2SP4qc2qmrW/R0KoWPj8ALc7WK51KklI+NqE8Wf762Qu2/w/3XbJtp
 O6P7AsGQKBIiPvXrnV2bsYc6rb9mJmfvnzQYgHZX1LzfzTbSzXUhzk+m1P114Q4srqx9
 v9QAGqLXUIfVAcjksSORECeS8nRpfNkYx52r1KboWugeZ6Cx1qlSg2h8+vhuLgBQ6/vu
 ws+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gkz73r1Eb7Lcu2UFxAAgyawdXAVgK+nUDNDZI6NypmI=;
 b=wdsOTozzCdOysmJLbBHtb7U/vOv+8n28ey6cLmzvRuehIjJUMLEIuBC9p8rf8BDdO8
 Jd6J+0PgftS6j/WfjCMvn/+YHSZzzpKOwLhGxwXZDR5ZLrpT5oYdBm3ZjVUe5hu2k5UY
 GJv7qALYl+VU0x5A0isuYd9WLqLWETUgQhpmhIdfCKKAmFzKB1DNhUyG9zwWJPLybhXi
 a5EZziERxsq9ixymVGXgU6J/9m58PTS/mKLa+JFsI3XrI6NfHZhj9aELFm2oduw/xgR5
 hEBd3E73noYz8LwRji70ISBhGS7n2pAiYuh/hlb4KkMvQtpLhtykLn2U3Yjw4HfYW2lg
 ER0g==
X-Gm-Message-State: ANoB5pnnLDuHltmdyTdWbxTAqsI/7EDDyUB9khlHHFUTamo7RffGX2v0
 sYuFfmpK/SKUrW8G7/kl/UI=
X-Google-Smtp-Source: AA0mqf4Glrj80Pn6SO+5YOa1CODh03vabAMBUtymLKCKDN//Cz/MMQ0Pk5yKzavBrdNqIg2OJ2YxFA==
X-Received: by 2002:a17:906:1711:b0:7c1:3fbd:d569 with SMTP id
 c17-20020a170906171100b007c13fbdd569mr33253033eje.8.1671459813432; 
 Mon, 19 Dec 2022 06:23:33 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090652c500b007c4fbb79535sm4399120ejn.82.2022.12.19.06.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 06:23:32 -0800 (PST)
Message-ID: <5e05a6d5-bc89-fb66-fcae-2e1194e23c12@gmail.com>
Date: Mon, 19 Dec 2022 15:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, heiko@sntech.de
References: <fd51df66-147d-d40f-913e-385625a71984@gmail.com>
 <8db62d1a-365c-d41d-90aa-4c78c5d5e9ce@linaro.org>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <8db62d1a-365c-d41d-90aa-4c78c5d5e9ce@linaro.org>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/19/22 14:04, Krzysztof Kozlowski wrote:
> On 19/12/2022 13:32, Johan Jonker wrote:
>> Convert rockchip-lvds.txt to YAML.
>>
>> Changed:
>>   Add power-domains property.
>>   Requirements between PX30 and RK3288
>>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>
>> Changed V3:
>>   Filename matching compatible style
>>   Drop "Regulator phandle for "
>>   Specify properties and requirements per SoC
>>   Sort order and restyle
>>
>> Changed V2:
>>   Fix title
>> ---
>>  .../display/rockchip/rockchip,lvds.yaml       | 170 ++++++++++++++++++
>>  .../display/rockchip/rockchip-lvds.txt        |  92 ----------
>>  2 files changed, 170 insertions(+), 92 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>> new file mode 100644
>> index 000000000..03b002a05
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>> @@ -0,0 +1,170 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,lvds.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip low-voltage differential signal (LVDS) transmitter
>> +
>> +maintainers:
>> +  - Sandy Huang <hjc@rock-chips.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - rockchip,px30-lvds
>> +      - rockchip,rk3288-lvds
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: pclk_lvds
>> +
>> +  avdd1v0-supply:
>> +    description: 1.0V analog power.
>> +
>> +  avdd1v8-supply:
>> +    description: 1.8V analog power.
>> +
>> +  avdd3v3-supply:
>> +    description: 3.3V analog power.
>> +
>> +  rockchip,grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to the general register files syscon.
>> +
>> +  rockchip,output:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum: [rgb, lvds, duallvds]
>> +    description: This describes the output interface.
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: dphy
>> +
>> +  pinctrl-names:
>> +    const: lcdc
>> +
>> +  pinctrl-0: true
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Video port 0 for the VOP input.
>> +          The remote endpoint maybe vopb or vopl.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Video port 1 for either a panel or subsequent encoder.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - rockchip,grf
>> +  - rockchip,output
>> +  - ports
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: rockchip,px30-lvds
>> +
>> +    then:
>> +      properties:
>> +        reg: false
>> +        clocks: false
>> +        clock-names: false
>> +        avdd1v0-supply: false
>> +        avdd1v8-supply: false
>> +        avdd3v3-supply: false
>> +
> 

> I see one compatible expects regmap from parent (grf is the parent here)
> and other is directly on MMIO bus. Not the best combination... Maybe
> this  should be just split to two separate bindings? Looking at driver,
> their code is also very different between these two variants.

Looking at the manufacturer tree we can expect the rest with grf parent, but also in the same driver combined with different registers and common probe.
Due to common probe I prefer one common document.

Johan

===

https://github.com/rockchip-linux/kernel/blob/develop-5.10/drivers/gpu/drm/rockchip/rockchip_lvds.c#L671


rockchip,rk3126-lvds
https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm/boot/dts/rk312x.dtsi#L914

rockchip,rk3368-lvds
https://github.com/rockchip-linux/kernel/blob/develop-4.4/arch/arm64/boot/dts/rockchip/rk3368.dtsi#L1196

rockchip,rk3568-lvds
https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3568.dtsi#L734

> 
> Best regards,
> Krzysztof
> 
