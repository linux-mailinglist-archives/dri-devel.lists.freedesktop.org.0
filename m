Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 124EC6F708D
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 19:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05A710E1A5;
	Thu,  4 May 2023 17:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C082A10E1A5
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 17:11:53 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f13a72ff53so910573e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 10:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683220312; x=1685812312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vz0+DWIAMutu2Xz/Rkb3FV0Lzh5CDdxOEiMrTU8YU2w=;
 b=The7/RhtFK1E7Mp1mhR4nnfynkOjiBUTilB6tAzhXGfg+rZP6URLbA8L9d+qZ6vYOB
 z9LKL5vzQS/bYd6P1wvAHEtMVyk0XPVVGJe6Me1DCvTlOyH9V5Z3ZUj1OVy0lbx3dBIP
 hoXk2sI/WfePB5mPs41Jk7SlWKZ419O7atVVqEg2AmB5Gbce2ar7AbzqPskRTBqZsEWA
 ag9yUN954Ec238wMXXBngMs7D+dkN1VySKt20FVGFhJ6I1CV/JK5W7bY8XrENqrNylCE
 0d73SyhPr/JnI7l31QLsoZA4nGBmVOcu0KRE12F8zHkg35uUhSc9Zw+Xe+JjX7IC83+t
 nQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683220312; x=1685812312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vz0+DWIAMutu2Xz/Rkb3FV0Lzh5CDdxOEiMrTU8YU2w=;
 b=IPpVPtmGgKkkV9S5bNgmr9+MH/wqz76UpeFvQ+aDWaqdEMFoNpo8lcmH5fKeJvjhJ1
 JjBMeGSw0ko2pIhhEwC6a7OyIcqIpqcrFkMEZaeu07Y9YbGqTe5lfsaAAmnItalvXbpN
 X/QLsp6w8nMjcl01bjUlVp/uhbefnEGUknBKhKu8oYU/lt1FYrwI051Q0cuHF/ag+kqU
 mkI/WW3DCZywzMFSm/x86Jx/Qs1mxHyBmbKrMTRmiM+2dcyPILwXR+ZkNUgufu3MYFNT
 V81iHLXqwReYOdrJi/IWhM4bq8IHP1hMbi76wAaE1YVM32llqPg2gUol9mm4dcVAMmtb
 Urfw==
X-Gm-Message-State: AC+VfDzcrPp5IQjSB5tlzr5ClOsHWtKw+NrkPWoNdNOOBMBoUaE0dUhk
 r1rJBgyaoOUTp22JN06201zfGA==
X-Google-Smtp-Source: ACHHUZ6TDIc10NRPmOzuD1yPbh68NQTP0w+3g5hHCzGGNXbNo875UIkeFkOLLgKOcv3ahxr/0rtNwQ==
X-Received: by 2002:ac2:410b:0:b0:4ef:f667:16aa with SMTP id
 b11-20020ac2410b000000b004eff66716aamr2224578lfi.43.1683220311842; 
 Thu, 04 May 2023 10:11:51 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 w15-20020ac2442f000000b004f09126b291sm2724539lfl.213.2023.05.04.10.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 10:11:51 -0700 (PDT)
Message-ID: <723f23b2-c4d8-d688-b261-4198537eefe4@linaro.org>
Date: Thu, 4 May 2023 19:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] arm64: dts: qcom: enable dual ("bonded") DSI mode for
 DB845c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4.05.2023 18:04, Dmitry Baryshkov wrote:
> Now as both lt9611 and drm/msm drivers were updated to handle the 4k
> modes over DSI, enable "bonded" DSI mode on DB845c. This way the board
> utilizes both DSI links and thus can support 4k on the HDMI output.
> 
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index e14fe9bbb386..4dea2c04b22f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -419,6 +419,9 @@ &dsi0 {
>  	status = "okay";
P.S. wanna move status last by chance?

Konrad
>  	vdda-supply = <&vreg_l26a_1p2>;
>  
> +	qcom,dual-dsi-mode;
> +	qcom,master-dsi;
> +
>  	ports {
>  		port@1 {
>  			endpoint {
> @@ -434,6 +437,31 @@ &dsi0_phy {
>  	vdds-supply = <&vreg_l1a_0p875>;
>  };
>  
> +&dsi1 {
> +	vdda-supply = <&vreg_l26a_1p2>;
> +
> +	qcom,dual-dsi-mode;
> +
> +	/* DSI1 is slave, so use DSI0 clocks */
> +	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_b>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi1_phy {
> +	vdds-supply = <&vreg_l1a_0p875>;
> +	status = "okay";
> +};
> +
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -493,6 +521,14 @@ lt9611_a: endpoint {
>  				};
>  			};
>  
> +			port@1 {
> +				reg = <1>;
> +
> +				lt9611_b: endpoint {
> +					remote-endpoint = <&dsi1_out>;
> +				};
> +			};
> +
>  			port@2 {
>  				reg = <2>;
>  
