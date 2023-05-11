Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F8D6FF85B
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 19:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F4D10E0AE;
	Thu, 11 May 2023 17:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD3F10E57E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 17:24:41 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f24d4900bbso6452289e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683825879; x=1686417879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KWaMFFHYSmRLe2E55OsnwM2qXpuKmSoutMI7wmgPqZQ=;
 b=bU5DS9ip6KG3s0aBCB8t/0pSkX5vShAoNt0ybmSrucVa4vtX3uBFRIPoUZFED3YYUD
 h82O8otATcbzYVFxieNfQ/L6ZQaf9AgsPDxx/RXrDEgSLYDGD/GJaFF2hpypKBYiXihW
 FFTNriy1a41uGF+NMfyvui7bF9fnhUZX5VxSSM5vBuQ4NwREPYwqRB4ps9FYRqLy3ZB0
 ytgpix/O/Xsxj9aS8PAlGSkjZJyv3ELVMsAetouiz0Q+37R+B+3/QJHk60hL8/Kvd7sI
 Ze7h9tp1pT3LNioteLnhmlcKIM+GTnmajZtAClyRNQcAfIW6e7bUlNr0rETGXpqLCh9M
 uppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683825879; x=1686417879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KWaMFFHYSmRLe2E55OsnwM2qXpuKmSoutMI7wmgPqZQ=;
 b=UP52JOSXaqqbssYGiIyxIO3IA/SGEil7I4atnUYpmSj9873dAP+Zr9GwmDmnZsmiQK
 xa58Y9S0Y1SLE9PSzkzTEDpoHfIw/7u/Lmkq10LJS/mVP0WIVp9OeZ7jHGRT4+o+9EbN
 PIm/wpfctdIRyJSawfiplD2yMM//1HT4PSJ5ey2xMlc6LWmxRQLA5SbDbm9sUF5Kq/vB
 Tx1T8/AV+SGpr3VkTlo49Fr6IVwmW8dicQQKCpj8av84aj7LCTLz0wmT3pJOotEGg6RL
 wq5VhbQ7T3phRYM6/SpbIzrg6AJxTsONTq7Dh30PetOF9zhjWqE57fc2nAmueuJfjeoc
 zb1A==
X-Gm-Message-State: AC+VfDy9BXHvwTvreu/yENxlaSU/4aGGjqDIZOq2G7a6f0iQqgGnLx0d
 GGJfED34ETUGvvY9/68rcP0cdA==
X-Google-Smtp-Source: ACHHUZ6ySgfxTlstid5QvJ1hiW8/p22e/casrHcoa0Oy9V5RLYVPPtZb1tfLvrOpHa8Ea0WLPDUEOw==
X-Received: by 2002:a05:6512:1024:b0:4ec:89d3:a8ac with SMTP id
 r4-20020a056512102400b004ec89d3a8acmr2690830lfr.30.1683825879170; 
 Thu, 11 May 2023 10:24:39 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o8-20020ac24348000000b004d5a6dcb94fsm1176727lfl.33.2023.05.11.10.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 10:24:38 -0700 (PDT)
Message-ID: <43251f91-9e6f-711c-6069-2cb8fe4c2b35@linaro.org>
Date: Thu, 11 May 2023 20:24:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 5/8] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-6-git-send-email-quic_khsieh@quicinc.com>
 <e2a7747a-b666-fd97-bfcf-8820dcaf5a03@linaro.org>
 <70aee0b0-d28e-ca8d-b84d-cb45acc6de70@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <70aee0b0-d28e-ca8d-b84d-cb45acc6de70@quicinc.com>
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

