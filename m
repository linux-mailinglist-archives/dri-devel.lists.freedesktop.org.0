Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB9368BB59
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 12:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7C10E386;
	Mon,  6 Feb 2023 11:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FA210E386
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 11:23:30 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id lu11so33236227ejb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 03:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ox3sLMvy5JK6Q/gX+6AJCTV0Sr/EoCPVWT7KFDWPgWg=;
 b=yOMLpd8czAC6J1ZcVEbpS3ijmB5oKfB5VtKT+RLKhLBuhLjXssdx1J0oTKzgkEhqSr
 B8v0EJ5xHwIAkXkTbjedmC1iAsTvP40nEIAkktLfXnOS8EKlr1CRsLwLXYLyTNG7J5+6
 2lAQKLOde2lYL/hJiMoQJ92qjx/qLqr/yBZnuxQXMD6lQ6r3V5qwa5hniuZdw3gBtrJM
 SX6rWUbruFO/cfjyu6IkqqMLRkOMVkafwN2e92b0pJlVkMflVERNHJRSB09V+Th2QSnb
 likk8M4ZYQJhRnDSxr/mfCKOnKYwAm3KkTKE8BJ8zHc4IRdTn5niSY1b4Z3zI7uNeMPu
 ncKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ox3sLMvy5JK6Q/gX+6AJCTV0Sr/EoCPVWT7KFDWPgWg=;
 b=ZtkG9VGTBN6c1qGNCGy+KEN5+98uaifW1xdj7BL52kNsPDGkR0tqfh3WkGsUVLK55k
 3X2Z9quhXCCPBpVR6ZMUrsJuLiX+BsFcs58o+BHL2FEAhQEpkldWjP1EbSxT1jF972qK
 QkyklwmyqqPrBgNTwuff71NMA4ZtctyZpjrXNwqNYjJxoIqcU7homolW0IMnO8lcv5Tm
 sanBqWQ/oFJJpQgWqzkTms2IC6tNSHNrBg9RjquU3+JFHtucSkz/gVe5cnHMs9iSB7Ju
 7FPpkvu9LZyH4CbYbr3rDId2h8bzDODyBlENYG8DD7SDhrnWu9eQ5a8mRnCHm3NZYEbo
 2ZRQ==
X-Gm-Message-State: AO0yUKWo8PLrfBC6pWl8/pQnTcvCBq/1B+efwh7KkjssD5bvQbOjnJK5
 Ixgkl0JPIjhWdIRlt0AVyIRIKA==
X-Google-Smtp-Source: AK7set+Ipi12ujUkGwXBVG19EHyv6UWyXlhzd4uEvFMQxrrgXjQAxrfRMv6ClUrW9ZI8GvM5FU6mLw==
X-Received: by 2002:a17:906:140a:b0:88e:e498:109b with SMTP id
 p10-20020a170906140a00b0088ee498109bmr15880643ejc.5.1675682608885; 
 Mon, 06 Feb 2023 03:23:28 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a170906125500b0089b6fd89429sm2244298eja.10.2023.02.06.03.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:23:28 -0800 (PST)
Message-ID: <20b91f29-b47d-3051-a84a-744b8b44f4e0@linaro.org>
Date: Mon, 6 Feb 2023 12:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8350: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-3-dmitry.baryshkov@linaro.org>
 <f563f3e9-2c50-4509-a44d-9406bc725a95@linaro.org>
 <a5635503-2d03-3996-a60f-f6255e407ca1@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a5635503-2d03-3996-a60f-f6255e407ca1@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 6.02.2023 12:22, Dmitry Baryshkov wrote:
> On 06/02/2023 12:44, Konrad Dybcio wrote:
>>
>>
>> On 6.02.2023 01:27, Dmitry Baryshkov wrote:
>>> Add another power saving state used on SM8350.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   include/dt-bindings/power/qcom-rpmpd.h | 1 +
>> Wrong patch?
> 
> And this patch is correct. sm8350 GPU OPP table uses this value (but as doesn't reference the rpmh's opp states, we don't have to add one there).
Okay, but it's *just* a header entry, so the subject is
misleading and you're not adding the dt part here.

Konrad
> 
>>
>> Konrad
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>>> index 4a30d10e6b7d..1bf8e87ecd7e 100644
>>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>>> @@ -211,6 +211,7 @@
>>>   #define RPMH_REGULATOR_LEVEL_MIN_SVS    48
>>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1    56
>>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS    64
>>> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1    80
>>>   #define RPMH_REGULATOR_LEVEL_SVS    128
>>>   #define RPMH_REGULATOR_LEVEL_SVS_L0    144
>>>   #define RPMH_REGULATOR_LEVEL_SVS_L1    192
> 
