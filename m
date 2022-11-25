Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9125F638601
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 10:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCFF10E191;
	Fri, 25 Nov 2022 09:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43E210E0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 09:21:51 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bp15so5925841lfb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 01:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p9awIt23C9B0mgiGT4mepq/ybmPHDMmBXg58fCcUBAk=;
 b=flU6n6WSEyJW5eoXkO3kIYZghKbQwfAnCadDgeowHgDl13k9m3u61q5HfRa7MYCXYW
 ieeqw6ujaHROkuu0Ln6xrScS5SmsZPyNen7qgf3lM6+HNME7cCCiazjYdkwN25uVX17y
 lzLPtFPCOo7PmsjkE8Y3jVYq5IiLBmfCeEDnAy01Cu8yTEkIGnhzktlbqvqHLZWmNxvK
 bnwIugwA3a+AQ1r4RY5Dn/26c/19ClMMsOQjccBXja1GLA6fdcx3++b8nZtNKN9DKPko
 nGWu2yMKA01XKeHvfXrEXP0SvkrM917MYz1moyuXxtEyx8J+QaiO1TUpNDH/71Zd8Bvd
 LxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p9awIt23C9B0mgiGT4mepq/ybmPHDMmBXg58fCcUBAk=;
 b=yYjxd9Svs4/WpR4IGHnWpIHsUb0cXUcQ3MxW0HHdlTMaZxWk2Wd2Kh9YNhWeiMRV09
 UPo/kNkZRXWZ6M2FbDRTvIsLYQunD75ZcJylPRWmD8Dta30aS8bZ/W8egx0xq5UMZUC/
 JuVhF3fecRIXbXDCgMCHNjnvk5jafX+HwE4HxHkiySmxM0qBCtIh4VNekWlwFTCh+znJ
 0h5NMiKr3EeazCKIa0PhLr9XehQoW9rAeRRQVt/I3VjhCp1lktWeK9tsr6h9Jqo1Ugfh
 Fr9XHH6wU1x23c26pu+mjkHY3AN0zze7B440BoULV0XKj9NlAXyMZ9HKjUhyFYNsixP5
 BKAA==
X-Gm-Message-State: ANoB5pnGqjIy2tpLsXGXASX39UoSuoPVWoXaHJgRTycSL5zG0diOO+kl
 R4rStLGY38T6ABfmLsP5wQFnkQ==
X-Google-Smtp-Source: AA0mqf4pnL6+AvAmN0vSQPk/HSIR0Bc4L7qzyYUY8jBGojT9p3SC2+2ZZUdYisaxVtOjKVPBBqzgDQ==
X-Received: by 2002:a05:6512:203a:b0:4b4:9124:8aad with SMTP id
 s26-20020a056512203a00b004b491248aadmr11582973lfs.285.1669368109940; 
 Fri, 25 Nov 2022 01:21:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a301:5de4::1?
 (dzpy175yyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a301:5de4::1])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05651c038d00b0027975b5d3c2sm298559ljp.6.2022.11.25.01.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 01:21:49 -0800 (PST)
Message-ID: <3c9330f2-a75f-47ea-160c-848c583d9306@linaro.org>
Date: Fri, 25 Nov 2022 11:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/msm/mdp5: fix reading hw revision on db410c platform
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221125000213.252115-1-dmitry.baryshkov@linaro.org>
 <dc44d8f1-c782-452b-5928-57538250dade@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <dc44d8f1-c782-452b-5928-57538250dade@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 07:45, Abhinav Kumar wrote:
> On 11/24/2022 4:02 PM, Dmitry Baryshkov wrote:
>> Since the commit commit c6122688f265 ("drm/msm/mdp5: stop overriding
>> drvdata") reading the MDP5 hw revision on db410c will crash the board
>> as the MDSS_GDSC is not enabled. Revert a part of the offending commit
>> (moving rpm enablement) and set priv->kms earlier. This make it possible
>> to use pm_runtime_get_sync() during read_mdp_hw_revision(), which will
>> power up both the MDP5 and MDSS devices.
>>
> 
> This is the exact concern I had even when c6122688f265 was pushed.
> 
> https://patchwork.freedesktop.org/patch/508334/#comment_917689
> 
> Was the response given that time not correct then?

Not fully correct. I did not notice, that non-rpm-enabled mdp5 node 
doesn't force mdss to be in the on state. (Which is strange. Maybe we 
are leaking pm_runtime_enable() for it somewhere.)

> 
> https://patchwork.freedesktop.org/patch/508334/#comment_917713
>> Fixes: c6122688f265 ("drm/msm/mdp5: stop overriding drvdata")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++++++---------
>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c 
>> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> index b46f983f2b46..29ae5c9613f3 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> @@ -519,10 +519,9 @@ static void read_mdp_hw_revision(struct mdp5_kms 
>> *mdp5_kms,
>>       struct device *dev = &mdp5_kms->pdev->dev;
>>       u32 version;
>> -    /* Manually enable the MDP5, as pm runtime isn't usable yet. */
>> -    mdp5_enable(mdp5_kms);
>> +    pm_runtime_get_sync(dev);
>>       version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
>> -    mdp5_disable(mdp5_kms);
>> +    pm_runtime_put_sync(dev);
>>       *major = FIELD(version, MDP5_HW_VERSION_MAJOR);
>>       *minor = FIELD(version, MDP5_HW_VERSION_MINOR);
>> @@ -839,6 +838,12 @@ static int mdp5_init(struct platform_device 
>> *pdev, struct drm_device *dev)
>>        */
>>       clk_set_rate(mdp5_kms->core_clk, 200000000);
>> +    /* set uninit-ed kms */
>> +    priv->kms = &mdp5_kms->base.base;
>> +
>> +    pm_runtime_enable(&pdev->dev);
>> +    mdp5_kms->rpm_enabled = true;
>> +
>>       read_mdp_hw_revision(mdp5_kms, &major, &minor);
>>       mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
>> @@ -887,12 +892,6 @@ static int mdp5_init(struct platform_device 
>> *pdev, struct drm_device *dev)
>>       if (ret)
>>           goto fail;
>> -    /* set uninit-ed kms */
>> -    priv->kms = &mdp5_kms->base.base;
>> -
>> -    pm_runtime_enable(&pdev->dev);
>> -    mdp5_kms->rpm_enabled = true;
>> -
>>       return 0;
>>   fail:
>>       if (mdp5_kms)

-- 
With best wishes
Dmitry

