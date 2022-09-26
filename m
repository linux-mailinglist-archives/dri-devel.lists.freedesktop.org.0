Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730685EAA5D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C604C10E6DA;
	Mon, 26 Sep 2022 15:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A336F10E6DA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 15:21:06 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u18so11382510lfo.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=tWi/dsE8AuXCeQ6nZkBTZY/QK66Lk4dB+IUoBCRY7mk=;
 b=imQCW1Cq4bSSwT+3faEeWCRPaqfIK/sznAR1qnmSFc6/PgtqhnTtFZzMgi9uuDru71
 bd2u4s9093j3nCVqhwlLE/wwT+JEd09mCHvqarsHv9fWXsrdMZUaYCP3bmf6yPzoBsMB
 9BxdxRa17MBvvkEMyPCgKA6qZYnvkaRkXAS5HfrvUmD+3u+9wdviTguR8Jo1vHWKc59T
 +SA514JyXxM6iIjctdW1FfIU8cIpRoMsohvlV+TlU/mMGnbil+fJ5YDfy4U/aF8uhqqt
 bCtRmkvLDX60DzfO5ZJUn+v0glQ1//zY7TMRUSq85efN53wSNKds2gaoi5r49dXb29G1
 FuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tWi/dsE8AuXCeQ6nZkBTZY/QK66Lk4dB+IUoBCRY7mk=;
 b=y0PvN8FJNnA/hNk/abn0bzpW86neKMxC6S6U+04PG8kAiymc8C4iUKznd4Fws1oCc6
 oZAEnOWFKUbD8vv9DER9D5mNdJ/i0K3bp0MAUvb8lhK57b28nAYxdCiscEZoIU9bvi6R
 5MnCp9pJVQDMGuG4jbIrxVmwABmN38jGQTJvn3eBm2NcQm8qGhVOgXHcaonXqKR/cnoM
 UG8iH1c74E2/fhDxt4KvI1j9u3m4LjWIKLWgU+3SxS9syEIyEsbbBR8oyms+OBe8e1lV
 S2xiZUq3rY4yoOG+W5qyRYK4qDvKPbo/Tnox4uDYUEybb2YTxPXhU9NP/gmzxX53wefH
 tVpw==
X-Gm-Message-State: ACrzQf1M/HsjUgp6C2ukDL1MM9UHoiVCagb3O9vakMo488kAt5+g8eFI
 CDms8EOOfWPTyuJV6OckSv4fPA==
X-Google-Smtp-Source: AMsMyM6ZKhHvCfw6VXJTnAEUEBa6RxAvON78hn4d1rZ4Z8sgGMJ8zlmCmYgyKGXCuTn95c6xzWmtAQ==
X-Received: by 2002:a05:6512:1056:b0:498:efaf:5bd1 with SMTP id
 c22-20020a056512105600b00498efaf5bd1mr8760526lfb.64.1664205664900; 
 Mon, 26 Sep 2022 08:21:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 i21-20020a0565123e1500b0048fdb3efa20sm2548731lfv.185.2022.09.26.08.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 08:20:43 -0700 (PDT)
Message-ID: <123472be-564e-9fa4-528e-f7d43cd5b9ad@linaro.org>
Date: Mon, 26 Sep 2022 17:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
 <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
 <20220919211832.6b3buqxrnfp6yjjg@builder.lan>
 <6b242b44-b657-c7a6-63ca-465c7031376f@linaro.org>
 <20220922001429.zqfap3clprvlo6jo@builder.lan>
 <acd9ff20-a07b-05ab-6f4b-34e3e8b1cae8@linaro.org>
 <20220926151302.GA1880039-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220926151302.GA1880039-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/09/2022 17:13, Rob Herring wrote:
> On Thu, Sep 22, 2022 at 05:37:39PM +0200, Krzysztof Kozlowski wrote:
>> On 22/09/2022 02:14, Bjorn Andersson wrote:
>>> On Tue, Sep 20, 2022 at 09:09:13AM +0200, Krzysztof Kozlowski wrote:
>>>> On 19/09/2022 23:18, Bjorn Andersson wrote:
>>>>> On Sat, Sep 17, 2022 at 06:03:27PM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 16/09/2022 21:00, Bjorn Andersson wrote:
>>>>>>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>>>
>>>>>>> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
>>>>>>> Qualcomm SDM845 and SC8280XP platforms.
>>>>>>>
>>>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>>>>>
>>>>>> No need for quicinc SoB (unless you also take ownership).
>>>>>>
>>>>>
>>>>> It's my understanding that both needs to be there. Bjorn @ Linaro
>>>>> authored the patch and the author must certify its origin, but as the
>>>>> submitter I must certify its origin.
>>>>
>>>> It's the same person. There are no two Bjorns (unless there are :) ), so
>>>> you certify with old email. SoB chain is coming from people, not email
>>>> addresses.
>>>>
>>>
>>> IANAL, but I don't think it's the same person. I can't use my old
>>> signature to certify the origin in a contribution today and I can't
>>> claim authorship of something Linaro did.
>>
>> Fine with me.
>>
>>>
>>>> And it is not only my understanding of SoB chain.
>>>> https://lore.kernel.org/all/YuKcBO5JatwRYQJ3@kroah.com/
>>>>
>>>
>>> Again, IANAL, but I think the situation is different given AMD and
>>> Xilinx relationship.
>>
>> Hm, I am not sure how it is different. We might know or we might know
>> the change of ownership. Maybe the change of owner came with copyrights,
>> maybe not (someone else bought them). I don't know, there can be many
>> cases here. I interpret Greg's point there as in SoB statement - the
>> person, not email address, certifies.
> 
> If Bjorn owned the copyright, then yeah, 1 email would be enough. But 
> Linaro owned the copyright so it should be there.

True for taking the authorship of patch, however SoB is not for
copyright holders/ownership but to certify that one has the right to
send it. Since patch was on the list, anyone can take it and send it.
Everyone has such right. If another person is sending, then he needs to
certify the origin with SoB. If Bjornv2 is that other person, he already
certified (although with different email address).

Best regards,
Krzysztof

