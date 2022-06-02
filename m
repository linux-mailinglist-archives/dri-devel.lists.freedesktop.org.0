Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8053B63A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 11:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9977112C82;
	Thu,  2 Jun 2022 09:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339D6112C93
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 09:41:17 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id x20so2988098qtp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 02:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q+5xmN8tzm4yfZseavat68OsiHtVqwxHHx8/RWeyc+4=;
 b=g0FMJG+CJWzxQ5nHrXe6/IcFNv1QQs8i2qNUAocTxh5OX58wvzXMJ66dnGMAlRLpB5
 aWjYNri1hmi3o3bj1PgspYA6sDZBS49thfudipYais5J1/tdV/QawL1XzHnxzrQU/M+h
 TgC3OYe9zcocd0Eba6wCl3EIrcfi+ntuiSp8UYKc8QCyalionqGZcQvWwj09RqogwBKM
 QyhVCM4hyDTjmyuFt5eNwPUz96Lqmj+GiWrHT7GTTkL8E+cDPPxCnlVXrkhkkNkM5HiY
 ypkePhGbUzZPn2HeNzdnEu8EvBUv3HVYkqEpSeVcHnqszhF2qKP3wOMSSWSszrJrhnaL
 oCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+5xmN8tzm4yfZseavat68OsiHtVqwxHHx8/RWeyc+4=;
 b=jZyuxOh60RMKW2AI1QzZtd+b397JslBoC8VP4cD+7AGlAuQCjlWIa5ob7xThtkvtrF
 dqJm/0AG2ly8OYoWC1V5V3hs5JohgjyKl01ykbOUspqEMvrCpWNY/fCxMmeVZBdVTgWT
 JD3QGYUD2e7wvBuE/JvufnIDagV0K2T+0PnpfbNnHQJQIYhyInc4OQZG0W+E2w6xS5en
 uwz3yMfI3hSaqTFtfiaq0IgdPjmq0DpHlfOHW0zVDgCPJtlCI3tDWjU/N6TGIvfXCe7f
 o3znZRoA6+3fde4kysdM6zE3xf70tl/OMpHq7kivnFHYNFJEnq9BwQh2ijxvcZlDgdVd
 ItwQ==
X-Gm-Message-State: AOAM532q0P84L5a05umcTlUxcHzJ+TDaIgPnxSxqrA6YnMwFpnvsxSoz
 0jMexbkWDQv2fVKrmgwNJAhbQfkFK0M4nQnXObvMUQ==
X-Google-Smtp-Source: ABdhPJxyp4E9mIUELRAt3hKeewDZbymPZsMNra1fPCs5mzn7g3YgRgnluzUeI8h1VpPsbMbpq9HzviknH+LI+0U/M3Q=
X-Received: by 2002:ac8:5e54:0:b0:2f3:f4ee:efbd with SMTP id
 i20-20020ac85e54000000b002f3f4eeefbdmr2805119qtx.295.1654162876084; Thu, 02
 Jun 2022 02:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
 <20220601220747.1145095-9-marijn.suijten@somainline.org>
