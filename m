Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71B961078E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 03:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A594110E021;
	Fri, 28 Oct 2022 01:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9CF10E021
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 01:58:58 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id m6so2620341qkm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 18:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BAW17+BRYm/H3b4WvRIwEV8kXOxv/g6sG9smsLfq3p0=;
 b=vjd0f8z/krQCI2mZcirxzMwClkzC3Hldszir9m1PcZNl5VAXYBpmRo2ls+Z3CZSInj
 j4tlmLK67v0MVs4OGpDoutATgrFPQpizafC6XVVlW6Q3zLxufNHl1PGBQUzwX9TKXjTR
 HoldiZLnPe9s9oDlHkCzvqFs3hd+InNKIqhNPuExt/l/QgTjfuoUPXJloLu8yjn9/ZgP
 Sowaw+Qq+aV17bOJwf5M/Y0Eb4Dmais0JAAaTsNXfpSXdS0XcROkC9mNvC/lGijnFlHn
 o8pNyukvX8+tgODVDBeXz1KGUy5W5PQCukWv4M8CxFGbeoSOL74P+9RVugWtQXf6VIF5
 cLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BAW17+BRYm/H3b4WvRIwEV8kXOxv/g6sG9smsLfq3p0=;
 b=f6iBpBY3Lcbrui3u4bM0fq/O6Qs+BnBWlm9OOEV4IrWHig7r7fIysu0vM7VhMtjuBA
 cyxbezRZ33O60iEXF8+dYKSAa+ggJaDPNU0MBttlUjDLeQxe3L7HVHsgz7vxC3oKv+iE
 NjxgDnd/9EoHs5//Z7lG/tcAskzgBEzhjoy6KJJBKFqbuSw6M0dFbUNmq03xl6NrIZ2k
 qhoZIE8/3C52+QFJe+K0Hy4hJBvAcZWsGkVPmG+2te2aMOCrEwo68O7RB109r59P6OvK
 m2FQyz5rnnAp+CBUV3scG6+5vKO/Uf1/ZUm7wXcGR5PNsfrxY42OtIYHFrKpccuO3eoX
 /ZAA==
X-Gm-Message-State: ACrzQf3VICra3+5aUguMghZURpLvX6zscy6CdfK+mQPjk7KCi50vAMx/
 a0GjvU37QSjTonIkj7khOxDVzA==
X-Google-Smtp-Source: AMsMyM4KNauk+P3PKPfVNAfv2imHHQZUKu47Ls8+K3ykGh6ymSZlm9Yn/lb4RSQzLktpCTirbNrTUQ==
X-Received: by 2002:a05:620a:1452:b0:6ec:3f82:522b with SMTP id
 i18-20020a05620a145200b006ec3f82522bmr36080682qkl.402.1666922337187; 
 Thu, 27 Oct 2022 18:58:57 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 h18-20020ac87d52000000b003998bb7b83asm1694147qtb.90.2022.10.27.18.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 18:58:56 -0700 (PDT)
Message-ID: <d6f14e09-0c24-e19a-0951-bb3ca2219e79@linaro.org>
Date: Thu, 27 Oct 2022 21:58:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v6 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Content-Language: en-US
To: allen <allen.chen@ite.com.tw>
References: <20221027030155.59238-1-allen.chen@ite.com.tw>
 <20221027030155.59238-2-allen.chen@ite.com.tw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027030155.59238-2-allen.chen@ite.com.tw>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-Yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/10/2022 23:01, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Add properties to restrict dp output data-lanes and clock.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Rob asked - Commit msg should explain reason for breaking users.

> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml   | 68 +++++++++++++++++--
>  1 file changed, 62 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 833d11b2303a7..b16a9d9127ddb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -52,9 +52,49 @@ properties:
>      maxItems: 1
>      description: extcon specifier for the Power Delivery
>  
> -  port:
> -    $ref: /schemas/graph.yaml#/properties/port
> -    description: A port node pointing to DPI host port node
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: A port node pointing to DPI host port node
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +            properties:
> +              link-frequencies:
> +                minItems: 1
> +                maxItems: 1
> +                description: Allowed max link frequencies in Hz
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Video port for DP output
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                uniqueItems: true
> +                items:
> +                  - enum: [ 0, 1 ]
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +

This looks ok.

Best regards,
Krzysztof

