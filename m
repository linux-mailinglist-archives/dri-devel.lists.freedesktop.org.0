Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE0F6A1ABF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 11:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBB810E7CA;
	Fri, 24 Feb 2023 10:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6492810E7CA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:58:31 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id bw19so2855632wrb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BWQnxO1Qoh2BkDXLOlnoREhUBx6MERP/uawbk8zyhDE=;
 b=oIYBcBS1IroSN+gIwdmpGD92lGKnxaCpEVal9alvoswXTnjWR+wsNj8HIy1pvZhg83
 0BJVTC6M2grX3w9wNFNgKBv4oBo6cvjCBTzXNPwkh5SftRZUGQ7xc1uirr3KRFx5yd2+
 lHU5VTv+zCcnIXOjplrdeeHBGPa3FnJmhgHarkMjegfRxiCTY6BLccitUp8E96XcPSE3
 xE9JeN0xJwtQwYceNzORWOWBcjozomasU5yL//L144AJJIRcBvgLegxYUeDcCwTCqBJe
 hqWhqWI3kBLSKqwBIXoYgguws0lSf+P8+83nczcaHN/UEIJd1JA8k66x1FN8yF4hhmiB
 bYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BWQnxO1Qoh2BkDXLOlnoREhUBx6MERP/uawbk8zyhDE=;
 b=eMvvB+ryde0HoSaDgso87jPR/3gxdSkksxDtvIQ9lBQKfD0xSzZXN1jCXwf159lTdG
 YhaxMX9ozUdMwoI77ckueaBUtFacofkuTYnSfikPqfgHj0r1+j0V6aDdCqQHn7qNNXv4
 O60+lVBKmx1YvRIXdJ3dWoaaYWyNoo1Q5x58RSMqSa5TlHuAk0yCZn/yfXwO0EGFwsCQ
 5bcvjiVqgg3q4r7QNqHJuiIgK1+CUcWeGX/VoSEvOfGNEYeaW9yiduxXzlFpkJXxF3b1
 BYGI5VB420a6no5LN8Ji9NlgY0TIgaktLsgoA4Nz0BA4JHazY4to7KaznzYJbJ/HuIGP
 oX5Q==
X-Gm-Message-State: AO0yUKWYR3YfaNonv9YDzNtq+17mIdAKTiaIoK43mB3kil/hGT78R+iM
 UAZW/R+zrVCTKgeqvpa6gxbebQ==
X-Google-Smtp-Source: AK7set+20sAValcTBU0xLyseyncEcxYkyBhTV7YB9xSSXQvtIniIzhiGHg6epY5B4L3Xsq5lj7UD+w==
X-Received: by 2002:a5d:56c9:0:b0:2c3:e07d:46cc with SMTP id
 m9-20020a5d56c9000000b002c3e07d46ccmr14386158wrw.41.1677236309745; 
 Fri, 24 Feb 2023 02:58:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a5d58d8000000b002c7066a6f77sm9714423wrf.31.2023.02.24.02.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 02:58:29 -0800 (PST)
Message-ID: <08fca891-d5df-0337-0615-e49e53fd2940@linaro.org>
Date: Fri, 24 Feb 2023 11:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 05/11] dt-bindings: gpu: mali-bifrost: Add new MT8183
 compatible
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-6-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223133440.80941-6-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 14:34, AngeloGioacchino Del Regno wrote:
> Since new platform data was required in Panfrost for getting GPU DVFS
> finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
> compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 4d9ab4702582..be18b161959b 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -19,6 +19,7 @@ properties:
>            - enum:
>                - amlogic,meson-g12a-mali
>                - mediatek,mt8183-mali
> +              - mediatek,mt8183b-mali
>                - realtek,rtd1619-mali
>                - renesas,r9a07g044-mali
>                - renesas,r9a07g054-mali
> @@ -157,6 +158,7 @@ allOf:
>              contains:
>                enum:
>                  - mediatek,mt8183-mali
> +                - mediatek,mt8183b-mali
>                  - mediatek,mt8192-mali
>      then:
>        properties:
> @@ -185,6 +187,23 @@ allOf:
>      else:
>        properties:
>          sram-supply: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183b-mali
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 3

also: maxItems

Best regards,
Krzysztof

