Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC25A0FCE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0046113D86;
	Thu, 25 Aug 2022 12:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6901311A01D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:01:52 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id bx38so19182125ljb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 05:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=f2M4iXxI1q5T3VkoG4UYWNwFB3x0AhyJ8PHoXo+SF3k=;
 b=ggWYiQ/HcrXx1XLQhvzjoNQ0gSD+jIBLN9muzyDYpiTR1GIoy/Cbf98QStpRVMh9KH
 +dP6Mccdv24maC9648P/flZl2nN68wzmCFxe6lpFbvmKbR+3X3DIrLRk5eprbDPM7uTH
 +8Xze+6TaRDg5OGERMxCkROw8pCjjCTWLofhGEwYa5pxjBICfFq1Thm282bAz8mOASJj
 WOyoOKUljhZpPaGAqgsiMUFCXED8aXEtyip2vIsIG0XEZebuDBJkIhBIEbXdm0UlbMJ6
 NYQ5jahLWcu+lqqhhyvQyzkqwZFDGK/TVF0PxTR2/WYa0rHoaj/6JLkxnf7D0QodCOUQ
 CbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=f2M4iXxI1q5T3VkoG4UYWNwFB3x0AhyJ8PHoXo+SF3k=;
 b=3zNYs+8K/cxcMIS5gWgvFPTiyYl7ovSXXumfOFxY7ZEj3fUSVSCzJnUGfEbg8zNXD0
 +oz5sz6yj8C2J4uJu9hgyGC/w/Uiep4FXIHpKvu+rzzLYbxqnEp/5ROxw9XCnbgohng0
 idlkNExGyuzOkXSaWOMcwipzq1NPnfEn0I23AAouypWxeM4/RUbkRicfBbTkKUl7l6Sv
 TmOq7T1slk8eDMJQqBlWyu4FcYANWzZ5gHCwTo3C9szb8LwlVsi71Fq9gdjbfquXOsHU
 nJAm07thJKT4M/C0BquVBC9JaR3F5cLkTcGQOGChdpwRmLIhCDPxFh4q1uqJw8jjJiS6
 Wmqw==
X-Gm-Message-State: ACgBeo2wgV3kUEdMtIox8DJt5L4cjvdHZ7s7YSaY0sgad8q+o30eFocZ
 Kg2dQNnKI+XADTKWPKbp4lEfPA==
X-Google-Smtp-Source: AA6agR6cD5F+W9iFjjk7hqYwstmfLt+P6TX+9vOP/jf2H6MJ2DsN7/KbqO7D2ZEeufLsuA4aud4iEA==
X-Received: by 2002:a2e:7c0c:0:b0:261:e73a:9819 with SMTP id
 x12-20020a2e7c0c000000b00261e73a9819mr856025ljc.203.1661428910608; 
 Thu, 25 Aug 2022 05:01:50 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05651c022600b002618fbebbbcsm523158ljn.47.2022.08.25.05.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:01:48 -0700 (PDT)
Message-ID: <8e0ab9f0-cc27-f472-ce5c-b9f4a9d94005@linaro.org>
Date: Thu, 25 Aug 2022 15:01:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 03/10] dt-bindings: display/msm: move qcom, sc7180-mdss
 schema to mdss.yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825095103.624891-4-dmitry.baryshkov@linaro.org>
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

On 25/08/2022 12:50, Dmitry Baryshkov wrote:
> Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.

MDSS grows to unmanagable file. I don't think we will be able to keep it
maintained. You will have many if-else defining subnodes and their
characteristics. As I said before - this should be several separate
schemas with common part.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  66 +++++++-
>  2 files changed, 102 insertions(+), 113 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> index d3c3e4b07897..9d4ec0b60c25 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> @@ -10,151 +10,78 @@ maintainers:
>    - Krishna Manikandan <quic_mkrishn@quicinc.com>
>  
>  description: |
> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> -  bindings of MDSS and DPU are mentioned for SC7180 target.
> +  Device tree bindings for the DPU display controller for SC7180 target.
>  
>  properties:
>    compatible:
>      items:
> -      - const: qcom,sc7180-mdss
> +      - const: qcom,sc7180-dpu
>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
>  
>    reg-names:
> -    const: mdss
> -
> -  power-domains:
> -    maxItems: 1
> +    items:
> +      - const: mdp
> +      - const: vbif
>  
>    clocks:
>      items:
> -      - description: Display AHB clock from gcc
> -      - description: Display AHB clock from dispcc
> +      - description: Display hf axi clock
> +      - description: Display ahb clock
> +      - description: Display rotator clock
> +      - description: Display lut clock
>        - description: Display core clock
> +      - description: Display vsync clock
>  
>    clock-names:
>      items:
> +      - const: bus
>        - const: iface
> -      - const: ahb
> +      - const: rot
> +      - const: lut
>        - const: core
> +      - const: vsync

All these changes point that device schemas are simply different and
trying to unify them is not correct approach.

Best regards,
Krzysztof
