Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C124E8091D8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 20:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D956E10E95F;
	Thu,  7 Dec 2023 19:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA2310E0C8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 19:47:51 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bee606265so1240504e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 11:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701978469; x=1702583269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F3WBG6P4B+HyjaL3nLuFPklzfCpTWZN+xQc43lrIQPM=;
 b=obH0kmk0rlwz6k2sHYyAV7gD0nU1TtzakJImtkQUn2Q7QLvO9Fm8lIpxrm/xiiOWJw
 uEptf5nU1lmq7NDpN9c7rQqkDc3r44wmahD2xayDMPkDeGCMlafYIgwQBIVGAl1RtSMT
 fy8pOKCVSBqYz2hWdONt7I/MnmpK1rXDHrZlB69Tuswoye4Mk2k54hUp9tOtSdWZQykv
 f5hM5r6moud6cdi60nwLbVP+z+Semri/Yea4JXBWT/+QxspAO0WRuEtmJoa+g7OjQrS0
 4zdcp3Lq7c/eYyc3/b9GYCIa/eI64LTb+USLpJH4YQyf+zeBgo8TJxP4S8hyLNPffYs0
 GoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701978469; x=1702583269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F3WBG6P4B+HyjaL3nLuFPklzfCpTWZN+xQc43lrIQPM=;
 b=DpxHV7UWoI4ULNuXa3cxGogiNTkz6IjWODl3cYyOoPv34tYRzK+4hT2uF3AmUQyy2+
 +RHMR8gZdc8b0BQK6vZpaywTl0WoiEz9FIebIbSfCZEiPZ6J1RxZMxfHzyptUbeajF2p
 9SaxEvV0tKq5gC9ozabk977DT1sCzSxy8XxNgMQe1vgsBHI5VPUAcpcbvRkiVjxVUGl4
 GfGF1w+qAD0D5m1eXKTMAwM1mqnjjvVxxWaK0QvruIy/6yeMxErXCej/Vr4XetlT/vlX
 QSBjtGiLVLW2YdOARsdfpHARTILEcfTfH+TXStxiMoVZ0nauLzSB9HuwteDlNDtPMOhf
 4PNA==
X-Gm-Message-State: AOJu0YzEfSVGKiUwKWabqoYvwVZjecr6fLeqOqDcPDPckqsObZkdTs2R
 xQ1kWo2epPztUcpMpt5Vh83tWA==
X-Google-Smtp-Source: AGHT+IFgIMwXaG8n6KMWKKM5krd/gIX+69hDdwcMcOcBO9EJj+QioXq77mIeRXK2/1tYXKcWKw5aAA==
X-Received: by 2002:a05:6512:3b14:b0:50b:f51b:91f7 with SMTP id
 f20-20020a0565123b1400b0050bf51b91f7mr2494005lfv.103.1701978469277; 
 Thu, 07 Dec 2023 11:47:49 -0800 (PST)
Received: from [172.30.205.181] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 i38-20020a0565123e2600b0050bf789f501sm29324lfv.11.2023.12.07.11.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 11:47:48 -0800 (PST)
Message-ID: <44c36d3f-dacd-4ca9-b92a-5febdc5d1340@linaro.org>
Date: Thu, 7 Dec 2023 20:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650: Add DisplayPort device nodes
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
 <20231207-topic-sm8650-upstream-dp-v1-3-b762c06965bb@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231207-topic-sm8650-upstream-dp-v1-3-b762c06965bb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/7/23 17:37, Neil Armstrong wrote:
> Declare the displayport controller present on the Qualcomm SM8650 SoC
> and connected to the USB3/DP Combo PHY.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]

> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
What about PIXEL1 clocks?

[...]

> +					opp-162000000 {
> +						opp-hz = /bits/ 64 <162000000>;
> +						required-opps = <&rpmhpd_opp_low_svs_d1>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
>   		};
>   
>   		dispcc: clock-controller@af00000 {
> @@ -2996,8 +3086,8 @@ dispcc: clock-controller@af00000 {
>   				 <&mdss_dsi0_phy 1>,
>   				 <&mdss_dsi1_phy 0>,
>   				 <&mdss_dsi1_phy 1>,
> -				 <0>, /* dp0 */
> -				 <0>,
> +				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
>   				 <0>, /* dp1 */
>   				 <0>,
>   				 <0>, /* dp2 */
I noticed that this is not in line with your mdss patch [1]
where there are only two DP INTFs available.. Unless all of
these controllers can work using some sharing/only some at
one time...

Konrad

[1] https://lore.kernel.org/all/20231030-topic-sm8650-upstream-mdss-v2-5-43f1887c82b8@linaro.org/
