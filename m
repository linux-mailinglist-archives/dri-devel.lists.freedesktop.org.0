Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532176F221E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 03:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CAB10EE3B;
	Sat, 29 Apr 2023 01:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D42610E0B8
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 01:35:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so3234225e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 18:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682732141; x=1685324141;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oxRlt7xFBtroIE2klrBllvLJLQfgkFj7/E1EFBuveSs=;
 b=OwGnDdNkSUZrbP5R/E0/iv3d9+3hudriAg7vwXDig95tEGKmMyTCA6efi9YuE3PXXs
 /fFdMxziFmVkgE80HxQ73MEriLaT2fEgviSgUdz1FnECPh2X1WVOemzCUZapyl1JeFMN
 dHLoDktcG/0z2GJTIZVUGbCAFvKhJcF5hB2RfAz9K8HCW9L43UzJ9ZpUSsOIXjQcAMrB
 7TEtm4+ux6PpBsSfsPapIMebvJoP6uxgD7xgcUpBxzh7WO+trhKj7KPfVfRxkDPXvWrB
 5T56w9wWOr900CBxcPSUg3Rhj1jGxHFEiYsG8Nwxw0kG8vyOYjiuUhpdYf7JfYjNnu9l
 MmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682732141; x=1685324141;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oxRlt7xFBtroIE2klrBllvLJLQfgkFj7/E1EFBuveSs=;
 b=OXSiZdqHGB5hsJtkLn3iyt+KrR0mz6nAvCyPG6pSsQx6sORQA3VYttqB/78PW9F8AH
 ci+uIG0e6HVykwzXRPGWox5QDtZCQF1QPbuAIjhrwe0ekvPiBx6TGE3eEEu7m3Vu4lYk
 pS2BY/AwgS0lFcz/+lHXY9kyHVO85ehZqZ99I6L69qtMTCynfdfcJKExRqFwEnpSZucu
 aw8i1nKiqO5Gz5prZ0mhzHEI1mxyTi777btkJ27+/YZQIV0JE9WpBrY4vPzEG8ZIP2ch
 V2/LJ9QcQaaCrB3Zz7yuOPEsWZke5ZCDS9kaUvPIv0sqmF2eRD1lA4lff9Wgd9LLeDBA
 gu3g==
X-Gm-Message-State: AC+VfDyBhZYE0S7+ghAqgBVbXNJQ8/ge/SfNwA9qQ/efyuPy+kk6nREf
 JG/kswwGqRVwMibRZYMfy3/wgA==
X-Google-Smtp-Source: ACHHUZ6nVeyKUSGK2CwwUVUNM1Cfs2Oq/SHdoPsCwiM5ncvxYkxl4dzZzo5OIWJw5kH8gQmGUqF3Cg==
X-Received: by 2002:a05:600c:2242:b0:3eb:39e0:3530 with SMTP id
 a2-20020a05600c224200b003eb39e03530mr5033110wmm.41.1682732140896; 
 Fri, 28 Apr 2023 18:35:40 -0700 (PDT)
Received: from [10.6.148.94] ([212.140.138.218])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c000900b003f0aa490336sm29042322wmc.26.2023.04.28.18.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 18:35:40 -0700 (PDT)
Message-ID: <f4884e43-f21e-13a6-65f5-623c101cb823@linaro.org>
Date: Sat, 29 Apr 2023 04:35:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 7/7] drm/msm/dpu: calculate DSC encoder parameters
 dynamically
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-8-git-send-email-quic_khsieh@quicinc.com>
 <51edf131-8fe0-2187-a4ba-744cc0c81a99@linaro.org>
 <def3011f-d8e7-3090-47f2-ec13a650337e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <def3011f-d8e7-3090-47f2-ec13a650337e@quicinc.com>
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
Cc: marijn.suijten@somainline.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/04/2023 04:22, Abhinav Kumar wrote:
> 
> 
> On 4/28/2023 5:52 PM, Dmitry Baryshkov wrote:
>> On 29/04/2023 02:45, Kuogee Hsieh wrote:
>>> During DSC preparation, add run time calculation to figure out what
>>> usage modes, split mode and merge mode, is going to be setup.
>>
>> This patch doesn't determine the mode. It changes programming of DSC 
>> bits according to the mode being selected.
>>
> 
> The term mode is a bit confusing here but he is referring to 
> dsc_common_mode.

