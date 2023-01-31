Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486E682B54
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 12:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EF710E2A1;
	Tue, 31 Jan 2023 11:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E3210E1D1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 11:19:13 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mf7so21846996ejc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FdPCsXuoShsQWEHPPtwXhIe50HGpuEr7oJQkMg1KP5Y=;
 b=DrV/rUVZSbdExdOZR/kZ17Nr3rO83qd26jaQ0+i6H8cGbvNGSi+oq3582cE8+kCprd
 3tg8TzDus6RuXiQNW3SvOfQsbSlsqRHVnXEFfoEdv7RtMSI8jfc/cZEbUb3o7rEkfvRU
 vtiIpe7cCutgHHzk7saIIraaDGD4AUcbK4gsG0dZ02UZ1WEdLbCeO89WwgrKxuV+0kmX
 Q9T5zEN3vc1jOOMHorzEKWTkVWJhaVEgcpM2zlSerdprv02u2B0oVCC/rVZ1RtsCvMjc
 zh0k9jRWdgI+V1wjnNJHDG6fqdzQTpQiXwZtgXMcfPz/9QsLgKxtVRVbrys1yaxcKlsu
 2DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FdPCsXuoShsQWEHPPtwXhIe50HGpuEr7oJQkMg1KP5Y=;
 b=YgfP6pJ032zfCsWNH0m0xW9d00GI0E+4Uc25qD23XlAWOlRe8wHhWXOrXCkK/NqtPn
 y3a9T9gFiFxCOLHVWB6ffinB3OvBGJscZvCb45AtU4R+JrPaISciRqkrgrAtsw71x23W
 DXN+pb8XWdoGt2mjgaa3TkcaVsZhbofG8a/8mI4Fg6gNsGjwa9DHtelWEBRTSPyWNRD/
 CzBwUBtUnRlrpbavm4e1IVHbiwycycdcdQbu3SPmLMEFfU2TNbkDCT7KTVbRjxs5ncjA
 /1A9ns0cXYQUagUTAssHpUU3HZ81P31rv9DS+uLhaVwPhhyCyVjLqUTfeSosrJ2dcgEh
 mesQ==
X-Gm-Message-State: AO0yUKVsZGyOF0+oNENQf9PlWT8NFk8gwP+oipHoleap1eYE/AvWSb6q
 y4l2lfBix3IigwEgKUfTWZvobA==
X-Google-Smtp-Source: AK7set/n99ISPsnids1OTJ/bBsbUmb7qiIoYIszyiCOjbevojc2PBVDYb/vmsT545czQZ/lQqxTRCw==
X-Received: by 2002:a17:907:2d9e:b0:87b:dbcb:c6b1 with SMTP id
 gt30-20020a1709072d9e00b0087bdbcbc6b1mr18658099ejc.23.1675163951537; 
 Tue, 31 Jan 2023 03:19:11 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a17090631c100b00889a77458dbsm2400916ejf.21.2023.01.31.03.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 03:19:10 -0800 (PST)
Message-ID: <0a71a6d8-1e85-1bb2-36a1-0184e90db784@linaro.org>
Date: Tue, 31 Jan 2023 13:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/27] drm/msm/dpu: rename struct dpu_hw_pipe to
 dpu_hw_sspp
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-3-dmitry.baryshkov@linaro.org>
 <5d8350e9-cb95-adc3-f93a-5b7791fe2654@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5d8350e9-cb95-adc3-f93a-5b7791fe2654@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/01/2023 00:55, Abhinav Kumar wrote:
> 
> 
> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>> For all hardware blocks except SSPP the corresponding struct is named
>> after the block. Rename dpu_hw_pipe (SSPP structure) to dpu_hw_sspp.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Idea seems okay but then we should also rename dpu_hw_pipe_cfg to 
> dpu_hw_sspp_cfg.

I'll have to think about it. I ended up reusing the dpu_hw_pipe_cfg to 
describe a single rectangle configuration (iow, one for rect0, one for 
rect1). Let me check if I can make it more obvious.

> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 42 ++++++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 42 ++++++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 +-
>>   3 files changed, 43 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> index 691c471b08c2..93f01f767fd8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> @@ -136,7 +136,7 @@
>>   #define TS_CLK            19200000
>> -static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
>> +static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
>>           int s_id,
>>           u32 *idx)
>>   {
>> @@ -168,7 +168,7 @@ static int _sspp_subblk_offset(struct dpu_hw_pipe 
>> *ctx,
>>       return rc;
>>   }
>> -static void dpu_hw_sspp_setup_multirect(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_multirect(struct dpu_hw_sspp *ctx,
>>           enum dpu_sspp_multirect_index index,
>>           enum dpu_sspp_multirect_mode mode)
>>   {
>> @@ -197,7 +197,7 @@ static void dpu_hw_sspp_setup_multirect(struct 
>> dpu_hw_pipe *ctx,
>>       DPU_REG_WRITE(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx, mode_mask);
>>   }
>> -static void _sspp_setup_opmode(struct dpu_hw_pipe *ctx,
>> +static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
>>           u32 mask, u8 en)
>>   {
>>       u32 idx;
>> @@ -218,7 +218,7 @@ static void _sspp_setup_opmode(struct dpu_hw_pipe 
>> *ctx,
>>       DPU_REG_WRITE(&ctx->hw, SSPP_VIG_OP_MODE + idx, opmode);
>>   }
>> -static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
>> +static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
>>           u32 mask, u8 en)
>>   {
>>       u32 idx;
>> @@ -239,7 +239,7 @@ static void _sspp_setup_csc10_opmode(struct 
>> dpu_hw_pipe *ctx,
>>   /*
>>    * Setup source pixel format, flip,
>>    */
>> -static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_format(struct dpu_hw_sspp *ctx,
>>           const struct dpu_format *fmt, u32 flags,
>>           enum dpu_sspp_multirect_index rect_mode)
>>   {
>> @@ -356,7 +356,7 @@ static void dpu_hw_sspp_setup_format(struct 
>> dpu_hw_pipe *ctx,
>>       DPU_REG_WRITE(c, SSPP_UBWC_ERROR_STATUS + idx, BIT(31));
>>   }
>> -static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
>>           struct dpu_hw_pixel_ext *pe_ext)
>>   {
>>       struct dpu_hw_blk_reg_map *c;
>> @@ -414,7 +414,7 @@ static void dpu_hw_sspp_setup_pe_config(struct 
>> dpu_hw_pipe *ctx,
>>               tot_req_pixels[3]);
>>   }
>> -static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
>> +static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
>>           struct dpu_hw_pipe_cfg *sspp,
>>           void *scaler_cfg)
>>   {
>> @@ -430,7 +430,7 @@ static void _dpu_hw_sspp_setup_scaler3(struct 
>> dpu_hw_pipe *ctx,
>>               sspp->layout.format);
>>   }
>> -static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
>> +static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
>>   {
>>       u32 idx;
>> @@ -443,7 +443,7 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct 
>> dpu_hw_pipe *ctx)
>>   /*
>>    * dpu_hw_sspp_setup_rects()
>>    */
>> -static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_rects(struct dpu_hw_sspp *ctx,
>>           struct dpu_hw_pipe_cfg *cfg,
>>           enum dpu_sspp_multirect_index rect_index)
>>   {
>> @@ -512,7 +512,7 @@ static void dpu_hw_sspp_setup_rects(struct 
>> dpu_hw_pipe *ctx,
>>       DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>>   }
>> -static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_sspp *ctx,
>>           struct dpu_hw_pipe_cfg *cfg,
>>           enum dpu_sspp_multirect_index rect_mode)
>>   {
>> @@ -539,7 +539,7 @@ static void dpu_hw_sspp_setup_sourceaddress(struct 
>> dpu_hw_pipe *ctx,
>>       }
>>   }
>> -static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
>>           const struct dpu_csc_cfg *data)
>>   {
>>       u32 idx;
>> @@ -556,7 +556,7 @@ static void dpu_hw_sspp_setup_csc(struct 
>> dpu_hw_pipe *ctx,
>>       dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
>>   }
>> -static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 
>> color, enum
>> +static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_sspp *ctx, u32 
>> color, enum
>>           dpu_sspp_multirect_index rect_index)
>>   {
>>       u32 idx;
>> @@ -571,7 +571,7 @@ static void dpu_hw_sspp_setup_solidfill(struct 
>> dpu_hw_pipe *ctx, u32 color, enum
>>                   color);
>>   }
>> -static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_sspp *ctx,
>>               u32 danger_lut,
>>               u32 safe_lut)
>>   {
>> @@ -584,7 +584,7 @@ static void 
>> dpu_hw_sspp_setup_danger_safe_lut(struct dpu_hw_pipe *ctx,
>>       DPU_REG_WRITE(&ctx->hw, SSPP_SAFE_LUT + idx, safe_lut);
>>   }
>> -static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_creq_lut(struct dpu_hw_sspp *ctx,
>>               u64 creq_lut)
>>   {
>>       u32 idx;
>> @@ -601,7 +601,7 @@ static void dpu_hw_sspp_setup_creq_lut(struct 
>> dpu_hw_pipe *ctx,
>>       }
>>   }
>> -static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>>           struct dpu_hw_pipe_qos_cfg *cfg)
>>   {
>>       u32 idx;
>> @@ -626,7 +626,7 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct 
>> dpu_hw_pipe *ctx,
>>       DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL + idx, qos_ctrl);
>>   }
>> -static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
>> +static void dpu_hw_sspp_setup_cdp(struct dpu_hw_sspp *ctx,
>>           struct dpu_hw_cdp_cfg *cfg,
>>           enum dpu_sspp_multirect_index index)
>>   {
>> @@ -657,7 +657,7 @@ static void dpu_hw_sspp_setup_cdp(struct 
>> dpu_hw_pipe *ctx,
>>       DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
>>   }
>> -static void _setup_layer_ops(struct dpu_hw_pipe *c,
>> +static void _setup_layer_ops(struct dpu_hw_sspp *c,
>>           unsigned long features)
>>   {
>>       if (test_bit(DPU_SSPP_SRC, &features)) {
>> @@ -695,7 +695,7 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
>>   }
>>   #ifdef CONFIG_DEBUG_FS
>> -int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct 
>> dpu_kms *kms, struct dentry *entry)
>> +int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct 
>> dpu_kms *kms, struct dentry *entry)
>>   {
>>       const struct dpu_sspp_cfg *cfg = hw_pipe->cap;
>>       const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
>> @@ -779,10 +779,10 @@ static const struct dpu_sspp_cfg 
>> *_sspp_offset(enum dpu_sspp sspp,
>>       return ERR_PTR(-ENOMEM);
>>   }
>> -struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
>> +struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
>>           void __iomem *addr, const struct dpu_mdss_cfg *catalog)
>>   {
>> -    struct dpu_hw_pipe *hw_pipe;
>> +    struct dpu_hw_sspp *hw_pipe;
>>       const struct dpu_sspp_cfg *cfg;
>>       if (!addr || !catalog)
>> @@ -808,7 +808,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp 
>> idx,
>>       return hw_pipe;
>>   }
>> -void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx)
>> +void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx)
>>   {
>>       kfree(ctx);
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index 0c95b7e64f6c..651621b9794f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -10,7 +10,7 @@
>>   #include "dpu_hw_util.h"
>>   #include "dpu_formats.h"
>> -struct dpu_hw_pipe;
>> +struct dpu_hw_sspp;
>>   /**
>>    * Flags
>> @@ -214,7 +214,7 @@ struct dpu_hw_sspp_ops {
>>        * @flags: Extra flags for format config
>>        * @index: rectangle index in multirect
>>        */
>> -    void (*setup_format)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_format)(struct dpu_hw_sspp *ctx,
>>               const struct dpu_format *fmt, u32 flags,
>>               enum dpu_sspp_multirect_index index);
>> @@ -224,7 +224,7 @@ struct dpu_hw_sspp_ops {
>>        * @cfg: Pointer to pipe config structure
>>        * @index: rectangle index in multirect
>>        */
>> -    void (*setup_rects)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_rects)(struct dpu_hw_sspp *ctx,
>>               struct dpu_hw_pipe_cfg *cfg,
>>               enum dpu_sspp_multirect_index index);
>> @@ -233,7 +233,7 @@ struct dpu_hw_sspp_ops {
>>        * @ctx: Pointer to pipe context
>>        * @pe_ext: Pointer to pixel ext settings
>>        */
>> -    void (*setup_pe)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_pe)(struct dpu_hw_sspp *ctx,
>>               struct dpu_hw_pixel_ext *pe_ext);
>>       /**
>> @@ -242,7 +242,7 @@ struct dpu_hw_sspp_ops {
>>        * @cfg: Pointer to pipe config structure
>>        * @index: rectangle index in multirect
>>        */
>> -    void (*setup_sourceaddress)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_sourceaddress)(struct dpu_hw_sspp *ctx,
>>               struct dpu_hw_pipe_cfg *cfg,
>>               enum dpu_sspp_multirect_index index);
>> @@ -251,7 +251,7 @@ struct dpu_hw_sspp_ops {
>>        * @ctx: Pointer to pipe context
>>        * @data: Pointer to config structure
>>        */
>> -    void (*setup_csc)(struct dpu_hw_pipe *ctx, const struct 
>> dpu_csc_cfg *data);
>> +    void (*setup_csc)(struct dpu_hw_sspp *ctx, const struct 
>> dpu_csc_cfg *data);
>>       /**
>>        * setup_solidfill - enable/disable colorfill
>> @@ -260,7 +260,7 @@ struct dpu_hw_sspp_ops {
>>        * @flags: Pipe flags
>>        * @index: rectangle index in multirect
>>        */
>> -    void (*setup_solidfill)(struct dpu_hw_pipe *ctx, u32 color,
>> +    void (*setup_solidfill)(struct dpu_hw_sspp *ctx, u32 color,
>>               enum dpu_sspp_multirect_index index);
>>       /**
>> @@ -270,7 +270,7 @@ struct dpu_hw_sspp_ops {
>>        * @mode: parallel fetch / time multiplex multirect mode
>>        */
>> -    void (*setup_multirect)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_multirect)(struct dpu_hw_sspp *ctx,
>>               enum dpu_sspp_multirect_index index,
>>               enum dpu_sspp_multirect_mode mode);
>> @@ -279,7 +279,7 @@ struct dpu_hw_sspp_ops {
>>        * @ctx: Pointer to pipe context
>>        * @cfg: Pointer to config structure
>>        */
>> -    void (*setup_sharpening)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_sharpening)(struct dpu_hw_sspp *ctx,
>>               struct dpu_hw_sharp_cfg *cfg);
>>       /**
>> @@ -289,7 +289,7 @@ struct dpu_hw_sspp_ops {
>>        * @safe_lut: LUT for generate safe level based on fill level
>>        *
>>        */
>> -    void (*setup_danger_safe_lut)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_danger_safe_lut)(struct dpu_hw_sspp *ctx,
>>               u32 danger_lut,
>>               u32 safe_lut);
>> @@ -299,7 +299,7 @@ struct dpu_hw_sspp_ops {
>>        * @creq_lut: LUT for generate creq level based on fill level
>>        *
>>        */
>> -    void (*setup_creq_lut)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_creq_lut)(struct dpu_hw_sspp *ctx,
>>               u64 creq_lut);
>>       /**
>> @@ -308,7 +308,7 @@ struct dpu_hw_sspp_ops {
>>        * @cfg: Pointer to pipe QoS configuration
>>        *
>>        */
>> -    void (*setup_qos_ctrl)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
>>               struct dpu_hw_pipe_qos_cfg *cfg);
>>       /**
>> @@ -316,7 +316,7 @@ struct dpu_hw_sspp_ops {
>>        * @ctx: Pointer to pipe context
>>        * @cfg: Pointer to histogram configuration
>>        */
>> -    void (*setup_histogram)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_histogram)(struct dpu_hw_sspp *ctx,
>>               void *cfg);
>>       /**
>> @@ -325,7 +325,7 @@ struct dpu_hw_sspp_ops {
>>        * @pipe_cfg: Pointer to pipe configuration
>>        * @scaler_cfg: Pointer to scaler configuration
>>        */
>> -    void (*setup_scaler)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_scaler)(struct dpu_hw_sspp *ctx,
>>           struct dpu_hw_pipe_cfg *pipe_cfg,
>>           void *scaler_cfg);
>> @@ -333,7 +333,7 @@ struct dpu_hw_sspp_ops {
>>        * get_scaler_ver - get scaler h/w version
>>        * @ctx: Pointer to pipe context
>>        */
>> -    u32 (*get_scaler_ver)(struct dpu_hw_pipe *ctx);
>> +    u32 (*get_scaler_ver)(struct dpu_hw_sspp *ctx);
>>       /**
>>        * setup_cdp - setup client driven prefetch
>> @@ -341,13 +341,13 @@ struct dpu_hw_sspp_ops {
>>        * @cfg: Pointer to cdp configuration
>>        * @index: rectangle index in multirect
>>        */
>> -    void (*setup_cdp)(struct dpu_hw_pipe *ctx,
>> +    void (*setup_cdp)(struct dpu_hw_sspp *ctx,
>>               struct dpu_hw_cdp_cfg *cfg,
>>               enum dpu_sspp_multirect_index index);
>>   };
>>   /**
>> - * struct dpu_hw_pipe - pipe description
>> + * struct dpu_hw_sspp - pipe description
>>    * @base: hardware block base structure
>>    * @hw: block hardware details
>>    * @catalog: back pointer to catalog
>> @@ -356,7 +356,7 @@ struct dpu_hw_sspp_ops {
>>    * @cap: pointer to layer_cfg
>>    * @ops: pointer to operations possible for this pipe
>>    */
>> -struct dpu_hw_pipe {
>> +struct dpu_hw_sspp {
>>       struct dpu_hw_blk base;
>>       struct dpu_hw_blk_reg_map hw;
>>       const struct dpu_mdss_cfg *catalog;
>> @@ -378,7 +378,7 @@ struct dpu_kms;
>>    * @addr: Mapped register io address of MDP
>>    * @catalog : Pointer to mdss catalog data
>>    */
>> -struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
>> +struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
>>           void __iomem *addr, const struct dpu_mdss_cfg *catalog);
>>   /**
>> @@ -386,10 +386,10 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum 
>> dpu_sspp idx,
>>    * should be called during Hw pipe cleanup.
>>    * @ctx:  Pointer to SSPP driver context returned by dpu_hw_sspp_init
>>    */
>> -void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
>> +void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx);
>>   void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>> *debugfs_root);
>> -int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct 
>> dpu_kms *kms, struct dentry *entry);
>> +int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct 
>> dpu_kms *kms, struct dentry *entry);
>>   #endif /*_DPU_HW_SSPP_H */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index bfd5be89e8b8..e1cdd71716f0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -104,7 +104,7 @@ struct dpu_plane {
>>       enum dpu_sspp pipe;
>> -    struct dpu_hw_pipe *pipe_hw;
>> +    struct dpu_hw_sspp *pipe_hw;
>>       uint32_t color_fill;
>>       bool is_error;
>>       bool is_rt_pipe;

-- 
With best wishes
Dmitry

