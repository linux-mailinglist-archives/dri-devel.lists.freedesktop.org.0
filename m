Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E957677CE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 23:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6AE10E479;
	Fri, 28 Jul 2023 21:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7910E152
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 21:39:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so4416251e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690580342; x=1691185142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D2koDSRWJHeTe5lO64sJL0se3DtBzSm+TvS5uVHvDik=;
 b=ud5aCb1elAIsemGawHqmDz+YGEtFqlcu6t4pNgRu7YjoUpN+sxvjd/KmS6hPknVfJt
 QVmC5elW8xvgDe94n4jhGnJ9UKewdAc3pDRxpgM8LhajEgu0WKuvhSvaEVoDL+GWuc31
 eTL3vgUtIXT+XLX9DiKxGJYWv8p+J6RZj7UUmzntuTpsnC389GrGPhTTyBvBkoT+Kid1
 v1LSMMVjHFjNCoutyMlzyqMf8905IQ1MVwKoFCMkrhyPHCTYhM04wkuXi8IH3XOp1yPo
 btW3pXc/GVJhKLPR8bTfq5itgPvV4esybaFb5T0GUE0MEWD0d1Oa19ZwvxxBAmrWCf3q
 r0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690580342; x=1691185142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D2koDSRWJHeTe5lO64sJL0se3DtBzSm+TvS5uVHvDik=;
 b=H7qHa2VZ1dS31eKbutioUHAtyYBQNi1Cq9qhn8MGA9qODwBM9k+sWpg11vqAny9iXm
 V59+tJwSMKcz/+9nEChzO8t9MfdEHGcunAW9jgnr4RlPkFAeqEC+sKcWUDpqjw0nKHBW
 8CZmEr5rhuP/B8auP4SxG4Cdw6EO65qkQu366ANOhbbLcBXmsTN+ptesT/rfZImbgUab
 O0k2Gt3Bn6I1/fLb2rPyEWrCp3eXEYPUwbk9soSUcNlBZJqb1FAXLMb7Gg/Bs2KlWLNE
 wpbk22kE5c5KUH6TMgUQ5SSRJhkYLctfum+oyZB/3a9yc5NpXwgf4+MhkfYEebEt2Uli
 aQ8w==
X-Gm-Message-State: ABy/qLYAiFvQcgEe3gcRW0rZP63IV6wpL/0TePCk2sXiA7vDYpxN4kqD
 x5UZvn8hJ/x29HOFkprPzjpTxg==
X-Google-Smtp-Source: APBJJlHbxrfNyEwFcc7NLvBh6ml1/IirktXvZRc6dWCnYUnkVo+o80HosfvNQQsdhrwW8PXRJp+dsQ==
X-Received: by 2002:ac2:5e79:0:b0:4f8:46e9:9f19 with SMTP id
 a25-20020ac25e79000000b004f846e99f19mr2580696lfr.1.1690580342511; 
 Fri, 28 Jul 2023 14:39:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n21-20020aa7d055000000b0051e26c7a154sm2183654edo.18.2023.07.28.14.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 14:39:02 -0700 (PDT)
Message-ID: <098e89eb-d69b-4a3c-840d-d7fd560fe2f9@linaro.org>
Date: Sat, 29 Jul 2023 00:39:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/7] drm/msm/dpu: use MDSS data for programming SSPP
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
 <20230728213320.97309-6-dmitry.baryshkov@linaro.org>
 <27ae3603-4527-8c3a-23e6-5d4934de9d69@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <27ae3603-4527-8c3a-23e6-5d4934de9d69@quicinc.com>
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

