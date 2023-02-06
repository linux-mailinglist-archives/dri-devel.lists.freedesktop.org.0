Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 347FC68BB45
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 12:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1579610E37A;
	Mon,  6 Feb 2023 11:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB44110E372
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 11:21:59 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id l12so2367484edb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 03:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZK68PbjBgg4M4gPDk5TqCOuYlcFHTmMeQziL+2MsNis=;
 b=h2975W79UPeeiMEZ9AHtojxXjXqOEhIDNnOz1yRgLa3z3fTqwO5ib5AUvbn9kl8Xus
 eI8miGLIVwq79HupZGifhB8PqSOJOrF3JDBYP9XNQu6f96B9HxrjXCkpZnSvKxzx3/2M
 ULpkreJdUypaoZ4c537hHg2Mc8bA3z7ON/M2VvT/4XImGF+E34CktBe/FPDQi92zzIzu
 Dv0whz5pE5h+HT/IjJWz9A/ZKv6/8yQWVSpYxMnOpxzV8RqxdMraMlxriEBf42SlCKQ1
 mHjsp0TkTypKa8fR7mjQEXGmXuRe4rni2pR3H3xMhNAKgnTn0n9siJbq78W6jHRBRfEs
 Z26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZK68PbjBgg4M4gPDk5TqCOuYlcFHTmMeQziL+2MsNis=;
 b=T+yCCuahT4QOMLJ1xkqVN+0uRtF441mWWEaEj43xghIqWh7fBWfWzQhO2nh4KQvd6Q
 9lymIOadEt+snT6X16Dba5Bsc6HlutsRkt7omcht1oIwMocgGK+IwqckaYc7l6i4NhvD
 oNvYSaVHE2QxBjd6/EkYCJpD7E/BZIEPxUJwLqMsxXkDoZIyzctn9nEqfRjx9RImYyca
 ynXjoMR6r4FNnCUysRHw1ijYFl3IzBa/ChmDbwKl5GwLYKUFfGAJomOQJWww2DGxQfWt
 LfI5kEtPbAPRJd57I0qcc9SnZUheH4xUosAwcp1KiuJpw72PaQa7S8CRJeTuzVgyb8rL
 ztzA==
X-Gm-Message-State: AO0yUKXMHCg7Yy8DpDLsWqlBLa5MiEF6s1ImW/jbB72rWJsYZTLu73C6
 tlJzBrloXboszz4wiydTu3jvVg==
X-Google-Smtp-Source: AK7set9MAC+HCPhW7u6DHBaY5VdUEuLOfkagFMD0u5hl4QeVmrZYor/UME665PgvQT+hcODcQdZlcA==
X-Received: by 2002:a50:fe86:0:b0:4a0:e415:d39f with SMTP id
 d6-20020a50fe86000000b004a0e415d39fmr17308791edt.41.1675682518249; 
 Mon, 06 Feb 2023 03:21:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h23-20020aa7c957000000b00487fc51c532sm4971343edt.33.2023.02.06.03.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:21:57 -0800 (PST)
Message-ID: <5c2df97d-43a3-ccdb-267e-4dc5485dbeb2@linaro.org>
Date: Mon, 6 Feb 2023 13:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: add
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
 <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
 <a38a7ba4-a336-3ad2-7dcd-4eb2195eb0ef@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a38a7ba4-a336-3ad2-7dcd-4eb2195eb0ef@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 12:44, Konrad Dybcio wrote:
> 
> 
> On 6.02.2023 01:27, Dmitry Baryshkov wrote:
>> Add another power saving state used on SM8350.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   include/dt-bindings/power/qcom-rpmpd.h | 1 +
> Wrong patch once more?

This patch is wrong and was sent by mistake

> 
> Konrad
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>> index 4a30d10e6b7d..1bf8e87ecd7e 100644
>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>> @@ -211,6 +211,7 @@
>>   #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>>   #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
>> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
>>   #define RPMH_REGULATOR_LEVEL_SVS	128
>>   #define RPMH_REGULATOR_LEVEL_SVS_L0	144
>>   #define RPMH_REGULATOR_LEVEL_SVS_L1	192

-- 
With best wishes
Dmitry

