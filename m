Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95D4398CF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB928982F;
	Mon, 25 Oct 2021 14:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3B18982F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:40:03 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u11so4303237lfs.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vSeuO2S8gO7fb4YHDdckKBWDpBHKOIZXH5IyvqBDscs=;
 b=NbLYQG39K0FdsjS9RKzD3ZCE5etPjF9ZJuU3CAWuoECVrJoNU3gOZFVUFMVg4L+qGR
 sSu61wghYmlxo5h0rHfG9xZVPV3TxIvb/c9VwtE0SwD8flLcuyMQHzw1nbgu0UT6dB4n
 ZM/aWeXjEO1rRgKahHRj9dyL1P2sTSG1g4kUTRuI1hjpaK3daPAYUXi90ioncsTWyKic
 Xkirje5t67542juH6Vx6xP/uRZ/1c0gPi62KBb08JECvLW+C3uyHwceHee9ba9ArxbtP
 n/85BgvAo3IUBB8ou6GSUVHR5z6lzpJ9MwjzlBga1Xt12GPAWRVkmYpn6t+2SbOWi5Co
 7+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vSeuO2S8gO7fb4YHDdckKBWDpBHKOIZXH5IyvqBDscs=;
 b=DHIFFoHr+J2Z7g04+dPRPZ1nfRJSRi2i5TQhUan8tIFGiz4qGLrKIr1zTaNnl0nQpc
 vo4qndfkKt0GHLNBXDKJ6foTTM2VOELFRU/eaZZSA7im5tLwVCyMxfr79iJIcSYT0RYx
 8E7fnIXvExn/X47C4Dt8lMwxmTw2pRAJc1MFWGrspQv4M7wEBo0u3IoS0G7QMb1G0Pi9
 C1r8CdyBGIYsDn7C8hQu4ADxQTOiPD3qzSDfKTHWmCJ4PZ3xBEGXtFJxMns/ve2w7WkI
 EmfiEW8qcvDxAJ0/fANWSffWVklRXMahoe5L/3/3K6aF+SJ7rU8v5EK54OO0Ypo8KDtM
 QbOQ==
X-Gm-Message-State: AOAM533SyKQoJhmR8KqMwFvXJR0ucO78uSCNMr3jgliNvqggz4Bli4vw
 OEfUIGYAkMkonFgavpd6ElSuJg==
X-Google-Smtp-Source: ABdhPJwMoHKxmIO0z8GiwRBmXliae+plyTHEsRE0U0V13b0GIscQKoNoVL7TetE2ghkxe5x+LmT0kg==
X-Received: by 2002:a05:6512:39ca:: with SMTP id
 k10mr6481347lfu.322.1635172802111; 
 Mon, 25 Oct 2021 07:40:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p2sm1659441lfa.258.2021.10.25.07.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:40:01 -0700 (PDT)
Subject: Re: [PATCH v2 06/11] drm/msm/disp/dpu1: Don't use DSC with mode_3d
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-7-vkoul@kernel.org>
 <11becace-7b44-6141-5a8b-1bd6d0673243@linaro.org>
 <35eb95c5-1c42-94d1-3f33-df029f753ab3@linaro.org> <YW+957ZKnbf1g/89@matsya>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e96d1368-fe7b-cf24-82c9-99783df44b0d@linaro.org>
