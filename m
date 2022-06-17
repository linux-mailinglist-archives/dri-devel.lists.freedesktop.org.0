Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F8454FE4F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCF010E2E3;
	Fri, 17 Jun 2022 20:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE2B10E110
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:29:50 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i29so8530043lfp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W20snk6cSE70N48P0RMhJnXFzqgLSe22yxQ6mQfYe0c=;
 b=DX0iJQCBN7BFYUuCZ5S6I0VMPrwnQVjem4QEuF8tknynjGu5bC/qHybU7IbLnurCxp
 dvd7bEHZhZZGgB2ESsqdzEVeWNZA/Wjzvof3WuKAzqkqaVwT6HICbdPR6AZaG49TGVTQ
 vyK0jPvychmEQkv2NzeQQsgsw+DRM9H/uBPUrf/yTjaWIghnyYplfQkh/6GnFXaN1cvN
 LorTmqFVwNpyRXQYmhEZYUIsxZfv8iDDqZNtjhsLpdqeuzXfYkEqgckoMG6BHHsqoiM+
 tDgplbtRyd3XkuzhqmDjVhUj/aaErSwKx7ufPI7osS6dQdVtkMGkcboWSKd+Sc+qvrjb
 jwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W20snk6cSE70N48P0RMhJnXFzqgLSe22yxQ6mQfYe0c=;
 b=NWtU7MmyIgOKHsaLqwYon5uzdDytf0OWi8Ja/BWLf2rsvOsk2M90wR1VxOulAMiO/l
 LlYbzqC/uYnx480go5IruOt8pvHSP8uOztuLWFCi3kSIPTSqnbHTHyd04YhHlS1N87Dx
 zQJS4+z3l16LEgiUoR6IkkpQYZk/ebHOIvrKNOEwU8N+oClNOtDkVGFh+ofqwursBVeb
 4+qKJkNSSunU9YUhn+CWGCcY5EdccLqq3eFHimg4aUmO9dkwGzMZVo+5xnUpl6WL3R7l
 UF+n7qJXprQafiBUhTyzy02YC+iTPtBpC7E5FRHrt9FZxXzYOnQ5IP4+ya8qQEUMwqwk
 FgxQ==
X-Gm-Message-State: AJIora8hzyximZFYh4Y+AQm/BgvYzp+xH7NRQYLyY5e9xe30tWBhQyyV
 jgBc4OMvX0Qa1Y5gdujmebcTDg==
X-Google-Smtp-Source: AGRyM1ua5Z8fyTHi1ZXhgSTwnaNoFg5anxheS6A36/vI+0AGDM0Xh1yxQkxdC2GCE584TGcXIFWYvg==
X-Received: by 2002:a19:4f1e:0:b0:479:278:8d24 with SMTP id
 d30-20020a194f1e000000b0047902788d24mr6480406lfb.370.1655497788691; 
 Fri, 17 Jun 2022 13:29:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a19f24e000000b00478f3bb79d6sm752104lfk.194.2022.06.17.13.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 13:29:48 -0700 (PDT)
Message-ID: <5a86e9bf-2447-8175-4d9a-2d644c939841@linaro.org>
Date: Fri, 17 Jun 2022 23:29:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] drm/msm/dp: remove dp_display_en/disable prototypes
 and data argument
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
 <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
 <CAE-0n51vDC-a=87hbM_rvxhNNV7KNpCHy3=wH0N5VCEvdrjyuw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51vDC-a=87hbM_rvxhNNV7KNpCHy3=wH0N5VCEvdrjyuw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/06/2022 23:15, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-06-17 12:49:21)
>> Remove unused dp_display_en/disable prototypes. While we are at it,
>> remove extra 'data' argument that is unused.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
>>   1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 1e34ac2126f6..42ceb4c5796c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -607,9 +607,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>>          return 0;
>>   };
>>
>> -static int dp_display_enable(struct dp_display_private *dp, u32 data);
>> -static int dp_display_disable(struct dp_display_private *dp, u32 data);
>> -
> 
> This part looks good.
> 
>>   static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>>                  bool plugged)
>>   {
>> @@ -856,7 +853,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>>          return 0;
>>   }
>>
>> -static int dp_display_enable(struct dp_display_private *dp, u32 data)
>> +static int dp_display_enable(struct dp_display_private *dp)
> 
> This will conflict with Kuogee's patch[1]

Ack, missed that. I'll rebase it on top of Kuogee's patch and send v2.

> 
>>   {
>>          int rc = 0;
>>          struct msm_dp *dp_display = &dp->dp_display;
> 
> [1] https://lore.kernel.org/r/1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com


-- 
With best wishes
Dmitry
