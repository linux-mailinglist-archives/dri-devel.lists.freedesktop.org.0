Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CB46C3586
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 16:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FF910E234;
	Tue, 21 Mar 2023 15:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C75110E216
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 15:21:59 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id q14so1526380ljm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 08:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679412117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=56s6rLJdjpBDM1hl6x5LvM4qWyj2EYIhrrSbFYI0uDM=;
 b=zqwm8vcih1yhUl8T9pyw3CAI+LBPWgmIxn/gIBf4VHx6uF0/DWXPVGKv5yDU3R3ovK
 BQm8nTeYnFUOhR6DOdYxo7TULlVccnBzadotgYiQ7UA0dp/kVXokvEU3JCeWWTT7SlAh
 GavUCO8Gx/Jrvblt/zg8q7F+2y4nuJGM8itRxRQ9icjjVq5Oi1KZbPONboGTGbmvO35O
 MwW3NpIa/EsVyM14w+v5PmQTeajuMfJERRHZMV2D1yPSkoKs/Ra3VQtkvVkk1esqmrXE
 c5h1NoA4L7IZtXSqjnkPrfnqbfBA/DdMFFgTBlndo0YRxQhm+ZCK11of7jXpaoDMGSfa
 XG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679412117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=56s6rLJdjpBDM1hl6x5LvM4qWyj2EYIhrrSbFYI0uDM=;
 b=VdSLXnnS5Ghh0xKt1F8SdvChMOP0KOyRG3/LaIiI/aGkd2hS6FzZleyvn4eMLT5lWn
 8xPq1bGr4RvJP4prsZrJb/Ra18LR/TzGFF0J9YDZd/GiyfnN+xZRfjKg0oCkjhgiuY+j
 8oFkTRcku07aX3gG1WFW+4cL0CZgmRLGjZLnduOFYJY8EJUKnO1qkrHMECRR4/W/+G7B
 cRqeqLRvpXhThZMzvXF1+ICer/wM5nRw/ESXQJbWbfTU0ENwfu8vWULrFO9/VTj8BYCU
 AS1RC/em01t4sWpRVCyFdgAM/cswbqoHiyu9ERKtPM0sRGq7NVvgzdXPaQNNXD1Hos5w
 P1/A==
X-Gm-Message-State: AO0yUKWQglcRGsqzkXv9Y36+TTm2tr5K3XFbmWTeznr+he9WQiVXUJ9k
 5jHoow78LNxjvdqJgEfT1cCgmQ==
X-Google-Smtp-Source: AK7set8XMA5X4kDNh9wjuk2eLvIAc4k4TD2f3llxCFuB71vUCBzGOc+i1nk0t8977tyEMaoTolG90g==
X-Received: by 2002:a2e:b008:0:b0:29b:d35c:f0a4 with SMTP id
 y8-20020a2eb008000000b0029bd35cf0a4mr1030021ljk.37.1679412117603; 
 Tue, 21 Mar 2023 08:21:57 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a2e7401000000b0029353caa593sm2291789ljc.5.2023.03.21.08.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 08:21:56 -0700 (PDT)
Message-ID: <6b2f4d0d-ba39-dd2b-e41e-b5accb4df1a2@linaro.org>
Date: Tue, 21 Mar 2023 17:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/10] drm/msm: fix bind error handling
Content-Language: en-GB
To: Johan Hovold <johan@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <ZBmq12uP+TY4EaE3@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ZBmq12uP+TY4EaE3@hovoldconsulting.com>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/03/2023 15:02, Johan Hovold wrote:
> On Mon, Mar 06, 2023 at 11:07:12AM +0100, Johan Hovold wrote:
>> I had reasons to look closer at the MSM DRM driver error handling and
>> realised that it had suffered from a fair amount of bit rot over the
>> years.
>>
>> Unfortunately, I started fixing this in my 6.2 branch and failed to
>> notice two partial and, as it turned out, broken attempts to address
>> this that are now in 6.3-rc1.
>>
>> Instead of trying to salvage this incrementally, I'm reverting the two
>> broken commits so that clean and backportable fixes can be added in
>> their place.
>>
>> Included are also two related cleanups.
> 
> Any further comments to these patches (except for 9/10, which should be
> dropped)?
> 
> As the patches being reverted here were first added in 6.3-rc1 there is
> still time to get this into 6.3-rc (e.g. before AUTOSEL starts trying to
> backport them).

I will take a look at the patches. Additional question, as you have been 
looking into this area. We have plenty of code which is only called 
under the `if (kms)` condition. Could you hopefully move these parts to 
separate functions, so that the error handling is also simpler? If not, 
I'll put this to my todo list, but it might take some time before I have 
time for that.

> 
> Johan
> 
>> Johan Hovold (10):
>>    Revert "drm/msm: Add missing check and destroy for
>>      alloc_ordered_workqueue"
>>    Revert "drm/msm: Fix failure paths in msm_drm_init()"
>>    drm/msm: fix NULL-deref on snapshot tear down
>>    drm/msm: fix NULL-deref on irq uninstall
>>    drm/msm: fix drm device leak on bind errors
>>    drm/msm: fix vram leak on bind errors
>>    drm/msm: fix missing wq allocation error handling
>>    drm/msm: fix workqueue leak on bind errors
>>    drm/msm: use drmm_mode_config_init()
>>    drm/msm: move include directive
>>
>>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.c |  3 -
>>   drivers/gpu/drm/msm/msm_drv.c                | 67 +++++++++++++-------
>>   2 files changed, 44 insertions(+), 26 deletions(-)

-- 
With best wishes
Dmitry

