Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5D2350C46
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 04:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ABC6EC0D;
	Thu,  1 Apr 2021 02:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B756EC0D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 02:07:53 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v15so496248lfq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 19:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tSWB6tAtYfqgy88WCLhQW25yPDif2mP7BXO1UanisQo=;
 b=aj/IQxrYkHRQTun5ka3gkXEnhf0iKxGwKNdh5fd3psjWzkorNJsjLGjaIjQIV3ewKn
 lAj8ZU7BWh3FqA8ewlstETO0j6FJXqH6Ef0yz1IzUkJVYwXKMIH2qaezEu/wwu5jt8Dc
 7WCYBjww8qtktcxpv3qpUQnu8CJaxFtRYb+gzmCdE8bnIR9O7huEgjW8X8Xo54jjkSV4
 MAFF/zKAp9Yhip+pibGzR99CMSMmfjWGQjhOx4RxEELmCQqHDIuG5zt2w/NNtCVBZESB
 atZ8qJyNtexpQof8QmeGS4dacDS4uRo+S/x8l7Ymmp/hR1e9/Yt5omL3MXhgP7f9T5rK
 NeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tSWB6tAtYfqgy88WCLhQW25yPDif2mP7BXO1UanisQo=;
 b=uAAGtoosfDZ5wEDm+eYc7btTpqiLnybvYkgVs9cQmpSM3+2Rmy87CYZP/UynUXuiec
 OviPIZH3nHaGfe7elaIfQKHhxDmPsRevABm7MqDdp0fJauWMTfy7kKe3Boc6B9lGTpNd
 rsxUQyKnD/Kyj04CalJUE1ZoYSB0iNWyK7peHHVhIeKaHQ5Iwm3h/v3uc26ocg7In7iF
 5oH+rJndNKrRu/M6VOXKDanBVpock40+rmWrz7QnIdYQxG/QddDQ+J5LFrMao8tak3yd
 2cJDwGJ13EFFuorSryntYwBlbQdODtwjvWn3IZqE0flHcxkfLOC1BEJ+6CQjxN9RHuTS
 atMw==
X-Gm-Message-State: AOAM532swVNgPRdDefXxdBjtkMbU7t4j/EpMjbKln4SXddRk5VEJYJ7u
 NjRA8yVuyvA3EFtFQo8oUpcBUA==
X-Google-Smtp-Source: ABdhPJz5E9eGnZNL3mgtCGPnpEuPLyUIxWwdt306tTEkD9FAarcX1t9YW/pQGOHuNgi+UNXx76nfqw==
X-Received: by 2002:a19:ae11:: with SMTP id f17mr4149867lfc.532.1617242872222; 
 Wed, 31 Mar 2021 19:07:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j27sm386834lfp.186.2021.03.31.19.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 19:07:51 -0700 (PDT)
Subject: Re: [v1] drm/msm/disp/dpu1: fix warn stack reported during dpu resume
To: Rob Clark <robdclark@gmail.com>, Kalyan Thota <kalyan_t@codeaurora.org>
References: <1617190020-7931-1-git-send-email-kalyan_t@codeaurora.org>
 <84fdbdc7-7890-965a-bc6b-a19bd0ca4937@linaro.org>
 <CAF6AEGt_aAq4dF9QkS9uJ7vwvGeR42oToCQKpsWCrfuhy_j+pw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d104a40f-65c3-2700-e829-bfe8f5712ac5@linaro.org>
Date: Thu, 1 Apr 2021 05:07:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGt_aAq4dF9QkS9uJ7vwvGeR42oToCQKpsWCrfuhy_j+pw@mail.gmail.com>
Content-Language: en-GB
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Daniel Hung-yu Wu <hywu@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, mka@google.com,
 Michelle Dean <midean@google.com>, Steev Klimaszewski <steev@kali.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2021 01:47, Rob Clark wrote:
> On Wed, Mar 31, 2021 at 9:03 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 31/03/2021 14:27, Kalyan Thota wrote:
>>> WARN_ON was introduced by the below commit to catch runtime resumes
>>> that are getting triggered before icc path was set.
>>>
>>> "drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume"
>>>
>>> For the targets where the bw scaling is not enabled, this WARN_ON is
>>> a false alarm. Fix the WARN condition appropriately.
>>
>> Should we change all DPU targets to use bw scaling to the mdp from the
>> mdss nodes? The limitation to sc7180 looks artificial.
> 
> yes, we should, this keeps biting us on 845

Done, 
https://lore.kernel.org/linux-arm-msm/20210401020533.3956787-2-dmitry.baryshkov@linaro.org/

> 
>>>
>>> Reported-by: Steev Klimaszewski <steev@kali.org>
> 
> Please add Fixes: tag as well
> 
>>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 +++++---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  9 +++++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 11 ++++++-----
>>>    3 files changed, 20 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index cab387f..0071a4d 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -294,6 +294,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>>        struct icc_path *path1;
>>>        struct drm_device *dev = dpu_kms->dev;
>>>
>>> +     if (!dpu_supports_bw_scaling(dev))
>>> +             return 0;
>>> +
>>>        path0 = of_icc_get(dev->dev, "mdp0-mem");
>>>        path1 = of_icc_get(dev->dev, "mdp1-mem");
>>>
>>> @@ -934,8 +937,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>                DPU_DEBUG("REG_DMA is not defined");
>>>        }
>>>
>>> -     if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
>>> -             dpu_kms_parse_data_bus_icc_path(dpu_kms);
>>> +     dpu_kms_parse_data_bus_icc_path(dpu_kms);
>>>
>>>        pm_runtime_get_sync(&dpu_kms->pdev->dev);
>>>
>>> @@ -1198,7 +1200,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>>>
>>>        ddev = dpu_kms->dev;
>>>
>>> -     WARN_ON(!(dpu_kms->num_paths));
>>> +     WARN_ON((dpu_supports_bw_scaling(ddev) && !dpu_kms->num_paths));
>>>        /* Min vote of BW is required before turning on AXI clk */
>>>        for (i = 0; i < dpu_kms->num_paths; i++)
>>>                icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> index d6717d6..f7bcc0a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>> @@ -154,6 +154,15 @@ struct vsync_info {
>>>
>>>    #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)
>>>
>>> +/**
>>> + * dpu_supports_bw_scaling: returns true for drivers that support bw scaling.
>>> + * @dev: Pointer to drm_device structure
>>> + */
>>> +static inline int dpu_supports_bw_scaling(struct drm_device *dev)
>>> +{
>>> +     return of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss");
>>> +}
>>> +
>>>    /* Global private object state for tracking resources that are shared across
>>>     * multiple kms objects (planes/crtcs/etc).
>>>     */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>> index cd40788..8cd712c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>> @@ -41,6 +41,9 @@ static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
>>>        struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
>>>        struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
>>>
>>> +     if (dpu_supports_bw_scaling(dev))
>>> +             return 0;
>>> +
>>>        if (IS_ERR_OR_NULL(path0))
>>>                return PTR_ERR_OR_ZERO(path0);
>>>
>>> @@ -276,11 +279,9 @@ int dpu_mdss_init(struct drm_device *dev)
>>>
>>>        DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
>>>
>>> -     if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss")) {
>>> -             ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
>>> -             if (ret)
>>> -                     return ret;
>>> -     }
>>> +     ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
>>> +     if (ret)
>>> +             return ret;
>>>
>>>        mp = &dpu_mdss->mp;
>>>        ret = msm_dss_parse_clock(pdev, mp);
>>>
>>
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
