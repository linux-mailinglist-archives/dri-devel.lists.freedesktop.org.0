Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F05727A3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 22:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B79514AED9;
	Tue, 12 Jul 2022 20:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAEB14AED9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 20:48:02 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id c15so11321428ljr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T3rJsbQfsC4pWsZ0OeZCZ/yUBmCsy051ZUHKGlMrphY=;
 b=gpV3sjqDMu2bTNevWRp7/qYwFKCnI4WatOzRkblLbcMX8pl0rrbzSwmGVw6Wm65cFm
 8LMvu9ZJleVcrmp1GK2glONYa8z0rJc1n+HG808Kv1derUqS4QQ2mWpqoBhNUVmFrk34
 HT8x2S/i8oJpuVsjvmY3eSOJ1pIaXw/UtO+HK+XjASq6scIQq1pvI4v7jb0H11+QQb3B
 gghLBYITq4QyZCMhRA7LHmWbw+nVDV3nQjyL1x1iJQNtsa8Y45UvDsCJXr/LH3VfYuTX
 KETPUuj+miGHLk0UhAKpuCuh5kG5KAnpyQxeosj6M9E6gLsYaDszPwVeta6ObBLSiw9H
 U9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T3rJsbQfsC4pWsZ0OeZCZ/yUBmCsy051ZUHKGlMrphY=;
 b=inNNrPXeWJKZboIPkgXps55Zz9gmIzPHia7njd5Zw4ZSDlMnpNjkhc2YHvL1TEROe8
 4TAXklnl4OGHGd6XpAOrd9vLgp9OLNHbkrLYyyaG1eKrg5DPaBhl6knfuS9EAY/qQWLl
 ElZ9slws6dyQV2S9LnelUnVEMvL43Dor5hjXY9xYsZKWwF6u4hbN6E3BT57j0B1Av4HH
 IwyWUXnaGtoWhVSGOApK+24+QJ7lv+eSYD7or2ya44LiH3Xlyld3i+d8D0HecEU+T5vK
 m3E8tSgKTmRSo8ebM0CQdQpJCwGv3MQgHDXxmKHWDdHHsI+G9SZMJcrKaBli01OFpfJ6
 6DhA==
X-Gm-Message-State: AJIora9WQ2vpTS2NBatTqcHsmMOLkwiYvaI5RDvDMFvwRfwN3LkjXRHV
 y70LgjDP38V+MGsVq8UbqB3Xyg==
X-Google-Smtp-Source: AGRyM1t5qMhpWpDxR+S01a3b5CFaHgIqWdr5TGwOhHmkVou4JLhSQxAM26Z1QE1BqKfH6t8kbBkK/w==
X-Received: by 2002:a2e:a264:0:b0:25d:63ce:29ed with SMTP id
 k4-20020a2ea264000000b0025d63ce29edmr9891262ljm.32.1657658881171; 
 Tue, 12 Jul 2022 13:48:01 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a2e90d7000000b0025bf4eddbb6sm2673014ljg.133.2022.07.12.13.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:48:00 -0700 (PDT)
Message-ID: <68b8da6a-03e2-9da7-795d-f028bc0ed05b@linaro.org>
Date: Tue, 12 Jul 2022 22:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Sony Tama TD4353 JDI
 display panel
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220712200244.960018-1-konrad.dybcio@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712200244.960018-1-konrad.dybcio@somainline.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2022 22:02, Konrad Dybcio wrote:
> Add bindings for the display panel used on some Sony Xperia XZ2 and XZ2
> Compact smartphones.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../display/panel/sony,td4353-jdi.yaml        | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
> new file mode 100644
> index 000000000000..d75abc72ad1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,td4353-jdi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony TD4353 JDI 5 / 5.7" 2160x1080 MIPI-DSI Panel
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
> +
> +description: |
> +  The Sony TD4353 JDI is a 5 (XZ2c) / 5.7 (XZ2) inch 2160x1080
> +  MIPI-DSI panel, used in Xperia XZ2 and XZ2 Compact smartphones.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sony,td4353-jdi-akari
> +      - sony,td4353-jdi-apollo

Shouldn't the properties of panel like width and height be specified by
dedicated properties, instead of customizing compatible? The device is
"td4353-jdi", the same in both cases, isn't it?

> +
> +  reg: true
> +
> +  backlight: true
> +
> +  vddio-supply:
> +    description: VDDIO 1.8V supply
> +
> +  vsp-supply:
> +    description: Positive 5.5V supply
> +
> +  vsn-supply:
> +    description: Negative 5.5V supply
> +
> +  preset-gpios:
> +    description: Display panel reset pin
> +
> +  treset-gpios:
> +    description: Touch panel reset pin
> +
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddio-supply
> +  - vsp-supply
> +  - vsn-supply
> +  - preset-gpios
> +  - treset-gpios
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel: panel@0 {
> +            compatible = "sony,td4353-jdi-akari";
> +            reg = <0>;
> +
> +            backlight = <&pmi8998_wled>;
> +            vddio-supply = <&vreg_l14a_1p8>;
> +            vsp-supply = <&lab>;
> +            vsn-supply = <&ibb>;
> +            preset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +            treset-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                    panel_in: endpoint {

Inconsistent indentation.

> +                            remote-endpoint = <&dsi0_out>;
> +                    };
> +            };
> +        };
> +    };
> +...


Best regards,
Krzysztof
