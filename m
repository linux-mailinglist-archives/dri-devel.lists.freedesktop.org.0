Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E94734B275E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F78010EAB2;
	Fri, 11 Feb 2022 13:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDD010EC2B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 13:47:41 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id o2so16720821lfd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 05:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YJSNST3aS89U7aHfywCFmZPOsmxkcbl7rPz4ppuFBgY=;
 b=FTpSMu+dnUqTVdDEpmHvIhrptfVT6cWykECEmBplodFJufujFinA3Bwah5+1xnEg3x
 zrjq4Waf5CWxBnA2okqhAsOy5gp2wA/ZUtkcIf9IjWC+xvygDBBG487zFb9Skj05bNyu
 M1xX+EXNNaoP2UQbbM7hg/jaca/gHIp4rIoIJBMFLk5wha/R/5yLJQOJyZlmfPR9cG8J
 dDFIFI0XDBRKkACouUkDhnLm0Nyg8LD/Vdxymbp9+LNQDanNOCM03Bt2tWcS1VJL4/UZ
 25GgHo4o6CS8JLp2/30JJ+QlAN/hqkLdxpOwLx89B/sJTHatRGQ1v04tylIv9S2d4yE4
 6SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YJSNST3aS89U7aHfywCFmZPOsmxkcbl7rPz4ppuFBgY=;
 b=dph822yLG+i3JDpb+qQ/hjNgdwXfQsEnAR2ipwPsgrXBchc9rL+42b6bvPjCyyphS2
 Iysm/GLpSBORWWeqOwJcTmy+pn8+6Ua5RJIryWoMRsDfMSX6sI6Vn6CF1hCWlMu7oOVW
 66gTEbrBM+CYAXGBsAvGZWGUgkfmczIHn6Q4tribwqPblOZkwVpCbJWgywjiQO5An8Ah
 vscQxdJ8fj8v+opoPFwOOkP3d/xDbi1jgjK9P4O13CHis3gu/Q8GiHZeYDQ2pEiUA2GN
 jMX6+fLNBIi+A7Xzd9zMRHKq4kZaO1nJtLCRQKY9KxFG4KeZMKt0/wbuJlxf0Xtd/PQh
 sMTw==
X-Gm-Message-State: AOAM530utkONdCQ3Jf/An9KjBkTsns3zlkdroVukinM188EPPgkqbQww
 zVVeGCXQYB9rj1Vsy/mWugCLXQ==
X-Google-Smtp-Source: ABdhPJww7mQn0G3GziO3xS8VJj4ihMQYTaQFFzIwaVE+avfVtWLPcBYUe5NfXBYKHa6G/2qIMvylKg==
X-Received: by 2002:a19:4302:: with SMTP id q2mr1263898lfa.449.1644587259696; 
 Fri, 11 Feb 2022 05:47:39 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h2sm3199930ljk.41.2022.02.11.05.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 05:47:39 -0800 (PST)
Message-ID: <0fe11ff5-b91d-a8e7-d48e-11111bf76e6b@linaro.org>
Date: Fri, 11 Feb 2022 16:47:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [PATCH v5 3/6] drm/msm/dpu: get INTF blocks directly
 rather than through RM
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-4-dmitry.baryshkov@linaro.org>
 <0bc25257-b866-7c95-efa8-ac7eac96b316@quicinc.com>
 <9d87a3ff-e3d5-2fa9-92b9-e7d724812559@linaro.org>
 <f88d7138-9ba2-c8ec-0767-5d0b071d8de6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f88d7138-9ba2-c8ec-0767-5d0b071d8de6@quicinc.com>
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

