Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF0468F39C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 17:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EB210E7C7;
	Wed,  8 Feb 2023 16:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C810E085
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 16:43:38 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ml19so52786062ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 08:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ASbsE/XmAlMrDircKHKs5lE92BDcQ2dh7PvE1hQ63fE=;
 b=EXIefF7NkFQhnz6WXVJgBWhSVN0YZG69qlxFwlhMrse5t8dtnaNwCPZFR/u/pLt3gE
 V/DWB8M+haVNDAKX3i7vWpjm/AWl2OgxMj8E40xbBxYraC5wsGXEMXy/rjkIAsvJfdx7
 K/b9dUDLIRuFELLr1IGqZa5ry9VZBqV6eTQJxJbB/IBX66DcLa4DVIuLIAFcd/+7LY1y
 9fUW/FIKj6lqMVcr+wd6ewBSL5QvYdZLWr0aNqmEzyIJ8KhKWdYZUdPsz1cpyK5WGNuD
 oZpEiOtRxqhoWJTKf0E1YNTt4WanKcqrC2qJgFeBDZzgPH8x4iMIwwAHtoSA8WfMIHa3
 jw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ASbsE/XmAlMrDircKHKs5lE92BDcQ2dh7PvE1hQ63fE=;
 b=bqtSzObnj3f+NTJhnhjkbkqYwUZ9ve17lsOahQbo6TDvUHd5oRB9fkeiS4k82nhR6O
 RFRFK3GoZJkcJCNd67x4Zze3AkPJKBm/Qt1xE+xKsWDHsZ/AMU6HppQliFVNtHCzWEe7
 Hvky7oFJSkcmrvJiHrydDnDmo5ES/9SJARvMUHBKcYTsv4DAbNUd0oItM+sljkr43vKu
 7Xq1LcWi7sLhqjPJ/F4AT9UTyHB3cnWMwsTCicWXetKyxstEWhFfX2nasUrhQqQbxuii
 1R6U/13/hrzv1ZqjQoScDdrvMwBNwVS7tT9ffhdVwhBqjdUNlLilw5y5DQEbENVm4YvZ
 AOCA==
X-Gm-Message-State: AO0yUKUdICMdcU6AY/BV8DwjLT+nQDcDn3cval3Z6fidWJ3ThPhs67Eb
 m/6YAJgDpBVVOpBJUoW0z2c7HN3u9QngRJcJ
X-Google-Smtp-Source: AK7set+RAX84i4gKstXtg9gLaHvp4VUWeWIP8mak3bhwJw+R/hfeFhIOdVQu3SHtfkpRQcIdY6Zvrg==
X-Received: by 2002:a17:906:1286:b0:88f:9c29:d232 with SMTP id
 k6-20020a170906128600b0088f9c29d232mr8545358ejb.57.1675874617446; 
 Wed, 08 Feb 2023 08:43:37 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a170906609500b008a58c3b8daesm3912331ejj.164.2023.02.08.08.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 08:43:37 -0800 (PST)
Message-ID: <9ac637ef-ab11-518a-b5bd-243712a482b3@linaro.org>
Date: Wed, 8 Feb 2023 17:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8350-hdk: enable GPU
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-9-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206145707.122937-9-dmitry.baryshkov@linaro.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6.02.2023 15:57, Dmitry Baryshkov wrote:
> Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
> the GPU to function properly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index df841230d1b7..5e744423a673 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -284,6 +284,14 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/sm8350/a660_zap.mbn";
> +	};
> +};
> +
>  &i2c15 {
>  	clock-frequency = <400000>;
>  	status = "okay";