In-Reply-To: <20220601220747.1145095-9-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Jun 2022 12:41:04 +0300
Message-ID: <CAA8EJpovxL1sUO9k0K_UzXxKdCBbt5QcRR_9K4H=GBtK4SwdXA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] drm/msm/dsi_phy_28nm: Replace parent names with
 clk_hw pointers
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Jun 2022 at 01:08, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> parent_hw pointers are easier to manage and cheaper to use than
> repeatedly formatting the parent name and subsequently leaving the clk
> framework to perform lookups based on that name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 50 ++++++++++------------
>  1 file changed, 23 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 7d3cabeca743..04411fefb808 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -519,17 +519,17 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
>
>  static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
>  {
> -       char clk_name[32], parent1[32], parent2[32], vco_name[32];
> +       char clk_name[32];
>         struct clk_init_data vco_init = {
>                 .parent_data = &(const struct clk_parent_data) {
>                         .fw_name = "ref", .name = "xo",
>                 },
>                 .num_parents = 1,
> -               .name = vco_name,
> +               .name = clk_name,
>                 .flags = CLK_IGNORE_UNUSED,
>         };
>         struct device *dev = &pll_28nm->phy->pdev->dev;
> -       struct clk_hw *hw;
> +       struct clk_hw *hw, *analog_postdiv, *indirect_path_div2, *byte_mux;
>         int ret;
>
>         DBG("%d", pll_28nm->phy->id);
> @@ -539,32 +539,30 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>         else
>                 vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
>
> -       snprintf(vco_name, sizeof(vco_name), "dsi%dvco_clk", pll_28nm->phy->id);
> +       snprintf(clk_name, sizeof(clk_name), "dsi%dvco_clk", pll_28nm->phy->id);
>         pll_28nm->clk_hw.init = &vco_init;
>         ret = devm_clk_hw_register(dev, &pll_28nm->clk_hw);
>         if (ret)
>                 return ret;
>
>         snprintf(clk_name, sizeof(clk_name), "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
> -       snprintf(parent1, sizeof(parent1), "dsi%dvco_clk", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_divider(dev, clk_name, parent1,
> -                       CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
> +       analog_postdiv = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
> +                       &pll_28nm->clk_hw, CLK_SET_RATE_PARENT,
> +                       pll_28nm->phy->pll_base +
>                                 REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
>                         0, 4, 0, NULL);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +       if (IS_ERR(analog_postdiv))
> +               return PTR_ERR(analog_postdiv);
>
>         snprintf(clk_name, sizeof(clk_name), "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
> -       snprintf(parent1, sizeof(parent1), "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent1,
> -                       CLK_SET_RATE_PARENT, 1, 2);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +       indirect_path_div2 = devm_clk_hw_register_fixed_factor_parent_hw(dev,
> +                       clk_name, analog_postdiv, CLK_SET_RATE_PARENT, 1, 2);
> +       if (IS_ERR(indirect_path_div2))
> +               return PTR_ERR(indirect_path_div2);
>
>         snprintf(clk_name, sizeof(clk_name), "dsi%dpll", pll_28nm->phy->id);
> -       snprintf(parent1, sizeof(parent1), "dsi%dvco_clk", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_divider(dev, clk_name, parent1, 0,
> -                       pll_28nm->phy->pll_base +
> +       hw = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
> +                       &pll_28nm->clk_hw, 0, pll_28nm->phy->pll_base +
>                                 REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
>                         0, 8, 0, NULL);
>         if (IS_ERR(hw))
> @@ -572,20 +570,18 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>         provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
>
>         snprintf(clk_name, sizeof(clk_name), "dsi%dbyte_mux", pll_28nm->phy->id);
> -       snprintf(parent1, sizeof(parent1), "dsi%dvco_clk", pll_28nm->phy->id);
> -       snprintf(parent2, sizeof(parent2), "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_mux(dev, clk_name,
> -                       ((const char *[]){
> -                               parent1, parent2,
> +       byte_mux = devm_clk_hw_register_mux_parent_hws(dev, clk_name,
> +                       ((const struct clk_hw *[]){
> +                               &pll_28nm->clk_hw,
> +                               indirect_path_div2,
>                         }), 2, CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
>                                 REG_DSI_28nm_PHY_PLL_VREG_CFG, 1, 1, 0, NULL);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +       if (IS_ERR(byte_mux))
> +               return PTR_ERR(byte_mux);
>
>         snprintf(clk_name, sizeof(clk_name), "dsi%dpllbyte", pll_28nm->phy->id);
> -       snprintf(parent1, sizeof(parent1), "dsi%dbyte_mux", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent1,
> -                       CLK_SET_RATE_PARENT, 1, 4);
> +       hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
> +                       byte_mux, CLK_SET_RATE_PARENT, 1, 4);
>         if (IS_ERR(hw))
>                 return PTR_ERR(hw);
>         provided_clocks[DSI_BYTE_PLL_CLK] = hw;
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
