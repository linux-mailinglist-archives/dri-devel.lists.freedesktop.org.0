Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838D70100D
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 23:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D6A10E2BB;
	Fri, 12 May 2023 21:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E991C10E2B8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 21:04:52 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ac785015d7so114764091fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 14:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683925490; x=1686517490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q+iTh12Z2leEAD3XW+LoERKl7Jd7SOmJOUXDeevVhZg=;
 b=VyHtaMdIQVDJw/yMYxiidA9NgIfUYGs4EBFZklpoE8ZX2Z36d2vYu51idP5ID9vYJL
 0lM0Yog90wTads2MHWBn2UAe+B/cTf/HpyGfwdnIRfTCV7kDuhS+nB903JpLjfTyF1su
 A74KPY/x1NRLWLtSkih32A/04P2UyyvI+dd7teYKqCf2u8l8zOmPEJpRG/iaG64i92Qb
 VLAUfpIW9Q/JLsu2f2FV9Ck637IQ+mIQWJ4EzKEluPuidNmHApoLWckM4NlSWV//oBrb
 8Zn9uLlT3IS7lpij/p4eGsjHA6FuUZ7+5K64msIigChOVG4epvwuvbmtnJOhWXAmOdnf
 bHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683925490; x=1686517490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q+iTh12Z2leEAD3XW+LoERKl7Jd7SOmJOUXDeevVhZg=;
 b=ecsup3npOBRCRY0j/ei1u7MezDQr0Rj9KZsrGy449zpB/+OQN2nRaoc5xjmUrEE0ct
 MwqNKrufUu7m77Fhfq/QcxI5FypbaWO76/OoNVWhr00CddwX6cQ6s642Gev5ki496uRO
 3lGJ4pLaJYbH6j8i7s57A3iiB/ltVPuv1f1JApnPTjAljG8oxEXXO5PEOzschSNMW1tZ
 ynkBLuYo98jIDYYivnlvQ2AiDRb2JkjdrdTnmh4LAPRipCyvBKtryw9/59uko2Dhnk6t
 1FrJCndYLrs1C1kl7k+Vb8QRdIkgQFo2Sr7MHD272aSxcGc1uddPuLLDthqnir1q3MQN
 cvww==
X-Gm-Message-State: AC+VfDwByCd1DCe72dB6CQHGjjOsW3KHH9si89QUtahotIkhaQC8YIo1
 HdGsXbGIkidRJd2YzUTzX4sEJw==
X-Google-Smtp-Source: ACHHUZ5/iyIkXM1BVpnShgqzOq8KnjqtENdU83lxy1xmRXrE/3SGCyjE6VEtS+C0kxRP++HOPlQLew==
X-Received: by 2002:ac2:5ec5:0:b0:4ec:89d3:a8a2 with SMTP id
 d5-20020ac25ec5000000b004ec89d3a8a2mr4630987lfq.43.1683925490449; 
 Fri, 12 May 2023 14:04:50 -0700 (PDT)