Date: Mon, 25 Oct 2021 17:40:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YW+957ZKnbf1g/89@matsya>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/10/2021 09:57, Vinod Koul wrote:
> On 14-10-21, 16:50, Dmitry Baryshkov wrote:
>> On 14/10/2021 16:41, Dmitry Baryshkov wrote:
>>> On 07/10/2021 10:08, Vinod Koul wrote:
>>>> We cannot enable mode_3d when we are using the DSC. So pass
>>>> configuration to detect DSC is enabled and not enable mode_3d
>>>> when we are using DSC
>>>>
>>>> We add a helper dpu_encoder_helper_get_dsc_mode() to detect dsc
>>>> enabled and pass this to .setup_intf_cfg()
>>>>
>>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>>>> ---
>>>> Changes since
>>>> v1:
>>>>    - Move this patch from 7 to 6
>>>>    - Update the changelog
>>>>    - Make dsc as int and store the DSC indices
>>>>
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  5 +++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
>>>>    4 files changed, 18 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> index e7270eb6b84b..fca07ed03317 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> @@ -332,6 +332,17 @@ static inline enum dpu_3d_blend_mode
>>>> dpu_encoder_helper_get_3d_blend_mode(
>>>>        return BLEND_3D_NONE;
>>>>    }
>>>> +static inline bool dpu_encoder_helper_get_dsc_mode(struct
>>>> dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +    struct drm_encoder *drm_enc = phys_enc->parent;
>>>> +    struct msm_drm_private *priv = drm_enc->dev->dev_private;
>>>> +
>>>> +    if (priv->dsc)
>>>> +        return BIT(0) | BIT(1); /* Hardcoding for 2 DSC topology */
>>>
>>> Please use defined values here rater than just BIT().
>>
>> Ah, it's a list of DSC blocks used. So the function name is misleading (as
>> it's not a mode). I think we'd better pass DSC_n names here. What about
>> using an array for cfg->dsc?
> 
> Yeah I can do better names.
> 
>>
>>>
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    /**
>>>>     * dpu_encoder_helper_split_config - split display configuration
>>>> helper function
>>>>     *    This helper function may be used by physical encoders to
>>>> configure
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> index aa01698d6b25..8e5c0911734c 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> @@ -70,6 +70,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>>        intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>>>>        intf_cfg.stream_sel = cmd_enc->stream_sel;
>>>>        intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>>> +    intf_cfg.dsc = dpu_encoder_helper_get_dsc_mode(phys_enc);
>>>> +
>>>>        ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>>>    }
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>> index 64740ddb983e..3c79bd9c2fe5 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>>> @@ -118,7 +118,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct
>>>> dpu_hw_ctl *ctx)
>>>>        return ctx->pending_flush_mask;
>>>>    }
>>>> -static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>>> +static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>>>>    {
>>>>        if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>>>> @@ -519,7 +519,8 @@ static void dpu_hw_ctl_intf_cfg(struct
>>>> dpu_hw_ctl *ctx,
>>>>        intf_cfg |= (cfg->intf & 0xF) << 4;
>>>> -    if (cfg->mode_3d) {
>>>> +    /* In DSC we can't set merge, so check for dsc too */
>>>> +    if (cfg->mode_3d && !cfg->dsc) {
>>>
>>> The more I think about this hunk, the more I'm unsure about it.
>>> Downstream has the following topoligies defined:
>>>    * @SDE_RM_TOPOLOGY_DUALPIPE_3DMERGE_DSC: 2 LM, 2 PP, 3DMux, 1 DSC, 1
>>> INTF/WB
>>>    * @SDE_RM_TOPOLOGY_QUADPIPE_3DMERGE_DSC  4 LM, 4 PP, 3DMux, 3 DSC, 2 INTF
>>>
>>> While the latter is not supported on sdm845, the former one should be
>>> (by the hardware). So in the driver I think we should make sure that
>>> mode_3d does not get set rather than disallowing it here.
>>>
>>>>            intf_cfg |= BIT(19);
>>>>            intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>>>>        }
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>> index 806c171e5df2..5dfac5994bd4 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>> @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
>>>>     * @mode_3d:               3d mux configuration
>>>>     * @merge_3d:              3d merge block used
>>>>     * @intf_mode_sel:         Interface mode, cmd / vid
>>>> + * @dsc:                   DSC BIT masks
>>>>     * @stream_sel:            Stream selection for multi-stream interfaces
>>>>     */
>>>>    struct dpu_hw_intf_cfg {
>>>> @@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
>>>>        enum dpu_3d_blend_mode mode_3d;
>>>>        enum dpu_merge_3d merge_3d;
>>>>        enum dpu_ctl_mode_sel intf_mode_sel;
>>>> +    unsigned int dsc;
>>
>> I think this should be:
>> enum dpu_dsc dsc[MAX_DSCS];
>> unsigned int num_dsc;
> 
> hmmm, how do we go about getting the num_dsc value here.
> dpu_encoder_phys does not know about that..


dpu_encoder_get_topology() can decide whether to use DSC or not and then 
set num_dsc. For now it will always set 2 if we are using DSC at all, 
but let's keep the decision in a single place rather than having it 
scattered all over the driver.


-- 
With best wishes
Dmitry
