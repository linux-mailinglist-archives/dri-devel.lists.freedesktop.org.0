Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C90568E4B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A8111B123;
	Wed,  6 Jul 2022 15:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76EC11B178
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:53:00 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i18so26625752lfu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3akakfTBgNkS72nT8lwBK+VGmgeYXh2NqN91EsDThbo=;
 b=hTKI/rqJLNYVySE/UI3KEFDJW/pe3y5dp7t8sqYmPCRy1cKkpphw6NzDiWMY13xNam
 u19KXrnp8owOW4X3d8OdIxExKLEeLDQ5cLSQEgLmgzJSL7zmrsN7Zez7gv2ZPNh9ZfMg
 NZtRqUvKfJWjoJHbt6sSXGEAoMYD4HLOsw7RjfmFavLhrk/EJtbBw4s3UnCLpdqdqH/Y
 s0I3LXH3UryWtb6LVWNcLGu/3C+Qfljpu518uFYpYl9sZnSvtc/3E+mSdSPNaleuzWK3
 loES3yYJtWPOAcrmvGLbj9cAD/6t03WWN0hCuWXutg/9VOcU+gdhPMNUYAzcKydvn1h5
 ia4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3akakfTBgNkS72nT8lwBK+VGmgeYXh2NqN91EsDThbo=;
 b=7lgxhjG+S/kQQXjttui6GiVtOYcGmOdLzhErLPuszzWUvmNey2sq5b3ADoyTrvQZQI
 YgafF/A8VSKcjsqjSzb1YdmPo5HWGQPU0OoRjCBT2vlXyeroT9tg9vjmnrRtaOdEKkjl
 Nt0tgaNqdHUuxpbgyLQiiVgAbHr6d/t9qwjD7ytSi9UC+HKshkY0rHwD7d36ylxKG5gT
 T9T9rSMHTdcsutIeY7DCPjuv7oVOQE8+L90SAgoIl6AbHX/TSnXZtaVo7Sjpay/rOJLF
 bNJ0U5lfX/mRZFz6f5OK0cRm9W5wEgBvUCbuptU98S1WQeSfWfsps7+LBV/OhvXA49Qt
 sOxw==
X-Gm-Message-State: AJIora9yLtvsNnyvRzCnoYsmRYyxoGWkWtxeVHCHbWUKoG1q+JT6ejYL
 xk1wu1EQFtZIDhyMn7JDrr6XNw==
X-Google-Smtp-Source: AGRyM1vBMVXGOieLNVK2/2fBOu/0m+ARLkcBs8rvqmVVeg4hr5pNnbxvTWSoYsNBH+ke7FdXkGvkSQ==
X-Received: by 2002:a05:6512:b1c:b0:481:618f:ec9 with SMTP id
 w28-20020a0565120b1c00b00481618f0ec9mr19723721lfu.217.1657122779036; 
 Wed, 06 Jul 2022 08:52:59 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2ea60a000000b0025bf92bd024sm3740383ljp.102.2022.07.06.08.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 08:52:58 -0700 (PDT)
Message-ID: <7b504ecb-b05a-549e-e2ce-18c539f68655@linaro.org>
Date: Wed, 6 Jul 2022 17:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] dt-bindings: display/msm/gmu: account for different
 GMU variants
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706145222.1565238-4-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2022 16:52, Dmitry Baryshkov wrote:
> Make display/msm/gmu.yaml describe all existing GMU variants rather than
> just the 630.2 (SDM845) version of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml  | 166 +++++++++++++++---
>  1 file changed, 146 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index fe55611d2603..67fdeeabae0c 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -20,35 +20,24 @@ description: |
>  properties:
>    compatible:
>      items:
> -      - enum:
> -          - qcom,adreno-gmu-630.2
> +      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
>        - const: qcom,adreno-gmu
>  
>    reg:
> -    items:
> -      - description: Core GMU registers
> -      - description: GMU PDC registers
> -      - description: GMU PDC sequence registers
> +    minItems: 3
> +    maxItems: 4
>  
>    reg-names:
> -    items:
> -      - const: gmu
> -      - const: gmu_pdc
> -      - const: gmu_pdc_seq
> +    minItems: 3
> +    maxItems: 4
>  
>    clocks:
> -    items:
> -      - description: GMU clock
> -      - description: GPU CX clock
> -      - description: GPU AXI clock
> -      - description: GPU MEMNOC clock
> +    minItems: 4
> +    maxItems: 7
>  
>    clock-names:
> -    items:
> -      - const: gmu
> -      - const: cxo
> -      - const: axi
> -      - const: memnoc
> +    minItems: 4
> +    maxItems: 7
>  
>    interrupts:
>      items:
> @@ -76,6 +65,9 @@ properties:
>  
>    operating-points-v2: true
>  
> +  opp-table:
> +    type: object

instead: opp-table:true

> +

Best regards,
Krzysztof
