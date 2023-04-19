Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75756E821B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 21:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817510E1F1;
	Wed, 19 Apr 2023 19:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9989E10E1F1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 19:48:57 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2a8db10a5d4so456591fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 12:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681933735; x=1684525735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZTyNKupNsXf2g+91PrPeU2a11PGoDFN20zA7SNUiqa0=;
 b=MMVV0oI5iZoLMSWrFHuxhrPHwJWEwWo9NDFSTsUMvnDuxZ+ftMo4+2t6pSqxU/9zmJ
 mJUFGHmFF2pV4n4Id8zA4IIb3ilQOlhiHMhX4mMxPIQyKQaeGNNvWKtP4PurPzpIhTkn
 oGTsuccZQM1EF0j7uvUbWVrUbGLhXq+13He/orOkcSzXMNoCNX4xK1SIjK2NMhusK+Na
 JuMFlyaJAEtG1hhtBW4em31/vbbQoD8sJTaRcZd9vMMXPU90sQBJ0HmV2B5gsod0c75t
 O9WgpZXhUexEQm42tyn8FN+8KiCi6gKXsDTSA+f7JNwh6Cks81lze41j4B8dxyWx5E1/
 J5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681933735; x=1684525735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTyNKupNsXf2g+91PrPeU2a11PGoDFN20zA7SNUiqa0=;
 b=SGPXH5pa2bGH6s2AN8ix55HYkSE6vxwqv0bVoJ80dLZccMzBWDxg3O2knyhdraxOog
 wnTXl4DqKb5DItfxHx8iJ+YMjsL/W7ea6FKhHSwdroezqc7O3NTzorAsBsg0J8K1HHmN
 rcwpZ6Ikpd8aJFNfgbe+9jBUQvuE7DyP78fYL/gAxuTi2UM/hZAWzmWoQg9wy1FlIDyT
 DWnFURH6AraWc6LHa8F73hMEYdDWPTLB7G4wkYuM7bTE18WyHRnYcVAXZdYTuy1/74Iu
 f8O7al2TV8MT2yzKVs5maCahIOon8lI8uzQDI7G/dI7zFK9BLhEgM36CJhEG08ljSOgE
 9yrA==
X-Gm-Message-State: AAQBX9dc6SZXeNqCef4BjpbboVNOWwe3e8y0KZLXAMi2wmh1atc1qqUc
 wTqze+5lWDTxj8/KNzOiWHRoJw==
X-Google-Smtp-Source: AKy350YKG23tnDYXxO75yYLkS8XJe3vIMC1X4eB1eASmgz1L1is/D1f87aLJjfvgYP27+NZxb0G9wg==
X-Received: by 2002:a19:740a:0:b0:4ec:92e4:e0c3 with SMTP id
 v10-20020a19740a000000b004ec92e4e0c3mr4073568lfe.62.1681933735325; 
 Wed, 19 Apr 2023 12:48:55 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 7-20020ac25687000000b004edc2a023ffsm1351395lfr.36.2023.04.19.12.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 12:48:54 -0700 (PDT)
Message-ID: <e15ec005-ef52-c14c-bdeb-faaca207d39b@linaro.org>
Date: Wed, 19 Apr 2023 21:48:52 +0200
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
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <11c72462-b256-d0db-a666-9615da4420f6@quicinc.com>
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



On 19.04.2023 21:06, Jeykumar Sankaran wrote:
> 
> 
> On 4/17/2023 8:30 AM, Konrad Dybcio wrote:
>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>> another path that needs to be handled to ensure MDSS functions properly,
>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>
>> Gating that path may have a variety of effects.. from none to otherwise
>> inexplicable DSI timeouts..
>>
>> On the DPU side, we need to keep the bus alive. The vendor driver
>> kickstarts it to max (300Mbps) throughput on first commit, but in
>> exchange for some battery life in rare DPU-enabled-panel-disabled
>> usecases, we can request it at DPU init and gate it at suspend.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++++++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
>>   2 files changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index dd6c1c40ab9e..d1f77faebbc0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -384,15 +384,17 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
>>       return 0;
>>   }
>>   -static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>> +static int dpu_kms_parse_icc_paths(struct dpu_kms *dpu_kms)
>>   {
>>       struct icc_path *path0;
>>       struct icc_path *path1;
>> +    struct icc_path *reg_bus_path;
>>       struct drm_device *dev = dpu_kms->dev;
>>       struct device *dpu_dev = dev->dev;
>>         path0 = msm_icc_get(dpu_dev, "mdp0-mem");
>>       path1 = msm_icc_get(dpu_dev, "mdp1-mem");
>> +    reg_bus_path = msm_icc_get(dpu_dev, "cpu-cfg");
>>         if (IS_ERR_OR_NULL(path0))
>>           return PTR_ERR_OR_ZERO(path0);
>> @@ -404,6 +406,10 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>>           dpu_kms->mdp_path[1] = path1;
>>           dpu_kms->num_mdp_paths++;
>>       }
>> +
>> +    if (!IS_ERR_OR_NULL(reg_bus_path))
>> +        dpu_kms->reg_bus_path = reg_bus_path;
>> +
>>       return 0;
>>   }
>>   @@ -1039,7 +1045,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>           DPU_DEBUG("REG_DMA is not defined");
>>       }
>>   -    dpu_kms_parse_data_bus_icc_path(dpu_kms);
>> +    dpu_kms_parse_icc_paths(dpu_kms);
>>         rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
>>       if (rc < 0)
>> @@ -1241,6 +1247,9 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>>       for (i = 0; i < dpu_kms->num_mdp_paths; i++)
>>           icc_set_bw(dpu_kms->mdp_path[i], 0, 0);
>>   +    if (dpu_kms->reg_bus_path)
>> +        icc_set_bw(dpu_kms->reg_bus_path, 0, 0);
>> +
>>       return 0;
>>   }
>>   @@ -1261,6 +1270,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>>           return rc;
>>       }
>>   +    /*
>> +     * The vendor driver supports setting 76.8 / 150 / 300 Mbps on this
> How do you arrive at these distint BW values? Are they provided by the ICC fwk for the given path?
They're hardcoded in the SDE driver.

Konrad
>> +     * path, but it seems to go for the highest level when display output
>> +     * is enabled and zero otherwise. For simplicity, we can assume that
>> +     * DPU being enabled and running implies that.
>> +     */
>> +    if (dpu_kms->reg_bus_path)
>> +        icc_set_bw(dpu_kms->reg_bus_path, 0, MBps_to_icc(300));
>> +
>>       dpu_vbif_init_memtypes(dpu_kms);
>>         drm_for_each_encoder(encoder, ddev)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> index d5d9bec90705..c332381d58c4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> @@ -111,6 +111,7 @@ struct dpu_kms {
>>       atomic_t bandwidth_ref;
>>       struct icc_path *mdp_path[2];
>>       u32 num_mdp_paths;
>> +    struct icc_path *reg_bus_path;
>>   };
>>     struct vsync_info {
>>
