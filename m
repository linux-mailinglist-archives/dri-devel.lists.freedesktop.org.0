Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2DA671DBE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 14:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F9110E751;
	Wed, 18 Jan 2023 13:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DA610E750
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:28:56 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id mp20so36635707ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RD9xTazty8qJBzZbHVEhRM4VLCqX49b0BUaP0rESuu8=;
 b=NDe2SWkROcKcgndpiF1eNt00Z6s/d4VujIVKd67GRbqI/s0Xk2yCoQqVF/aBIQSZpx
 4GgXqMUl81N+fiDp5tgNNwLnCCIayU4OHe0PZCz1wFmIKITcSbCYOwq+2xr0QAQNOEGK
 Cf7VDisGo1XyFeYccoSFyYdhcTJw28HHpq/+WvOfPqfJWUHHaYj/sPVL1SvVNfXO+Rxd
 jPSue+V8mWibrk8VvVj1tkGN996FmH8XP4wD4N7QqMOHTtfpik5fQVZ5irRu1NaFqnSa
 91Rl5rexKC2IhDqi0ctuk8GN2UecBt06oHhF5tvp91li02hwgMt8CgDFzKLx/M8m8Xyd
 LoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RD9xTazty8qJBzZbHVEhRM4VLCqX49b0BUaP0rESuu8=;
 b=I2YC3pr95LgmGx++JN4eSWTwZlrCWp5KLcFeqaNSFO0PPG5jO4DpMhNpxJTxL8EjuG
 XEZZJqp3NE8fW3pLPZMedXNK2TgQmiZmhnNXPQbDqv7IId4j899yM237823J37uU2QOf
 A9EyFJ0zMMm8E8suv36Cnvs7A1TzcaDPASiLODZS7iZUJyZ4bGj5j5HZpJzEOyaunQhd
 lJ0G/JAxUjerXhhMhw1Cv3HmR42I6e4OeSmgXu65w+qJcTs4agKl65FaLCgR48QB7io6
 MRotpoCRIF7SYywXdgyEJdc22c4OODwkImC5sOfWMsqT8Bz+kJ4CXQPNuhFHOOWChpak
 9CWg==
X-Gm-Message-State: AFqh2krHGH50FOLOwPTQC9aFf4tNpfBG/OQ1qyUWEdWhRBu00rHX8brZ
 pchfP5u2Km8dCglxa4L0B4UbPQ==
X-Google-Smtp-Source: AMrXdXteIuYHa922dSmrroQ8vOH1WU5yVgqFeDtjom3Tw0yZOROGycRDFXEmJbKnIo6JlUiIAlezkQ==
X-Received: by 2002:a17:906:1d41:b0:86e:b750:d0fe with SMTP id
 o1-20020a1709061d4100b0086eb750d0femr16816944ejh.32.1674048535293; 
 Wed, 18 Jan 2023 05:28:55 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a1709062a4b00b0073022b796a7sm14902509eje.93.2023.01.18.05.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 05:28:54 -0800 (PST)
Message-ID: <39ba6ed5-f345-6c6a-247f-7b569da94192@linaro.org>
Date: Wed, 18 Jan 2023 14:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl
 compatibles
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
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



On 18.01.2023 04:20, Dmitry Baryshkov wrote:
> Add the per-SoC (qcom,sm8350-dsi-ctrl) compatible strings to DSI nodes
> to follow the pending DSI bindings changes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 703ba3d81e82..a066566b6ea9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2883,7 +2883,7 @@ dpu_intf1_out: endpoint {
>  			};
>  
>  			mdss_dsi0: dsi@ae94000 {
> -				compatible = "qcom,mdss-dsi-ctrl";
> +				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae94000 0 0x400>;
>  				reg-names = "dsi_ctrl";
>  
> @@ -2978,7 +2978,7 @@ mdss_dsi0_phy: phy@ae94400 {
>  			};
>  
>  			mdss_dsi1: dsi@ae96000 {
> -				compatible = "qcom,mdss-dsi-ctrl";
> +				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae96000 0 0x400>;
>  				reg-names = "dsi_ctrl";
>  
