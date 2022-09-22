Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0335E6748
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747B710EC2A;
	Thu, 22 Sep 2022 15:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4214310EC29
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 15:37:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z25so15359126lfr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zdGItr5ICc4vlhS3KGwufw/Y8w2UR5ZVlts6EctynGI=;
 b=cYwW6ohqGr+JtPJ/CQ4fzXi+ot92VVnYo0FHuXQI76jbm8+6lgnVm/+IBi5NLIuAJp
 kxZ2IXhyaFXUtcVSx6vOBG5nCGulreB7JY3l7+kgMlntGfGGUYdxNf4zhJGDvLfzBNZj
 yffbR7QxgOGesk1up0TsxpFaSg3SIHIQsGmWH+obHSl6VIRewS62cXjxHRfTYSWhTT4I
 c14V4UraiU52gm+7TgaCeOQU0hsbgoWEfgHezZ/Ug6+jjqd4WNg/HZoY1Cuc1HX1s6tB
 95/xM/6e58bs5qpZu/Eg8t3clreVhFcU9ISgFZVBQNhwZ7Ejl6uMNpLQPjEyZ7ENEv0p
 bljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zdGItr5ICc4vlhS3KGwufw/Y8w2UR5ZVlts6EctynGI=;
 b=IcC+noGBqZ7f/++2J1NfIHkU9onkJknv//gG4x+TNbEV6NOF2k1Wcczj6gT39h+ROV
 OO19bh32yVVR1DZZDPFWtMul6+jwW1PKZlNqx2VfvnNotpTWsfSGgWE7KQ8I5a+3SyTf
 v/jPbYBWKnrBWLKbbKOPVhVBz1DpIYnAEpE6IeFhS5FjLW2OTBW1E/QB1Va3GSx5OH/w
 DRFzqyVV/KhUsrVNA6QPwGjqM2n6YJDZWWW3bc7oURMJ1gfph8stAvL0YtkG7mu647G4
 VINRAapA91HTHYseFawShaFhmxI0cpD33bTUOAHeSE4Al1ylQJqSZKpq9toh56dIGRyq
 IXmA==
X-Gm-Message-State: ACrzQf0I99qSTp12exoKnxGShEauSqCAyorbUV+cqpFcWTmPtGvKdgtV
 bGk1ZA5avWuH4KdUWrJKyMC7vw==
X-Google-Smtp-Source: AMsMyM7h9wDWsyUiqMcRTiNhG8QJKDH4ATtOFz8lkYELII3NUCIdQoLWizMQQQXkal5Hd6Zg8Y51zg==
X-Received: by 2002:a05:6512:2251:b0:496:c3b9:c18d with SMTP id
 i17-20020a056512225100b00496c3b9c18dmr1389520lfu.403.1663861061448; 
 Thu, 22 Sep 2022 08:37:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056512118400b0049f907b9ba9sm982317lfr.226.2022.09.22.08.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:37:40 -0700 (PDT)
Message-ID: <acd9ff20-a07b-05ab-6f4b-34e3e8b1cae8@linaro.org>
Date: Thu, 22 Sep 2022 17:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
 <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
 <20220919211832.6b3buqxrnfp6yjjg@builder.lan>
 <6b242b44-b657-c7a6-63ca-465c7031376f@linaro.org>
 <20220922001429.zqfap3clprvlo6jo@builder.lan>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922001429.zqfap3clprvlo6jo@builder.lan>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 02:14, Bjorn Andersson wrote:
> On Tue, Sep 20, 2022 at 09:09:13AM +0200, Krzysztof Kozlowski wrote:
>> On 19/09/2022 23:18, Bjorn Andersson wrote:
>>> On Sat, Sep 17, 2022 at 06:03:27PM +0100, Krzysztof Kozlowski wrote:
>>>> On 16/09/2022 21:00, Bjorn Andersson wrote:
>>>>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>>
>>>>> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
>>>>> Qualcomm SDM845 and SC8280XP platforms.
>>>>>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>>>
>>>> No need for quicinc SoB (unless you also take ownership).
>>>>
>>>
>>> It's my understanding that both needs to be there. Bjorn @ Linaro
>>> authored the patch and the author must certify its origin, but as the
>>> submitter I must certify its origin.
>>
>> It's the same person. There are no two Bjorns (unless there are :) ), so
>> you certify with old email. SoB chain is coming from people, not email
>> addresses.
>>
> 
> IANAL, but I don't think it's the same person. I can't use my old
> signature to certify the origin in a contribution today and I can't
> claim authorship of something Linaro did.

Fine with me.

> 
>> And it is not only my understanding of SoB chain.
>> https://lore.kernel.org/all/YuKcBO5JatwRYQJ3@kroah.com/
>>
> 
> Again, IANAL, but I think the situation is different given AMD and
> Xilinx relationship.

Hm, I am not sure how it is different. We might know or we might know
the change of ownership. Maybe the change of owner came with copyrights,
maybe not (someone else bought them). I don't know, there can be many
cases here. I interpret Greg's point there as in SoB statement - the
person, not email address, certifies.

Anyway, this is not a blocker for the patch.


Best regards,
Krzysztof

