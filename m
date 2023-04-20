Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE96E869C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A91710E64B;
	Thu, 20 Apr 2023 00:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EAC10E626
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:34:21 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id l15so923390ljq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950859; x=1684542859;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nsTolVNTEzM2lDMugIIijFcPCK/oHn23MSs+SDPFOXA=;
 b=Ncoqfngnbv9av5IM6x4xIFTnRTruvDQ2rRmUaFz1XR00XqlxPg0xmfI6hSuwrzKfj6
 cTgEKh29VlM0KcS4HdTe0cr6hXu/bFe/0S0aR1QwLBy8Cjntxf+5j18fm5NIyi2GGZVb
 NACuAKy6qRCp/uILtUBATGO/3j+kbO7bm9s/MtIjJfwxsfEHXgrnXd5cwdE/RAwTD7Ob
 zM3h0XA354YlGXWqD25DMQhIWTvZjR5/WzlwRNeixDf9+cAzFM42YMVVcTseIKPUAqY8
 xnDyMDY+mGWqVKNkfbKXbVs0YLclGldhsSvil5NlB7sqWOp1dtkoJ5NwgJtOnfn3OmWs
 e9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950859; x=1684542859;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nsTolVNTEzM2lDMugIIijFcPCK/oHn23MSs+SDPFOXA=;
 b=Gm1w7xInEWvmuAMxuwV+A24qYJa8Obxh3i+0myA69CbU3difLeFjUcAzW4LyJCL/nD
 TnzgICp63jljpQmHwMZ14mhqAmwe/PE+ANB248uioMPT43ifJMdhRv+3AlH86xlGEY+v
 7cWOescwWBoQYz3OCPNrC9jeQlxjajPSDwCYZHC28PNaizKThbn2YirmZGgclginTsUe
 69gCfkyQ0C2bX96Aar1ttSWmgKKhWu7whtclTraz64Gn3J+RErmkWU50hLlnIQNb46GZ
 TBRHRIkp8o2TH1dT1CF1xqFPD46fBE+sFcQMikWsJcLO2XD0uRl1E5EHkmqF3OfcqEDZ
 0nHg==
X-Gm-Message-State: AAQBX9ds9ueHfodEdWAq+ej1bUANhYx74l+gUhFyJVFPzb4XTT8Ez8+m
 RKgvzIAuWsVWnwR/lVb2PK1lNA==
X-Google-Smtp-Source: AKy350YxcfqhJqGXhj+0NIo5jv8LIdtIix1u0hrmveMkKh99jgz5QzFYL7U02J8IUQrtl3GuZGLljQ==
X-Received: by 2002:a2e:96d2:0:b0:2a4:fada:edd1 with SMTP id
 d18-20020a2e96d2000000b002a4fadaedd1mr1336680ljj.16.1681950859161; 
 Wed, 19 Apr 2023 17:34:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a2eb0d9000000b002a9ee18e9c7sm11778ljl.69.2023.04.19.17.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:34:18 -0700 (PDT)
Message-ID: <881949ba-4610-6b49-dab4-835be0f119ca@linaro.org>
Date: Thu, 20 Apr 2023 03:34:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/dpu1: Handle the reg bus ICC path
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-5-06fbdc1643c0@linaro.org>
 <11c72462-b256-d0db-a666-9615da4420f6@quicinc.com>
 <e15ec005-ef52-c14c-bdeb-faaca207d39b@linaro.org>
 <77bb1b3c-09cb-310a-be34-166e573a13a7@quicinc.com>
 <bb8e3633-3fe5-b4d2-08e1-0789a68620a8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bb8e3633-3fe5-b4d2-08e1-0789a68620a8@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/2023 00:26, Konrad Dybcio wrote:
