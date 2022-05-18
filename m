Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B652C63C
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 00:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148D5113F4D;
	Wed, 18 May 2022 22:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873A6113F40
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 22:27:57 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id bs17so3170338qkb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 15:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3UU5msaphSmB5lDm+3LuPKbDiBcvahSnID2D1dWmy1Q=;
 b=h577d8jKXGIOrRsZZzl28hbNqv4ksUhhE+rrl0Q5GzyQDeuPu/2r0AzIqaVaDV+ixl
 MNCdhZ+Oz+v8OJjH7CNRLBnIiJHdWZNrpgjtDaZHhAe3+RjpnLRvByuHpPh4jCLU8pcM
 de7pWwA3Q5pipir/j2GONAjSRcm6mWnm7cuddHT/eLjuNhzHeaeSAvw0CXM8NURexgXP
 6cpwFaBR14E/olKuWbD5zylHDN5AgnQn0J4DY3c1rJO3XWcu3YcQxe16xqwG8PN5X1Cv
 unYaHaleqIlG7mad1K1NwlLTkx0mJdyAhPtsskDXFQ/RJ6ysS7KPxSAV58Z7lp6zKbqO
 mW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3UU5msaphSmB5lDm+3LuPKbDiBcvahSnID2D1dWmy1Q=;
 b=JUrNvCPbH3KM5AvfjZ6fAQeMrJrRUaMcFOFimeszWDvtG6F/vcA8e904Y+lGUYOF9R
 OAfb91mDxp70ALqZsdALNOqTitPw6llumI0DjaWj5ZeDVmSqzz6jpu0L8jEG7sRX5uC+
 S4sOxxXzcQ8UZBytD6D559cfQoa/gqgogcMOsrTOkhm/GWMSvMtnSH0Q/Qn/QHVNko8c
 gzIPAcfltTVCgNe+VMBJ0QTovAgaXfml8YMDNz1Fb9qxuWGxpuBmCAJf6AkaHC3rp1Ry
 lOo1svH9vzDfshxc86vxqEmTpm1oj1QZ6dTh+VNMw1GRwJLfexvmdinEiTV4t7VT+x+f
 CyIQ==
X-Gm-Message-State: AOAM533PDmeOi1s/7E+FjczEaDgikCL0QmY28YrDoU9ThjeumHaBzOkU
 0l1GFnQyutJaJK2jawmz995bN5JCngFoWfyf2J/nGQ==
X-Google-Smtp-Source: ABdhPJyQVhM6l49ek+YIrFtoon60Aw4+IDdGioQ7hdh1MD6cJt2YhV8OtKfuTsNW6jReYZkCf+K+AmnHDuxupocYs7M=
X-Received: by 2002:a37:582:0:b0:6a3:2ce4:3c72 with SMTP id
 124-20020a370582000000b006a32ce43c72mr804617qkf.203.1652912876406; Wed, 18
 May 2022 15:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <1652909790-16245-1-git-send-email-quic_khsieh@quicinc.com>
 <1652909790-16245-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652909790-16245-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 May 2022 01:27:45 +0300
