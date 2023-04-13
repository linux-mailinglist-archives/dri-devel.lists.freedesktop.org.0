Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D261E6E100B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 16:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ADC10E166;
	Thu, 13 Apr 2023 14:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E59F10E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 14:33:54 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id n22so13939572ljq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 07:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681396431; x=1683988431;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MIGr3zwKLJfiClqBfhFNh96qonhpae26LL1XEE5OS98=;
 b=PMVRFF86G+YuwmLvjghY/qYIgWzyHV6a9NNq/k/JRiQfyGGzk/HVd+R7jTV4ZUffrA
 GbJ2Hd6Qrs1dkYbBKmMFe2hM8pGqqVBhgqpeL3vjRZCOCJ+Loz43TV8DyK764ue+5U9s
 IiBqgKjYasD19yxh5FDWqMZm/f/4icasn/5bSJG6GVvq9JSgDm98oKucja+NhWV8GcJO
 bZiRAQOD4bbipMqpPrK0iX5fvi5WOIhcZQ1maE9fN1QYSm3Uv/O91YN3xULvmQ6qiabK
 znYIjIkfYGMvmGoJt1rr3NsFvQqzUkTGy+ossJE2XeacvAkkkM6E9dMKEGR6P34oj03k
 KhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681396431; x=1683988431;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MIGr3zwKLJfiClqBfhFNh96qonhpae26LL1XEE5OS98=;
 b=jLsPES5yVFeqw2ckyVMCJe86j9t4x1Iw4p8HvL/IJe4d5YBDS1ULL0kR45lYPHyDAo
 A+YdL5EO80KmOJsgdb5X0y+ja7wXOf1sqgHcuAWJ9xQLPqGUPoWUQhUO0N1NpN0Gwd2f
 7NXionvuqZGjmE6/nV4jwouk36s8Dl7v24QHPDNoRjQjMPPhtyIMd7wVWaZ93gw4tHvX
 Ak/+1hSxDUyaDhg+Xoy3GYjKSJ8zq2BKcU0Hur4GR9AOHFPRKROsRcKzQIfkZkCDyk6/
 7gFQh+GfsqCvRZhS6qRple/GD3VZtwDS2dv4OgDVyGplVsP+P6Dbz18XU4zQaypqTlqh
 tuLQ==
X-Gm-Message-State: AAQBX9eGILhJNGVxDeW//n4QSGlnR/6hPfb5IIaKYc5FEq3OO+UD8trt
 x+Mz05TvhlxjYWiO1NItr9T2eQ==
X-Google-Smtp-Source: AKy350b5IRJaASLvMbfGgxTnCODuNcMTGGMJJIo3v3k33oKxx4dZJjsX4Kz8PlQBFCUsSFl+gAPXMw==
X-Received: by 2002:a2e:a407:0:b0:29f:6fd7:697c with SMTP id
 p7-20020a2ea407000000b0029f6fd7697cmr1098873ljn.28.1681396431375; 
 Thu, 13 Apr 2023 07:33:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a2e9d14000000b002a2e931fc48sm295735lji.140.2023.04.13.07.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 07:33:50 -0700 (PDT)
Message-ID: <26a42d52-5ee7-795b-62e8-c53a1e1daf82@linaro.org>
Date: Thu, 13 Apr 2023 17:33:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/7] Enable YCbCr420 format for VDSC
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230222053153.3658345-1-suraj.kandpal@intel.com>
 <87ttyvbhuz.fsf@intel.com>
 <SN7PR11MB6750FDE3318A85E0A2541831E3889@SN7PR11MB6750.namprd11.prod.outlook.com>
 <e4fbeb9d-25f6-fe19-99ee-fa4f8a689535@linaro.org>
 <SN7PR11MB6750280505C5150C647BBCD0E3969@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <SN7PR11MB6750280505C5150C647BBCD0E3969@SN7PR11MB6750.namprd11.prod.outlook.com>
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
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj,

On 07/04/2023 06:11, Kandpal, Suraj wrote:
> Hi Dmitry
> 
> 
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Friday, April 7, 2023 8:28 AM
>> To: Kandpal, Suraj <suraj.kandpal@intel.com>; Jani Nikula
>> <jani.nikula@linux.intel.com>; dri-devel@lists.freedesktop.org; intel-
>> gfx@lists.freedesktop.org
>> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Shankar, Uma
>> <uma.shankar@intel.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>
>> Subject: Re: [PATCH 0/7] Enable YCbCr420 format for VDSC
>>
>> Hi Suraj
>>
>> On 28/03/2023 16:20, Kandpal, Suraj wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
>>>> Of Jani Nikula
>>>> Sent: Wednesday, March 8, 2023 5:00 PM
>>>> To: Kandpal, Suraj <suraj.kandpal@intel.com>; dri-
>>>> devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>; Nautiyal, Ankit K
>>>> <ankit.k.nautiyal@intel.com>; Shankar, Uma <uma.shankar@intel.com>;
>>>> Kandpal, Suraj <suraj.kandpal@intel.com>
>>>> Subject: Re: [PATCH 0/7] Enable YCbCr420 format for VDSC
>>>>
>>>> On Wed, 22 Feb 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>>>>> This patch series aims to enable the YCbCr420 format for DSC.
>>>>> Changes are mostly compute params related for hdmi,dp and dsi along
>>>>> with the addition of new rc_tables for native_420 and corresponding
>>>>> changes to macros used to fetch them.
>>>>> There have been discussions prior to this series in which some
>>>>> patches have gotten rb and can be found in the below link
>>>>> https://patchwork.freedesktop.org/series/113729
>>>>
>>>> I think it would be useful to get [1] from Dmitry merged to
>>>> drm-misc-next first, have that in drm-next, and again backmerged to
>>>> drm-intel-next before this. At least patches 1-5.
>>>>
>>>> There's not much point in all drivers duplicating the parameters, and
>>>> we need to move towards common code. Dmitry has been helpful in
>>>> contributing this to us.
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>
>>>
>>> Hi Jani,
>>> Maarten has acked the patch series to be merged through drm-intel and
>>> in the meantime I will work with Dmitry to pull the common code to
>>> avoid duplication
>>
>> I wanted to check, are there any updates from your side regarding the series
>> at [1] ?
>>
> 
> Will have a look and float comments if any by  Monday

Please excuse me for being slightly stubborn here. We are slowly getting 
other patches piled up with dependency on this series. It is fine that 
it doesn't get into 6.4 (which it probably definitely missed by now), 
but we would like to know if we have to redo/update anything or if it is 
fine as is and it is going to be merged by i915 in 6.5 cycle.

Thank you for the understanding.

> 
>>>
>>> Regards,
>>> Suraj Kandpal
>>>
>>>> [1] https://patchwork.freedesktop.org/series/114473/
>>
>>
>>
>> --
>> With best wishes
>> Dmitry
> 
> Regards,
> Suraj Kandpal

-- 
With best wishes
Dmitry

