Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E4700F12
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 20:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649ED10E196;
	Fri, 12 May 2023 18:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C933310E196
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 18:50:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4ec8149907aso12040687e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683917439; x=1686509439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WuPelm9ba0Xh/ndmXQX20gIsRhFbM+3g133ZmY3Lhg0=;
 b=Enlk2Rc5iR/dP1dGoqIKkBy+snUvph8LfeT51DEJjZCkVK6SgBwrGYQCBWsfN0HLGH
 InAIsrU6w/aapZvB4TfpWicXIptFQBGYu/ZjGQaz2nhV0z4n5MB0vlEWd3beRXKFvrcY
 idTyVZBw+qZ+tD8o8H4iHPWBRG6ct+nXUuH6MDLUJ52c+zhrmmFCZgYTJmtByVJOwDzR
 aPyGcL7sYbvFmPeyvN3i++wmoPl7XWOqFPhkRYByT/E4i60YihnAY65+Rbrbj4nx2znU
 queQS6wqW+StPSiMbKo2NdhxQ0pCwFCHBiSkj2vWyoMyIMfkWCM61T27F9bGCHQ/s8kw
 dHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683917439; x=1686509439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WuPelm9ba0Xh/ndmXQX20gIsRhFbM+3g133ZmY3Lhg0=;
 b=iO8r9NGuQdMTi3ZKwiJcDAnqPc4yFeH5Ank3RAHXWM8QTXVOAAZIdf/8VF0MVifTma
 fl9pKWnyLe3c1R+fp/oIKv82YfF6xJOb5o7nh8X/rmLaeunNbhZWpcSkLRDzruXAX+mR
 9NNquLAaxWKmmVypsef0HcDhDelWVoPXCod6aniFc4GQdiR9XZbUO7w6SPPOHaA8DhQN
 b6MZ3Y6hHIIwGpmQChFTEWqlgu6ZQVuScFUpB4LUqyNCUwNYYJ+szfH4iDX3M+JZMX98
 92QpufmmVwhEbYQ2ooUhuSgHGBQ3Hv0spZ7Ye3E/Bjx2eCaQxP3OOXUNHZ1LTHK0uysk
 fUNQ==
X-Gm-Message-State: AC+VfDxAHV1SP5F5B6uDskcrn+/jgFaQ0rq5/n3wIwaEMej46SWCeQqW
 haofvnIwtg8zKOnbM7vI0j9Cny5tabO4VDUEov4=
X-Google-Smtp-Source: ACHHUZ5qix+AfKeOoptSwy0yXk92l+wgnvqFCSAy7TIzE2g53L4ZMCweRzU6C81TkLkrlVytUw2Jzw==
X-Received: by 2002:a05:6512:390f:b0:4ed:b048:b98a with SMTP id
 a15-20020a056512390f00b004edb048b98amr4280477lfu.6.1683917438922; 
 Fri, 12 May 2023 11:50:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05651204d000b004d8580b2470sm1559005lfq.225.2023.05.12.11.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 11:50:38 -0700 (PDT)
Message-ID: <e3579cea-1764-26ff-ba9d-6eb23a0aaef0@linaro.org>
Date: Fri, 12 May 2023 21:50:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 6/8] drm/msm/dpu: separate DSC flush update out of
 interface
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-7-git-send-email-quic_khsieh@quicinc.com>
 <91f63678-aade-2f42-1311-1bc706ebdc91@linaro.org>
 <5319b87a-9a4c-1786-9ea9-b9015ee56357@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5319b87a-9a4c-1786-9ea9-b9015ee56357@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2023 21:47, Abhinav Kumar wrote:
> 
> 
> On 5/12/2023 11:21 AM, Dmitry Baryshkov wrote:
>> On 12/05/2023 21:00, Kuogee Hsieh wrote:
>>> Current DSC flush update is piggyback inside dpu_hw_ctl_intf_cfg_v1().
>>> This patch separates DSC flush away from dpu_hw_ctl_intf_cfg_v1() by
>>> adding dpu_hw_ctl_update_pending_flush_dsc_v1() to handle both per
>>> DSC engine and DSC flush bits at same time to make it consistent with
>>> the location of flush programming of other dpu sub blocks.
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 
>>> ++++++++++++++++------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 10 ++++++++++
>>>   3 files changed, 38 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index ffa6f04..5cae70e 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -1834,12 +1834,18 @@ dpu_encoder_dsc_initial_line_calc(struct 
>>> drm_dsc_config *dsc,
>>>       return DIV_ROUND_UP(total_pixels, dsc->slice_width);
>>>   }
>>> -static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>>> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_encoder_virt *dpu_enc,
>>> +                     struct dpu_hw_dsc *hw_dsc,
>>>                        struct dpu_hw_pingpong *hw_pp,
>>>                        struct drm_dsc_config *dsc,
>>>                        u32 common_mode,
>>>                        u32 initial_lines)
>>>   {
>>> +    struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
>>> +    struct dpu_hw_ctl *ctl;
>>> +
>>> +    ctl = cur_master->hw_ctl;
>>
>> Just for my understanding: if we have a bonded DSI @ sdm845, should 
>> both flashes go to the master CTL or each flush should go to the 
>> corresponding CTL?
>>
> 
> Is this question for DSC or just general question about flush?
> 
> I dont see an explicit DSC flush needed in sdm845 at the ctl level.
> 
> If the question is about general flush involving two control paths, we 
> need to combine the flushes and they goto the master only. Please refer 
> to below part in sde_encoder.c
And this is because we have a single CTL to flush on sm8150+, isn't it?

> 
> 4243     /* for split flush, combine pending flush masks and send to 
> master */
> 4244     if (pending_flush.pending_flush_mask && sde_enc->cur_master) {
> 4245         ctl = sde_enc->cur_master->hw_ctl;
> 4246         if (config_changed && ctl->ops.reg_dma_flush)
> 4247             ctl->ops.reg_dma_flush(ctl, is_regdma_blocking);
> 4248         _sde_encoder_trigger_flush(&sde_enc->base, 
> sde_enc->cur_master,
> 4249                         &pending_flush,
> 4250                         config_changed);
> 4251     }


-- 
With best wishes
Dmitry

