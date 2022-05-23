Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F38531E9D
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 00:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C0C10E577;
	Mon, 23 May 2022 22:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543CD10E909
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 22:34:31 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id l82so9189461qke.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 15:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HQ0pqMkGPO55UZVFteq/t7UQsL7DsWYAaeh+h0/4AHw=;
 b=Elmb2wuJeIQwOwyoYtoXj7BMSqe1Ie8BhMSfyh7oszPuVrwBsMgj+6CDb4Og1WmnoC
 yzCf/MLIHHgn/Pz7iiqxLv3R4bE+fIiEEWspknnAEwYJjZCm98MVTVRUI7tmwaVW5Di9
 rFVAyxuXvCOU+QdvbjKPWisSl0ds/fgP3xFm8H3zMzUQhGyqwFPBpybsSkuPOBoIr0a6
 vjG+HxijuuXo61DoNWYo2Hr2ZnF0GwEK5JrWPS08r9bGmBDUKLoj8L+aPLujis4pA2db
 6cQ9JUfalXO06Or3s8GRa7C8474FrG9EPSYgnZBfAGap5G9vIVYoa/uWBJAo2g3h7bIk
 IRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQ0pqMkGPO55UZVFteq/t7UQsL7DsWYAaeh+h0/4AHw=;
 b=GlTVif5wUTnyh9w+7EMmGkGoRIR3WLXuV3hkagqAAKtm2Csr5pIp1LVLtZM4Irbcub
 4+zsdvmjNuSJyDmEK5J5wg97WvZZTyDePLoebuFlves08rRMHUV7bsL+K/QuBr/lZG7G
 yGrBVQk8gqV1a4tiGgTR/Sxflhz3qdy8W4LzNW/GuUUeqQ/iH+/N2ZKjXcGuUghzl7vt
 M+gvcFyLAz04xffsiJ/04NqQwbJS1PW5WhHd0yXWAm32Cx87xowneVvFH9u1UDUndNsM
 SDB3AEIoc2wdPUk3HhESUXKR1Rb27Yn1Kc3J9XMjC0Lvs9Yd+rbZV2RXN2l3AOde3JGW
 qHWg==
X-Gm-Message-State: AOAM5319W2RWRjKJZ3tFxN+ywsGBxVtDj9YPvxQuHMmPHCGD/88YFOJ8
 I1VpUAq97XV+9rz6htAalkhXfo4NP5aFK6Zyhr+Oyg==
X-Google-Smtp-Source: ABdhPJzgyd8M6po0gCsUtNfX7wRhP9f0kou7QpoyTW7nIY6wdzgcbzEl3gTil8T/z7vmEVnCVWL5Hvi0+mDVLNLoPMY=
X-Received: by 2002:a37:6883:0:b0:6a3:42ae:e17b with SMTP id
 d125-20020a376883000000b006a342aee17bmr13039864qkc.59.1653345269240; Mon, 23
 May 2022 15:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-5-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-5-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 01:34:18 +0300
Message-ID: <CAA8EJpqcN=UdqVnuShetYY45f2QV8w5nk_vKW47B7oS74O38yQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/msm/dsi_phy_28nm: Replace parent names with
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

On Tue, 24 May 2022 at 00:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> parent_hw pointers are easier to manage and cheaper to use than
> repeatedly formatting the parent name and subsequently leaving the clk
> framework to perform lookups based on that name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>



> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 52 +++++++++-------------
>  1 file changed, 22 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 48eab80b548e..6926c8ff6255 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -519,7 +519,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
>
>  static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
>  {
> -       char clk_name[32], parent1[32], parent2[32], vco_name[32];
> +       char clk_name[32], vco_name[32];

While we are at it, we might also get rid of vco_name and use clk_name
everywhere.

>         struct clk_init_data vco_init = {
>                 .parent_data = &(const struct clk_parent_data) {
>                         .fw_name = "ref", .name = "xo",
> @@ -529,7 +529,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>                 .flags = CLK_IGNORE_UNUSED,
>         };
>         struct device *dev = &pll_28nm->phy->pdev->dev;
> -       struct clk_hw *hw;
> +       struct clk_hw *hw, *analog_postdiv, *indirect_path_div2, *byte_mux;
>         int ret;
>
>         DBG("%d", pll_28nm->phy->id);
> @@ -546,48 +546,40 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>                 return ret;
>
>         snprintf(clk_name, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
> -       snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_divider(dev, clk_name,
> -                       parent1, CLK_SET_RATE_PARENT,
> +       analog_postdiv = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
> +                       &pll_28nm->clk_hw, CLK_SET_RATE_PARENT,
>                         pll_28nm->phy->pll_base +
> -                       REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG,
> -                       0, 4, 0, NULL);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +                       REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG, 0, 4, 0, NULL);

The diff is already hard enough to read. Could you please drop
syntax/whitespace/newline changes?

> +       if (IS_ERR(analog_postdiv))
> +               return PTR_ERR(analog_postdiv);
>
>         snprintf(clk_name, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
> -       snprintf(parent1, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
> -                       parent1, CLK_SET_RATE_PARENT,
> -                       1, 2);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +       indirect_path_div2 = devm_clk_hw_register_fixed_factor_parent_hw(dev,
> +                       clk_name, analog_postdiv, CLK_SET_RATE_PARENT, 1, 2);
> +       if (IS_ERR(indirect_path_div2))
> +               return PTR_ERR(indirect_path_div2);
>
>         snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
> -       snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_divider(dev, clk_name,
> -                               parent1, 0, pll_28nm->phy->pll_base +
> -                               REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
> -                               0, 8, 0, NULL);
> +       hw = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
> +                       &pll_28nm->clk_hw, 0, pll_28nm->phy->pll_base +
> +                       REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG, 0, 8, 0, NULL);
>         if (IS_ERR(hw))
>                 return PTR_ERR(hw);
>         provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
>
>         snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
> -       snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
> -       snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_mux(dev, clk_name,
> -                       ((const char *[]){
> -                               parent1, parent2
> +       byte_mux = devm_clk_hw_register_mux_parent_hws(dev, clk_name,
> +                       ((const struct clk_hw *[]){
> +                               &pll_28nm->clk_hw,
> +                               indirect_path_div2,
>                         }), 2, CLK_SET_RATE_PARENT, pll_28nm->phy->pll_base +
>                         REG_DSI_28nm_PHY_PLL_VREG_CFG, 1, 1, 0, NULL);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +       if (IS_ERR(byte_mux))
> +               return PTR_ERR(byte_mux);
>
>         snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
> -       snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
> -       hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
> -                               parent1, CLK_SET_RATE_PARENT, 1, 4);
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
