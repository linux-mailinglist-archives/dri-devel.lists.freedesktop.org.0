Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7751174FBB2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 01:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D5910E453;
	Tue, 11 Jul 2023 23:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3B410E45B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:05:00 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6f97c7115so97003511fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 16:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689116698; x=1691708698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HrPGRPC6HG0U2FML7Fsc9fdI4MG3WoxSDfYEpjLufj4=;
 b=hyk6BzvMm+cF73GKAxkljHynA3RbjXkc1rW5YudTd/1PQubEtGU7RFbes5TqouW+pO
 PJX7UaUQXG43XULLItyQw2ALn4u/scZ+32rJExJvDfG0NF2DBywIiErLkiZ5XoWqk3Y7
 OpqzA6Wz+IJ/5xG/SecPt2VcTuN+92k+QbyBlBAy2Hj/ac1u4V4rh/RgOjHsj7m7K+bz
 OI5CntiUFwnh/PQx1JJ56hNpKC6853HHS/kjAzBqotYh47YxREZTHRSugxDQgyRdqZ/R
 LhQNxKkp5QI5/Mp9LF2RYmmXecqqekoWGLj4QHC7in2b32STxJ/eQfL9eBaiCXHsnp1G
 TJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689116698; x=1691708698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HrPGRPC6HG0U2FML7Fsc9fdI4MG3WoxSDfYEpjLufj4=;
 b=eO4mvO0hrvzTobHLv970Vd5hEELDOvMPJ01WcVXd0kxZoPlzQx0MPvLFlBDSEHUW3f
 XCSWDKrbq3gdXo5mHu1g+2fPhPckbJiyVHTrzhMz1mtN67xuqE83ldUBMbi+BNsnpcYE
 k9YrGBkOL6tpbAGPP3zNN/gj726uPETgciPuF+2nfavTaq8vpwL/tU3Zfedxbi9hbrW2
 pFVchX98ZEMLbVLV5ikXNUdairiajOgDHJoXSTpOTib0sWKTaEggZHZ1xlvljEoE/pib
 QQqLzMDn2YcAU4p+pMki0KRhT7Tzu6pcM7iiArVlce7nJi72Vwj6TjwUOE3cpTXHwXqy
 uA6g==
X-Gm-Message-State: ABy/qLYdB40PpOjlC1RBGqRx5kSI2wFdXjTLviu7bjZNvZkoK7RThF2M
 Jh7icvq6fi7zXGCjIxkdVdFQPA==
X-Google-Smtp-Source: APBJJlEg2hw+MBpZNNOeJN2GtjgzeJrhXA9r4AsOhwLh9cl0w2ck9Kf3KdlFd+1EhzlAggXvIfxSJQ==
X-Received: by 2002:a05:651c:201:b0:2b6:dbc5:5ca4 with SMTP id
 y1-20020a05651c020100b002b6dbc55ca4mr13049709ljn.16.1689116697997; 
 Tue, 11 Jul 2023 16:04:57 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a2ea164000000b002b6e973f8cfsm648369ljl.36.2023.07.11.16.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 16:04:57 -0700 (PDT)
Message-ID: <2c9d4d18-48c8-12b0-a971-62138b318c5b@linaro.org>
Date: Wed, 12 Jul 2023 01:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
 <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
 <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
 <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
 <CAA8EJpqxuziMGqkCZsE18K6z=WyQ44nxo3+-He=SZhH7Gfggkg@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqxuziMGqkCZsE18K6z=WyQ44nxo3+-He=SZhH7Gfggkg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.07.2023 01:01, Dmitry Baryshkov wrote:
> On Wed, 12 Jul 2023 at 01:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 12.07.2023 00:39, Dmitry Baryshkov wrote:
>>> On 12/07/2023 00:36, Konrad Dybcio wrote:
>>>> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
>>>>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>> [...]
>>>>
>>>>> +            port@1 {
>>>>> +                reg = <1>;
>>>>> +
>>>>> +                redriver_phy_con_ss: endpoint {
>>>>> +                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>>>> +                    data-lanes = <0 1 2 3>;
>>>> That's USB+DP lines combined, or how does it work? I'm confused :/
>>>
>>> 4 generic purpose SS lanes, which can be purposed for USB or for DP.
>> Okay, so my gut did better than my brain.
>>
>> Other than that, I'm reading the bindings and it looks like ports 0 and
>> 1 may possibly be swapped?
> 
> Yes. But if I get schematics right, the lanes are not swapped in this case.
I'm not talking about the 0123-3210 swap, but rather in/out being swapped.
Unless I'm reading the bindings wrong (or they may be written in a
confusing way).

Konrad
> 
>>
>> Konrad
>>>
>>>>
>>>> Konrad
>>>>> +                };
>>>>> +            };
>>>>> +
>>>>> +            port@2 {
>>>>> +                reg = <2>;
>>>>> +
>>>>> +                redriver_usb_con_sbu: endpoint {
>>>>> +                    remote-endpoint = <&pm8150b_typec_sbu_out>;
>>>>> +                };
>>>>> +            };
>>>>> +        };
>>>>> +    };
>>>>>   };
>>>>>     &mdss {
>>>>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
>>>>>   };
>>>>>     &usb_1_qmpphy_typec_mux_in {
>>>>> -    remote-endpoint = <&pm8150b_typec_mux_out>;
>>>>> +    remote-endpoint = <&redriver_phy_con_ss>;
>>>>>   };
>>>>>     &usb_2 {
>>>>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
>>>>>               port@1 {
>>>>>                   reg = <1>;
>>>>>                   pm8150b_typec_mux_out: endpoint {
>>>>> -                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>>>> +                    remote-endpoint = <&redriver_usb_con_ss>;
>>>>> +                };
>>>>> +            };
>>>>> +
>>>>> +            port@2 {
>>>>> +                reg = <2>;
>>>>> +
>>>>> +                pm8150b_typec_sbu_out: endpoint {
>>>>> +                    remote-endpoint = <&redriver_usb_con_sbu>;
>>>>>                   };
>>>>>               };
>>>>>           };
>>>
> 
> 
> 
