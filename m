Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56114714A6F
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A396810E28A;
	Mon, 29 May 2023 13:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F0710E0F5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:34:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2af2e908163so35272961fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685367248; x=1687959248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DUA07q7mYkXN8wVPChZecILFUwJ1RMa5CnZ3abb0nMY=;
 b=pkW7Z1cVHEOnlVLJkBjNzjkkiO8NM2vYMLg6yPxEdMZ2a07USLAPzWdhHOB5ViPxJs
 TZTkzfHOA6Nd8C9lsl7ldEAWItXSrez20w7NBPuJ+jjjdgAD6OCqoSP/2HGemsEenIoV
 84kGCeEAAGsLW9TilZsnBUf1CVYKxcl6lNSSsgy+A1vPyw7uRrmk3a8zKsfVfeKpCjU4
 YM3I1qjSzuUNl+hcZ+nLIqAc62tuJSGaaKwfvRxTuYI5AR2MkbLTSNdQ37r+qEPUjXhn
 AJdqqJUcI7AMDVk4VlFrnSiKCVD43MaykDtFwJbScMgPLoCmpoz4B9EwLBTl9e1XTBlz
 C9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685367248; x=1687959248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DUA07q7mYkXN8wVPChZecILFUwJ1RMa5CnZ3abb0nMY=;
 b=kbb89txuxuGD/6P6N03MBw0bMwj/0pyLdqSLfuiJPdBn6P0yTprPG7gfBZ5UIogc8i
 Ht9JAjkwwK789b8HnAZB4BdfEgk7/gB6i0QUbZt5bl/WSIojsVlqyNyyJRLQ5f0cJhSP
 3L7kHY8/+EYrpTkMckxMMtmqScH2C7xgXaEsP9XdawCrPetboswmL6IA6oE3ZLbzKbcO
 LBmSl6VZsp6D685oYgEZUp0OZqdSAas8F9PVUiS8+tu8bbk7fzJYYW/dO9XDbgKcpKEH
 QTarYeJR2uMzybnUXn11j9xwAb9FSLKta9usUlJK0ncoGFXAvuOgBKcG3Ovx+KXCN2Ee
 FOyQ==
X-Gm-Message-State: AC+VfDwWxPRid+O2lRvBO0xSuxC15FpE4Mt5CDebsQb1+z6EUCu4JZ3B
 Ux+uLXAgM5P2mz7NfI0m6lKwtw==
X-Google-Smtp-Source: ACHHUZ4fjkUlyAONcCrJHEq5VFwORiOBYxD/b92R5rW/39PS7RVBLgtIWEXQkKEJ6aKOtUeVzkpq+g==
X-Received: by 2002:a2e:b6c2:0:b0:2ac:8486:e318 with SMTP id
 m2-20020a2eb6c2000000b002ac8486e318mr3473659ljo.35.1685367248247; 
 Mon, 29 May 2023 06:34:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a2e808a000000b002adc2fe3fc8sm2450984ljg.4.2023.05.29.06.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 06:34:07 -0700 (PDT)
Message-ID: <419972e3-3052-87ae-a471-5fcf0a01f7da@linaro.org>
Date: Mon, 29 May 2023 16:34:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/7] drm/msm/mdp5: Add MDP5 configuration for MSM8226
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-4-679f335d3d5b@z3ntu.xyz>
 <9858de8d-54ae-aa0c-35d8-fe8c1c8473b7@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9858de8d-54ae-aa0c-35d8-fe8c1c8473b7@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/05/2023 14:59, Konrad Dybcio wrote:
