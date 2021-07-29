Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9FF3DAB3F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 20:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6066EE1D;
	Thu, 29 Jul 2021 18:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97176EE1D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 18:45:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627584328; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=IYZRATzTbyhYzVY+ZAWqYrwa46uzUlCUhyWiMow0NNQ=;
 b=ajKTRuXws6czKBeIjGOWed7huixhYguCEKJ4z1gtCyhUulhBTC3lWTmvFrAnGYmzqAtcMu3J
 pJmlceUeel4g8edNrw6QS3lQmUNXs4ORkkwH0B/Q5gbY+pVuMqlZXp14mIT5BUuxtwYXSHya
 A+eRGFymRukBAQpV/BigW539fYc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6102f73617c2b4047d7d979e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 18:45:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 400FCC433D3; Thu, 29 Jul 2021 18:45:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [59.89.229.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A73E1C433F1;
 Thu, 29 Jul 2021 18:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A73E1C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [RFC PATCH] drm/msm: Introduce Adreno Features
To: Rob Clark <robdclark@gmail.com>
References: <20210729205906.RFC.1.I5645753650f32d9b469d6183a5fd8e5e65a7b7a4@changeid>
 <CAF6AEGuwvwx0P2KELREccmhCfkQR=QVG6hXqiutEfpAMGDGEKQ@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <7360bd81-9271-6150-b92a-b8e06ea812f3@codeaurora.org>
Date: Fri, 30 Jul 2021 00:15:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuwvwx0P2KELREccmhCfkQR=QVG6hXqiutEfpAMGDGEKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/2021 9:26 PM, Rob Clark wrote:
> On Thu, Jul 29, 2021 at 8:31 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>
>> Introduce a feature flag in gpulist to easily identify the capabilities
>> of each gpu revision. This will help to avoid a lot of adreno_is_axxx()
>> check when we add new features. In the current patch, HW APRIV feature
>> is converted to a feature flag.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>> This patch is rebased on top of the below series:
>> https://patchwork.freedesktop.org/series/93192/
>>
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 12 ------------
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  3 +++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  9 +++++++++
>>   4 files changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 1881e09..b28305b 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1765,7 +1765,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>          struct msm_drm_private *priv = dev->dev_private;
>>          struct platform_device *pdev = priv->gpu_pdev;
>>          struct adreno_platform_config *config = pdev->dev.platform_data;
>> -       const struct adreno_info *info;
>>          struct device_node *node;
>>          struct a6xx_gpu *a6xx_gpu;
>>          struct adreno_gpu *adreno_gpu;
>> @@ -1781,17 +1780,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>
>>          adreno_gpu->registers = NULL;
>>
>> -       /*
>> -        * We need to know the platform type before calling into adreno_gpu_init
>> -        * so that the hw_apriv flag can be correctly set. Snoop into the info
>> -        * and grab the revision number
>> -        */
>> -       info = adreno_info(config->rev);
>> -
>> -       if (info && (info->revn == 650 || info->revn == 660 ||
>> -                       adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
>> -               adreno_gpu->base.hw_apriv = true;
>> -
>>          a6xx_llc_slices_init(pdev, a6xx_gpu);
>>
>>          ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 7b9d605..44321ec 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -276,6 +276,7 @@ static const struct adreno_info gpulist[] = {
>>                  .rev = ADRENO_REV(6, 5, 0, ANY_ID),
>>                  .revn = 650,
>>                  .name = "A650",
>> +               .features = ADRENO_APRIV,
> 
> I guess this should be:
> 
>          .features = BIT(ADRENO_APRIV),

D'oh!

> 
>>                  .fw = {
>>                          [ADRENO_FW_SQE] = "a650_sqe.fw",
>>                          [ADRENO_FW_GMU] = "a650_gmu.bin",
>> @@ -289,6 +290,7 @@ static const struct adreno_info gpulist[] = {
>>                  .rev = ADRENO_REV(6, 6, 0, ANY_ID),
>>                  .revn = 660,
>>                  .name = "A660",
>> +               .features = ADRENO_APRIV,
>>                  .fw = {
>>                          [ADRENO_FW_SQE] = "a660_sqe.fw",
>>                          [ADRENO_FW_GMU] = "a660_gmu.bin",
>> @@ -301,6 +303,7 @@ static const struct adreno_info gpulist[] = {
>>          }, {
>>                  .rev = ADRENO_REV(6, 3, 5, ANY_ID),
>>                  .name = "Adreno 7c Gen 3",
>> +               .features = ADRENO_APRIV,
>>                  .fw = {
>>                          [ADRENO_FW_SQE] = "a660_sqe.fw",
>>                          [ADRENO_FW_GMU] = "a660_gmu.bin",
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 9f5a302..e8acadf5 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -945,6 +945,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>          pm_runtime_use_autosuspend(dev);
>>          pm_runtime_enable(dev);
>>
>> +       if (ADRENO_FEAT(adreno_gpu, ADRENO_APRIV))
>> +               adreno_gpu->base.hw_apriv = true;
>> +
>>          return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>>                          adreno_gpu->info->name, &adreno_gpu_config);
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 50b4d53..61797c3 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -35,6 +35,11 @@ enum adreno_quirks {
>>          ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
>>   };
>>
>> +enum adreno_features {
>> +       /* ADRENO has HW APRIV feature */
>> +       ADRENO_APRIV,
>> +};
>> +
>>   struct adreno_rev {
>>          uint8_t  core;
>>          uint8_t  major;
>> @@ -63,6 +68,7 @@ struct adreno_info {
>>          struct adreno_rev rev;
>>          uint32_t revn;
>>          const char *name;
>> +       u32 features;
>>          const char *fw[ADRENO_FW_MAX];
>>          uint32_t gmem;
>>          enum adreno_quirks quirks;
>> @@ -388,6 +394,9 @@ static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>>          return (ring->cur - ring->start) % (MSM_GPU_RINGBUFFER_SZ >> 2);
>>   }
>>
>> +#define ADRENO_FEAT(adreno_gpu, feature) \
>> +       (adreno_gpu->info->features & (1 << feature))
> 
> And also use BIT() here
> 
> But I suppose we could also do something like:
> 
>      #define ADRENO_FEAT(feature)  BIT(ADRENO_ ## feature)
>      #define ADRENO_HAS_FEAT(adreno_gpu, feature) \
>             ((adreno_gpu)->info->features & ADRENO_FEAT(feature))
> 
> and then in the gpulist table:
> 
>       .features = ADRENO_FEAT(APRIV) | ADRENO_FEAT(FOO) | ADRENO_FEAT(BAR)
> 
> that way there is no confusion about whether or not to use BIT()
> 
> Otherwise, I like the idea.

Sounds good to me.

Thanks for the feedback.

-Akhil.

> 
> BR,
> -R
> 
>> +
>>   /*
>>    * Given a register and a count, return a value to program into
>>    * REG_CP_PROTECT_REG(n) - this will block both reads and writes for _len
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation.
>>

