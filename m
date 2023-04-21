Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97D6EB374
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 23:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147EF10EF16;
	Fri, 21 Apr 2023 21:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C0F10EF16
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 21:13:36 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec8148f73eso2160188e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 14:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682111611; x=1684703611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ubOyT9TJRKaTJoaYf6HTH0kpwv+rBME4zXrQlXkAL40=;
 b=kopZBqCBWh1l6X2KDttlezfAbwVFFrtSmBh4H5moZi6yqacdLQXhXTTiiySpKCrjTw
 CSgMJ5gogKFJJlWDHXvn6xBwjA9Yh66I9Pn0b1WhHedvXYKgPuopH/7SFx8E+rzaRr3g
 3lcvX39L3vm1mc6hdTX3INN5VeLgXfJFFN4xRwhgo6SJw3/VbX6JMo9KjwV19Xss1l1S
 xdInFjznkfSF2uxMWoEksDzkPVK7TBOfwHgV/zDQolNGSUuJYY1GYKqIsRDTPaInpNiG
 GL9qfyoFe+Bv/FpuR4MJBI6FCy3S+pRDRUfRVw8UU3E6hvIe4D108FYlBafTh5u5BqaS
 lC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682111611; x=1684703611;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ubOyT9TJRKaTJoaYf6HTH0kpwv+rBME4zXrQlXkAL40=;
 b=ApSbVVQ36tZ5JoXAeY8aE31+yevmmLfYUmj7ZrD5HSJxN4FQMO2vNGt8CUcRqr0cbv
 fYsTSjTmUolz4taLZsxNaU/W/enARA0lOP46G0ReoU5RMD3PR/0GWu3fJPSxexa0UJL2
 cwcmHAsMjbRBUbkfqjyNAPP3fGO3wQbl+0sU4GIAmE8cdjMuOQxucqhDsNO+Lps01v3J
 3r/V2Du+UeT5G4U9X9xaHBPbkTVLzXGHJtazrNSxHcfXqS5bUEP5lpFGG7rGXLDUkvkb
 ciYVZhRNQSgolIqQZsIyRe/N7L6R7wHsEu5yxAP7Wu++NuCtGv6n+UG7qKv4TZ+0LSlT
 BxLw==
X-Gm-Message-State: AAQBX9cgs/8TjTo/aoikf8Hdac07cxzMHvW34qm3oQZ3Ga7JdrzWRf+F
 9LsPpMrtc5AUUeBMH7+vNvKjKQ==
X-Google-Smtp-Source: AKy350bHCHluK2NFonfCBN5TQLpbAhkqlmggPb54iNcRzEFS3MXuqD8+sAkxjMui5MBO+xG4DuGazg==
X-Received: by 2002:ac2:5d25:0:b0:4d5:a689:7580 with SMTP id
 i5-20020ac25d25000000b004d5a6897580mr1598716lfb.47.1682111611389; 
 Fri, 21 Apr 2023 14:13:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h25-20020ac25979000000b004e9c8290512sm681169lfp.82.2023.04.21.14.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 14:13:30 -0700 (PDT)
Message-ID: <62df2f48-2553-72f0-43e4-9a5d4027ab81@linaro.org>
Date: Sat, 22 Apr 2023 00:13:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 4/5] drm/msm/dpu: calculate DSC encoder parameters
 dynamically
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-5-git-send-email-quic_khsieh@quicinc.com>
 <c8089d0f-c8cd-6a24-718f-682145d04f02@linaro.org>
 <95a37ba2-29b5-47b9-48df-1bd4e4c409c5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <95a37ba2-29b5-47b9-48df-1bd4e4c409c5@quicinc.com>
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/04/2023 00:07, Kuogee Hsieh wrote:
> 
> On 4/20/2023 5:27 PM, Dmitry Baryshkov wrote:
>> On 21/04/2023 02:25, Kuogee Hsieh wrote:
>>> During DSC preparation, add run time calculation to figure out what
>>> usage modes, split mode and merge mode, is going to be setup.
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 56 
>>> ++++++++++++++++-------------
>>>   1 file changed, 32 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 2fdacf1..5677728 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -529,17 +529,9 @@ void dpu_encoder_helper_split_config(
>>>   bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>>>   {
>>>       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> -    int i, intf_count = 0, num_dsc = 0;
>>> +    struct msm_display_topology *topology = &dpu_enc->topology;
>>>   -    for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
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
>>>     static void dpu_encoder_get_topology(
>>> @@ -1861,41 +1853,57 @@ static void dpu_encoder_prep_dsc(struct 
>>> dpu_encoder_virt *dpu_enc,
>>>       struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>>>       struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>>>       struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>>> +    struct msm_display_topology *topology = &dpu_enc->topology;
>>>       int this_frame_slices;
>>>       int intf_ip_w, enc_ip_w;
>>> -    int dsc_common_mode;
>>> +    int dsc_common_mode = 0;
>>>       int pic_width;
>>>       u32 initial_lines;
>>> +    int num_dsc, num_intf;
>>>       int i;
>>>         for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>>>           hw_pp[i] = dpu_enc->hw_pp[i];
>>>           hw_dsc[i] = dpu_enc->hw_dsc[i];
>>> -
>>> -        if (!hw_pp[i] || !hw_dsc[i]) {
>>> -            DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
>>> -            return;
>>> -        }
>>
> Why?
> 
> MAX_CHANNELS_PER_ENC == 2
> 
> This works for dsi since it use 2 dsc encoder.
> 
> Since DP only use one dsc encoder, this will cause it return at loop 2 
> without execute dpu_encoder_dsc_pipe_cfg().

Then the loop should go up to num_dsc rather than MAX_CHANNELS_PER_ENC

> 
>>
>>>       }
>>>   -    dsc_common_mode = 0;
>>> +    num_dsc = topology->num_dsc;
>>> +    num_intf = topology->num_intf;
>>> +
>>>       pic_width = dsc->pic_width;
>>>   -    dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
>>>       if (enc_master->intf_mode == INTF_MODE_VIDEO)
>>>           dsc_common_mode |= DSC_MODE_VIDEO;
>>>   +    /*
>>> +     * If this encoder is driving more than one DSC encoder, they
>>> +     * operate in tandem, same pic dimension needs to be used by
>>> +     * each of them.(pp-split is assumed to be not supported)
>>> +     *
>>> +     */
>>> +
>>>       this_frame_slices = pic_width / dsc->slice_width;
>>>       intf_ip_w = this_frame_slices * dsc->slice_width;
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
>>
>> So do you want to get enc_ip_w / 2 or enc_ip_w / num_intf / 2 here?
> enc_ip_w / num_intf / 2

But previously we had enc_ip_w = intf_ip_w / 2. Was it because of the 
assumption that num_intf = 1?

>>
>>> +    }
>>>   -    /*
>>> -     * dsc merge case: when using 2 encoders for the same stream,
>>> -     * no. of slices need to be same on both the encoders.
>>> -     */
>>> -    enc_ip_w = intf_ip_w / 2;
>>>       initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>>>   -    for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>>> +    for (i = 0; i < num_dsc; i++)
>>>           dpu_encoder_dsc_pipe_cfg(dpu_enc, hw_dsc[i], hw_pp[i], dsc,
>>>                       dsc_common_mode, initial_lines);
>>>   }
>>

-- 
With best wishes
Dmitry

