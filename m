Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8876C2830C9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 09:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064756E094;
	Mon,  5 Oct 2020 07:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89C36E13C
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 18:22:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601749339; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=z7E62nRv/bMHkkyglVWth0jbZsLTybTXAcHLb86fpFc=;
 b=OwvhOxU8mBIfaWCpoBu0jK8Ar5UXx91ijL9ehCPr3rTS+aWE24ItkVybCD++t+ZuSpnybS37
 nTcmIqVnl8VxEWQkcOOCp0tF3XlFg63cClkASla0zBIFpgoTnpkFfr4+myaNhGccnjP/TXyR
 R0XA32mSaUeLtTQT8ZS9yshHcOQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f78c14857b88ccb56f6f814 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 03 Oct 2020 18:22:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 94D58C433F1; Sat,  3 Oct 2020 18:22:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CD9DC433C8;
 Sat,  3 Oct 2020 18:21:59 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 03 Oct 2020 11:21:59 -0700
From: khsieh@codeaurora.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: add voltage corners voting support base on dp
 link rate
In-Reply-To: <01467014-1190-6e1b-8120-472719861a5e@codeaurora.org>
References: <20200929171026.30551-1-khsieh@codeaurora.org>
 <160145429763.310579.786737478429183087@swboyd.mtv.corp.google.com>
 <01467014-1190-6e1b-8120-472719861a5e@codeaurora.org>
Message-ID: <f2b0ff7ce6e87be7fd0e5671dade011f@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Mon, 05 Oct 2020 07:22:30 +0000
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 Stephen Boyd <swboyd@chromium.org>, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-30 09:24, Rajendra Nayak wrote:
> On 9/30/2020 1:54 PM, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2020-09-29 10:10:26)
>>> Set link rate by using OPP set rate api so that CX level will be set
>>> accordingly base on the link rate.
>> 
>> s/base/based/
>> 
>>> 
>>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>>> ---
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index 2e3e1917351f..e1595d829e04 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -1849,6 +1853,21 @@ struct dp_ctrl *dp_ctrl_get(struct device 
>>> *dev, struct dp_link *link,
>>>                  return ERR_PTR(-ENOMEM);
>>>          }
>>>   +       ctrl->opp_table = dev_pm_opp_set_clkname(dev, "ctrl_link");
> 
> I see that downstream has multiple DP clocks which end up voting on
> CX, we don't have a
> way of associating multiple OPP tables with a device upstream, so
> whats usually done is
> (assuming all the clocks get scaled in lock step, which I assume is
> the case here) we pick
> the clock with the 'highest' CX requirement and associate that with
> the OPP table.
> I haven't looked but I am hoping thats how we have decided to
> associate "ctrl_link" clock
> here?
> 
yes, only ctrl_link use dev_pm_opp_set_rate() to set rate.

