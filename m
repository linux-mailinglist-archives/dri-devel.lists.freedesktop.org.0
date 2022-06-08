Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A046542B76
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4E010E1BF;
	Wed,  8 Jun 2022 09:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426DD10E1BF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:24:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id o7so6932922eja.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zSLdyx64qSe5gyHdS5UlkceB2srWq2wpIjxpdBXJ6s8=;
 b=jWCXP7B8PfneXoA78HERkc5WPZXWIGc4PTf3ej4mJ1w5NNxASuN1mTgM5THK3gz5eM
 vDQdSPs27hgYuMmswEPRhnu7WRi/MWr4V34+WzzC8yg154n3hUTKJcaTHrqNQ6Zpmnj7
 JbA91n12TX41v9Tw8UT2qKLxraz6N9YYg3Fx/nRqYevY+J91DxuoB0t0c9ZYxpMm5WXf
 SdmlyWvXMyLlCCNLNd8UUyLreq+xj3nXjZSi6P/QPMeEqFbeHv26PZ0NqP51eEcNC59N
 OGd59Seqm0KzfoS8cOxoGhh1rug91Lkk4nisNI0c3V5ehiW0iVFWOA3X0rdYeYIc5J09
 XIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zSLdyx64qSe5gyHdS5UlkceB2srWq2wpIjxpdBXJ6s8=;
 b=Tfy6498ZMO7Hw4eEo0Je7syA5m4Kb6vnBlFUX1U/qAigYbwmDVeHoSHeSdgjpW6MQ2
 PoUg/8Pq0RvmTLGRm+gfQgtZG5TmYEbD4igO5qbk2C71oBXj7rjjPl23wTd3APqWJBKT
 SLH3osl/1zDixnkH5iwzo0wGqFajJ1mbGB9NbDFkk1fny5mtbvUPeoDfBYQH0BRRw8pO
 VdPwLhar9nL7kOm2a3z7J7t28ULXumMjcCOTEeQixQc/gGBmeNze2aySBKEaU7tel3uv
 KAV2R3eXpx8isMfl7H3hf5fPBg5uZYoiH+w00ijndV9WMUGY6860f5wXJcm6oKL4eMYb
 +thA==
X-Gm-Message-State: AOAM530nvWj4EbphPBqYJDezu7B3EX2S0MLEZrDgHjTL8ChbUmMf3ags
 XJbw8jtUNok5UgyPzCcT+7tRtw==
X-Google-Smtp-Source: ABdhPJxYV9tBPj4dwnLBO37vz7PvVAGcb41V0vK9tvKORk36nT5oq7EgD1nyvt40Zy6yk44yCYsFAQ==
X-Received: by 2002:a17:907:2d0c:b0:711:e835:f80c with SMTP id
 gs12-20020a1709072d0c00b00711e835f80cmr5450514ejc.257.1654680282700; 
 Wed, 08 Jun 2022 02:24:42 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 b6-20020a17090636c600b006feb6dee4absm8887348ejc.137.2022.06.08.02.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 02:24:42 -0700 (PDT)
Message-ID: <fbc48d41-b2cc-86f6-5f1c-7cfcbdb41e46@linaro.org>
Date: Wed, 8 Jun 2022 11:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-5-pmalani@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607190131.1647511-5-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2022 21:00, Prashant Malani wrote:
> Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
> alternate mode lane traffic between 2 Type-C ports.
> 
> Update the binding to accommodate this usage by introducing a switch
> property.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
>  .../display/bridge/analogix,anx7625.yaml      | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 35a48515836e..7e1f655ddfcc 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -105,6 +105,26 @@ properties:
>        - port@0
>        - port@1
>  
> +  switches:
> +    type: object
> +    description: Set of switches controlling DisplayPort traffic on
> +      outgoing RX/TX lanes to Type C ports.
> +
> +    properties:
> +      switch:

You allow only one switch with such schema, so no need for "switches"...

> +        $ref: /schemas/usb/typec-switch.yaml#
> +        maxItems: 2

Are you sure this works? what are you limiting here with maxItems? I
think you wanted patternProperties...

> +
> +        properties:
> +          reg:
> +            maxItems: 1
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - switch@0

This does not match the property.

You also need unevaluatedProperties:false


> +
>  required:
>    - compatible
>    - reg
> @@ -167,5 +187,41 @@ examples:
>                      };
>                  };
>              };
> +            switches {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                switch@0 {
> +                    compatible = "typec-switch";
> +                    reg = <0>;
> +                    mode-switch;
> +
> +                    ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        port@0 {
> +                            reg = <0>;
> +                            anx_typec0: endpoint {
> +                              remote-endpoint = <&typec_port0>;

Messed up indentation. Your previous patch should also switch to 4-space
as recommended by schema coding style.

> +                            };
> +                        };
> +                    };
> +                };
> +                switch@1 {
> +                    compatible = "typec-switch";
> +                    reg = <1>;
> +                    mode-switch;
> +
> +                    ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        port@0 {
> +                            reg = <0>;
> +                            anx_typec1: endpoint {
> +                              remote-endpoint = <&typec_port1>;

Ditto.

> +                            };
> +                        };
> +                    };
> +                };
> +            };
>          };
>      };


Best regards,
Krzysztof
