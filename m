Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DD773CB26
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 15:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9E310E146;
	Sat, 24 Jun 2023 13:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBE610E12D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 13:52:36 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f86fbe5e4fso2026800e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 06:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687614754; x=1690206754;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mjiEZV4jeag6OJr2dpUfso60xJEHHcCh9NKqh9NcVoI=;
 b=HIrUMg/1DiFIXr9Oxo/TxEkIN/SHzzu3j+KAkwb1dkBbJS18VkjhwY1eu3+wd4nz+Y
 O4lqCmvud8HypQeJ6xLov05tSLHSncrPVVygkl12vKMpaZNgKiRNKD+Rps8EeBt4eyeb
 oWOmFn4pGmCJNrGjsYKJMEHF8pUjvWL0cqZuJuDxRviBXBcHsxiaACc7YoBpcO6lcnOP
 bcNQZV1kSS44z8IaFxEAShgwlD4smb8LIyDa4pqpo7dOzaA1iQtdeDuK9EM9spbyFG9F
 d5eZHFAqyDpWRKwYdaKMR6bUUWQhPpbAuH32sxw5SYweV9o/02G8njD2oJWPs/uyblz6
 l77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687614754; x=1690206754;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mjiEZV4jeag6OJr2dpUfso60xJEHHcCh9NKqh9NcVoI=;
 b=kANcqsKyB2EBuEckosNRsazdzlAUNCh4KJneb3sweCEMtV5LJpX3PbvQvQRkgzc10R
 0f+4pHVViUNsNZDHz+6Fy7utSbzBCUuA/TlN339qPmBDDInsyvYbwwQ0uqf2zGnRUkl+
 gEdfB+jgqLyEEHzWP3/jGFuxaY2n+byC2U+tIWB/l51/cekCoico8ddYKGVGjjSvJqtF
 myS25paB2oH5pvTeqk1Q55n+9PDeaih87E58dzqMwFWUcf32LZKhtTF52eZp26VVlua7
 ERqNooZFQdlATh4wf8T0eP0x0A6fkcG+fprVgcUR7X/LQYYY43dJF/A0jCQQa6xtM3VT
 yDWA==
X-Gm-Message-State: AC+VfDxLiQxbrQPF7JoYhEx3+7e+DWMxwqsLTQmuuCx8PPxMU6zDCR6d
 YfZx2lCSWWgKITT2Qp0jv6mqsA==
X-Google-Smtp-Source: ACHHUZ5bwkJUdGqwvE2xmfPDoF40i6IPYZFeCYu7hP9FSE6SMtCynuxZSEvR63zxka+bMXifTFwmlw==
X-Received: by 2002:a05:6512:3714:b0:4f8:5886:1868 with SMTP id
 z20-20020a056512371400b004f858861868mr233116lfr.24.1687614754001; 
 Sat, 24 Jun 2023 06:52:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a056512006700b004f76b40260esm285250lfo.146.2023.06.24.06.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 06:52:33 -0700 (PDT)
Message-ID: <dfbff674-ced9-9bc3-848d-91d5ecd4c1d5@linaro.org>
Date: Sat, 24 Jun 2023 16:52:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 13/15] arm64: dts: qcom: sm6125: Add dispcc node
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-13-1d5a638cebf2@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-13-1d5a638cebf2@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 03:41, Marijn Suijten wrote:
> Enable and configure the dispcc node on SM6125 for consumption by MDSS
> later on.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   arch/arm64/boot/dts/qcom/sm6125.dtsi | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index edb03508dba3..7d78b4e48ebe 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
>    */
>   
> +#include <dt-bindings/clock/qcom,dispcc-sm6125.h>
>   #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>   #include <dt-bindings/clock/qcom,rpmcc.h>
>   #include <dt-bindings/dma/qcom-gpi.h>
> @@ -1203,6 +1204,28 @@ sram@4690000 {
>   			reg = <0x04690000 0x10000>;
>   		};
>   
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,sm6125-dispcc";
> +			reg = <0x05f00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;

This clock is at the wrong position.

> +			clock-names = "bi_tcxo",
> +				      "gcc_disp_gpll0_div_clk_src",
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_dsiclk",
> +				      "dp_phy_pll_link_clk",
> +				      "dp_phy_pll_vco_div_clk";
> +			power-domains = <&rpmpd SM6125_VDDCX>;
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		apps_smmu: iommu@c600000 {
>   			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>   			reg = <0x0c600000 0x80000>;
> 

-- 
With best wishes
Dmitry

