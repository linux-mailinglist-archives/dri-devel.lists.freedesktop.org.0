Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD54C650C68
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 14:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A56C10E2A5;
	Mon, 19 Dec 2022 13:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AE910E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 13:05:03 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b13so13561028lfo.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 05:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uEl6FOWuKZ6UAvDbu88RJHguk6sS9ZMQHT6dYgluwo8=;
 b=R/5PgBXYN7w1BEUCUag9ctmn2yHfIYDc+7U39SyBATEkLrp1YnFu2oN66OukgektU/
 mbno7A9xcaWtKv9gWhNdsBdyYtoapM6RAYvSUtNC8ptvyQC7HngaSIT5/bUD8TFhnsva
 SpPT27ILprpmZUHuijYB1j5Lng7rDSDxlR/VIm3s7yNcMIR2OpzEDgdlVPd9Hg/tC84Z
 bipcn9Cr4tA+hZsFOoaIFW6PCI1VMpaGbJvj/GDEG522BbqhyTecbt9rDohQgQuldaCg
 AibJcJlF23LXi5pvb/QVwNQjhK6avWxKxXUVw46FIbFZ1ApZ+DgW6y6RE7Kq04zs2Gcf
 QPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uEl6FOWuKZ6UAvDbu88RJHguk6sS9ZMQHT6dYgluwo8=;
 b=eLTemdWqOB77z7DexV/GBYLTgbUo0QJv/zQk5+Dkfma31eO5PZI2c/vj0mWsGnzgBH
 UYez/dACfWzKSaUXpt/2C8C6fEvrycoUPU7Fa9sbY4mMwTaYBPSRfo0uWPkNBfCG7KuP
 NxUH7VJ/TFxMlYvaIBl11d/b+C27Kp15wZ25fgqyRMpO24PhUHnmYKXk7HbmOOZqAc9B
 +CKQfgMlV+AnYlEAdAxR4yaRWmS4x886YcmmK9zNgu4xFOtV3ebCoHk6/6Yxz8b13oLP
 B0terb3D0TV95kbcqA/Hp7et8C+IQP/RfevJ1wMuqa2nO4Ud2In9GZS+cA/IZeh9z4is
 9rEA==
X-Gm-Message-State: ANoB5ploO9ffapOZBZfl7mTDKO+EYXhS9BK2XJjBhwY4YT4Ydd3MPVQM
 iQnTchDcBC0gj2UJZ1Bm338XRQ==
X-Google-Smtp-Source: AA0mqf4f6yLjzCLg63fIkw03LtleqxYyfk7pE3QJAm9UmsEgN4eh100In7UsKiQD/PwDJArNOWxX6g==
X-Received: by 2002:a19:e051:0:b0:4b5:b7be:136b with SMTP id
 g17-20020a19e051000000b004b5b7be136bmr10806206lfj.69.1671455101743; 
 Mon, 19 Dec 2022 05:05:01 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a056512370b00b004b4f1ea713csm1097577lfr.73.2022.12.19.05.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 05:05:00 -0800 (PST)
Message-ID: <8db62d1a-365c-d41d-90aa-4c78c5d5e9ce@linaro.org>
Date: Mon, 19 Dec 2022 14:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
To: Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de
References: <fd51df66-147d-d40f-913e-385625a71984@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fd51df66-147d-d40f-913e-385625a71984@gmail.com>
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

On 19/12/2022 13:32, Johan Jonker wrote:
> Convert rockchip-lvds.txt to YAML.
> 
> Changed:
>   Add power-domains property.
>   Requirements between PX30 and RK3288
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V3:
>   Filename matching compatible style
>   Drop "Regulator phandle for "
>   Specify properties and requirements per SoC
>   Sort order and restyle
> 
> Changed V2:
>   Fix title
> ---
>  .../display/rockchip/rockchip,lvds.yaml       | 170 ++++++++++++++++++
>  .../display/rockchip/rockchip-lvds.txt        |  92 ----------
>  2 files changed, 170 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
> new file mode 100644
> index 000000000..03b002a05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip low-voltage differential signal (LVDS) transmitter
> +
> +maintainers:
> +  - Sandy Huang <hjc@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,px30-lvds
> +      - rockchip,rk3288-lvds
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: pclk_lvds
> +
> +  avdd1v0-supply:
> +    description: 1.0V analog power.
> +
> +  avdd1v8-supply:
> +    description: 1.8V analog power.
> +
> +  avdd3v3-supply:
> +    description: 3.3V analog power.
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the general register files syscon.
> +
> +  rockchip,output:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [rgb, lvds, duallvds]
> +    description: This describes the output interface.
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dphy
> +
> +  pinctrl-names:
> +    const: lcdc
> +
> +  pinctrl-0: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port 0 for the VOP input.
> +          The remote endpoint maybe vopb or vopl.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port 1 for either a panel or subsequent encoder.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - rockchip,grf
> +  - rockchip,output
> +  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,px30-lvds
> +
> +    then:
> +      properties:
> +        reg: false
> +        clocks: false
> +        clock-names: false
> +        avdd1v0-supply: false
> +        avdd1v8-supply: false
> +        avdd3v3-supply: false
> +

I see one compatible expects regmap from parent (grf is the parent here)
and other is directly on MMIO bus. Not the best combination... Maybe
this  should be just split to two separate bindings? Looking at driver,
their code is also very different between these two variants.

Best regards,
Krzysztof

