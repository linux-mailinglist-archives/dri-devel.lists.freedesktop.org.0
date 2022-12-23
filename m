Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9689D654F51
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 11:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B530010E630;
	Fri, 23 Dec 2022 10:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAD510E630
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 10:50:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f34so6618587lfv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 02:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WtagtrjVyMLvccSqt3I+WkfzIk+UO6YPIaRsEP+rBLY=;
 b=tSt927mP1h9N5fflQwy+3M1COdivv/3rLlaRfJr0FQ9I3BisLoiYywvm/95jk4Fssk
 6E0GkdulnQMr5wV4k04uyjWQM1CgC7q6bymUdvKO8IYj1//m9BkCxf5XQRS0IMvn0enj
 tFACx7Da24rDGaqCjOxxHDhPekEOOagUh34s3yyRiEIzMNxJY7+08+xWfVGRIWRJ/XBC
 E9gdHf6bJBFAlG6Ng/praFU1adVu82inVAdiSoV9i9Rno3lQoOoNF6dpDoz1/0PRIzm7
 0oUsBuKai7k6FcdiT60O+BF4PcqvxPPGVFlK3aR7FVubLSTjAVKR608jCWVJZrWu4oQP
 qrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtagtrjVyMLvccSqt3I+WkfzIk+UO6YPIaRsEP+rBLY=;
 b=wtZjSTiapYs1Xkei2jsEUkI3VZZvjKGBmYVjVWyT1sF57E9TxXhQlznTyY1mAj3c7Y
 x6VPDUF3Isu+0KIw99tmRRyD4EUYf1uFNKFY4tqEP/tEYqqywgAmuSS/4WXtJQ5sANsU
 KOQYl0d1DzIfb7naNSWB+64Mt9nY7TRk9KCpJBeXgixq543FFcWBmNILvybRJCrwXlrk
 Sf8ftFS0oAdnlU0C2O2HypxU73zarDLTXwqkRFJV2VtYPzpTcZ9ZyyAxxU7ZVeJMsN+s
 EylNBx/ZXayNgE6v3UqGehAtAU37MJW5sycSw/6VQo0F7m0PC18JALOfoEh95pUsoD6b
 cRMg==
X-Gm-Message-State: AFqh2kqJIXSYWDwHvzvLHgO8QDBph8BMLnvPcA2lCos3wCalHuI9Kg3b
 0MSq5ZwGU3Bf/tb/F6fwE4SeMQ==
X-Google-Smtp-Source: AMrXdXtUV6jVBYU35M5fl+1l/dWPFQQjjpmybPBcN29GIflG/xU5nRArG+ztoYILdH0vx8K2RCdBdw==
X-Received: by 2002:ac2:4317:0:b0:4b5:834b:9f82 with SMTP id
 l23-20020ac24317000000b004b5834b9f82mr3518276lfh.58.1671792603447; 
 Fri, 23 Dec 2022 02:50:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u18-20020ac258d2000000b004c89b9fb1fdsm479107lfo.68.2022.12.23.02.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 02:50:03 -0800 (PST)
Message-ID: <4d00cf12-917b-32ba-5293-2337c21f1a0f@linaro.org>
Date: Fri, 23 Dec 2022 12:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 1/5] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
References: <1671217893-17496-1-git-send-email-quic_khsieh@quicinc.com>
 <1671217893-17496-2-git-send-email-quic_khsieh@quicinc.com>
 <1a5cc3d3-ac2d-52c8-79f4-b13252a4bb86@linaro.org>
 <54bd8b85-8b68-4b28-ec68-28edf9a8a097@quicinc.com>
 <f8ed0927-a97e-9395-1297-addb57ecd855@linaro.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f8ed0927-a97e-9395-1297-addb57ecd855@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/12/2022 09:57, Krzysztof Kozlowski wrote:
> On 22/12/2022 17:22, Kuogee Hsieh wrote:
>>
>> On 12/22/2022 2:47 AM, Krzysztof Kozlowski wrote:
>>> On 16/12/2022 20:11, Kuogee Hsieh wrote:
>>>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>>>> add link-frequencies property into dp_out endpoint as well. The last
>>>> frequency specified at link-frequencies will be the max link rate
>>>> supported by DP.
>>>>
>>>> Changes in v5:
>>>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>>>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>>>
>>>> Changes in v6:
>>>> -- add data-lanes and link-frequencies to yaml
>>>>
>>>> Changes in v7:
>>>> -- change 160000000 to 1620000000
>>>> -- separate yaml to different patch
>>>>
>>>> Changes in v8:
>>>> -- correct Bjorn mail address to kernel.org
>>>>
>>>> Changes in v9:
>>>> -- use symbol rate (hz) for link-frequencies at dp_out at sc7180_trogdor.dtsi
>>>>
>>>> Changes in v13:
>>>> -- delete an extra space at data-lanes
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 6 +++++-
>>>>    arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 4 ++++
>>>>    2 files changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> index eae22e6..e2783dd 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>>>> @@ -814,7 +814,11 @@ hp_i2c: &i2c9 {
>>>>    	status = "okay";
>>>>    	pinctrl-names = "default";
>>>>    	pinctrl-0 = <&dp_hot_plug_det>;
>>>> -	data-lanes = <0 1>;
>>>> +};
>>>> +
>>>> +&dp_out {
>>>> +    data-lanes = <0 1>;
>>>> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>>> Messed order of nodes.
>>
>> can you please give me more details and how should i fixed it?
> 
> Node overrides/extends are more or less ordered by name. dp should not
> be around mdp, but for example dsi.

I think it would be better to also rename dp_out to mdss_dp_out. To keep 
all mdss entries nearby.

-- 
With best wishes
Dmitry