On 11/02/2022 02:31, Abhinav Kumar wrote:
> 
> 
> On 2/10/2022 1:32 AM, Dmitry Baryshkov wrote:
>> On 10/02/2022 03:25, Abhinav Kumar wrote:
>>>
>>>
>>> On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
>>>> INTF blocks are not really handled by resource manager, they are
>>>> assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
>>>> Then this allocation is passed to RM and then returned to then
>>>> dpu_encoder.
>>>> So allocate them outside of RM and use them directly.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>
>>> I have some questions about this approach.
>>>
>>> Agreed, that when there is one encoder tied to one interface, we dont 
>>> need to go through RM because RM just gives what the encoder asks. 
>>> Instead we can directly get the interface from encoder.
>>>
>>> But what happens when multiple displays are requesting the same 
>>> interface?
>>>
>>> There are use-cases which we have handled especially in mid-tier 
>>> chips which do not have external display where between mode-switches
>>> OR between some user triggered events DSI0 was shared between two 
>>> displays.
>>>
>>> So  lets say display 1 (with encoder X) requests DSI0
>>> and display 2 (with encoder Y) also requests DSI0,
>>
>> All the encoders are allocated in the loop over possible DSI/DP 
>> interfaces. Thus it's not possible to have two encoders being driven 
>> by the same DSI entity. Moreover, the MSM DSI manager would not be 
>> able to cope with such cases.
>>
>> In my opinion, the proper way to handle such cases would be a bridge 
>> which would generate hotplug events and toggle display pipeline 
>> inbetween.
> 
> Like I wrote in the previous comment, today there is always one encoder 
> requesting for one interface (or two for split DSI ) and there is no 
> chance of a conflict ( the loop that you are referring to ).
> 
> And yes I am aware that DSI does not support this today.
> 
> Myself and a few others internally are looking ahead and thinking of 
> what can come in the future and something which we already support 
> downstream, which is to support sharing the interface across encoders.
> 
> So what happens downstream is the controller ID comes from the device tree:
> 
> 6266     info->num_of_h_tiles = display->ctrl_count;
> 6267     for (i = 0; i < info->num_of_h_tiles; i++)
> 6268         info->h_tile_instance[i] = display->ctrl[i].ctrl->cell_index;
> 6269
> 
> There is a concept of a dsi_display quite similar to the dsi_manager we 
> have upstream. There are also implementations already in place of a 
> shared display, where like I was describing in IRC, the DSI0 can be 
> shared across two encoders between a mode_set().
> 
> Hotplug is not necessarily the only trigger which happens, it can just
> be a simple mode_set() in between.

Even having a modeset, you will have to trigger the electrical switch 
between the DSI sinks. It should be a separate device sitting in both 
DSI pipelines, so you'll have a question of having it in sync.

> In that case, this encoder to intf mapping in the RM will protect 
> against concurrent hardware use.
> 
> Ofcourse, all this is not present today but will someday :)
> 
> That time this will have to be brought back.
> 
> So I thought I must mention the use-cases which will get potentially 
> affected with this change of removing INTF from RM.
> 
> If for the sake of code simplicity, if we want to ignore the possibility
> of this coming back later, please let me know what you think and we can
> take this further by acking it.

As I wrote on the IRC, I suppose that neither you nor me can imagine the 
way such usecases might be actually implemented when the need arises.

You have an idea of using multiple encoders. Fine idea, nothing 
particularly wrong with it.

I'd use single pipeline and multiple panels being switched. Or the panel 
driver providing modes for both small and larger panels (or internal and 
external) at the same time and guarding the switch on its own.

The engineer that would implement this feature might come with another 
approach (and might e.g. implement dynamic drm_bridge pipelines inside 
the core).

And if we bring in DSI split link into the equation, the situation might 
become even more complex (with one of encoders owning a half of the DSI 
and and enother encoder owning another half).

We should always think about future use cases, but we should not 
over-predict the future. Unnecessary abstractions complicate the code, 
making the driver harder to comprehend, harder to modify and more 
error-prone.

That said I'd suggest/ask to ack and accept this patch.