Message-ID: <CAA8EJpp3cdLw1nrf2oWhrXO0GRSJTX-Rbvx1rLB_F67dO5LBKA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/msm/dp: delete vdda regulator related
 functions from eDP/DP controller
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 May 2022 at 00:36, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Vdda regulators are related to both eDP and DP phy so that it should be
> managed at eDP and DP phy driver instead of controller. This patch removes
> vdda regulators related functions out of eDP/DP controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 14 ------
>  drivers/gpu/drm/msm/dp/dp_parser.h |  6 ---
>  drivers/gpu/drm/msm/dp/dp_power.c  | 95 +-------------------------------------
>  3 files changed, 2 insertions(+), 113 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 8f9fed9..4ef2130 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -22,14 +22,6 @@
>  #define DP_DEFAULT_P0_OFFSET   0x1000
>  #define DP_DEFAULT_P0_SIZE     0x0400
>
> -static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
> -       .num = 2,
> -       .regs = {
> -               {"vdda-1p2", 21800, 4 },        /* 1.2 V */
> -               {"vdda-0p9", 36000, 32 },       /* 0.9 V */
> -       },
> -};
> -
>  static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
>  {
>         struct resource *res;
> @@ -298,12 +290,6 @@ static int dp_parser_parse(struct dp_parser *parser)
>         if (rc)
>                 return rc;
>
> -       /* Map the corresponding regulator information according to
> -        * version. Currently, since we only have one supported platform,
> -        * mapping the regulator directly.
> -        */
> -       parser->regulator_cfg = &sdm845_dp_reg_cfg;
> -
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 3a4d797..b56b4d7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -101,11 +101,6 @@ struct dp_reg_entry {
>         int disable_load;
>  };
>
> -struct dp_regulator_cfg {
> -       int num;
> -       struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];
> -};
> -
>  /**
>   * struct dp_parser - DP parser's data exposed to clients
>   *
> @@ -121,7 +116,6 @@ struct dp_parser {
>         struct dp_pinctrl pinctrl;
>         struct dp_io io;
>         struct dp_display_data disp_data;
> -       const struct dp_regulator_cfg *regulator_cfg;
>         u32 max_dp_lanes;
>         struct drm_bridge *next_bridge;
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index d9e0117..b52ac1d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -20,82 +20,10 @@ struct dp_power_private {
>         struct clk *link_clk_src;
>         struct clk *pixel_provider;
>         struct clk *link_provider;
> -       struct regulator_bulk_data supplies[DP_DEV_REGULATOR_MAX];
>
>         struct dp_power dp_power;
>  };
>
> -static void dp_power_regulator_disable(struct dp_power_private *power)
> -{
> -       struct regulator_bulk_data *s = power->supplies;
> -       const struct dp_reg_entry *regs = power->parser->regulator_cfg->regs;
> -       int num = power->parser->regulator_cfg->num;
> -       int i;
> -
> -       DBG("");
> -       for (i = num - 1; i >= 0; i--)
> -               if (regs[i].disable_load >= 0)
> -                       regulator_set_load(s[i].consumer,
> -                                          regs[i].disable_load);
> -
> -       regulator_bulk_disable(num, s);
> -}
> -
> -static int dp_power_regulator_enable(struct dp_power_private *power)
> -{
> -       struct regulator_bulk_data *s = power->supplies;
> -       const struct dp_reg_entry *regs = power->parser->regulator_cfg->regs;
> -       int num = power->parser->regulator_cfg->num;
> -       int ret, i;
> -
> -       DBG("");
> -       for (i = 0; i < num; i++) {
> -               if (regs[i].enable_load >= 0) {
> -                       ret = regulator_set_load(s[i].consumer,
> -                                                regs[i].enable_load);
> -                       if (ret < 0) {
> -                               pr_err("regulator %d set op mode failed, %d\n",
> -                                       i, ret);
> -                               goto fail;
> -                       }
> -               }
> -       }
> -
> -       ret = regulator_bulk_enable(num, s);
> -       if (ret < 0) {
> -               pr_err("regulator enable failed, %d\n", ret);
> -               goto fail;
> -       }
> -
> -       return 0;
> -
> -fail:
> -       for (i--; i >= 0; i--)
> -               regulator_set_load(s[i].consumer, regs[i].disable_load);
> -       return ret;
> -}
> -
> -static int dp_power_regulator_init(struct dp_power_private *power)
> -{
> -       struct regulator_bulk_data *s = power->supplies;
> -       const struct dp_reg_entry *regs = power->parser->regulator_cfg->regs;
> -       struct platform_device *pdev = power->pdev;
> -       int num = power->parser->regulator_cfg->num;
> -       int i, ret;
> -
> -       for (i = 0; i < num; i++)
> -               s[i].supply = regs[i].name;
> -
> -       ret = devm_regulator_bulk_get(&pdev->dev, num, s);
> -       if (ret < 0) {
> -               pr_err("%s: failed to init regulator, ret=%d\n",
> -                                               __func__, ret);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  static int dp_power_clk_init(struct dp_power_private *power)
>  {
>         int rc = 0;
> @@ -318,21 +246,10 @@ int dp_power_client_init(struct dp_power *dp_power)
>
>         pm_runtime_enable(&power->pdev->dev);
>
> -       rc = dp_power_regulator_init(power);
> -       if (rc) {
> -               DRM_ERROR("failed to init regulators %d\n", rc);
> -               goto error;
> -       }
> -
>         rc = dp_power_clk_init(power);
> -       if (rc) {
> +       if (rc)
>                 DRM_ERROR("failed to init clocks %d\n", rc);
> -               goto error;
> -       }
> -       return 0;
>
> -error:
> -       pm_runtime_disable(&power->pdev->dev);
>         return rc;
>  }
>
> @@ -365,22 +282,15 @@ int dp_power_init(struct dp_power *dp_power, bool flip)
>         power = container_of(dp_power, struct dp_power_private, dp_power);
>
>         pm_runtime_get_sync(&power->pdev->dev);
> -       rc = dp_power_regulator_enable(power);
> -       if (rc) {
> -               DRM_ERROR("failed to enable regulators, %d\n", rc);
> -               goto exit;
> -       }
>
>         rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
>         if (rc) {
>                 DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
> -               goto err_clk;
> +               goto exit;
>         }
>
>         return 0;
>
> -err_clk:
> -       dp_power_regulator_disable(power);
>  exit:
>         pm_runtime_put_sync(&power->pdev->dev);
>         return rc;
> @@ -393,7 +303,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>         power = container_of(dp_power, struct dp_power_private, dp_power);
>
>         dp_power_clk_enable(dp_power, DP_CORE_PM, false);
> -       dp_power_regulator_disable(power);
>         pm_runtime_put_sync(&power->pdev->dev);
>         return 0;
>  }
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
