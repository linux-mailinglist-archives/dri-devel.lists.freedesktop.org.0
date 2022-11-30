Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D763D425
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 12:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5963410E24C;
	Wed, 30 Nov 2022 11:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD36010E060
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:17:03 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id d3so20512022ljl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 03:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=93Fl7WiTCHJeIgakKDaYI1Qsq+II/EWb0Q1aTHCr7pA=;
 b=uL1Ic/P3fR5OXGJkEoD9BOkPINXKzVlvBXwRHreFGxX7vqQdYxlkqKhKU46HMaQ4SS
 9r/5h+zENHT7VKjhFy3k62I2oHurEg7Yy6DT6kKIiQpFad9GZLPzTJr3cVBVLqi5R5wv
 0/JSe2TJaa2kuX10sIjQ3u0bbU2S4ydAZsOByR2JNemAcPUbNVCdt/IalgIKjOaaYjY1
 HWKSZMOXfqvkSwuPCTcNMYXwVEBXljjoiR/8xSDxDYHEsH5K0cyLB2mRunlXz0JtZipQ
 iQesDJwc6oMQGp4UT9hQgTX5wk8LkCogzzqef2SiQHY7EBXY9qxMTbmjDwee+66MgliN
 9kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93Fl7WiTCHJeIgakKDaYI1Qsq+II/EWb0Q1aTHCr7pA=;
 b=1YwCZ2EIIleksslx9x9noWUA1MgU6ysjt+kOCiVayTR6b3LtTz3WxV+jYf16SrTdvY
 11GSwp1aAqZ5pvAk3KLi0oAIHaL2U+xZeEVl2B4V7CxsN45ADENGWiOr7QjRC7oc1+Wk
 CKdO1ulVckyBEcafEJjOyojkFkQYGGJqUy0+LMW82U6pAYMA6tEvVtL82l9lV/bKyMyf
 2ac+Q4HSWEQe2IdPWIKKCy9utZO0NdiBeci8M6S/Kml8QCfUZ2C37BiVpEkSwy31XYzz
 wb8QPRrLq1gzyg8u5lxs5kISIGlwJuhX0/tsK4QZ/QZllQEVRi5agLwTkS/lNYaDaTCs
 3s8g==
X-Gm-Message-State: ANoB5pl70aLHbARrIR1BAIhlXGX+j+YNgQOZ/jiNZHOYepaqqv8O2j/4
 fqCOd+FsWonczgIzDj2WEL2RJw==
X-Google-Smtp-Source: AA0mqf72zkzsX2t1JV2GlLC/Mt2x0wSRYPI7aozVNCnP7S0yBQycAUQytTfBHQ3TV8fKZr6qfgmiUA==
X-Received: by 2002:a05:651c:158c:b0:26c:90f:f8fe with SMTP id
 h12-20020a05651c158c00b0026c090ff8femr20603495ljq.2.1669807022044; 
 Wed, 30 Nov 2022 03:17:02 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 q15-20020a2e914f000000b0027706d22878sm104656ljg.94.2022.11.30.03.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:17:01 -0800 (PST)
Message-ID: <8a57c06c-e755-c298-a9d6-3f2a431b3f5d@linaro.org>
Date: Wed, 30 Nov 2022 12:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 04/12] arm64: dts: qcom: sm6115: Add TSENS node
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-5-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-5-a39.skl@gmail.com>
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
> Add nodes required for TSENS block using the common qcom,tsens-v2 binding.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 2003a2519a54..decbf7ca8a03 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -515,6 +515,17 @@ spmi_bus: spmi@1c40000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> +		tsens0: thermal-sensor@4410000 {
> +			compatible = "qcom,sm6115-tsens", "qcom,tsens-v2";
> +			reg = <0x04411000 0x1ff>, /* TM */
> +			      <0x04410000 0x8>; /* SROT */
> +			#qcom,sensors = <16>;
> +			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		rpm_msg_ram: sram@45f0000 {
>  			compatible = "qcom,rpm-msg-ram";
>  			reg = <0x045f0000 0x7000>;
