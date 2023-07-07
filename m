Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E065174A8D9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 04:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89910E4EF;
	Fri,  7 Jul 2023 02:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C56210E063
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 02:20:00 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso1704907e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 19:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688696398; x=1691288398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tWbvWe+wSPpAfUuNVCuRaGwVFU2OOSKw8sDylC+/9ng=;
 b=vw4y9fB1R04uqObICIbb69PADoZ+3DDeXGN55GlLzH7uFxQY+cZSypMdOA+GX3BbZB
 QAMuaN7H9j/xyhtuzMQi7Vi5YVCJzgZpC38onAmDoqnGxNB5+unBSSOPdPCZdZQaIKoZ
 MQ1psFgz1B4JMV03yurACg/KBtTXD2lbsjBb56ZxY1cWrUx8JLIYFfE1Ge6pK/xj8dtx
 AF2ebNqyQB49MVCLyLO44PRCHj1Svgma/mjMWzpyDqhG0PQKpzCWi0ePzwGOHwGyWUbw
 QElOiQLJvTndEZ6g0QzlxaEJAjIrUQjeaZWCO0EqJHHaC8hBiROnFJZChr1cW9p6dFdQ
 hTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688696398; x=1691288398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tWbvWe+wSPpAfUuNVCuRaGwVFU2OOSKw8sDylC+/9ng=;
 b=EQfFlQlvkScVPtQclRQ8nyC28p0Rp2HTB7QP7+W32CbRZyDE7CbgVPuzWe0wwVYHAs
 cRAZ31+rLJ7ThBVSPUOWzoIY+ZFcoqjZqGaY0ndnP41XM69JyMW773RAyqkNNAVO+vLy
 +Q6ka+IyO3RAoI5lD4we7ty5tQAfBJM4u0l+jisxqkPmmmsblvzo3uEm0gMcjiWI03PJ
 rYLT/t0Z42j1fFJFwxKSOUYHVplno5KgyvliLlY/LQKRG127XMdvXbKb2JvTXl25TXyB
 aARzm3jddzBRGn4FVrbt7ZHe5K/GNJD7vNsUcD0rAC77VLwhbjXiVots5AbKUxvHtyyh
 c6Dg==
X-Gm-Message-State: ABy/qLYGo/Dks9NUnf+IdntoKrp8z8u0TOU4ODv2R4gwmfONJlV2J2Wi
 I3fQrhzr96zYUGy7d8Kgwv9AYg==
X-Google-Smtp-Source: APBJJlHk2zZh/rSPQ2vvGPduKoXp+HDbbEegqAUjUdE8Yj9pQfmDCdPP4rQ+d736yonYTnqVAXEaTg==
X-Received: by 2002:a05:6512:b8b:b0:4fb:bd93:b239 with SMTP id
 b11-20020a0565120b8b00b004fbbd93b239mr2874790lfv.13.1688696398511; 
 Thu, 06 Jul 2023 19:19:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l11-20020ac2430b000000b004fb99da37e3sm474865lfh.220.2023.07.06.19.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:19:58 -0700 (PDT)
Message-ID: <dc937077-91bd-8c4f-b220-82df11efd215@linaro.org>
Date: Fri, 7 Jul 2023 05:19:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 5/6] drm/msm/dpu: Refactor printing of main blocks in
 device core dump
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
 <20230622-devcoredump_patch-v4-5-e304ddbe9648@quicinc.com>
 <deb38d54-bf7f-f42a-8b61-f6c8f46370b0@linaro.org>
 <da04a824-b44c-d6a0-3dfc-f1b8e8272195@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <da04a824-b44c-d6a0-3dfc-f1b8e8272195@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07/2023 03:16, Abhinav Kumar wrote:
