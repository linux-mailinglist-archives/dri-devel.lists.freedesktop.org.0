Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F3145A6B3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 16:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BB26E441;
	Tue, 23 Nov 2021 15:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737396E441
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 15:39:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637681995; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=mRAcJajBuUcZ3gglt5FYxyIJIcC+Pgh55D4MtpmKUbM=;
 b=wUNSlWakekJCG/jtABznDKeGPHFAR+72yI5jopM5wB6tSplM6/5AjW2n/TTgub5SK40U6KCr
 6sExzFExP72MWaF7LKI/qjHBkd1LXb5SjIudFVjT6oMcclWO4O8C3S4E+MS3N+XcDei1ZlX7
 9GdgpusQJoIf+XItK99i0RJ/HO8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 619d0aff5daaeec797e672fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 15:38:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D8608C43619; Tue, 23 Nov 2021 15:38:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.5] (unknown [117.211.32.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0187C4338F;
 Tue, 23 Nov 2021 15:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D0187C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <0dd0444a-20ae-4fbc-fc8f-a1b93d53797a@codeaurora.org>
Date: Tue, 23 Nov 2021 21:08:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Capture gmu log in devcoredump
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20211118154903.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
 <20211118154903.4.Ibb71b3c64d6f98d586131a143c27fbdb233260a1@changeid>
 <CAF6AEGvxgVHXuz=W0_r=4EakV8XKVjdMeofZbuBYuz0Vep2BfA@mail.gmail.com>
 <CAF6AEGvn2fGOUoKAQg57pYNcHJZTKUzgS6O9BTgat17VD52M6w@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <CAF6AEGvn2fGOUoKAQg57pYNcHJZTKUzgS6O9BTgat17VD52M6w@mail.gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/2021 12:36 AM, Rob Clark wrote:
> On Mon, Nov 22, 2021 at 10:26 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Thu, Nov 18, 2021 at 2:21 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>>
>>> Capture gmu log in coredump to enhance debugging.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>>> ---
>>>
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 +++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 ++
>>>   3 files changed, 44 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>> index 7501849..9fa3fa6 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>>> @@ -42,6 +42,8 @@ struct a6xx_gpu_state {
>>>          struct a6xx_gpu_state_obj *cx_debugbus;
>>>          int nr_cx_debugbus;
>>>
>>> +       struct msm_gpu_state_bo *gmu_log;
>>> +
>>>          struct list_head objs;
>>>   };
>>>
>>> @@ -800,6 +802,30 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>>>                  &a6xx_state->gmu_registers[2], false);
>>>   }
>>>
>>> +static void a6xx_get_gmu_log(struct msm_gpu *gpu,
>>> +               struct a6xx_gpu_state *a6xx_state)
>>> +{
>>> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>> +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>> +       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>> +       struct msm_gpu_state_bo *gmu_log;
>>> +
>>> +       gmu_log = state_kcalloc(a6xx_state,
>>> +               1, sizeof(*a6xx_state->gmu_log));
>>> +       if (!gmu_log)
>>> +               return;
>>> +
>>> +       gmu_log->iova = gmu->log.iova;
>>> +       gmu_log->size = gmu->log.size;
>>> +       gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
>>> +       if (!gmu_log->data)
>>> +               return;
>>> +
>>> +       memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
>>> +
>>> +       a6xx_state->gmu_log = gmu_log;
>>> +}
>>> +
>>>   #define A6XX_GBIF_REGLIST_SIZE   1
>>>   static void a6xx_get_registers(struct msm_gpu *gpu,
>>>                  struct a6xx_gpu_state *a6xx_state,
>>> @@ -937,6 +963,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>>>
>>>          a6xx_get_gmu_registers(gpu, a6xx_state);
>>>
>>> +       a6xx_get_gmu_log(gpu, a6xx_state);
>>> +
>>>          /* If GX isn't on the rest of the data isn't going to be accessible */
>>>          if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>>>                  return &a6xx_state->base;
>>> @@ -978,6 +1006,9 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
>>>          struct a6xx_gpu_state *a6xx_state = container_of(state,
>>>                          struct a6xx_gpu_state, base);
>>>
>>> +       if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
>>> +               kvfree(a6xx_state->gmu_log->data);
>>> +
>>>          list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
>>>                  kfree(obj);
>>>
>>> @@ -1191,6 +1222,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>>>
>>>          adreno_show(gpu, state, p);
>>>
>>> +       drm_puts(p, "gmu-log:\n");
>>> +       if (a6xx_state->gmu_log) {
>>> +               struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
>>> +
>>> +               drm_printf(p, "    iova: 0x%016llx\n", gmu_log->iova);
>>> +               drm_printf(p, "    size: %d\n", gmu_log->size);
>>
>> fwiw, that wants to be:
>>
>>   +               drm_printf(p, "    size: %zu\n", gmu_log->size);
>>
>> with that fixed, r-b
> 
> Hmm, actually, I seem to be getting an empty log.. is special gmu fw,
> or non-fused device needed for this to work?
> 
> BR,
> -R

No, there is no special fw. I tested this on 7c3 and it worked for me. 
a618/a630 has an old version of gmu firmware which is pretty different 
from the newer ones. Let me check.

-Akhil.

> 
>> BR,
>> -R
>>
>>> +               adreno_show_object(p, &gmu_log->data, gmu_log->size,
>>> +                               &gmu_log->encoded);
>>> +       }
>>> +
>>>          drm_puts(p, "registers:\n");
>>>          for (i = 0; i < a6xx_state->nr_registers; i++) {
>>>                  struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> index 7486652..7d1ff20 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>> @@ -630,7 +630,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
>>>   }
>>>
>>>   /* len is expected to be in bytes */
>>> -static void adreno_show_object(struct drm_printer *p, void **ptr, int len,
>>> +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
>>>                  bool *encoded)
>>>   {
>>>          if (!*ptr || !len)
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> index 225c277..6762308 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>> @@ -306,6 +306,8 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state);
>>>
>>>   int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
>>>   int adreno_gpu_state_put(struct msm_gpu_state *state);
>>> +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
>>> +               bool *encoded);
>>>
>>>   /*
>>>    * Common helper function to initialize the default address space for arm-smmu
>>> --
>>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>>> of Code Aurora Forum, hosted by The Linux Foundation.
>>>

