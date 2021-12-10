Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C790746F7F1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 01:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C9A10E1AA;
	Fri, 10 Dec 2021 00:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22B710E196
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 00:19:47 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id v15so11564819ljc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 16:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eRGtcpLeYdA2Qv9yCVejlKAWtr2JQg9B1moca2/DjKE=;
 b=Y4fcdbQB+Rd0t8tXa1OABHNo3lx4+dBF+DZxHX0rNrrAxwPjNfI44b2S3AZ5gB0fY/
 l+COl3Pziz6DVJsT4Z0QjvSzSUvOurpBXxNbfXEeOPe3e+zulncp2eJ8yBv+VXvhKZco
 HvW4T3Gfyd8QT9KqOPcC+zEZrLkAc0rYR0Er2u0KO6Z9GBauSnU8hJ7i/uZu8pnmP0KU
 VK/vH6LdPSuAyi0LZA4EUEoalGOwdLaPOdIDl+SKR2oO23wfbztxatR3N7ugj4KWFjgi
 rRWTt+wzdvcie3FvuW7MLtA3QG+HXpvAvlXqhnRcmG5J8727U/hbReEIm+Ed6WXOIWLt
 N7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eRGtcpLeYdA2Qv9yCVejlKAWtr2JQg9B1moca2/DjKE=;
 b=fgek2dqvlnDRnxN+FLdaTRP7p9+oAYRX0XeA4golKKfY95uLhSLb3tUODGdQjuB7wi
 HhK9ns47EkArvTG5Q1FwYHUt3gwGjS8/oiOzrBL0DO8dp69w8QOosNtWzjfjh0XFs7pz
 CX4fQCkjFtbXOKo2RlysRrswrWHcdb83tjYtu7Ooz4UKp9qYJt3qJNkwkKvkvo7A4hRP
 dhmNcyIHhDaZUum4tpSaranCbcDhuCuggDHIxjP+dlxeflO374qidjC1FRGKElA+JIET
 5tJHCDYCMl5SmLsc5pGFlxhfefuHsKKun6p6THj3YNY7KntkCmfibCpzz3tuSEs55VIW
 KSIw==
X-Gm-Message-State: AOAM531NQtmfl+ZyKzgOtfj4Oy4/E5bfG7ChcC79emjCRN6gkzWLT8dn
 g9Qc5jlPkEFBF3P0qwT9bBfPcrBONsRd+94Qr1ovuA==
X-Google-Smtp-Source: ABdhPJxr6+yxZP/ZV9jXkhByHqqRiGUjjeVMRwvakRGlFBRNLzQ73xR305iNeE2ugpMjsydrhbnSzQ==
X-Received: by 2002:a2e:2206:: with SMTP id i6mr9528235lji.357.1639095586077; 
 Thu, 09 Dec 2021 16:19:46 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o12sm146077lft.134.2021.12.09.16.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 16:19:45 -0800 (PST)
Message-ID: <0d6574c2-c811-22c6-39d3-379ac93afe0d@linaro.org>
Date: Fri, 10 Dec 2021 03:19:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v1 8/8] drm/msm/dpu: move SSPP debugfs support
 from plane to SSPP code
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
 <20211201222633.2476780-9-dmitry.baryshkov@linaro.org>
 <fcebac6e-05ea-73ad-f592-fc1721d4ecfb@quicinc.com>
 <df5a6583-8c94-e43a-e62d-d2be3918cbea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <df5a6583-8c94-e43a-e62d-d2be3918cbea@quicinc.com>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/2021 01:27, Abhinav Kumar wrote:
