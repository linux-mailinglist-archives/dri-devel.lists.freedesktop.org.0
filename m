Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A7A64B5C1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 14:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D22710E1DE;
	Tue, 13 Dec 2022 13:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF7110E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 13:07:35 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id 1so4815873lfz.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 05:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4i4GY2IoIa8cufEomfPpTLe28kwoi3FtbheLaKzoazs=;
 b=qe2veQwCIbDY+czEKy7nGSyF/KY8MjEIlfpc7vAQ/w7VUSLslcw1SIw7yFRTyDew8T
 VyTDReF9kGAtR3Ko38NVCdc+es35BeulABkASd588+Tw2kyWg2O7sSV2m3uqsiR4ypFD
 2OequDc64PKD8avmJ5sZd6WBSXiQ4lc0yNF2MHKfdx0YcYAwHimuP6O1bjQwIs7HUJ55
 PNPDJVfYBJCsBAaCYZo/6bAgMvuCSjQNyPlaKTpKueD09gbI6sSCIFMnfccxKb4SPXKf
 1333uDZFYz4kR72ZB9x0Oj4DoyI6vz0/F7+m88KOCXQE7Hk9123LSbf8Yj2smMYpYciS
 Azzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4i4GY2IoIa8cufEomfPpTLe28kwoi3FtbheLaKzoazs=;
 b=UbAzJhP27GNvvfheyFwFXyY5Ai67xNP/pzmwNa1o3i7Wej+G5vlQVsZflHIxacmS28
 rB/QH8LXHJLGo7/BC5UFVrWIgobzK4LflREU7wtumJBcYGQ2vjzZVvTSWvqmCcPulba/
 Ra/tiMdy/4JxCo7ZrHZYc3QY7Ne5GwS/oCbf3YYM3YdW3c+lXTGJUgYv8LjZp7yGwQED
 71YeXCNVseE6WcCrdlpc7ucUAyosVenNlGLiN5fUd/5MiWqE8n/yDb/Fw/tazI87QBHV
 HyZNfM96iSGFf1PVkTq3mVl6klN3ZHQjGNAQ5aT5aZDyJGu3zfEF9ruPvRScol/Uk7LW
 y/cQ==
X-Gm-Message-State: ANoB5pk1di+bASk/Yf6O258zvzQWtJk1igBj/driRYr+HQDvyx+TlxtV
 uyM+aOCygUOgDJDd8lz7vKkUOw==
X-Google-Smtp-Source: AA0mqf4UuGrf1jIShKf0znJ1XQnUsROhhKPlJB55ucG+VnXJmRKGpOoFluo8hPqeQVXEoMPv61zyfA==
X-Received: by 2002:a05:6512:1145:b0:4b5:39fa:6dc with SMTP id
 m5-20020a056512114500b004b539fa06dcmr4924494lfg.18.1670936853370; 
 Tue, 13 Dec 2022 05:07:33 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 11-20020ac25f0b000000b004a03d5c2140sm360384lfq.136.2022.12.13.05.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 05:07:32 -0800 (PST)
Message-ID: <d750c6e8-365c-7443-0847-78b9a6478803@linaro.org>
Date: Tue, 13 Dec 2022 14:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] dt-bindings: display/panel: Add the focaltech gpt3
Content-Language: en-US
To: Christophe Branchereau <cbranchereau@gmail.com>,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net
References: <20221213084203.17729-1-cbranchereau@gmail.com>
 <20221213084203.17729-2-cbranchereau@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213084203.17729-2-cbranchereau@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/12/2022 09:42, Christophe Branchereau wrote:
> Add bindings for the focaltech gpt3, which is a 640x480 3.0" 4:3
> IPS LCD Panel found in the YLM/Anbernic RG300X handheld.
> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> ---
>  .../display/panel/focaltech,gpt3.yaml         | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml b/Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
> new file mode 100644
> index 000000000000..969f117c51ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/focaltech,gpt3.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/focaltech,gpt3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Focaltech GPT3 3.0" (640x480 pixels) IPS LCD panel
> +
> +maintainers:
> +  - Christophe Branchereau <cbranchereau>

That's not a correct email address.

> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: focaltech,gpt3
> +
> +  backlight: true
> +  port: true
> +  power-supply: true

Drop all three - provided by panel-common.yaml

> +  reg: true

maxItems: 1

(or from which other schema does it come?)

> +  reset-gpios: true


Drop - provided by panel-common.yaml

> +
> +required:
> +  - compatible
> +  - reg
> +  - power-supply
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "focaltech,gpt3";
> +            reg = <0>;
> +
> +            spi-max-frequency = <3125000>;
> +
> +            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
> +
> +            backlight = <&backlight>;
> +            power-supply = <&vcc>;
> +
> +            port {
> +                panel_input: endpoint {
> +                    remote-endpoint = <&panel_output>;
> +                };
> +            };
> +        };
> +    };

Best regards,
Krzysztof

