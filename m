Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589C2648457
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 15:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D915010E231;
	Fri,  9 Dec 2022 14:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9770E10E029
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 14:57:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 1so7417586lfz.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 06:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7J0TRFpxYFO8l+uYWyA/vikM8HYkKYJhsAgNGT3Tc5o=;
 b=Lf/Djb40bLkM8VInQ1pLDSyt5NAycSK/65rpI+LWMpMAIF1aEXW9Wmq/6SSEl091gw
 xl4ttFIwAAUipdbtRBONlQViNjc6wdJ4cO2r2tc2iYTi1BFprYtEBpA9PopRPACRW1PA
 CsDAHzoNurr/hWSwJ4uaBufSG0XkJ4B2Dpv6SvDbJtK7/oEx59sRX3b+8gBsCxCELSdX
 quWVLHeLTpOR9e4O5lPM3dL8hCifev31Ziw79FymRa08UHKNnFbuzBUOkGH7JvEQ8E1Q
 nAxa/xMYgGW7VWsGmVF3mYqCmwp4eZKpiQkPw6wSTLb4mdcxwl5syRN2Gue1JOERMCo3
 tjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7J0TRFpxYFO8l+uYWyA/vikM8HYkKYJhsAgNGT3Tc5o=;
 b=IuTb1J4DQ3ygi7EZEqiKjKIh+/gSsS5VYKKUh1L2plEBTwaLzV6OamS+hvgA/LgnYz
 baRfyEU05a12ZQsCvPp8eyo6F15uWkMhqhc1tAxaW0RuSepOeaEqFnKNMt5AEwCAYzfM
 CSaT9IwI8UeZ6G7GsWbSf5QFilIpWT8qbP1MQPSTNJhbk8fXp7WCWYMF7y3yaiWZiyE1
 njXLdz6N3sh9YRdNSodwmVx8rFv94HAQCaS5hjUQypNAWAS6KgZIShzZbBZy4tz7lCBi
 02jH2nQ/OQwuEKkKEbvfWvNXg22MNGYGvpok/F+zg8ub+pdxPEjg+Je65gzGeAPo3ol3
 vO9A==
X-Gm-Message-State: ANoB5pnw85dkONrqHu7eXDGVp9huZ/sbpRJWhH58BNpDJ+RZaP5ChTRC
 UkJMj83mifzGItPa6MwEAThqCw==
X-Google-Smtp-Source: AA0mqf6390q1LWWYTitf3zCcoubMJ1stQadogWnI1EZsqeT7GcBNgsXO1PqxqlrjMSLCcqyCHFvwvA==
X-Received: by 2002:a05:6512:224a:b0:4a4:68b9:19fc with SMTP id
 i10-20020a056512224a00b004a468b919fcmr2563324lfu.36.1670597844896; 
 Fri, 09 Dec 2022 06:57:24 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a05651204d900b004afac783b5esm286046lfq.238.2022.12.09.06.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 06:57:24 -0800 (PST)
Message-ID: <97065624-2fcf-9b83-9129-27c88d49d946@linaro.org>
Date: Fri, 9 Dec 2022 15:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 1/5] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, dmitry.baryshkov@linaro.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-2-git-send-email-quic_khsieh@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1670539015-11808-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2022 23:36, Kuogee Hsieh wrote:
> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
> add link-frequencies property into dp_out endpoint as well. The last
> frequency specified at link-frequencies will be the max link rate
> supported by DP.
> 
> Changes in v5:
> -- revert changes at sc7180.dtsi and sc7280.dtsi
> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
> 
> Changes in v6:
> -- add data-lanes and link-frequencies to yaml
> 
> Changes in v7:
> -- change 160000000 to 1620000000
> -- separate yaml to different patch
> 
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
> 
> Changes in v9:
> -- use symbol rate (hz) for link-frequencies at dp_out at sc7180_trogdor.dtsi
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 6 +++++-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index eae22e6..93b0cde 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -814,7 +814,11 @@ hp_i2c: &i2c9 {
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hot_plug_det>;
> -	data-lanes = <0 1>;
> +};
> +
> +&dp_out {
> +    data-lanes = <0  1>;

Why adding two spaces? Just cut previous line and paste it, don't change it.

> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>  };
>  
>  &pm6150_adc {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index c11e371..3c7a9d8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -442,7 +442,11 @@ ap_i2c_tpm: &i2c14 {
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hot_plug_det>;
> -	data-lanes = <0 1>;
> +};
> +
> +&dp_out {
> +	data-lanes = <0  1>;

Ditto


Best regards,
Krzysztof