Received: from [192.168.2.40] ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 4-20020ac24844000000b004edc3bd7fa1sm1583226lfy.201.2023.05.12.14.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 14:04:49 -0700 (PDT)
Message-ID: <8687ce7f-c208-b240-ae9f-c7e565d92755@linaro.org>
Date: Sat, 13 May 2023 00:04:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 5/8] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-6-git-send-email-quic_khsieh@quicinc.com>
 <41243dc6-eb9d-dea6-f945-cb1f6594a2a4@linaro.org>
 <ca5e6ae2-c134-820a-c5e0-c5a07fccfc4e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ca5e6ae2-c134-820a-c5e0-c5a07fccfc4e@quicinc.com>
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
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2023 23:48, Kuogee Hsieh wrote:
> 
> On 5/12/2023 11:19 AM, Dmitry Baryshkov wrote:
>> On 12/05/2023 21:00, Kuogee Hsieh wrote:
>>> Add support for DSC 1.2 by providing the necessary hooks to program
>>> the DPU DSC 1.2 encoder.
>>>
>>> Changes in v3:
>>> -- fixed kernel test rebot report that "__iomem *off" is declared but 
>>> not
>>>     used at dpu_hw_dsc_config_1_2()
>>> -- unrolling thresh loops
>>>
>>> Changes in v4:
>>> -- delete DPU_DSC_HW_REV_1_1
>>> -- delete off and used real register name directly
>>>
>>> Changes in v7:
>>> -- replace offset with sblk->enc.base
>>> -- replace ss with slice
>>>
>>> Changes in v8:
>>> -- fixed checkpatch warning
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile                   |   1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  32 ++-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  14 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 382 
>>> +++++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |   7 +-
>>>   5 files changed, 432 insertions(+), 4 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>>>
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index b814fc8..b9af5e4 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
>>>       disp/dpu1/dpu_hw_catalog.o \
>>>       disp/dpu1/dpu_hw_ctl.o \
>>>       disp/dpu1/dpu_hw_dsc.o \
>>> +    disp/dpu1/dpu_hw_dsc_1_2.o \
>>>       disp/dpu1/dpu_hw_interrupts.o \
>>>       disp/dpu1/dpu_hw_intf.o \
>>>       disp/dpu1/dpu_hw_lm.o \
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index dc0a4da..4eda2cc 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -1,6 +1,6 @@
>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>   /*
>>> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>>    * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights 
>>> reserved.
>>>    */
>>>   @@ -244,12 +244,18 @@ enum {
>>>   };
>>>     /**
>>> - * DSC features
>>> + * DSC sub-blocks/features
>>>    * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
>>>    *                            the pixel output from this DSC.
>>> + * @DPU_DSC_HW_REV_1_2        DSC block supports dsc 1.1 and 1.2
>>> + * @DPU_DSC_NATIVE_422_EN     Supports native422 and native420 encoding
>>> + * @DPU_DSC_MAX
>>>    */
>>>   enum {
>>>       DPU_DSC_OUTPUT_CTRL = 0x1,
>>> +    DPU_DSC_HW_REV_1_2,
>>> +    DPU_DSC_NATIVE_422_EN,
>>> +    DPU_DSC_MAX
>>>   };
>>>     /**
>>> @@ -306,6 +312,14 @@ struct dpu_pp_blk {
>>>   };
>>>     /**
>>> + * struct dpu_dsc_blk - DSC Encoder sub-blk information
>>> + * @info:   HW register and features supported by this sub-blk
>>> + */
>>> +struct dpu_dsc_blk {
>>> +    DPU_HW_SUBBLK_INFO;
>>> +};
>>> +
>>> +/**
>>>    * enum dpu_qos_lut_usage - define QoS LUT use cases
>>>    */
>>>   enum dpu_qos_lut_usage {
>>> @@ -452,6 +466,17 @@ struct dpu_pingpong_sub_blks {
>>>   };
>>>     /**
>>> + * struct dpu_dsc_sub_blks - DSC sub-blks
>>> + * @enc: DSC encoder sub block
>>> + * @ctl: DSC controller sub block
>>> + *
>>> + */
>>> +struct dpu_dsc_sub_blks {
>>> +    struct dpu_dsc_blk enc;
>>> +    struct dpu_dsc_blk ctl;
>>> +};
>>> +
>>> +/**
>>>    * dpu_clk_ctrl_type - Defines top level clock control signals
>>>    */
>>>   enum dpu_clk_ctrl_type {
>>> @@ -605,10 +630,13 @@ struct dpu_merge_3d_cfg  {
>>>    * struct dpu_dsc_cfg - information of DSC blocks
>>>    * @id                 enum identifying this block
>>>    * @base               register offset of this block
>>> + * @len:               length of hardware block
>>>    * @features           bit mask identifying sub-blocks/features
>>> + * @sblk               sub-blocks information
>>>    */
>>>   struct dpu_dsc_cfg {
>>>       DPU_HW_BLK_INFO;
>>> +    const struct dpu_dsc_sub_blks *sblk;
>>>   };
>>>     /**
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>>> index 138080a..44fd624 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
>>> @@ -1,5 +1,8 @@
>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>> -/* Copyright (c) 2020-2022, Linaro Limited */
>>> +/*
>>> + * Copyright (c) 2020-2022, Linaro Limited
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>>     #ifndef _DPU_HW_DSC_H
>>>   #define _DPU_HW_DSC_H
>>> @@ -69,6 +72,15 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(const struct 
>>> dpu_dsc_cfg *cfg,
>>>           void __iomem *addr);
>>>     /**
>>> + * dpu_hw_dsc_init_1_2 - initializes the v1.2 DSC hw driver block
>>> + * @cfg:  DSC catalog entry for which driver object is required
>>> + * @addr: Mapped register io address of MDP
>>> + * Returns: Error code or allocated dpu_hw_dsc context
>>> + */
>>> +struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
>>> +                       void __iomem *addr);
>>> +
>>> +/**
>>>    * dpu_hw_dsc_destroy - destroys dsc driver context
>>>    * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
>>>    */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>>> new file mode 100644
>>> index 00000000..5bd84bd
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>>> @@ -0,0 +1,382 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> + */
>>> +
>>> +#include <drm/display/drm_dsc_helper.h>
>>> +
>>> +#include "dpu_kms.h"
>>> +#include "dpu_hw_catalog.h"
>>> +#include "dpu_hwio.h"
>>> +#include "dpu_hw_mdss.h"
>>> +#include "dpu_hw_dsc.h"
>>> +
>>> +#define DSC_CMN_MAIN_CNF           0x00
>>> +
>>> +/* DPU_DSC_ENC register offsets */
>>> +#define ENC_DF_CTRL                0x00
>>> +#define ENC_GENERAL_STATUS         0x04
>>> +#define ENC_HSLICE_STATUS          0x08
>>> +#define ENC_OUT_STATUS             0x0C
>>> +#define ENC_INT_STAT               0x10
>>> +#define ENC_INT_CLR                0x14
>>> +#define ENC_INT_MASK               0x18
>>> +#define DSC_MAIN_CONF              0x30
>>> +#define DSC_PICTURE_SIZE           0x34
>>> +#define DSC_SLICE_SIZE             0x38
>>> +#define DSC_MISC_SIZE              0x3C
>>> +#define DSC_HRD_DELAYS             0x40
>>> +#define DSC_RC_SCALE               0x44
>>> +#define DSC_RC_SCALE_INC_DEC       0x48
>>> +#define DSC_RC_OFFSETS_1           0x4C
>>> +#define DSC_RC_OFFSETS_2           0x50
>>> +#define DSC_RC_OFFSETS_3           0x54
>>> +#define DSC_RC_OFFSETS_4           0x58
>>> +#define DSC_FLATNESS_QP            0x5C
>>> +#define DSC_RC_MODEL_SIZE          0x60
>>> +#define DSC_RC_CONFIG              0x64
>>> +#define DSC_RC_BUF_THRESH_0        0x68
>>> +#define DSC_RC_BUF_THRESH_1        0x6C
>>> +#define DSC_RC_BUF_THRESH_2        0x70
>>> +#define DSC_RC_BUF_THRESH_3        0x74
>>> +#define DSC_RC_MIN_QP_0            0x78
>>> +#define DSC_RC_MIN_QP_1            0x7C
>>> +#define DSC_RC_MIN_QP_2            0x80
>>> +#define DSC_RC_MAX_QP_0            0x84
>>> +#define DSC_RC_MAX_QP_1            0x88
>>> +#define DSC_RC_MAX_QP_2            0x8C
>>> +#define DSC_RC_RANGE_BPG_OFFSETS_0 0x90
>>> +#define DSC_RC_RANGE_BPG_OFFSETS_1 0x94
>>> +#define DSC_RC_RANGE_BPG_OFFSETS_2 0x98
>>> +
>>> +/* DPU_DSC_CTL register offsets */
>>> +#define DSC_CTL                    0x00
>>> +#define DSC_CFG                    0x04
>>> +#define DSC_DATA_IN_SWAP           0x08
>>> +#define DSC_CLK_CTRL               0x0C
>>> +
>>> +static inline int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, 
>>> int num_ss)
>>> +{
>>> +    int max_addr = 2400 / num_ss;
>>> +
>>> +    if (hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_422_EN))
>>> +        max_addr /= 2;
>>> +
>>> +    return max_addr - 1;
>>> +};
>>> +
>>> +static inline void dpu_hw_dsc_disable_1_2(struct dpu_hw_dsc *hw_dsc)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *hw;
>>> +    const struct dpu_dsc_sub_blks *sblk;
>>> +
>>> +    if (!hw_dsc)
>>> +        return;
>>> +
>>> +    hw = &hw_dsc->hw;
>>> +    sblk = hw_dsc->caps->sblk;
>>> +    DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CFG, 0);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + ENC_DF_CTRL, 0);
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_MAIN_CONF, 0);
>>> +}
>>> +
>>> +static inline void dpu_hw_dsc_config_1_2(struct dpu_hw_dsc *hw_dsc,
>>> +                     struct drm_dsc_config *dsc,
>>> +                     u32 mode,
>>> +                     u32 initial_lines)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *hw;
>>> +    const struct dpu_dsc_sub_blks *sblk;
>>> +    u32 data = 0;
>>> +    u32 det_thresh_flatness;
>>> +    u32 num_active_slice_per_enc;
>>> +    u32 bpp;
>>> +
>>> +    if (!hw_dsc || !dsc)
>>> +        return;
>>> +
>>> +    hw = &hw_dsc->hw;
>>> +
>>> +    sblk = hw_dsc->caps->sblk;
>>> +
>>> +    if (mode & DSC_MODE_SPLIT_PANEL)
>>> +        data |= BIT(0);
>>> +
>>> +    if (mode & DSC_MODE_MULTIPLEX)
>>> +        data |= BIT(1);
>>> +
>>> +    num_active_slice_per_enc = dsc->slice_count;
>>> +    if (mode & DSC_MODE_MULTIPLEX)
>>> +        num_active_slice_per_enc = dsc->slice_count >> 1;
>>> +
>>> +    data |= (num_active_slice_per_enc & 0x3) << 7;
>>> +
>>> +    DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, data);
>>> +
>>> +    data = (initial_lines & 0xff);
>>> +
>>> +    if (mode & DSC_MODE_VIDEO)
>>> +        data |= BIT(9);
>>> +
>>> +    data |= (_dsc_calc_ob_max_addr(hw_dsc, num_active_slice_per_enc) 
>>> << 18);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + ENC_DF_CTRL, data);
>>> +
>>> +    data = (dsc->dsc_version_minor & 0xf) << 28;
>>> +    if (dsc->dsc_version_minor == 0x2) {
>>> +        if (dsc->native_422)
>>> +            data |= BIT(22);
>>> +        if (dsc->native_420)
>>> +            data |= BIT(21);
>>> +    }
>>> +
>>> +    bpp = dsc->bits_per_pixel;
>>> +    /* as per hw requirement bpp should be programmed
>>> +     * twice the actual value in case of 420 or 422 encoding
>>> +     */
>>> +    if (dsc->native_422 || dsc->native_420)
>>> +        bpp = 2 * bpp;
>>> +    data |= (dsc->block_pred_enable ? 1 : 0) << 20;
>>> +    data |= bpp << 10;
>>> +    data |= (dsc->line_buf_depth & 0xf) << 6;
>>> +    data |= dsc->convert_rgb << 4;
>>> +    data |= dsc->bits_per_component & 0xf;
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_MAIN_CONF, data);
>>> +
>>> +    data = (dsc->pic_width & 0xffff) |
>>> +        ((dsc->pic_height & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_PICTURE_SIZE, data);
>>> +
>>> +    data = (dsc->slice_width & 0xffff) |
>>> +        ((dsc->slice_height & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_SLICE_SIZE, data);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_MISC_SIZE,
>>> +              (dsc->slice_chunk_size) & 0xffff);
>>> +
>>> +    data = (dsc->initial_xmit_delay & 0xffff) |
>>> +        ((dsc->initial_dec_delay & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_HRD_DELAYS, data);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_SCALE,
>>> +              dsc->initial_scale_value & 0x3f);
>>> +
>>> +    data = (dsc->scale_increment_interval & 0xffff) |
>>> +        ((dsc->scale_decrement_interval & 0x7ff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_SCALE_INC_DEC, data);
>>> +
>>> +    data = (dsc->first_line_bpg_offset & 0x1f) |
>>> +        ((dsc->second_line_bpg_offset & 0x1f) << 5);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_OFFSETS_1, data);
>>> +
>>> +    data = (dsc->nfl_bpg_offset & 0xffff) |
>>> +        ((dsc->slice_bpg_offset & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_OFFSETS_2, data);
>>> +
>>> +    data = (dsc->initial_offset & 0xffff) |
>>> +        ((dsc->final_offset & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_OFFSETS_3, data);
>>> +
>>> +    data = (dsc->nsl_bpg_offset & 0xffff) |
>>> +        ((dsc->second_line_offset_adj & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_OFFSETS_4, data);
>>> +
>>> +    data = (dsc->flatness_min_qp & 0x1f);
>>> +    data |= (dsc->flatness_max_qp & 0x1f) << 5;
>>> +
>>> +    det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
>>> +    data |= (det_thresh_flatness & 0xff) << 10;
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_FLATNESS_QP, data);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MODEL_SIZE,
>>> +              (dsc->rc_model_size) & 0xffff);
>>> +
>>> +    data = dsc->rc_edge_factor & 0xf;
>>> +    data |= (dsc->rc_quant_incr_limit0 & 0x1f) << 8;
>>> +    data |= (dsc->rc_quant_incr_limit1 & 0x1f) << 13;
>>> +    data |= (dsc->rc_tgt_offset_high & 0xf) << 20;
>>> +    data |= (dsc->rc_tgt_offset_low & 0xf) << 24;
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_CONFIG, data);
>>> +
>>> +    /* program the dsc wrapper */
>>> +    data = BIT(0); /* encoder enable */
>>> +    if (dsc->native_422)
>>> +        data |= BIT(8);
>>> +    else if (dsc->native_420)
>>> +        data |= BIT(9);
>>> +    if (!dsc->convert_rgb)
>>> +        data |= BIT(10);
>>> +    if (dsc->bits_per_component == 8)
>>> +        data |= BIT(11);
>>> +    if (mode & DSC_MODE_SPLIT_PANEL)
>>> +        data |= BIT(12);
>>> +    if (mode & DSC_MODE_MULTIPLEX)
>>> +        data |= BIT(13);
>>> +    if (!(mode & DSC_MODE_VIDEO))
>>> +        data |= BIT(17);
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CFG, data);
>>> +}
>>> +
>>> +static inline void dpu_hw_dsc_config_thresh_1_2(struct dpu_hw_dsc 
>>> *hw_dsc,
>>> +                        struct drm_dsc_config *dsc)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *hw;
>>> +    const struct dpu_dsc_sub_blks *sblk;
>>> +    struct drm_dsc_rc_range_parameters *rc;
>>> +
>>> +    if (!hw_dsc || !dsc)
>>> +        return;
>>> +
>>> +    hw = &hw_dsc->hw;
>>> +
>>> +    sblk = hw_dsc->caps->sblk;
>>> +
>>> +    rc = dsc->rc_range_params;
>>> +
>>> +    /*
>>> +     * With BUF_THRESH -- 14 in total
>>> +     * each register contains 4 thresh values with the last register
>>> +     * containing only 2 thresh values
>>> +     */
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_BUF_THRESH_0,
>>> +              (dsc->rc_buf_thresh[0] << 0) |
>>> +              (dsc->rc_buf_thresh[1] << 8) |
>>> +              (dsc->rc_buf_thresh[2] << 16) |
>>> +              (dsc->rc_buf_thresh[3] << 24));
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_BUF_THRESH_1,
>>> +              (dsc->rc_buf_thresh[4] << 0) |
>>> +              (dsc->rc_buf_thresh[5] << 8) |
>>> +              (dsc->rc_buf_thresh[6] << 16) |
>>> +              (dsc->rc_buf_thresh[7] << 24));
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_BUF_THRESH_2,
>>> +              (dsc->rc_buf_thresh[8] << 0) |
>>> +              (dsc->rc_buf_thresh[9] << 8) |
>>> +              (dsc->rc_buf_thresh[10] << 16) |
>>> +              (dsc->rc_buf_thresh[11] << 24));
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_BUF_THRESH_3,
>>> +              (dsc->rc_buf_thresh[12] << 0) |
>>> +              (dsc->rc_buf_thresh[13] << 8));
>>> +
>>> +    /*
>>> +     * with min/max_QP -- 5 bits
>>> +     * each register contains 5 min_qp or max_qp for total of 15
>>> +     *
>>> +     * With BPG_OFFSET -- 6 bits
>>> +     * each register contains 5 BPG_offset for total of 15
>>> +     */
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MIN_QP_0,
>>> +              (rc[0].range_min_qp << 0) |
>>> +              (rc[1].range_min_qp << 5) |
>>> +              (rc[2].range_min_qp << 10) |
>>> +              (rc[3].range_min_qp << 15) |
>>> +              (rc[4].range_min_qp << 20));
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MAX_QP_0,
>>> +              (rc[0].range_max_qp << 0) |
>>> +              (rc[1].range_max_qp << 5) |
>>> +              (rc[2].range_max_qp << 10) |
>>> +              (rc[3].range_max_qp << 15) |
>>> +              (rc[4].range_max_qp << 20));
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_RANGE_BPG_OFFSETS_0,
>>> +              (rc[0].range_bpg_offset << 0) |
>>> +              (rc[1].range_bpg_offset << 6) |
>>> +              (rc[2].range_bpg_offset << 12) |
>>> +              (rc[3].range_bpg_offset << 18) |
>>> +              (rc[4].range_bpg_offset << 24));
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MIN_QP_1,
>>> +              (rc[5].range_min_qp << 0) |
>>> +              (rc[6].range_min_qp << 5) |
>>> +              (rc[7].range_min_qp << 10) |
>>> +              (rc[8].range_min_qp << 15) |
>>> +              (rc[9].range_min_qp << 20));
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MAX_QP_1,
>>> +              (rc[5].range_max_qp << 0) |
>>> +              (rc[6].range_max_qp << 5) |
>>> +              (rc[7].range_max_qp << 10) |
>>> +              (rc[8].range_max_qp << 15) |
>>> +              (rc[9].range_max_qp << 20));
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_RANGE_BPG_OFFSETS_1,
>>> +              (rc[5].range_bpg_offset << 0) |
>>> +              (rc[6].range_bpg_offset << 6) |
>>> +              (rc[7].range_bpg_offset << 12) |
>>> +              (rc[8].range_bpg_offset << 18) |
>>> +              (rc[9].range_bpg_offset << 24));
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MIN_QP_2,
>>> +              (rc[10].range_min_qp << 0) |
>>> +              (rc[11].range_min_qp << 5) |
>>> +              (rc[12].range_min_qp << 10) |
>>> +              (rc[13].range_min_qp << 15) |
>>> +              (rc[14].range_min_qp << 20));
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_MAX_QP_2,
>>> +              (rc[10].range_max_qp << 0) |
>>> +              (rc[11].range_max_qp << 5) |
>>> +              (rc[12].range_max_qp << 10) |
>>> +              (rc[13].range_max_qp << 15) |
>>> +              (rc[14].range_max_qp << 20));
>>> +    DPU_REG_WRITE(hw, sblk->enc.base + DSC_RC_RANGE_BPG_OFFSETS_2,
>>> +              (rc[10].range_bpg_offset << 0) |
>>> +              (rc[11].range_bpg_offset << 6) |
>>> +              (rc[12].range_bpg_offset << 12) |
>>> +              (rc[13].range_bpg_offset << 18) |
>>> +              (rc[14].range_bpg_offset << 24));
>>> +}
>>> +
>>> +static inline void dpu_hw_dsc_bind_pingpong_blk_1_2(struct 
>>> dpu_hw_dsc *hw_dsc,
>>> +                            const enum dpu_pingpong pp)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *hw;
>>> +    const struct dpu_dsc_sub_blks *sblk;
>>> +    int mux_cfg = 0xf; /* Disabled */
>>> +
>>> +    hw = &hw_dsc->hw;
>>> +
>>> +    sblk = hw_dsc->caps->sblk;
>>> +
>>> +    if (pp)
>>> +        mux_cfg = (pp - PINGPONG_0) & 0x7;
>>
>> Do we need an unbind support here like we do for the DSC 1.1?
> 
> PINGPONG_NONE is used for unbind. (exactly same as DSC 1.1).
> 
> Are you wand DRM_DEBUG_KMS(...) add here same as DSC 1.1?

