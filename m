Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB6639D12
	for <lists+dri-devel@lfdr.de>; Sun, 27 Nov 2022 22:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E5610E149;
	Sun, 27 Nov 2022 21:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB9210E149
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 21:02:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bp15so14537570lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 13:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YG9C8Je6fOUrC9EBgB6xvA4FHLC3Tgsmhxw2CT4bktI=;
 b=GN2Qt9uZ5uhkxgBh58GG3jZ43mc+iwVYeEMNV3OOsR3CA/ZqKa2ZeT7+oSac3hUAW/
 DBJQHIYaV/VXrvIIET1l/2qms3ULfWJu6ygEjctNV3S+nLp4eRK729aGLJA0cyPlSmDJ
 IACAHnFBpgvSad/+Vm0uvW4W8Cls7VcH22J/gOPkHE0BVQSjL1Gt7OMKtohi2l029//x
 rSB0ylRIKGo9wC4HVT7ZbNcTQavF3KC1DQKXH/OwN3p7wdxELZNRNd4b47WTPYslAH/b
 kqD9V6SKRzR4pkHa/Yxpx8jNk1Ek2zP9sg08/+M1EGk+CjpnleiHGTMJ3++z5GNaKlTb
 2ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YG9C8Je6fOUrC9EBgB6xvA4FHLC3Tgsmhxw2CT4bktI=;
 b=MQoklZyjopWLIUOQ17mbbZKZn7w99Af2H8E3C7xlaV+TLBA1UtDD4T+fHFLZRwiFzE
 Ypyb8b/2jJ3Azt3Fc3CbvMvu45AP+fF/LLc8nAwZ6mJ/HyOqjsDTib41NCjFt0Yc6TKN
 z4HJnCS0ZHe85IkwWzfCKJ7O0u72hKKQ14kIqeQ9BCEZXP7Wq2RfC/As2NtbpwLBJKh5
 ZSXQvUh6CAoQ7dSkTxKcaWccDDunn5Pb+o8YbNoYX2lr2rJKbBny74ClFEfv7u6IQgbK
 Go3b6zVT/1Y+YtLp1SDA5hW7uchl3R5u7KKnGmKKG6gOJNj5XJh5f8+cPP7VyEwzbUt0
 gaIA==
X-Gm-Message-State: ANoB5pn2zSqgcPguBAEDedsmW9ehNwHKvY5hetKUOLV0SeCdbLRl69qO
 hi+qQuEoBz2OcTgQFXgHqfa2+A==
X-Google-Smtp-Source: AA0mqf6+KhkW7HMo9DsQNAJ3vjBKT6NzKVCWbqHwEcMy871JpyCK4dnJ9wP25L4Ys5FqpqLH0nxz1A==
X-Received: by 2002:ac2:4acc:0:b0:4b4:10ca:5240 with SMTP id
 m12-20020ac24acc000000b004b410ca5240mr17464297lfp.482.1669582967708; 
 Sun, 27 Nov 2022 13:02:47 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056512371100b004b4bae1a05asm1405515lfr.293.2022.11.27.13.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 13:02:47 -0800 (PST)
Message-ID: <a2a8cd80-a614-e96f-90ab-a98c60527344@linaro.org>
Date: Sun, 27 Nov 2022 22:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 6/7] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-7-treapking@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124102056.393220-7-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-acpi@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/11/2022 11:20, Pin-yen Lin wrote:
> ITE IT6505 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v6:
> - Remove switches node and use endpoints and data-lanes property to
>   describe the connections.
> 
>  .../bindings/display/bridge/ite,it6505.yaml   | 94 ++++++++++++++++++-
>  1 file changed, 90 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 833d11b2303a..b4b9881c7759 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -52,9 +52,53 @@ properties:
>      maxItems: 1
>      description: extcon specifier for the Power Delivery
>  
> -  port:
> -    $ref: /schemas/graph.yaml#/properties/port
> -    description: A port node pointing to DPI host port node
> +  data-lanes:
> +    maxItems: 1
> +    description: restrict the dp output data-lanes with value of 1-4

Hm, where is the definition of this type? For example it comes with
video-interfaces, which you did not reference here.

> +
> +  max-pixel-clock-khz:

There is no such unit accepted:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml

> +    maxItems: 1

maxItems of what type? What is this?

> +    description: restrict max pixel clock
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

This is incompatible change... how do you handle now ABI break?

> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

Why changing the ref?

> +        unevaluatedProperties: false
> +        description: A port node pointing to DPI host port node
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port-base
> +        description:
> +          Video port for panel or connector.
> +
> +        patternProperties:
> +          "^endpoint@[01]$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            type: object
> +            unevaluatedProperties: false
> +
> +            properties:
> +              reg:
> +                maxItems: 1
> +
> +              remote-endpoint: true
> +
> +              data-lanes:
> +                minItems: 1
> +                uniqueItems: true
> +                items:
> +                  - enum: [ 0, 1, 2, 3]

Same problem as your previouspatch.

> +
> +              mode-switch:
> +                type: boolean
> +                description: Register this node as a Type-C mode switch or not.
> +
> +	    required:
> +        - reg
> +	      - remote-endpoint
>  
>  required:
>    - compatible
> @@ -62,7 +106,7 @@ required:
>    - pwr18-supply
>    - interrupts
>    - reset-gpios
> -  - extcon
> +  - ports
>  
>  additionalProperties: false
>  
> @@ -92,3 +136,45 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    &i2c3 {
> +        clock-frequency = <100000>;
> +
> +        it6505dptx: it6505dptx@5c {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "ite,it6505";
> +            interrupts = <8 IRQ_TYPE_LEVEL_LOW 8 0>;
> +            reg = <0x5c>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&it6505_pins>;
> +            ovdd-supply = <&mt6366_vsim2_reg>;
> +            pwr18-supply = <&pp1800_dpbrdg_dx>;
> +            reset-gpios = <&pio 177 0>;
> +            hpd-gpios = <&pio 10 0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    it6505_in: endpoint {
> +                        remote-endpoint = <&dpi_out>;
> +                    };
> +                };
> +                port@1 {
> +                    reg = <1>;
> +                    ite_typec0: endpoint@0 {
> +                        mode-switch;
> +                        data-lanes = <0 1>;

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof

