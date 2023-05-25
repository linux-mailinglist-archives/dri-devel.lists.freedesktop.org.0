Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DBC711A48
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 00:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1210E785;
	Thu, 25 May 2023 22:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999BF10E784;
 Thu, 25 May 2023 22:42:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PMCt4C021397; Thu, 25 May 2023 22:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8TxVnhZMw5rEwcwAEqaGBYy7nOe8PixHQz5twj+2MYE=;
 b=iW/TfVmRh+6hsOnbGczqPTddKtxu2ZPfGPRrJXjxiwjRTDGlwPlFMDg8RZ6ZyxBd/Em2
 g9mHgdDluF4YfdcqiHkFZlUyTs6he6rkoHi4XRJR7hAMjX3KOHQrUxWVNSNYGH5rSk4A
 YrmLsHWjQOSUazruivfFiaAb3uRhnCx0NJFq0D4tjyrPNW2YbEcDYI9IQdWFWwLxzU5H
 s+ZcqjRT3zhtW/t12flgLbESqQKr81PlhhE5KOhfwz9hhopYTGMQLlJ03oGtPS2KhAgw
 oRMsEDGbMNmmsbZYett3GvVXBtY4yKq+X3vQU1kh4H6Xu5odTIhW/vL/rLyxWPw5/R/4 3g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsuc22qdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 22:42:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34PMglW0010231
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 22:42:47 GMT
Received: from [10.110.20.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 25 May
 2023 15:42:46 -0700
Message-ID: <7f9c8a05-36fa-4cdf-d903-155f8b7c52c8@quicinc.com>
Date: Thu, 25 May 2023 15:42:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v2 3/6] drm/msm/dpu: split interrupt address
 arrays
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jeykumar Sankaran
 <quic_jeykumar@quicinc.com>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-4-dmitry.baryshkov@linaro.org>
 <50c35efe-987b-5138-050e-181c0f6bf191@quicinc.com>
 <CAA8EJpruiiY7KWvhfzh-OmDypWjv6T2+2r-F0Rwv-4dt4u277w@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpruiiY7KWvhfzh-OmDypWjv6T2+2r-F0Rwv-4dt4u277w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qi4spxlsaYveml73h_Di1588qToAQowY
X-Proofpoint-GUID: qi4spxlsaYveml73h_Di1588qToAQowY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_12,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305250190
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
Cc: Sean Paul <sean@poorly.run>, Bjorn
 Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/25/2023 3:30 PM, Dmitry Baryshkov wrote:
