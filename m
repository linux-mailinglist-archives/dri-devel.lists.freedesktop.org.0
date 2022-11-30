Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C997263D435
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 12:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C8B10E446;
	Wed, 30 Nov 2022 11:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD33610E45A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:18:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id d3so20514695ljl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=otStQxmxOG6LpjBUQIYuow/PF/UV5Z7DPxX9LVFmQEo=;
 b=fa9DTGfn6miiSdGDtIzetZ3cP+Y//XHFAUdhDMe/rcDBMGLkWiIlAIXblHykz3XBdq
 YzC0fnxzFt/60yWvxiqVbFIVXSJ+vvPP7rzKgGOIGzZ8p4rczzLY/n7Jh0d3pSP6asmS
 7GIf+V6LW3muePp0QgVBYwDrtglEYK8SCNEgQmgKpQhlICmt+y8IaUUoeshYPm5bZ4Y0
 PG6iXABOS/F6ufJVLLCEuzHlIzBc+YhSNmcYiVRL4gfQItJ34mAZq32Mnrbtno7K0rl/
 g7f0JjDMNEMQP/zEIVKTJcQ4yvgxgWRd4HROJpKo9uYKlGAB1AJ6i3yiZVXORWvn6uCv
 ILhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=otStQxmxOG6LpjBUQIYuow/PF/UV5Z7DPxX9LVFmQEo=;
 b=8Py/R9tdu3TT+hKdsU3JyapD4mufXUXqHGQO3F3YmNwGnheiy6SZ4l4xi8Ymb4ydim
 zaIZ2YGKsP4B10BAJx2eyihkC2dcMSTI6KxtxB0IRAEJV4hsBAnAy+JtsuMvNf8eMX9Z
 HnAU7oymOu4xguihLsvcOybv/0SRuQ9L6Lfr2JuNrSMUn9JrUwcXcA0oJQ5ZWpG4VXu5
 md7oLfZk2U1yLwPxSpXU+08fxUSAfyrEYrD09/9SOaYJaXMFQx9KmVh9JdSlXXW9b0sf
 QAw8RuHwKGj4kv3ua3CpAO936e35q6SMhmfYuoBB8qSSM/BmmLs4G1gz6JaIoQxxKY55
 9dlA==
X-Gm-Message-State: ANoB5pl2TzAlzzKD3EMB7H/jHtiS9s0o6MAjVMhfdaEC9RN0/nZ3dk8p
 U/fofoD36DeU+Cg0QxS9rBNGLg==
X-Google-Smtp-Source: AA0mqf6wG9cAljfGq/fOblhbS+7rNoNwLhQu0yt79NeJDaajfzWbs9CAdx2+LxPPPMd07rqtVe40Hw==
X-Received: by 2002:a05:651c:88c:b0:26c:4e3a:516 with SMTP id
 d12-20020a05651c088c00b0026c4e3a0516mr14687322ljq.510.1669807083389; 
 Wed, 30 Nov 2022 03:18:03 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 u22-20020ac258d6000000b0049e9122bd1bsm216515lfo.164.2022.11.30.03.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:18:02 -0800 (PST)
Message-ID: <46202b25-e253-0a5a-0c90-9d699906d3d7@linaro.org>
Date: Wed, 30 Nov 2022 12:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 07/12] arm64: dts: qcom: sm6115: Add dispcc node
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-8-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-8-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.11.2022 21:46, Adam Skladowski wrote:
> Add display clock controller to allow controlling display related clocks.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 6d14bbcda9d3..ea0e0b3c5d84 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,gcc-sm6115.h>
> +#include <dt-bindings/clock/qcom,sm6115-dispcc.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -717,6 +718,19 @@ usb_1_dwc3: usb@4e00000 {
>  			};
>  		};
>  
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,sm6115-dispcc";
> +			reg = <0x05f00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <&dsi0_phy 0>,
> +				 <&dsi0_phy 1>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		apps_smmu: iommu@c600000 {
>  			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
>  			reg = <0x0c600000 0x80000>;
