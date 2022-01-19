Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A494941B6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 21:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D7A10E134;
	Wed, 19 Jan 2022 20:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B4D10E17C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 20:31:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id br17so12954463lfb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rSwblmd2HsvVAk7MLwaAx3yMHnmaeW6z0nD6uf+evKM=;
 b=tiGGyQ+yp5EHWAI/6kpBEcqth18a21e2tsQgcxWIDu9KHCLGrDucNCviKKARaiRmHY
 Fi6PDZcACEJJXtmBia6rQfKXfvGkuz+ZyJ4jWSP5jzPEyl2G7fz9/mis6IYmQLscDjYv
 3x6jU2RTjxXmMRUYaNlyM9G5Ecp+LIhw/kHNjHKzICItGlhSm51WK2MkoAvpBQCxUbT1
 CibhI2mQFoxPB9s9uhKCSxeMjwATb9GdYj+aPQ4TqihksqULrTfjdFvf0FXWxeG4Ljj/
 z7EKzoWlbNNjpATlily4UUrapR22FP9nJZp5+uAR6+JXc1d/7SRcAp1o6Yeq6N8HDr4U
 Rjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rSwblmd2HsvVAk7MLwaAx3yMHnmaeW6z0nD6uf+evKM=;
 b=SnhkFPIAZiIdPKoRaCxgoLHSVLB7cdeAEZcQlKtRNNnfp4GbXGPTinuk/A+qlLB5TS
 RtSDEbBd7bXSo0X0fP4ytA1aRTMD9Cq9V1Dp/6VJwZBLapLM7O8+rAAe12zwCGtc4csX
 rB0I4pc24Xzl3/13Bu8ifRK5zCAscVbWlKwQqfr2YqbOS1FhY1SGcW/V/l1WCvha7Plg
 HcODsoxK/FclA4JEdNdJDDn3tQnyAsuUtoXBu6Fhna1MRIT61TiRyOCO55G+6YQEhitn
 WR16QmcIDLJkI96m7Z1t/NysB3HL+I+KfdORqfe56NAeXGPWG5yfXo9JAz1ewEsyDgA/
 MSrw==
X-Gm-Message-State: AOAM530CgA2e1XwfNWPm4HDhsFIlTymmigUlsKsQMFstDGxMnDA6YmbB
 IUtldO3gM2N27S3ICOeFzF9bXQ==
X-Google-Smtp-Source: ABdhPJyswQKdM+L0cIkGl8/aASch2AIlksvNS37SfX2NTAUwIKdhsxnZC4P0ufRa8isYOfSSejd9cQ==
X-Received: by 2002:a05:651c:1a24:: with SMTP id
 by36mr12330580ljb.191.1642624266586; 
 Wed, 19 Jan 2022 12:31:06 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h19sm63867lfu.198.2022.01.19.12.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 12:31:06 -0800 (PST)
Message-ID: <bacb4a41-9f28-3c68-7076-7e55cea984a7@linaro.org>
Date: Wed, 19 Jan 2022 23:31:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dpu: simplify clocks handling
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20211126023516.1108411-1-dmitry.baryshkov@linaro.org>
 <20211126023516.1108411-2-dmitry.baryshkov@linaro.org>
 <645728c0-05be-0784-0c7f-5535095ced00@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <645728c0-05be-0784-0c7f-5535095ced00@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2022 05:32, Jessica Zhang wrote:
