Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770755E5BE0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEA210E56F;
	Thu, 22 Sep 2022 07:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EC110E56D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:09:23 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id a2so13150186lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=fdU+qDCTMkdaeX40r7uWCv0WDwyM9etWaQkDLtVaVfs=;
 b=TkgfNylJjd2tfS6/kfgtNpZVv4Fy3kaOFE4217Qe+Zl5cNQu40IU3b0TSIcdVqeFXM
 SgB8gYfezZrNjuUJ30Re1W5vbssWaRTkzt4wP8MkjK14QN4q20jXtSapVoAgytU5NfAH
 MD0GcafHVBHbTTob+vuBsX5Kg8TJ+6u6M4cgWnHubNQFnLEmmIfWuXqqQ9mZzjyRS6Ua
 0xAw1pGjMUiFVnOOYkTNdXGcGLKFW9DjZtSBmpF3+BDLKKYOwEBCEJfeqVV6iP8NFzLy
 9zHQkOfQXi+Og+bL/Af0YGEZGNfPC6y2NF/ofQeIfMklMKVSAqF5BXGo1Anq7Cd1dlEo
 79Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fdU+qDCTMkdaeX40r7uWCv0WDwyM9etWaQkDLtVaVfs=;
 b=mGjIsSFBo5REyP0xomLjTsJNmBZvR0OLm5un9s72syiqJ3nth7eaPSe0rKR5jZ1GiK
 zP+U2a5PichWpdXaCU3SGA4KdfldMBl/e9zl6qLUMPTkKxT0h1e5D/i2YCf1/Gz/CLCo
 7Ve/1DK2IMJa91piiiWRRkA9fy1WKdRNHtD7yQPszbqep4QvwHiKFSZxEHVjfJQhR62I
 PhFtDNaQ9xZc2ZB0yZQa4lCMznUjqF6LArdczl+K+MkyXekS+iMN4u6SSCwT41OYHycf
 fhD0upz3R+I5n5MO3PstYRL7PsBuGCY0ykXepkTD0fahc0EBPl1oluxoJ4xk4ZesreV6
 3ClQ==
X-Gm-Message-State: ACrzQf0J6PefjnnyV4yLDLUMTqL3HzDjMV41IFF29T+O730zKs7GkBcn
 R5T0g1FDAUOcyjlccU2v1WWS+Q==
X-Google-Smtp-Source: AMsMyM6adfYIDSbUrcA3oF6/gUwPhD5O7dg+pyUfeWfeKT8MgY0ktd0AJOEolKnX0oQ29zf/8cfjFg==
X-Received: by 2002:a05:6512:6c8:b0:49a:1765:335d with SMTP id
 u8-20020a05651206c800b0049a1765335dmr666411lff.29.1663830562050; 
 Thu, 22 Sep 2022 00:09:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 b15-20020a19644f000000b00499fe9ce5f2sm788699lfj.175.2022.09.22.00.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:09:21 -0700 (PDT)
Message-ID: <4eec5b31-1c8f-062a-75fb-6cd1ce780d14@linaro.org>
Date: Thu, 22 Sep 2022 09:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 11/12] dt-bindings: display/msm: add missing device
 nodes to mdss-* schemas
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-12-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-12-dmitry.baryshkov@linaro.org>
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

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
> schemas.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/msm/qcom,msm8998-mdss.yaml        | 12 +++++++++
>  .../display/msm/qcom,qcm2290-mdss.yaml        |  6 +++++
>  .../display/msm/qcom,sc7180-mdss.yaml         | 18 +++++++++++++
>  .../display/msm/qcom,sc7280-mdss.yaml         | 26 +++++++++++++++++++
>  .../display/msm/qcom,sdm845-mdss.yaml         | 12 +++++++++
>  5 files changed, 74 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
> index c2550cfb797e..f749821725b1 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
> @@ -43,6 +43,18 @@ patternProperties:
>        compatible:
>          const: qcom,msm8998-dpu
>  
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,mdss-dsi-ctrl
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,dsi-phy-10nm-8998
> +
>  unevaluatedProperties: false

Your example should also include them (unless it's removed on purpose?).

Best regards,
Krzysztof