>>> +
>>> +       if (IS_ERR(ctrl->opp_table)) {
>>> +               dev_err(dev, "invalid DP OPP table in device 
>>> tree\n");
>>> +               ctrl->opp_table = NULL;
>>> +       } else {
>>> +               /* OPP table is optional */
>>> +               ret = dev_pm_opp_of_add_table(dev);
>>> +               if (ret && ret != -ENODEV) {
>>> +                       dev_err(dev, "add DP OPP table\n");
>> 
>> This is debug noise right?
>> 
>>> +                       dev_pm_opp_put_clkname(ctrl->opp_table);
>>> +                       ctrl->opp_table = NULL;
>>> +               }
>>> +       }
>>> +
>>>          init_completion(&ctrl->idle_comp);
>>>          init_completion(&ctrl->video_comp);
>>>   @@ -1864,6 +1883,18 @@ struct dp_ctrl *dp_ctrl_get(struct device 
>>> *dev, struct dp_link *link,
>>>          return &ctrl->dp_ctrl;
>>>   }
>>>   -void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
>>> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl)
>>>   {
>>> +       struct dp_ctrl_private *ctrl;
>>> +
>>> +       if (!dp_ctrl)
>> 
>> Can this happen?
>> 
>>> +               return;
>>> +
>>> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, 
>>> dp_ctrl);
>>> +
>>> +       if (ctrl->opp_table != NULL) {
>> 
>> This is usually written as
>> 
>> 	if (ctrl->opp_table)
>> 
>>> +               dev_pm_opp_of_remove_table(dev);
>>> +               dev_pm_opp_put_clkname(ctrl->opp_table);
>>> +               ctrl->opp_table = NULL;
>>> +       }
>>>   }
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h 
>>> b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>>> index f60ba93c8678..19b412a93e02 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>>> @@ -31,6 +31,6 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, 
>>> struct dp_link *link,
>>>                          struct dp_panel *panel, struct drm_dp_aux 
>>> *aux,
>>>                          struct dp_power *power, struct dp_catalog 
>>> *catalog,
>>>                          struct dp_parser *parser);
>>> -void dp_ctrl_put(struct dp_ctrl *dp_ctrl);
>>> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl);
>> 
>> Is 'dev' not inside 'dp_ctrl'?
>> 
>>>     #endif /* _DP_CTRL_H_ */
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c 
>>> b/drivers/gpu/drm/msm/dp/dp_power.c
>>> index 17c1fc6a2d44..3d75bf09e38f 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>>> @@ -8,12 +8,14 @@
>>>   #include <linux/clk.h>
>>>   #include <linux/clk-provider.h>
>>>   #include <linux/regulator/consumer.h>
>>> +#include <linux/pm_opp.h>
>>>   #include "dp_power.h"
>>>   #include "msm_drv.h"
>>>     struct dp_power_private {
>>>          struct dp_parser *parser;
>>>          struct platform_device *pdev;
>>> +       struct device *dev;
>>>          struct clk *link_clk_src;
>>>          struct clk *pixel_provider;
>>>          struct clk *link_provider;
>>> @@ -148,18 +150,49 @@ static int dp_power_clk_deinit(struct 
>>> dp_power_private *power)
>>>          return 0;
>>>   }
>>>   +static int dp_power_clk_set_link_rate(struct dp_power_private 
>>> *power,
>>> +                       struct dss_clk *clk_arry, int num_clk, int 
>>> enable)
>>> +{
>>> +       u32 rate;
>>> +       int i, rc = 0;
>>> +
>>> +       for (i = 0; i < num_clk; i++) {
>>> +               if (clk_arry[i].clk) {
>>> +                       if (clk_arry[i].type == DSS_CLK_PCLK) {
>>> +                               if (enable)
>>> +                                       rate = clk_arry[i].rate;
>>> +                               else
>>> +                                       rate = 0;
>>> +
>>> +                               rc = dev_pm_opp_set_rate(power->dev, 
>>> rate);
>> 
>> Why do we keep going if rc is non-zero?
>> 
>>> +                       }
>>> +
>>> +               }
>>> +       }
>>> +       return rc;
>>> +}
>>> +
>>>   static int dp_power_clk_set_rate(struct dp_power_private *power,
>>>                  enum dp_pm_type module, bool enable)
>>>   {
>>>          int rc = 0;
>>>          struct dss_module_power *mp = &power->parser->mp[module];
>>>   -       if (enable) {
>>> -               rc = msm_dss_clk_set_rate(mp->clk_config, 
>>> mp->num_clk);
>>> +       if (module == DP_CTRL_PM) {
>>> +               rc = dp_power_clk_set_link_rate(power, 
>>> mp->clk_config, mp->num_clk, enable);
>>>                  if (rc) {
>>> -                       DRM_ERROR("failed to set clks rate.\n");
>>> +                       DRM_ERROR("failed to set link clks rate.\n");
>>>                          return rc;
>>>                  }
>>> +       } else {
>>> +
>>> +               if (enable) {
>>> +                       rc = msm_dss_clk_set_rate(mp->clk_config, 
>>> mp->num_clk);
>>> +                       if (rc) {
>>> +                               DRM_ERROR("failed to set clks 
>>> rate.\n");
>> 
>> Not sure we need the period on these error messages.
>> 
>>> +                               return rc;
>>> +                       }
>>> +               }
>>>          }
>>>            rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, 
>>> enable);
>>> 
>>> base-commit: 3c0f462da069af12211901ddf26f7e16e6951d9b
>>> prerequisite-patch-id: a109eaf08147f50149ad661a58122b6745a52445
>> 
>> Can you rebase this on Rob's msm-next tree
>> (https://gitlab.freedesktop.org/drm/msm.git) and test? It doesn't 
>> apply
>> for me because I have the dp phy patch from there.
>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