> On 11/25/2021 6:35 PM, Dmitry Baryshkov wrote:
>> DPU driver contains code to parse clock items from device tree into
>> special data struct and then enable/disable/set rate for the clocks
>> using that data struct. However the DPU driver itself uses only parsing
>> and enabling/disabling part (the rate setting is used by DP driver).
>>
>> Move this implementation to the DP driver (which actually uses rate
>> setting) and replace hand-coded enable/disable/get loops in the DPU
>> with the respective clk_bulk operations. Put operation is removed
>> completely because, it is handled using devres instead.
>>
>> DP implementation is unchanged for now.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/Makefile                  |  2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 24 ++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 46 +++----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      | 26 +++----
>>   .../dpu1/dpu_io_util.c => dp/dp_clk_util.c}   | 69 +------------------
>>   .../dpu1/dpu_io_util.h => dp/dp_clk_util.h}   |  2 -
>>   drivers/gpu/drm/msm/dp/dp_parser.h            |  2 +-
>>   drivers/gpu/drm/msm/msm_drv.c                 | 49 +++++++++++++
>>   drivers/gpu/drm/msm/msm_drv.h                 |  1 +
>>   11 files changed, 84 insertions(+), 147 deletions(-)
>>   rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.c => 
>> dp/dp_clk_util.c} (61%)
>>   rename drivers/gpu/drm/msm/{disp/dpu1/dpu_io_util.h => 
>> dp/dp_clk_util.h} (92%)
>>

[skipped]

>> @@ -174,14 +174,10 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
>>   static int dpu_mdss_disable(struct msm_mdss *mdss)
>>   {
>>       struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
>> -    struct dss_module_power *mp = &dpu_mdss->mp;
>> -    int ret;
>> -    ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
>> -    if (ret)
>> -        DPU_ERROR("clock disable failed, ret:%d\n", ret);
>> +    clk_bulk_disable_unprepare(dpu_mdss->num_clocks, dpu_mdss->clocks);
>> -    return ret;
>> +    return 0;
>>   }
>>   static void dpu_mdss_destroy(struct drm_device *dev)
> 
> Hi Dmitry,
> 
> Looks like this is based on some outdated code:
> 2027e5b3 (drm/msm: Initialize MDSS irq domain at probe time) changes 
> `*dev` to `*mdss`
> 
> I want to test this patch on some boards (namely RB3 and RB5). Can you 
> release a version with your changes rebased on top of the tip of msm-next?

Sure, I'll post v3.

