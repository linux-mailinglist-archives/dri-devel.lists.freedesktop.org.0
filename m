Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79736639686
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 15:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA6310E0F1;
	Sat, 26 Nov 2022 14:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719E010E12D
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 14:36:39 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id d3so8206948ljl.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TlFReAZi452KKu7243poUVzcc36SKDtK5buSrZcN41s=;
 b=DorUbsjYYdMtXqG8uYYRoi3VrC9zXVvjY0opQcp3A3zmx0YAIYYSz4W4hrFigdIEbz
 xoWq+S5zgz6xfoGnxKxGECIFqfzz5y0onEZ3+cO0KEju2Tqcpa1QdXYZP1IgpQq/ZHeW
 +uTJux2bDqSe3sSYpQQjw/24qcymzPpR3zVurTJYfwcfG5VJlDMCSEElTdUNMMf1gZVG
 2hL7vvNikjb4BYAQav+A/5eqqvtuJpVMSVvwPNMHrAzXRJxneilvjOZDKJsf3gr6K/Yo
 cImEYzBvvqdcLzdws/U13nbJOyTNyotCdO5SXieAH7LkXuO7sCTkuChrN7jiWSx7mxOj
 O/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TlFReAZi452KKu7243poUVzcc36SKDtK5buSrZcN41s=;
 b=Bqz8ydXB2+EpJidP9M+dXoGh/vkZFBsx5GiAz+WKiL8CClWnlqIV+EDwFTYRvlyjPQ
 a9LW50h21FtYR+xhmyL9tjG24PRMqsZLHOazfPOcfZAYA+MR/Bm7AhvFxwTlo68axfUv
 XXAlthMIfljTjeT+MM9ItVgFiqXx7U9DdDDqMD+xyghAMbr+sEJDf9MCrbRCJWJnQvfG
 /ue6xXmAU1VBar5lDP9ZmkoMToKlNiZugcsu+VSckqAQ9ta+MVyqTyPoRQI2W4J59jYC
 iqIOnQTX9skWNbXnjRx7G/3Ncg7kc1ohjJ1yT4riJS11gJb6hA0uny/FE5B8MXt+x9Dt
 ++xA==
X-Gm-Message-State: ANoB5pn8Ya3+jZKx+WWy3YgWPRN8MXmCmhN/SG5EmwcaMxytpfYFehgQ
 AVVkG6+PYoFSDGy8PqKS6T47kA==
X-Google-Smtp-Source: AA0mqf6gn8Q7/ZynZ1o+yZj/px5dRRu0hgVNiyv5nl70fRpr5NXgnEbAQ+G0uTryw6wn2mtWrRyuqw==
X-Received: by 2002:a05:651c:1108:b0:277:e8c:a5a4 with SMTP id
 e8-20020a05651c110800b002770e8ca5a4mr9138752ljo.311.1669473397489; 
 Sat, 26 Nov 2022 06:36:37 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h5-20020ac24da5000000b0049480c8e7bcsm946797lfe.176.2022.11.26.06.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 06:36:37 -0800 (PST)
Message-ID: <4fd1500d-e3ca-45fd-1cc8-81783697b809@linaro.org>
Date: Sat, 26 Nov 2022 15:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 03/18] dt-bindings: msm: dsi-controller-main: Rename
 qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-4-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-4-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
> We will add in a number of compat strings to dsi-controller-main.yaml in
> the format "qcom,socname-dsi-ctrl" convert the currently unused
> qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl.

It is used: drivers/gpu/drm/msm/dsi/dsi.c

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index cf782c5f5bdb0..67d08dc338925 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -16,7 +16,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,mdss-dsi-ctrl
> -      - qcom,dsi-ctrl-6g-qcm2290
> +      - qcom,qcm2290-dsi-ctrl

That's a bit surprising. Did we discuss it? It breaks the ABI, so I
doubt (driver/bindings were already upstreamed).

Best regards,
Krzysztof

