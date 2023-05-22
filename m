Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F070B25B
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 02:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC26010E218;
	Mon, 22 May 2023 00:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167BA10E218
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 00:10:17 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f4b256a0c9so230214e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684714214; x=1687306214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pPS5fFkqpvMee14hrF/ikA2TPC8pX3LGfU7DUbhIJaE=;
 b=RRq0kg+dVq0QFsR0lMDQ6lhbr7Je1zV4BxIzbCLuQmhkrOyqwCc0CZMVHvClD4l7f4
 RVVnEUWAEnOW/v/4IWYs1VYqVzzCrqAi0wPvNSVUu4IAVsZC41zro2qIey1BQm4iMJUO
 7AdGizqL1+HNGAqgzEWerh6onZ8M2XjiQ4GadTD6dG9ktqD6JU/Ek7Xz20TAG2ZaqcBr
 4EG9LrXx5/l/jbFic45fKr8VBhbQzTxiW+tuhoFiDIwg9x3ja20pcUDfI1l2o5kv2jaI
 EMfus+3IWkCmnDWjEYCuXg415TIJnpZAZJHkmYM97XmmGiDiHrVISQxCRjIQt1nUeFzJ
 kYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684714214; x=1687306214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pPS5fFkqpvMee14hrF/ikA2TPC8pX3LGfU7DUbhIJaE=;
 b=Nm2rQR1lW5o5NKf0xD4tCN2D40jLEnWwRj2Tu02j4jKnVqGseHibOVVTpNYTVCZYyC
 Sp7rbxiGevTYnE6jkA/xTWCJa31xya87VhzPztISk0sDrOMFUBre3UeKHg3q4VZTOStV
 4HIk72Vn98tHwjIPPC+THZ5TTwW1h4Qk8tf5P7esszRpkNLPhafH9J3bNmH5T9Yd3/1M
 2fBZanB7UTk0CDv9W4qZNnEAEZkBSH1s8LBsMJrKuzu1aSojGEg0QAqSOH2RI+E6C6BW
 HffqXgNLmFFN3E+dMW36RlTzJzYKpPgbw6Rq6yso1w1hHAuy+yag+CYHgKc0STzrNdHy
 9ISw==
X-Gm-Message-State: AC+VfDyAOdpAh0irbyO5RlT8/tlSCttsNxWYvHDpMqkxzSOew3C1kCct
 +8nbmXOzgNkL03+6VQLt5vTsSEgK2/0inOit0mA=
X-Google-Smtp-Source: ACHHUZ6mN4N4LRHuUJJtMSitJvgcoIgwFaOiovO3hUvVPxYCIHTdas6PwiLuCVdlTx6+16LFUpYesA==
X-Received: by 2002:a05:6512:11e7:b0:4dd:af29:92c1 with SMTP id
 p7-20020a05651211e700b004ddaf2992c1mr2656182lfs.44.1684714213909; 
 Sun, 21 May 2023 17:10:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d30-20020ac25ede000000b004f26f437ad8sm769258lfq.53.2023.05.21.17.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 17:10:13 -0700 (PDT)
Message-ID: <43d9d6f4-0780-5605-211d-87cc2b2e2688@linaro.org>
Date: Mon, 22 May 2023 03:10:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC 02/10] dt-bindings: display: panel: Describe Sony
 Xperia XZ3's LGD panel
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Caleb Connolly <caleb@connolly.tech>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-2-541c341d6bee@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230521-drm-panels-sony-v1-2-541c341d6bee@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 00:23, Marijn Suijten wrote:
> Document the LG-Display OLED panel found in the Sony Xperia XZ3.

According to find chineese market this is LG LH599QH3-EDB1

> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../bindings/display/panel/sony,akatsuki-lgd.yaml  | 71 ++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,akatsuki-lgd.yaml b/Documentation/devicetree/bindings/display/panel/sony,akatsuki-lgd.yaml
> new file mode 100644
> index 0000000000000..523e580b70c7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sony,akatsuki-lgd.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,akatsuki-lgd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony Xperia XZ3 LG Display 1440x2880 6.0" OLED DSI panel
> +
> +maintainers:
> +  - Marijn Suijten <marijn.suijten@somainline.org>
> +
> +description: |
> +  This is an unnamed 6.0" 1440x2880 (9:18 aspect ratio) 60 hz panel
> +  produced by LG Display, found in the Sony Xperia XZ3 smartphone.
> +  It is always programmed with DSI 1.1. enabled.
> +
> +  The assembly features an Atmel maXTouch digitizer, described separately
> +  as atmel,maxtouch.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,akatsuki-lgd
> +
> +  port: true
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios: true
> +
> +  vddio-supply:
> +    description: I/O voltage supply (1.8V)
> +
> +required:
> +  - compatible
> +  - port
> +  - reg
> +  - reset-gpios
> +  - vddio-supply
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
> +        panel@0 {
> +            compatible = "sony,akatsuki-lgd";
> +            reg = <0>;
> +
> +            vddio-supply = <&vreg_l14a_1p8>;
> +
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> +
> 

-- 
With best wishes
Dmitry

