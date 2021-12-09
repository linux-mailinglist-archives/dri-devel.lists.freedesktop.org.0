Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1069546F6CF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B93910E19C;
	Thu,  9 Dec 2021 22:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A01410E19C;
 Thu,  9 Dec 2021 22:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639088859; x=1670624859;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=XIbXGTkJk75cP/5krTDGwDYgt+vFWkIGP79UqC97940=;
 b=RDDZ+jlwE2g3L18wYCwlwBnrcGSQmboe3K0lXRrsnsQIaU/sIKbYenSb
 VKTS3x29Z+ZjzFR2oD+BaxkZL9a32REQg+QAXS5mH1P94i9loYWRaetda
 cvUAC3pJaBW9VhHs8wERFs0Q5WB1UO/bPOM1KeK7EeLXDXGcnRAFJNax2 M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 09 Dec 2021 14:27:39 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 14:27:39 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 14:27:38 -0800
Received: from [10.111.171.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 9 Dec 2021
 14:27:36 -0800
Message-ID: <df5a6583-8c94-e43a-e62d-d2be3918cbea@quicinc.com>
Date: Thu, 9 Dec 2021 14:27:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v1 8/8] drm/msm/dpu: move SSPP debugfs support
 from plane to SSPP code
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
 <20211201222633.2476780-9-dmitry.baryshkov@linaro.org>
 <fcebac6e-05ea-73ad-f592-fc1721d4ecfb@quicinc.com>
In-Reply-To: <fcebac6e-05ea-73ad-f592-fc1721d4ecfb@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, David
 Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/9/2021 2:18 PM, Abhinav Kumar wrote:
