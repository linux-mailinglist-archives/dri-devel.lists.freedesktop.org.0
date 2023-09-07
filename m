Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F988797038
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 08:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6A910E761;
	Thu,  7 Sep 2023 06:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589EC10E761
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 06:08:52 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99c1d03e124so58955766b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 23:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694066931; x=1694671731; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3O3RNcMeBxjQQhA0dbRmngWyitShsXqfun7LC7NYjS8=;
 b=YszTcxfHDmUHAYgT66hfgOWOFcEpOSlEWeBAnNl1uZFDlU7ZBzxBNkERAPYab7qBtF
 Urk9gmpbePLOXDk4q0yFtMqUn+ocP8a7w3GQ+NLSMGzh1JnidhWPEpl4BCkCFeVTZlst
 F9NFqwhrXKKOT6WkdlTrNJMlgtsVcsjvGk0kLrqtinjbYAQ3JBbkvTcbQVhhap6RflvT
 WwfPJj8JAiS86vUiVBxs6X77t14ksGct573ILBeVARXg4QE2FgdQN2nWe5l0noHk19j/
 yFOu0lrDcqXPz12lqnMyAWKEODTZUgiHS0gWnvkem3BKMxifmnKtlpqREDjllPrJRuBt
 8c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694066931; x=1694671731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3O3RNcMeBxjQQhA0dbRmngWyitShsXqfun7LC7NYjS8=;
 b=OC64R2u/luhh1QqIsZAlgHQ2QRX6an9J1dEkA5P6snQhPsCeaedDY84k4/KwUzeuee
 Y5ytyykx+k2PSZTb6jNeaJTZKltlPj9txEEBdFnibbfptmCDxRQWNF7fPbf2tqS8lFI+
 wIyxLQAcbhXZCNuxnFMq7hMegXupGOL7LDeR9u1KGQpi/2N+eWsHVRkSTdcA5gYEsRVg
 3WuStz3rUwVKBnC1sgLXkBj1J/hm1KkLDOkIPE+v6jvt9qEG+LlPwC23vD6bolNsH8/4
 S/dvgA/Eysir8Flc38Nuw+OsdzsqFBiGK6iiTqKY4pb1W/RFyU/N/7EpZXZy0v1Xvn1P
 hsMQ==
X-Gm-Message-State: AOJu0YyKPoNRvLz2SLFoEHXVm5nWxZfI4tS0hY/M74WDBIkoRMbcdYKy
 wh1Li1r1+KQdERB8O73bo+t/gQ==
X-Google-Smtp-Source: AGHT+IHTRWxWv8Q4u0fzUOsy1juZlGxj/UwfMeS4tSxa+9HNW5R8xUt9SALZq24RvaBvGYkAQcp1Kg==
X-Received: by 2002:a17:906:9bed:b0:9a5:b95a:1179 with SMTP id
 de45-20020a1709069bed00b009a5b95a1179mr3482874ejc.77.1694066930742; 
 Wed, 06 Sep 2023 23:08:50 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238]) by smtp.gmail.com with ESMTPSA id
 n16-20020a1709061d1000b0097404f4a124sm9903735ejh.2.2023.09.06.23.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 23:08:50 -0700 (PDT)
Message-ID: <5eee2990-5fa6-d4c2-a877-a48afc916198@linaro.org>
Date: Thu, 7 Sep 2023 08:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] dt-bindings: display: Add st7735s driver
Content-Language: en-US
To: Stefan x Nilsson <stefan.x.nilsson@axis.com>,
 David Lechner <david@lechnology.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230906-st7735s-v1-0-add92677c190@axis.com>
 <20230906-st7735s-v1-1-add92677c190@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230906-st7735s-v1-1-add92677c190@axis.com>
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
Cc: devicetree@vger.kernel.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2023 18:22, Stefan x Nilsson wrote:
> Add bindings for a driver for Sitronix st7735s display controller, as
> well as for a Winstar wf0096atyaa3dnn0 0.96" 80x160 TFT panel.

Commit msg and subject: if by "driver" you mean Linux driver, then drop
these references and focus on the hardware.

> 
> Signed-off-by: Stefan x Nilsson <stefan.x.nilsson@axis.com>
> ---
>  .../bindings/display/sitronix,st7735s.yaml         | 81 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735s.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735s.yaml
> new file mode 100644
> index 000000000000..36234ec22fe2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735s.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sitronix,st7735s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sitronix ST7735S Display Panels
> +
> +maintainers:
> +  - Stefan x Nilsson <stefan.x.nilsson@axis.com>
> +
> +description:
> +  This binding is for display panels using a Sitronix ST7735S
> +  controller in SPI mode.

Drop: "This binding is for". Describe the hardware instead.

> +
> +allOf:
> +  - $ref: panel/panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:

You do not have multiple choices here, so why oneOf? Do you expect it to
grow very soon?

> +      - description:
> +          Winstar WF0096ATYAA3DNN0 0.96" 80x160 Color TFT
> +        items:
> +          - enum:
> +              - winstar,wf0096atyaa3dnn0
> +          - const: sitronix,st7735s
> +
> +  dc-gpios:
> +    maxItems: 1
> +    description: Display data/command selection (D/CX)
> +
> +  backlight: true
> +  reg: true
> +  spi-max-frequency: true
> +  reset-gpios: true
> +  rotation: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - dc-gpios
> +
> +additionalProperties: true

This cannot be true. From where did you get such code as example?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    backlight: backlight {
> +            compatible = "gpio-backlight";
> +            gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
> +    };

Drop node, not related.

> +
> +    regdisplay: regulatordisplay {
> +            compatible = "regulator-fixed";
> +            regulator-name = "display";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <100000>;
> +            enable-active-high;

Drop node, not related. Again: from where did you get such example?

> +    };
> +
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            display@0 {
> +                    compatible = "winstar,wf0096atyaa3dnn0","sitronix,st7735s";

You need to fix formatting. Missing space after ,. Wrong indentation.

Use 4 spaces for example indentation.

> +                    reg = <0>;
> +                    spi-max-frequency = <12000000>;
> +                    dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
> +                    reset-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
> +                    backlight = <&backlight>;
> +                    power-supply = <&regdsiplay>;
> +                    rotation = <270>;
> +            };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6308efa121e1..c00b2b9086f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6728,6 +6728,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
>  F:	drivers/gpu/drm/tiny/st7735r.c
>  
> +DRM DRIVER FOR SITRONIX ST7735S PANELS
> +M:	Stefan x Nilsson <stefan.x.nilsson@axis.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc

Do you have the push rights to this repo? If not, then don't add it.

Best regards,
Krzysztof

