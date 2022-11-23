Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D94635F24
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 14:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1910E54D;
	Wed, 23 Nov 2022 13:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510D710E54D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 13:17:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j16so28079021lfe.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 05:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9rrWiHxgy8XL4EMhVPJm4PXUcc5P4DC16VghLNpNvqc=;
 b=Szj6IJnVYD6/7h8/2+rn3OkkE6gMACGs65XIdv7bNYNGKsGU5q7Us/Uq7gdSb9ly1G
 yUlhPNVMz6Jqo8Yy5gy5XqTa9MdZy9guSkgl/F1M7lVObURlfoB6Gf2pzeztXiuRwVlu
 JqYlA1NWxo7mokcqBBNnjGN9lF8NJHWV0+52J3O7HoD1WEeLSPnIbBRAExSJr+FEOJx2
 S0l6yeBGx6sZg4BB+WTqhbdAXpWE4xxBBDDQHRS0qUEZvnyLwUgLaX79U6WYdduy9yEC
 rzhbGlJSyWEUw2D2dVast+4HSJf/B5S9MxVeqgGIYzSrlYTjUgEbrP4yW9kEWnfOBWJe
 ewtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9rrWiHxgy8XL4EMhVPJm4PXUcc5P4DC16VghLNpNvqc=;
 b=s4BJXRY3cjxRSpO2Vfl7XY1M5l1wkDE8GmVYxzFtwKXAT8zpjBB+JOU2Gfb1auoETJ
 PTvIK9e72AjXjfaRGBFqgMObTPNjMShMMv7yfsfLyX2wb92H/WWaFKmLlj2yNFNLXE1O
 w9cea4/X/LeZS3i30WvEUOc3E46giZty8fBszg3yfA7+Kaehl4YSiuhhMBGZUfH73Uob
 2bCzWMR5V4O1Yy7oOKCRzM1hU9X+8d3J1hYT4trxaaJ8F0kJ1q2/oKXiTxszQQ6wp7K/
 axgFp3tzN7ihebts2NPRrDmL+66IonXSzWH4dRTFAam9Gs23Xcz3p3fdz4XTxkZf9oCv
 hLrg==
X-Gm-Message-State: ANoB5pk8fQbKe3xM+phrPEHMedJLWkrdtlV/Nym2CkIQ9YWgRXZ31M3p
 gVQ/Ez0LMYn85RaU0eV6WVAUtw==
X-Google-Smtp-Source: AA0mqf7DLaDOx9/kIucgdP9wbuyY2ZzDY+IE1nEku1WaomgQSO+mpoC14e1nZTanImk+XPkpSwW5lg==
X-Received: by 2002:ac2:4c50:0:b0:4b1:8a90:6524 with SMTP id
 o16-20020ac24c50000000b004b18a906524mr8783922lfk.628.1669209421365; 
 Wed, 23 Nov 2022 05:17:01 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl.
 [95.49.32.48]) by smtp.gmail.com with ESMTPSA id
 u14-20020ac258ce000000b00499d70c0310sm2888258lfo.3.2022.11.23.05.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 05:17:00 -0800 (PST)
Message-ID: <afa7567f-e86e-639b-92b7-efae505b55f1@linaro.org>
Date: Wed, 23 Nov 2022 14:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
 <20221122233659.3308175-4-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221122233659.3308175-4-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.11.2022 00:36, Dmitry Baryshkov wrote:
> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
> configuration (yet).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 2dd4f8c8f931..75b7aecb7d8e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -349,6 +349,28 @@ vreg_l7e_2p8: ldo7 {
>  	};
>  };
>  
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l6b_1p2>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5b_0p88>;
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  	max-link-speed = <2>;