> 
> 
> On 29.05.2023 11:44, Luca Weiss wrote:
>> Add the required config for the v1.1 MDP5 found on MSM8226.
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 82 ++++++++++++++++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
>> index 2eec2d78f32a..694d54341337 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
>> @@ -103,6 +103,87 @@ static const struct mdp5_cfg_hw msm8x74v1_config = {
>>   	.max_clk = 200000000,
>>   };
>>   
>> +static const struct mdp5_cfg_hw msm8x26_config = {
> Luca, this patch looks good as-is (without diving into the values).
> 
> Dmitry, I see some things that we may improve here..
> 
> 1. Rename msm8xab to msm89ab or something, it's really inconsistent
>     with other drivers
> 
> 2. Some values seem very common / always constant.. perhaps we could
>     add some #defines like we do in DPU?

I really would not like to go the DPU way here. Maybe we can define the 
'full-featured' masks, while leaving the older hardware intact.

> 3. Can we add some magic defines to make flush_hw_mask non-cryptic?

Sounds like a good idea, especially since we have all the defines. I'll 
tend to it after landing 8226.

> 
> 4. We can probably use pointers in data structs and deduplicate identical
>     blocks!

Let's see.

> 
> Konrad
>> +	.name = "msm8x26",
>> +	.mdp = {
>> +		.count = 1,
>> +		.caps = MDP_CAP_SMP |
>> +			0,
>> +	},
>> +	.smp = {
>> +		.mmb_count = 7,
>> +		.mmb_size = 4096,
>> +		.clients = {
>> +			[SSPP_VIG0] =  1,
>> +			[SSPP_DMA0] = 4,
>> +			[SSPP_RGB0] = 7,
>> +		},
>> +	},
>> +	.ctl = {
>> +		.count = 2,
>> +		.base = { 0x00500, 0x00600 },
>> +		.flush_hw_mask = 0x0003ffff,
>> +	},
>> +	.pipe_vig = {
>> +		.count = 1,
>> +		.base = { 0x01100 },
>> +		.caps = MDP_PIPE_CAP_HFLIP |
>> +			MDP_PIPE_CAP_VFLIP |
>> +			MDP_PIPE_CAP_SCALE |
>> +			MDP_PIPE_CAP_CSC   |
>> +			0,
>> +	},
>> +	.pipe_rgb = {
>> +		.count = 1,
>> +		.base = { 0x01d00 },
>> +		.caps = MDP_PIPE_CAP_HFLIP |
>> +			MDP_PIPE_CAP_VFLIP |
>> +			MDP_PIPE_CAP_SCALE |
>> +			0,
>> +	},
>> +	.pipe_dma = {
>> +		.count = 1,
>> +		.base = { 0x02900 },
>> +		.caps = MDP_PIPE_CAP_HFLIP |
>> +			MDP_PIPE_CAP_VFLIP |
>> +			0,
>> +	},
>> +	.lm = {
>> +		.count = 2,
>> +		.base = { 0x03100, 0x03d00 },
>> +		.instances = {
>> +				{ .id = 0, .pp = 0, .dspp = 0,
>> +				  .caps = MDP_LM_CAP_DISPLAY, },
>> +				{ .id = 1, .pp = -1, .dspp = -1,
>> +				  .caps = MDP_LM_CAP_WB },
>> +			     },
>> +		.nb_stages = 2,
>> +		.max_width = 2048,
>> +		.max_height = 0xFFFF,
>> +	},
>> +	.dspp = {
>> +		.count = 1,
>> +		.base = { 0x04500 },
>> +	},
>> +	.pp = {
>> +		.count = 1,
>> +		.base = { 0x21a00 },
>> +	},
>> +	.intf = {
>> +		.base = { 0x00000, 0x21200 },
>> +		.connect = {
>> +			[0] = INTF_DISABLED,
>> +			[1] = INTF_DSI,
>> +		},
>> +	},
>> +	.perf = {
>> +		.ab_inefficiency = 100,
>> +		.ib_inefficiency = 200,
>> +		.clk_inefficiency = 125
>> +	},
>> +	.max_clk = 200000000,
>> +};
>> +
>>   static const struct mdp5_cfg_hw msm8x74v2_config = {
>>   	.name = "msm8x74",
>>   	.mdp = {
>> @@ -1236,6 +1317,7 @@ static const struct mdp5_cfg_hw sdm660_config = {
>>   
>>   static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
>>   	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
>> +	{ .revision = 1, .config = { .hw = &msm8x26_config } },
>>   	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
>>   	{ .revision = 3, .config = { .hw = &apq8084_config } },
>>   	{ .revision = 6, .config = { .hw = &msm8x16_config } },
>>

-- 
With best wishes
Dmitry

