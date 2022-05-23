Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80BA531EB7
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 00:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D6410F597;
	Mon, 23 May 2022 22:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41BC10F31B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 22:44:20 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id v6so10609122qtx.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BMvYc5cVRi/7P7VqCcz6wkYkjkr+Z5yusPcVVwCNKu8=;
 b=fMix2ntTRVTtJnqBs7qMwFVLcxCsxu9pcBi+MZBc2cOnP1/pNBFG2awmR5pZp1XyR+
 db0opIiyTUz2rCd/AhfWOA7CtwAmfTF4bPG8MmEaymcT3Wtda9M+fYwZ0TpiEtx1OvwC
 YPXa0mWOEjgvZmgIuw4LDBAAUoNg4ADRbCJUBN7fGmDSEkg07UpjuE6Lk85JoR9wmtT1
 o9VFliz9vJ/hdI4LBtRuG0zkIXLI1tPYFXTg6+Ws0ddc2gMa2KRQz8y1ReVk5maCy/Pl
 2hQoPjiQ6y1rQoU7ZyHEFH0lKWNqEkLYlJwIRuV1jpiNiH/yJ2jeKUhizIgqMUFvqmtk
 YB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BMvYc5cVRi/7P7VqCcz6wkYkjkr+Z5yusPcVVwCNKu8=;
 b=at2/tZoNTV/nx2nZEZSbczt3OkL+LFMDW293bScssrJv2urQv8QwKT8f2+4EXdhT7G
 +7SVkRY5bk9a3Je1yCISfdDyAC0l1V/5+VXdsLj5p56Smr5WZ4NpxrfTc44s2UA1J7pC
 jbZ73lIgThYyeqlOSl0+96tcfbn7yqq+Qd0o8er3k2Y13Fp+F4SWaj7wesYb6zNz6n6C
 5/oxc1fh/XKghnb5Kr2sYKL7cVftAaOwnGrjUSl9xg1edR6+al0KcnnTv39a6F3Zunpu
 QBV8LU+/Fd5+bsSju9DA3cGNuXT7za8UEVdBuYh1L9zWKfrQtjRICAzJKbiJFiafzjOo
 VVhQ==
X-Gm-Message-State: AOAM53170QqtAATq2m/U2Q0Iw1Vac7DwNjSpQxd+eT2/2/GLv4Gj3VnI
 gqNAqpOGpncfogA2dB1J7nsbt7hDtkyPBlhvo+Un8g==
X-Google-Smtp-Source: ABdhPJzFO/4zafP3v1e6529SONTTFHEAZD4hPZ20zILccqfJCGhFe7ekBZASZWLj8O+KiuFhkOaPvlPHIfBEUUO/fS0=
X-Received: by 2002:a05:622a:13c8:b0:2f9:1cb4:9079 with SMTP id
 p8-20020a05622a13c800b002f91cb49079mr13032611qtk.629.1653345859783; Mon, 23
 May 2022 15:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-6-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-6-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 01:44:08 +0300
Message-ID: <CAA8EJprN833M+KOZXOyuaL_KqzEV61P69VXw7mfWo5OiXjE2FA@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/msm/dsi_phy_28nm_8960: Replace parent names with
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

Can you please add a followup patch (or a preface one) removing the
rest of devm_kzalloc()'ed clock names.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c    | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index fc56cdcc9ad6..943a7e847c90 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -383,7 +383,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
>
>  static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
>  {
> -       char *clk_name, *parent_name, *vco_name;
> +       char *clk_name, *vco_name;
>         struct clk_init_data vco_init = {
>                 .parent_data = &(const struct clk_parent_data) {
>                         .fw_name = "ref",
> @@ -408,10 +408,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>         if (!vco_name)
>                 return -ENOMEM;
>
> -       parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> -       if (!parent_name)
> -               return -ENOMEM;
> -
>         clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
>         if (!clk_name)
>                 return -ENOMEM;
> @@ -429,13 +425,14 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>         bytediv->hw.init = &bytediv_init;
>         bytediv->reg = pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
>
> -       snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
>         snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id + 1);
>
>         bytediv_init.name = clk_name;
>         bytediv_init.ops = &clk_bytediv_ops;
>         bytediv_init.flags = CLK_SET_RATE_PARENT;
> -       bytediv_init.parent_names = (const char * const *) &parent_name;
> +       bytediv_init.parent_hws = (const struct clk_hw*[]){
> +               &pll_28nm->clk_hw,
> +       };
>         bytediv_init.num_parents = 1;

I wonder if we can express the bytediv clock with the standard ops.
However it's definitely a separate topic.

>
>         /* DIV2 */
> @@ -446,10 +443,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>
>         snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id + 1);
>         /* DIV3 */
> -       hw = devm_clk_hw_register_divider(dev, clk_name,
> -                               parent_name, 0, pll_28nm->phy->pll_base +
> -                               REG_DSI_28nm_8960_PHY_PLL_CTRL_10,
> -                               0, 8, 0, NULL);
> +       hw = devm_clk_hw_register_divider_parent_hw(dev, clk_name,
> +                       &pll_28nm->clk_hw, 0, pll_28nm->phy->pll_base +
> +                       REG_DSI_28nm_8960_PHY_PLL_CTRL_10, 0, 8, 0, NULL);

Again, could you please keep the linebreak in place?


>         if (IS_ERR(hw))
>                 return PTR_ERR(hw);
>         provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
