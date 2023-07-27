Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D53D076552A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 15:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D7010E582;
	Thu, 27 Jul 2023 13:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E7810E581
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 13:34:53 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so14296621fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690464892; x=1691069692;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9uwU8ola2qkLcSKy+1rI5aYJOesLH456/lp3WB7O6aM=;
 b=C50x3UuXGGD+pywiK4+NxP6WrckJr3mb0tanueA232jGBD3tAJBugCLuZMBPwUmVXL
 fGKbEqxDdprS+Ycgh/dvbY/2g8e05/FJ1Fqo1akjAeZBvXX1+bwtLWS/iq5Rfw3B8x1p
 DNtAH0CCgf5///3MQ6sz/ERGZ5DhnkjJSIyIB8Ss68SfJGp/suJ6mOUrsfCw1A7FvpUW
 ivAedLk2G7Z1T4sgNqpMPjbkLSkvznYIQN5hPV6Iv8/8XP2uiLHCFJxLShHCLmtRXNqJ
 +cQqJ0DrrioMojCP/C+WEAaRT52km+9KUOYuzvn9Zc0YsmC2TaMfczDr41G9UaT/8fld
 9QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690464892; x=1691069692;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9uwU8ola2qkLcSKy+1rI5aYJOesLH456/lp3WB7O6aM=;
 b=dYsEVYm4cR7gp3k1J2GQQmiK2S9j3vwxCiaT57eEjpr7bqk2fv7lu1a/FLzxCINJ3w
 4xt/21EoSl5G4J4N5HXyk3bqgRVMi7cneyJKjWKLndyqHHRMBPtcQ5E29f7rY2+K0XQA
 tTCcYeO/fK7rtkHVG7BeuFxgMbTngIXq8+gV5FftjjlkWEvdpckEBQQdpI/wJyPPX/U6
 Ny2wzhnG+qc48jQrO7t3lLmujOsXWbBr7nsP/3K2jfxZD172hB8nd5ArYlidB0sw9zk6
 8OApMyqaK1FqSFlO30iBmPm0umZotVp0VAd+VVeLknf6B/vAiAWJWvo6eoZeqEFH92TA
 bu2g==
X-Gm-Message-State: ABy/qLbUSj9adgeHJ7nOHlV54K1qEX4HhasTbS4/HcAxWdx9Ae1QKe0J
 jNC4Abe4DrK7NoHweSFM6P7WWw==
X-Google-Smtp-Source: APBJJlH0Y3VkQ0iBH2aM2WoMWRGBLQjYtW2yB9AaM+gkBgYJjEPBCW9UH2E6x4JfNXt58uxxP3R1kQ==
X-Received: by 2002:a2e:8310:0:b0:2b6:f1ad:d535 with SMTP id
 a16-20020a2e8310000000b002b6f1add535mr1641588ljh.14.1690464892041; 
 Thu, 27 Jul 2023 06:34:52 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 lt5-20020a170906fa8500b0098f99048053sm792492ejb.148.2023.07.27.06.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 06:34:51 -0700 (PDT)
Message-ID: <6c5197c9-e24d-70ac-fd75-2c72369d8b7f@linaro.org>
Date: Thu, 27 Jul 2023 16:34:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/17] drm/msm: Add SM6125 MDSS/DPU hardware and enable
 Sony Xperia 10 II panel
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
 <169046051039.1413710.12901529844343078449.b4-ty@linaro.org>
In-Reply-To: <169046051039.1413710.12901529844343078449.b4-ty@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 15:22, Dmitry Baryshkov wrote:
> 
> On Sun, 23 Jul 2023 18:08:38 +0200, Marijn Suijten wrote:
>> Bring up the SM6125 DPU now that all preliminary series (such as INTF
>> TE) have been merged (for me to test the hardware properly), and most
>> other conflicting work (barring ongoing catalog *improvements*) has made
>> its way in as well or is still being discussed.
>>
>> The second part of the series complements that by immediately utilizing
>> this hardware in DT, and even enabling the MDSS/DSI nodes complete with
>> a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/17] drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/a7e3fda5948a
> [02/17] arm64: dts: qcom: sm6125: Pad APPS IOMMU address to 8 characters
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/b7d35a8eae54
> [03/17] arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/2be52ca96a71

Of course, these two patches sneaked in by the mistake, dropped them now.

> [04/17] dt-bindings: display/msm: Remove DSI1 ports from SM6350/SM6375 example
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/4be2c19261fc
> [05/17] dt-bindings: clock: qcom,dispcc-sm6125: Require GCC PLL0 DIV clock
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/4f86e343f3c6
> [06/17] dt-bindings: clock: qcom,dispcc-sm6125: Allow power-domains property
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/91043642f28c
> [07/17] dt-bindings: display/msm: dsi-controller-main: Document SM6125
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/cf5859476e5d
> [08/17] dt-bindings: display/msm: sc7180-dpu: Describe SM6125
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/04a664dffd19
> [09/17] dt-bindings: display/msm: Add SM6125 MDSS
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/3bde3b8f8a04
> [10/17] drm/msm/dpu: Add SM6125 support
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/76c5dffd0bc4
> [11/17] drm/msm/mdss: Add SM6125 support
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/de50357565d3
> [12/17] dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/cdac445883cc
> [13/17] drm/msm/dsi: Reuse QCM2290 14nm DSI PHY configuration for SM6125
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/7638d8059ace
> 
> Best regards,

-- 
With best wishes
Dmitry

