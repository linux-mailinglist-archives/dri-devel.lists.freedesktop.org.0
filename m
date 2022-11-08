Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF5621144
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F55E10E425;
	Tue,  8 Nov 2022 12:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBDB10E442
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:46:53 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g12so21077795lfh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 04:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ICaRGw9xCO3DSvdx7VVEsxQH9tTfnXE7G9tYCgGWr34=;
 b=CgRwNsUWCdaRfL0Zxw2rP8qnHgxwQqa92EwavvN0gY58lu/xEfqCf3aeLCvbOM/5EX
 iKzJivIDq1LGRPIQGB/os0BPO01HugtPFSoY/YN9kGAMRoUbs8N+MJl9JT392szKjLE6
 F9oVDo/kSdsb5IVos5xA4L5vNKE9p2MkvfjgeJEZh0/YvHQUGyysRjKVVj/IuRc0dFxy
 omYcT4CEKNgLZu0H/35FZqMNOYOs1LAFw5z/y0TLlgvj+HolM/IpPw9kxwoEEEMbz8hf
 pRpzYqAsHmi8pidSpaCxVRq7DNOmGt/8mcgYJn2i+dDJKYO65vbWGQx0Jzt99sVDBl0a
 jcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ICaRGw9xCO3DSvdx7VVEsxQH9tTfnXE7G9tYCgGWr34=;
 b=PaPYm26Y5aP4Sc1LhVbvzz32PpR58Jk3mBwErm8gWPm0x/4uFP6FkKkaD1SqNyRzHv
 /rQohw8WlHEMnaTs8IzIBcnYPGiHjneSCy8xyPXlLiXaJ6xHiTUQmIr87fljbw9vVJn7
 VMCrwqBew4G6P3XbtucLJk+O24HYKFMzjTvTE2xH2WqAZ0XzjHFg6VBmaOiBp5Z0b0Yv
 zc1uHkMFTUgt6tnj4IdT0fi3IJBv1KJQzX5vXxVfN/u7xtrANu38YZ9V5FV9wO4yHcME
 1Rs+m/mJT0o0wRZNsx992kxi3izJPurbZqVaQfT3+KzLw6Dr5IkjsT8N5BPW7T0Mnsvs
 Fv/Q==
X-Gm-Message-State: ACrzQf205dGser4hVGhpaodhvCnSvA8gzehU69kdocO+GFV4l91HdQG7
 yJji3zbvC/LgOJgKk9t3s5Y8Lg==
X-Google-Smtp-Source: AMsMyM7Rss3ZJXpWQzraDFVxnOgPelIhIHbOdwlUE0xr9Mb3GOdpjuUhBYjZGqSRdBoMHu/gRWClKw==
X-Received: by 2002:a05:6512:78c:b0:4a2:4b01:8466 with SMTP id
 x12-20020a056512078c00b004a24b018466mr511398lfr.34.1667911611454; 
 Tue, 08 Nov 2022 04:46:51 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a056512215000b004a2c447598fsm1776440lfr.159.2022.11.08.04.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:46:51 -0800 (PST)
Message-ID: <aeb59d3c-34d0-f00a-bfc3-524cd03acb71@linaro.org>
Date: Tue, 8 Nov 2022 15:46:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 07/18] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 02:56, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,mdss-dsi-ctrl-apq8064

Generic comment: I think we'd better follow the arm/qcom-soc.yaml and 
use qcom,soc-something as compat string. This would leave us with 
qcom,apq8064-dsi-ctrl

I'm not sure if we want to follow the qcm2290 approach and encode the 
DSI ctrl revision here (6g vs v2).


> - qcom,mdss-dsi-ctrl-msm8916
> - qcom,mdss-dsi-ctrl-msm8974
> - qcom,mdss-dsi-ctrl-msm8996
> - qcom,mdss-dsi-ctrl-sc7180
> - qcom,mdss-dsi-ctrl-sc7280
> - qcom,mdss-dsi-ctrl-sdm630
> - qcom,mdss-dsi-ctrl-sdm660
> - qcom,mdss-dsi-ctrl-sdm845
> - qcom,mdss-dsi-ctrl-sm8250
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/display/msm/dsi-controller-main.yaml      | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index b35130a77b43e..9db3e63acda3d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -17,6 +17,16 @@ properties:
>       enum:
>         - qcom,dsi-ctrl-6g-qcm2290
>         - qcom,mdss-dsi-ctrl
> +      - qcom,mdss-dsi-ctrl-apq8064
> +      - qcom,mdss-dsi-ctrl-msm8916
> +      - qcom,mdss-dsi-ctrl-msm8974
> +      - qcom,mdss-dsi-ctrl-msm8996
> +      - qcom,mdss-dsi-ctrl-sc7180
> +      - qcom,mdss-dsi-ctrl-sc7280
> +      - qcom,mdss-dsi-ctrl-sdm630
> +      - qcom,mdss-dsi-ctrl-sdm660
> +      - qcom,mdss-dsi-ctrl-sdm845
> +      - qcom,mdss-dsi-ctrl-sm8250
>   
>     reg:
>       maxItems: 1

-- 
With best wishes
Dmitry

