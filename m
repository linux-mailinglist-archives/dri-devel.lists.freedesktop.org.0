Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F32D68BD35
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 13:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A20E10E3B5;
	Mon,  6 Feb 2023 12:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCE310E3B5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 12:47:48 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r3so1794039edq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 04:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5DN2T+FoaYMxmg8TLDTDI4iU0ffTdNlMHvOCFsMyfhA=;
 b=bRWUQ7N/qBN8LD8Ox+U8aeVwyNqwgsMc45xpBMm95v3bysYfdrEUWMA5+W7U+PUPhG
 gIowsIi373/pWio6pbLv3yrLq7pyQAPqy6DxYwhWAbqSPKaZyyQxSO+u5EhJM6I3d1Zt
 b3CToYrBNA9TbiXpbqg1xsMLchER1BqE9PBk0oGL2TBC6jGfpaaWuLkM1rhlOZ2/cmYT
 gU4G4dE5GR1luTZipiv6h1gkqg6RyuLNA3r9duHOqXsbbdvw+UoeLjSaa2K3i6595o4c
 JsRzpkFlQReaGVGl2c74QL+xRE+yzlV2No0FN98CclQoUaJ1BN2bY0v3bfO0RFnO+8oJ
 Quog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5DN2T+FoaYMxmg8TLDTDI4iU0ffTdNlMHvOCFsMyfhA=;
 b=4Js3nSRf7SXGKsaok4Tg30o2/jXg8Y8TRiNwoVqmr1NXRqicHwKtjoB2q/iJLhwNb6
 a+xLDZMuYBjrUuIt1/LqH0iDbU/k0qckXz9hnpN8dg80Yd3gCaRwv/ejyJh7SkGSyMxV
 fIUbRocWGF71zmMnLldC1eZyh2Bu2+zTWPyIChJ7v5rmB6uzJXhJJ1DzRgU3BKCX0W0d
 zHXGBg7+Js61GJJJ+AA9BvFCgdQNDqNU3V138utoBBdS5Ff7rg5DWJ1RGZEflFRPLRGY
 uFP1Zt9qw5wevGbzNnLS/P6YqwxBJDmqNpbMODjNPjonsD5pbGxbkxdBMw6og2t4mgO6
 mZDQ==
X-Gm-Message-State: AO0yUKUnwudE+d6BoC3lDGXQtJVnQkWfdOUI4EaKCeP11g3Siv2nSufv
 AuKLHgcPCZdYnezEampHw/xYbg==
X-Google-Smtp-Source: AK7set91Xx8O+vjtfnvt4DKIlfdRGhoXBCDphUZkeom5ObV5xo0u74vxuyVNATJOjkEiuj38tEYK6w==
X-Received: by 2002:a50:aade:0:b0:4aa:b26f:1a0a with SMTP id
 r30-20020a50aade000000b004aab26f1a0amr4560602edc.27.1675687667457; 
 Mon, 06 Feb 2023 04:47:47 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056402020100b004615f7495e0sm5092328edv.8.2023.02.06.04.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:47:47 -0800 (PST)
Message-ID: <45084181-966a-3d5b-3cc5-3170f2d404b8@linaro.org>
Date: Mon, 6 Feb 2023 14:47:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8350: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Taniya Das <quic_tdas@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
 <f563f3e9-2c50-4509-a44d-9406bc725a95@linaro.org>
 <a5635503-2d03-3996-a60f-f6255e407ca1@linaro.org>
 <20b91f29-b47d-3051-a84a-744b8b44f4e0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20b91f29-b47d-3051-a84a-744b8b44f4e0@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 13:23, Konrad Dybcio wrote:
> 
> 
> On 6.02.2023 12:22, Dmitry Baryshkov wrote:
>> On 06/02/2023 12:44, Konrad Dybcio wrote:
>>>
>>>
>>> On 6.02.2023 01:27, Dmitry Baryshkov wrote:
>>>> Add another power saving state used on SM8350.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    include/dt-bindings/power/qcom-rpmpd.h | 1 +
>>> Wrong patch?
>>
>> And this patch is correct. sm8350 GPU OPP table uses this value (but as doesn't reference the rpmh's opp states, we don't have to add one there).
> Okay, but it's *just* a header entry, so the subject is
> misleading and you're not adding the dt part here.

Ack, I got your point now. Yes, it should be `dt-bindings: add 
RPMH_REGULATOR_LEVEL_LOW_SVS_L1'.

> 
> Konrad
>>
>>>
>>> Konrad
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>>>> index 4a30d10e6b7d..1bf8e87ecd7e 100644
>>>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>>>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>>>> @@ -211,6 +211,7 @@
>>>>    #define RPMH_REGULATOR_LEVEL_MIN_SVS    48
>>>>    #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1    56
>>>>    #define RPMH_REGULATOR_LEVEL_LOW_SVS    64
>>>> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1    80
>>>>    #define RPMH_REGULATOR_LEVEL_SVS    128
>>>>    #define RPMH_REGULATOR_LEVEL_SVS_L0    144
>>>>    #define RPMH_REGULATOR_LEVEL_SVS_L1    192
>>

-- 
With best wishes
Dmitry

