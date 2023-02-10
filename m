Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E936922AF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 16:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0602E10ED6E;
	Fri, 10 Feb 2023 15:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BD310ED6E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 15:54:15 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id fj20so5117017edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 07:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RFOHltJDX4HqYupfofGUo17e9ZNMA+v0JnnvnsIGwB8=;
 b=D47BwzV6CERtXj0Y2bEgghOqAC1KeNaqCp1FEqrMtuG5ePSCPK0yWzJdajxE47Xyml
 2SBvHRTJ7EZfSSaBo1+tHARKTT/Esv68g6mDz0wGxnM0i8rf7+seOdLNKJD60nrq+SB9
 W0ujkM+7Y47DIGu0spGqVhBcI57Zl7AbRNpdRuMy/35Q/7JBZXH8CRZGloRv2WFc75JF
 BUYRE4vrZuiyY3NThL1lFD2WNN/z/fYPG0qi7+Op61CT4B4qlgo1z2b8ZkL5xbvCt/q7
 k4FBFHCN6rZ2sr8xMmPBNSDwakvyc7MBjqN+VZDidDbVOab3Cfbv9GFnkYgptGuQKHps
 jY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RFOHltJDX4HqYupfofGUo17e9ZNMA+v0JnnvnsIGwB8=;
 b=wfs1YMozPr1KvRsjmFXvicxnm/VW7d/vFocSifHNidVQVKdfl49qLgeYKP+QiV+ZUr
 pJk6KRnZCtOiN2lzskvrDonpo1FKdDCsMNJ7w1KG3YTvJNkR3v8lwUTU6Sq4GMxRjZ5U
 Z2MT+Af8Nxw9DKZIzQoOLRFcK9oushszpKiq0ffMZBtAbg3Ikj73kb7K/pKCk5CIf+2i
 y1FJpK6v2q0D78r2JFhwFby3aZcWqVdYcLGlhdBDJpgTI4kpEZFE79UOI/CAW2Ra9tCv
 1Y+6sKaQW7egKc9Q3VnoAGBZUxeIU4dq+IVdafHMwrKJv57bI3JeIes3Z9WyGwKkp9BJ
 kZxw==
X-Gm-Message-State: AO0yUKUeiCLiE49kivDmasWf9WkvtTPHC42Xtzn4QLb9VLfhdtG6xYuV
 VUokeWmJZEfgJpmQ0LBxxM9EtFhPfw4o6Dh6
X-Google-Smtp-Source: AK7set/TVcHbOGmvCIoayuAWCd9zPG2uIyMdoJSsxD8eiwCLiVSmf8ACzfIGl8PdaKvwB0WigJlacw==
X-Received: by 2002:a50:9b18:0:b0:4ac:b31c:83d3 with SMTP id
 o24-20020a509b18000000b004acb31c83d3mr726693edi.14.1676044454141; 
 Fri, 10 Feb 2023 07:54:14 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a509302000000b004aad8d2158dsm2368436eda.66.2023.02.10.07.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:54:13 -0800 (PST)
Message-ID: <880e691a-0512-6325-f27c-9be59abdd647@linaro.org>
Date: Fri, 10 Feb 2023 17:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sm8450: add dp controller
Content-Language: en-GB
To: neil.armstrong@linaro.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v3-0-636ef9e99932@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v3-5-636ef9e99932@linaro.org>
 <347a5193-f7b1-7f8e-0c60-3d435bdf952c@linaro.org>
 <f5a26fff-2dc2-2397-a80c-2477176a5864@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f5a26fff-2dc2-2397-a80c-2477176a5864@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/02/2023 17:28, Neil Armstrong wrote:
> On 10/02/2023 16:24, Dmitry Baryshkov wrote:
>> On 10/02/2023 16:44, Neil Armstrong wrote:
>>> Add the Display Port controller subnode to the MDSS node.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 79 
>>> ++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 79 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>> index 6caa2c8efb46..72d54beb7d7c 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>> @@ -2751,6 +2751,13 @@ dpu_intf2_out: endpoint {
>>>                           };
>>>                       };
>>> +                    port@2 {
>>> +                        reg = <2>;
>>> +                        dpu_intf0_out: endpoint {
>>> +                            remote-endpoint = <&mdss_dp0_in>;
>>> +                        };
>>> +                    };
>>> +
>>>                   };
>>>                   mdp_opp_table: opp-table {
>>> @@ -2783,6 +2790,78 @@ opp-500000000 {
>>>                   };
>>>               };
>>> +            mdss_dp0: displayport-controller@ae90000 {
>>> +                compatible = "qcom,sm8350-dp";
> 
> Exact, must fix.
> 
>>
>> Missing "qcom,sm8450-dp". As I wrote in the comment to patch 1, I'd 
>> suggest having just a single entry here rather than keeping both 8350 
>> and 8450 entries.
>>
>>> +                reg = <0 0xae90000 0 0xfc>,
>>> +                      <0 0xae90200 0 0xc0>,
>>> +                      <0 0xae90400 0 0x770>,
>>> +                      <0 0xae91000 0 0x98>,
>>> +                      <0 0xae91400 0 0x98>;
>>
>>
>> While this sounds correct, usually we used the even size here (0x200, 
>> 0x400, etc.). Can we please switch to it (especially since sm8350-dp 
>> uses even sizes).
> 
> I don't have access to registers layout for HDK8450 but the system 
> freezes when using even sizes, using
> the exact register size works fine.

Interesting. Could you please trace, what exactly makes it fail, since 
specifying bigger region size should not cause such issues.

-- 
With best wishes
Dmitry

