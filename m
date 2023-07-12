Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46475095E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE31210E52A;
	Wed, 12 Jul 2023 13:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B8110E529
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:15:58 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b63e5f94f1so9709311fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689167757; x=1691759757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dn4rYyKdwTQMplFvM1YHg3Gp1VPxwOyOuPdjDZ4oTQs=;
 b=MjXeUH9brINWRIL75SFSSvwFmVJG2jUS3gyV+2SmtbAKX/SQCvWGhRcT87fnTJmuiE
 yMG3yUecRAAinZBdsfwGWunFL90IVP7OCaKSigAJzC66J5dq7lKbBHSjx0ts327vTI79
 R6FrVsk6YWv4AUH45Vs+/hBbxAW4p9zlnVgkrsZCdNnZ2D2Rx4CM/y6xd3AyNpSg2Ghk
 ViLO6OpihgDYF0R6FVEYVrhdXeOw0bOWgdZlkK+WA7ZX8c5gpscpLSWQhMOtt1yEaBUA
 PfmaYmejlQt3Bhy0/On7Mv5QoUuB82vM32cdVkduN+DbKN3fPzntcD8r3hBE8SqLn4vS
 Z4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689167757; x=1691759757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dn4rYyKdwTQMplFvM1YHg3Gp1VPxwOyOuPdjDZ4oTQs=;
 b=X6owCBax3kMx60Oi+biL2DDaaxRA5DwonIBuL80FWxvZ1Zd2z3UXBjIuBW0O/CXBLy
 vNfq/59HN6/6mjgu/DALOmQV3IVlAFi+kpIb2q1K7KmTgZQ0kOIwiqil5vBcEfUqBzkt
 dJOR5jE3yZuVh2d7wpeRFlHX5jO1uHxH5a91via+1gw0S3s0t1BisqIH9DL0I8mla7Om
 ipXUwMPRibAajm3ocNMPNo+YLiag/rf8M8952ISnO7/khOtyW2uTBSXD+/3SCb0hcF9o
 dGgzsjZZoM2aZGvsha+yRSSdybeUUAMO9sgbwoPyXk3cnQUwu1OKbia6jxR/GydgxyBN
 oWxg==
X-Gm-Message-State: ABy/qLaFf4BKNNEfoOCS23mxPXHfjN6CvGgUlmXxjtNGq7pPPhbcr1ZY
 cMZHmuQ99TBDyF8g+rNWexGDTQ==
X-Google-Smtp-Source: APBJJlF3SgFBdLW73ntgGd2gci24bmcZ/SHaaJOixefWrDQ+G8QUUfyYVuY0X5Z36wtyT5cVzOllFQ==
X-Received: by 2002:a2e:7d14:0:b0:2b6:d0fa:7023 with SMTP id
 y20-20020a2e7d14000000b002b6d0fa7023mr792416ljc.24.1689167757034; 
 Wed, 12 Jul 2023 06:15:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a2e8049000000b002b6ebc61e85sm962698ljg.54.2023.07.12.06.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 06:15:56 -0700 (PDT)
Message-ID: <3b677200-a201-680b-391f-fbf73064496a@linaro.org>
Date: Wed, 12 Jul 2023 16:15:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: qcom,sdm845-mdss: add
 memory-region property
Content-Language: en-GB
To: Amit Pundir <amit.pundir@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230712130215.666924-1-amit.pundir@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712130215.666924-1-amit.pundir@linaro.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dt <devicetree@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 16:02, Amit Pundir wrote:
> Add and document the reserved memory region property
> in the qcom,sdm845-mdss schema.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>   .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml    | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> index 6ecb00920d7f..3ea1dbd7e317 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
> @@ -39,6 +39,11 @@ properties:
>     interconnect-names:
>       maxItems: 2
>   
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a node describing a reserved memory region.
> +

Please add it to mdss-common.yaml instead

>   patternProperties:
>     "^display-controller@[0-9a-f]+$":
>       type: object

-- 
With best wishes
Dmitry

