Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A649D70CDC7
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AE810E3BF;
	Mon, 22 May 2023 22:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161D610E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 22:22:59 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso7309100e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684794178; x=1687386178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qJSRzVQri63512zNj0i13qdp4vOsM52UNAxzsHm7fSM=;
 b=dV1cA/FSpBZMzQbz3HzmD1WbNWtkWKi9IaHOyNK7w2lqr8Z+vqGJtb6F4R4R36Qt8p
 3EZQDQjZGtyv/2Y+rHauGI3mjBZsRlbdrShLBfmmDyKli4KJT2t2wwCqN0GpBLKDOFiZ
 ZvTzDCNnIPrcWBGAoOAMee6Wn+b4xjiNd+s02RKA0Iz6lksrhbiDNP76IalSB6NZojYe
 l/+gSA+IBogxGoVHTiUt8WDldZ/HQ2xEsx99f1mfmOrxBKtosE52AIOXepZxHaPgnmmP
 JlIvSvBtAJX5TNu69dDGogTOWX0hhpD690GoILH+zolC1ieHaTMjE7eycZN+yBVe9eRU
 YnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684794178; x=1687386178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qJSRzVQri63512zNj0i13qdp4vOsM52UNAxzsHm7fSM=;
 b=T4/hHVToeRCamL4dxXwTTpkne/5+79eE+ROA9tX+hYsUh8bGjWhL1dTX7MoN6rm3Tx
 cRjPSdFVUeAzmb00+PakWhTKHcHN9Xxsmx9RaMbA/0/B/lxeSs+cp/3oGrRbbCAWISES
 KU6BLllfGTAlbJslHp0wgepmPiU+Og7fOcKuhh6xSKhNss71UiIc4s4yMWCcCcAd/SOy
 hAVYeb26V+YOESNsCRD5g9Bguit4kI2mThyRpnXyo7r/t62Cqvcxa99DTYWuy1pfGy2A
 Pdr1EA9AmnFBkejuIzmE9HlXZzrCRkwm1jR9O+el0ZB9iYSQHc0sTFNjeiuR/K2uQjt4
 WO+g==
X-Gm-Message-State: AC+VfDzrQPOMmgyBpDWp+/RHiYInJ76fnoV5LkerQls2VAyPxVJ7vhMq
 VIxODajFYpibPCRS153LN61f7g==
X-Google-Smtp-Source: ACHHUZ7A0qFcQpm73ab9A5tSwcE+/ROdROgeCckH/XTp/VBb7N196FM9OXNv84bY1bb3cPOx0n6S9g==
X-Received: by 2002:a2e:7a10:0:b0:2af:21d3:a4ca with SMTP id
 v16-20020a2e7a10000000b002af21d3a4camr4029540ljc.47.1684794178146; 
 Mon, 22 May 2023 15:22:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e3612000000b002a8c32fd2f3sm1325856lja.89.2023.05.22.15.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 15:22:57 -0700 (PDT)
Message-ID: <d23c077b-99de-e8c8-d97f-1c1bcca85ef2@linaro.org>
Date: Tue, 23 May 2023 01:22:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/5] msm/drm/dsi: Round up DSC hdisplay calculation
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-1-15daf84f8dcb@quicinc.com>
 <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
 <a93c3c36-f262-b89d-8452-98120cffb491@quicinc.com>
 <CAA8EJpqzj-_fVLXfCrLeTUcwPHE-fb-kNP=SgbVM7U5fQT8p-w@mail.gmail.com>
 <dfezntyt7rfoqmmhpqwqzgbldzgki5ykeqizgig7t3gqwdzo6h@3xavmyqzxzjm>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <dfezntyt7rfoqmmhpqwqzgbldzgki5ykeqizgig7t3gqwdzo6h@3xavmyqzxzjm>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/05/2023 01:18, Marijn Suijten wrote:
> On 2023-05-23 01:14:40, Dmitry Baryshkov wrote:
>> On Tue, 23 May 2023 at 00:45, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 5/22/2023 1:44 PM, Marijn Suijten wrote:
>>>> On 2023-05-22 13:30:20, Jessica Zhang wrote:
>>>>> Currently, when compression is enabled, hdisplay is reduced via integer
>>>>> division. This causes issues for modes where the original hdisplay is
>>>>> not a multiple of 3.
>>>>>
>>>>> To fix this, use DIV_ROUND_UP to divide hdisplay.
>>>>>
>>>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>
>>>> Nit: probably these should go in the opposite order.  And if they're
>>>> all supposed to be chronological, I think it is:
>>>>
>>>>       Suggested-by:
>>>>       Fixes:
>>>>       Signed-off-by:
>>>>       Reviewed-by:
>>>>
>>>> But unsure if that's a hard requirement, or even correct at all.
>>>
>>> Hi Marijn,
>>>
>>> I don't see any explicit documentation on the order of R-b tags. FWIW, I
>>> see in the git log that S-o-b always goes at the bottom of the commit
>>> message.
>>>
>>> I would prefer the S-o-b to always be at the bottom (as it helps me
>>> avoid duplicate S-o-b's when doing `git commit -s`), though I can flip
>>> the order of the R-b and suggested-by tags.
>>
>> I'd second Jessica here. Consider these tags as a history or a transcript:
>>
>> I would not vote on the particular order of the Suggested-by/Fixes
>> tags, I don't think that is important. These come first. Then the
>> patch goes through different cycles. of reviews, which gain
>> Reviewed-by tags.
>>
>> In the same way Link/Patchwork/whatever other tags are added in the
>> historical order.
>>
>> By having the submitter's S-o-b at the bottom, the submitter adds the
>> final signature under everything else being stated/recorded.
> 
> Correct, so the s-o-b can always be kept / moved back to the bottom on a
> resend, stating that they sign off on "all that was written previously"
> including picking up reviews.
> 
> However, for the rest of your reply about "history / transcript", you
> seem to agree exactly with my point of keeping (or rather, simply
> appending) these in chronological order?

Yes.

> 
> - Marijn
> 
>>
>> Of course, in a more complicated story, there might be other
>> developers taking part (Co-Developed-By + Signed-off-by), etc.
>>
>> Note: all described is just my perception and might differ from the
>> BCP regarding the tags.
> 
> <snip>

-- 
With best wishes
Dmitry