On 11/05/2023 20:00, Kuogee Hsieh wrote:
> 
> On 5/10/2023 9:52 PM, Dmitry Baryshkov wrote:
>> On 11/05/2023 01:07, Kuogee Hsieh wrote:
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
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile                   |   1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  32 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  14 +-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 385 
>>> +++++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |   7 +-
>>>   5 files changed, 435 insertions(+), 4 deletions(-)
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
>>> index 138080a..bdff74d 100644
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
>>> +        void __iomem *addr);
>>> +
>>> +/**
>>>    * dpu_hw_dsc_destroy - destroys dsc driver context
>>>    * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
>>>    */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>>> new file mode 100644
>>> index 00000000..0c77c85
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>>> @@ -0,0 +1,385 @@
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
>>> +    u32 offset;
>>> +
>>> +    if (!hw_dsc)
>>> +        return;
>>> +
>>> +    hw = &hw_dsc->hw;
>>> +    offset = hw_dsc->caps->sblk->ctl.base;
>>> +    DPU_REG_WRITE(hw, offset + DSC_CFG, 0);
>>> +
>>> +    offset = hw_dsc->caps->sblk->enc.base;
>>> +    DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, 0);
>>> +    DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, 0);
>>
>> This has the same problem as before. By looking at this line you can 
>> not check where this write is targeted. Instead I'd suggest storing 
>> sblk in the local variable and then using something like:
>>
>> DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CFG, 0);
>>
>> Same applies to other functions in this patch.
>>
>>> +}
>>> +
>>> +static inline void dpu_hw_dsc_config_1_2(struct dpu_hw_dsc *hw_dsc,
>>> +                  struct drm_dsc_config *dsc,
>>> +                  u32 mode,
>>> +                  u32 initial_lines)
>>
>> Please indent to the opening brace. If using Vim, this is the "set 
>> cino=(0" setting
>>
>>> +{
>>> +    struct dpu_hw_blk_reg_map *hw;
>>> +    u32 offset;
>>> +    u32 data = 0;
>>> +    u32 det_thresh_flatness;
>>> +    u32 num_active_ss_per_enc;
>>
>> s/_ss_/_slice_/g
>>
>>> +    u32 bpp;
>>> +
>>> +    if (!hw_dsc || !dsc)
>>> +        return;
>>> +
>>> +    hw = &hw_dsc->hw;
>>> +
>>> +    offset = hw_dsc->caps->sblk->enc.base;
>>> +
>>> +    if (mode & DSC_MODE_SPLIT_PANEL)
>>> +        data |= BIT(0);
>>> +
>>> +    if (mode & DSC_MODE_MULTIPLEX)
>>> +        data |= BIT(1);
>>> +
>>> +    num_active_ss_per_enc = dsc->slice_count;
>>> +    if (mode & DSC_MODE_MULTIPLEX)
>>> +        num_active_ss_per_enc = dsc->slice_count >> 1;
>>> +
>>> +    data |= (num_active_ss_per_enc & 0x3) << 7;
>>> +
>>> +    DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, data);
>>> +
>>> +    data = (initial_lines & 0xff);
>>> +
>>> +    if (mode & DSC_MODE_VIDEO)
>>> +        data |= BIT(9);
>>> +
>>> +    data |= (_dsc_calc_ob_max_addr(hw_dsc, num_active_ss_per_enc) << 
>>> 18);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, data);
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
>>> +    DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, data);
>>> +
>>> +    data = (dsc->pic_width & 0xffff) |
>>> +        ((dsc->pic_height & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_PICTURE_SIZE, data);
>>> +
>>> +    data = (dsc->slice_width & 0xffff) |
>>> +        ((dsc->slice_height & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_SLICE_SIZE, data);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_MISC_SIZE,
>>> +            (dsc->slice_chunk_size) & 0xffff);
>>> +
>>> +    data = (dsc->initial_xmit_delay & 0xffff) |
>>> +        ((dsc->initial_dec_delay & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_HRD_DELAYS, data);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_SCALE,
>>> +            dsc->initial_scale_value & 0x3f);
>>> +
>>> +    data = (dsc->scale_increment_interval & 0xffff) |
>>> +        ((dsc->scale_decrement_interval & 0x7ff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_SCALE_INC_DEC, data);
>>> +
>>> +    data = (dsc->first_line_bpg_offset & 0x1f) |
>>> +        ((dsc->second_line_bpg_offset & 0x1f) << 5);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_1, data);
>>> +
>>> +    data = (dsc->nfl_bpg_offset & 0xffff) |
>>> +        ((dsc->slice_bpg_offset & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_2, data);
>>> +
>>> +    data = (dsc->initial_offset & 0xffff) |
>>> +        ((dsc->final_offset & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_3, data);
>>> +
>>> +    data = (dsc->nsl_bpg_offset & 0xffff) |
>>> +        ((dsc->second_line_offset_adj & 0xffff) << 16);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_4, data);
>>> +
>>> +    data = (dsc->flatness_min_qp & 0x1f);
>>> +    data |= (dsc->flatness_max_qp & 0x1f) << 5;
>>> +
>>> +    det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
>>> +    data |= (det_thresh_flatness & 0xff) << 10;
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_FLATNESS_QP, data);
>>> +
>>> +    DPU_REG_WRITE(hw, offset + DSC_RC_MODEL_SIZE,
>>> +            (dsc->rc_model_size) & 0xffff);
>>> +
>>> +    data = dsc->rc_edge_factor & 0xf;
>>> +    data |= (dsc->rc_quant_incr_limit0 & 0x1f) << 8;
>>> +    data |= (dsc->rc_quant_incr_limit1 & 0x1f) << 13;
>>> +    data |= (dsc->rc_tgt_offset_high & 0xf) << 20;
>>> +    data |= (dsc->rc_tgt_offset_low & 0xf) << 24;
>>
>> FIELD_PREP should become our friend. As the DPU driver does not use 
>> generated headers/helpers, we should probably enforce its usage all 
>> over the code.
> 
> Agree, since this patch series have almost complete the review process.
> 
> can we start use FIELD_PREP at next?

Yes

-- 
With best wishes
Dmitry

