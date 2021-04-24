Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5CF36A195
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 16:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B376E283;
	Sat, 24 Apr 2021 14:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E576E24E
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 14:27:13 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id h3so24440287qve.13
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FyTmj2yrGu10LoW4x7q1sjq4p7FQgiD13avai4rt2WA=;
 b=J6pKOSL8fluC0wMhPATdhdw25O9aQgaqzzV9J5246bjshX8/tY72j5S8UL0CV8nBqg
 ImeLm2qeU+HSXY09kMvxhHdP0d+V5AzJfLEdYbysaVCdqZnieAzDVUDFc53ZAN+tZZp4
 nHRlgGf3MwE9gHwJ55hDau95iLoF2Bf2Sz6wzxLAHXvW6XGcAF3HDAz+Vf++ZagVbStl
 Lxd2kqLdu/S2hKQXi1Xbgof669x2uzM6UwkJ22Bq2pY5XOYQoOG6ePBqCjO8/8l/rD0o
 Cg4iu/R5PPVKaHM3uy9YpHwyxmUH/33bbsWJf3OmUr+Z4Iv4n3HSmdJzVwbxtq3fbnZ6
 dwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FyTmj2yrGu10LoW4x7q1sjq4p7FQgiD13avai4rt2WA=;
 b=l7VJjasfTfrnXAXfsawh7FJiy5ZHt7XoLbQ7QK2aRkAp2UhP5aKMwq2yvqaZnUDBww
 pD63Qj4PkRqbs97/bAuzeZ153ap8urUOCbx2CV8XJyRoXt5+vyHD+slQV6Q641FahV7f
 Xnjp6KVSAHyt4tHYcW8Ij1/O0BjWRmW7jJiSh7cbS6j41H/8Gt4L/W+tXSjl4WJykv6Z
 kFSszp9QoP/yMg0Oh5LyyzlqVOU55p7zFnjUjrUL8I5kkNVrgUB6/vGPY+FB89qeUNW2
 AbOZmtIZ0kfmhFK44lNbzxDVof5Ep6HdIqP1wq66QEvXeH/jzf25fZgIWkvptgG9BkeW
 8H+w==
X-Gm-Message-State: AOAM5300w322CRXpi45wYdBYEyvhCdavI5rHhLYyUKGVw0XaJGE0q4Dd
 MLoovtYukIi5b9ekbzPUWENYgbCTE8uHG0wOCO1RCQ==
X-Google-Smtp-Source: ABdhPJykyHPvrAJIJUTr37sQJHCWGyxPzRuhdUoC9uc8YhjWWEc9WTYEpOBvFSQ57F14vRzVdBdFv1e5G9KDOzj3U+w=
X-Received: by 2002:a05:6214:504:: with SMTP id v4mr9543317qvw.4.1619274432026; 
 Sat, 24 Apr 2021 07:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210423172450.4885-1-jonathan@marek.ca>
 <20210423172450.4885-2-jonathan@marek.ca>
