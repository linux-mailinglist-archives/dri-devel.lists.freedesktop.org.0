Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE774FBDA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 01:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA3F10E464;
	Tue, 11 Jul 2023 23:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D004C10E464
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:28:05 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b701e1c80fso97720571fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 16:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689118083; x=1691710083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ApJeJhdGZd6RwVsAe5TjmnkbUP+gLhSHQ/FsHUSWxaw=;
 b=KaUQ7A7jAMHLK4RGjc6kDCS2q173iEkMZFmHeeJo0i92FZBocIzQGBI9TuOh5Jet4X
 2qUPW7bwTAmIznfILpAdnAbtdOChmw/7ngnkTxJBeLChFap9FJmwrJeBgniegDrKpLVk
 PXhQ95MX/AEL8GcZJ+sgbiOSSL9nOogcJ0A23aPYXJ/0cWePP2YPDYAu/QU+wKDHnUla
 RruqZL4d74HSlTd1ApIfuBSQqH4KXdVpAqx8A8bmCQ/3TGjK9S2pCCWbW/1fYmMSTLpM
 iUBemCt9x9XEU/vc5BegSfzc8cn3ituZIt75dmjTi+0p4Mqk6h0asgjhgq7dH10X40rM
 QrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689118083; x=1691710083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApJeJhdGZd6RwVsAe5TjmnkbUP+gLhSHQ/FsHUSWxaw=;
 b=Gytj7wRpyCVY/nXeNmkHfb2m3q0hG/9VJVIUugza0Oc1Ltn1h0SXmP6oO/dK6tbFkA
 f/UzWWfvX4pmIme9r8XpxvPllwFZE2PUyCBY/XM8FHVSHURmaZAkGIjRapNW1su5tYbq
 IiYpX4KYf0mSZs3LXXHMD9k9BbusVtYHey+LkTogjZUzJIPGb3Bgsp5EiOgjAnNLMhPk
 zbRJpetPl3G64QEQyM6D79aE+v0jNzj4leQfcZpyHnqnULpmBzN+2JLmqULWY7NiDbOQ
 ufBSSnRvsiqBHieqHME5MR+tO6tnb+woYRDFxsCP2TvN+iDgGxZztHP9obwsvpzpgBMk
 RxWg==
X-Gm-Message-State: ABy/qLZGGcYyDxlRwo+jiQy1HMzY7B8vfJ7pdB/1NRbEv90ULbuN495i
 jZo6KQDT5oVzUdqY5+kHv7zN9zWCAPtWq9ZX7zI=
X-Google-Smtp-Source: APBJJlGsPfFUNdnVvWX3cbwGDLsNUz1XJcBgCjsdBUlgiaPrVmMkFwA9bFkI/MC0JNM6NIesnDkSfg==
X-Received: by 2002:a2e:a3d2:0:b0:2b6:e7d6:714d with SMTP id
 w18-20020a2ea3d2000000b002b6e7d6714dmr14606619lje.22.1689118083209; 
 Tue, 11 Jul 2023 16:28:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002b6d465583csm656569ljh.126.2023.07.11.16.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 16:28:02 -0700 (PDT)
Message-ID: <96e12ff3-c0ef-00de-49aa-f731b0f68981@linaro.org>
Date: Wed, 12 Jul 2023 02:28:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
 <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
 <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
 <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
 <CAA8EJpqxuziMGqkCZsE18K6z=WyQ44nxo3+-He=SZhH7Gfggkg@mail.gmail.com>
 <2c9d4d18-48c8-12b0-a971-62138b318c5b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2c9d4d18-48c8-12b0-a971-62138b318c5b@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 02:04, Konrad Dybcio wrote:
> On 12.07.2023 01:01, Dmitry Baryshkov wrote:
>> On Wed, 12 Jul 2023 at 01:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>> On 12.07.2023 00:39, Dmitry Baryshkov wrote:
>>>> On 12/07/2023 00:36, Konrad Dybcio wrote:
>>>>> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
>>>>>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>> [...]
>>>>>
>>>>>> +            port@1 {
>>>>>> +                reg = <1>;
>>>>>> +
>>>>>> +                redriver_phy_con_ss: endpoint {
>>>>>> +                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>>>>> +                    data-lanes = <0 1 2 3>;
>>>>> That's USB+DP lines combined, or how does it work? I'm confused :/
>>>>
>>>> 4 generic purpose SS lanes, which can be purposed for USB or for DP.
>>> Okay, so my gut did better than my brain.
>>>
>>> Other than that, I'm reading the bindings and it looks like ports 0 and
>>> 1 may possibly be swapped?
>>
>> Yes. But if I get schematics right, the lanes are not swapped in this case.
> I'm not talking about the 0123-3210 swap, but rather in/out being swapped.
> Unless I'm reading the bindings wrong (or they may be written in a
> confusing way).

Hmm, no. port@0 goes to the connector, port@1 to SS PHY, port@2 to SBU 
source.

> 
> Konrad
>>
>>>
>>> Konrad
>>>>
>>>>>
>>>>> Konrad
>>>>>> +                };
>>>>>> +            };
>>>>>> +
>>>>>> +            port@2 {
>>>>>> +                reg = <2>;
>>>>>> +
>>>>>> +                redriver_usb_con_sbu: endpoint {
>>>>>> +                    remote-endpoint = <&pm8150b_typec_sbu_out>;
>>>>>> +                };
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>>    };
>>>>>>      &mdss {
>>>>>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
>>>>>>    };
>>>>>>      &usb_1_qmpphy_typec_mux_in {
>>>>>> -    remote-endpoint = <&pm8150b_typec_mux_out>;
>>>>>> +    remote-endpoint = <&redriver_phy_con_ss>;
>>>>>>    };
>>>>>>      &usb_2 {
>>>>>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
>>>>>>                port@1 {
>>>>>>                    reg = <1>;
>>>>>>                    pm8150b_typec_mux_out: endpoint {
>>>>>> -                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
>>>>>> +                    remote-endpoint = <&redriver_usb_con_ss>;
>>>>>> +                };
>>>>>> +            };
>>>>>> +
>>>>>> +            port@2 {
>>>>>> +                reg = <2>;
>>>>>> +
>>>>>> +                pm8150b_typec_sbu_out: endpoint {
>>>>>> +                    remote-endpoint = <&redriver_usb_con_sbu>;
>>>>>>                    };
>>>>>>                };
>>>>>>            };
>>>>
>>
>>
>>

-- 
With best wishes
Dmitry

