Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B4E507BB1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 23:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF08010E21B;
	Tue, 19 Apr 2022 21:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1550E10E063
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 21:08:37 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bq30so31601849lfb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WJAJjDTuqRMsp4ILN/gTytLXZvo3JzEkwnROtzWKBNM=;
 b=eQZMw9MRRcUBzvoQxFWDyu7psoVfC0ZgeiWMOgdL12nXufJzu5nKXZCojPu9wQ9WW/
 SyQaax9Yu2OByWGaNg1gicLm+qqd8EMaHNa+q0ZuNLfYKWf9PXnqWsTShHOmbvFGtwGs
 D6LriPe1ILJxVGXuXOEQleeJ42N6D1oIaDNnvFxhCukmUocwjTd0E3TabUxrEEsFtcXX
 CjiT8rmPWg72uglpJD6pORcwBPaATdzzMrHzavdHyFB8owhXIZvdMr/5INoHJrAnqKN/
 jvaeGHG0gNZ1hhWwA7upLNhWm8iT/F6YxPPlfert4Yh7b84iHvtJJosAJ+DFXKuvzKqG
 5xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WJAJjDTuqRMsp4ILN/gTytLXZvo3JzEkwnROtzWKBNM=;
 b=1EuMcSpD28340scyT4feUMTs3/UzHd599pbDGZV3tOTYAdVTZqkYTB8nkjRbb5srZY
 1qYjK3lWxxBcVxECPVlhz0B7ifH3tuomZfj26CmHTAOMe2BqsznrdoPt0xI5eVO3lx+3
 kjFf5gdcUCGenfrbL3jtYw6oQbTuJZXjQALL5Pi/5dJ3feAqbksO/rSMn/5tU3QPIbNx
 Y9+v0xqI1McZOTa2GtWTt60YQBGGeoeAkgLT9kJ6OXo3AuD+r5qp5LiI0mjEu1udb2S4
 McOtn2+/UXTqMzQw4AfWBQhWj7M2wEt0N69d8+o0nLbKBwBvfmHFvuHQAPM0tVIQ2L6R
 JSzg==
X-Gm-Message-State: AOAM5328i7+faxB1DD5cZNuJZEgHOx2fxh1HM4IfUznpakRohSU63pic
 l/Wo7/Zmg9wvgZ7T58ZNzUR1Cw==
X-Google-Smtp-Source: ABdhPJwci6T6mtReWYvhLT/4rTUboMPnkjsDY2j2Xk8fkU3s3mKdB1q05cWgDjMTEIQFLGa0Bhthkw==
X-Received: by 2002:a05:6512:1389:b0:471:a7fa:d5d3 with SMTP id
 p9-20020a056512138900b00471a7fad5d3mr3437411lfa.667.1650402515239; 
 Tue, 19 Apr 2022 14:08:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a05651c050700b0024c7ebff04bsm1527757ljp.79.2022.04.19.14.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 14:08:34 -0700 (PDT)
Message-ID: <cc1a68e3-894a-b2eb-f813-9c0c2993936c@linaro.org>
Date: Wed, 20 Apr 2022 00:08:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm: Revert "drm/msm: Stop using iommu_present()"
Content-Language: en-GB
To: Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220419130422.1033699-1-dmitry.baryshkov@linaro.org>
 <6f3e772f-73aa-17b1-8cca-082039a905f1@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6f3e772f-73aa-17b1-8cca-082039a905f1@arm.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2022 00:04, Robin Murphy wrote:
> On 2022-04-19 14:04, Dmitry Baryshkov wrote:
>> This reverts commit e2a88eabb02410267519b838fb9b79f5206769be. The commit
>> in question makes msm_use_mmu() check whether the DRM 'component master'
>> device is translated by the IOMMU. At this moment it is the 'mdss'
>> device.
>> However on platforms using the MDP5 driver (e.g. MSM8916/APQ8016,
>> MSM8996/APQ8096) it's the mdp5 device, which has the iommus property
>> (and thus is "translated by the IOMMU"). This results in these devices
>> being broken with the following lines in the dmesg.
>>
>> [drm] Initialized msm 1.9.0 20130625 for 1a00000.mdss on minor 0
>> msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pm4.fw from 
>> new location
>> msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pfp.fw from 
>> new location
>> msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
>> msm 1a00000.mdss: could not allocate stolen bo
>> msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
>> msm 1a00000.mdss: [drm:msm_alloc_stolen_fb] *ERROR* failed to allocate 
>> buffer object
>> msm 1a00000.mdss: [drm:msm_fbdev_create] *ERROR* failed to allocate fb
>>
>> Getting the mdp5 device pointer from this function is not that easy at
>> this moment. Thus this patch is reverted till the MDSS rework [1] lands.
>> It will make the mdp5/dpu1 device component master and the check will be
>> legit.
>>
>> [1] https://patchwork.freedesktop.org/series/98525/
> 
> Oh, DRM...
> 
> If that series is going to land got 5.19, could you please implement the 
> correct equivalent of this patch within it?

Yes, that's the plan. I'm sending a reworked version of your patch 
shortly (but it still depends on [1]).

> 
> I'm fine with the revert for now if this patch doesn't work properly in 
> all cases, but I have very little sympathy left for DRM drivers riding 
> roughshod over all the standard driver model abstractions because 
> they're "special". iommu_present() *needs* to go away, so if it's left 
> to me to have a second go at fixing this driver next cycle, you're 
> liable to get some abomination based on of_find_compatible_node() or 
> similar, and I'll probably be demanding an ack to take it through the 
> IOMMU tree ;)

No need for such measures :-)

> 
> Thanks,
> Robin.
> 
>> Fixes: e2a88eabb024 ("drm/msm: Stop using iommu_present()")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index b6702b0fafcb..e2b5307b2360 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -263,7 +263,7 @@ bool msm_use_mmu(struct drm_device *dev)
>>       struct msm_drm_private *priv = dev->dev_private;
>>       /* a2xx comes with its own MMU */
>> -    return priv->is_a2xx || device_iommu_mapped(dev->dev);
>> +    return priv->is_a2xx || iommu_present(&platform_bus_type);
>>   }
>>   static int msm_init_vram(struct drm_device *dev)


-- 
With best wishes
Dmitry
