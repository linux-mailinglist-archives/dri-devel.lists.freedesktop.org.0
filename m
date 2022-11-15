Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21238629864
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 13:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E2F89DFC;
	Tue, 15 Nov 2022 12:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD1189DFC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 12:15:36 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id u11so17195219ljk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 04:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=spp9dkHGZgQDodLByXAhVTEFyPemlJZRHAN1Y7nBNVg=;
 b=ymUYv/Oi6G8aiGdWofIyBdj8GVJ2K/0VU+eb7/Nqt7gB5gZciBnHZJLMeNa0ZtjHZP
 T59m1RJ6vl8+hyKQ9wwaXLL9HibIjD6mEmV9q261LPfLveDJsDx8lEVUfrkLh6UX9o5M
 feMh1R9AuXDxBLrDCNyyv34iJqtw75cIyYkRCJ0zDt+yqVRhBwFhoZd+pjzUH1hXn7kh
 XTQJdi/7HPP8h1zQ4I8+sy6PWW4psEuetF5BuW3omjXJjBgjD0YHb+yUfwXO1YOBC0ax
 w/BPIaYC6+CHBD6fyGpCw9IbLelOusgSzPQl5zEurdmP+PgzJ3YT1h86UKw1pz5HJRwv
 edFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=spp9dkHGZgQDodLByXAhVTEFyPemlJZRHAN1Y7nBNVg=;
 b=iw3Fl5wL9f3pLVFSy7lcE12OR4NlzZGdG1WU0w7AqDQgzTFmCPEP7eVIwBOegNrg8E
 7Czlurd02BW60AhimRwoXrG/UCXrIKibIx9oTt9OrElKHbB2hL6+SOdEOdUyOrk5pGHK
 Rqg1jrJfloLMVly2XOJui8x9/ZSQSny+QvaBa+Us/TD/l1+mwywu1w6igJgplW1CQFU8
 KQTCYKe8aTKR9tZ4mxpXvwzLWydH8niCAXS4GerAt7WbaKNm2lfTRsNac8hXNB9qf5ii
 FRvCz1J7N6NrbfFntOCRIz02wxHng/lEOUSyfHa5GFsw1yHMNUOaLVCj8+ITQ8ax3eRX
 X20g==
X-Gm-Message-State: ANoB5pn+kssjr3BaZUakM6fsBHSijThjPVuzyQdUWvDc8xOo7yHa2Y+9
 a21uu5FrDB3pVTnzQkCMfEL8nA==
X-Google-Smtp-Source: AA0mqf5kyq1KoTRqo1s4x36SAW+o4nEZ0jyMBBgN4JjqAOehEVO/C2NjL3odDI1zFExO9EeV2XWumA==
X-Received: by 2002:a2e:978c:0:b0:278:f59a:c7cf with SMTP id
 y12-20020a2e978c000000b00278f59ac7cfmr4559051lji.72.1668514534738; 
 Tue, 15 Nov 2022 04:15:34 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056512360e00b004a45edc1de2sm2173307lfs.239.2022.11.15.04.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 04:15:34 -0800 (PST)
Message-ID: <eae67ed0-fb60-a825-2ac5-a18a37acd7d3@linaro.org>
Date: Tue, 15 Nov 2022 13:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/23] dt-bindings: display: tegra: vi: add 'vip' property
 and example
Content-Language: en-US
To: luca.ceresoli@bootlin.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-3-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109141852.729246-3-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> The Tegra20 VI peripheral can receive parallel input from the VIP parallel
> input module. Add it to the allowed properties and augment the existing
> nvidia,tegra20-vi example to show a 'vip' property.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> index 782a4b10150a..aab795241dd6 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> @@ -74,6 +74,22 @@ properties:
>    avdd-dsi-csi-supply:
>      description: DSI/CSI power supply. Must supply 1.2 V.
>  
> +  vip:
> +    $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input from the VIP (parallel input capture) module
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +
>  patternProperties:
>    "^csi@[0-9a-f]+$":
>      type: object
> @@ -109,6 +125,22 @@ examples:
>      #include <dt-bindings/clock/tegra20-car.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> +    i2c3 {

Just "i2c"

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

