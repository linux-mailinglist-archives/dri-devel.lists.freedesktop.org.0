Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA33639D10
	for <lists+dri-devel@lfdr.de>; Sun, 27 Nov 2022 21:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D62310E0D1;
	Sun, 27 Nov 2022 20:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8D710E0D1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 20:58:25 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id y5so2328247lji.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 12:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y0DuQsNLT0RY6V02XnWfmVJTL0d/Zc+EKxzoplKAPRg=;
 b=cWTmZztQXVYg/pGFJwKQrIUs9ASsk1f86dyJ6BV6j9A9XNSYJkoTUJihtLQAxxRPh4
 S0GnfVSi8NkiSNJKZoFWgLu0ALu2gO7K4dd0I6ouEmc14PPrJdewmFvK7qfJHsUHM3MF
 bmtvIW0ZPTKrmhMsdlxxteltgm/s3KXePOhwpBwELndHDOSCpcW14A3rCj/VZB5/X8xP
 ogJHRszafv+YN0tpqehqE+NiIUkLCTgys8RE0HG+7o/4RHg6ekANvcjPzCvVFZktrRFX
 ZQGZ3hOShGb/LGWR6YZ5jhU76nSjWic8CmyK3rBtUU1sFJwS6rScaTVhJScrI1pfY6xx
 98ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0DuQsNLT0RY6V02XnWfmVJTL0d/Zc+EKxzoplKAPRg=;
 b=W4ZMF3unXbmIUPYj6mPjRjmbJ816wbO76wiA8+o0CNrCY6uPfixKOSzjRHhBjQmpIv
 rIiwN4AIgZBzWzev3hkG/43h7WRv9lGi+cUG7gN0ZUZNDnhw98oXYDFhsVhltIaerVBr
 ATYyh63e30ISjNUfRgSkRP8KpcUe/cgNGRgPhVzc0rZGvUO+bKtSG1i3Xs8ed+y2CPkA
 Bol0i0/sSIlFMaBgIVHcTC+UM3TVZXVWQMqTmEA2STCk7PIdSI7CEivtY7dO0M+LsW2k
 HNUCzDE3x7MF3P06qf+Kdgx70y37qjDw6dqD1ZqJ7Gu7yLR3jFEDUpOhqE96PC4OSv26
 wWfA==
X-Gm-Message-State: ANoB5pkWfZoK2WdfyoOMmCx9HVFjHVmv2Ju+gbvn4sv6e7hrEOHm+Y9A
 zAjwlK/JPweA8CvcgClv0Y5pRQ==
X-Google-Smtp-Source: AA0mqf7DSbp7zd1DjzQpiy8x4qXr0QOwLtJh8XqXRY3opc8q48qUhIu5CXz2s3UXoaXUh3DG0POO9Q==
X-Received: by 2002:a2e:bcc5:0:b0:279:3851:1420 with SMTP id
 z5-20020a2ebcc5000000b0027938511420mr12784992ljp.265.1669582703489; 
 Sun, 27 Nov 2022 12:58:23 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w10-20020ac25d4a000000b004a8f824466bsm1410359lfd.188.2022.11.27.12.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 12:58:23 -0800 (PST)
Message-ID: <00cc31a2-39b1-9bb3-5b79-3c6d51cd5d51@linaro.org>
Date: Sun, 27 Nov 2022 21:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 3/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
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
 <20221124102056.393220-4-treapking@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124102056.393220-4-treapking@chromium.org>
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
> Analogix 7625 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Also include the link to the product brief in the bindings.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v6:
> - Remove switches node and use endpoints and data-lanes property to
>   describe the connections.

Except missing testing few things...

> 
>  .../display/bridge/analogix,anx7625.yaml      | 73 ++++++++++++++++++-
>  1 file changed, 71 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 4590186c4a0b..5fdbf1f3bab8 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -12,7 +12,8 @@ maintainers:
>  
>  description: |
>    The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> -  designed for portable devices.
> +  designed for portable devices. Product brief is available at
> +  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
>  
>  properties:
>    compatible:
> @@ -112,10 +113,36 @@ properties:
>                data-lanes: true
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/properties/port-base

I don't understand why you are changing this line.

>          description:
>            Video port for panel or connector.
>  
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

These are confusing... you allow only one item, so why minItems and
uniqueItems?

> +                items:
> +                  - enum: [ 0, 1, 2, 3]
> +
> +              mode-switch:
> +                type: boolean
> +                description: Register this node as a Type-C mode switch or not.
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
>      required:
>        - port@0
>        - port@1
> @@ -186,3 +213,45 @@ examples:
>              };
>          };
>      };
> +  - |
> +    &i2c3 {
> +	anx_bridge_dp: anx7625-dp@58 {

Messed up indentation.

> +	    compatible = "analogix,anx7625

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

";
> +	    reg = <0x58>;

Best regards,
Krzysztof

