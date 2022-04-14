Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A1501D97
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 23:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4165910E247;
	Thu, 14 Apr 2022 21:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F01C10E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 21:41:34 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b21so11306083lfb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2/Yn6rcCLuVkDd7ZWYN5mIX/4R5D86jFJbrRjPVsRLM=;
 b=axykHEMfKkAeSrMwdhIgCC1B5sU831jr45QiAdiHfU3Q2OHbPbFl5+QN0OsYMAwNB+
 F+JyjkhB4qebk7loJvfpfdepXiH1IDiTiPubP9s/UT9B9Ts25p1wE3lJvhn5czG5NleR
 6rzGiBXEaGxKMcLwt/Q07i9a7DEZdx69iopEocNVeD9dTs6xpXqbWZqWlgm5HcXfNrN9
 vnKsehQDHIyNtih2RppZ1mC0CiPX4NSeTZkNDFHzT2HsCOH1XFnGZi9FxAl61cgykAuu
 dMBLqMoWZ0J1SQ9ZWCbaUlAbHHhxwip06YXSId7GTmeyvsZQWlBc8Wy9Xp9uwxaJWSHD
 XE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2/Yn6rcCLuVkDd7ZWYN5mIX/4R5D86jFJbrRjPVsRLM=;
 b=IhNmjMIBVumRTQfrlOtIMTNdCf6UdF/1qTuYAaUKf+GC1lLiDPVVY9AAxANF9UyQ8k
 CvNCvVemnxzYCXJ+Jh2Hj55eNQc5fpovO9/++ToGpItxTaurMqYISzqmxkfPGlu68P87
 abiNePBn5Rtvw84BnDxqxnYJjEiUIWIu2+7um32t4ohElKS/Dx1ON13R6CWmin2izGge
 pW0JMx6pn3zJpwdgJL8zWoY2SyJr+SjLyiDS3Ddo7HQFx3FmLJzXpVZldu3y1H5QTEB0
 LXtdjI7V5GuZBtpHOf4W6FaGlzZhTmwZccDKeewW7Zi/77KwuhH08hnpjqHhR+olwItf
 MMIA==
X-Gm-Message-State: AOAM531Piys+xqMYyWibtIJmlUO3/y64b7hb3e6UC/+KcbtuMn/FxTNL
 4SI7ta2so2Ut1sCgytO+ZB5Q0Q==
X-Google-Smtp-Source: ABdhPJxHPxHf5dwEUNaag0aZq2pTBm0A4XJU0QdwJ6J/CNXok/eaNSI1uJEfKpKBB5fZ61xhrPbOAQ==
X-Received: by 2002:a05:6512:3402:b0:448:cd3:4b67 with SMTP id
 i2-20020a056512340200b004480cd34b67mr3110192lfr.294.1649972492388; 
 Thu, 14 Apr 2022 14:41:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 i16-20020ac25b50000000b0046bc407519dsm117510lfp.130.2022.04.14.14.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 14:41:32 -0700 (PDT)
Message-ID: <8e0c0a82-5dd4-916a-d969-0e4a1e6c8bf2@linaro.org>
Date: Fri, 15 Apr 2022 00:41:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 02/12] drm/msm/dpu: add dpu_hw_wb abstraction for
 writeback blocks
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-3-git-send-email-quic_abhinavk@quicinc.com>
 <0351391d-e9ad-cd4f-cf64-d76bdaed898d@linaro.org>
 <37652560-e752-a837-a310-5e12ad4986a6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <37652560-e752-a837-a310-5e12ad4986a6@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2022 00:28, Abhinav Kumar wrote:
