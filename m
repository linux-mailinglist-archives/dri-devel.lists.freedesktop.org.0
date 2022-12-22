Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9B653E86
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 11:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2828310E06A;
	Thu, 22 Dec 2022 10:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F0D10E06A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 10:47:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b13so2163816lfo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 02:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Tl2hcVeNT0vWD8ywC5G/0OTliUnFGkJ2ZnLCksg4DI=;
 b=m6EBowLOzMw5zyWmi1/hvCymiNwK94JNtplNzqbQc0NHo/HSKGRLX520+QvN0S67ls
 /L4dln0jt/I+E2z8tSEWSgPyhVnZ2vV8XDggo77xStyxjIkIpXj2qtsUy8XpfGs3zUv9
 w3uwLtCsTIBjJ/gusutbVidU+5flI93C40iDxKNZAkiR/5CaW7n9jXpEHJHcl0FDeYj0
 gUjsW6uA0YI3Rtrc5pDQUYq9kOjGZjllMxlYlGmjw4REPyxfcaYR32B5+v3qH6EgVhAP
 L4JtAS+iXFiGbcQQz1yUXIswy/9NGfLv25RAG4btdGVPRATxcAz3mBY0EkSZjEAh9KPv
 weRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Tl2hcVeNT0vWD8ywC5G/0OTliUnFGkJ2ZnLCksg4DI=;
 b=VI14YR7peKhBxJJXnt84Y0fWRlXIKOX0kuT4C0YyEimJk90nl8P3kU+2GEYny6Y0RY
 dSKIskNh6n498ZnOjthOg6GOi4X4CQOm/gjo1YbhiE36fBEsP8Ga2ApTNjiZ+wTloJia
 DlhBEw/YrQeb4MjJnuVs8rnGw/ajHpBCIWg/sJ7SF2Y7FpBqCu4k+dg/ezdczyRVeCKI
 OcvWK9Nsi+kJy2S8AkZamypceusWyTTxBH8wiFWr/dRgbZ3KncDYk46y7QqaqkfZQFMM
 ezamelqw6LPIsiTLC9LLu5JBtUEGoZ2rkSquv61UlS5lJlM4zxP1cm/+i5LF6ijaNLaa
 IWWw==
X-Gm-Message-State: AFqh2koSztBxgiLKpS7jJXpth53dMgmfk1hgPPOn3lwF8tSkOImaj57t
 xyWmRkYuLn9TQnbKqZYjlJn5uQ==
X-Google-Smtp-Source: AMrXdXum0yhd+U+J7O/Sr7hX0iuI/NHaDGZNG0OyjYCTKSOOL+Iom+aE9JcEoD1nnLbhq9WLKRzroA==
X-Received: by 2002:a05:6512:2821:b0:4b5:26f3:2247 with SMTP id
 cf33-20020a056512282100b004b526f32247mr1787186lfb.69.1671706062000; 
 Thu, 22 Dec 2022 02:47:42 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v10-20020ac258ea000000b004b501497b6fsm31163lfo.148.2022.12.22.02.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 02:47:41 -0800 (PST)
Message-ID: <1a5cc3d3-ac2d-52c8-79f4-b13252a4bb86@linaro.org>
Date: Thu, 22 Dec 2022 11:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v14 1/5] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
 dmitry.baryshkov@linaro.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
References: <1671217893-17496-1-git-send-email-quic_khsieh@quicinc.com>
 <1671217893-17496-2-git-send-email-quic_khsieh@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1671217893-17496-2-git-send-email-quic_khsieh@quicinc.com>
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

On 16/12/2022 20:11, Kuogee Hsieh wrote:
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
> Changes in v13:
> -- delete an extra space at data-lanes
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 6 +++++-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 4 ++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index eae22e6..e2783dd 100644
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
> +    data-lanes = <0 1>;
> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;

Messed order of nodes.

>  };
>  
>  &pm6150_adc {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index c11e371..3f363f8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -442,7 +442,11 @@ ap_i2c_tpm: &i2c14 {
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hot_plug_det>;
> +};
> +
> +&dp_out {

Same problem here.


Best regards,
Krzysztof

