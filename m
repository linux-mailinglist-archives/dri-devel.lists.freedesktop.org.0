Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1456228C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F465112033;
	Thu, 30 Jun 2022 19:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F5E10FE0B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:04:09 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id u12so40744879eja.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=A5BPRjCLjMz6n70RysGv/HeCg7F5lkJ+/NTpqGV0Rcw=;
 b=HKUSRukkVJd1EOTlpGzZ8EDl1SGJ3FY3+yWHHTsOwej3pK7VoxUl4bMC7BB7wWBk+H
 gXpnTxmEyNKNvIqHMmGlvkqBoBB5Cg4z89Ca2ybIHgT2M3XlW8SqZa4usMtgr+3S3Y4b
 sH2A1vu/YuaaFjFKg9iggU7HOABsmeAPdWbSI4whOSykXCyjG7zITAQgMkgUk4jLO0BI
 ptcOUnGDxXvioZDKIbO+9bsA2ZLU6NP2zJsENoDrcGwiS0CZRRrAO6Q8BX2ho1kRdjbA
 SmubYJTFhqQRODWBrOPP4c8UC7DB8LDVo9Id/V/x89Up3g9SXkpmXlfnE4MJ/HD3lBHs
 bCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A5BPRjCLjMz6n70RysGv/HeCg7F5lkJ+/NTpqGV0Rcw=;
 b=4QL72ntNWHGRR5JOOW6FpgM9fGmyyeWoGVuOz9OyB0749aX984zkgqIc6QaNIjHDPA
 bJFvx9ycq1M9J9ZRHFpMZ627gEFSIrLYqUUb371LnNn6zP9qXwSEfkq8raDjerMe9MwK
 VW608KYruVzwssDEEqpZ9r7U5NH5q6e3UFUW2Qic2q4ccwTzng8W70t1ofpSmZ9+viAq
 tdbtcAMyzZZKWlGsu+Z1FQer/MF4jHjuPoOW5GYN8F9RpcbdskjwlOTZ4dm+72ggTD7l
 Y+YGq0TzFytgKOopd4EQtNY53kXgOqoKuuyzs0UgFY8rSRXOV3x0ROAd49RBVWvkjesv
 vyeA==
X-Gm-Message-State: AJIora9u+ybh+haE9OYq/l4fx462vY/+oTqE5rwwrsWWEqnzSAEYQMno
 gnOtWz6HFXl5rxCTWAscs0tV5s6/4fnb3g==
X-Google-Smtp-Source: AGRyM1t6404Tdoq6Wq/sQaLZ0Ytbji5kaAU5uTST3P1dC2xlN/EQMnBp1Pbl9D8/U74kNDTA9wujZg==
X-Received: by 2002:a17:907:961c:b0:726:9f09:6b3c with SMTP id
 gb28-20020a170907961c00b007269f096b3cmr10496797ejc.711.1656615847677; 
 Thu, 30 Jun 2022 12:04:07 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 x13-20020a170906b08d00b00724261b592esm9419163ejy.186.2022.06.30.12.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:04:06 -0700 (PDT)
Message-ID: <a19ea366-6607-e54b-4ee2-8d8fa7fb9752@linaro.org>
Date: Thu, 30 Jun 2022 21:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/7] dt-bindings: msm: dsi: Fix clock declarations
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml dt-binding descriptions we appear to
> have missed some of the previous detail on the number and names of
> permissible clocks.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index fd9d472437853..b24ba6c346a77 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -28,22 +28,31 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: Display byte clock
> -      - description: Display byte interface clock
> -      - description: Display pixel clock
> -      - description: Display escape clock
> -      - description: Display AHB clock
> -      - description: Display AXI clock
> +    minItems: 6
> +    maxItems: 9
>  
>    clock-names:
>      items:
>        - const: byte
> +        description: Display byte clock

Descriptions should stay where they were. Just add minItems and new items.

>        - const: byte_intf
> +        description: Display byte interface clock
>        - const: pixel
> +        description: Display pixel clock
>        - const: core
> +        description: Display escape clock
>        - const: iface
> +        description: Display AHB clock
>        - const: bus
> +        description: Display AXI clock
> +      - const: core_mmss
> +        description: Core MultiMedia SubSystem clock
> +      - const: mdp_core
> +        description: MDP Core clock
> +      - const: mnoc
> +        description: MNOC clock
> +    minItems: 6
> +    maxItems: 9

maxItems are not needed.

>  
>    phys:
>      maxItems: 1


Best regards,
Krzysztof