> 
> 
> On 12/9/2021 2:18 PM, Abhinav Kumar wrote:
>>
>>
>> On 12/1/2021 2:26 PM, Dmitry Baryshkov wrote:
>>> We are preparing to change DPU plane implementation. Move SSPP debugfs
>>> code from dpu_plane.c to dpu_hw_sspp.c, where it belongs.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 67 +++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 82 +++------------------
>>>   4 files changed, 84 insertions(+), 70 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> index d77eb7da5daf..ae3cf2e4d7d9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> @@ -8,6 +8,8 @@
>>>   #include "dpu_hw_sspp.h"
>>>   #include "dpu_kms.h"
>>> +#include <drm/drm_file.h>
>>> +
>>>   #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
>>>   /* DPU_SSPP_SRC */
>>> @@ -686,6 +688,71 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
>>>           c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
>>>   }
>>> +#ifdef CONFIG_DEBUG_FS
>>> +int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct 
>>> dpu_kms *kms, struct dentry *entry)
>>> +{
>>> +    const struct dpu_sspp_cfg *cfg = hw_pipe->cap;
>>> +    const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
>>> +    struct dentry *debugfs_root;
>>> +    char sspp_name[32];
>>> +
>>> +    snprintf(sspp_name, sizeof(sspp_name), "%d", hw_pipe->idx);
>>> +
>>> +    /* create overall sub-directory for the pipe */
>>> +    debugfs_root =
>>> +        debugfs_create_dir(sspp_name, entry);
>>
>>
>> I would like to take a different approach to this. Let me know what 
>> you think.
>>
>> Let the directory names still be the drm plane names as someone who 
>> would first get the DRM state and then try to lookup the register 
>> values of that plane would not know where to look now.
>>
>> Inside the /sys/kernel/debug/***/plane-X/ directory you can expose an 
>> extra entry which tells the sspp_index.
>>
>> This will also establish the plane to SSPP mapping.
>>
>> Now when planes go virtual in the future, this will be helpful even more
>> so that we can know the plane to SSPP mapping.
> 
> OR i like rob's suggestion of implementing the atomic_print_state 
> callback which will printout the drm plane to SSPP mapping along with 
> this change so that when we look at DRM state, we also know the plane
> to SSPP mapping and look in the right SSPP's dir.

I'd add atomic_print_state(), it seems simpler (and more future-proof).

>>
>>
>>> +
>>> +    /* don't error check these */
>>> +    debugfs_create_xul("features", 0600,
>>> +            debugfs_root, (unsigned long *)&hw_pipe->cap->features);
>>> +
>>> +    /* add register dump support */
>>> +    dpu_debugfs_create_regset32("src_blk", 0400,
>>> +            debugfs_root,
>>> +            sblk->src_blk.base + cfg->base,
>>> +            sblk->src_blk.len,
>>> +            kms);
>>> +
>>> +    if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>>> +            cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>>> +            cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
>>> +            cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
>>> +        dpu_debugfs_create_regset32("scaler_blk", 0400,
>>> +                debugfs_root,
>>> +                sblk->scaler_blk.base + cfg->base,
>>> +                sblk->scaler_blk.len,
>>> +                kms);
>>> +
>>> +    if (cfg->features & BIT(DPU_SSPP_CSC) ||
>>> +            cfg->features & BIT(DPU_SSPP_CSC_10BIT))
>>> +        dpu_debugfs_create_regset32("csc_blk", 0400,
>>> +                debugfs_root,
>>> +                sblk->csc_blk.base + cfg->base,
>>> +                sblk->csc_blk.len,
>>> +                kms);
>>> +
>>> +    debugfs_create_u32("xin_id",
>>> +            0400,
>>> +            debugfs_root,
>>> +            (u32 *) &cfg->xin_id);
>>> +    debugfs_create_u32("clk_ctrl",
>>> +            0400,
>>> +            debugfs_root,
>>> +            (u32 *) &cfg->clk_ctrl);
>>> +    debugfs_create_x32("creq_vblank",
>>> +            0600,
>>> +            debugfs_root,
>>> +            (u32 *) &sblk->creq_vblank);
>>> +    debugfs_create_x32("danger_vblank",
>>> +            0600,
>>> +            debugfs_root,
>>> +            (u32 *) &sblk->danger_vblank);
>>> +
>>> +    return 0;
>>> +}
>>> +#endif
>>> +
>>> +
>>>   static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
>>>           void __iomem *addr,
>>>           struct dpu_mdss_cfg *catalog,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> index e8939d7387cb..cef281687bab 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> @@ -381,6 +381,7 @@ struct dpu_hw_pipe {
>>>       struct dpu_hw_sspp_ops ops;
>>>   };
>>> +struct dpu_kms;
>>>   /**
>>>    * dpu_hw_sspp_init - initializes the sspp hw driver object.
>>>    * Should be called once before accessing every pipe.
>>> @@ -400,5 +401,8 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum 
>>> dpu_sspp idx,
>>>    */
>>>   void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
>>> +void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>>> *debugfs_root);
>>> +int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct 
>>> dpu_kms *kms, struct dentry *entry);
>>> +
>>>   #endif /*_DPU_HW_SSPP_H */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 7e7a619769a8..de9efe6dcf7c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -281,6 +281,7 @@ static int dpu_kms_debugfs_init(struct msm_kms 
>>> *kms, struct drm_minor *minor)
>>>       dpu_debugfs_danger_init(dpu_kms, entry);
>>>       dpu_debugfs_vbif_init(dpu_kms, entry);
>>>       dpu_debugfs_core_irq_init(dpu_kms, entry);
>>> +    dpu_debugfs_sspp_init(dpu_kms, entry);
>>>       for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
>>>           if (priv->dp[i])
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index ef66af696a40..cc7a7eb84fdd 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -13,7 +13,6 @@
>>>   #include <drm/drm_atomic.h>
>>>   #include <drm/drm_atomic_uapi.h>
>>>   #include <drm/drm_damage_helper.h>
>>> -#include <drm/drm_file.h>
>>>   #include <drm/drm_gem_atomic_helper.h>
>>>   #include "msm_drv.h"
>>> @@ -1356,78 +1355,22 @@ void dpu_plane_danger_signal_ctrl(struct 
>>> drm_plane *plane, bool enable)
>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>   }
>>> -static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>>> +/* SSPP live inside dpu_plane private data only. Enumerate them 
>>> here. */
>>> +void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>>> *debugfs_root)
>>>   {
>>> -    struct dpu_plane *pdpu = to_dpu_plane(plane);
>>> -    struct dpu_kms *kms = _dpu_plane_get_kms(plane);
>>> -    const struct dpu_sspp_cfg *cfg = pdpu->pipe_hw->cap;
>>> -    const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
>>> -    struct dentry *debugfs_root;
>>> -
>>> -    /* create overall sub-directory for the pipe */
>>> -    debugfs_root =
>>> -        debugfs_create_dir(plane->name,
>>> -                plane->dev->primary->debugfs_root);
>>> -
>>> -    /* don't error check these */
>>> -    debugfs_create_xul("features", 0600,
>>> -            debugfs_root, (unsigned long 
>>> *)&pdpu->pipe_hw->cap->features);
>>> -
>>> -    /* add register dump support */
>>> -    dpu_debugfs_create_regset32("src_blk", 0400,
>>> -            debugfs_root,
>>> -            sblk->src_blk.base + cfg->base,
>>> -            sblk->src_blk.len,
>>> -            kms);
>>> -
>>> -    if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>>> -            cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
>>> -            cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
>>> -            cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
>>> -        dpu_debugfs_create_regset32("scaler_blk", 0400,
>>> -                debugfs_root,
>>> -                sblk->scaler_blk.base + cfg->base,
>>> -                sblk->scaler_blk.len,
>>> -                kms);
>>> -
>>> -    if (cfg->features & BIT(DPU_SSPP_CSC) ||
>>> -            cfg->features & BIT(DPU_SSPP_CSC_10BIT))
>>> -        dpu_debugfs_create_regset32("csc_blk", 0400,
>>> -                debugfs_root,
>>> -                sblk->csc_blk.base + cfg->base,
>>> -                sblk->csc_blk.len,
>>> -                kms);
>>> -
>>> -    debugfs_create_u32("xin_id",
>>> -            0400,
>>> -            debugfs_root,
>>> -            (u32 *) &cfg->xin_id);
>>> -    debugfs_create_u32("clk_ctrl",
>>> -            0400,
>>> -            debugfs_root,
>>> -            (u32 *) &cfg->clk_ctrl);
>>> -    debugfs_create_x32("creq_vblank",
>>> -            0600,
>>> -            debugfs_root,
>>> -            (u32 *) &sblk->creq_vblank);
>>> -    debugfs_create_x32("danger_vblank",
>>> -            0600,
>>> -            debugfs_root,
>>> -            (u32 *) &sblk->danger_vblank);
>>> +    struct drm_plane *plane;
>>> +    struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
>>> -    return 0;
>>> -}
>>> -#else
>>> -static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>>> -{
>>> -    return 0;
>>> -}
>>> -#endif
>>> +    if (IS_ERR(entry))
>>> +        return;
>>> -static int dpu_plane_late_register(struct drm_plane *plane)
>>> -{
>>> -    return _dpu_plane_init_debugfs(plane);
>>> +    drm_for_each_plane(plane, dpu_kms->dev) {
>>> +        struct dpu_plane *pdpu = to_dpu_plane(plane);
>>> +
>>> +        _dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
>>> +    }
>>>   }
>>> +#endif
>>>   static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>>>           uint32_t format, uint64_t modifier)
>>> @@ -1453,7 +1396,6 @@ static const struct drm_plane_funcs 
>>> dpu_plane_funcs = {
>>>           .reset = dpu_plane_reset,
>>>           .atomic_duplicate_state = dpu_plane_duplicate_state,
>>>           .atomic_destroy_state = dpu_plane_destroy_state,
>>> -        .late_register = dpu_plane_late_register,
>>>           .format_mod_supported = dpu_plane_format_mod_supported,
>>>   };
>>>


-- 
With best wishes
Dmitry