On 29/07/2023 00:36, Abhinav Kumar wrote:
> 
> 
> On 7/28/2023 2:33 PM, Dmitry Baryshkov wrote:
>> Switch to using data from MDSS driver to program the SSPP fetch and UBWC
>> configuration. As a side-effect, this also swithes the DPU driver from
>> DPU_HW_UBWC_VER_xx values to the UBWC_x_y enum, which reflects
>> the hardware register values.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 ++++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
>>   6 files changed, 33 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> index b364cf75bb3f..f2192de93713 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> @@ -8,6 +8,8 @@
>>   #include "dpu_hw_sspp.h"
>>   #include "dpu_kms.h"
>> +#include "msm_mdss.h"
>> +
>>   #include <drm/drm_file.h>
>>   #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
>> @@ -270,26 +272,26 @@ static void dpu_hw_sspp_setup_format(struct 
>> dpu_sw_pipe *pipe,
>>           DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>>               DPU_FETCH_CONFIG_RESET_VALUE |
>>               ctx->ubwc->highest_bank_bit << 18);
>> -        switch (ctx->ubwc->ubwc_version) {
>> -        case DPU_HW_UBWC_VER_10:
>> +        switch (ctx->ubwc->ubwc_enc_version) {
> 
> Didnt we agree to protect this with if (ctx->ubwc) ?

Yes. However ctx->ubwc is set to mdss_data and in dpu_kms_hw_init() we 
ensure that mdss_data is not NULL, so this check is not necessary.

> 
>> +        case UBWC_1_0:
>>               fast_clear = fmt->alpha_enable ? BIT(31) : 0;
>>               DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>>                       fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
>>                       BIT(8) |
>>                       (ctx->ubwc->highest_bank_bit << 4));
>>               break;
>> -        case DPU_HW_UBWC_VER_20:
>> +        case UBWC_2_0:
>>               fast_clear = fmt->alpha_enable ? BIT(31) : 0;
>>               DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>>                       fast_clear | (ctx->ubwc->ubwc_swizzle) |
>>                       (ctx->ubwc->highest_bank_bit << 4));
>>               break;
>> -        case DPU_HW_UBWC_VER_30:
>> +        case UBWC_3_0:
>>               DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>>                       BIT(30) | (ctx->ubwc->ubwc_swizzle) |
>>                       (ctx->ubwc->highest_bank_bit << 4));
>>               break;
>> -        case DPU_HW_UBWC_VER_40:
>> +        case UBWC_4_0:
>>               DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
>>                       DPU_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
>>               break;
>> @@ -670,11 +672,11 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp 
>> *hw_pipe, struct dpu_kms *kms,
>>   #endif
>>   struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
>> -        void __iomem *addr, const struct dpu_ubwc_cfg *ubwc)
>> +        void __iomem *addr, const struct msm_mdss_data *mdss_data)
>>   {
>>       struct dpu_hw_sspp *hw_pipe;
>> -    if (!addr || !ubwc)
>> +    if (!addr)
>>           return ERR_PTR(-EINVAL);
>>       hw_pipe = kzalloc(sizeof(*hw_pipe), GFP_KERNEL);
>> @@ -685,7 +687,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(const struct 
>> dpu_sspp_cfg *cfg,
>>       hw_pipe->hw.log_mask = DPU_DBG_MASK_SSPP;
>>       /* Assign ops */
>> -    hw_pipe->ubwc = ubwc;
>> +    hw_pipe->ubwc = mdss_data;
>>       hw_pipe->idx = cfg->id;
>>       hw_pipe->cap = cfg;
>>       _setup_layer_ops(hw_pipe, hw_pipe->cap->features);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index 085f34bc6b88..cbf4f95ff0fd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -317,7 +317,7 @@ struct dpu_hw_sspp_ops {
>>   struct dpu_hw_sspp {
>>       struct dpu_hw_blk base;
>>       struct dpu_hw_blk_reg_map hw;
>> -    const struct dpu_ubwc_cfg *ubwc;
>> +    const struct msm_mdss_data *ubwc;
>>       /* Pipe */
>>       enum dpu_sspp idx;
>> @@ -333,10 +333,10 @@ struct dpu_kms;
>>    * Should be called once before accessing every pipe.
>>    * @cfg:  Pipe catalog entry for which driver object is required
>>    * @addr: Mapped register io address of MDP
>> - * @ubwc: UBWC configuration data
>> + * @mdss_data: UBWC / MDSS configuration data
>>    */
>>   struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
>> -        void __iomem *addr, const struct dpu_ubwc_cfg *ubwc);
>> +        void __iomem *addr, const struct msm_mdss_data *mdss_data);
>>   /**
>>    * dpu_hw_sspp_destroy(): Destroys SSPP driver context
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index c1d06e19b237..2da9eef687af 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -22,6 +22,7 @@
>>   #include "msm_drv.h"
>>   #include "msm_mmu.h"
>> +#include "msm_mdss.h"
>>   #include "msm_gem.h"
>>   #include "disp/msm_disp_snapshot.h"
>> @@ -1124,7 +1125,20 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>           goto power_error;
>>       }
>> -    rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
>> +    dpu_kms->mdss = msm_mdss_get_mdss_data(dpu_kms->pdev->dev.parent);
>> +    if (IS_ERR(dpu_kms->mdss)) {
>> +        rc = PTR_ERR(dpu_kms->mdss);
>> +        DPU_ERROR("failed to get MDSS data: %d\n", rc);
>> +        goto power_error;
>> +    }
>> +
>> +    if (!dpu_kms->mdss) {
>> +        rc = -EINVAL;
>> +        DPU_ERROR("NULL MDSS data\n");
>> +        goto power_error;
>> +    }
>> +
>> +    rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, 
>> dpu_kms->mmio);
>>       if (rc) {
>>           DPU_ERROR("rm init failed: %d\n", rc);
>>           goto power_error;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> index f3bdd4f11108..b6f53ca6e962 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> @@ -67,6 +67,7 @@ struct dpu_kms {
>>       struct msm_kms base;
>>       struct drm_device *dev;
>>       const struct dpu_mdss_cfg *catalog;
>> +    const struct msm_mdss_data *mdss;
>>       /* io/register spaces: */
>>       void __iomem *mmio, *vbif[VBIF_MAX];
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index 4a53e2c931d6..f9215643c71a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -101,6 +101,7 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>>   int dpu_rm_init(struct dpu_rm *rm,
>>           const struct dpu_mdss_cfg *cat,
>> +        const struct msm_mdss_data *mdss_data,
>>           void __iomem *mmio)
>>   {
>>       int rc, i;
>> @@ -230,7 +231,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>           struct dpu_hw_sspp *hw;
>>           const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
>> -        hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
>> +        hw = dpu_hw_sspp_init(sspp, mmio, mdss_data);
>>           if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed sspp object creation: err %d\n", rc);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> index d62c2edb2460..2b551566cbf4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> @@ -40,11 +40,13 @@ struct dpu_rm {
>>    *    for all HW blocks.
>>    * @rm: DPU Resource Manager handle
>>    * @cat: Pointer to hardware catalog
>> + * @mdss_data: Pointer to MDSS / UBWC configuration
>>    * @mmio: mapped register io address of MDP
>>    * @Return: 0 on Success otherwise -ERROR
>>    */
>>   int dpu_rm_init(struct dpu_rm *rm,
>>           const struct dpu_mdss_cfg *cat,
>> +        const struct msm_mdss_data *mdss_data,
>>           void __iomem *mmio);
>>   /**

-- 
With best wishes
Dmitry