> On Fri, 26 May 2023 at 00:40, Jeykumar Sankaran
> <quic_jeykumar@quicinc.com> wrote:
>>
>>
>>
>> On 5/22/2023 2:45 PM, Dmitry Baryshkov wrote:
>>> There is no point in having a single enum (and a single array) for both
>>> DPU < 7.0 and DPU >= 7.0 interrupt registers. Instead define a single
>>> enum and two IRQ address arrays.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  1 +
>>>    .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  1 +
>>>    .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  1 +
>>>    .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  1 +
>>>    .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  1 +
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 82 +++++++++++++------
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 28 ++++---
>>>    8 files changed, 79 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> index 3c1b2c13398d..320cfa4be633 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8350_dpu_caps = {
>>>        .has_dim_layer = true,
>>>        .has_idle_pc = true,
>>>        .has_3d_merge = true,
>>> +     .has_7xxx_intr = true,
>>>        .max_linewidth = 4096,
>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>    };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> index 5d894cbb0a62..9306c7a115e9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> @@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
>>>        .qseed_type = DPU_SSPP_SCALER_QSEED4,
>>>        .has_dim_layer = true,
>>>        .has_idle_pc = true,
>>> +     .has_7xxx_intr = true,
>>>        .max_linewidth = 2400,
>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>    };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> index c3f1ae000a21..fc1e17c495f0 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> @@ -15,6 +15,7 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
>>>        .has_dim_layer = true,
>>>        .has_idle_pc = true,
>>>        .has_3d_merge = true,
>>> +     .has_7xxx_intr = true,
>>>        .max_linewidth = 5120,
>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>    };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> index 86c2e68ebd2c..eb72411c16db 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> @@ -14,6 +14,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
>>>        .has_src_split = true,
>>>        .has_dim_layer = true,
>>>        .has_idle_pc = true,
>>> +     .has_7xxx_intr = true,
>>>        .has_3d_merge = true,
>>>        .max_linewidth = 5120,
>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> index 85dc34458b88..8209ca317bdc 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8550_dpu_caps = {
>>>        .has_dim_layer = true,
>>>        .has_idle_pc = true,
>>>        .has_3d_merge = true,
>>> +     .has_7xxx_intr = true,
>>>        .max_linewidth = 5120,
>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>    };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 677048cc3b7d..72530ebb0ae6 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -351,6 +351,7 @@ struct dpu_rotation_cfg {
>>>     * @has_dim_layer      dim layer feature status
>>>     * @has_idle_pc        indicate if idle power collapse feature is supported
>>>     * @has_3d_merge       indicate if 3D merge is supported
>>> + * @has_7xxx_intr      indicate that INTF/IRQs use addressing for DPU 7.0 and greater
>>
>> I see the requirement to distinguish feature support based on the DPU
>> version in more than one series. Is it a good idea to bring in the DPU
>> version info in chipset catalog? This will relieve us from maintaining
>> such version flags for individual HW sub-blocks.
> 
> This would not play well with the rest of the driver. The driver
> usually does not compute features by DPU revision. Instead it lists
> feature flags.
> 

So I am increasingly seeing examples such as data_compress, widebus 
where it looks like version based enablement in the code will be just 
more efficient. For example.

if (DPU_MAJOR_VER > xxx && DPU_MAJOR_VER < yyy)
	enable data_compress;

will be much easier to do than adding catalog entry for each chipset for 
these bit level details of registers especially when some of these 
cannot be considered as catalog features.

Thats why I am wondering that, we dont need to add the revision based 
cfg picking anymore and rely on the compatible but in the dpu_mdss_cfg 
perhaps add a .core_rev.

We will still stick to catalog based feature bits when its actually 
indeed a feature.

Thoughts?

>>
>> Thanks and Regards,
>> Jeykumar S.
>>
>>>     * @max_linewidth      max linewidth for sspp
>>>     * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>>>     * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
>>> @@ -364,6 +365,7 @@ struct dpu_caps {
>>>        bool has_dim_layer;
>>>        bool has_idle_pc;
>>>        bool has_3d_merge;
>>> +     bool has_7xxx_intr;
>>>        /* SSPP limits */
>>>        u32 max_linewidth;
>>>        u32 pixel_ram_size;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> index 0776b0f6df4f..a03d826bb9ad 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
>>> @@ -51,11 +51,9 @@ struct dpu_intr_reg {
>>>    };
>>>
>>>    /*
>>> - * struct dpu_intr_reg -  List of DPU interrupt registers
>>> - *
>>> - * When making changes be sure to sync with dpu_hw_intr_reg
>>> + * dpu_intr_set_legacy -  List of DPU interrupt registers for DPU <= 6.x
>>>     */
>>> -static const struct dpu_intr_reg dpu_intr_set[] = {
>>> +static const struct dpu_intr_reg dpu_intr_set_legacy[] = {
>>>        [MDP_SSPP_TOP0_INTR] = {
>>>                INTR_CLEAR,
>>>                INTR_EN,
>>> @@ -121,57 +119,78 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>>>                MDP_AD4_INTR_EN_OFF(1),
>>>                MDP_AD4_INTR_STATUS_OFF(1),
>>>        },
>>> -     [MDP_INTF0_7xxx_INTR] = {
>>> +};
>>> +
>>> +/*
>>> + * dpu_intr_set_7xxx -  List of DPU interrupt registers for DPU >= 7.0
>>> + */
>>> +static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>>> +     [MDP_SSPP_TOP0_INTR] = {
>>> +             INTR_CLEAR,
>>> +             INTR_EN,
>>> +             INTR_STATUS
>>> +     },
>>> +     [MDP_SSPP_TOP0_INTR2] = {
>>> +             INTR2_CLEAR,
>>> +             INTR2_EN,
>>> +             INTR2_STATUS
>>> +     },
>>> +     [MDP_SSPP_TOP0_HIST_INTR] = {
>>> +             HIST_INTR_CLEAR,
>>> +             HIST_INTR_EN,
>>> +             HIST_INTR_STATUS
>>> +     },
>>> +     [MDP_INTF0_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_CLEAR(0),
>>>                MDP_INTF_REV_7xxx_INTR_EN(0),
>>>                MDP_INTF_REV_7xxx_INTR_STATUS(0)
>>>        },
>>> -     [MDP_INTF1_7xxx_INTR] = {
>>> +     [MDP_INTF1_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_CLEAR(1),
>>>                MDP_INTF_REV_7xxx_INTR_EN(1),
>>>                MDP_INTF_REV_7xxx_INTR_STATUS(1)
>>>        },
>>> -     [MDP_INTF1_7xxx_TEAR_INTR] = {
>>> +     [MDP_INTF1_TEAR_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(1),
>>>                MDP_INTF_REV_7xxx_INTR_TEAR_EN(1),
>>>                MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(1)
>>>        },
>>> -     [MDP_INTF2_7xxx_INTR] = {
>>> +     [MDP_INTF2_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_CLEAR(2),
>>>                MDP_INTF_REV_7xxx_INTR_EN(2),
>>>                MDP_INTF_REV_7xxx_INTR_STATUS(2)
>>>        },
>>> -     [MDP_INTF2_7xxx_TEAR_INTR] = {
>>> +     [MDP_INTF2_TEAR_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(2),
>>>                MDP_INTF_REV_7xxx_INTR_TEAR_EN(2),
>>>                MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(2)
>>>        },
>>> -     [MDP_INTF3_7xxx_INTR] = {
>>> +     [MDP_INTF3_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_CLEAR(3),
>>>                MDP_INTF_REV_7xxx_INTR_EN(3),
>>>                MDP_INTF_REV_7xxx_INTR_STATUS(3)
>>>        },
>>> -     [MDP_INTF4_7xxx_INTR] = {
>>> +     [MDP_INTF4_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_CLEAR(4),
>>>                MDP_INTF_REV_7xxx_INTR_EN(4),
>>>                MDP_INTF_REV_7xxx_INTR_STATUS(4)
>>>        },
>>> -     [MDP_INTF5_7xxx_INTR] = {
>>> +     [MDP_INTF5_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_CLEAR(5),
>>>                MDP_INTF_REV_7xxx_INTR_EN(5),
>>>                MDP_INTF_REV_7xxx_INTR_STATUS(5)
>>>        },
>>> -     [MDP_INTF6_7xxx_INTR] = {
>>> +     [MDP_INTF6_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_CLEAR(6),
>>>                MDP_INTF_REV_7xxx_INTR_EN(6),
>>>                MDP_INTF_REV_7xxx_INTR_STATUS(6)
>>>        },
>>> -     [MDP_INTF7_7xxx_INTR] = {
>>> +     [MDP_INTF7_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_CLEAR(7),
>>>                MDP_INTF_REV_7xxx_INTR_EN(7),
>>>                MDP_INTF_REV_7xxx_INTR_STATUS(7)
>>>        },
>>> -     [MDP_INTF8_7xxx_INTR] = {
>>> +     [MDP_INTF8_INTR] = {
>>>                MDP_INTF_REV_7xxx_INTR_CLEAR(8),
>>>                MDP_INTF_REV_7xxx_INTR_EN(8),
>>>                MDP_INTF_REV_7xxx_INTR_STATUS(8)
>>> @@ -216,19 +235,19 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
>>>                return IRQ_NONE;
>>>
>>>        spin_lock_irqsave(&intr->irq_lock, irq_flags);
>>> -     for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
>>> +     for (reg_idx = 0; reg_idx < MDP_INTR_MAX; reg_idx++) {
>>>                if (!test_bit(reg_idx, &intr->irq_mask))
>>>                        continue;
>>>
>>>                /* Read interrupt status */
>>> -             irq_status = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].status_off);
>>> +             irq_status = DPU_REG_READ(&intr->hw, intr->intr_set[reg_idx].status_off);
>>>
>>>                /* Read enable mask */
>>> -             enable_mask = DPU_REG_READ(&intr->hw, dpu_intr_set[reg_idx].en_off);
>>> +             enable_mask = DPU_REG_READ(&intr->hw, intr->intr_set[reg_idx].en_off);
>>>
>>>                /* and clear the interrupt */
>>>                if (irq_status)
>>> -                     DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
>>> +                     DPU_REG_WRITE(&intr->hw, intr->intr_set[reg_idx].clr_off,
>>>                                     irq_status);
>>>
>>>                /* Finally update IRQ status based on enable mask */
>>> @@ -285,7 +304,11 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>>>        assert_spin_locked(&intr->irq_lock);
>>>
>>>        reg_idx = DPU_IRQ_REG(irq_idx);
>>> -     reg = &dpu_intr_set[reg_idx];
>>> +     reg = &intr->intr_set[reg_idx];
>>> +
>>> +     /* Is this interrupt register supported on the platform */
>>> +     if (WARN_ON(!reg->en_off))
>>> +             return -EINVAL;
>>>
>>>        cache_irq_mask = intr->cache_irq_mask[reg_idx];
>>>        if (cache_irq_mask & DPU_IRQ_MASK(irq_idx)) {
>>> @@ -334,7 +357,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
>>>        assert_spin_locked(&intr->irq_lock);
>>>
>>>        reg_idx = DPU_IRQ_REG(irq_idx);
>>> -     reg = &dpu_intr_set[reg_idx];
>>> +     reg = &intr->intr_set[reg_idx];
>>>
>>>        cache_irq_mask = intr->cache_irq_mask[reg_idx];
>>>        if ((cache_irq_mask & DPU_IRQ_MASK(irq_idx)) == 0) {
>>> @@ -368,10 +391,10 @@ static void dpu_clear_irqs(struct dpu_kms *dpu_kms)
>>>        if (!intr)
>>>                return;
>>>
>>> -     for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
>>> +     for (i = 0; i < MDP_INTR_MAX; i++) {
>>>                if (test_bit(i, &intr->irq_mask))
>>>                        DPU_REG_WRITE(&intr->hw,
>>> -                                     dpu_intr_set[i].clr_off, 0xffffffff);
>>> +                                     intr->intr_set[i].clr_off, 0xffffffff);
>>>        }
>>>
>>>        /* ensure register writes go through */
>>> @@ -386,10 +409,10 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
>>>        if (!intr)
>>>                return;
>>>
>>> -     for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
>>> +     for (i = 0; i < MDP_INTR_MAX; i++) {
>>>                if (test_bit(i, &intr->irq_mask))
>>>                        DPU_REG_WRITE(&intr->hw,
>>> -                                     dpu_intr_set[i].en_off, 0x00000000);
>>> +                                     intr->intr_set[i].en_off, 0x00000000);
>>>        }
>>>
>>>        /* ensure register writes go through */
>>> @@ -421,10 +444,10 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>>>
>>>        reg_idx = DPU_IRQ_REG(irq_idx);
>>>        intr_status = DPU_REG_READ(&intr->hw,
>>> -                     dpu_intr_set[reg_idx].status_off) &
>>> +                     intr->intr_set[reg_idx].status_off) &
>>>                DPU_IRQ_MASK(irq_idx);
>>>        if (intr_status)
>>> -             DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
>>> +             DPU_REG_WRITE(&intr->hw, intr->intr_set[reg_idx].clr_off,
>>>                                intr_status);
>>>
>>>        /* ensure register writes go through */
>>> @@ -448,6 +471,11 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>>>        if (!intr)
>>>                return ERR_PTR(-ENOMEM);
>>>
>>> +     if (m->caps->has_7xxx_intr)
>>> +             intr->intr_set = dpu_intr_set_7xxx;
>>> +     else
>>> +             intr->intr_set = dpu_intr_set_legacy;
>>> +
>>>        intr->hw.blk_addr = addr + m->mdp[0].base;
>>>
>>>        intr->total_irqs = nirq;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>>> index 1f2dabc54c22..f329d6d7f646 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
>>> @@ -23,24 +23,29 @@ enum dpu_hw_intr_reg {
>>>        MDP_INTF3_INTR,
>>>        MDP_INTF4_INTR,
>>>        MDP_INTF5_INTR,
>>> +     MDP_INTF6_INTR,
>>> +     MDP_INTF7_INTR,
>>> +     MDP_INTF8_INTR,
>>>        MDP_INTF1_TEAR_INTR,
>>>        MDP_INTF2_TEAR_INTR,
>>>        MDP_AD4_0_INTR,
>>>        MDP_AD4_1_INTR,
>>> -     MDP_INTF0_7xxx_INTR,
>>> -     MDP_INTF1_7xxx_INTR,
>>> -     MDP_INTF1_7xxx_TEAR_INTR,
>>> -     MDP_INTF2_7xxx_INTR,
>>> -     MDP_INTF2_7xxx_TEAR_INTR,
>>> -     MDP_INTF3_7xxx_INTR,
>>> -     MDP_INTF4_7xxx_INTR,
>>> -     MDP_INTF5_7xxx_INTR,
>>> -     MDP_INTF6_7xxx_INTR,
>>> -     MDP_INTF7_7xxx_INTR,
>>> -     MDP_INTF8_7xxx_INTR,
>>>        MDP_INTR_MAX,
>>>    };
>>>
>>> +/* compatibility */
>>> +#define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
>>> +#define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
>>> +#define MDP_INTF2_7xxx_INTR MDP_INTF2_INTR
>>> +#define MDP_INTF3_7xxx_INTR MDP_INTF3_INTR
>>> +#define MDP_INTF4_7xxx_INTR MDP_INTF4_INTR
>>> +#define MDP_INTF5_7xxx_INTR MDP_INTF5_INTR
>>> +#define MDP_INTF6_7xxx_INTR MDP_INTF6_INTR
>>> +#define MDP_INTF7_7xxx_INTR MDP_INTF7_INTR
>>> +#define MDP_INTF8_7xxx_INTR MDP_INTF8_INTR
>>> +#define MDP_INTF1_7xxx_TEAR_INTR MDP_INTF1_TEAR_INTR
>>> +#define MDP_INTF2_7xxx_TEAR_INTR MDP_INTF2_TEAR_INTR
>>> +
>>>    #define DPU_IRQ_IDX(reg_idx, offset)        (reg_idx * 32 + offset)
>>>
>>>    /**
>>> @@ -60,6 +65,7 @@ struct dpu_hw_intr {
>>>        u32 total_irqs;
>>>        spinlock_t irq_lock;
>>>        unsigned long irq_mask;
>>> +     const struct dpu_intr_reg *intr_set;
>>>
>>>        struct {
>>>                void (*cb)(void *arg, int irq_idx);
> 
> 
> 