> Hi Dmitry
> 
> Thanks for the review.
> 
> Finally got back to this series after getting acks on the drm_writeback 
> core changes.
> 
> 
> On 2/4/2022 2:56 PM, Dmitry Baryshkov wrote:
>> On 05/02/2022 00:17, Abhinav Kumar wrote:
>>> Add the dpu_hw_wb abstraction to program registers related to the
>>> writeback block. These will be invoked once all the configuration
>>> is set and ready to be programmed to the registers.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Few minor comments bellow.
>>
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 267 
>>> ++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h | 145 ++++++++++++++++
>>>   3 files changed, 413 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
>>>
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index 03ab55c..c43ef35 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -66,6 +66,7 @@ msm-y := \
>>>       disp/dpu1/dpu_hw_top.o \
>>>       disp/dpu1/dpu_hw_util.o \
>>>       disp/dpu1/dpu_hw_vbif.o \
>>> +    disp/dpu1/dpu_hw_wb.o \
>>>       disp/dpu1/dpu_io_util.o \
>>>       disp/dpu1/dpu_kms.o \
>>>       disp/dpu1/dpu_mdss.o \
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>>> new file mode 100644
>>> index 0000000..d395475
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
>>> @@ -0,0 +1,267 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> + /*
>>> +  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved
>>> +  */
>>> +
>>> +#include "dpu_hw_mdss.h"
>>> +#include "dpu_hwio.h"
>>> +#include "dpu_hw_catalog.h"
>>> +#include "dpu_hw_wb.h"
>>> +#include "dpu_formats.h"
>>> +#include "dpu_kms.h"
>>> +
>>> +#define WB_DST_FORMAT                         0x000
>>> +#define WB_DST_OP_MODE                        0x004
>>> +#define WB_DST_PACK_PATTERN                   0x008
>>> +#define WB_DST0_ADDR                          0x00C
>>> +#define WB_DST1_ADDR                          0x010
>>> +#define WB_DST2_ADDR                          0x014
>>> +#define WB_DST3_ADDR                          0x018
>>> +#define WB_DST_YSTRIDE0                       0x01C
>>> +#define WB_DST_YSTRIDE1                       0x020
>>> +#define WB_DST_YSTRIDE1                       0x020
>>> +#define WB_DST_DITHER_BITDEPTH                0x024
>>> +#define WB_DST_MATRIX_ROW0                    0x030
>>> +#define WB_DST_MATRIX_ROW1                    0x034
>>> +#define WB_DST_MATRIX_ROW2                    0x038
>>> +#define WB_DST_MATRIX_ROW3                    0x03C
>>> +#define WB_DST_WRITE_CONFIG                   0x048
>>> +#define WB_ROTATION_DNSCALER                  0x050
>>> +#define WB_ROTATOR_PIPE_DOWNSCALER            0x054
>>> +#define WB_N16_INIT_PHASE_X_C03               0x060
>>> +#define WB_N16_INIT_PHASE_X_C12               0x064
>>> +#define WB_N16_INIT_PHASE_Y_C03               0x068
>>> +#define WB_N16_INIT_PHASE_Y_C12               0x06C
>>> +#define WB_OUT_SIZE                           0x074
>>> +#define WB_ALPHA_X_VALUE                      0x078
>>> +#define WB_DANGER_LUT                         0x084
>>> +#define WB_SAFE_LUT                           0x088
>>> +#define WB_QOS_CTRL                           0x090
>>> +#define WB_CREQ_LUT_0                         0x098
>>> +#define WB_CREQ_LUT_1                         0x09C
>>> +#define WB_UBWC_STATIC_CTRL                   0x144
>>> +#define WB_MUX                                0x150
>>> +#define WB_CROP_CTRL                          0x154
>>> +#define WB_CROP_OFFSET                        0x158
>>> +#define WB_CSC_BASE                           0x260
>>> +#define WB_DST_ADDR_SW_STATUS                 0x2B0
>>> +#define WB_CDP_CNTL                           0x2B4
>>> +#define WB_OUT_IMAGE_SIZE                     0x2C0
>>> +#define WB_OUT_XY                             0x2C4
>>> +
>>> +/* WB_QOS_CTRL */
>>> +#define WB_QOS_CTRL_DANGER_SAFE_EN            BIT(0)
>>> +
>>> +static const struct dpu_wb_cfg *_wb_offset(enum dpu_wb wb,
>>> +        const struct dpu_mdss_cfg *m, void __iomem *addr,
>>> +        struct dpu_hw_blk_reg_map *b)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < m->wb_count; i++) {
>>> +        if (wb == m->wb[i].id) {
>>> +            b->base_off = addr;
>>> +            b->blk_off = m->wb[i].base;
>>> +            b->length = m->wb[i].len;
>>> +            b->hwversion = m->hwversion;
>>> +            return &m->wb[i];
>>> +        }
>>> +    }
>>> +    return ERR_PTR(-EINVAL);
>>> +}
>>> +
>>> +static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
>>> +        struct dpu_hw_wb_cfg *data)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>> +
>>> +    DPU_REG_WRITE(c, WB_DST0_ADDR, data->dest.plane_addr[0]);
>>> +    DPU_REG_WRITE(c, WB_DST1_ADDR, data->dest.plane_addr[1]);
>>> +    DPU_REG_WRITE(c, WB_DST2_ADDR, data->dest.plane_addr[2]);
>>> +    DPU_REG_WRITE(c, WB_DST3_ADDR, data->dest.plane_addr[3]);
>>> +}
>>> +
>>> +static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
>>> +        struct dpu_hw_wb_cfg *data)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>> +    const struct dpu_format *fmt = data->dest.format;
>>> +    u32 dst_format, pattern, ystride0, ystride1, outsize, chroma_samp;
>>> +    u32 write_config = 0;
>>> +    u32 opmode = 0;
>>> +    u32 dst_addr_sw = 0;
>>> +
>>> +    chroma_samp = fmt->chroma_sample;
>>> +
>>> +    dst_format = (chroma_samp << 23) |
>>> +        (fmt->fetch_planes << 19) |
>>> +        (fmt->bits[C3_ALPHA] << 6) |
>>> +        (fmt->bits[C2_R_Cr] << 4) |
>>> +        (fmt->bits[C1_B_Cb] << 2) |
>>> +        (fmt->bits[C0_G_Y] << 0);
>>> +
>>> +    if (fmt->bits[C3_ALPHA] || fmt->alpha_enable) {
>>> +        dst_format |= BIT(8); /* DSTC3_EN */
>>> +        if (!fmt->alpha_enable ||
>>> +            !(ctx->caps->features & BIT(DPU_WB_PIPE_ALPHA)))
>>> +            dst_format |= BIT(14); /* DST_ALPHA_X */
>>> +    }
>>> +
>>> +    pattern = (fmt->element[3] << 24) |
>>> +        (fmt->element[2] << 16) |
>>> +        (fmt->element[1] << 8)  |
>>> +        (fmt->element[0] << 0);
>>> +
>>> +    dst_format |= (fmt->unpack_align_msb << 18) |
>>> +        (fmt->unpack_tight << 17) |
>>> +        ((fmt->unpack_count - 1) << 12) |
>>> +        ((fmt->bpp - 1) << 9);
>>> +
>>> +    ystride0 = data->dest.plane_pitch[0] |
>>> +        (data->dest.plane_pitch[1] << 16);
>>> +    ystride1 = data->dest.plane_pitch[2] |
>>> +    (data->dest.plane_pitch[3] << 16);
>>> +
>>> +    if (drm_rect_height(&data->roi) && drm_rect_width(&data->roi))
>>> +        outsize = (drm_rect_height(&data->roi) << 16) | 
>>> drm_rect_width(&data->roi);
>>> +    else
>>> +        outsize = (data->dest.height << 16) | data->dest.width;
>>> +
>>> +    DPU_REG_WRITE(c, WB_ALPHA_X_VALUE, 0xFF);
>>> +    DPU_REG_WRITE(c, WB_DST_FORMAT, dst_format);
>>> +    DPU_REG_WRITE(c, WB_DST_OP_MODE, opmode);
>>> +    DPU_REG_WRITE(c, WB_DST_PACK_PATTERN, pattern);
>>> +    DPU_REG_WRITE(c, WB_DST_YSTRIDE0, ystride0);
>>> +    DPU_REG_WRITE(c, WB_DST_YSTRIDE1, ystride1);
>>> +    DPU_REG_WRITE(c, WB_OUT_SIZE, outsize);
>>> +    DPU_REG_WRITE(c, WB_DST_WRITE_CONFIG, write_config);
>>> +    DPU_REG_WRITE(c, WB_DST_ADDR_SW_STATUS, dst_addr_sw);
>>> +}
>>> +
>>> +static void dpu_hw_wb_roi(struct dpu_hw_wb *ctx, struct 
>>> dpu_hw_wb_cfg *wb)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>> +    u32 image_size, out_size, out_xy;
>>> +
>>> +    image_size = (wb->dest.height << 16) | wb->dest.width;
>>> +    out_xy = 0;
>>> +    out_size = (drm_rect_height(&wb->roi) << 16) | 
>>> drm_rect_width(&wb->roi);
>>> +
>>> +    DPU_REG_WRITE(c, WB_OUT_IMAGE_SIZE, image_size);
>>> +    DPU_REG_WRITE(c, WB_OUT_XY, out_xy);
>>> +    DPU_REG_WRITE(c, WB_OUT_SIZE, out_size);
>>> +}
>>> +
>>> +static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>>> +        struct dpu_hw_wb_qos_cfg *cfg)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c = &ctx->hw;
>>> +    u32 qos_ctrl = 0;
>>> +
>>> +    if (!ctx || !cfg)
>>> +        return;
>>> +
>>> +    DPU_REG_WRITE(c, WB_DANGER_LUT, cfg->danger_lut);
>>> +    DPU_REG_WRITE(c, WB_SAFE_LUT, cfg->safe_lut);
>>> +
>>> +    if (ctx->caps && test_bit(DPU_WB_QOS_8LVL, &ctx->caps->features)) {
>>> +        DPU_REG_WRITE(c, WB_CREQ_LUT_0, cfg->creq_lut);
>>> +        DPU_REG_WRITE(c, WB_CREQ_LUT_1, cfg->creq_lut >> 32);
>>> +    }
>>> +
>>> +    if (cfg->danger_safe_en)
>>> +        qos_ctrl |= WB_QOS_CTRL_DANGER_SAFE_EN;
>>> +
>>> +    DPU_REG_WRITE(c, WB_QOS_CTRL, qos_ctrl);
>>> +}
>>> +
>>> +static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
>>> +        struct dpu_hw_wb_cdp_cfg *cfg)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c;
>>> +    u32 cdp_cntl = 0;
>>> +
>>> +    if (!ctx || !cfg)
>>> +        return;
>>> +
>>> +    c = &ctx->hw;
>>> +
>>> +    if (cfg->enable)
>>> +        cdp_cntl |= BIT(0);
>>> +    if (cfg->ubwc_meta_enable)
>>> +        cdp_cntl |= BIT(1);
>>> +    if (cfg->preload_ahead == DPU_WB_CDP_PRELOAD_AHEAD_64)
>>> +        cdp_cntl |= BIT(3);
>>> +
>>> +    DPU_REG_WRITE(c, WB_CDP_CNTL, cdp_cntl);
>>> +}
>>
>> I thought for a moment if we can unify these several functions with 
>> SSPP code. Most probably we can, but I'm not sure that it make sense.
>>
> I understand why you might think that way. Some bitfields in the 
> register have the same name.

