Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D54A6E83B3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 23:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA9710EB30;
	Wed, 19 Apr 2023 21:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C05910E21A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 21:26:29 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id j11so470849ljq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 14:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681939583; x=1684531583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G7rLjVelMroUaEiqjl++LDyQDXZLBXJneIETgFg7kfY=;
 b=R2BeKr1L0hhm6DJSQeidUDfHuDd5+ZJoq4TOgU37eePK+pqACeRlO8XV1NmGmXEqdN
 zMsZtcwFZUEg+uobXe/kysNSlykxrbJZyMM0WrJHwbtgL1tmOOMQa13N+Gqweuj05N24
 xNwLwdcA5gVdLmJirjg6ioH2/lydImJPAfbwjeLIHkQxUZACh8upfgo/E+Kh+djV+/2B
 eMsRAvrBal4w0uX5ENi8No9VWGlPIhWqlNSXaP5WOk0NNB69FhcHp8SMxINZnDn6GEp3
 QCpg0faV1EmNpQzipY/eLVnd9qHHzZAqIEXUrPPEGpO6muEiStWC/YCpu0HHz9FlhvSJ
 nYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681939583; x=1684531583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G7rLjVelMroUaEiqjl++LDyQDXZLBXJneIETgFg7kfY=;
 b=MtboyvTqgmQldV4qP8Bj6Pr3JIi5UjHWEIH5av3GKj/dKRnQzyxaLWsckHsS/P3URO
 ejUOLs1Nrs2+U3G7OpftJgZb3x4Nf+e+IIz90m5FmbO9DEizQp3xg1Sk7XxkOfxyblbY
 jyF2S/EYBrVnHgO+c+L1ZsQfOhbX3npzzXEAvc7WgYvW2AQwJ1XaoA7NaygtuBGoCDL9
 yFbLnOp/CAI7i3zGfed8eCx8iFmkbt31hL5awTuPtZfk2x97l4XsIr6DPDdZFQHDu2n/
 c2pIr9l2KQ61hlmKWT5YB+kxeHo49cPVpd77pTnu4nVuKMm6rYqMVnHmSmkyRANBoAGd
 zSqw==
X-Gm-Message-State: AAQBX9eyQgo9qScUDgKUwC+IYLK/jxjXfjQhXW1E0x1aVarnwwKAuwDU
 t6zOQP4HI99f6uGcg7DzWze0OA==
X-Google-Smtp-Source: AKy350YwRKyqyht0LHMNwHAknUo5O+PCkps4HQwk0FE03ebRAxhB/2wTs/O6g9F9gTWK2osX8ClJTQ==
X-Received: by 2002:a2e:9e56:0:b0:299:ac68:4806 with SMTP id
 g22-20020a2e9e56000000b00299ac684806mr2195156ljk.9.1681939583467; 
 Wed, 19 Apr 2023 14:26:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 2-20020a2eb282000000b002a76b9e4058sm3049975ljx.43.2023.04.19.14.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 14:26:23 -0700 (PDT)
Message-ID: <bb8e3633-3fe5-b4d2-08e1-0789a68620a8@linaro.org>
Date: Wed, 19 Apr 2023 23:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/dpu1: Handle the reg bus ICC path
Content-Language: en-US
To: Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-5-06fbdc1643c0@linaro.org>
 <11c72462-b256-d0db-a666-9615da4420f6@quicinc.com>
 <e15ec005-ef52-c14c-bdeb-faaca207d39b@linaro.org>
 <77bb1b3c-09cb-310a-be34-166e573a13a7@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <77bb1b3c-09cb-310a-be34-166e573a13a7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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



