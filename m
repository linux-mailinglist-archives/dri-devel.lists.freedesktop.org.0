Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447369AA5D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A488110EF77;
	Fri, 17 Feb 2023 11:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CE110EF7E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:30:08 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ez12so3082399edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FBs3G+5rDOAD7jz6/mROi4c/cabIc4TAXJ4KNHRdV7Y=;
 b=xdjshueeGfdfkVtEqdmdj/CHWIs7xaE5c4jvbsQpmt2UQWO3DWcFWQDXbOqXyjLzmg
 QDxt7nWPHa8d9XZdU8QxjONPQaMrRNOotXOzqPTCtb0lbk0bQx/nvv/cNeX/t6fjBMNc
 bT3IVdfOZ/8KFRyPBs+4Ak5T4wb/iM73iES1CCLgraAC2IC67fK2vmWUMxlcyRMHICIR
 cy+SVJSfHFgUnWg004CIIBWvxuwVBetSk9TNh+M5k7iKsVR6Ysyq9aSBn6c+Q4jAaid9
 eD/GiYXcMF1xA5R5KtwAA7Rj2IbgVobOB7p4+64O8WENZ4tWVSmum8Ui7/VfUJ7oIMwM
 XfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FBs3G+5rDOAD7jz6/mROi4c/cabIc4TAXJ4KNHRdV7Y=;
 b=1bH1JxY957i0kMw7ssW9/K+kwBTOymmyCVuFk/74I/TcaykAj7KSGah9LtvFyZqDbh
 vpAIj/bjQpHPSjRQEoY6PdSU+HA3hkZS7FW+G8PTGFioNmeJOclXwnTEMdxe9MPUGcAa
 6xOtZ9idIaxArKmRm0FhYQySlbb5CC5S5Y+I95jUHUttp9JdpUZCX9J2WPHWB67iJrZb
 o5Onf775k4d/Pt84ehNedGMEsqXY9DCIkci0uf0FYm2UHGYrUeQ6ZaWYSsYqIWsrvhdC
 1Dg28cI0PkBvmA8k1FnhPg2HfqHbNhJv4aQB95BVyL10un87O0nVG869ME4ejtT3R2ND
 SZRw==
X-Gm-Message-State: AO0yUKVK4z1SHSt5dgbcRA1xS06g9syyA/Zss3DukofQabICUAfbMO4C
 rOGgCPh+Fs8vtX7TJ+f4k9m4mQ==
X-Google-Smtp-Source: AK7set84zZR/iqCf2WhRExqzAoyqtlMbTwfj3Shf6m/+1SOuGTvZ+sZaA/bAqfZcJy4eRAzK/G8eaw==
X-Received: by 2002:a05:6402:695:b0:4aa:a0ed:e373 with SMTP id
 f21-20020a056402069500b004aaa0ede373mr1235952edy.7.1676633406486; 
 Fri, 17 Feb 2023 03:30:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a50c44a000000b004ad1815f3e9sm2110588edf.97.2023.02.17.03.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 03:30:06 -0800 (PST)
Message-ID: <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
Date: Fri, 17 Feb 2023 12:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217111316.306241-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2023 12:13, Konrad Dybcio wrote:
> SM6115 previously erroneously added just "qcom,dsi-ctrl-6g-qcm2290",
> without the generic fallback. Fix the deprecated binding to reflect
> that.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Depends on (and should have been a part of):
> 
> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
> 
> v1 -> v2:
> New patch
> 
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 41cdb631d305..ee19d780dea8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -37,7 +37,6 @@ properties:
>        - items:

If this way stays, drop the items as it is just an enum.

>            - enum:
>                - qcom,dsi-ctrl-6g-qcm2290
> -          - const: qcom,mdss-dsi-ctrl

Wasn't then intention to deprecate both - qcm2290 and mdss - when used
alone?


Best regards,
Krzysztof

