Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC744C1CDC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 21:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AAB10EA85;
	Wed, 23 Feb 2022 20:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12C610EA67;
 Wed, 23 Feb 2022 20:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645646923; x=1677182923;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+MGvrogjK3hBuwIOknzKUrzQSja4adIWRodFkkTu2kk=;
 b=qAu3HWwEtw6P/h3mKJP5QzYTHoGNQNbzHClMR3xvT211kdvjO6BZfWcA
 xRSkXlgxJbpTQugwZpKvC9pP3K0FHhDFmpboCywcu9hiDPwFefW3G3seQ
 +c2UtidQmDkzt1WQTbQjuBapTau7x+1T9cjoJl9l6fhvGJgYoocEHVl07 A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Feb 2022 12:08:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 12:08:42 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 12:08:42 -0800
Received: from [10.216.14.166] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Wed, 23 Feb
 2022 12:08:36 -0800
Message-ID: <d70cf11a-1a23-e240-3565-9966a6f4bfaa@quicinc.com>
Date: Thu, 24 Feb 2022 01:38:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/5] drm/msm/adreno: Generate name from chipid for 7c3
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220221201039.2.I9436e0e300f76b2e6c34136a0b902e8cfd73e0d6@changeid>
 <CAF6AEGuVZaOdUUf8ccokTQdAXMdW3oVYNx3ae9ShBoh8ibXVOw@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGuVZaOdUUf8ccokTQdAXMdW3oVYNx3ae9ShBoh8ibXVOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Sean Paul <sean@poorly.run>, OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/2022 6:28 AM, Rob Clark wrote:
> On Mon, Feb 21, 2022 at 6:41 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> Use a gpu name which is sprintf'ed from the chipid for 7c3 gpu instead of
>> hardcoding one. This helps to avoid code churn in case of a gpu rename.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |  1 -
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 14 ++++++++++++--
>>   2 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index fb26193..89cfd84 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -318,7 +318,6 @@ static const struct adreno_info gpulist[] = {
>>                  .hwcg = a660_hwcg,
>>          }, {
>>                  .rev = ADRENO_REV(6, 3, 5, ANY_ID),
>> -               .name = "Adreno 7c Gen 3",
>>                  .fw = {
>>                          [ADRENO_FW_SQE] = "a660_sqe.fw",
>>                          [ADRENO_FW_GMU] = "a660_gmu.bin",
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index f33cfa4..158bbf7 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -929,12 +929,22 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>          struct adreno_platform_config *config = dev->platform_data;
>>          struct msm_gpu_config adreno_gpu_config  = { 0 };
>>          struct msm_gpu *gpu = &adreno_gpu->base;
>> +       struct adreno_rev *rev = &config->rev;
>> +       const char *gpu_name;
>> +       static char name[8];
> I think 8 is not always enough.. but maybe just use devm_kasprintf()
> to keep it simpler?
>
> BR,
> -R
Sounds good. Will update this patch.

-Akhil.
>>          adreno_gpu->funcs = funcs;
>>          adreno_gpu->info = adreno_info(config->rev);
>>          adreno_gpu->gmem = adreno_gpu->info->gmem;
>>          adreno_gpu->revn = adreno_gpu->info->revn;
>> -       adreno_gpu->rev = config->rev;
>> +       adreno_gpu->rev = *rev;
>> +
>> +       gpu_name = adreno_gpu->info->name;
>> +       if (!gpu_name) {
>> +               sprintf(name, "%d.%d.%d.%d", rev->core, rev->major, rev->minor,
>> +                               rev->patchid);
>> +               gpu_name = name;
>> +       }
>>
>>          adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
>>
>> @@ -948,7 +958,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>          pm_runtime_enable(dev);
>>
>>          return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>> -                       adreno_gpu->info->name, &adreno_gpu_config);
>> +                       gpu_name, &adreno_gpu_config);
>>   }
>>
>>   void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>> --
>> 2.7.4
>>

