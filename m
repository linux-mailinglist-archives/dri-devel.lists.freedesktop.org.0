Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AB74F9C6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 23:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1F910E068;
	Tue, 11 Jul 2023 21:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE3710E068
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 21:34:58 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6f97c7115so95987361fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689111296; x=1691703296;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5kdVuwXm6t95AcBuBM8m7iArVjotqNWDs0Iyq3HVAYg=;
 b=NkqZys+bin9V5fVkkxHI6QhlxChpa/RkNbEBdYOBEEEo9ee0ztANjJ9JvOD41diumx
 w7VZ/PzElygPNgUCjrnj9k7EyE4i9w+WAIv6IT2776fuExrUtDcjq39qyRMHIE2/frEa
 AWvN9zMI3J10jBIlBjqSSJJO+aaLzubQCvqfWyRy5MYa0ApR3cYx9huE/xfecmG7snik
 bTFJTaE6SeuAMT/+LXCqhOqoUfz2gZXyciEe1ZtQmw8N1I+gh9r/znni0PHun0d4ohYS
 yR6cltNg96DS2y4zjsX8j6skn9gJd16Z9dTXPWl5400p2c2xDOauvG30BRSHuLcxJA19
 tR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689111296; x=1691703296;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5kdVuwXm6t95AcBuBM8m7iArVjotqNWDs0Iyq3HVAYg=;
 b=hixA9/QCMUIXhEruweJnTJs0IvkTmojqHB61zxJJuulxqBSxvL+u6x990n6EIiHY+e
 kB9x96yCmoIGESwF1tFzsvPgZ/Bki6EiAbii1tvFVhZGvJs6mde7BaDxQJdtlrzTGPGR
 Ych4YuDewSDuMzlmO84GRISAjFYEK/hEFFX16rTl1xRuVa3Z090NPDYO/N04OGOlCZ4Z
 V1IuGkx91zv3J93h/iv5NWGp+ctJEvrUW6UKRdbRer9jAE8Fwk0h2miYx2p0VUsfmOd3
 LDhYSOz4niXioGm5Msad2SkQ6bGv47fdbYJgBHBUIliRblhqR8ItyHIBgv2zzpz/mI3j
 Kjrw==
X-Gm-Message-State: ABy/qLbpoHY0+dVW3qY9hgECoNn2jPmPd9CS4LX8Rn/sHgqzASDbV9HE
 Ndai0oVCZ+OezCIornF3oqscjw==
X-Google-Smtp-Source: APBJJlFvpJE95MGXlJyrIpKrgbrKL35PzAVwOnW7cxv5hb1zbqpIUZgMx6jvKV++u6SvtTpjyfoWrA==
X-Received: by 2002:a2e:a0d4:0:b0:2b5:89a6:c12b with SMTP id
 f20-20020a2ea0d4000000b002b589a6c12bmr14055670ljm.10.1689111296389; 
 Tue, 11 Jul 2023 14:34:56 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a2e9310000000b002b6cb40e9aasm597832ljh.103.2023.07.11.14.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 14:34:55 -0700 (PDT)
Message-ID: <da7cf83c-8026-c6dc-e3cb-c632c1b59d96@linaro.org>
Date: Tue, 11 Jul 2023 23:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8250: Add DisplayPort device node
In-Reply-To: <20230709041926.4052245-3-dmitry.baryshkov@linaro.org>
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
> Declare the displayport controller present on the Qualcomm SM8250 SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]

> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
19.2 MHz, VDD_MIN

> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
270 MHz, LOW_SVS
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
540 MHz, SVS_L1 (ok)
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
810 MHz, NOM (also ok)

(but then - there's qcom,max-pclk-frequency-khz = <675000>;)

also, what's up with the PIXEL1 clocks etc.?
they are capped at the aforementioned 675 Mhz but I have no idea
what they're for

Konrad
> +					};
> +				};
> +			};
> +
>  			mdss_dsi0: dsi@ae94000 {
>  				compatible = "qcom,sm8250-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