> 
>> @@ -189,7 +185,6 @@ static void dpu_mdss_destroy(struct drm_device *dev)
>>       struct platform_device *pdev = to_platform_device(dev->dev);
>>       struct msm_drm_private *priv = dev->dev_private;
>>       struct dpu_mdss *dpu_mdss = to_dpu_mdss(priv->mdss);
>> -    struct dss_module_power *mp = &dpu_mdss->mp;
>>       int irq;
>>       pm_runtime_suspend(dev->dev);
>> @@ -197,8 +192,6 @@ static void dpu_mdss_destroy(struct drm_device *dev)
>>       _dpu_mdss_irq_domain_fini(dpu_mdss);
>>       irq = platform_get_irq(pdev, 0);
>>       irq_set_chained_handler_and_data(irq, NULL, NULL);
>> -    msm_dss_put_clk(mp->clk_config, mp->num_clk);
>> -    devm_kfree(&pdev->dev, mp->clk_config);
>>       if (dpu_mdss->mmio)
>>           devm_iounmap(&pdev->dev, dpu_mdss->mmio);
>> @@ -217,7 +210,6 @@ int dpu_mdss_init(struct drm_device *dev)
>>       struct platform_device *pdev = to_platform_device(dev->dev);
>>       struct msm_drm_private *priv = dev->dev_private;
>>       struct dpu_mdss *dpu_mdss;
>> -    struct dss_module_power *mp;
>>       int ret;
>>       int irq;
>> @@ -231,12 +223,12 @@ int dpu_mdss_init(struct drm_device *dev)
>>       DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
>> -    mp = &dpu_mdss->mp;
>> -    ret = msm_dss_parse_clock(pdev, mp);
>> -    if (ret) {
>> +    ret = msm_parse_clock(pdev, &dpu_mdss->clocks);
>> +    if (ret < 0) {
>>           DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
>>           goto clk_parse_err;
>>       }
>> +    dpu_mdss->num_clocks = ret;
>>       dpu_mdss->base.dev = dev;
>>       dpu_mdss->base.funcs = &mdss_funcs;
>> @@ -263,9 +255,7 @@ int dpu_mdss_init(struct drm_device *dev)
>>   irq_error:
>>       _dpu_mdss_irq_domain_fini(dpu_mdss);
>>   irq_domain_error:
>> -    msm_dss_put_clk(mp->clk_config, mp->num_clk);
>>   clk_parse_err:
>> -    devm_kfree(&pdev->dev, mp->clk_config);
>>       if (dpu_mdss->mmio)
>>           devm_iounmap(&pdev->dev, dpu_mdss->mmio);
>>       dpu_mdss->mmio = NULL;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c 
>> b/drivers/gpu/drm/msm/dp/dp_clk_util.c
>> similarity index 61%
>> rename from drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
>> rename to drivers/gpu/drm/msm/dp/dp_clk_util.c
>> index 078afc5f5882..44a4fc59ff31 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_clk_util.c
>> @@ -11,7 +11,7 @@
>>   #include <drm/drm_print.h>
>> -#include "dpu_io_util.h"
>> +#include "dp_clk_util.h"
>>   void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk)
>>   {
>> @@ -118,70 +118,3 @@ int msm_dss_enable_clk(struct dss_clk *clk_arry, 
>> int num_clk, int enable)
>>       return rc;
>>   }
>> -
>> -int msm_dss_parse_clock(struct platform_device *pdev,
>> -            struct dss_module_power *mp)
>> -{
>> -    u32 i, rc = 0;
>> -    const char *clock_name;
>> -    int num_clk = 0;
>> -
>> -    if (!pdev || !mp)
>> -        return -EINVAL;
>> -
>> -    mp->num_clk = 0;
>> -    num_clk = of_property_count_strings(pdev->dev.of_node, 
>> "clock-names");
>> -    if (num_clk <= 0) {
>> -        pr_debug("clocks are not defined\n");
>> -        return 0;
>> -    }
>> -
>> -    mp->clk_config = devm_kcalloc(&pdev->dev,
>> -                      num_clk, sizeof(struct dss_clk),
>> -                      GFP_KERNEL);
>> -    if (!mp->clk_config)
>> -        return -ENOMEM;
>> -
>> -    for (i = 0; i < num_clk; i++) {
>> -        rc = of_property_read_string_index(pdev->dev.of_node,
>> -                           "clock-names", i,
>> -                           &clock_name);
>> -        if (rc) {
>> -            DRM_DEV_ERROR(&pdev->dev, "Failed to get clock name for 
>> %d\n",
>> -                i);
>> -            break;
>> -        }
>> -        strlcpy(mp->clk_config[i].clk_name, clock_name,
>> -            sizeof(mp->clk_config[i].clk_name));
>> -
>> -        mp->clk_config[i].type = DSS_CLK_AHB;
>> -    }
>> -
>> -    rc = msm_dss_get_clk(&pdev->dev, mp->clk_config, num_clk);
>> -    if (rc) {
>> -        DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
>> -        goto err;
>> -    }
>> -
>> -    rc = of_clk_set_defaults(pdev->dev.of_node, false);
>> -    if (rc) {
>> -        DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults 
>> %d\n", rc);
>> -        goto err;
>> -    }
>> -
>> -    for (i = 0; i < num_clk; i++) {
>> -        u32 rate = clk_get_rate(mp->clk_config[i].clk);
>> -        if (!rate)
>> -            continue;
>> -        mp->clk_config[i].rate = rate;
>> -        mp->clk_config[i].type = DSS_CLK_PCLK;
>> -        mp->clk_config[i].max_rate = rate;
>> -    }
>> -
>> -    mp->num_clk = num_clk;
>> -    return 0;
>> -
>> -err:
>> -    msm_dss_put_clk(mp->clk_config, num_clk);
>> -    return rc;
>> -}
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h 
>> b/drivers/gpu/drm/msm/dp/dp_clk_util.h
>> similarity index 92%
>> rename from drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
>> rename to drivers/gpu/drm/msm/dp/dp_clk_util.h
>> index e6b5c772fa3b..6288a2833a58 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_clk_util.h
>> @@ -35,6 +35,4 @@ int msm_dss_get_clk(struct device *dev, struct 
>> dss_clk *clk_arry, int num_clk);
>>   void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk);
>>   int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk);
>>   int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int 
>> enable);
>> -int msm_dss_parse_clock(struct platform_device *pdev,
>> -        struct dss_module_power *mp);
>>   #endif /* __DPU_IO_UTIL_H__ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h 
>> b/drivers/gpu/drm/msm/dp/dp_parser.h
>> index 3172da089421..094b39bfed8c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
>> @@ -10,7 +10,7 @@
>>   #include <linux/phy/phy.h>
>>   #include <linux/phy/phy-dp.h>
>> -#include "dpu_io_util.h"
>> +#include "dp_clk_util.h"
>>   #include "msm_drv.h"
>>   #define DP_LABEL "MDSS DP DISPLAY"
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 892c04365239..3e90fca33581 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -5,6 +5,7 @@
>>    * Author: Rob Clark <robdclark@gmail.com>
>>    */
>> +#include <linux/clk/clk-conf.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/kthread.h>
>>   #include <linux/sched/mm.h>
>> @@ -123,6 +124,54 @@ struct clk *msm_clk_get(struct platform_device 
>> *pdev, const char *name)
>>       return clk;
>>   }
>> +int msm_parse_clock(struct platform_device *pdev, struct 
>> clk_bulk_data **clocks)
> 
> Can you also move msm_parse_clock and other io helper methods (like 
> _msm_ioremap) into a separate msm_io_utils file instead? That would help 
> avoid file bloat.

