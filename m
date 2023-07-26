Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA13762E29
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2399710E402;
	Wed, 26 Jul 2023 07:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFE810E431
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:42:28 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fdfefdf5abso3019096e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 00:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690357346; x=1690962146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/08uQeCkaNUO7puYAdqDJO/ANNhApw8h3gYIxItdyCk=;
 b=t+tJXGja9F2voo1BEr3CvgzjGXwhLFlYB1xa9hwWKiR8CDGSbxYcI7gB/9Dd8I+vAP
 Z+3RCa3vvo8TmqCA1hjJ8DF4tPOA/tXEV6trFjtwOuEpD/ca36l7NViAD+6aflpxAad3
 CDzqBNvbRxfm6+oUDsO1xfjUzIzVtUlBzNbJylfoJff1WEVLUtmdzeHIBTGBGeHLVHh/
 ZnjopUNw+1eF1rmmOapoJotkuyhYH80A5OSN6ddb4qiY1tckCYIMNTgOmMiE07ESYros
 CUTPoLAuVy5joHZSWFcFVvEB+ceQ0ibb9gjY+7B1TveIzVxQQVTpBGgc3WclHRcZcM0+
 u9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690357346; x=1690962146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/08uQeCkaNUO7puYAdqDJO/ANNhApw8h3gYIxItdyCk=;
 b=ISqD5wylrYyUYD4DArX6He9ku3EOoPdTjDkJ7e1tyEGpZoYSCqMF3FuYEQYSfinO4W
 IdhHJo3LB85WFcg2w41lhLN3AS4J+ZS1pEg5DMSR8TCwQ7KA9ym7tiHp0y7aap9SPOzK
 lBqeRq982+EZRTjeiGsUqbVMPOk+Nmx8AJVymc6CBd3PrPmBIBFJOqq2RFvUSTyYVrrA
 4J+ynz2SXNMN3JlAC9eU437uK77ZTCvBvavlZqV4rm72HoYWP5YutX3I67UunSEHz54m
 NvAp8uUVWClD9M4xe0f/A0H2Npk0KobxaixAsp+NdyDMs1gJRS8LalsKJWDj7B5eyoGK
 8phQ==
X-Gm-Message-State: ABy/qLYfwSYRFcyr4yCTaTP5GJBuFAapLUpF42vRG3pxpFi6Hyejr0G3
 qkjsYez+AiLoUuIpavlSyKPfCg==
X-Google-Smtp-Source: APBJJlFFwgEVKf8tYFkiMyKAky8tcAr0JMNqJHOLJCBO8NLM/tKq8+3nppgeHiMZkoA2dNj0lM8rnQ==
X-Received: by 2002:ac2:4f0e:0:b0:4f8:5e8b:5ec8 with SMTP id
 k14-20020ac24f0e000000b004f85e8b5ec8mr1034890lfr.9.1690357346098; 
 Wed, 26 Jul 2023 00:42:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a19ae0c000000b004fb737737f9sm3164673lfc.106.2023.07.26.00.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 00:42:25 -0700 (PDT)
Message-ID: <6cdef93d-85af-f12c-0782-da31728809df@linaro.org>
Date: Wed, 26 Jul 2023 10:42:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: display: msm: sm6125-mdss: drop unneeded
 status from examples
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
 <5w2hvzmwzqm4ffopzewveaviebq2ig7awimeo6ipcehx5a43ae@mlwffkf2ctn5>
 <11eca956-9e91-f645-9cc7-4c9f534d9821@linaro.org>
 <5576059f-ba53-1096-396e-ccfb5f9d86f1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5576059f-ba53-1096-396e-ccfb5f9d86f1@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2023 10:31, Krzysztof Kozlowski wrote:
> On 26/07/2023 09:27, Krzysztof Kozlowski wrote:
>> On 25/07/2023 13:46, Marijn Suijten wrote:
>>> On 2023-07-25 12:16:10, Krzysztof Kozlowski wrote:
>>>> Example DTS should not have 'status' property.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>   .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml   | 6 ------
>>>
>>> This is not needed: it has already been corrected in v3 and v4 of the
>>> respective series (among other changes) and the patches were only picked
>>> to a preliminary (draft) pull to get an overview of the outstanding work
>>> for this subsystem.  That branch happens to be included in regular -next
>>> releases though.
>>>
>>> 6.6 drm/msm display pull: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/69
>>> v3: https://lore.kernel.org/linux-arm-msm/20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org/
>>> v4: https://lore.kernel.org/linux-arm-msm/20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org/
>>
>> What do you mean? The old code (one I am fixing) is in current next...
>>
>> If this was fixed, why next gets some outdated branches of drm next?
>> Each maintainers next tree is supposed to be fed into the next, without
>> delays.
>>
> 
> Ah, I think I understood - some work in progress was applied to
> work-in-progress branch of drm/msm and this somehow got pushed to
> linux-next? How anyone is supposed to work on next branches if they are
> outdated or have stuff known to be incomplete?

The drm/msm & bindings parts were considered final, but then I failed to 
send 'applied' series for some reason. And then it was natural for 
Marijn to send an updated revision.

-- 
With best wishes
Dmitry

