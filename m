Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 891ED6E8780
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 03:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2187310EA31;
	Thu, 20 Apr 2023 01:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9622410E9AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 01:36:18 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id j11so1020956ljq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 18:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681954576; x=1684546576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hT/95VjOVyKO2T89/0I5XEoyuSp1YYge4tfF3uB8zg0=;
 b=aQmh+2X+m1r5KN/IFBsO7Dh4brwJDxvSv03WBhSjp5FcgMBhIdC2TZAZofOewtHBaG
 rod4IkuKDY4gR6vWu09pf5B9gV3+HLlo7DVvXnXNInqNdMBhGGqSloP685b2BP2Q1ZP+
 JQDNmMFBzqUlVUx5Mbvn0+3yQDVmI6O6izzuK/RvkGKJNbDFKJ8GQ0OXspdBEVrzQ1Hu
 4ENw5p2v47DmlStJxwWB999K8MIQnzxB79wpsft/VOYKnWsXmbNcSYxd9vjlwznd+LeR
 4d8a7/7jKNcTMfPxN8QrCMZiWhP+qZcVYyu4C/pPmWRhdL4QKePzBcP6AxFY/ki42l6F
 dreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681954576; x=1684546576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hT/95VjOVyKO2T89/0I5XEoyuSp1YYge4tfF3uB8zg0=;
 b=eLU0Ga1q2JufUmaBmVZCbRJFWXvTKWk7uEG2N8RfY0GiA5bsQyntobSiyb7XStnv0s
 dVQKhkg4WY05+gR0zpR+WV6Qup6fhjFKgo5bHKamOrYe8KwcGDPTv6yaNmHCbKoaK2cD
 9rKoWzBhzlDuRe/QH1btjFstG06XRfRaK+DFGlfd7GurDNH+f9GK1AIbI4WjV+13KbE3
 U3LsS7eVVjpJ53P1SA38V/ir6hbpc+iMSHj4GNJh/d49vNuYxdvjmCCzzjZKr3A/fwOg
 11k2e7fBzocKrZklimPoyh7J8Z2F+jsriGFuqiY60DIndwK3jwTAOWs3TzY2OVatk4s1
 nZOg==
X-Gm-Message-State: AAQBX9crmrffVdMI2lYA/xFPuMObEu9nmgHHUuvtNkc1WuG7MOuOxcqb
 Pd2WY0iH8JdeY8p1Mpoup0tefw==
X-Google-Smtp-Source: AKy350YiZKM6D3SyMMYJ7buEtOzY/rVkSbU/XM10s6fY0nV5WmwAeAeJO6Jk0/pLS6YLUe6bZ8ECFw==
X-Received: by 2002:a2e:9b17:0:b0:2a7:81fb:6e6f with SMTP id
 u23-20020a2e9b17000000b002a781fb6e6fmr2552660lji.10.1681954576436; 
 Wed, 19 Apr 2023 18:36:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a2e7c17000000b002a5f554d263sm35310ljc.46.2023.04.19.18.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 18:36:16 -0700 (PDT)
Message-ID: <2dff9d62-cffe-c66f-9e50-3ecd64e44d37@linaro.org>
Date: Thu, 20 Apr 2023 03:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/2] DPU1 GC1.8 wiring-up
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
 <c0e0a55a-cc37-fe8a-8d8a-5fe257f99b9a@linaro.org>
 <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3f3b3637-ed85-09a1-22b7-3ccd4bc929bb@quicinc.com>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20.04.2023 03:28, Abhinav Kumar wrote:
> 
> 
> On 4/19/2023 6:26 PM, Konrad Dybcio wrote:
>>
>>
>> On 20.04.2023 03:25, Dmitry Baryshkov wrote:
>>> On 20/04/2023 04:14, Konrad Dybcio wrote:
>>>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
>>>> dspp sub-block in addition to PCCv4. The other block differ a bit
>>>> more, but none of them are supported upstream.
>>>>
>>>> This series adds configures the GCv1.8 on all the relevant SoCs.
>>>
>>> Does this mean that we will see gamma_lut support soon?
>> No promises, my plate is not even full, it's beyond overflowing! :P
>>
>> Konrad
> 
> So I think I wrote about this before during the catalog rework/fixes that the gc registers are not written to / programmed.
> 
> If thats not done, is there any benefit to this series?
Completeness and preparation for the code itself, if nothing else?

Konrad
> 
>>>
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>> Konrad Dybcio (2):
>>>>         drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
>>>>         drm/msm/dpu1: Enable GCv1.8 on many SoCs
>>>>
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  4 ++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 16 ++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  4 +++-
>>>>    9 files changed, 55 insertions(+), 53 deletions(-)
>>>> ---
>>>> base-commit: 3cdbc01c40e34c57697f8934f2727a88551696be
>>>> change-id: 20230420-topic-dpu_gc-6901f75768db
>>>>
>>>> Best regards,
>>>
