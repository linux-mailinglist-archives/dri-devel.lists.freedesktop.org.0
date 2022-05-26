Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1783C534B29
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 10:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1009010F49B;
	Thu, 26 May 2022 08:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79EA10F43D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 08:06:17 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id i40so865302eda.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 01:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sUkmzj/ADcLd5/ZTwCBIMC1VkofTmfRrB5QzPtIaDYU=;
 b=v+j82K8mfWplzPhJgQTvvkdsrW4ep2fg0akniwwQRvQGw1N1vv6rzKO8bLSE87v6RH
 qHY7bpwZM4pu3NQ1CWJElgwg7x4jSDN38D7qilYSji7vcXlebCDtj6I7jFHSHQiC0HVM
 HA16tLdBsMZV6BPjfg2vFdSOUvYRdf4YiRQxFFGyJZB3RXTGPuY1Ie8jQ0HMAnqScPzE
 cGHhqogr+jYP5YubxOScrh6Q0O0ip+lfBTf9CC2M1W34s5MYT4O177ip0u7YSIzThoku
 ZSIu7YadVYQRnw71EncaJBmsf3GGQwvvnSPsKVhggXGFGntOmSVEUsDJDxW89x6vRzDv
 iPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sUkmzj/ADcLd5/ZTwCBIMC1VkofTmfRrB5QzPtIaDYU=;
 b=bFu5MRHbQO5xteaXyzAbQEpcM7R/J16rjD9Hz1IhnWmDcCGH8Iblzq75N060jQFEaN
 8fOHXzCF8WUOVYbdtSPES1W6FZtij0Y4E591yye9uGBNxvZ4MiGEkNw2+5J20GBRx/M+
 ztrYeB77SeioGj1OVv2VQ1XO69/XGCGrTtuu3U926Rs7Ib35E/Ouc0O3dF/S4CezY903
 wesjkiNzboEBFIMYkdwdBv7JMbETAV2Sy/+gxEKD2tPVL+5+rv4IduRdxB7BKNcxFSly
 vda7SNoEqbFjRJ7YLTRIjRaQgNzSG+F050TxLW4vnJ2ekLkyn7EiIcod77dp6g4TIwCa
 Yecg==
X-Gm-Message-State: AOAM532fcf9zRQpOuYUuMVk7bgl9y63eorWVBwKB17HNjE8WcrHN8hMS
 gJKyiM6qfBfB1m9fD88PHq7rIw==
X-Google-Smtp-Source: ABdhPJxWjuIfxzMKDXFsg01+5Vhg8sivYXhTKhgry/uxO/ijt7GFzDqruEKAGFJicT2JghXL094i6Q==
X-Received: by 2002:a05:6402:34c1:b0:42b:4047:20b8 with SMTP id
 w1-20020a05640234c100b0042b404720b8mr26707436edc.88.1653552376113; 
 Thu, 26 May 2022 01:06:16 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 u10-20020a50950a000000b0042617ba63a5sm458132eda.47.2022.05.26.01.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 01:06:15 -0700 (PDT)
Message-ID: <1c7ab94c-a736-c629-bd8c-8a974803e2b9@linaro.org>
Date: Thu, 26 May 2022 10:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: backlight: rt4831: Add the new property
 for ocp level selection
Content-Language: en-US
To: cy_huang <u0084500@gmail.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-2-git-send-email-u0084500@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1653534995-30794-2-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2022 05:16, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add the new property for ocp level selection.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/leds/backlight/richtek,rt4831-backlight.yaml         | 8 ++++++++
>  include/dt-bindings/leds/rt4831-backlight.h                       | 5 +++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> index e0ac686..c1c59de 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
> @@ -47,6 +47,14 @@ properties:
>      minimum: 0
>      maximum: 3
>  
> +  richtek,bled-ocp-sel:

Skip "sel" as it is a shortcut of selection. Name instead:
"richtek,backlight-ocp"


> +    description: |
> +      Backlight OCP level selection, currently support 0.9A/1.2A/1.5A/1.8A

Could you explain here what is OCP (unfold the acronym)?


Best regards,
Krzysztof