On 19.04.2023 22:11, Jeykumar Sankaran wrote:
> 
> 
> On 4/19/2023 12:48 PM, Konrad Dybcio wrote:
>>
>>
>> On 19.04.2023 21:06, Jeykumar Sankaran wrote:
>>>
>>>
>>> On 4/17/2023 8:30 AM, Konrad Dybcio wrote:
>>>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>>>> another path that needs to be handled to ensure MDSS functions properly,
>>>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>>>
>>>> Gating that path may have a variety of effects.. from none to otherwise
>>>> inexplicable DSI timeouts..
>>>>
>>>> On the DPU side, we need to keep the bus alive. The vendor driver
>>>> kickstarts it to max (300Mbps) throughput on first commit, but in
>>>> exchange for some battery life in rare DPU-enabled-panel-disabled
>>>> usecases, we can request it at DPU init and gate it at suspend.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++++++++++++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
>>>>    2 files changed, 21 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index dd6c1c40ab9e..d1f77faebbc0 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -384,15 +384,17 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
>>>>        return 0;
>>>>    }
>>>>    -static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>>> +static int dpu_kms_parse_icc_paths(struct dpu_kms *dpu_kms)
>>>>    {
>>>>        struct icc_path *path0;
>>>>        struct icc_path *path1;
>>>> +    struct icc_path *reg_bus_path;
>>>>        struct drm_device *dev = dpu_kms->dev;
>>>>        struct device *dpu_dev = dev->dev;
>>>>          path0 = msm_icc_get(dpu_dev, "mdp0-mem");
>>>>        path1 = msm_icc_get(dpu_dev, "mdp1-mem");
>>>> +    reg_bus_path = msm_icc_get(dpu_dev, "cpu-cfg");
>>>>          if (IS_ERR_OR_NULL(path0))
>>>>            return PTR_ERR_OR_ZERO(path0);
>>>> @@ -404,6 +406,10 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>>>            dpu_kms->mdp_path[1] = path1;
>>>>            dpu_kms->num_mdp_paths++;
>>>>        }
>>>> +
>>>> +    if (!IS_ERR_OR_NULL(reg_bus_path))
>>>> +        dpu_kms->reg_bus_path = reg_bus_path;
>>>> +
>>>>        return 0;
>>>>    }
>>>>    @@ -1039,7 +1045,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>>            DPU_DEBUG("REG_DMA is not defined");
>>>>        }
>>>>    -    dpu_kms_parse_data_bus_icc_path(dpu_kms);
>>>> +    dpu_kms_parse_icc_paths(dpu_kms);
>>>>          rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
>>>>        if (rc < 0)
>>>> @@ -1241,6 +1247,9 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>>>>        for (i = 0; i < dpu_kms->num_mdp_paths; i++)
>>>>            icc_set_bw(dpu_kms->mdp_path[i], 0, 0);
>>>>    +    if (dpu_kms->reg_bus_path)
>>>> +        icc_set_bw(dpu_kms->reg_bus_path, 0, 0);
>>>> +
>>>>        return 0;
>>>>    }
>>>>    @@ -1261,6 +1270,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>>>>            return rc;
>>>>        }
>>>>    +    /*
>>>> +     * The vendor driver supports setting 76.8 / 150 / 300 Mbps on this
>>> How do you arrive at these distint BW values? Are they provided by the ICC fwk for the given path?
>> They're hardcoded in the SDE driver.
>>
>> Konrad
> These bandwidths are derived from the scaling frequencies of all the buses participating in the icc-path. So they cannot be constants. Ideally they should be read from the hw catalog data of the respective platform.
msm-5.4 : rotator/sde_rotator_base.c

static const struct sde_rot_bus_data sde_rot_reg_bus_table[] = {
        {0, 0},
        {0, 76800},
        {0, 150000},
        {0, 300000},
};

One of the two voters begs to disagree, but I do indeed see that some
SoCs (lahaina, yupik, shima..) cast votes for 74/148/265 MBps instead
of 77/150/300 from the MDSS device (with rotator being considered
separate), or so say their DTs, thanks for pointing that out.

Nonetheless, this code would taste good with bolognese sauce..

Konrad

> 
> Jeykumar S.
>>>> +     * path, but it seems to go for the highest level when display output
>>>> +     * is enabled and zero otherwise. For simplicity, we can assume that
>>>> +     * DPU being enabled and running implies that.
>>>> +     */
>>>> +    if (dpu_kms->reg_bus_path)
>>>> +        icc_set_bw(dpu_kms->reg_bus_path, 0, MBps_to_icc(300));
>>>> +
>>>>        dpu_vbif_init_memtypes(dpu_kms);
>>>>          drm_for_each_encoder(encoder, ddev)
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>> index d5d9bec90705..c332381d58c4 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>>>> @@ -111,6 +111,7 @@ struct dpu_kms {
>>>>        atomic_t bandwidth_ref;
>>>>        struct icc_path *mdp_path[2];
>>>>        u32 num_mdp_paths;
>>>> +    struct icc_path *reg_bus_path;
>>>>    };
>>>>      struct vsync_info {
>>>>
