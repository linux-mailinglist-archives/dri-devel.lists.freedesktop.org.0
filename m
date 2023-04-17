Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D16E40C4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB7010E089;
	Mon, 17 Apr 2023 07:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677AE10E03C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:24:50 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso2974755e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681716289; x=1684308289;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=22NBFkAZpBEWVRcdbiSgrM/DQCt9Fz457g4INDypDTU=;
 b=ws8oMDzd81sxCrNKjw3kpcn76VTuR/IiRRQ+QSIYrp9zwn8lAekqgzN3LhjovKwRFm
 rxmk8qZQ9z8Ku8oA+ogSuBUuD1hrCUW0aGcRvUA1GMlQblgTLkwSFPRYYU2lO6RdsBS9
 XXk7gGuU0hZVQE7FUk4tRTB9DpdkUj05koLY+qqQCeD0kitxzjiQzgeuKzRdjvTr+owo
 jTfjFndKG58oSncZdJCX4LyGtylmRtDj02ibZ50EytCq0cbecXiFSjzI2OpXr6972XeQ
 ksMkX0c8yxvbqzMai/1/rxZnbnfg7fHIQH0J1Xx1wLQLwDJ+xiM0AafrD+5rtl+wFWEu
 cBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681716289; x=1684308289;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=22NBFkAZpBEWVRcdbiSgrM/DQCt9Fz457g4INDypDTU=;
 b=ZMLja+Kt1fZHAVzeG1Nl/w7EYiVLBEMwVkKy/koTRaMbriALlBj612eVVHSogNePrH
 fadEO1ukpAwJyLFVXVhdhiIZXJEu/4QfDGK0Kr4Soolb6utr9WHlesUfIQYguen9GQu1
 l3082suzh2W80AuyoUkpDvXlLLlibIbXFv2zLTpI5YsvZxhdpfgqxVED9zLjue+QHk/p
 /Xx38q6UdBFXJSRPPv67whdy9cTiT15Abybh2vDMp5BanPIYQ31kAz9Z0IZw35yLJmlQ
 nIHudfANoE6+D6FUVSffqmQRfzjIHtdXoA1HaQQxHyYmh3mqFyWvIblazSbYMVhaPuPj
 P7cg==
X-Gm-Message-State: AAQBX9fdeHgXo/O3VJFDVZbvg8TN/JxDCzE/867+Vp/fzD8JOZNVho9z
 xltpu5uW8oZ0EL0lrjqf+VIXwA==
X-Google-Smtp-Source: AKy350ZT3rUaSRfkAshIfCc8Uf3pZEYw3cF9SrNeYfj680ogrumtR/gBPGLWWYlueBxbmRo2BMX+GQ==
X-Received: by 2002:adf:ce12:0:b0:2ef:b137:37fe with SMTP id
 p18-20020adfce12000000b002efb13737femr4408130wrn.0.1681716288740; 
 Mon, 17 Apr 2023 00:24:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91?
 ([2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91])
 by smtp.gmail.com with ESMTPSA id
 s15-20020adfea8f000000b002d1801018e2sm9768428wrm.63.2023.04.17.00.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:24:48 -0700 (PDT)
Message-ID: <b7c40bb6-5e71-d997-8f6b-772f3bcf03d8@linaro.org>
Date: Mon, 17 Apr 2023 09:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel: add common definition of
 ports
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230416153929.356330-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230416153929.356330-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2023 17:39, Krzysztof Kozlowski wrote:
> Few panel bindings for dual-link connections just type "ports: true",
> which does not enforce any type.  Add common definition of ports, so the
> type will be fixed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../bindings/display/panel/panel-common.yaml     | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index 5b38dc89cb21..ad62d34e6fa3 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -70,6 +70,16 @@ properties:
>     port:
>       $ref: /schemas/graph.yaml#/properties/port
>   
> +  # For dual-link connections
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    patternProperties:
> +      "^port@[0-9a-f]+$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +
> +    required:
> +      - port@0
> +
>     ddc-i2c-bus:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description:
> @@ -154,6 +164,12 @@ dependencies:
>     width-mm: [ height-mm ]
>     height-mm: [ width-mm ]
>   
> +allOf:
> +  - not:
> +      required:
> +        - port
> +        - ports
> +
>   additionalProperties: true
>   
>   ...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
