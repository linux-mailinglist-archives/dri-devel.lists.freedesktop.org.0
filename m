Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C616552C0E1
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 19:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB9610E7AF;
	Wed, 18 May 2022 17:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B382110E7AF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 17:13:46 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id p4so2085634qtq.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m0EQzS/VqNCfQ4KDnFRxmHQmYEmoraqHDmyjhT4hnCo=;
 b=X28aWVy8ugf8zMcg6nJ5y6tZ8Iq59e/3L6l0EWPIUkmhCU7yERG7aeqZA1M5ZJCsVf
 Sb2vX+dYi00LZ38HkR43+214nooewsIs/ycBkpVL+adeUC6xsdAWDjX/WNsMecaNr5UI
 vwFbbqJ5kdfWfDVZiy1YVZGjrfs7VM1HgMXknbH9jOHRAQlhvwcf6H3sirwvMEnFiei9
 dUFQCtBrwtXr7k52dlwAnPG2Vu3v4Ajx0zfi7qbC1BB2qDQSgupppDVebvQtt44j7lyl
 LTbHY5EBEEE1ElOwV7oe0NNusPdyKVW8yb/V91+T+UB64Qq8oHmg5TIxkOTIqJBFrvf6
 KNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0EQzS/VqNCfQ4KDnFRxmHQmYEmoraqHDmyjhT4hnCo=;
 b=vVn+Jm34EnoBfzfT2HpaUpi92ociEVG9xErOCZ6XDqd3ikYuhgORxw0wFvZ69YZDVU
 XCuTY3qF95EXxkej+NgTRD/dns9HzLQaE2e1n8fouh/6WtdFQysl9fWgpG92ZnF0fzBC
 JUEIl3I/LCdwtxb/6HmBSp1yVMkGaqKtNMWXTxzfUBC0KxiYkpw8vAm/VTBJ/nQkBrHC
 zY23dWOjM92LdjdlT4+X+RfZPFDX7FtlSVmD1VGhZAZzz1XBKkBeWHMmL8qv2IP93nel
 qbmXeqExmPNgQV0rsER7PJheKhFf6X4Dhgq9q3HuLDj+2ygWNPrfsz8EVLXWddce3ALD
 8uFA==
X-Gm-Message-State: AOAM531BFG2NNEJmkT/1B6a1wWXqGlLu2owGKmZbE5DgmPhjEIiunfE/
 h746JV505hGpUL1QbvdK8ru97vK0KFROyD5YoK0IzA==
X-Google-Smtp-Source: ABdhPJzqpwz4aVoFbxmUu0W9vPn//It7ccEyNoNn/FnF6/JsP8m1DvDepidz1cP/UL69l6jnE+QcaInqwesvPkOVNZI=
X-Received: by 2002:a05:622a:188e:b0:2f3:dc9f:946 with SMTP id
 v14-20020a05622a188e00b002f3dc9f0946mr722683qtc.682.1652894025814; Wed, 18
 May 2022 10:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
 <1652892186-22346-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652892186-22346-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 May 2022 20:13:34 +0300
Message-ID: <CAA8EJproaN0gdhoT0fiGo459ykdNJXJyPM7nPuwawCQxJnfFBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: delete vdda regulator related
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

On Wed, 18 May 2022 at 19:43, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Vdda regulators are related to both eDP and DP phy so that it should be
> managed at eDP and DP phy driver instead of controller. This patch remove

removes

> vdda regulators related functions out of eDP/DP controller.
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
