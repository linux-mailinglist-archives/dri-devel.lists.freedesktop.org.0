Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C076F21CB
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 03:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4DB10EE2D;
	Sat, 29 Apr 2023 01:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CBE10EE2D
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 01:04:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f8405b3dc1so196031f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 18:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682730282; x=1685322282;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hjf7cYIchQZ3mSIrHD7BYWO+Nbd2z209mj286WzO3DI=;
 b=EoDUs8g8T6+yyM27k6+JwT935WG6mEMrSIHN0Dt5NrgeNQZvODs1Grig+KvEXfeyoz
 kfKfTWy4l4DEATkQAr1hwMi0H/pr4TmQKvAMqOx42g8Og5SAok6kolLj82dOf9SATkAO
 qSdUk9tUzNj2ReFoXmUOstRzuZEZUmu6imwT4jcfrFoi4v3fMOC+YIhx4s7f//rKhkG4
 WWg7Jjq7I7o+zYtzNIJBThwIXFI/q0PF3VgOg1rpUaQZdUrUrAUS3ngzOvblvGfgmCBR
 v8iCEX9sMn7MdGZidgPG1s3q5xN1N2ELawCD9d3EpdEHDr+23+bkFbJAOpCnVJIqqfG8
 FcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682730282; x=1685322282;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hjf7cYIchQZ3mSIrHD7BYWO+Nbd2z209mj286WzO3DI=;
 b=kaA26V48Ix8RGrArZb86tnJQS60/18TJfWceL5yOnKU1bB8+/WJuzWenyIXNlHnJGf
 qgj1Hbb4F/VlE/muiemkYl6Wj+9E5DyOD1HslAha1pIkfK+JYuuxjFFChuVafBer2/70
 pHhUpD+HyoFiIAmHMOpsVQisJtugueuZ06n7HlJHjXx4qYzRC1xqsbVS+lg369uPyg7b
 Kqnf/bn0u5x7WooUGN1YqCnqCLilO2IBOK+tYYncdN+hQO6osy/aJVtX02VJr8Rop2wd
 sVWjwFDw8xm9vWW9WiPHljenw8fU9IrImuXOWh5H+WokifLlj1kMsEwC7yHaYV8CPa/L
 DDGA==
X-Gm-Message-State: AC+VfDwW5zq/s3daEgA+3Ave3pQgWW1IL0+NuG8vGB/26YxJOOxuuUiQ
 ZkbmYHHUFwVoW8cs5a9lhFSUVsWs2eQ3Kd4Go3oZVw==
X-Google-Smtp-Source: ACHHUZ4iNmmbOeqLwjxTObqip8317uX3EUbieuKcQ2uqMWW87xKOdNIZpwKy9JyUpWaCsjxEaC9nQQ==
X-Received: by 2002:adf:ef8f:0:b0:2f8:e190:e719 with SMTP id
 d15-20020adfef8f000000b002f8e190e719mr5178289wro.65.1682730282039; 
 Fri, 28 Apr 2023 18:04:42 -0700 (PDT)
Received: from [10.5.40.109] ([212.140.138.206])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a5d6dc9000000b00304adbeeabbsm5603442wrz.99.2023.04.28.18.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 18:04:41 -0700 (PDT)
Message-ID: <9da0d71c-209e-f1fd-97c8-ef7b36c7e12b@linaro.org>
Date: Sat, 29 Apr 2023 04:04:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 4/7] drm/msm/dpu: add dsc blocks for
 remaining chipsets in catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <1682725511-18185-5-git-send-email-quic_khsieh@quicinc.com>
 <1ef1388d-4dc3-273d-3ba6-10614ce6426c@linaro.org>
 <d25d506a-4d56-e16e-ca58-7bc96f2941a5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d25d506a-4d56-e16e-ca58-7bc96f2941a5@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/04/2023 04:03, Abhinav Kumar wrote:
> 
> 
> On 4/28/2023 5:35 PM, Dmitry Baryshkov wrote:
>> On 29/04/2023 02:45, Kuogee Hsieh wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> In preparation of calling ping-pong DSC related functions only
>>> for chipsets which have such a design add the dsc blocks for the
>>> chipsets for which DSC is present but was not added in the catalog.
>>
>> Why/how is it prearing us for such calling?
>>
>> The change itself LGTM.
> 
> The next change adds DPU_PINGPONG_DSC feature flag to chipsets where it 
> is supported. But when I checked there were many chipsets where DSC is 
> present but were not added in catalog.
> 
> Without doing that, the next change was originally adding 0 to the 
> feature flags of those chipsets which didnt seem right to me.
> 
> This seemed like the right way to do it to first add the DSC blocks for 
> those chipsets and add the feature flag to them in the next change.

I'd write something like 'for completeness, add DSC blocks for platforms 
which missed them'.

> 
>>
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  7 +++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 11 
>>> +++++++++++
>>>   2 files changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> index 2b3ae84..17f821c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> @@ -126,6 +126,11 @@ static const struct dpu_pingpong_cfg 
>>> msm8998_pp[] = {
>>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>>   };
>>> +static const struct dpu_dsc_cfg msm8998_dsc[] = {
>>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>>> +};
>>> +
>>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>>>       DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
>>>            &msm8998_dspp_sblk),
>>> @@ -191,6 +196,8 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>>>       .dspp = msm8998_dspp,
>>>       .pingpong_count = ARRAY_SIZE(msm8998_pp),
>>>       .pingpong = msm8998_pp,
>>> +    .dsc_count = ARRAY_SIZE(msm8998_dsc),
>>> +    .dsc = msm8998_dsc,
>>>       .intf_count = ARRAY_SIZE(msm8998_intf),
>>>       .intf = msm8998_intf,
>>>       .vbif_count = ARRAY_SIZE(msm8998_vbif),
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> index e3bdfe7..5bb9882 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> @@ -142,6 +142,15 @@ static const struct dpu_merge_3d_cfg 
>>> sc8180x_merge_3d[] = {
>>>       MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>>>   };
>>> +static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +    DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
>>> +};
>>> +
>>>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>>>       INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, 
>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>>       INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, 
>>> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>>> @@ -192,6 +201,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>>>       .mixer = sc8180x_lm,
>>>       .pingpong_count = ARRAY_SIZE(sc8180x_pp),
>>>       .pingpong = sc8180x_pp,
>>> +    .dsc_count = ARRAY_SIZE(sc8180x_dsc),
>>> +    .dsc = sc8180x_dsc,
>>>       .merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
>>>       .merge_3d = sc8180x_merge_3d,
>>>       .intf_count = ARRAY_SIZE(sc8180x_intf),
>>

-- 
With best wishes
Dmitry

