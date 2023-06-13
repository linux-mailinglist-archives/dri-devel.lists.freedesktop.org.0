Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E8E72DAD7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B5210E33D;
	Tue, 13 Jun 2023 07:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B0410E33D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:29:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30aebe2602fso3430879f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686641379; x=1689233379;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SWcv2KbrVkYfhLRQFgFKlaFWH34hYYx6W1r/9LcWNfU=;
 b=QmKKD4LMjD9i+Quf/rolLMOd4eqr0DS/nQA2gx5UzbHAwy89+M7DsAeiYF0aB8nPWq
 Rz2TpEEEyooJBlrmYwbifewPMFmSXCo1O/czW4AYUG3V3OzM2ZA7Io2ACgcsdVRk2hhW
 jWK7bV5zeLMRIazLGvBouWMWMfeFilvhdE0gps+G6UzAGlk7PqR+Sv68stYcDXwbIjJS
 BMGnVuYB+TJTj8inkXdSpxLbVJCN5Cg59hKLUQKgLBY8Fe1Dco9OLTB31a+vAoyPWGMh
 8eFoOWK6HXaCc8F7JxR5xkTbVeUMfSrG6pp4JlEUOW7yXfEPtkqHamfCWJ7YfU3ME5RN
 LlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686641379; x=1689233379;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SWcv2KbrVkYfhLRQFgFKlaFWH34hYYx6W1r/9LcWNfU=;
 b=QU5QXGF9gflv16OYKAUYxaL5SYCJQtz2mY/dfNDGDAaQauO1huLnLGOKkhVbS9oale
 q1Ja81hN+YCUF6YQAfy+0SMJ9NK/cPSOZi8sk3j0wlEVmYJAVZfT3qLG8gXkXTGY43tM
 pcgMgCwKaNGw6s42kahuP7wUSIJOyK1Kn2BIN70h5b/ZcANU/ne/UV2+pD9ExMNeJg+E
 /WMHXpT9uqGR+se3gNnyfXyYqWbx9ZTBw4xWk8szJ9434OI2V4jnXjVHBVCHDPVs4SrV
 UA75B0qHOWDBDCmABRdwp5rein/TS2sEkFxKrEj3ujtOTs5O0f+cccpk9lRGTUtHOuQW
 UWEA==
X-Gm-Message-State: AC+VfDwEQutgkuY5nz+lCf5RdeVAGVa8yrZWyZv3/PJgNiF+AdZ6dQ3P
 KEUqKoLkyF6/vGZJ1ZjGh8v6/g==
X-Google-Smtp-Source: ACHHUZ4llERySH8FvtsxtkPBf3YLvy/r2xMKHTUzrkPF382Oj3Rb5ZncCciA46/buotoosZubkrCGg==
X-Received: by 2002:adf:e3c5:0:b0:30f:bbd6:1efe with SMTP id
 k5-20020adfe3c5000000b0030fbbd61efemr4099802wrm.57.1686641379388; 
 Tue, 13 Jun 2023 00:29:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48b:b939:c60e:e1ba?
 ([2a01:e0a:982:cbb0:48b:b939:c60e:e1ba])
 by smtp.gmail.com with ESMTPSA id
 h14-20020adff4ce000000b0030c40e2cf42sm14367826wrp.116.2023.06.13.00.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 00:29:38 -0700 (PDT)
Message-ID: <1b3e86a7-352c-de2f-aaa0-51fe878b8462@linaro.org>
Date: Tue, 13 Jun 2023 09:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sm8550: fix low_svs RPMhPD labels
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org>
 <20230601-topic-sm8550-upstream-dp-v3-1-5f9ffdcb8369@linaro.org>
 <ce7c4402-b58e-b5df-c864-9f1a959132d0@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <ce7c4402-b58e-b5df-c864-9f1a959132d0@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/06/2023 18:50, Konrad Dybcio wrote:
> 
> 
> On 12.06.2023 17:26, Neil Armstrong wrote:
>> "low" was written "lov", fix this.
>>
>> Fixes: 99d33ee61cb0 ("arm64: dts: qcom: sm8550: Add missing RPMhPD OPP levels")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> https://lore.kernel.org/linux-arm-msm/1d3c05f5-c1bd-6844-1788-8df0b863a02e@linaro.org/
> 
> somebody forgot to run `b4 trailers -u` :P

Damn, resending a v4 now :-)

Thanks,
Neil

> 
> Konrad
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 75cd374943eb..972df1ef86ee 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3649,15 +3649,15 @@ rpmhpd_opp_min_svs: opp-48 {
>>   						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>>   					};
>>   
>> -					rpmhpd_opp_lov_svs_d2: opp-52 {
>> +					rpmhpd_opp_low_svs_d2: opp-52 {
>>   						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>>   					};
>>   
>> -					rpmhpd_opp_lov_svs_d1: opp-56 {
>> +					rpmhpd_opp_low_svs_d1: opp-56 {
>>   						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>>   					};
>>   
>> -					rpmhpd_opp_lov_svs_d0: opp-60 {
>> +					rpmhpd_opp_low_svs_d0: opp-60 {
>>   						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>>   					};
>>   
>>