> 
> 
> On 12/1/2021 2:26 PM, Dmitry Baryshkov wrote:
>> We are preparing to change DPU plane implementation. Move SSPP debugfs
>> code from dpu_plane.c to dpu_hw_sspp.c, where it belongs.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 67 +++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 82 +++------------------
>>   4 files changed, 84 insertions(+), 70 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> index d77eb7da5daf..ae3cf2e4d7d9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>> @@ -8,6 +8,8 @@
>>   #include "dpu_hw_sspp.h"
>>   #include "dpu_kms.h"
>> +#include <drm/drm_file.h>
>> +
>>   #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
>>   /* DPU_SSPP_SRC */
>> @@ -686,6 +688,71 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
>>           c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
>>   }
>> +#ifdef CONFIG_DEBUG_FS
>> +int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct 
>> dpu_kms *kms, struct dentry *entry)
>> +{
>> +    const struct dpu_sspp_cfg *cfg = hw_pipe->cap;
>> +    const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
>> +    struct dentry *debugfs_root;
>> +    char sspp_name[32];
>> +
>> +    snprintf(sspp_name, sizeof(sspp_name), "%d", hw_pipe->idx);
>> +
>> +    /* create overall sub-directory for the pipe */
>> +    debugfs_root =
>> +        debugfs_create_dir(sspp_name, entry);
> 
> 
> I would like to take a different approach to this. Let me know what you 
> think.
> 
> Let the directory names still be the drm plane names as someone who 
> would first get the DRM state and then try to lookup the register values 
> of that plane would not know where to look now.
> 
> Inside the /sys/kernel/debug/***/plane-X/ directory you can expose an 
> extra entry which tells the sspp_index.
> 
> This will also establish the plane to SSPP mapping.
> 
> Now when planes go virtual in the future, this will be helpful even more
> so that we can know the plane to SSPP mapping.

OR i like rob's suggestion of implementing the atomic_print_state 
callback which will printout the drm plane to SSPP mapping along with 
this change so that when we look at DRM state, we also know the plane
to SSPP mapping and look in the right SSPP's dir.
> 
> 
>> +
>> +    /* don't error check these */
>> +    debugfs_create_xul("features", 0600,
>> +            debugfs_root, (unsigned long *)&hw_pipe->cap->features);
>> +
>> +    /* add register dump support */
>> +    dpu_debugfs_create_regset32("src_blk", 0400,
>> +            debugfs_root,
>> +            sblk->src_blk.base + cfg->base,
>> +            sblk->src_blk.len,
>> +            kms);
>> +
>> +    if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>> +            cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>> +            cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
>> +            cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
>> +        dpu_debugfs_create_regset32("scaler_blk", 0400,
>> +                debugfs_root,
>> +                sblk->scaler_blk.base + cfg->base,
>> +                sblk->scaler_blk.len,
>> +                kms);
>> +
>> +    if (cfg->features & BIT(DPU_SSPP_CSC) ||
>> +            cfg->features & BIT(DPU_SSPP_CSC_10BIT))
>> +        dpu_debugfs_create_regset32("csc_blk", 0400,
>> +                debugfs_root,
>> +                sblk->csc_blk.base + cfg->base,
>> +                sblk->csc_blk.len,
>> +                kms);
>> +
>> +    debugfs_create_u32("xin_id",
>> +            0400,
>> +            debugfs_root,
>> +            (u32 *) &cfg->xin_id);
>> +    debugfs_create_u32("clk_ctrl",
>> +            0400,
>> +            debugfs_root,
>> +            (u32 *) &cfg->clk_ctrl);
>> +    debugfs_create_x32("creq_vblank",
>> +            0600,
>> +            debugfs_root,
>> +            (u32 *) &sblk->creq_vblank);
>> +    debugfs_create_x32("danger_vblank",
>> +            0600,
>> +            debugfs_root,
>> +            (u32 *) &sblk->danger_vblank);
>> +
>> +    return 0;
>> +}
>> +#endif
>> +
>> +
>>   static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
>>           void __iomem *addr,
>>           struct dpu_mdss_cfg *catalog,
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index e8939d7387cb..cef281687bab 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -381,6 +381,7 @@ struct dpu_hw_pipe {
>>       struct dpu_hw_sspp_ops ops;
>>   };
>> +struct dpu_kms;
>>   /**
>>    * dpu_hw_sspp_init - initializes the sspp hw driver object.
>>    * Should be called once before accessing every pipe.
>> @@ -400,5 +401,8 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp 
>> idx,
>>    */
>>   void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
>> +void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>> *debugfs_root);
>> +int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct 
>> dpu_kms *kms, struct dentry *entry);
>> +
>>   #endif /*_DPU_HW_SSPP_H */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 7e7a619769a8..de9efe6dcf7c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -281,6 +281,7 @@ static int dpu_kms_debugfs_init(struct msm_kms 
>> *kms, struct drm_minor *minor)
>>       dpu_debugfs_danger_init(dpu_kms, entry);
>>       dpu_debugfs_vbif_init(dpu_kms, entry);
>>       dpu_debugfs_core_irq_init(dpu_kms, entry);
>> +    dpu_debugfs_sspp_init(dpu_kms, entry);
>>       for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
>>           if (priv->dp[i])
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index ef66af696a40..cc7a7eb84fdd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -13,7 +13,6 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_uapi.h>
>>   #include <drm/drm_damage_helper.h>
>> -#include <drm/drm_file.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include "msm_drv.h"
>> @@ -1356,78 +1355,22 @@ void dpu_plane_danger_signal_ctrl(struct 
>> drm_plane *plane, bool enable)
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }
>> -static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>> +/* SSPP live inside dpu_plane private data only. Enumerate them here. */
>> +void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>> *debugfs_root)
>>   {
>> -    struct dpu_plane *pdpu = to_dpu_plane(plane);
>> -    struct dpu_kms *kms = _dpu_plane_get_kms(plane);
>> -    const struct dpu_sspp_cfg *cfg = pdpu->pipe_hw->cap;
>> -    const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
>> -    struct dentry *debugfs_root;
>> -
>> -    /* create overall sub-directory for the pipe */
>> -    debugfs_root =
>> -        debugfs_create_dir(plane->name,
>> -                plane->dev->primary->debugfs_root);
>> -
>> -    /* don't error check these */
>> -    debugfs_create_xul("features", 0600,
>> -            debugfs_root, (unsigned long 
>> *)&pdpu->pipe_hw->cap->features);
>> -
>> -    /* add register dump support */
>> -    dpu_debugfs_create_regset32("src_blk", 0400,
>> -            debugfs_root,
>> -            sblk->src_blk.base + cfg->base,
>> -            sblk->src_blk.len,
>> -            kms);
>> -
>> -    if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>> -            cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>> -            cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
>> -            cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
>> -        dpu_debugfs_create_regset32("scaler_blk", 0400,
>> -                debugfs_root,
>> -                sblk->scaler_blk.base + cfg->base,
>> -                sblk->scaler_blk.len,
>> -                kms);
>> -
>> -    if (cfg->features & BIT(DPU_SSPP_CSC) ||
>> -            cfg->features & BIT(DPU_SSPP_CSC_10BIT))
>> -        dpu_debugfs_create_regset32("csc_blk", 0400,
>> -                debugfs_root,
>> -                sblk->csc_blk.base + cfg->base,
>> -                sblk->csc_blk.len,
>> -                kms);
>> -
>> -    debugfs_create_u32("xin_id",
>> -            0400,
>> -            debugfs_root,
>> -            (u32 *) &cfg->xin_id);
>> -    debugfs_create_u32("clk_ctrl",
>> -            0400,
>> -            debugfs_root,
>> -            (u32 *) &cfg->clk_ctrl);
>> -    debugfs_create_x32("creq_vblank",
>> -            0600,
>> -            debugfs_root,
>> -            (u32 *) &sblk->creq_vblank);
>> -    debugfs_create_x32("danger_vblank",
>> -            0600,
>> -            debugfs_root,
>> -            (u32 *) &sblk->danger_vblank);
>> +    struct drm_plane *plane;
>> +    struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
>> -    return 0;
>> -}
>> -#else
>> -static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>> -{
>> -    return 0;
>> -}
>> -#endif
>> +    if (IS_ERR(entry))
>> +        return;
>> -static int dpu_plane_late_register(struct drm_plane *plane)
>> -{
>> -    return _dpu_plane_init_debugfs(plane);
>> +    drm_for_each_plane(plane, dpu_kms->dev) {
>> +        struct dpu_plane *pdpu = to_dpu_plane(plane);
>> +
>> +        _dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
>> +    }
>>   }
>> +#endif
>>   static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>>           uint32_t format, uint64_t modifier)
>> @@ -1453,7 +1396,6 @@ static const struct drm_plane_funcs 
>> dpu_plane_funcs = {
>>           .reset = dpu_plane_reset,
>>           .atomic_duplicate_state = dpu_plane_duplicate_state,
>>           .atomic_destroy_state = dpu_plane_destroy_state,
>> -        .late_register = dpu_plane_late_register,
>>           .format_mod_supported = dpu_plane_format_mod_supported,
>>   };
>>
