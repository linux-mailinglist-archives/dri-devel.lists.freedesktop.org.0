Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4C372CEA2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 20:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8082410E1FB;
	Mon, 12 Jun 2023 18:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7708918D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 18:41:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f624daccd1so5311752e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 11:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686595274; x=1689187274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/QUMNftoK3zzaTeLshLJbjaR8+HWscZAYJqyMJcB1so=;
 b=ujHZxnRHYLMz614l58h+lcmX+0b+Ex9iJp5CJqxKe+GiE3M1s5TslY27F/OLmSCJag
 lhmhWeXKrtKXum1UPsnS4SDvFZmfDi5dT17HNrXAQc0fV1iSkzBN4jdV586PAtalD+r1
 sSVzD6ly+M6sjoa80LwoQotpzw3MDu9KeZXWIBVuEbzE+7puwqAJ6QtWj1bizIMlJpb+
 4o1celqoMhiP8FZ++ckfEuwwMSrmewFIgDXg/cIf6L6A+O/de8MQcPdRokoi3jOyanw7
 Hd/JYgYxeKVa8mPbSPDBZBMmT8x0YQT1tMbOW7P+/jHhi2ryfPaq2fk7C5sD1Cqxb3MR
 XD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686595274; x=1689187274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/QUMNftoK3zzaTeLshLJbjaR8+HWscZAYJqyMJcB1so=;
 b=BEwaBkjfKCW16nE/M3xnlE4LVlHNWSQHYRiqHwX2x7H7a/LvqLU+mQqm7OKSxvXq9H
 EN5ngbRWAwEsQAF0Pml69dl5B6HdlepCAGjiZp89On9BI4XdC/o/Xgnui7BWSR1ww39L
 GnlVjUwacQceA2ylxhFcC48r/9Tobg+9/1gQSt5imSiTJr/rkh7ypSJ6SGoRM9PVeVvh
 5+MroD6W2ry6hvIcGNJq7KHszr23J98CB6a0FxGACTtcnnc8Sllc7aBNWxsxfTHL61NA
 LWABGYnoDLKc7WVW5dpSitP4Hs/nIeig83uK+AQ5W1Ft/rt1iJXoCz4BXQbuaGe5K2KD
 Y/eA==
X-Gm-Message-State: AC+VfDzyfhX8calLGrcQ3ZX+22XSMmrpruGGa58NUCmdjux/OoWz/o1O
 sCCgTNeZibQwlkBXhTRoLc6PSw==
X-Google-Smtp-Source: ACHHUZ7tWgzTEFY3Q42kv0aFQRMHPRkCflx+J1vl3G7efBQ0wZQ5REm5K764+9dqKgg9U/7AR5qzoQ==
X-Received: by 2002:ac2:5b4d:0:b0:4f4:b0a5:b583 with SMTP id
 i13-20020ac25b4d000000b004f4b0a5b583mr4872769lfp.44.1686595274514; 
 Mon, 12 Jun 2023 11:41:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k12-20020ac2456c000000b004f37c22b410sm1509056lfm.67.2023.06.12.11.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 11:41:14 -0700 (PDT)
Message-ID: <250b3eb3-90ea-b5ea-ff58-47b924d88b74@linaro.org>
Date: Mon, 12 Jun 2023 21:41:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <53a2cbc6-321d-704c-d6cc-f2fcc249f321@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <53a2cbc6-321d-704c-d6cc-f2fcc249f321@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Degdag Mohamed <degdagmohamed@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/06/2023 11:21, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.06.23 um 05:16 schrieb Dmitry Baryshkov:
>> Since commit 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
>> overhead") the drm_fb_helper_funcs::fb_dirty helper is required for
>> proper dirty/damage processing. The drm/msm driver requires that to
>> function to let CMD panels to work. Use simplified version of
>> drm_fbdev_generic_helper_fb_dirty() to fix support for CMD mode panels.
>>
>> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
>> Fixes: 93e81e38e197 ("drm/fb_helper: Minimize damage-helper overhead")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> To make mmap work correctly, you'll also need deferred I/O in the fbdev 
> code. AFAICT the driver never supported that.

We do not use the deferred I/O. The damage/dirty tracking is used to 
check whether we should ping the CMD panel or not. See [1]

[1] https://lore.kernel.org/all/20220223191118.881321-1-robdclark@gmail.com/

> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c 
>> b/drivers/gpu/drm/msm/msm_fbdev.c
>> index fa9c1cbffae3..b933a85420f6 100644
>> --- a/drivers/gpu/drm/msm/msm_fbdev.c
>> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
>> @@ -139,8 +139,28 @@ static int msm_fbdev_create(struct drm_fb_helper 
>> *helper,
>>       return ret;
>>   }
>> +static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
>> +                  struct drm_clip_rect *clip)
>> +{
>> +    struct drm_device *dev = helper->dev;
>> +    int ret;
>> +
>> +    /* Call damage handlers only if necessary */
>> +    if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
>> +        return 0;
>> +
>> +    if (helper->fb->funcs->dirty) {
>> +        ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
>> +        if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", 
>> ret))
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>>       .fb_probe = msm_fbdev_create,
>> +    .fb_dirty = msm_fbdev_fb_dirty,
>>   };
>>   /*
> 

-- 
With best wishes
Dmitry

