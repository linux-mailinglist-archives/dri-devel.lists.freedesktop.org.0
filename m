Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886174FB04
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 00:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707A210E44C;
	Tue, 11 Jul 2023 22:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1940510E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 22:38:24 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso10131268e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 15:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689115103; x=1691707103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oopt9erZoUG2dizfs7Owm/xRql9gq++ePXLLqwiHV8A=;
 b=tyKULaBlK5XrfbFwGoXhn+M4ot8tb3G6f4XXaU4jXcKcu2CB5oIl+Di3FQyZ0kOZ4z
 Dy3TebhmZH6OWqjlDt9t2TPIsXn+tcJMVopCvitY/ArzQvuO7gJHowcY+kRW8a3YVhbL
 K0tVohEcJKMW9mA7Noo4hYWvg/DJtTm6wGz+PIX62yf15Ho5W4xBjPURWLZhpZrI//AK
 Tr8TWsy5m1M6dfy0tg1sSwCLkbbRlHzz1RcOG/sbrL7tILQqcxix825QoAJGX3WGf6nF
 55zot4JQdww2ZjpW469olLo9ANDwiqcByB/vIaqtnB/ZDucX8s3/kgKJQmRelbCb2aMw
 eh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689115103; x=1691707103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oopt9erZoUG2dizfs7Owm/xRql9gq++ePXLLqwiHV8A=;
 b=QhgKYhZuV5TUZ0h3IfD+HhfNxdwJkkgth6iRA+9kdSjye9fPoe7lZfzlacwAqmUGJ4
 FwIQSnscg725l/yx+nRClCbFf4rLvVa8SHfKOEf7agKDAPR8MDu6puJimBIqMhMSZuNi
 uRI3rpzh9dJupHNAILermJ74cQ5h0G04BhoNXbaewpGuykkTYy+NcPIuceOenqwABXoj
 5FBdAENETaC34qUrom8ktzy+vjW1CFwZD0G8ydrhyky8Dt5xfyN7w527mjUyj9q1sfpe
 2u929kbV6DHRQfgZGO/zxtsDtf1lwA1iEESRJfMkVF/Wr6xuRa0WjWsYLu4Rh68pHnVU
 PdGQ==
X-Gm-Message-State: ABy/qLZ9NWEu9M9sFU6C0YCJ5YInIB76RH5rgWgRBAFJ+JKf8NesXs2Q
 9a4a3zfcYakUTFlLjx9qYlUw8g==
X-Google-Smtp-Source: APBJJlHZcrBfnaxu6wbfavyBNnhRHUabHpZntt6MxNUWvmQldCJw2Ge+GSBZ/PjAjdEs6Ps30+OvyQ==
X-Received: by 2002:a05:6512:451:b0:4f9:5ac3:4133 with SMTP id
 y17-20020a056512045100b004f95ac34133mr12649630lfk.25.1689115102732; 
 Tue, 11 Jul 2023 15:38:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x7-20020ac259c7000000b004f84b36a24fsm469763lfn.51.2023.07.11.15.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 15:38:22 -0700 (PDT)
Message-ID: <fdc3cec2-b6e2-a6f4-ef68-94d3a1fe3689@linaro.org>
Date: Wed, 12 Jul 2023 01:38:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sm8250: Add DisplayPort device node
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-3-dmitry.baryshkov@linaro.org>
 <da7cf83c-8026-c6dc-e3cb-c632c1b59d96@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <da7cf83c-8026-c6dc-e3cb-c632c1b59d96@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 00:34, Konrad Dybcio wrote:
> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
>> Declare the displayport controller present on the Qualcomm SM8250 SoC.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> [...]
> 
>> +				dp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-160000000 {
>> +						opp-hz = /bits/ 64 <160000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
> 19.2 MHz, VDD_MIN

I don't think so, the lowest working point is 162 MHz for RBR. 19.2 is 
just just artificial. I'll check, maybe it would be better to drop this 
completely.

> 
>> +					};
>> +
>> +					opp-270000000 {
>> +						opp-hz = /bits/ 64 <270000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
> 270 MHz, LOW_SVS

Ack. Which probably means that we should fix all existing DP opp tables. 
They all should be using low_svs here.

>> +					};
>> +
>> +					opp-540000000 {
>> +						opp-hz = /bits/ 64 <540000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
> 540 MHz, SVS_L1 (ok)
>> +					};
>> +
>> +					opp-810000000 {
>> +						opp-hz = /bits/ 64 <810000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
> 810 MHz, NOM (also ok)
> 
> (but then - there's qcom,max-pclk-frequency-khz = <675000>;)
> 
> also, what's up with the PIXEL1 clocks etc.?
> they are capped at the aforementioned 675 Mhz but I have no idea
> what they're for

I think PIXEL1 is used for DP MST.

> 
> Konrad
>> +					};
>> +				};
>> +			};
>> +
>>   			mdss_dsi0: dsi@ae94000 {
>>   				compatible = "qcom,sm8250-dsi-ctrl",
>>   					     "qcom,mdss-dsi-ctrl";

-- 
With best wishes
Dmitry

