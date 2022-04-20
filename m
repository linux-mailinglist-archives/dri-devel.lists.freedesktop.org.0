Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7E95092FB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 00:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBC510EF3E;
	Wed, 20 Apr 2022 22:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE57F10EF3E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 22:38:54 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 17so3630749lji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 15:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WT3sz1HI2iIkt9znLJp+JHGTPg0HflFqpe4zBW6DUB4=;
 b=I+SOfQ2MOiJKJPdXOp10T0C1GpHvcOzqb9ClnxBuEzJ7sYHux2RHMiXJXeZ0KGxK+n
 AWR56grW0K7keM2IeV76dBA/AxN/CnJ5yHiO/N4yK6flsseUsdWq/f/g+5S3Eodo+fg1
 eVK1g2O5ZwO2pKWZrhCwlVxqnY/DIhvwggEdgQc1Br/2zQEOE+SdUlI5sfjj+omqKnLj
 PaXUy2odzPXkposloC2z7PUc8Q2Va02mh/452doACEYO64uaab7nhEyCxnJ24FiZ9LNH
 ZpfDcXzx2dWr7UszpYt81MR/fdYRCYUgWby0wVNb+h15mXrwCHjqEXKYAMEqJQCbOeG9
 +l2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WT3sz1HI2iIkt9znLJp+JHGTPg0HflFqpe4zBW6DUB4=;
 b=y5AnKRNiyjl5IJ2eAyNS9SN/Oa1NvPHLag7Z85TbEHvbL7RNxgGfxjU/zEKYs9wuCI
 sasNfRJX+R1OVSU+GmqDTPBWCrZU0bsF9FCjpKZvZOp8mAPKML3pvH6UlfetqwMrVi/l
 fVYOw0Z2yEVpAro6TZu0BL2atfxQQNsGsxyBttuvhtA+N9+g+/kKE5xsL14JpVPA422L
 X7h+0o2grT5tZ/db8GTmR2GhqKbSWPw83J05yA5uE618S4EbaXJROzqUDduoHgtJMtDV
 9lGq65A3M0brVjLsu1uqZvEWyqoF8QZ8hiUhOfoXKwq4aaknoCBIXkyflbz4btayEROe
 s62Q==
X-Gm-Message-State: AOAM533fr7SBy0FHWT6dMIHnOUXq2liawlvYijcvX7vLhRn3UB0NYvb9
 NQWo72q2WK+ADOm5YnUduFxrzQ==
X-Google-Smtp-Source: ABdhPJyXcP38MmKtMwJFWc4W/AJX4AJhv3jzhqnI/+lihyNeHhI1J17jUGgnc4ksR/ZP3+VfjniLrw==
X-Received: by 2002:a2e:a7d4:0:b0:24d:b0c3:9683 with SMTP id
 x20-20020a2ea7d4000000b0024db0c39683mr13590644ljp.472.1650494333064; 
 Wed, 20 Apr 2022 15:38:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a2e80c8000000b0024dc6fd9caasm612088ljg.95.2022.04.20.15.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 15:38:52 -0700 (PDT)
Message-ID: <f54c3367-d0e0-b89d-365f-565ca9631ec6@linaro.org>
Date: Thu, 21 Apr 2022 01:38:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Freedreno] [PATCH v2 10/17] drm/msm/dpu: make changes to
 dpu_encoder to support virtual encoder
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-11-git-send-email-quic_abhinavk@quicinc.com>
 <d31094f8-c067-567e-3fcb-d2ae31fff3c0@linaro.org>
 <05c75f88-8b76-f931-7162-850827de5baf@quicinc.com>
 <CAA8EJpoMMRPhuU00JWfGe68qkVrL4-EMqm79so+zagTaW8GSkA@mail.gmail.com>
 <a40c88cc-21a1-4809-7741-a7aaa310ae92@quicinc.com>
 <4e1b4479-8771-6ad9-8a6d-f53bdb5ae13e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4e1b4479-8771-6ad9-8a6d-f53bdb5ae13e@quicinc.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2022 01:06, Abhinav Kumar wrote:
