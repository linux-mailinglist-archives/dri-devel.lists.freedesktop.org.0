Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9078F27FB55
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22246E87A;
	Thu,  1 Oct 2020 08:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394EB6E584
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 08:25:00 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c3so576794plz.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=Ih3Pf7dIckvl94DJrioHSJL6mLp1o8KK854dwJlM+Rs=;
 b=Em/QYk4SOtwtQfC93qj80aLMdohAEkXpKPQMNnnimYd6cibrUc0PP6c6gTiXNuwndZ
 F91fPBs2LSDnssoHox5OuIFhJo9o5hf4fVOqt/CfCbUfcgQIlc5rN8nOipdZGlVJGYJp
 aAXZhUHLRrdirwWia/mxcXUmKrjoli8f5LzZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=Ih3Pf7dIckvl94DJrioHSJL6mLp1o8KK854dwJlM+Rs=;
 b=egBp/N80qkUU6L35vIAYUQ78gn513eqEClzc+K2N5J9RqYl/cyMH6C93qzETCKxYor
 lN0zvh0piCyp7XQ2vz2L/cVvmUuGHUJ31sfZEJ4sm0pqwsA5pkbVy49AQy1SfIZs2wpE
 ADxkVkmRA9ZlL+f6/Q5bB5hPwYfECGoeu06m5WklaiFHpiBy1DeUyl6Fm/zZsCWT+njp
 3+a8ZlbzQgEB5A7tRRP9xxlvQQB1cHcnT2BA6NO5+p7ez6N62bdFZ0d/kQ4JNJECga8z
 sGGlXsbVNk5TJnt/NhP3Jxrtl7fB5JwgzdutCuSWIgBAegxZOGQRH3Gj68PS+S1xeJtb
 7PzA==
X-Gm-Message-State: AOAM530FBBdyWS+uljnU6NHNqc8xu/paPuLuXcDc0UNMhH+/dujIafMh
 fXVK0zyFWyZP39spnZqTLOot9A==
X-Google-Smtp-Source: ABdhPJwIjYUNfZxO9sE2E4scR1kFmz0HCtyEz7PYrdueptBYstuv8MxM5HVdr6ppqtp8M8tTYAFMLg==
X-Received: by 2002:a17:90b:384c:: with SMTP id
 nl12mr1418467pjb.205.1601454299646; 
 Wed, 30 Sep 2020 01:24:59 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e207sm1483922pfh.171.2020.09.30.01.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 01:24:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200929171026.30551-1-khsieh@codeaurora.org>
References: <20200929171026.30551-1-khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: add voltage corners voting support base on dp
 link rate
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Wed, 30 Sep 2020 01:24:57 -0700
Message-ID: <160145429763.310579.786737478429183087@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-09-29 10:10:26)
> Set link rate by using OPP set rate api so that CX level will be set
> accordingly base on the link rate.

s/base/based/

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 2e3e1917351f..e1595d829e04 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1849,6 +1853,21 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>                 return ERR_PTR(-ENOMEM);
>         }
>  
> +       ctrl->opp_table = dev_pm_opp_set_clkname(dev, "ctrl_link");
> +
> +       if (IS_ERR(ctrl->opp_table)) {
> +               dev_err(dev, "invalid DP OPP table in device tree\n");
> +               ctrl->opp_table = NULL;
> +       } else {
> +               /* OPP table is optional */
> +               ret = dev_pm_opp_of_add_table(dev);
> +               if (ret && ret != -ENODEV) {
> +                       dev_err(dev, "add DP OPP table\n");

This is debug noise right?

> +                       dev_pm_opp_put_clkname(ctrl->opp_table);
> +                       ctrl->opp_table = NULL;
> +               }
> +       }
> +
>         init_completion(&ctrl->idle_comp);
>         init_completion(&ctrl->video_comp);
>  
> @@ -1864,6 +1883,18 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>         return &ctrl->dp_ctrl;
>  }
>  
> -void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl)
>  {
> +       struct dp_ctrl_private *ctrl;
> +
> +       if (!dp_ctrl)

Can this happen?

> +               return;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       if (ctrl->opp_table != NULL) {

This is usually written as

	if (ctrl->opp_table)

> +               dev_pm_opp_of_remove_table(dev);
> +               dev_pm_opp_put_clkname(ctrl->opp_table);
> +               ctrl->opp_table = NULL;
> +       }
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index f60ba93c8678..19b412a93e02 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -31,6 +31,6 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>                         struct dp_panel *panel, struct drm_dp_aux *aux,
>                         struct dp_power *power, struct dp_catalog *catalog,
>                         struct dp_parser *parser);
> -void dp_ctrl_put(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_put(struct device *dev, struct dp_ctrl *dp_ctrl);

Is 'dev' not inside 'dp_ctrl'?

>  
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index 17c1fc6a2d44..3d75bf09e38f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -8,12 +8,14 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/pm_opp.h>
>  #include "dp_power.h"
>  #include "msm_drv.h"
>  
>  struct dp_power_private {
>         struct dp_parser *parser;
>         struct platform_device *pdev;
> +       struct device *dev;
>         struct clk *link_clk_src;
>         struct clk *pixel_provider;
>         struct clk *link_provider;
> @@ -148,18 +150,49 @@ static int dp_power_clk_deinit(struct dp_power_private *power)
>         return 0;
>  }
>  
> +static int dp_power_clk_set_link_rate(struct dp_power_private *power,
> +                       struct dss_clk *clk_arry, int num_clk, int enable)
> +{
> +       u32 rate;
> +       int i, rc = 0;
> +
> +       for (i = 0; i < num_clk; i++) {
> +               if (clk_arry[i].clk) {
> +                       if (clk_arry[i].type == DSS_CLK_PCLK) {
> +                               if (enable)
> +                                       rate = clk_arry[i].rate;
> +                               else
> +                                       rate = 0;
> +
> +                               rc = dev_pm_opp_set_rate(power->dev, rate);

Why do we keep going if rc is non-zero?

> +                       }
> +
> +               }
> +       }
> +       return rc;
> +}
> +
>  static int dp_power_clk_set_rate(struct dp_power_private *power,
>                 enum dp_pm_type module, bool enable)
>  {
>         int rc = 0;
>         struct dss_module_power *mp = &power->parser->mp[module];
>  
> -       if (enable) {
> -               rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
> +       if (module == DP_CTRL_PM) {
> +               rc = dp_power_clk_set_link_rate(power, mp->clk_config, mp->num_clk, enable);
>                 if (rc) {
> -                       DRM_ERROR("failed to set clks rate.\n");
> +                       DRM_ERROR("failed to set link clks rate.\n");
>                         return rc;
>                 }
> +       } else {
> +
> +               if (enable) {
> +                       rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
> +                       if (rc) {
> +                               DRM_ERROR("failed to set clks rate.\n");

Not sure we need the period on these error messages.

> +                               return rc;
> +                       }
> +               }
>         }
>  
>         rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
> 
> base-commit: 3c0f462da069af12211901ddf26f7e16e6951d9b
> prerequisite-patch-id: a109eaf08147f50149ad661a58122b6745a52445

Can you rebase this on Rob's msm-next tree
(https://gitlab.freedesktop.org/drm/msm.git) and test? It doesn't apply
for me because I have the dp phy patch from there.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
