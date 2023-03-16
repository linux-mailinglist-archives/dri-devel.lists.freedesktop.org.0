Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F7F6BC653
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 07:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B360B10EA6A;
	Thu, 16 Mar 2023 06:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3583A10EA48
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 06:50:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id eh3so3471947edb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 23:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678949434;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FSmqR42JI8zcqdZRW9LGFpXnT9CY9HrPjFJaVqu4ZgY=;
 b=LtSG7S1Is6GOySgnfXlDFq9WmlpDcL15eYIvGJGE5wawcnUtwzMePaKmAhMuLgEhUs
 xTJTs+bkX4okGEn38efRN2rttgtE4dB+4IsT4Ilvtd1XhKAc6NzWUyoWa3WqXvoL7u2T
 ggWDnwAJN0nv2Blhx7wMVb7yHDJnjqMnbjcCCh46Ezk8oV0RRn56Sk1eQOIxncoCALCT
 T/AHI0c1h3r4Kgd1Eqtqbds7fp/dpooQMq2CMoxqPxH6aUv8XVPKbT47IrkpLhjEySj2
 9VIqK63JW8wx7Fc61X7ttVzGNgKM6hkgeC53bC3iIqBQY63I047h4js0OPc8tQoaa5yE
 A56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678949434;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FSmqR42JI8zcqdZRW9LGFpXnT9CY9HrPjFJaVqu4ZgY=;
 b=GWHkWeQiZ+9I2DtAUbzPXImAkTIpp4+jqLj2mI4+gnktpTNOw6tJ8PnnBB+uoIlGCB
 BLCmrHsONdkD7ar7q0JwdM3jhrmzZhoGSKqxNBSfH5Tq9BIestLtqZNbrrOn3jSc0PlT
 toUWF1HGXU2PyCpEJNJHj1G0TJRfcNsnSdWgSI38jTJQyb3fEsvzSpwlcY6ZQYAK8It2
 3aTris5TNceSqDARD1c4aFW23tWQMveG9W+ov9pdjYgPE1Ai/bWHppODUOKv30hNDj6m
 477GtwFOpg/gDVaE3FGwKEbtMX52GYZG13dQFRK5jFKHa/8xlDGbuRcFC4dUYK6kdb8R
 dwNA==
X-Gm-Message-State: AO0yUKVGn9SX+0avWiikfAkRCyGcA2SvY2vGgCa1oGEWFkEzYUDcKhgs
 Y59vgVf+LScG9o+2bKiejQTp/g==
X-Google-Smtp-Source: AK7set+PiE/udqoIZYh3NUnUhUQW7Ogs6QpL8HNi52GXZ5TS0E9frxcNkNS0kfUthl780jLDuZxS7g==
X-Received: by 2002:a17:906:c9ce:b0:889:58bd:86f1 with SMTP id
 hk14-20020a170906c9ce00b0088958bd86f1mr8988609ejb.14.1678949434663; 
 Wed, 15 Mar 2023 23:50:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a1709060a0d00b0092707833d08sm3388745ejf.70.2023.03.15.23.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 23:50:34 -0700 (PDT)
Message-ID: <1f77b57b-e3dc-b44e-0afb-ac1b7c4cac83@linaro.org>
Date: Thu, 16 Mar 2023 07:50:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 08/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
 <20230307-topic-dsi_qcm-v4-8-54b4898189cb@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-8-54b4898189cb@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 13:13, Konrad Dybcio wrote:
> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
> alone. This however didn't quite work out and the property became
> undocumented instead of deprecated. Fix that.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 2494817c1bd6..94f4cdf88c95 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -34,7 +34,7 @@ properties:
>        - items:

This patch should drop the items - you have only one item, so no need
for list.

>            - enum:
>                - qcom,dsi-ctrl-6g-qcm2290
> -          - const: qcom,mdss-dsi-ctrl
> +              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
>          deprecated: true


Best regards,
Krzysztof