> Hi Dmitry
> 
> On 4/20/2022 11:46 AM, Abhinav Kumar wrote:
>>
>>
>> On 4/20/2022 11:37 AM, Dmitry Baryshkov wrote:
>>> On Wed, 20 Apr 2022 at 20:41, Abhinav Kumar 
>>> <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 4/20/2022 12:44 AM, Dmitry Baryshkov wrote:
>>>>> On 20/04/2022 04:46, Abhinav Kumar wrote:
>>>>>> Make changes to dpu_encoder to support virtual encoder needed
>>>>>> to support writeback for dpu.
>>>>>>
>>>>>> changes in v2:
>>>>>>      - add the writeback parts to dpu_encoder_helper_phys_cleanup
>>>>>>      - rebase on tip of msm-next and fix related dependencies
>>>>>>      - get the writeback blocks directly from RM
>>>>>>
>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 71
>>>>>> +++++++++++++++++-------
>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 +
>>>>>>    2 files changed, 54 insertions(+), 20 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> index 0e31ad3..06b8631 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> @@ -928,6 +928,7 @@ static void
>>>>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>>>        struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>>>>>>        int num_lm, num_ctl, num_pp, num_dsc;
>>>>>>        unsigned int dsc_mask = 0;
>>>>>> +    enum dpu_hw_blk_type blk_type;
>>>>>>        int i;
>>>>>>        if (!drm_enc) {
>>>>>> @@ -1009,12 +1010,21 @@ static void
>>>>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>>>            phys->hw_pp = dpu_enc->hw_pp[i];
>>>>>>            phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>>>>>> -        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>>>>> -            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm,
>>>>>> phys->intf_idx);
>>>>>> +        if (dpu_encoder_get_intf_mode(&dpu_enc->base) ==
>>>>>> INTF_MODE_WB_LINE)
>>>>>> +            blk_type = DPU_HW_BLK_WB;
>>>>>> +        else
>>>>>> +            blk_type = DPU_HW_BLK_INTF;
>>>>>> +
>>>>>> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX) {
>>>>>> +            if (blk_type == DPU_HW_BLK_INTF)
>>>>>> +                phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm,
>>>>>> phys->intf_idx);
>>>>>> +            else if (blk_type == DPU_HW_BLK_WB)
>>>>>> +                phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm,
>>>>>> phys->intf_idx);
>>>>>> +        }
>>>>>> -        if (!phys->hw_intf) {
>>>>>> +        if (!phys->hw_intf && !phys->hw_wb) {
>>>>>>                DPU_ERROR_ENC(dpu_enc,
>>>>>> -                      "no intf block assigned at idx: %d\n", i);
>>>>>> +                      "no intf ow wb block assigned at idx: 
>>>>>> %d\n", i);
>>>>>
>>>>> or wb
>>>> ack
>>>>>
>>>>>>                return;
>>>>>>            }
>>>>>> @@ -1157,15 +1167,22 @@ static void dpu_encoder_virt_disable(struct
>>>>>> drm_encoder *drm_enc)
>>>>>>        mutex_unlock(&dpu_enc->enc_lock);
>>>>>>    }
>>>>>> -static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg 
>>>>>> *catalog,
>>>>>> +static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg
>>>>>> *catalog,
>>>>>>            enum dpu_intf_type type, u32 controller_id)
>>>>>>    {
>>>>>>        int i = 0;
>>>>>> -    for (i = 0; i < catalog->intf_count; i++) {
>>>>>> -        if (catalog->intf[i].type == type
>>>>>> -            && catalog->intf[i].controller_id == controller_id) {
>>>>>> -            return catalog->intf[i].id;
>>>>>> +    if (type != INTF_WB) {
>>>>>> +        for (i = 0; i < catalog->intf_count; i++) {
>>>>>> +            if (catalog->intf[i].type == type
>>>>>> +                && catalog->intf[i].controller_id == 
>>>>>> controller_id) {
>>>>>> +                return catalog->intf[i].id;
>>>>>> +            }
>>>>>> +        }
>>>>>> +    } else {
>>>>>> +        for (i = 0; i < catalog->wb_count; i++) {
>>>>>> +            if (catalog->wb[i].id == controller_id)
>>>>>> +                return catalog->wb[i].id;
>>>>>>            }
>>>>>>        }
>>>>>> @@ -1886,16 +1903,27 @@ void dpu_encoder_helper_phys_cleanup(struct
>>>>>> dpu_encoder_phys *phys_enc)
>>>>>>        dpu_encoder_helper_reset_mixers(phys_enc);
>>>>>> -    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>>>> -        if (dpu_enc->phys_encs[i] &&
>>>>>> phys_enc->hw_intf->ops.bind_pingpong_blk)
>>>>>> -            phys_enc->hw_intf->ops.bind_pingpong_blk(
>>>>>> -                    dpu_enc->phys_encs[i]->hw_intf, false,
>>>>>> -                    dpu_enc->phys_encs[i]->hw_pp->idx);
>>>>>> +    if (phys_enc->hw_wb) {
>>>>>
>>>>> I think this adds a hidden knowledge here. That there is always just a
>>>>> single phys_enc for the WB encoder. I'd still do this cleanup in a 
>>>>> loop
>>>>> together with the INTF cleanup.
>>>> alright, I can make this change.
> 
> I dug into the history of dpu_encoder_helper_phys_cleanup() API more in 
> downstream.
> 
> So this API seems to be a bit poorly designed in downstream too.
> 
> This gets called from phys->ops.disable() today which is anyway called 
> from within a loop.
> 
>   for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>          struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> 
>          if (phys->ops.disable)
>              phys->ops.disable(phys);
>      }
> 
> So technically we dont need a loop even for the intf cases because of that.
> 
> But, while calling for interfaces, downstream makes sure to call this 
> just once for the master and skip for the same.
> 
> Here the loop is needed just to set the flush bits even for the slave 
> and let the master do the actual flush.
> 
> Since today, we are not calling this for interface yet, I think i can 
> get rid of the loop even for the interface case for uniformity.
> 
> When I extend this API to be called for interface cases, we can decide 
> how to handle master/slave cases.
> 
> Let me know what you think.

This correspons more or less the the idea that I have been toying for 
quite some time but never had time to finish: a higher level that would 
receive the topology (a list of all LMs, CTLs, INTFs, etc) and wrap 
around all CTL  calls, taking care of ACTIVE vs non-active CTL, single 
flush vs multiple flushes, etc. I postponed this ideas, as I could not 
foresee what would be the requirements of WB support.

In the disable case I think you'd want to call a disable_pipe function 
in a loop and then to flush all the pending changes. I'd prefer to have 
a directly called function rather than a callback.

Does that answer your question?

> 
>>>>>
>>>>>> +        /* disable the PP block */
>>>>>> +        if (phys_enc->hw_wb->ops.bind_pingpong_blk)
>>>>>> +            phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb,
>>>>>> false,
>>>>>> +                    phys_enc->hw_pp->idx);
>>>>>> -        /* mark INTF flush as pending */
>>>>>> -        if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
>>>>>> -
>>>>>> phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
>>>>>> -                    dpu_enc->phys_encs[i]->hw_intf->idx);
>>>>>> +        /* mark WB flush as pending */
>>>>>> +        if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
>>>>>> +            phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl,
>>>>>> phys_enc->hw_wb->idx);
>>>>>> +    } else {
>>>>>> +        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>>>> +            if (dpu_enc->phys_encs[i] &&
>>>>>> phys_enc->hw_intf->ops.bind_pingpong_blk)
>>>>>> +                phys_enc->hw_intf->ops.bind_pingpong_blk(
>>>>>> +                        dpu_enc->phys_encs[i]->hw_intf, false,
>>>>>> +                        dpu_enc->phys_encs[i]->hw_pp->idx);
>>>>>> +
>>>>>> +            /* mark INTF flush as pending */
>>>>>> +            if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
>>>>>> +
>>>>>> phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
>>>>>> +                        dpu_enc->phys_encs[i]->hw_intf->idx);
>>>>>> +        }
>>>>>>        }
>>>>>>        /* reset the merge 3D HW block */
>>>>>> @@ -2111,6 +2139,9 @@ static int dpu_encoder_setup_display(struct
>>>>>> dpu_encoder_virt *dpu_enc,
>>>>>>        case DRM_MODE_ENCODER_TMDS:
>>>>>>            intf_type = INTF_DP;
>>>>>>            break;
>>>>>> +    case DRM_MODE_ENCODER_VIRTUAL:
>>>>>> +        intf_type = INTF_WB;
>>>>>> +        break;
>>>>>>        }
>>>>>>        WARN_ON(disp_info->num_of_h_tiles < 1);
>>>>>> @@ -2145,11 +2176,11 @@ static int dpu_encoder_setup_display(struct
>>>>>> dpu_encoder_virt *dpu_enc,
>>>>>>            DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>>>>>>                    i, controller_id, phys_params.split_role);
>>>>>> -        phys_params.intf_idx = 
>>>>>> dpu_encoder_get_intf(dpu_kms->catalog,
>>>>>> +        phys_params.intf_idx =
>>>>>> dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
>>>>>>                                                        intf_type,
>>>>>>                                                        
>>>>>> controller_id);
>>>>>
>>>>> I'd prefer to be more explicit here. intf_idx is of type enum 
>>>>> dpu_intf,
>>>>> while WBs are enumerated with enum dpu_wb.
>>>>>
>>>>> I's suggest adding a separate phys_params.wb_idx and a
>>>>> dpu_encoder_get_wb() and calling one here depending on intf_type.
>>>>>
>>>>> Then at the dpu_encoder_virt_atomic_mode_set() you don't need to check
>>>>> intf_mode, but get both intf and wb and report an error if none was
>>>>> provided.
>>>>
>>>> Your suggestion is valid and I also thought about it.
>>>>
>>>> Let me explain what prevented me from making the change here and put it
>>>> in a to-do bucket.
>>>>
>>>> 1) This needs a slighly bigger cleanup including the traces, debug
>>>> prints and some helpers as none of them are aware of the wb_idx
>>>>
>>>> 2) Some of the checks need to be adjusted like this one
>>>>
>>>> if (phys_params.intf_idx == INTF_MAX) {
>>>>               DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type 
>>>> %d,
>>>> id %d\n",
>>>>                             intf_type, controller_id);
>>>>               ret = -EINVAL;
>>>>           }
>>>>
>>>> So, when we have a separate intf_idx and a wb_idx, having either one of
>>>> them is enough . Consider a case where a board has no physical display.
>>>> That would have no intf_idx but wb_idx can be valid.
>>>>
>>>> So i think this needs a little careful cleanup.
>>>>
>>>> Considering that I need to test that out more, I decided that for a
>>>> short-term we can live with the fact that wb_idx is of type enum
>>>> dpu_intf because dpu_encoder layer understands only that.
>>>>
>>>> Let me know if you agree on this separation to go as a follow-up.
>>>
>>> Actually both your points vote for the immediate separation rather
>>> than doing it in a follow-up.
>>> For example, if you see an error reported against INTF_2 on a board
>>> where INTF_2 is actually used, you can not determine whether it is an
>>> issue with INTF_2 or with WB_2.
>>>
>>> In fact even reporting an error (or a trace) against INTF_NONE (or
>>> INTF_MAX) might be a better option. It would clearly denote that the
>>> issue is related to the non-INTF.
>>>
>>> I think we can merge the patch as is, but I'd strongly prefer either
>>> to see an update or a (nearly) immediate followup.
>>>
>>> What do you think about an interim solution? We split the
>>> intf_idx/wb_idx in these series, but all the debugging can be updated
>>> later. This way once we see the report against INTF_NONE, we can
>>> deduce that it's WB.
>>
>> Thank you for your consideration.
>>
>> I will post a follow-up change to fix this no later than next week.
>> I will even try doing it this week itself.
>>
>> I will fix everything together so that it looks like a separate series 
>> of "separating intf_idx and wb_idx" and there is no intermediate 
>> mismatch.
>>
>> Will leave a FIXME here as well.
>>
>>>
>>>>>
>>>>>>            if (phys_params.intf_idx == INTF_MAX) {
>>>>>> -            DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id
>>>>>> %d\n",
>>>>>> +            DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type
>>>>>> %d, id %d\n",
>>>>>>                              intf_type, controller_id);
>>>>>>                ret = -EINVAL;
>>>>>>            }
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> index 544a9a4..0b80af4 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> @@ -11,6 +11,7 @@
>>>>>>    #include "dpu_kms.h"
>>>>>>    #include "dpu_hw_intf.h"
>>>>>> +#include "dpu_hw_wb.h"
>>>>>>    #include "dpu_hw_pingpong.h"
>>>>>>    #include "dpu_hw_ctl.h"
>>>>>>    #include "dpu_hw_top.h"
>>>>>> @@ -165,6 +166,7 @@ enum dpu_intr_idx {
>>>>>>     * @hw_ctl:        Hardware interface to the ctl registers
>>>>>>     * @hw_pp:        Hardware interface to the ping pong registers
>>>>>>     * @hw_intf:        Hardware interface to the intf registers
>>>>>> + * @hw_wb:        Hardware interface to the wb registers
>>>>>>     * @dpu_kms:        Pointer to the dpu_kms top level
>>>>>>     * @cached_mode:    DRM mode cached at mode_set time, acted on in
>>>>>> enable
>>>>>>     * @enabled:        Whether the encoder has enabled and running 
>>>>>> a mode
>>>>>> @@ -193,6 +195,7 @@ struct dpu_encoder_phys {
>>>>>>        struct dpu_hw_ctl *hw_ctl;
>>>>>>        struct dpu_hw_pingpong *hw_pp;
>>>>>>        struct dpu_hw_intf *hw_intf;
>>>>>> +    struct dpu_hw_wb *hw_wb;
>>>>>>        struct dpu_kms *dpu_kms;
>>>>>>        struct drm_display_mode cached_mode;
>>>>>>        enum dpu_enc_split_role split_role;
>>>>>
>>>>>
>>>
>>>
>>>


-- 
With best wishes
Dmitry
