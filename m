Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46962568DF5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB8D112D37;
	Wed,  6 Jul 2022 15:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E041E1138A9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:50:22 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id y18so8117836ljj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kxZ7CQ79CLU2h8rY+LQzy6VR2IcDxMDkX9FxIJFMPHE=;
 b=bYoctCtq6bYttm296Lg76LeiabYmJjOaPAB6sfacl3pmpVkC+RGrAvwGsjzBW41z1M
 t1DqdDhQBkjASh9Az3j7neI5rDG20Yks796Gahw+M5dutZa9IYpBgxW2YgKwszHk0SnT
 dt/M9HhXywNZ3+H1x7jdOy5c37lbDUWgorMH8g8WwX8LuwwlSQS22Wb3GCWEdQ3Qa11n
 SsZ5Jd2bxDSNOHmGHupWsSfhQ5R27QJv3uIOLFGumn8q04DRNsBx6idHFWf4i1tb4zKR
 N8Vy9BYXC7M+p1/OtG0YzVXEDw2nVn58cSifU/AsH6s4LHCYvGfe0Rbx3k9rMbYSh5LC
 h+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kxZ7CQ79CLU2h8rY+LQzy6VR2IcDxMDkX9FxIJFMPHE=;
 b=yIbutXkA+5/NWVaaCvqQISy5G1DCR+Eto8IMdntH+tcO1ZJAINMoYb5cZMp0ymkXC5
 oDFhBUlPGH5Br7yLOtYC3um7qF7BL1UqOfROLmOZZrlm9cMuwVm9uqVDCAyURABn87Ez
 yLAFzoyAKmXpKR9bFIu176rREUPRIwONKmhtXHJDTbJ8ImGpLdBeimyTL0ntO1zN2Seq
 OzQm84V7uQpExzhcf5CoKDPEz+qxudvEB6zzJVsQVBdRtKO45TT19qgYZxFt489R22c9
 ktAuVElwvyNRCgcEsxTgXQmQjJRPsZ2xUKCVHroF1XAHxdv24Ai7kcijs41qEA4QYZAu
 VPrA==
X-Gm-Message-State: AJIora+JVAKLKSeST0F5z2Avnra3aqxdK8/f9Augs13nYpPWkKOmkqL+
 dZDLyP5alrXncIqVOD6LEuzPSw==
X-Google-Smtp-Source: AGRyM1tKfsXhje9EIvRBlERA18zql4xonxY4Sb+/ufHUVQ5qxMnvA6//clihVoF72xZaSks6k2khOw==
X-Received: by 2002:a05:651c:211e:b0:25a:88ca:d766 with SMTP id
 a30-20020a05651c211e00b0025a88cad766mr24929120ljq.230.1657122621267; 
 Wed, 06 Jul 2022 08:50:21 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a196549000000b0047f9614203esm6321993lfj.173.2022.07.06.08.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 08:50:20 -0700 (PDT)
Message-ID: <088c1863-ad44-61b6-8757-bc3097369335@linaro.org>
Date: Wed, 6 Jul 2022 17:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] dt-bindings: display/msm/gpu: document using the
 amd,imageon adreno too
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706145222.1565238-3-dmitry.baryshkov@linaro.org>
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
> The DT binding desribes using amd,imageon only for Imageon 2xx GPUs. We
> have been using amd,imageon with newer (Adreno) GPUs to describe the
> headless setup, when the platform does not (yet) have the display DT

Does not have "yet"? So later it will have and you drop a compatible?

> nodes (and no display support). Document this trick in the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 346aabdccf7b..e006da95462c 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -16,9 +16,13 @@ properties:
>        - description: |
>            The driver is parsing the compat string for Adreno to
>            figure out the gpu-id and patch level.
> +          Optional amd,imageon compatibility string enables using Adreno
> +          without the display node.
>          items:
>            - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
>            - const: qcom,adreno
> +          - const: amd,imageon
> +        minItems: 2

This is too unspecific. You allow any device to be and not to be
compatible with amd,imageon.

>        - description: |
>            The driver is parsing the compat string for Imageon to
>            figure out the gpu-id and patch level.
> @@ -148,6 +152,8 @@ allOf:
>                  description: GPU 3D engine clock
>                - const: rbbmtimer
>                  description: GPU RBBM Timer for Adreno 5xx series
> +              - const: rbcpr
> +                description: GPU RB CPR clock
>            minItems: 2
>            maxItems: 7

Do 8 items work with maxItems:7?


Best regards,
Krzysztof
