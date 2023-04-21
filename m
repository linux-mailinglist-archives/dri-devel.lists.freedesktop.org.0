Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082286EA4B5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 09:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD33F10EDAA;
	Fri, 21 Apr 2023 07:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64B510EDAA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 07:29:49 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94f910ea993so170544166b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 00:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682062187; x=1684654187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N+iZ1aFyoi01Oag2G0IVEtycCaHj8d8JsSoYMnnAS8s=;
 b=Ux5ynbWj9qHDQvjPzho8jJ1gQ2rb4QipL0X/UAtCqkvo7IZDtVmz74f5nFVkxoK2oW
 e/Hwaxw55z4H8cQ8dTXOQO9SnOUisy/XUhbW/V15gBm7GX8+N8NXFi8WeSOUU2ztdice
 sS1JHQqVHyrPHzOG8qMKQWd4aaXR9mPKYJt38A7HKrctdthX39VX4bBI0e76rCrTClfO
 JkV4BDMB4G0puP7iVT+bFLwgyv07uv+9ie32NqUZzjgSs+T/iTK94VXRicodc5eYYFZc
 9pXeF0kAJDN7/JWfZ1nWQOjFTHbk3L4gQMRJ93LeMNipt/wqgIbPWCU+NUr1nRr8eR3J
 zIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682062187; x=1684654187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N+iZ1aFyoi01Oag2G0IVEtycCaHj8d8JsSoYMnnAS8s=;
 b=K8n53OCOJjP+OK+UWw8QJ/mZyw5nVZa2BRlA4n6kYi/POLoWgybrUNO8eUnujIu0Gr
 iF8lZxCJOVyO3Icv1PPryTMkwtDdUE+UU7UukedKm0pCRpres6FgHVCrpnmdquiN8YeI
 U0c2vebK115T+i0ZNkiagpZ9+axSYu/bTMSMDPqaMt9GUPhtWZp6Vo2euz35RAzl/RLQ
 7MXeMhC4X2lCJ2qSmYbaAQihxBbXU5gRa4g8w6fSrdMi7vit/n28CbwZviO4APdOtCqT
 46IM6hhQfB5XtnfLAsp8PHktO8G1JGF0399JpqyIz4WixZWhNkjL7dBg3Dat7vgOTm+o
 AYBg==
X-Gm-Message-State: AAQBX9cNIjYZdI6pePYoRYyGUnbZ9W6wNTAluN3d+T8V7e/lSMRiJPIo
 0av1DxmMPOoQQUUjW9O1DjyRHw==
X-Google-Smtp-Source: AKy350azq/JG2p2vKeECMHZp/w2A8ZvW4QmweQeB9Z6MJLwx4q7Ifbu/S8dQKqzIgf2nQaaeS+sviA==
X-Received: by 2002:a17:906:35c6:b0:94a:9c9e:6885 with SMTP id
 p6-20020a17090635c600b0094a9c9e6885mr1316489ejb.58.1682062186815; 
 Fri, 21 Apr 2023 00:29:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:668b:1e57:3caa:4d06?
 ([2a02:810d:15c0:828:668b:1e57:3caa:4d06])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a170906169600b0094f3132cb86sm1712708ejd.40.2023.04.21.00.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 00:29:46 -0700 (PDT)
Message-ID: <e2069707-3f09-f1e7-6973-a2e115af7536@linaro.org>
Date: Fri, 21 Apr 2023 09:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next 1/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Content-Language: en-US
To: Justin Chen <justinpopo6@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, bcm-kernel-feedback-list@broadcom.com
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
 <1681863018-28006-2-git-send-email-justinpopo6@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1681863018-28006-2-git-send-email-justinpopo6@gmail.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 02:10, Justin Chen wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> Add a binding document for the Broadcom ASP 2.0 Ethernet
> controller.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> ---
>  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 146 +++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> new file mode 100644
> index 000000000000..3817d722244f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes.

> +
> +title: Broadcom ASP 2.0 Ethernet controller
> +
> +maintainers:
> +  - Justin Chen <justinpopo6@gmail.com>
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +
> +description: Broadcom Ethernet controller first introduced with 72165
> +
> +properties:
> +  '#address-cells':
> +    const: 1
> +  '#size-cells':
> +    const: 1
> +
> +  compatible:
> +    enum:
> +      - brcm,bcm72165-asp-v2.0
> +      - brcm,asp-v2.0
> +      - brcm,asp-v2.1

Is this part of SoC? If so, then SoC compatibles are preferred, not IP
block versions.

> +
> +  reg:
> +    maxItems: 1
> +    description: ASP registers

Drop description.

> +
> +  ranges: true
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: RX/TX interrupt
> +      - description: Port 0 Wake-on-LAN
> +      - description: Port 1 Wake-on-LAN
> +
> +  clocks:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Drop.

> +    description: Phandle to clock controller

Drop.

Instead maxItems.

> +
> +  clock-names:
> +    const: sw_asp

Drop entire property.

> +
> +  ethernet-ports:
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0

Missing additionalProperties:false. Look at existing bindings how it is
done.

> +
> +    patternProperties:
> +      "^port@[0-9]+$":
> +        type: object
> +
> +        $ref: ethernet-controller.yaml#
> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +            description: Port number
> +
> +          channel:
> +            maxItems: 1
> +            description: ASP channel number
> +
> +        required:
> +          - reg
> +          - channel
> +
> +patternProperties:
> +  "^mdio@[0-9a-f]+$":
> +    type: object
> +    $ref: "brcm,unimac-mdio.yaml"
> +
> +    description:
> +      ASP internal UniMAC MDIO bus
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    asp@9c00000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "brcm,asp-v2.0";
> +        reg = <0x9c00000 0x1fff14>;
> +        interrupts = <0x0 0x33 0x4>;

Use proper defines for flags.

> +        ranges;
> +        clocks = <&scmi 14>;
> +        clock-names = "sw_asp";
> +        #address-cells = <1>;
> +        #size-cells = <1>;


Best regards,
Krzysztof