> 
> 
> On 7/6/2023 5:07 PM, Dmitry Baryshkov wrote:
>> On 06/07/2023 23:48, Ryan McCann wrote:
>>> Currently, the names of main blocks are hardcoded into the
>>> msm_disp_snapshot_add_block function rather than using the name that
>>> already exists in the catalog. Change this to take the name directly 
>>> from
>>> the catalog instead of hardcoding it.
>>>
>>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 
>>> ++++++++++++++++----------------
>>>   1 file changed, 16 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index aa8499de1b9f..70dbb1204e6c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -899,38 +899,38 @@ static void dpu_kms_mdp_snapshot(struct 
>>> msm_disp_state *disp_state, struct msm_k
>>>       /* dump CTL sub-blocks HW regs info */
>>>       for (i = 0; i < cat->ctl_count; i++)
>>> -        msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
>>> -                dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
>>> +        msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len, 
>>> dpu_kms->mmio +
>>> +                        cat->ctl[i].base, cat->ctl[i].name);
>>
>> Splitting on the `+' sign is a bad idea. It makes it harder to read 
>> the code. Please keep the first line as is, it is perfectly fine on 
>> its own, and do just what you have stated in the commit message: 
>> change printed block name.
>>
> 
> Actually, I asked Ryan to fix the indent here in the same patch as he 
> was touching this code anyway.
> 
> So you would prefer thats left untouched?

Yes. The current one was definitely better than splitting in the middle 
of a statement.

> 
>>>       /* dump DSPP sub-blocks HW regs info */
>>>       for (i = 0; i < cat->dspp_count; i++)
>>> -        msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
>>> -                dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
>>> +        msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len, 
>>> dpu_kms->mmio +
>>> +                        cat->dspp[i].base, cat->dspp[i].name);
>>>       /* dump INTF sub-blocks HW regs info */
>>>       for (i = 0; i < cat->intf_count; i++)
>>> -        msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
>>> -                dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
>>> +        msm_disp_snapshot_add_block(disp_state, cat->intf[i].len, 
>>> dpu_kms->mmio +
>>> +                        cat->intf[i].base, cat->intf[i].name);
>>>       /* dump PP sub-blocks HW regs info */
>>>       for (i = 0; i < cat->pingpong_count; i++)
>>> -        msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
>>> -                dpu_kms->mmio + cat->pingpong[i].base, 
>>> "pingpong_%d", i);
>>> +        msm_disp_snapshot_add_block(disp_state, 
>>> cat->pingpong[i].len, dpu_kms->mmio +
>>> +                        cat->pingpong[i].base, cat->pingpong[i].name);
>>>       /* dump SSPP sub-blocks HW regs info */
>>>       for (i = 0; i < cat->sspp_count; i++)
>>> -        msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
>>> -                dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
>>> +        msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len, 
>>> dpu_kms->mmio +
>>> +                        cat->sspp[i].base, cat->sspp[i].name);
>>>       /* dump LM sub-blocks HW regs info */
>>>       for (i = 0; i < cat->mixer_count; i++)
>>> -        msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
>>> -                dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
>>> +        msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len, 
>>> dpu_kms->mmio +
>>> +                        cat->mixer[i].base, cat->mixer[i].name);
>>>       /* dump WB sub-blocks HW regs info */
>>>       for (i = 0; i < cat->wb_count; i++)
>>> -        msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>> -                dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>>> +        msm_disp_snapshot_add_block(disp_state, cat->wb[i].len, 
>>> dpu_kms->mmio +
>>> +                        cat->wb[i].base, cat->wb[i].name);
>>>       if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>           msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>>> @@ -944,8 +944,8 @@ static void dpu_kms_mdp_snapshot(struct 
>>> msm_disp_state *disp_state, struct msm_k
>>>       /* dump DSC sub-blocks HW regs info */
>>>       for (i = 0; i < cat->dsc_count; i++)
>>> -        msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
>>> -                dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
>>> +        msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, 
>>> dpu_kms->mmio +
>>> +                        cat->dsc[i].base, cat->dsc[i].name);
>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>   }
>>>
>>

-- 
With best wishes
Dmitry

