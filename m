Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A85680F7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 10:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C8210E18D;
	Wed,  6 Jul 2022 08:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1718910EA31
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 08:19:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id d12so1269455lfq.12
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gDjr8ks/zcETV46JsfKPfwR3f8/Qj094umNODYQnwfE=;
 b=vwpgEGu7gSpWjT7U08K4pkeu5xPCo1IsIY62sZGORbH1QlOSm5lkuAZeVggYLzb5xT
 sxFvZS/0Ujs5GjnRRq3RuihiwzDjFRlaTtZhKwAKBH1eLm1Obtmj4iapO++RvjY9lmMa
 ytGvxzXbGaZVV9qI2kIk3LPtTztVOqiCc+FnPxTwMnH1VXQm+JF4GsL98N4+hlJLLVmA
 WznOu0PVvLJuX8/ivOuhRVsqrH3OhzlAQ+/sjP46CLUjwbPc0pSIHaqSOtMK+m28C7IK
 ljLY93XtF7PWrfnqdvOjq/TLj5HZ2W/bRTj6Py8955zK96vadQD9q3aUT73ykjdeVs8h
 1TXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gDjr8ks/zcETV46JsfKPfwR3f8/Qj094umNODYQnwfE=;
 b=w0HeNbrFtC3qPpQVbP36L32SM7aNMV5L2ZLG5g6etmDMk7iYVYHmwcg7L4VHC5qcoS
 sdVZy9UahVr3JZiS34+2UXjx0LG15XrGIEZBXWWVNdCGccdJSallqZhkG8dYEl4W8yuW
 swNMHmQXQut2Odk7qebVrcOAqdQLtBVCIhxr6bPHdAOtFlZO8VWrZCkKFGrBpamZin4A
 VfPtQTsAidLP5R3hjNBtLGBaRBQF2+gJ6r5F7KPwm8heHTLnBZlVLl8SKRwCp6M56SXS
 7dgVXqrvF4FX9iQS1N/jWvt831ahel4gIjbuEqA93ju+gZ2kzp1M4cltxKeoONUzpa0H
 ucmQ==
X-Gm-Message-State: AJIora+XLieiOwQO5+y91ANZ1obWpem2OxzPaLa78yf95pFChfaNrodB
 WeuhKyWHU6eJefSehIVuRV1Sgg==
X-Google-Smtp-Source: AGRyM1sfqlcGekXlCPdHZ5+96hLd7k3jpzjFHgymZWad0IcOB6L5vuOsGawv+8fZnVsOqoIRkpWdRg==
X-Received: by 2002:a05:6512:3c3:b0:47d:ab07:50e7 with SMTP id
 w3-20020a05651203c300b0047dab0750e7mr23215123lfp.261.1657095572340; 
 Wed, 06 Jul 2022 01:19:32 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a056512200100b004846548df9bsm610460lfb.267.2022.07.06.01.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:19:31 -0700 (PDT)
Message-ID: <189a226c-1664-9a07-cd0d-6ab8242d5443@linaro.org>
Date: Wed, 6 Jul 2022 10:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/5] dt-bindings: display: bridge: cdns,dsi: Add
 compatible for dsi on j721e
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20220705121116.24121-1-r-ravikumar@ti.com>
 <20220705121116.24121-3-r-ravikumar@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705121116.24121-3-r-ravikumar@ti.com>
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 jpawar@cadence.com, lee.jones@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/07/2022 14:11, Rahul T R wrote:
> Add compatible to support dsi bridge on j721e
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  .../bindings/display/bridge/cdns,dsi.yaml     | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> index ccedc73d8c18..33a88b39cf09 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> @@ -14,13 +14,17 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - const: cdns,dsi
> +    enum:
> +      - cdns,dsi
> +      - ti,j721e-dsi
>  
>    reg:
> +    minItems: 1
>      items:
>        - description:
>            Register block for controller's registers.
> +      - description:
> +          Register block for wrapper settings registers in case of TI J7 SoCs.
>  
>    clocks:
>      items:
> @@ -74,6 +78,22 @@ properties:
>  allOf:
>    - $ref: ../dsi-controller.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,j721e-dsi
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +    else:
> +      properties:
> +        reg:
> +          minItems: 1

minItems are not needed here.

> +          maxItems: 1
> +
>  required:
>    - compatible
>    - reg


Best regards,
Krzysztof
