Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78F653728
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E9410E48E;
	Wed, 21 Dec 2022 19:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C33710E491
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 19:43:50 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id y4so16694836ljc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 11:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kYmaas5EgsqwB1HZHnQkYwwmJtIimjHn5rSwR1jMRh0=;
 b=v6SpFvK9pqLxtQJZSExisnllyUO5wL73hlJENBwKhFmAVeWsDZmMrAOssuVNLLXZPP
 a/EoWYwqC8hZyl6twcKu42TJH/hdDVeruuwKIk2mAcoVrBArxzardjkjf9uk2G/Xf+VV
 HcvU11Pou5FtThGqIXJ7vRAM1JAJNABhC8J5+4cRss1hPzukvKw0ZN4hJBRF9xRzLKiu
 Gtf/zc3tKlKVdGq8bd3IVtedrHdpr+fwNk8Wjc93zAnyTL1J2hYYKLs2qHx6SL7PGVjo
 2Wh5E1UfbKuzDZ+l6ybAaLBio+P65xEfZBPz0agfYoOYz/Uh+Tq+p/1IsBklWSwJl63Q
 wh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kYmaas5EgsqwB1HZHnQkYwwmJtIimjHn5rSwR1jMRh0=;
 b=A09YxTLB/HVAKGLhNiLCVPZm6cdXdc1FucgX9kw5dIxnD3ssr0e3Bm/YyNm2eWpdH/
 IDLnFIaE3mtvv51DhzKZA7SkX3v7VtyloHfpbga2y7+XdzSs7bOU7Mu6sxSj5q3zYc6x
 1R+dxgX4czGp/4NCBDcQG59nkP7YFxXqSU0FuHstMaYCButhIscoABxpCrzMBhEW2F/x
 MK9X1n+fOW8e9zK+YmOfRNFfFDNu72ZtLIeANh5O7x4gApGvWviNzlpd7QuxsAKbbd9y
 or2kpwr5hQ9jbYqj/YBTYkPQyE6eiDZBvRw251iGQfB3pMo3/06/ws+xHFkn37b6lzHU
 LROg==
X-Gm-Message-State: AFqh2koLmFex1bSR2B1lDd0wyCqsi2nTqt0ecmA85ufg6gD9nDjdJEUi
 O6aSLON8WTyFXqeOBS0ERLdUTQ==
X-Google-Smtp-Source: AMrXdXvHM+AHzDjoRaw3LDYEcNpdxHutKCs+iwgoETz5JMAamSxV72aBEHSOtLDaXf47nSnSHLlFnw==
X-Received: by 2002:a2e:3303:0:b0:27b:5a9b:a3c7 with SMTP id
 d3-20020a2e3303000000b0027b5a9ba3c7mr866009ljc.50.1671651828562; 
 Wed, 21 Dec 2022 11:43:48 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a2ea23a000000b0027f94a09cb4sm501415ljm.135.2022.12.21.11.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 11:43:47 -0800 (PST)
Message-ID: <87837483-93eb-823a-508a-4e163f969de0@linaro.org>
Date: Wed, 21 Dec 2022 21:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and get
 crtc from connector state instead of dpu_enc
