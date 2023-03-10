Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E019C6B38E7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE2510E981;
	Fri, 10 Mar 2023 08:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067AF10E981
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:38:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id i34so17370899eda.7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pDVe/ilGCM1upNn+sXA7kF6veY8qJPcVwvcThxhDa6I=;
 b=Pppuz/JUxawEDgmha2lSlsuKf9XEo5uJceQZxG8fZOdPlDwIRI++f8KUoyTdi1SIHS
 X4sXlMNXDbkeuKb3jIUN4o7S7NEkEG05vm7lD5PCJnPhjmgOzY89IEQtKS8dxyxk8J1p
 CfyhenjkMXgLzXcACM5LDZPpRa8/h28POLoty99ux4Xb0Q86qvvbHHOXRmxkf5MV+Kc6
 QdP7NdvX7H5WiLeysJM+Aj6g9JV9sy6/1kkXK3r7A6IdtKIkQar1kh768C/tV89f1G8l
 yzL1HXgEv/znoQ72yptz3rHrY2mOypVUIlhUmH9q0mw/tr9JSHfiV630dBNEKEq1uHas
 L5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDVe/ilGCM1upNn+sXA7kF6veY8qJPcVwvcThxhDa6I=;
 b=4lqrxkYB49M+BXQ53u3SUb4SAV0D7HHED12jMtvuPhxadYpTzLwyN/K6TbRG4Y0519
 JGClmreqd0CV7WPlTgRC/REN5/nnEQnPqOIJoET4pb4SDY6nhUsbZFrQUzZgApLZkm+Y
 dxKHploTrtwa98l7hBhU3UQEUl8+hl/taqpAYepSf7KOIx39z0+ksLpxKkJ2meDqj5RR
 QogJL7ACC+MCq/HzLM/+h19YQ2apQ76gJhTvDqP+fladnyXTHojAIrq2F5a+qSkVJ8vi
 6D7rfj72RJYBPSMUrT/RZjAawzJ2kDLuKtfcnO47IjGYhK1wM0zozKUMZt8ktzQOqy2n
 W7Bw==
X-Gm-Message-State: AO0yUKW1xFVlYu8fe2QUJNfc4eldNEHHseSdpL2aIZEeo6CBk2G60cH5
 qx0xe7kg/5n21w9Gfy2I3SDzVw==
X-Google-Smtp-Source: AK7set/A9FqHxSnqzhC3hpME6V/vzWuY7o2BpQIjGMxyMR4uXXCeSmQQGuphYw5/Z1RGHpprlaNx2Q==
X-Received: by 2002:a17:907:1b1e:b0:7c4:fa17:7203 with SMTP id
 mp30-20020a1709071b1e00b007c4fa177203mr31355684ejc.63.1678437491488; 
 Fri, 10 Mar 2023 00:38:11 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906319600b008ee5356801dsm661622ejy.187.2023.03.10.00.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:38:11 -0800 (PST)
Message-ID: <f908e9f1-2cee-8f9f-5da1-f231febf107b@linaro.org>
Date: Fri, 10 Mar 2023 09:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/21] dt-bindings: display: mediatek: dpi: add binding
 for MT8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-7-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-7-45cbc68e188b@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 15:22, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> DPI for MT8365 is compatible with MT8192 but requires an additional
> clock. Modify the documentation to requires this clock only on MT8365 SoCs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml    | 48 ++++++++++++++++++----
>  1 file changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 56511c4d4b9b..3f6cca81340c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -17,15 +17,20 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt2701-dpi
> -      - mediatek,mt7623-dpi
> -      - mediatek,mt8173-dpi
> -      - mediatek,mt8183-dpi
> -      - mediatek,mt8186-dpi
> -      - mediatek,mt8188-dp-intf
> -      - mediatek,mt8192-dpi
> -      - mediatek,mt8195-dp-intf
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2701-dpi
> +          - mediatek,mt7623-dpi
> +          - mediatek,mt8173-dpi
> +          - mediatek,mt8183-dpi
> +          - mediatek,mt8186-dpi
> +          - mediatek,mt8188-dp-intf
> +          - mediatek,mt8192-dpi
> +          - mediatek,mt8195-dp-intf
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-dpi
> +          - const: mediatek,mt8192-dpi
>  
>    reg:
>      maxItems: 1
> @@ -34,16 +39,20 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 3
>      items:
>        - description: Pixel Clock
>        - description: Engine Clock
>        - description: DPI PLL
> +      - description: DPI Clock
>  
>    clock-names:
> +    minItems: 3
>      items:
>        - const: pixel
>        - const: engine
>        - const: pll
> +      - const: dpi
>  
>    pinctrl-0: true
>    pinctrl-1: true
> @@ -72,6 +81,27 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8365-dpi
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4

We usually set minItems, so it is clear readable that you raise the
lower bracket. Code should be equivalent, but I would say this is less
readable (maxItems: 4 was actually implied by top-level list).



Best regards,
Krzysztof

