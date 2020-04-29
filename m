Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF27F1BE03C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321CA6EE56;
	Wed, 29 Apr 2020 14:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7567D6EE56
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:08:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588169297; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8d9ZLjxSR0ZlqB/VJAA5CdOOM+8E+0gW1EHYL9ahnh4=;
 b=ZoR1miBA+QSSP1H3pMnYlqi2qskpNoO1/lFZ1NBp4DMVeg0X529wCVo0xbCVabhTSe/9GB9f
 qDvarIfkwROrNbfR/Hs7+dG8vcBPcpBEH4fhvIeScnlaAj1biDvqRJBiY+Hj2ZLZGf8XKmWw
 GEhe8Me0rkRNxaEDW+DwWGWVhLc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea98a42.7fa4e9c42308-smtp-out-n02;
 Wed, 29 Apr 2020 14:08:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 87095C4478F; Wed, 29 Apr 2020 14:08:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.182.194]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 352B8C433CB;
 Wed, 29 Apr 2020 14:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 352B8C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 05/17] drm/msm/dpu: Use OPP API to set clk/perf state
To: Rob Clark <robdclark@gmail.com>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-6-git-send-email-rnayak@codeaurora.org>
 <CAF6AEGsEgZc=NehvFH2bRfHxcM1uR6s3sLLhk-cQPXM0SXw6Lw@mail.gmail.com>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <3f77e48d-a884-b1c7-133b-7b26a56e23ed@codeaurora.org>
Date: Wed, 29 Apr 2020 19:37:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsEgZc=NehvFH2bRfHxcM1uR6s3sLLhk-cQPXM0SXw6Lw@mail.gmail.com>
Content-Language: en-US
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/28/2020 10:02 PM, Rob Clark wrote:
> On Tue, Apr 28, 2020 at 6:39 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> On some qualcomm platforms DPU needs to express a perforamnce state
> 
> s/perforamnce/performance/
> 
>> requirement on a power domain depennding on the clock rates.
> 
> s/depennding/depending/
> 
>> Use OPP table from DT to register with OPP framework and use
>> dev_pm_opp_set_rate() to set the clk/perf state.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 25 ++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++++
>>   3 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> index 11f2beb..fe5717df 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/debugfs.h>
>>   #include <linux/errno.h>
>>   #include <linux/mutex.h>
>> +#include <linux/pm_opp.h>
>>   #include <linux/sort.h>
>>   #include <linux/clk.h>
>>   #include <linux/bitmap.h>
>> @@ -239,7 +240,7 @@ static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
>>                  rate = core_clk->max_rate;
>>
>>          core_clk->rate = rate;
>> -       return msm_dss_clk_set_rate(core_clk, 1);
>> +       return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
> 
> I think this leaves msm_dss_clk_set_rate() unused now?

yup, I didn't realise, I will get rid of it when I respin.
> 
> Other than that,
> 
> Reviewed-by: Rob Clark <robdclark@chromium.org>

Thanks.

> 
>>   }
>>
>>   static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index ce19f1d..2f53bbf 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/debugfs.h>
>>   #include <linux/dma-buf.h>
>>   #include <linux/of_irq.h>
>> +#include <linux/pm_opp.h>
>>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_file.h>
>> @@ -1033,11 +1034,23 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>>          if (!dpu_kms)
>>                  return -ENOMEM;
>>
>> +       dpu_kms->opp_table = dev_pm_opp_set_clkname(dev, "core");
>> +       if (IS_ERR(dpu_kms->opp_table))
>> +               return PTR_ERR(dpu_kms->opp_table);
>> +       /* OPP table is optional */
>> +       ret = dev_pm_opp_of_add_table(dev);
>> +       if (!ret) {
>> +               dpu_kms->has_opp_table = true;
>> +       } else if (ret != -ENODEV) {
>> +               dev_err(dev, "Invalid OPP table in Device tree\n");
>> +               return ret;
>> +       }
>> +
>>          mp = &dpu_kms->mp;
>>          ret = msm_dss_parse_clock(pdev, mp);
>>          if (ret) {
>>                  DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
>> -               return ret;
>> +               goto err;
>>          }
>>
>>          platform_set_drvdata(pdev, dpu_kms);
>> @@ -1051,6 +1064,11 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>>
>>          priv->kms = &dpu_kms->base;
>>          return ret;
>> +err:
>> +       if (dpu_kms->has_opp_table)
>> +               dev_pm_opp_of_remove_table(dev);
>> +       dev_pm_opp_put_clkname(dpu_kms->opp_table);
>> +       return ret;
>>   }
>>
>>   static void dpu_unbind(struct device *dev, struct device *master, void *data)
>> @@ -1059,6 +1077,9 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
>>          struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>>          struct dss_module_power *mp = &dpu_kms->mp;
>>
>> +       if (dpu_kms->has_opp_table)
>> +               dev_pm_opp_of_remove_table(dev);
>> +       dev_pm_opp_put_clkname(dpu_kms->opp_table);
>>          msm_dss_put_clk(mp->clk_config, mp->num_clk);
>>          devm_kfree(&pdev->dev, mp->clk_config);
>>          mp->num_clk = 0;
>> @@ -1090,6 +1111,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>>          struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>>          struct dss_module_power *mp = &dpu_kms->mp;
>>
>> +       /* Drop the performance state vote */
>> +       dev_pm_opp_set_rate(dev, 0);
>>          rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
>>          if (rc)
>>                  DPU_ERROR("clock disable failed rc:%d\n", rc);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> index 211f5de9..2a52e4e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
>> @@ -128,6 +128,10 @@ struct dpu_kms {
>>
>>          struct platform_device *pdev;
>>          bool rpm_enabled;
>> +
>> +       struct opp_table *opp_table;
>> +       bool has_opp_table;
>> +
>>          struct dss_module_power mp;
>>
>>          /* reference count bandwidth requests, so we know when we can
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
