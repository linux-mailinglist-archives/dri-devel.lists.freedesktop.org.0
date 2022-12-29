Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A968B658C47
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 12:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0863710E25F;
	Thu, 29 Dec 2022 11:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728FF10E25E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:38:36 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-45f4aef92daso257683337b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 03:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QzVijDpOmDlJ/TO0wgjRtfeBQOxC0cctQS/eEfP3SpY=;
 b=WhascANlVjl5U5gZFZPJX1JCvzaY0eFSP57cDDpyQWbsemmdB+gKOGNgG9ea0ke1Wo
 INWSY6J4eO1atBRfG7CHK0mNffIF3QX3IiegBrcTUIoNlJhGvCJpzQD8Hd9E/59NaKyR
 E6z/EKVKXOU+DwZsRme7VUyXydyN/i2j+jRHB3cIxlk6iYeIsU934d2wN9H10OBM27bq
 IwFyHbWsFtyoz7IXv+sK0MzmD9O6BQEk+zi5AoTstfJSVX5hHt8lKQkGKdwKB80MhFJM
 N84++q/77POvO4qIxhkcTodWOnIxPNRZ6EQI6I0r88YkSCDMtzVkk7gT4nv8CjQJriC4
 C8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QzVijDpOmDlJ/TO0wgjRtfeBQOxC0cctQS/eEfP3SpY=;
 b=cktqOl5fw1Ani2NwWXkDyvQ7io5tgSmA1CpbWPqe+OF5R+MMT9sX9OYgZre4n4Qo3j
 oIvLL/aF13/O6cZwDwoYNJTIQvl/fcaVUOeb0g1O71eKskCRtR0Grjb/j+KuI58lIOc9
 MvJnSWlTOtFu+HFFcmPl5UW8HyY7CDid0GkvuWDMQzUxgubLh9QcgMvi6qWHbceQufd0
 GbaEg0oi3HgFym5l6PwrYQOJroqUicVJwX7CktlW/w9TOXBRJGVMjWMWxxK485lZAVwi
 Sc6XTE7CV9JVYb/1NsR4A+eTjHVXJNq2Rl8MGlSMFNjw6vq6+J15DFX0a037wQXTKNxm
 KN3w==
X-Gm-Message-State: AFqh2krfzyiXX5IB977JWYOJ++X5Jf+FdC3/5OalHOaom4A2IQsLla3o
 Q8tU3nq4OPKZMG6q1OEW7QhuDIeqlld1WEdQmGvFjA==
X-Google-Smtp-Source: AMrXdXv9e+eV4tISPHDx2U7r7Ck2jrKmPt6GILLj/sOAVw2uAMBZi0tErVUE4qTF18qsGZPTIq0H1EH0sOHq3nJLvRY=
X-Received: by 2002:a0d:dc86:0:b0:3d5:ecbb:2923 with SMTP id
 f128-20020a0ddc86000000b003d5ecbb2923mr3630692ywe.485.1672313915726; Thu, 29
 Dec 2022 03:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20221229100511.979972-1-konrad.dybcio@linaro.org>
 <20221229100511.979972-2-konrad.dybcio@linaro.org>
In-Reply-To: <20221229100511.979972-2-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Dec 2022 13:38:24 +0200
Message-ID: <CAA8EJpr2AzT9W44mR4=5QBcmQzsznvO7XROObFGiSv+T3kJznA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8150: Add DISPCC node
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, krzysztof.kozlowski@linaro.org,
 agross@kernel.org, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Dec 2022 at 12:05, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Years after the SoC support has been added, it's high time for it to
> get dispcc going. Add the node to ensure that.
>
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # Xperia 5
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
> v1 -> v2:
> - Pick up tags
> - Remove required-opps
> - Move power-domains up
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index a0c57fb798d3..c7935f7a2926 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3579,6 +3579,29 @@ camnoc_virt: interconnect@ac00000 {
>                         qcom,bcm-voters = <&apps_bcm_voter>;
>                 };
>
> +               dispcc: clock-controller@af00000 {
> +                       compatible = "qcom,sm8150-dispcc";
> +                       reg = <0 0x0af00000 0 0x10000>;
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                <0>,
> +                                <0>,
> +                                <0>,
> +                                <0>,
> +                                <0>,
> +                                <0>;
> +                       clock-names = "bi_tcxo",
> +                                     "dsi0_phy_pll_out_byteclk",
> +                                     "dsi0_phy_pll_out_dsiclk",
> +                                     "dsi1_phy_pll_out_byteclk",
> +                                     "dsi1_phy_pll_out_dsiclk",
> +                                     "dp_phy_pll_link_clk",
> +                                     "dp_phy_pll_vco_div_clk";
> +                       power-domains = <&rpmhpd SM8150_MMCX>;
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>                 pdc: interrupt-controller@b220000 {
>                         compatible = "qcom,sm8150-pdc", "qcom,pdc";
>                         reg = <0 0x0b220000 0 0x400>;
> --
> 2.39.0
>


-- 
With best wishes
Dmitry
