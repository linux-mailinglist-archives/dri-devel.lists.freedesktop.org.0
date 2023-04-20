Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C676E9B2E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 20:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE2310E0A9;
	Thu, 20 Apr 2023 18:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768BC10E0A9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 18:01:07 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2a8bb726210so6828491fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682013665; x=1684605665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z71ifX+3bePpNj6BLLcg5VtBqXd9L7O317uWqrrJ0jY=;
 b=pE+i+7GJa5mGP7pN8Pn/lkXCkEzxDPET5cjPLpsKLHlB5SOlbsMB/KdJ2IzfMqoct1
 3KFZxKRhEhli0IYmucY4Q8zCh/1a/6DGntfRe0LET2s7QWjth1Bg+NpqtMDBXiBXOnUe
 cauvCYkY2ogSQL2IHhC9whcnIKmRbPeONT+b8S5FJQeKeQjd5iOsJh3fiGp9foZR+bF3
 /bGTiMol8JDDNJXT72B3BAWUB+2dy+aq7u7rwLeE8IaZc9W/hZgrUfVPL2/j9saUDW4I
 UDEdX1GkW7RTjlNqhKgklK0LleQ6PaOFO5FN8bL2flD4helzqVcRGVySbsIFdWn8PJ7a
 8HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682013665; x=1684605665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z71ifX+3bePpNj6BLLcg5VtBqXd9L7O317uWqrrJ0jY=;
 b=Cb3pXqbmpvLCz4SxDvTTsPjCUL95v4GiHmr8eBdh32osJsngsftc9zvmipEu8D8yXJ
 mkNdhXjtftKEtzwFIsyU3OZOa3EAHQPdrha/nNx8ycRCAw3ed3fOQt8vVklkOhYt8R0y
 1q3naoIXR8DAlmBWimVofMDLhHyssx2//kwdRqijbhfGOjPykD9cORV1kCWQCVgaZg1o
 6w/JydFkmklY10r0y/nV8kZcTpIlCtmQzq9gmLjmdCzP9/9AuzPvFz/wwdfScebAA3It
 mA0iWjYkXBpitN4A4ZbysFWkUxM4faA+Ty4JSlR5xAQcT0HkF9u/dGFn3/6RA3G3jS2f
 Jgqg==
X-Gm-Message-State: AAQBX9ducMkoDZ2D4ZDq+3Mca2wO51ctlgqGzKffSb4hW07Ea6a5mZzn
 20QnwM6QUuUcG3gCVyKo3SU10A==
X-Google-Smtp-Source: AKy350YhBge2kn5asPvQjIsoowiT2dTTKXXJSITeKrLIxWF5Sj2L/FGZ7oX9ry4+1WWCmJi5XWCL3w==
X-Received: by 2002:a05:6512:145:b0:4ed:c6d5:bdc with SMTP id
 m5-20020a056512014500b004edc6d50bdcmr738154lfo.24.1682013665093; 
 Thu, 20 Apr 2023 11:01:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004b4cbc942a3sm290839lfn.127.2023.04.20.11.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 11:01:04 -0700 (PDT)
Message-ID: <6a335df7-ff0b-098a-feec-45714159df04@linaro.org>
Date: Thu, 20 Apr 2023 21:01:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] DPU1 GC1.8 wiring-up
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
 <c0e0a55a-cc37-fe8a-8d8a-5fe257f99b9a@linaro.org>
 <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
 <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2023 04:36, Konrad Dybcio wrote:
> 
> 
> On 20.04.2023 03:28, Abhinav Kumar wrote:
>>
>>
>> On 4/19/2023 6:26 PM, Konrad Dybcio wrote:
>>>
>>>
>>> On 20.04.2023 03:25, Dmitry Baryshkov wrote:
>>>> On 20/04/2023 04:14, Konrad Dybcio wrote:
>>>>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
>>>>> dspp sub-block in addition to PCCv4. The other block differ a bit
>>>>> more, but none of them are supported upstream.
>>>>>
>>>>> This series adds configures the GCv1.8 on all the relevant SoCs.
>>>>
>>>> Does this mean that we will see gamma_lut support soon?
>>> No promises, my plate is not even full, it's beyond overflowing! :P
>>>
>>> Konrad
>>
>> So I think I wrote about this before during the catalog rework/fixes that the gc registers are not written to / programmed.
>>
>> If thats not done, is there any benefit to this series?
> Completeness and preparation for the code itself, if nothing else?

The usual problem is that if something is not put to use, it quickly 
rots or becomes misused for newer platforms. We have seen this with the 
some of DPU features.

In case of GC (and the freshly defined DPU_DSPP_IGC, but not used) we 
have three options:
- drop the unused GC from msm8998_sblk.
- keep things as is, single unused GC entry
- fill all the sblk with the correct information in hope that it stays 
correct

Each of these options has its own drawbacks. I have slight bias towards 
the last option, to have the information in place (as long as it is 
accurate).

-- 
With best wishes
Dmitry

