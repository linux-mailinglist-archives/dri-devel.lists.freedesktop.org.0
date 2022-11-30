Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB90863D430
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 12:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C010310E060;
	Wed, 30 Nov 2022 11:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9183A10E060
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 11:17:40 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id l8so20458554ljh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DghhzdLC70p88Ph3mhaw98h7VRYL9qUr3MH4/vlNzpU=;
 b=pk2KRXvukRhqgVJJ2HWK9+/xZSC8gf1lZmcPUA7LHq5GXsNg6AGRRUS4lRYB6yRxPX
 SxFOIYM3+sncwsmGoDUpXXdWiA+zE5JtPKkqOpFGaOThZ3lfUNm6lHaPxIP9sheMaFgi
 G/iAZWe/ZM/w8hEvpd5in4w6pZU4clr0BxvT4e1XZ5bTcZ+Sz6Qj+xTz9Od2n1SetIvS
 xTK1MBgKxc2kyS+heZJDRA2FklCoYpNnIWYPwFi4Ep4DZd9uJCEkObi0HGpXQV4oGYqu
 qFz4MXJlIk2dq12cfnEiidPD4InWa/WW1fng7QEU7ZcgpZ+EHVlkevvXXVk4CmGNjCdo
 /0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DghhzdLC70p88Ph3mhaw98h7VRYL9qUr3MH4/vlNzpU=;
 b=0kSY5HSQa4xe/Y2hgxLeOuBYDZjT04VEPO33nu7hcer8ju+Ca5f1fTFGs/oYeOmr3v
 f4LmKF0Mgwyvdu+ASUAz6Qq7U0juULQ1yXYeuwo8MvEDxT9lhROzPzzL0l3EcrIYoAM1
 dgcSfBQxE6+FGXBxgJ/GEZWW26gchgrgtCTcsQnG8lGc7kymVAGmlto42pzmE3+rfutb
 MAa1z3h2Z2XXc8B5b1NojzUKDrfJkSbw3HSLLJaIxkHHxKqht7w4yMt6KVKCv51HaLvP
 fImnTYnjjexeEuZxK61x57Kyqqou7N05uMb+Etxihn6Eisz587wGCH9OcXhppuziTXC5
 ZeJA==
X-Gm-Message-State: ANoB5pmiNyeA4m0F3PuASL3EAqYYoLgGr9RGj4JNaCVJSDCkZ7fZvrZa
 uDdlnpUF/iWaNVY9fjzp8IYIuQ==
X-Google-Smtp-Source: AA0mqf7FAZUmUwdxZIfnK1o0qwCU14VpcIfdB0vtB8H9/H3zj6Ulagqt8uLHVWQ63VwAvOGTlNU2hQ==
X-Received: by 2002:a2e:9c4e:0:b0:26e:2bda:1821 with SMTP id
 t14-20020a2e9c4e000000b0026e2bda1821mr14090758ljj.241.1669807060137; 
 Wed, 30 Nov 2022 03:17:40 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl.
 [95.49.125.236]) by smtp.gmail.com with ESMTPSA id
 s22-20020a056512315600b0049ade93ad24sm218501lfi.156.2022.11.30.03.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:17:37 -0800 (PST)
Message-ID: <f508a01d-55e3-259b-d648-7125a2606c96@linaro.org>
Date: Wed, 30 Nov 2022 12:17:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 06/12] arm64: dts: qcom: sm6115: Add rpm-stats node
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-7-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-7-a39.skl@gmail.com>
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
> Add rpm stats node.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 04620c272227..6d14bbcda9d3 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -538,6 +538,11 @@ rpm_msg_ram: sram@45f0000 {
>  			reg = <0x045f0000 0x7000>;
>  		};
>  
> +		sram@4690000 {
> +			compatible = "qcom,rpm-stats";
> +			reg = <0x04690000 0x10000>;
> +		};
> +
>  		sdhc_1: mmc@4744000 {
>  			compatible = "qcom,sm6115-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0x04744000 0x1000>, <0x04745000 0x1000>, <0x04748000 0x8000>;