Yes. I was looking at the way the DS and SSPP share the scaler code. So 
came the idea of sharing the CDP.

> 
> Both SSPP and WB do have CDP_CNTL but with some different bit 
> definitions and ofcourse the register offsets are different.
> 
> So I think we are better off them being separate right now.

Agree. Let's land this code first. Later we can check it would make 
sense to unify the ops or not.

> 
>>> +
>>> +static void dpu_hw_wb_bind_pingpong_blk(
>>> +        struct dpu_hw_wb *ctx,
>>> +        bool enable, const enum dpu_pingpong pp)
>>> +{
>>> +    struct dpu_hw_blk_reg_map *c;
>>> +    int mux_cfg = 0xF;
>>> +
>>> +    if (!ctx)
>>> +        return;
>>> +
>>> +    c = &ctx->hw;
>>> +    if (enable)
>>> +        mux_cfg = (pp - PINGPONG_0) & 0x7;
>>
>> Just noticed that dpu_hw_intf_bind_pingpong_blk() keeps higher bits 
>> rather than setting them to 0. Which policy should we follow here?
> Yes correct. I can also preserve the upper bits here while posting the 
> next version.

Thank you!

>>
>>> +
>>> +    DPU_REG_WRITE(c, WB_MUX, mux_cfg);
>>> +}
>>> +



-- 
With best wishes
Dmitry