> 
> 
>>
>>> with this change, the code will allow that as there is no interface to
>>> encoder mapping.
>>>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 36 +---------
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   | 16 -----
>>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  5 --
>>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 ---
>>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  8 ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 68 
>>>> ++-----------------
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  8 +++
>>>>   8 files changed, 16 insertions(+), 134 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 1e648db439f9..11f7126728db 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -420,26 +420,6 @@ int dpu_encoder_get_linecount(struct 
>>>> drm_encoder *drm_enc)
>>>>       return linecount;
>>>>   }
>>>> -void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
>>>> -                  struct dpu_encoder_hw_resources *hw_res)
>>>> -{
>>>> -    struct dpu_encoder_virt *dpu_enc = NULL;
>>>> -    int i = 0;
>>>> -
>>>> -    dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>> -    DPU_DEBUG_ENC(dpu_enc, "\n");
>>>> -
>>>> -    /* Query resources used by phys encs, expected to be without 
>>>> overlap */
>>>> -    memset(hw_res, 0, sizeof(*hw_res));
>>>> -
>>>> -    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>> -        struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>> -
>>>> -        if (phys->ops.get_hw_resources)
>>>> -            phys->ops.get_hw_resources(phys, hw_res);
>>>> -    }
>>>> -}
>>>> -
>>>>   static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
>>>>   {
>>>>       struct dpu_encoder_virt *dpu_enc = NULL;
>>>> @@ -973,7 +953,7 @@ static void dpu_encoder_virt_mode_set(struct 
>>>> drm_encoder *drm_enc,
>>>>       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>>>>       struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>>>>       int num_lm, num_ctl, num_pp;
>>>> -    int i, j;
>>>> +    int i;
>>>>       if (!drm_enc) {
>>>>           DPU_ERROR("invalid encoder\n");
>>>> @@ -1040,8 +1020,6 @@ static void dpu_encoder_virt_mode_set(struct 
>>>> drm_encoder *drm_enc,
>>>>       cstate->num_mixers = num_lm;
>>>>       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>> -        int num_blk;
>>>> -        struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
>>>>           struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>>           if (!dpu_enc->hw_pp[i]) {
>>>> @@ -1059,16 +1037,8 @@ static void dpu_encoder_virt_mode_set(struct 
>>>> drm_encoder *drm_enc,
>>>>           phys->hw_pp = dpu_enc->hw_pp[i];
>>>>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>>>> -        num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
>>>> -            global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
>>>> -            hw_blk, ARRAY_SIZE(hw_blk));
>>>> -        for (j = 0; j < num_blk; j++) {
>>>> -            struct dpu_hw_intf *hw_intf;
>>>> -
>>>> -            hw_intf = to_dpu_hw_intf(hw_blk[i]);
>>>> -            if (hw_intf->idx == phys->intf_idx)
>>>> -                phys->hw_intf = hw_intf;
>>>> -        }
>>>> +        if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>>>> +            phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>>>> phys->intf_idx);
>>>>           if (!phys->hw_intf) {
>>>>               DPU_ERROR_ENC(dpu_enc,
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>> index e241914a9677..722dd7db6bdf 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>> @@ -18,22 +18,6 @@
>>>>   #define IDLE_TIMEOUT    (66 - 16/2)
>>>> -/**
>>>> - * Encoder functions and data types
>>>> - * @intfs:    Interfaces this encoder is using, INTF_MODE_NONE if 
>>>> unused
>>>> - */
>>>> -struct dpu_encoder_hw_resources {
>>>> -    enum dpu_intf_mode intfs[INTF_MAX];
>>>> -};
>>>> -
>>>> -/**
>>>> - * dpu_encoder_get_hw_resources - Populate table of required 
>>>> hardware resources
>>>> - * @encoder:    encoder pointer
>>>> - * @hw_res:    resource table to populate with encoder required 
>>>> resources
>>>> - */
>>>> -void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
>>>> -                  struct dpu_encoder_hw_resources *hw_res);
>>>> -
>>>>   /**
>>>>    * dpu_encoder_assign_crtc - Link the encoder to the crtc it's 
>>>> assigned to
>>>>    * @encoder:    encoder pointer
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> index e7270eb6b84b..42febfce79c7 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> @@ -91,9 +91,6 @@ struct dpu_encoder_virt_ops {
>>>>    * @disable:            DRM Call. Disable mode.
>>>>    * @atomic_check:        DRM Call. Atomic check new DRM state.
>>>>    * @destroy:            DRM Call. Destroy and release resources.
>>>> - * @get_hw_resources:        Populate the structure with the hardware
>>>> - *                resources that this phys_enc is using.
>>>> - *                Expect no overlap between phys_encs.
>>>>    * @control_vblank_irq        Register/Deregister for VBLANK IRQ
>>>>    * @wait_for_commit_done:    Wait for hardware to have flushed the
>>>>    *                current pending frames to hardware
>>>> @@ -129,8 +126,6 @@ struct dpu_encoder_phys_ops {
>>>>                   struct drm_crtc_state *crtc_state,
>>>>                   struct drm_connector_state *conn_state);
>>>>       void (*destroy)(struct dpu_encoder_phys *encoder);
>>>> -    void (*get_hw_resources)(struct dpu_encoder_phys *encoder,
>>>> -                 struct dpu_encoder_hw_resources *hw_res);
>>>>       int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool 
>>>> enable);
>>>>       int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
>>>>       int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> index 34a6940d12c5..7d2beea9cc4e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> @@ -534,13 +534,6 @@ static void dpu_encoder_phys_cmd_destroy(struct 
>>>> dpu_encoder_phys *phys_enc)
>>>>       kfree(cmd_enc);
>>>>   }
>>>> -static void dpu_encoder_phys_cmd_get_hw_resources(
>>>> -        struct dpu_encoder_phys *phys_enc,
>>>> -        struct dpu_encoder_hw_resources *hw_res)
>>>> -{
>>>> -    hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_CMD;
>>>> -}
>>>> -
>>>>   static void dpu_encoder_phys_cmd_prepare_for_kickoff(
>>>>           struct dpu_encoder_phys *phys_enc)
>>>>   {
>>>> @@ -736,7 +729,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>>>>       ops->enable = dpu_encoder_phys_cmd_enable;
>>>>       ops->disable = dpu_encoder_phys_cmd_disable;
>>>>       ops->destroy = dpu_encoder_phys_cmd_destroy;
>>>> -    ops->get_hw_resources = dpu_encoder_phys_cmd_get_hw_resources;
>>>>       ops->control_vblank_irq = 
>>>> dpu_encoder_phys_cmd_control_vblank_irq;
>>>>       ops->wait_for_commit_done = 
>>>> dpu_encoder_phys_cmd_wait_for_commit_done;
>>>>       ops->prepare_for_kickoff = 
>>>> dpu_encoder_phys_cmd_prepare_for_kickoff;
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> index ddd9d89cd456..db6a9b896e42 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> @@ -465,13 +465,6 @@ static void dpu_encoder_phys_vid_destroy(struct 
>>>> dpu_encoder_phys *phys_enc)
>>>>       kfree(phys_enc);
>>>>   }
>>>> -static void dpu_encoder_phys_vid_get_hw_resources(
>>>> -        struct dpu_encoder_phys *phys_enc,
>>>> -        struct dpu_encoder_hw_resources *hw_res)
>>>> -{
>>>> -    hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_VIDEO;
>>>> -}
>>>> -
>>>>   static int dpu_encoder_phys_vid_wait_for_vblank(
>>>>           struct dpu_encoder_phys *phys_enc)
>>>>   {
>>>> @@ -680,7 +673,6 @@ static void dpu_encoder_phys_vid_init_ops(struct 
>>>> dpu_encoder_phys_ops *ops)
>>>>       ops->enable = dpu_encoder_phys_vid_enable;
>>>>       ops->disable = dpu_encoder_phys_vid_disable;
>>>>       ops->destroy = dpu_encoder_phys_vid_destroy;
>>>> -    ops->get_hw_resources = dpu_encoder_phys_vid_get_hw_resources;
>>>>       ops->control_vblank_irq = 
>>>> dpu_encoder_phys_vid_control_vblank_irq;
>>>>       ops->wait_for_commit_done = 
>>>> dpu_encoder_phys_vid_wait_for_commit_done;
>>>>       ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>> index 2d385b4b7f5e..3f518c809e33 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>> @@ -144,7 +144,6 @@ struct dpu_global_state {
>>>>       uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
>>>>       uint32_t mixer_to_enc_id[LM_MAX - LM_0];
>>>>       uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>>>> -    uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>>>>       uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
>>>>   };
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> index 63ed0d7df848..8df21a46308e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>> @@ -28,7 +28,6 @@ static inline bool reserved_by_other(uint32_t 
>>>> *res_map, int idx,
>>>>    */
>>>>   struct dpu_rm_requirements {
>>>>       struct msm_display_topology topology;
>>>> -    struct dpu_encoder_hw_resources hw_res;
>>>>   };
>>>>   int dpu_rm_destroy(struct dpu_rm *rm)
>>>> @@ -448,54 +447,6 @@ static int _dpu_rm_reserve_ctls(
>>>>       return 0;
>>>>   }
>>>> -static int _dpu_rm_reserve_intf(
>>>> -        struct dpu_rm *rm,
>>>> -        struct dpu_global_state *global_state,
>>>> -        uint32_t enc_id,
>>>> -        uint32_t id)
>>>> -{
>>>> -    int idx = id - INTF_0;
>>>> -
>>>> -    if (idx < 0 || idx >= ARRAY_SIZE(rm->intf_blks)) {
>>>> -        DPU_ERROR("invalid intf id: %d", id);
>>>> -        return -EINVAL;
>>>> -    }
>>>> -
>>>> -    if (!rm->intf_blks[idx]) {
>>>> -        DPU_ERROR("couldn't find intf id %d\n", id);
>>>> -        return -EINVAL;
>>>> -    }
>>>> -
>>>> -    if (reserved_by_other(global_state->intf_to_enc_id, idx, 
>>>> enc_id)) {
>>>> -        DPU_ERROR("intf id %d already reserved\n", id);
>>>> -        return -ENAVAIL;
>>>> -    }
>>>> -
>>>> -    global_state->intf_to_enc_id[idx] = enc_id;
>>>> -    return 0;
>>>> -}
>>>> -
>>>> -static int _dpu_rm_reserve_intf_related_hw(
>>>> -        struct dpu_rm *rm,
>>>> -        struct dpu_global_state *global_state,
>>>> -        uint32_t enc_id,
>>>> -        struct dpu_encoder_hw_resources *hw_res)
>>>> -{
>>>> -    int i, ret = 0;
>>>> -    u32 id;
>>>> -
>>>> -    for (i = 0; i < ARRAY_SIZE(hw_res->intfs); i++) {
>>>> -        if (hw_res->intfs[i] == INTF_MODE_NONE)
>>>> -            continue;
>>>> -        id = i + INTF_0;
>>>> -        ret = _dpu_rm_reserve_intf(rm, global_state, enc_id, id);
>>>> -        if (ret)
>>>> -            return ret;
>>>> -    }
>>>> -
>>>> -    return ret;
>>>> -}
>>>> -
>>>>   static int _dpu_rm_make_reservation(
>>>>           struct dpu_rm *rm,
>>>>           struct dpu_global_state *global_state,
>>>> @@ -517,11 +468,6 @@ static int _dpu_rm_make_reservation(
>>>>           return ret;
>>>>       }
>>>> -    ret = _dpu_rm_reserve_intf_related_hw(rm, global_state, 
>>>> enc->base.id,
>>>> -                &reqs->hw_res);
>>>> -    if (ret)
>>>> -        return ret;
>>>> -
>>>>       return ret;
>>>>   }
>>>> @@ -530,8 +476,6 @@ static int _dpu_rm_populate_requirements(
>>>>           struct dpu_rm_requirements *reqs,
>>>>           struct msm_display_topology req_topology)
>>>>   {
>>>> -    dpu_encoder_get_hw_resources(enc, &reqs->hw_res);
>>>> -
>>>>       reqs->topology = req_topology;
>>>>       DRM_DEBUG_KMS("num_lm: %d num_enc: %d num_intf: %d\n",
>>>> @@ -561,8 +505,6 @@ void dpu_rm_release(struct dpu_global_state 
>>>> *global_state,
>>>>           ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
>>>>       _dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
>>>>           ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>>>> -    _dpu_rm_clear_mapping(global_state->intf_to_enc_id,
>>>> -        ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
>>>>   }
>>>>   int dpu_rm_reserve(
>>>> @@ -626,11 +568,6 @@ int dpu_rm_get_assigned_resources(struct dpu_rm 
>>>> *rm,
>>>>           hw_to_enc_id = global_state->ctl_to_enc_id;
>>>>           max_blks = ARRAY_SIZE(rm->ctl_blks);
>>>>           break;
>>>> -    case DPU_HW_BLK_INTF:
>>>> -        hw_blks = rm->intf_blks;
>>>> -        hw_to_enc_id = global_state->intf_to_enc_id;
>>>> -        max_blks = ARRAY_SIZE(rm->intf_blks);
>>>> -        break;
>>>>       case DPU_HW_BLK_DSPP:
>>>>           hw_blks = rm->dspp_blks;
>>>>           hw_to_enc_id = global_state->dspp_to_enc_id;
>>>> @@ -656,3 +593,8 @@ int dpu_rm_get_assigned_resources(struct dpu_rm 
>>>> *rm,
>>>>       return num_blks;
>>>>   }
>>>> +
>>>> +struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum 
>>>> dpu_intf intf_idx)
>>>> +{
>>>> +    return to_dpu_hw_intf(rm->intf_blks[intf_idx - INTF_0]);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>> index 0f27759211b5..ee50f6651b6e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>>> @@ -84,5 +84,13 @@ void dpu_rm_release(struct dpu_global_state 
>>>> *global_state,
>>>>   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>>>>       struct dpu_global_state *global_state, uint32_t enc_id,
>>>>       enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int 
>>>> blks_size);
>>>> +
>>>> +/**
>>>> + * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given 
>>>> it's index.
>>>> + * @rm: DPU Resource Manager handle
>>>> + * @intf_idx: INTF's index
>>>> + */
>>>> +struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum 
>>>> dpu_intf intf_idx);
>>>> +
>>>>   #endif /* __DPU_RM_H__ */
>>
>>


-- 
With best wishes
Dmitry
