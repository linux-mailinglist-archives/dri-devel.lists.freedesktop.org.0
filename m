Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B98667D06B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA8010E076;
	Thu, 26 Jan 2023 15:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42B10E076
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:40:01 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so3496327wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7wGuDYxH7Iul+ATYCcdnef/prennloRJ57eEGIhU2qs=;
 b=JWR1Bwfgp4dtDeSgjUY3QBmjI9YsxPO2NZza2CS0FfN0fFK+8IFYU/BOod09jtLRNt
 DDKK+oxqfdSeP1blqfoFDRp8WMUyXb7du2LtJvOhBvjNfOAWCE7gfOwJLSMPU/tiLGvj
 dDYKP2Xa93rErEbGyJpUA5hJ0N9xvb5MG3aIoMDFDdyS27BLfIw6gTm5JEmuM0MulMK2
 d077ayjmflfIS4Yqg2iFoa1txQJXvop2o0JuSTYeOcwEGFRGJLjNKebGLeo6nPaoBj5b
 hJNQZ6dM5E9E+GOg9L7O1AdyvqfJCdUKsE64uC6O/9ssdx9P5/er4CFaJVMtsS7uY3T6
 VCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7wGuDYxH7Iul+ATYCcdnef/prennloRJ57eEGIhU2qs=;
 b=NASre+qQS9o9gPMt0o/iG9AxqU6jtQrXnTzwS48sxfMo9O/ldVlHwrditqFNVDvqmK
 353zZ25Byq2oI9SCroSy9T/Bm78PSrH4NSgXkM7QG3Sp+zthQAtqs/shhLEcl+ORJ7sQ
 koxJtYUsgSH+9Xa3jTfGwUYQaTwTcakDF6Tvf7bCUr8Y4BXnmMCnosLcOSsB6rK6j56j
 1P31pGygcV2mFyGBi4lOWyJGDTbLnB3YKTA93gg9VJ8DUQx477yrTdiag24O6fpCpThD
 xdKTdIb5KwJlkxx6FevM7HoubdNM+M/PQj1/8FTjveFUxgI0n/5mf0odB0Tph2pzTNjX
 Y73A==
X-Gm-Message-State: AFqh2kryJFnDTw3CczrQL5Amc7N2/jWJXAFUJ0VYGRetzGbD+Zg52xaz
 Nb14Vi+t79zCDUWXpPicGYm6pg==
X-Google-Smtp-Source: AMrXdXsxL7BpxR0g9bj985rZVtbY+EqMI8f/SKLBlPBf6vgC4UnHC0wEfDaJkwDXBLm3HvCnb4g5Eg==
X-Received: by 2002:a05:600c:1c9c:b0:3d3:49db:9b25 with SMTP id
 k28-20020a05600c1c9c00b003d349db9b25mr33371738wms.26.1674747600019; 
 Thu, 26 Jan 2023 07:40:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a05600c349300b003cfa622a18asm5232266wmq.3.2023.01.26.07.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 07:39:59 -0800 (PST)
Message-ID: <906b693d-1e85-8c17-cdda-f09ea8f12e7f@linaro.org>
Date: Thu, 26 Jan 2023 16:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: tfp410: Add tfp410 i2c
 example
Content-Language: en-US
To: Jonathan Cormier <jcormier@criticallink.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
 <20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com>
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
 Michael Williamson <michael.williamson@criticallink.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2023 22:09, Jonathan Cormier wrote:
> Add a i2c example with HDMI connector

Why? It's the same - but more on this below.

> 
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>

You need to test the bindings before sending and fix the errors.

> ---
>  .../bindings/display/bridge/ti,tfp410.yaml         | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> index 4c5dd8ec2951..456214f14b47 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> @@ -116,4 +116,46 @@ examples:
>          };
>      };
>  
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hdmi_encoder: tfp410@38 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "ti,tfp410";
> +        reg = <0x38>;
> +
> +        ports {
> +          address-cells = <1>;
> +          size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            tfp410_in: endpoint {
> +              remote-endpoint = <&dpi1_out>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            tfp410_out: endpoint {
> +              remote-endpoint = <&hdmi_connector_in>;
> +            };

That's the same example as existing one, so it looks useless. I don't
see benefits of this example.

> +          };
> +        };
> +      };
> +    };
> +
> +    hdmi: hdmi_connector {

Drop. Incorrect name and not really related.

> +      compatible = "hdmi-connector";
> +      label = "hdmi";
> +      type = "a";
> +      ddc-i2c-bus = <&i2c1>;
> +      port {
> +        hdmi_connector_in: endpoint {
> +          remote-endpoint = <&tfp410_out>;
> +        };
> +      };
> +    };
> +
>  ...
> 

Best regards,
Krzysztof