No, that's fine. I'd have probably preferred an explicit if-else, but 
this is also fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> 
>>
>>> +
>>> +    DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CTL, mux_cfg);
>>> +}
>>> +
>>> +static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
>>> +                   const unsigned long features)
>>> +{
>>> +    ops->dsc_disable = dpu_hw_dsc_disable_1_2;
>>> +    ops->dsc_config = dpu_hw_dsc_config_1_2;
>>> +    ops->dsc_config_thresh = dpu_hw_dsc_config_thresh_1_2;
>>> +    ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
>>> +}
>>> +
>>> +struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(const struct dpu_dsc_cfg *cfg,
>>> +                       void __iomem *addr)
>>> +{
>>> +    struct dpu_hw_dsc *c;
>>> +
>>> +    c = kzalloc(sizeof(*c), GFP_KERNEL);
>>> +    if (!c)
>>> +        return ERR_PTR(-ENOMEM);
>>> +
>>> +    c->hw.blk_addr = addr + cfg->base;
>>> +    c->hw.log_mask = DPU_DBG_MASK_DSC;
>>> +
>>> +    c->idx = cfg->id;
>>> +    c->caps = cfg;
>>> +    _setup_dcs_ops_1_2(&c->ops, c->caps->features);
>>> +
>>> +    return c;
>>> +}
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> index f0fc704..502dd60 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> @@ -1,6 +1,7 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>   /*
>>>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>>    */
>>>     #define pr_fmt(fmt)    "[drm:%s] " fmt, __func__
>>> @@ -246,7 +247,11 @@ int dpu_rm_init(struct dpu_rm *rm,
>>>           struct dpu_hw_dsc *hw;
>>>           const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
>>>   -        hw = dpu_hw_dsc_init(dsc, mmio);
>>> +        if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
>>> +            hw = dpu_hw_dsc_init_1_2(dsc, mmio);
>>> +        else
>>> +            hw = dpu_hw_dsc_init(dsc, mmio);
>>> +
>>>           if (IS_ERR_OR_NULL(hw)) {
>>>               rc = PTR_ERR(hw);
>>>               DPU_ERROR("failed dsc object creation: err %d\n", rc);
>>

-- 
With best wishes
Dmitry