In-Reply-To: <20210423172450.4885-2-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 24 Apr 2021 17:27:00 +0300
Message-ID: <CAA8EJppbBQGQds2=UADuHweWhiv3ZU3+eqxHqUqi9LfbMjLiBQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: support CPHY mode for 7nm pll/phy
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: Rajendra Nayak <rnayak@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bernard Zhao <bernard@vivo.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Apr 2021 at 20:28, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Add the required changes to support 7nm pll/phy in CPHY mode.
>
> This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
> the CPHY mode.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h         |   2 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c        |  34 ++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  47 +++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |   3 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 147 +++++++++++++++-------
>  5 files changed, 185 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 50eb4d1b8fdd..5087a65d3e11 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -621,6 +621,8 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
>         return ((val) << DSI_VERSION_MAJOR__SHIFT) & DSI_VERSION_MAJOR__MASK;
>  }
>
> +#define REG_DSI_CPHY_MODE_CTRL                                 0x000002d4
> +
>  #define REG_DSI_PHY_PLL_CTRL_0                                 0x00000200
>  #define DSI_PHY_PLL_CTRL_0_ENABLE                              0x00000001
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 8a10e4343281..ab8a8d408d50 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -27,6 +27,7 @@
>  #include "dsi_cfg.h"
>  #include "msm_kms.h"
>  #include "msm_gem.h"
> +#include "phy/dsi_phy.h"
>
>  #define DSI_RESET_TOGGLE_DELAY_MS 20
>
> @@ -168,6 +169,9 @@ struct msm_dsi_host {
>         int dlane_swap;
>         int num_data_lanes;
>
> +       /* from phy DT */
> +       bool cphy_mode;
> +
>         u32 dma_cmd_ctrl_restore;
>
>         bool registered;
> @@ -511,6 +515,7 @@ int msm_dsi_runtime_resume(struct device *dev)
>
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  {
> +       u32 byte_intf_rate;
>         int ret;
>
>         DBG("Set clk rates: pclk=%d, byteclk=%d",
> @@ -530,8 +535,13 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>         }
>
>         if (msm_host->byte_intf_clk) {
> -               ret = clk_set_rate(msm_host->byte_intf_clk,
> -                                  msm_host->byte_clk_rate / 2);
> +               /* For CPHY, byte_intf_clk is same as byte_clk */
> +               if (msm_host->cphy_mode)
> +                       byte_intf_rate = msm_host->byte_clk_rate;
> +               else
> +                       byte_intf_rate = msm_host->byte_clk_rate / 2;
> +
> +               ret = clk_set_rate(msm_host->byte_intf_clk, byte_intf_rate);
>                 if (ret) {
>                         pr_err("%s: Failed to set rate byte intf clk, %d\n",
>                                __func__, ret);
> @@ -711,7 +721,11 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_dual_dsi)
>                 lanes = 1;
>         }
>
> -       do_div(pclk_bpp, (8 * lanes));
> +       /* CPHY "byte_clk" is in units of 16 bits */
> +       if (msm_host->cphy_mode)
> +               do_div(pclk_bpp, (16 * lanes));
> +       else
> +               do_div(pclk_bpp, (8 * lanes));
>
>         msm_host->pixel_clk_rate = pclk_rate;
>         msm_host->byte_clk_rate = pclk_bpp;
> @@ -937,6 +951,9 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>         data |= DSI_CTRL_ENABLE;
>
>         dsi_write(msm_host, REG_DSI_CTRL, data);
> +
> +       if (msm_host->cphy_mode)
> +               dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
>  }
>
>  static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_dual_dsi)
> @@ -2230,6 +2247,8 @@ int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
>         struct clk *byte_clk_provider, *pixel_clk_provider;
>         int ret;
>
> +       msm_host->cphy_mode = src_phy->cphy_mode;
> +
>         ret = msm_dsi_phy_get_clk_provider(src_phy,
>                                 &byte_clk_provider, &pixel_clk_provider);
>         if (ret) {
> @@ -2301,7 +2320,14 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
>                 return;
>         }
>
> -       clk_req->bitclk_rate = msm_host->byte_clk_rate * 8;
> +       /* CPHY transmits 16 bits over 7 clock cycles
> +        * "byte_clk" is in units of 16-bits (see dsi_calc_pclk),
> +        * so multiply by 7 to get the "bitclk rate"
> +        */
> +       if (msm_host->cphy_mode)
> +               clk_req->bitclk_rate = msm_host->byte_clk_rate * 7;
> +       else
> +               clk_req->bitclk_rate = msm_host->byte_clk_rate * 8;
>         clk_req->escclk_rate = msm_host->esc_clk_rate;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index ff7f2ec42030..5dd9dc4d81e2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -461,6 +461,51 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
>         return 0;
>  }
>
> +int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
> +       struct msm_dsi_phy_clk_request *clk_req)
> +{
> +       const unsigned long bit_rate = clk_req->bitclk_rate;
> +       const unsigned long esc_rate = clk_req->escclk_rate;
> +       s32 ui, ui_x7;
> +       s32 tmax, tmin;
> +       s32 coeff = 1000; /* Precision, should avoid overflow */
> +       s32 temp;
> +
> +       if (!bit_rate || !esc_rate)
> +               return -EINVAL;
> +
> +       ui = mult_frac(NSEC_PER_MSEC, coeff, bit_rate / 1000);
> +       ui_x7 = ui * 7;
> +
> +       temp = S_DIV_ROUND_UP(38 * coeff, ui_x7);
> +       tmin = max_t(s32, temp, 0);
> +       temp = (95 * coeff) / ui_x7;
> +       tmax = max_t(s32, temp, 0);
> +       timing->clk_prepare = linear_inter(tmax, tmin, 50, 0, false);
> +
> +       tmin = DIV_ROUND_UP(50 * coeff, ui_x7);
> +       tmax = 255;
> +       timing->hs_rqst = linear_inter(tmax, tmin, 1, 0, false);
> +
> +       tmin = DIV_ROUND_UP(100 * coeff, ui_x7) - 1;
> +       tmax = 255;
> +       timing->hs_exit = linear_inter(tmax, tmin, 10, 0, false);
> +
> +       tmin = 1;
> +       tmax = 32;
> +       timing->shared_timings.clk_post = linear_inter(tmax, tmin, 80, 0, false);
> +
> +       tmin = min_t(s32, 64, S_DIV_ROUND_UP(262 * coeff, ui_x7) - 1);
> +       tmax = 64;
> +       timing->shared_timings.clk_pre = linear_inter(tmax, tmin, 20, 0, false);
> +
> +       DBG("%d, %d, %d, %d, %d",
> +               timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
> +               timing->clk_prepare, timing->hs_exit, timing->hs_rqst);
> +
> +       return 0;
> +}
> +
>  static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
>  {
>         struct regulator_bulk_data *s = phy->supplies;
> @@ -657,6 +702,8 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>
>         phy->regulator_ldo_mode = of_property_read_bool(dev->of_node,
>                                 "qcom,dsi-phy-regulator-ldo-mode");
> +       phy->cphy_mode = of_property_read_bool(dev->of_node,
> +                               "qcom,dsi-phy-cphy-mode");
>
>         phy->base = msm_ioremap(pdev, "dsi_phy", "DSI_PHY");
>         if (IS_ERR(phy->base)) {
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 94a77ac364d3..432e9a9de52f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -95,6 +95,7 @@ struct msm_dsi_phy {
>
>         enum msm_dsi_phy_usecase usecase;
>         bool regulator_ldo_mode;
> +       bool cphy_mode;
>
>         struct clk_hw *vco_hw;
>         bool pll_on;
> @@ -115,5 +116,7 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
>                                 struct msm_dsi_phy_clk_request *clk_req);
>  int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
>                                 struct msm_dsi_phy_clk_request *clk_req);
> +int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
> +                               struct msm_dsi_phy_clk_request *clk_req);
>
>  #endif /* __DSI_PHY_H__ */
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e76ce40a12ab..40b791ea7bb9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -255,7 +255,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *confi
>                   (config->frac_div_start & 0x30000) >> 16);
>         dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
>         dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
> +       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, pll->phy->cphy_mode ? 0x00 : 0x10);
>         dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, config->pll_clock_inverters);
>  }
>
> @@ -640,7 +640,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>
>         /* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
>         hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
> -                                         CLK_SET_RATE_PARENT, 1, 8);
> +                                         CLK_SET_RATE_PARENT, 1,
> +                                         pll_7nm->phy->cphy_mode ? 7 : 8);
>         if (IS_ERR(hw)) {
>                 ret = PTR_ERR(hw);
>                 goto fail;
> @@ -661,32 +662,47 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>         snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
>         snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
>
> -       hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
> -                                         0, 1, 4);
> +       if (pll_7nm->phy->cphy_mode)
> +               hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 2, 7);
> +       else
> +               hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 1, 4);
>         if (IS_ERR(hw)) {
>                 ret = PTR_ERR(hw);
>                 goto fail;
>         }
>
> -       snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
> -       snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
> -       snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
> -       snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
> -       snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
> -
> -       hw = devm_clk_hw_register_mux(dev, clk_name,
> -                                ((const char *[]){
> -                                parent, parent2, parent3, parent4
> -                                }), 4, 0, pll_7nm->phy->base +
> -                                REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -                                0, 2, 0, NULL);
> -       if (IS_ERR(hw)) {
> -               ret = PTR_ERR(hw);
> -               goto fail;
> -       }
> +       /* in CPHY mode, pclk_mux will always have post_out_div as parent
> +        * don't register a pclk_mux clock and just use post_out_div instead
> +        */
> +       if (pll_7nm->phy->cphy_mode) {
> +               u32 data;
> +
> +               data = dsi_phy_read(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +               dsi_phy_write(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, data | 3);
> +
> +               snprintf(parent, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
> +       } else {
> +               snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
> +               snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
> +               snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
> +               snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
> +               snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
> +
> +               hw = devm_clk_hw_register_mux(dev, clk_name,
> +                                       ((const char *[]){
> +                                       parent, parent2, parent3, parent4
> +                                       }), 4, 0, pll_7nm->phy->base +
> +                                       REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> +                                       0, 2, 0, NULL);
> +               if (IS_ERR(hw)) {
> +                       ret = PTR_ERR(hw);
> +                       goto fail;
> +               }
> +
> +               snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
> +       }
>
>         snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->phy->id);
> -       snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
>
>         /* PIX CLK DIV : DIV_CTRL_7_4*/
>         hw = devm_clk_hw_register_divider(dev, clk_name, parent,
> @@ -811,15 +827,21 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>         struct msm_dsi_dphy_timing *timing = &phy->timing;
>         void __iomem *base = phy->base;
>         bool less_than_1500_mhz;
> -       u32 vreg_ctrl_0, glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
> +       u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
> +       u32 glbl_pemph_ctrl_0;
> +       u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
>         u32 glbl_rescode_top_ctrl, glbl_rescode_bot_ctrl;
>         u32 data;
>
>         DBG("");
>
> -       if (msm_dsi_dphy_timing_calc_v4(timing, clk_req)) {
> +       if (phy->cphy_mode)
> +               ret = msm_dsi_cphy_timing_calc_v4(timing, clk_req);
> +       else
> +               ret = msm_dsi_dphy_timing_calc_v4(timing, clk_req);
> +       if (ret) {
>                 DRM_DEV_ERROR(&phy->pdev->dev,
> -                       "%s: D-PHY timing calculation failed\n", __func__);
> +                       "%s: PHY timing calculation failed\n", __func__);
>                 return -EINVAL;
>         }
>
> @@ -840,6 +862,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>         /* Alter PHY configurations if data rate less than 1.5GHZ*/
>         less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
>
> +       /* For C-PHY, no low power settings for lower clk rate */
> +       if (phy->cphy_mode)
> +               less_than_1500_mhz = false;
> +
>         if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>                 vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>                 glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
> @@ -854,6 +880,17 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>                 glbl_rescode_bot_ctrl = 0x3c;
>         }
>
> +       if (phy->cphy_mode) {
> +               vreg_ctrl_0 = 0x51;
> +               vreg_ctrl_1 = 0x55;
> +               glbl_pemph_ctrl_0 = 0x11;
> +               lane_ctrl0 = 0x17;
> +       } else {
> +               vreg_ctrl_1 = 0x5c;
> +               glbl_pemph_ctrl_0 = 0x00;
> +               lane_ctrl0 = 0x1f;
> +       }
> +
>         /* de-assert digital and pll power down */
>         data = BIT(6) | BIT(5);
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
> @@ -874,15 +911,22 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CFG0, 0x21);
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CFG1, 0x84);
>
> +       if (phy->cphy_mode)
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_CTRL, BIT(6));
> +
>         /* Enable LDO */
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_0, vreg_ctrl_0);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_1, 0x5c);
> +       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_VREG_CTRL_1, vreg_ctrl_1);
> +
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_3, 0x00);
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_STR_SWI_CAL_SEL_CTRL,
>                       glbl_str_swi_cal_sel_ctrl);
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_HSTX_STR_CTRL_0,
>                       glbl_hstx_str_ctrl_0);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0, 0x00);
> +       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_0,
> +                     glbl_pemph_ctrl_0);
> +       if (phy->cphy_mode)
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_PEMPH_CTRL_1, 0x01);
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_TOP_CTRL,
>                       glbl_rescode_top_ctrl);
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_RESCODE_OFFSET_BOT_CTRL,
> @@ -892,10 +936,11 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>         /* Remove power down from all blocks */
>         dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, 0x7f);
>
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, 0x1f);
> +       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, lane_ctrl0);
>
>         /* Select full-rate mode */
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
> +       if (!phy->cphy_mode)
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
>
>         ret = dsi_7nm_set_usecase(phy);
>         if (ret) {
> @@ -905,22 +950,36 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>         }
>
>         /* DSI PHY timings */
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1, timing->clk_zero);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2, timing->clk_prepare);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3, timing->clk_trail);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5, timing->hs_zero);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->hs_prepare);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7, timing->hs_trail);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12,
> -                     timing->shared_timings.clk_pre);
> -       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13,
> -                     timing->shared_timings.clk_post);
> +       if (phy->cphy_mode) {
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5,
> +                       timing->shared_timings.clk_pre);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->clk_prepare);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7,
> +                       timing->shared_timings.clk_post);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
> +       } else {
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_0, 0x00);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_1, timing->clk_zero);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_2, timing->clk_prepare);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_3, timing->clk_trail);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_4, timing->hs_exit);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_5, timing->hs_zero);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_6, timing->hs_prepare);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_7, timing->hs_trail);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_8, timing->hs_rqst);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_9, 0x02);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_10, 0x04);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_11, 0x00);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_12,
> +                       timing->shared_timings.clk_pre);
> +               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_TIMING_CTRL_13,
> +                       timing->shared_timings.clk_post);
> +       }
>
>         /* DSI lane settings */
>         dsi_phy_hw_v4_0_lane_settings(phy);
> --
> 2.26.1
>


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
