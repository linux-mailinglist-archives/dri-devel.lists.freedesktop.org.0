Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585D76F5F6E
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 21:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6707F10E34C;
	Wed,  3 May 2023 19:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A05910E34C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 19:51:11 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a7ac89b82dso58232831fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683143469; x=1685735469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1tCxqgTlmiK2G7G+ORn5kV305PO7Vqbz86eaQYSkvcs=;
 b=DUHUzCP5YT3cQDg7cXTgaGrue7QXMA2tTz7mrvsv+GBZjJ8qg4GfkMSV+xn0loNOkJ
 0Hw65/yygPdruSQKRfrJtBv6zAzJsso1g62Dy11Bi1Z5fmnCz9FAMXCuvUyDfvqa1WLy
 eRrgaHY3T7HjcFCoymZyJYf5QTfUlpUi+ISBbtrXc6wQRUFHuGEG7GRDmRwjtfpW6YVk
 NjaupmIK+4x41KL2XFMf2dN4TW0TlcgCQAaUXp8lT6jJB0Vackk8LpyD1XL3sGtsL6T/
 8LzpmFR9glGuQwnYDwm5dTYhlX5YDkROcmu4XGq6otvpkNqQ5PrPyvWCY8mIayPRb01I
 iYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683143469; x=1685735469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1tCxqgTlmiK2G7G+ORn5kV305PO7Vqbz86eaQYSkvcs=;
 b=FmTcYKrPiGGRHdQZIOMFlk9bnVbYELa8gwd1t+Ex7sAixxPbq+ZrwPAaNYGK6cNtQS
 hwHNSJi4hrT4NRPRZGc9lnKiHLTUEJgHc+hszjgmk0igv5dsizbim0TSjByh2QkfzBqT
 Jr3pimqLWIC2KKe4+xpbSsXc2l90X+e+6dqRReTM5Jbk2Bv+nwUTUMS/Bx/iJ5J5FfVJ
 fQujajpHmWWFVBzzXEIqCHAIk+D9EyO8yg2OPWG4zDKNfAhh/8+mOb6FxIBIEcxFSM3N
 gwVBxAvIN1YrESgfUfkajKFfj6Kdf/jiHaqGgnWC0kc2wz0k2H+kjgBMEhdUORutVYTg
 bdCg==
X-Gm-Message-State: AC+VfDxGMJ6nLTbmxMwDVu6cn6ZiyFXIKLADACAoeNsjyhHXX7cd5J0Y
 s0UyZW254mmjy0Hw/50MnQq8MA==
X-Google-Smtp-Source: ACHHUZ4jyeZqMJR9fYD6wE3w9e0cGVfq9FIbs9eUYU/anKkInfAp8yKkTd2B+mSscQpkxJ/a1ZKluA==
X-Received: by 2002:a2e:9cc2:0:b0:2ac:6858:45b9 with SMTP id
 g2-20020a2e9cc2000000b002ac685845b9mr311316ljj.20.1683143468907; 
 Wed, 03 May 2023 12:51:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a2e94d0000000b002aa40d705a5sm5781445ljh.11.2023.05.03.12.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 12:51:08 -0700 (PDT)
Message-ID: <3dddb676-750f-0bc7-7999-f8880c63931b@linaro.org>
Date: Wed, 3 May 2023 22:51:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] drm/msm/dpu: Enable compression for command mode
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-4-6bc6f03ae735@quicinc.com>
 <hxqxnfcydzyfrlvihmil3gecan6p6xyjw44gielu63ltgtqul7@xwvoprzofq6g>
 <d4b7a747-77a0-95eb-1201-c8b1c80defe3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d4b7a747-77a0-95eb-1201-c8b1c80defe3@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/05/2023 22:04, Jessica Zhang wrote:
> 
> 
> On 5/3/2023 12:28 AM, Marijn Suijten wrote:
>> On 2023-05-02 18:19:15, Jessica Zhang wrote:
>>> Add a dpu_hw_intf op to enable data compression.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 +++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 2 ++
>>>   3 files changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index 74470d068622..4321a1aba17f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>
>> Can we have INTF DCE on video-mode encoders as well?
> 
> Hi Marijn,
> 
> Currently, there's no way to validate DSC for video mode as I've only 
> made changes to support DSI for command mode. We are planning to post 
> changes to support DSC over DP, which will include changes for video mode.

If I remember correctly, HDK8350 panel should support DSC for both 
command and video modes.

> 
>>
>>> @@ -72,6 +72,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>                   phys_enc->hw_intf,
>>>                   true,
>>>                   phys_enc->hw_pp->idx);
>>> +
>>> +    if (phys_enc->dpu_kms->catalog->caps->has_data_compress &&
>>
>> As per my suggestion on patch 3/4, drop the flag and check above and
>> only check if the function is NULL (below).
> 
> Acked.
> 
>>
>>> +            phys_enc->hw_intf->ops.enable_compression)
>>> +        phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
>>>   }
>>>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int 
>>> irq_idx)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> index 671048a78801..4ce7ffdd7a05 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> @@ -64,10 +64,16 @@
>>>   #define INTF_CFG2_DATABUS_WIDEN    BIT(0)
>>>   #define INTF_CFG2_DATA_HCTL_EN    BIT(4)
>>
>> These should probably be reindented to match the below... And the rest
>> of the defines use spaces instead of tabs.
> 
> Fair point, though I think fixing the whitespace for these 2 macros 
> specifically might be better in a more relevant series.
> 
> With that being said, I'll change the spacing of the DATA_COMPRESS bit 
> to spaces instead of tabs.
> 
>>
>>> +#define INTF_CFG2_DCE_DATA_COMPRESS    BIT(12)
>>>   #define INTF_MISR_CTRL            0x180
>>>   #define INTF_MISR_SIGNATURE        0x184
>>
>> This does not seem to apply on top of:
>> https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-10-27ce1a5ab5c6@somainline.org/
> 
> Seems like I'm missing some patches from that series on my working 
> branch. Will rebase on top of the full series for the v2.
> 
>>
>>> +static inline void dpu_hw_intf_enable_compression(struct dpu_hw_intf 
>>> *ctx)
>>
>> Why inline?  This is used as a pointer callback.
> 
> Acked, will remove the inline.
> 
>>
>>> +{
>>> +    DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, INTF_CFG2_DCE_DATA_COMPRESS);
>>
>> dpu_hw_intf_setup_timing_engine() also programs INTF_CONFIG2.  Is it
>> double-buffered, or is that config **always** unused when DSI CMD mode
>> is used in conjunction with DSC/DCE?  Otherwise this should perhaps OR
>> the bitflag into the register, or write the whole thing at once in
>> dpu_hw_intf_setup_timing_engine()?
> 
> For command mode, INTF_CONFIG2 is unused aside from setting 
> DATA_COMPRESS for DSC.
> 
> Since setup_timing_engine() is only used for video mode, the 
> corresponding changes will be made in the DSC v1.2 for DP changes.

So, for command mode panels is this the only bit that should be set in 
INTF_CFG2?
-- 
With best wishes
Dmitry

