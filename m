Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5E6E409B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A471310E35B;
	Mon, 17 Apr 2023 07:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D6310E35B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:20:35 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec8148f73eso1185184e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681716033; x=1684308033;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=23eaV4yrZlv41f+CKNhvw+EBCrhUaHp4FA0RWyDryN0=;
 b=brrL1QkKtXOzgBfJa/J15xXIyDQ7hn5Ramsb1NyNUFrt9xKV+RafsrwZSVMIi/SOqi
 4WlwHdUOu2anKQdKDl8mGXpCtkkfBpjMLvdMfxrBZsFs0p/f2/rhBtMSlasgzrQIleIv
 fz0lnazxeXtCMYnUPqbrW6XICHV06uBE8QYA4TmObJO2RjyjIPZZaOK7GbK8nwB0EH8N
 EV8xAQBRXZD5C7BcV24IMP0KRhFDYUf2U1T3uvTlls7Ea0gupaKsPMWNjV+lmBTWj4j3
 So/3uP7iv2yokepC2vsq8NbCEQdZOQ52DOxqbohFNzWh3NC8Syhi1q16BvUR4MeyDIPX
 isPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681716033; x=1684308033;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=23eaV4yrZlv41f+CKNhvw+EBCrhUaHp4FA0RWyDryN0=;
 b=Ukf1LdS2Prh/VAgxqV/5J43Us+3/52fBNKaJB+yTJ5ej2DA8gW8glejUhSsETm27vL
 47qfpa/W/iL+avLtKP4OPSLGqPSSadjbdbK0SD1R1qm91MLnZYqNS0eeqRmtozN0wZP1
 B7ALZjYo8qxTNfsWPU9CB1I7GJV3Mx10A6L1yr6spHIwAsDvXBIud0pplQPLLJExqubc
 7Fx6ZZ0EEfnMoHKIjeiyE6ZdXVbLUG0HVLalJteDL+Wl5WNi++8ye2jtyI4KoqlMoI67
 vBSuHBIGrp3EdsmaumHJZ/EM0w0Zcul+CKX9GMcqgEgkROEtrGm0lHIcdUlj1w7ZBqZ1
 /tzA==
X-Gm-Message-State: AAQBX9d21wfs0gmVJYlvuuLNY27yKT4VIZ/jDERH1SJbLccWpvxTib/F
 5hjZbkPB7fPOszVFOh4G4kZxug==
X-Google-Smtp-Source: AKy350ZCzYttSbW0KXmPxpfqHUCsLYwl5TDvD9kAjWNUhP1831FlnXfA3HGZWwg3Xq2TkcdcwMnS9g==
X-Received: by 2002:ac2:5310:0:b0:4eb:3615:4c35 with SMTP id
 c16-20020ac25310000000b004eb36154c35mr1510089lfh.33.1681716032961; 
 Mon, 17 Apr 2023 00:20:32 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 13-20020ac2482d000000b004e8452972a2sm1949681lft.247.2023.04.17.00.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:20:32 -0700 (PDT)
Message-ID: <33ac8c1d-bc0b-7056-09f5-95ee4f319f1a@linaro.org>
Date: Mon, 17 Apr 2023 09:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] dt-bindings: display: panel: add common definition of
 ports
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230416153929.356330-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230416153929.356330-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16.04.2023 17:39, Krzysztof Kozlowski wrote:
> Few panel bindings for dual-link connections just type "ports: true",
> which does not enforce any type.  Add common definition of ports, so the
> type will be fixed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/panel/panel-common.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index 5b38dc89cb21..ad62d34e6fa3 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -70,6 +70,16 @@ properties:
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
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
>    ddc-i2c-bus:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -154,6 +164,12 @@ dependencies:
>    width-mm: [ height-mm ]
>    height-mm: [ width-mm ]
>  
> +allOf:
> +  - not:
> +      required:
> +        - port
> +        - ports
> +
>  additionalProperties: true
>  
>  ...
