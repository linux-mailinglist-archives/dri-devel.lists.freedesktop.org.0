Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB556FEBB4
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 08:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD7B10E5BB;
	Thu, 11 May 2023 06:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D07D10E5B0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:22:51 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso44147292e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 23:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683786169; x=1686378169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ok/yWtmx8n4MjOgj7oJyyfHNKdZTN8Sz//bwyuJpfb0=;
 b=mYB6/+n03E9FXnsSXhKj2JYJw3UuWlXL8ZsRrsdwcXSZiNfRC6aye0Png7zmLh0Fbv
 s0Z+pr/eSPLY5agYxqFosjFGlGR9ENgftuwfOV+Y8v6bNmRX2IAAb8fFOAQW6ucwK2CO
 3S4m9nO1gDd+5+dHHBGc/1w5KeZuUk5PTETZMTu7IgdaInBiawe1vKY2veaTWvvdo7wu
 FF6pEGE8zWizMt2F3KwIOa27O6f6KQtGcXAjhlA/Ue4nx6uZyCuuhrNjJR0Pj7BlpAFl
 FVgkXRL2ZchbInDGcCu51ZY2C1LKDnBzVL8HfiVMkNK2Yxep9sbiSoNhxfZYUdgwnOV7
 +dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683786169; x=1686378169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ok/yWtmx8n4MjOgj7oJyyfHNKdZTN8Sz//bwyuJpfb0=;
 b=WiQWlIigZ6LAsAzZ85rGVyf6OUeOna6iJuwr7qBWUABkd8h02y31hZky4osTLLPlb9
 7Y6eXiCMOm6w++9pgxT+7swbNaWjsCSxcTLMjL1I9fWOnwYyQdwwrsMfG60VkcqeHJv4
 eLZrIi+Cs1anJK1DLbF4cc58/XVzQ60EJ3g674WafI8dpp3jdImmnfHOma0M1woL6nHw
 S2at7qilAjUeys9asnuESOkBblswBUG+MRsbNYHKmN5iAfA7Ebpr5Zse1UmCqzzpaVa9
 45xGCEClofe7EK8mH01vgXBfZA/Lzv6PetHa5TEsHJ6XgeozQxxMmJ4YDKXSd9QMjcU1
 V3Bg==
X-Gm-Message-State: AC+VfDwVFH+LErFavzimM/IeOV/ZnjncAjeGWZlN+/izAy9VUV2e0w/F
 uC5Xe6INcYY0pBSqQRIUSZoadQ==
X-Google-Smtp-Source: ACHHUZ4bMuVr1+zC+aGqt++aokyLQYIrEZcQA+vdJ23/lEOwOplKoLFq54FpiTL6Zu4vSbQq3pXljA==
X-Received: by 2002:a05:6512:39c7:b0:4e8:5c66:e01e with SMTP id
 k7-20020a05651239c700b004e85c66e01emr2702538lfu.21.1683786169280; 
 Wed, 10 May 2023 23:22:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y10-20020ac2446a000000b004f24cb9ef14sm988860lfl.47.2023.05.10.23.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 23:22:48 -0700 (PDT)
Message-ID: <1b1c29f9-3b11-b06b-3443-7f29acea0896@linaro.org>
Date: Thu, 11 May 2023 09:22:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 2/8] drm/display/dsc: add helper to set semi-const
 parameters
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-2-df48a2c54421@quicinc.com>
 <tl5zijcxx7326jdgr6lyjptvvvyxosoupz3vekvhex3vnviw5t@3vswzg244tme>
 <05021e78-6c1a-b4b1-6312-4dd3f1647074@quicinc.com>
 <7eeac1dd-8cd1-60e7-5dc0-f8f5adc18ffe@linaro.org>
 <mbiijomkmkrwixpbg2rnpv3hb5y7gnsqqv2rkektgh4xvxig6u@iazy42chd7b5>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <mbiijomkmkrwixpbg2rnpv3hb5y7gnsqqv2rkektgh4xvxig6u@iazy42chd7b5>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2023 09:18, Marijn Suijten wrote:
> On 2023-05-11 07:26:28, Dmitry Baryshkov wrote:
>> On 11/05/2023 01:35, Jessica Zhang wrote:
>>>
>>>
>>> On 5/9/2023 11:29 PM, Marijn Suijten wrote:
>>>> On 2023-05-09 15:06:48, Jessica Zhang wrote:
>>>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> Add a helper setting config values which are typically constant across
>>>>> operating modes (table E-4 of the standard) and mux_word_size (which is
>>>>> a const according to 3.5.2).
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>
>>>> Same question about ordering.
>>>
>>> Hi Marijn,
>>>
>>> This patch was authored by Dmitry and originally part of his DRM DSC
>>> helpers series [1], but was removed from that series for mergeability
>>> reasons.
>>>
>>> Looking over the kernel documentation, the last Signed-off-by should be
>>> from the patch submitter [2], so I think my s-o-b tag should be at the
>>> bottom.
> 
> That's true, but I also think the S-o-B at the top should match the
>   From: author.

I'd say, this is usual, but not the required order of tags.

> 
>>> As for the order in the previous patch, I can add a duplicate s-o-b
>>> before Dmitry's so that it reflects the history of the patch.
>>
>> I think this is an overkill. Instead you can drop my SOB from the patch
>> 1. We do not need this level of detail.
>>
>> For this patch the ordering of tags is correct.
> 
> So indeed, that either means duplicating the S-o-B or dropping it
> entirely as we do not care that it was part of that series earlier.
> Dmitry will likely sign this off once again when picking the patches.

Yes.

I'd suggest the following tags:

Patch 1 (Add flatness...):
From: Jessica
SOB: Jessica

Patches 2 (add helper to set) and 3 (use DRM DSC helpers):
From: Dmitry
SOB: Dmitry
SOB: Jessica


> 
> - Marijn

-- 
With best wishes
Dmitry

