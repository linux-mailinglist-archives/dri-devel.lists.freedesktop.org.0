Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C310C51787D
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 22:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9610EB79;
	Mon,  2 May 2022 20:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6DF10EED5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 20:47:53 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id r8so16394116oib.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=TBXtHVCDgkha/h8EfsB/475w9tiwkpoYNEwBRkAE28Q=;
 b=nlwo0h4uJ3b9sJudkA4OAqMVOoDVvYkR7QwkYtkpoxqAfflehecyGBcje5DXj3uDvn
 l5czy/KAeS6W1newa/ZkeMvseIB6+8VOK2MFZbySZyoia8d4VI5D18CIKZLV5edA0lIp
 vyP1NUNeTVfaqy4I6z8iUxqG9yEe0tX3ECR88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=TBXtHVCDgkha/h8EfsB/475w9tiwkpoYNEwBRkAE28Q=;
 b=SU86qQwqY+kqQg5buirI1GfwiMhcudSwP8LIKRYiIm4wpWtHZ3SpD2wj8HI2VFSpY7
 qWuoB24O29HsHPkXR2oV3z3dgvT7JGeqPZtpANcRW6mFniFjwOxt2Z1QgLqDH/8jFSB0
 Ugkb/Fvz5Ig02V+aiWrAtqrTEOA0vY1zHdnNWIFLDB/gx2HSQuNzXpXmidtGFGjVbRSF
 gJuTJ3dWxIH2MKZrxnajq2TpS7qWmgkbzbdb/ZmNmO5i8iGtPxL4r0dljf7Ng0wzTXU/
 FWjHoJ42UAnT93wh1eZFQE4WDLTTSOXZqUCKMmcGssBcQcZXXWDC6UJ8ZNC/u/I0X1vT
 XfOA==
X-Gm-Message-State: AOAM532YPDlzb7hzB0ReCW6oDPttEuqfvtqYS/1YYAJqGn3+odavpR7P
 QglFNK4KJ2CIFkPUXXFzVAw3XXCWiGqtBZeopSPACJ2KSLI=
X-Google-Smtp-Source: ABdhPJwJZV4OIei+weQ172CpfVAhfT8STbQ4S9q4PIxCXEbnTrZydvgCzRN89/H2aDd28y5efxt2iRIr5LHChV0JNLc=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr469774oif.63.1651524472308; Mon, 02 May
 2022 13:47:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 13:47:51 -0700
MIME-Version: 1.0
In-Reply-To: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
References: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 May 2022 13:47:51 -0700
Message-ID: <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: pll_7nm: remove unsupported dividers for DSI
 pixel clock
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-05-01 12:56:20)
> Remove dividers that are not recommended for DSI DPHY mode when setting

Is "DPHY" intentional or just "PHY" should be here?

> up the clock tree for the DSI pixel clock.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 6e506feb111f..66ed1919a1db 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>                 snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
>                 snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
>                 snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
> -               snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
> -               snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
>
>                 hw = devm_clk_hw_register_mux(dev, clk_name,
>                                         ((const char *[]){
> -                                       parent, parent2, parent3, parent4
> -                                       }), 4, 0, pll_7nm->phy->base +
> +                                       parent, parent2,
> +                                       }), 2, 0, pll_7nm->phy->base +
>                                         REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -                                       0, 2, 0, NULL);
> +                                       0, 1, 0, NULL);

Can you followup with a patch to move to clk_parent_data instead of
strings?
