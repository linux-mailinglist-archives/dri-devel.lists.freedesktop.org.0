Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8B87549A3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 17:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D4610E15D;
	Sat, 15 Jul 2023 15:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838C010E15D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 15:11:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so4813954e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689433875; x=1692025875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uahl0JK8EKsnvSfqLyeXPnd2KJauvmsFvzs6gaaLC+Q=;
 b=cEQKLfs+irNYlu4PHC7FcXJnmKVMQpjgceJ73Dz9W9kZUya7PARB2vlIWIRdz+da8A
 8Idoso99nNolkI4/+4/SXjxa0c2yRNvDHRgddHTDHOou+7H9yk2qwIaIW8ifTsnvgiLb
 NzgMpFWltHaUNBoRZHMDbTn9UulcLojYKHAj0uqKPGxg7nOjrBW+/dRrKCZXpQxQ7fR1
 f7Cykva76SaJ/zEk2/RMDLIqZXn+VSLojMv8az12trqaeY/7X3WNuUmQrojOLV9vczJF
 qBGP+SjB5KDILKLcusMDcQQwA08HVG7bLs19yn5zq6tNrHztIrEYKn6CtkqUU3RvgsMQ
 T+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689433875; x=1692025875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uahl0JK8EKsnvSfqLyeXPnd2KJauvmsFvzs6gaaLC+Q=;
 b=HeHWwGc6TEFFc4fnWQlxiXt00Drk6aHusMAhvz7+9krRIltYM0dlD+PpqJCSuyOnR7
 SoSDhpsR6LL/mzFsjCuaPnGpHBDw9G9U7KITYiCP2iJZGET3lksu8JeQl527mCBkIkI7
 tUeNZ/uPrfsLnTthqNijb06TBLoO3Lqzlwx91H0fxKNN6GvLg+ld5q+lBDHgpsBxg8mU
 G6LgdxqlHs/qLDxbduN5tF3axW7OTc3ZaLKg1wCIJ1knB7oAP1nbhCJIONIu+et4dYVi
 YbgQnfVl74yKTjmS04v3m6cd/9LVxg/nJl/z3Yi6iDwtSW+sPS9Yk7M4xHRHSLrJQGpM
 n55g==
X-Gm-Message-State: ABy/qLYcP+X8+bakrpaHEM4fCn0fi0gPxsLeSgBUhXmXSm7fTjEdRH2u
 SKzFHkYpcOC8FHR/TxRul/1ayg==
X-Google-Smtp-Source: APBJJlF8jICyjjbV1u/4xnF/oNp/tqc4zSp4PrfGF2zGzjcKVvb18AyYpYbdJHF6+FvSU7aOHyw/XA==
X-Received: by 2002:a05:6512:ea9:b0:4f8:752f:3722 with SMTP id
 bi41-20020a0565120ea900b004f8752f3722mr6549825lfb.5.1689433875119; 
 Sat, 15 Jul 2023 08:11:15 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
 by smtp.gmail.com with ESMTPSA id
 f15-20020ac2532f000000b004fb745fd232sm1914885lfh.30.2023.07.15.08.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jul 2023 08:11:14 -0700 (PDT)
Message-ID: <7774d80e-81d4-2283-59ec-87012bb28294@linaro.org>
Date: Sat, 15 Jul 2023 17:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qrb5165-rb5: enable displayport
 controller
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-5-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230709041926.4052245-5-dmitry.baryshkov@linaro.org>
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

On 9.07.2023 06:19, Dmitry Baryshkov wrote:
> Enable the onboard displayport controller, connect it to QMP PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index a03f334a3d01..210c60025c32 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -656,6 +656,15 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dp {
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;
> +	remote-endpoint = <&usb_1_qmpphy_dp_in>;
> +};
> +
>  &mdss_dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vreg_l9a_1p2>;
> @@ -1436,3 +1445,7 @@ pm8150b_typec_sbu_out: endpoint {
>  		};
>  	};
>  };
> +
> +&usb_1_qmpphy_dp_in {
> +	remote-endpoint = <&mdss_dp_out>;
> +};
