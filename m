Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5067AF2D3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 20:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B860210E419;
	Tue, 26 Sep 2023 18:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A90D10E419
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 18:27:36 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5043120ffbcso14471833e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752854; x=1696357654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w+WhEvVzq354lp8en3vleqjPVBkIdxbFh2tnxte7FFY=;
 b=JF6c+juuJ7sO4YgG6zsKvDpLgB+SDsmY7vigAjkVDAnP2BlXbtxmmjbKokmSPv12IL
 Z/sJVYvCD0oM2HvJuUWnemRat2J+QtBAfjNxk+4fB95+oF07iaTyTmY6Oa1BWmBMvNYn
 ElobclUcGy9jREWL+RnmhnZQD1v/x7ndvyKjQDfLY3lHy369VgokqH9h4QYZMq/JiFEJ
 ZAzyF6CiSp/VDNkhIM1AbjoxlfrokWz96sSeqMJzL4+cL1bz/MResOxh2JMocCa3fbe7
 R83zo7chuCd/+Re1rRJ80MXEdki8FECxyKnrmX/Y5f1TZ8btuGGtuuNZsRoPSMWu8/7P
 QdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752854; x=1696357654;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+WhEvVzq354lp8en3vleqjPVBkIdxbFh2tnxte7FFY=;
 b=a74lhMthIEyiupo0OeAW5CjG0P30TRCfR/9fh6TUq5E3/FDVjuBNSUyWJDUDUSb+C9
 qnouIB2p5xMG6QIc5yQCRaJHpa3HiV/WqPwkHMMeaSaJKUEAd+zje8MrAdOD0CTMFxKV
 Cm0c0dfj4yQm7zKa1W+zCevotSjR1gxBVjIhzfFIH0X/RJU0hwC/1JlZvCmmI1ggzm+N
 UN53oYyefXbmJvlYxmplbWO/jQ+v5ihRUpK7BLNqgkKXnuRfDfn4x7YvEtELWoyIpP39
 NmXEvpsxoNx9kpm0WlLSw7TCfuRR+9nFhoKpVgR4iKy3/mcP9wglhSecstSU9K8hXQYU
 vY/A==
X-Gm-Message-State: AOJu0YwTr56bpq9lXF6W6dn0rn8jbUTxvzPuqFD368l7OXHQYSKuDWKW
 2I37nFloNmq5Zyk1NurPp4u60w==
X-Google-Smtp-Source: AGHT+IGEOwe5h8wRsbW86uovHuF6C3KdXUg4eQbG+lGNwE4BDIcXlWp3pHYrGv6+2lPWBKDyxbsq9A==
X-Received: by 2002:a05:6512:3b98:b0:500:be57:ce53 with SMTP id
 g24-20020a0565123b9800b00500be57ce53mr11045472lfv.42.1695752854381; 
 Tue, 26 Sep 2023 11:27:34 -0700 (PDT)
Received: from [192.168.33.189]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 eo2-20020a056512480200b004fe7011072fsm2292076lfb.58.2023.09.26.11.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 11:27:34 -0700 (PDT)
Message-ID: <1736686f-d7b5-4433-aa45-2369a1e9b53e@linaro.org>
Date: Tue, 26 Sep 2023 20:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sc7280: Add ZAP shader support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
 <20230926-topic-a643-v1-4-7af6937ac0a3@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230926-topic-a643-v1-4-7af6937ac0a3@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.09.2023 20:24, Konrad Dybcio wrote:
> Non-Chrome SC7280-family platforms ship a ZAP shader with the Adreno GPU.
> Describe that and make sure it doesn't interfere with Chrome devices.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  2 ++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> index 5d462ae14ba1..88fc67c3646e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> @@ -17,6 +17,8 @@
>   * required by the setup for Chrome boards.
>   */
>  
> +/delete-node/ &gpu_zap_mem;
> +/delete-node/ &gpu_zap_shader;
>  /delete-node/ &hyp_mem;
>  /delete-node/ &xbl_mem;
>  /delete-node/ &reserved_xbl_uefi_log;
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 66f1eb83cca7..c38ddf267ef5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -152,6 +152,11 @@ ipa_fw_mem: memory@8b700000 {
>  			no-map;
>  		};
>  
> +		gpu_zap_mem: zap@8b71a000 {
> +			reg = <0 0x8b71a000 0 0x2000>;
> +			no-map;
> +		};
> +
>  		rmtfs_mem: memory@9c900000 {
>  			compatible = "qcom,rmtfs-mem";
>  			reg = <0x0 0x9c900000 0x0 0x280000>;
> @@ -2608,6 +2613,11 @@ gpu: gpu@3d00000 {
>  			nvmem-cells = <&gpu_speed_bin>;
>  			nvmem-cell-names = "speed_bin";
>  
> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&gpu_zap_mem>;
> +				firmware-name = "qcom/a660_zap.mdt";
Gah. This line shouldn't have been there.

Considering it's not the only oops, I'll resend.

Konrad