Content-Language: en-GB
To: Vinod Polimera <vpolimer@qti.qualcomm.com>,
 "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1671012352-1825-1-git-send-email-quic_vpolimer@quicinc.com>
 <1671012352-1825-2-git-send-email-quic_vpolimer@quicinc.com>
 <7ad7654a-b0a0-c08a-d111-cd34d38c36e0@linaro.org>
 <BN0PR02MB8173B06FA578D6BC22AC6424E4EB9@BN0PR02MB8173.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB8173B06FA578D6BC22AC6424E4EB9@BN0PR02MB8173.namprd02.prod.outlook.com>
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/12/2022 16:10, Vinod Polimera wrote:
> 
> 
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Wednesday, December 14, 2022 9:05 PM
>> To: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; dri-
>> devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org; robdclark@gmail.com;
>> dianders@chromium.org; swboyd@chromium.org; Kalyan Thota (QUIC)
>> <quic_kalyant@quicinc.com>; Kuogee Hsieh (QUIC)
>> <quic_khsieh@quicinc.com>; Vishnuvardhan Prodduturi (QUIC)
>> <quic_vproddut@quicinc.com>; Bjorn Andersson (QUIC)
>> <quic_bjorande@quicinc.com>; Aravind Venkateswaran (QUIC)
>> <quic_aravindh@quicinc.com>; Abhinav Kumar (QUIC)
>> <quic_abhinavk@quicinc.com>; Sankeerth Billakanti (QUIC)
>> <quic_sbillaka@quicinc.com>
>> Subject: Re: [PATCH v9 01/15] drm/msm/disp/dpu: clear dpu_assign_crtc and
>> get crtc from connector state instead of dpu_enc
>>
>> WARNING: This email originated from outside of Qualcomm. Please be wary
>> of any links or attachments, and do not enable macros.
>>
>> On 14/12/2022 12:05, Vinod Polimera wrote:
>>> Update crtc retrieval from dpu_enc to dpu_enc connector state,
>>> since new links get set as part of the dpu enc virt mode set.
>>> The dpu_enc->crtc cache is no more needed, hence cleaning it as
>>> part of this change.
>>>
>>> This patch is dependent on the series:
>>> https://patchwork.freedesktop.org/series/110969/
>>>
>>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 +++++++++---------
>> -----------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 ------
>>>    3 files changed, 13 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index 3f72d38..289d51e 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -1029,7 +1029,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>>>                 */
>>>                if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
>>>                        release_bandwidth = true;
>>> -             dpu_encoder_assign_crtc(encoder, NULL);
>>>        }
>>>
>>>        /* wait for frame_event_done completion */
>>> @@ -1099,9 +1098,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>>>        trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
>>>        dpu_crtc->enabled = true;
>>>
>>> -     drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state-
>>> encoder_mask)
>>> -             dpu_encoder_assign_crtc(encoder, crtc);
>>> -
>>>        /* Enable/restore vblank irq handling */
>>>        drm_crtc_vblank_on(crtc);
>>>    }
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index a585036..b9b254d 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -132,11 +132,6 @@ enum dpu_enc_rc_states {
>>>     * @intfs_swapped:  Whether or not the phys_enc interfaces have been
>> swapped
>>>     *                  for partial update right-only cases, such as pingpong
>>>     *                  split where virtual pingpong does not generate IRQs
>>> - * @crtc:            Pointer to the currently assigned crtc. Normally you
>>> - *                   would use crtc->state->encoder_mask to determine the
>>> - *                   link between encoder/crtc. However in this case we need
>>> - *                   to track crtc in the disable() hook which is called
>>> - *                   _after_ encoder_mask is cleared.
>>>     * @connector:              If a mode is set, cached pointer to the active
>> connector
>>>     * @crtc_kickoff_cb:                Callback into CRTC that will flush & start
>>>     *                          all CTL paths
>>> @@ -181,7 +176,6 @@ struct dpu_encoder_virt {
>>>
>>>        bool intfs_swapped;
>>>
>>> -     struct drm_crtc *crtc;
>>>        struct drm_connector *connector;
>>>
>>>        struct dentry *debugfs_root;
>>> @@ -1317,7 +1311,7 @@ static void dpu_encoder_vblank_callback(struct
>> drm_encoder *drm_enc,
>>>                struct dpu_encoder_phys *phy_enc)
>>>    {
>>>        struct dpu_encoder_virt *dpu_enc = NULL;
>>> -     unsigned long lock_flags;
>>> +     struct drm_crtc *crtc;
>>>
>>>        if (!drm_enc || !phy_enc)
>>>                return;
>>> @@ -1325,12 +1319,13 @@ static void dpu_encoder_vblank_callback(struct
>> drm_encoder *drm_enc,
>>>        DPU_ATRACE_BEGIN("encoder_vblank_callback");
>>>        dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>
>>> -     atomic_inc(&phy_enc->vsync_cnt);
>>> +     if (!dpu_enc->connector || !dpu_enc->connector->state ||
>>> +         !dpu_enc->connector->state->crtc)
>>> +             return;
>>>
>>> -     spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
>>> -     if (dpu_enc->crtc)
>>> -             dpu_crtc_vblank_callback(dpu_enc->crtc);
>>> -     spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>>> +     atomic_inc(&phy_enc->vsync_cnt);
>>> +     crtc = dpu_enc->connector->state->crtc;
>>> +     dpu_crtc_vblank_callback(crtc);
>>>
>>>        DPU_ATRACE_END("encoder_vblank_callback");
>>>    }
>>> @@ -1353,33 +1348,22 @@ static void
>> dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
>>>        DPU_ATRACE_END("encoder_underrun_callback");
>>>    }
>>>
>>> -void dpu_encoder_assign_crtc(struct drm_encoder *drm_enc, struct
>> drm_crtc *crtc)
>>> -{
>>> -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> -     unsigned long lock_flags;
>>> -
>>> -     spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
>>> -     /* crtc should always be cleared before re-assigning */
>>> -     WARN_ON(crtc && dpu_enc->crtc);
>>> -     dpu_enc->crtc = crtc;
>>> -     spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>>> -}
>>> -
>>>    void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder
>> *drm_enc,
>>>                                        struct drm_crtc *crtc, bool enable)
>>>    {
>>>        struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> -     unsigned long lock_flags;
>>> +     struct drm_crtc *new_crtc;
>>>        int i;
>>>
>>>        trace_dpu_enc_vblank_cb(DRMID(drm_enc), enable);
>>>
>>> -     spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
>>> -     if (dpu_enc->crtc != crtc) {
>>> -             spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>>> +     if (!dpu_enc->connector || !dpu_enc->connector->state)
>>> +             return;
>>> +
>>> +     new_crtc = dpu_enc->connector->state->crtc;
>>> +     if (!new_crtc || new_crtc != crtc) {
>>
>> I don't like going through all the pointers and states without locks.
>> The connector->state can potentially check. So, I'd propose even simpler
>> solution: just store the crtc in the dpu_enc at the creation time. Then
>> you can use the rest of the current dpu_enc->crtc as expected.
> 
> Can i do as below.
> After encoder to crtc is pinned, i can update dpu_encoder structure that is attached with drm_enc with the crtc created during drm_obj_init
> 
> @@ -816,6 +816,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>                  }
>                  priv->crtcs[priv->num_crtcs++] = crtc;
>                  encoder->possible_crtcs = 1 << drm_crtc_index(crtc);
>                + dpu_encoder_assign_crtc(encoder, crtc);
>                  i++;
>          }

Yes.

>>
>>>                return;
>>>        }
>>> -     spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>>>
>>>        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>                struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> index 7f3d823..eb9fc7c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>> @@ -40,14 +40,6 @@ struct msm_display_info {
>>>    };
>>>
>>>    /**
>>> - * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
>>> - * @encoder: encoder pointer
>>> - * @crtc:    crtc pointer
>>> - */
>>> -void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
>>> -                          struct drm_crtc *crtc);
>>> -
>>> -/**
>>>     * dpu_encoder_toggle_vblank_for_crtc - Toggles vblank interrupts on or
>> off if
>>>     *  the encoder is assigned to the given crtc
>>>     * @encoder:        encoder pointer
>>
>> --
>> With best wishes
>> Dmitry
> 

-- 
With best wishes
Dmitry