> 
> 
> On 19.04.2023 22:11, Jeykumar Sankaran wrote:
>>
>>
>> On 4/19/2023 12:48 PM, Konrad Dybcio wrote:
>>>
>>>
>>> On 19.04.2023 21:06, Jeykumar Sankaran wrote:
>>>>
>>>>
>>>> On 4/17/2023 8:30 AM, Konrad Dybcio wrote:
>>>>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>>>>> another path that needs to be handled to ensure MDSS functions properly,
>>>>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>>>>
>>>>> Gating that path may have a variety of effects.. from none to otherwise
>>>>> inexplicable DSI timeouts..
>>>>>
>>>>> On the DPU side, we need to keep the bus alive. The vendor driver
>>>>> kickstarts it to max (300Mbps) throughput on first commit, but in
>>>>> exchange for some battery life in rare DPU-enabled-panel-disabled
>>>>> usecases, we can request it at DPU init and gate it at suspend.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++++++++++++--
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
>>>>>     2 files changed, 21 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> index dd6c1c40ab9e..d1f77faebbc0 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>> @@ -384,15 +384,17 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
>>>>>         return 0;
>>>>>     }
>>>>>     -static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>>>> +static int dpu_kms_parse_icc_paths(struct dpu_kms *dpu_kms)
>>>>>     {
>>>>>         struct icc_path *path0;
>>>>>         struct icc_path *path1;
>>>>> +    struct icc_path *reg_bus_path;
>>>>>         struct drm_device *dev = dpu_kms->dev;
>>>>>         struct device *dpu_dev = dev->dev;
>>>>>           path0 = msm_icc_get(dpu_dev, "mdp0-mem");
>>>>>         path1 = msm_icc_get(dpu_dev, "mdp1-mem");
>>>>> +    reg_bus_path = msm_icc_get(dpu_dev, "cpu-cfg");
>>>>>           if (IS_ERR_OR_NULL(path0))
>>>>>             return PTR_ERR_OR_ZERO(path0);
>>>>> @@ -404,6 +406,10 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>>>>             dpu_kms->mdp_path[1] = path1;
>>>>>             dpu_kms->num_mdp_paths++;
>>>>>         }
>>>>> +
>>>>> +    if (!IS_ERR_OR_NULL(reg_bus_path))
>>>>> +        dpu_kms->reg_bus_path = reg_bus_path;
>>>>> +
>>>>>         return 0;
>>>>>     }
>>>>>     @@ -1039,7 +1045,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>>>             DPU_DEBUG("REG_DMA is not defined");
>>>>>         }
>>>>>     -    dpu_kms_parse_data_bus_icc_path(dpu_kms);
>>>>> +    dpu_kms_parse_icc_paths(dpu_kms);
>>>>>           rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
>>>>>         if (rc < 0)
>>>>> @@ -1241,6 +1247,9 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>>>>>         for (i = 0; i < dpu_kms->num_mdp_paths; i++)
>>>>>             icc_set_bw(dpu_kms->mdp_path[i], 0, 0);
>>>>>     +    if (dpu_kms->reg_bus_path)
>>>>> +        icc_set_bw(dpu_kms->reg_bus_path, 0, 0);
>>>>> +
>>>>>         return 0;
>>>>>     }
>>>>>     @@ -1261,6 +1270,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>>>>>             return rc;
>>>>>         }
>>>>>     +    /*
>>>>> +     * The vendor driver supports setting 76.8 / 150 / 300 Mbps on this
>>>> How do you arrive at these distint BW values? Are they provided by the ICC fwk for the given path?
>>> They're hardcoded in the SDE driver.
>>>
>>> Konrad
>> These bandwidths are derived from the scaling frequencies of all the buses participating in the icc-path. So they cannot be constants. Ideally they should be read from the hw catalog data of the respective platform.
> msm-5.4 : rotator/sde_rotator_base.c
> 
> static const struct sde_rot_bus_data sde_rot_reg_bus_table[] = {
>          {0, 0},
>          {0, 76800},
>          {0, 150000},
>          {0, 300000},
> };
> 
> One of the two voters begs to disagree, but I do indeed see that some
> SoCs (lahaina, yupik, shima..) cast votes for 74/148/265 MBps instead
> of 77/150/300 from the MDSS device (with rotator being considered
> separate), or so say their DTs, thanks for pointing that out.

I wonder if it makes the difference. The values are pretty close.
Anyway, we now have the driver data, so you can push these values to the 
data.

> 
> Nonetheless, this code would taste good with bolognese sauce..
> 
> Konrad
> 
>>
>> Jeykumar S.
>>>>> +     * path, but it seems to go for the highest level when display output
>>>>> +     * is enabled and zero otherwise. For simplicity, we can assume that
>>>>> +     * DPU being enabled and running implies that.
>>>>> +     */
>>>>> +    if (dpu_kms->reg_bus_path)
>>>>> +        icc_set_bw(dpu_kms->reg_bus_path, 0, MBps_to_icc(300));
>>>>> +
>>>>>         dpu_vbif_init_memtypes(dpu_kms);
>>>>>           drm_for_each_encoder(encoder, ddev)
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>> index d5d9bec90705..c332381d58c4 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>>> @@ -111,6 +111,7 @@ struct dpu_kms {
>>>>>         atomic_t bandwidth_ref;
>>>>>         struct icc_path *mdp_path[2];
>>>>>         u32 num_mdp_paths;
>>>>> +    struct icc_path *reg_bus_path;
>>>>>     };
>>>>>       struct vsync_info {
>>>>>

-- 
With best wishes
Dmitry

