Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A26BE4D0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE52A10EEA4;
	Fri, 17 Mar 2023 09:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8033210EEA2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 09:04:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id x22so2848026wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679043872;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MsOeH5VTIJLvj266rkHX55Fde/Bb5Keky5mnCISQsH4=;
 b=sd0h8SxnEaPFkX2Ud7MfNZvoReK4uV/7qxpxBxk3xZNM+tmtsKaPyezXdyFkieGIJc
 0dAQmQwRAPKZhYDo8xIZRl6VVMR92PTktVWVR8Q0z+vDXYswjUSsVY7wlUIFkthM+20l
 UDj9+aGUleTQW9Ey5UxTr4So32e0lHEiq9mLQI408omO7fB5G9ivC5Qd1oOp4TH7Zs+5
 IhAy8bnnVlm7+b12UimMblITYQesVU1arR7gYrybPcxAmy1t/iBfxpnRdVz7YWFmUplW
 qnEwesi7jE7q/FsQ9bFv2NC7ty5F/KXLGYCECuc9O2FLPeUD2lLEmJwVPKYVEKmWw7U6
 xWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679043872;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MsOeH5VTIJLvj266rkHX55Fde/Bb5Keky5mnCISQsH4=;
 b=CIR4JTPXZYOonL5KoWD60qlv5AVzoDalWTp4JA5aZpIPLLJJScvcCXGXD1IFA3inLf
 /ljXX5AJHe8q+YzJisnioz9b/8TIx8ZttNUqA/H6JL4mqnvjqtutaLO7GIC6pqu/LoMX
 I2BOWZHDz4fI5rYvGm4tSPr+C06IYH/2jHR2IqdbNB6SFT5UWRWJtsDgp0d0RgFxtNvK
 IYA+1kCWe41I47FaayfbIZeBDX53ihV5fK0lBmzOQu1mKMwmMc3kqP1C+DkD8jCMAYli
 TkZTnTC86JElZQoPR39FT8xYtmUOsNlegxRy5t48CGtt9cUK8V6WRDP7unHsuWAehVRr
 8lBw==
X-Gm-Message-State: AO0yUKVOpXZomjpcAir0bnNlOKFZwrhlq1ErOnI3CWPAyADSdBla6Ev5
 DOJnYt8FVKQiEYhG9d7jbRAfUw==
X-Google-Smtp-Source: AK7set+OoHD95yvZIthSsT6vMUzbdSIlC1qogPX4UgrFrwcsvTC1CiCc4Q7krtb17ucGOJ/QoYalvw==
X-Received: by 2002:a05:600c:154d:b0:3ed:23d5:4c4c with SMTP id
 f13-20020a05600c154d00b003ed23d54c4cmr19408344wmg.12.1679043871668; 
 Fri, 17 Mar 2023 02:04:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9ed5:bad0:e925:7938?
 ([2a01:e0a:982:cbb0:9ed5:bad0:e925:7938])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a1ccc09000000b003db01178b62sm7154127wmb.40.2023.03.17.02.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 02:04:31 -0700 (PDT)
Message-ID: <f9606b1b-2981-4874-4763-ef3ce96cc6f2@linaro.org>
Date: Fri, 17 Mar 2023 10:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: sm8350: add dp controller
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v4-0-dca33f531e0d@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v4-3-dca33f531e0d@linaro.org>
 <68a26435-4f00-1571-88ef-1f3c0a254cef@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <68a26435-4f00-1571-88ef-1f3c0a254cef@linaro.org>
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

On 14/03/2023 23:10, Konrad Dybcio wrote:
> 
> 
> On 9.03.2023 10:19, Neil Armstrong wrote:
>> Add the Display Port controller subnode to the MDSS node.
>>
>> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> [...]
>> +				dp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-160000000 {
>> +						opp-hz = /bits/ 64 <160000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
> Downstream doesn't seem to use this lowest freq

Now I know to look at, indeed, will remove.

Thanks,
Neil

> 
> Konrad
>> +
>> +					opp-270000000 {
>> +						opp-hz = /bits/ 64 <270000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-540000000 {
>> +						opp-hz = /bits/ 64 <540000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-810000000 {
>> +						opp-hz = /bits/ 64 <810000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>>   				};
>>   			};
>>   
>>