Yes, that's clear. The patch description is not correct.

> 
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 56 
>>> ++++++++++++++++-------------
>>>   1 file changed, 31 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 2fdacf1..3d18642 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -529,17 +529,9 @@ void dpu_encoder_helper_split_config(
>>>   bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>>>   {
>>>       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> -    int i, intf_count = 0, num_dsc = 0;
>>> +    struct msm_display_topology *topology = &dpu_enc->topology;
>>> -    for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>>> -        if (dpu_enc->phys_encs[i])
>>> -            intf_count++;
>>> -
>>> -    /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
>>> -    if (dpu_enc->dsc)
>>> -        num_dsc = 2;
>>> -
>>> -    return (num_dsc > 0) && (num_dsc > intf_count);
>>> +    return (topology->num_dsc > topology->num_intf);
>>>   }
>>>   static void dpu_encoder_get_topology(
>>> @@ -1861,41 +1853,55 @@ static void dpu_encoder_prep_dsc(struct 
>>> dpu_encoder_virt *dpu_enc,
>>>       struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>>>       struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>>>       struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>>> -    int this_frame_slices;
>>> +    struct msm_display_topology *topology = &dpu_enc->topology;
>>>       int intf_ip_w, enc_ip_w;
>>> -    int dsc_common_mode;
>>> -    int pic_width;
>>> +    int dsc_common_mode = 0;
>>
>> Please don't top-init variables unless required (or unless they are 
>> constant).
>>
>>>       u32 initial_lines;
>>> +    int num_dsc = topology->num_dsc;
>>> +    int num_intf = topology->num_intf;
>>>       int i;
>>> -    for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>>> +    for (i = 0; i < num_dsc; i++) {
>>>           hw_pp[i] = dpu_enc->hw_pp[i];
>>>           hw_dsc[i] = dpu_enc->hw_dsc[i];
>>>           if (!hw_pp[i] || !hw_dsc[i]) {
>>>               DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
>>>               return;
>>> -        }
>>> +        }
>>
>> What is the difference here?
>>
>>>       }
>>> -    dsc_common_mode = 0;
>>> -    pic_width = dsc->pic_width;
>>> +    intf_ip_w = dsc->pic_width;
>>> -    dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
>>>       if (enc_master->intf_mode == INTF_MODE_VIDEO)
>>>           dsc_common_mode |= DSC_MODE_VIDEO;
>>> -    this_frame_slices = pic_width / dsc->slice_width;
>>> -    intf_ip_w = this_frame_slices * dsc->slice_width;
>>> -
>>>       /*
>>> -     * dsc merge case: when using 2 encoders for the same stream,
>>> -     * no. of slices need to be same on both the encoders.
>>> +     * If this encoder is driving more than one DSC encoder, they
>>> +     * operate in tandem, same pic dimension needs to be used by
>>> +     * each of them.(pp-split is assumed to be not supported)
>>> +     *
>>
>> Extra empty line. Also the comment doesn't make sense here anymore. We 
>> already have comment for the division by two below.
>>
>>>        */
>>> -    enc_ip_w = intf_ip_w / 2;
>>> +    enc_ip_w = intf_ip_w;
>>> +
>>> +    intf_ip_w /= num_intf;
>>> +
>>> +    if (num_dsc > 1)
>>> +        dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
>>> +
>>> +    if (dpu_encoder_use_dsc_merge(&dpu_enc->base)) {
>>> +        dsc_common_mode |= DSC_MODE_MULTIPLEX;
>>> +        /*
>>> +         * in dsc merge case: when using 2 encoders for the same
>>> +         * stream, no. of slices need to be same on both the
>>> +         * encoders.
>>> +         */
>>> +        enc_ip_w = intf_ip_w / 2;
>>> +    }
>>> +
>>>       initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>>> -    for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>>> +    for (i = 0; i < num_dsc; i++)
>>>           dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
>>>                       dsc_common_mode, initial_lines);
>>>   }
>>

-- 
With best wishes
Dmitry

