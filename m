Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FAE6FA248
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DFF10E17A;
	Mon,  8 May 2023 08:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C66B10E177
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:32:13 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f13ef4ad91so4851276e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683534731; x=1686126731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lz4prnU5xuYjdNiPVkvAinLr8cUxavLs9H9bFD3s5E4=;
 b=VM2UvIjzOl6msa7ESuMNmHdh/XQD7CM9UKMEkbiYpBNm4ZhecF2+NVtZ0JD1++ZdVm
 smzpRlAYXQYwcCjyEmjBL5pZ6XwGJHn/ju2UshYmq+KZkAuk5/z/rwnDIOr/FaOjImcR
 rmtm4csGQSFFlsoDSOADe2gEpn1AhJeSlpBWBPIsvQ3byL337W5DTrkQ75LF87nyRMFh
 W/S1U6r/nGgE1uW118kt6zLcQw1+50/r7EpVA79Uco1SFnJL2scQFeM4twObW2NNxJEl
 f9zMf0Xv9cUJQNg6Y7YAcX/dxcMGOnWfrFVu3iioaQdLvaQQaqXi9m/9BUqhLr37K+Eb
 HgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534731; x=1686126731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lz4prnU5xuYjdNiPVkvAinLr8cUxavLs9H9bFD3s5E4=;
 b=lqU+5EqJLaigVORIb07Jc9O14YLYUnkHfTwrDWg7CGN4GBC3cNZ/9n6W4m2yQkAIKC
 2RPw4Ba8TP7Hgx+Ngmk9hkecK3olUwDKr/Rcs3/lqF7jUfIsPUxfdYAJx8xdKkZkh5Ow
 TnpewyyqSDM4/Ift4zHpWtI/1T2rk/i8OgmTPvCAneC0JWwc7RwbQHlVNFGwrBJdyi+Q
 +0c+tMSQsvR1BOb6sbvPINAhl+zRj8k8qzoVcRdEQy1fkHGTFQN4MR6StOTLopiwp73w
 8hLgQqLGja6KdL74fNeZ4Csvn8dTTkuMdFDZ29s3KtpT4fO/WT/wWtmwhoB7avB++EjJ
 2QrA==
X-Gm-Message-State: AC+VfDyMRd51f6Ltuup8Ojl/PMUFgWmMCYm+A2JJxDk2wsMNHVXMWAQ9
 slDP12V6bcQD9uSf3iGrDpi8bA==
X-Google-Smtp-Source: ACHHUZ4/szUMQTlbn+VYeDtxgy0K4t/loQJR9Vxp7p2ce4kCYvUw7R4MnZrtXBi912JybpA3mQGDog==
X-Received: by 2002:a19:ee04:0:b0:4ed:bdac:7a49 with SMTP id
 g4-20020a19ee04000000b004edbdac7a49mr2013547lfb.54.1683534731164; 
 Mon, 08 May 2023 01:32:11 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 p11-20020ac246cb000000b004edc485f86bsm1219117lfo.239.2023.05.08.01.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:32:10 -0700 (PDT)
Message-ID: <f968009f-c52b-5e4c-aa79-01c0ac53b8dc@linaro.org>
Date: Mon, 8 May 2023 10:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] ARM: dts: qcom: apq8074-dragonboard: Set DMA as
 remotely controlled
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507190735.2333145-3-dmitry.baryshkov@linaro.org>
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



On 7.05.2023 21:07, Dmitry Baryshkov wrote:
> Add the qcom,controlled-remotely property for the blsp2_bam
> controller node. This board requires this, otherwise the board stalls
> during the boot for some reason (most probably because TZ mishandles the
> protection error and keeps on looping somewhere inside).
> 
> Fixes: 62bc81792223 dts: msm8974: Add blsp2_bam dma node
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Looks like a common theme.. sony-rhine boards also have the DMA
enabled *and* need this property.. perhaps it's a SoC-wide (or
at least SoC-and-fw-distribution-wide) issue?

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-apq8074-dragonboard.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index 1345df7cbd00..6b047c679370 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -23,6 +23,10 @@ &blsp1_uart2 {
>  	status = "okay";
>  };
>  
> +&blsp2_dma {
> +	qcom,controlled-remotely;
> +};
> +
>  &blsp2_i2c5 {
>  	status = "okay";
>  	clock-frequency = <200000>;
