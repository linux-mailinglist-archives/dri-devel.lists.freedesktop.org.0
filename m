Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735BB508320
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 10:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CE410F185;
	Wed, 20 Apr 2022 08:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17F010F185
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 08:05:40 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d15so1100284pll.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VJvWJPipJHgyfcIiSRVr/9+92NOFrMY62eI57j6ONHM=;
 b=eElVku/lXRj5TNoEgMrlC4V4RxNI2mlNrAa9/FIK4ITD9l6EbTmL9iexMMBYFrKfVZ
 IslU9ZhkZcElVrTPzIaD71hnmB/or5KvGOZr5EP29vDn3EmwQ16vU8IokKSXEdbksf9R
 UXlW+7wyTDdcaEN0Hzz+WSFnQ28AvijGNL4uiPyBCvvE+irC81iDfs9C1SURc8/QQ/0D
 ilH+LFnIXN9e6gvQpRW3CP2CttkaDspJ3V72h9noxjPYQpJ+MWxnnKg4H6P1hBMaGnrt
 6yZmv08vUquiFonc+o21ceFlbSkelwmv1ICyw/DYRH63tXRcPTUQSp8AHuIKD5DyHNGt
 w0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VJvWJPipJHgyfcIiSRVr/9+92NOFrMY62eI57j6ONHM=;
 b=Cm6dERBQ/P/8KikcP3FWj8B4AZlBx8L/yz3QD1Pv5ygN/VX7P0gOOf0nONftZ338da
 /h7J8wsn35H7N81d7cyeuetOPS8qpOQNq4ZoCPF/1poYciYnwS6HBlVcBUX4Ck+sbg2U
 5NRpiW4+3jIIiVscMr0bWvBaHSuD6dWsbalUfjiQrA9tKNwSlm2QJi6B5NjPq5La4s5N
 trZPBVwX2FUN6HCKlwIOhi0FaTwyh6wm15aWU1bGymocEBgJ2lNudllQIQ6e1sBvymyg
 cOOIcTHcWB3hEOdgm/JQuXYniXe7E0cOfz4/ZzgcCrhsbXjw9nZ9SHvlXdbOrkEi4uat
 hM1g==
X-Gm-Message-State: AOAM532MGXNRL3SvY+S5e0eMDcCVerlDQKU/QSf6WAU33HVbVKtkzeIW
 PIf8HoQ72ZceS9bA12+7Xoc=
X-Google-Smtp-Source: ABdhPJzk0weKl78YNFVL165GqBuD7AaxSEu7AdBAJT4DJwASOnYKRTq/tqmUp4CBXgx/fW/PllS9ew==
X-Received: by 2002:a17:90a:db08:b0:1c9:7cf3:6363 with SMTP id
 g8-20020a17090adb0800b001c97cf36363mr3033125pjv.35.1650441940309; 
 Wed, 20 Apr 2022 01:05:40 -0700 (PDT)
Received: from [192.168.1.100] ([159.226.95.33])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a17090a014100b001d2eb7fe951sm3339335pje.13.2022.04.20.01.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 01:05:40 -0700 (PDT)
Message-ID: <96d27d1f-55e4-578a-75e5-686362c05dcf@gmail.com>
Date: Wed, 20 Apr 2022 16:05:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/vc4: Fix pm_runtime_get_sync() usage
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220419124407.ugzl7hknsytbhrmr@houat>
 <20220420004949.20508-1-linmq006@gmail.com>
 <20220420075108.xm5ujthootlpayy2@houat>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20220420075108.xm5ujthootlpayy2@houat>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/4/20 15:51, Maxime Ripard wrote:
> On Wed, Apr 20, 2022 at 12:49:48AM +0000, Miaoqian Lin wrote:
>> If the device is already in a runtime PM enabled state
>> pm_runtime_get_sync() will return 1, so a test for negative
>> value should be used to check for errors.
>>
>> Also, we need to call pm_runtime_put_noidle() when pm_runtime_get_sync()
>> fails, so use pm_runtime_resume_and_get() instead. this function
>> will handle this.
>>
>> Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>> ---
>> change in v2:
>> - switch to pm_runtime_resume_and_get() to fix refcount leak.
>> ---
>>  drivers/gpu/drm/vc4/vc4_dsi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
>> index 752f921735c6..9d7ffaf6bc70 100644
>> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
>> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
>> @@ -846,8 +846,8 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
>>  	unsigned long phy_clock;
>>  	int ret;
>>  
>> -	ret = pm_runtime_get_sync(dev);
>> -	if (ret) {
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret < 0) {
> pm_runtime_resume_and_get will return 0 on success, so the previous check was correct

previous check is for pm_runtime_get_sync() not for pm_runtime_resume_and_get (),

I switch to pm_runtime_resume_and_get() to fix the refcount leak bug at the same time.

Sure it's ok to use check if(ret) to check the retval, I just follow a more common way

for usage of pm_runtime_resume_and_get() in the codebase—— check ret<0

Since pm_runtime_resume_and_get() return negative error code.

> Maxime