Nice idea!

> Thanks,
> 
> Jessica Zhang
> 
>> +{
>> +    u32 i, rc = 0;
>> +    const char *clock_name;
>> +    struct clk_bulk_data *bulk;
>> +    int num_clk = 0;
>> +
>> +    if (!pdev)
>> +        return -EINVAL;
>> +
>> +    num_clk = of_property_count_strings(pdev->dev.of_node, 
>> "clock-names");
>> +    if (num_clk <= 0) {
>> +        pr_debug("clocks are not defined\n");
>> +        return 0;
>> +    }
>> +
>> +    bulk = devm_kcalloc(&pdev->dev, num_clk, sizeof(struct 
>> clk_bulk_data), GFP_KERNEL);
>> +    if (!bulk)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < num_clk; i++) {
>> +        rc = of_property_read_string_index(pdev->dev.of_node,
>> +                           "clock-names", i,
>> +                           &clock_name);
>> +        if (rc) {
>> +            DRM_DEV_ERROR(&pdev->dev, "Failed to get clock name for 
>> %d\n", i);
>> +            return rc;
>> +        }
>> +        bulk[i].id = devm_kstrdup(&pdev->dev, clock_name, GFP_KERNEL);
>> +    }
>> +
>> +    rc = devm_clk_bulk_get(&pdev->dev, num_clk, bulk);
>> +    if (rc) {
>> +        DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
>> +        return rc;
>> +    }
>> +
>> +    rc = of_clk_set_defaults(pdev->dev.of_node, false);
>> +    if (rc) {
>> +        DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults 
>> %d\n", rc);
>> +        return rc;
>> +    }
>> +
>> +    *clocks = bulk;
>> +
>> +    return num_clk;
>> +}
>> +
>>   static void __iomem *_msm_ioremap(struct platform_device *pdev, 
>> const char *name,
>>                     const char *dbgname, bool quiet, phys_addr_t *psize)
>>   {
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>> b/drivers/gpu/drm/msm/msm_drv.h
>> index 69952b239384..cfede901056d 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -477,6 +477,7 @@ struct clk *msm_clk_get(struct platform_device 
>> *pdev, const char *name);
>>   struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int 
>> count,
>>       const char *name);
>> +int msm_parse_clock(struct platform_device *pdev, struct 
>> clk_bulk_data **clocks);
>>   void __iomem *msm_ioremap(struct platform_device *pdev, const char 
>> *name,
>>           const char *dbgname);
>>   void __iomem *msm_ioremap_size(struct platform_device *pdev, const 
>> char *name,
>> -- 
>> 2.33.0
>>


-- 
With best wishes
Dmitry
