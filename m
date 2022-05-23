Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB3531EC1
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 00:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4B010ED66;
	Mon, 23 May 2022 22:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FD010ED66
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 22:45:41 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id w17so699471qtk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 15:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nopxt4XwsFRcjRroEc1RpomTVU9NSywZXrOA9daUnOA=;
 b=o0zCSPCGjVwpCsbTDL8/HcIaeqS8fYCO4SL570ZBv9w78NFCvfRuSAAw6rMbj5cqQO
 Nh1J9vi7v8MDYmGaNBJo0mjvOmzaVF88daDfNDjXbuqckC//C6SgYs2eyiZfI01fQMGV
 jC1QmRuLQkcDb+291niZCSZqNmyOEryfkkCZLQkswVkH/Qp7J1a5c7XAsuYRQn55myFq
 f//oxnuGT6Oox/KRkOPchhD3n8WFJmdlTdmHsY0WMQqVJz7qoH+QsLyVkBHZP9FLSXGd
 L5MBPAsKUo7NDrEOvt/iknFwpb4MvF4vBF/G54drN0u4j4j3UnZIGF+/GaWjS/y1AStK
 iLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nopxt4XwsFRcjRroEc1RpomTVU9NSywZXrOA9daUnOA=;
 b=suU3vxTvB9ukwCBlNTzscww3AzSF7XROspazDg4bJCFmG9ZHoFBIYiFCr2I5YrdVL7
 owPTMT75VYosDBTwaFxQU6FtgUdTc6SG/+y4FW/uWbuNQFs4999zw0eUFGvPom2RfBtq
 skA12PkBWQBbzRqYegbRSXlobXOntIaqqroXL/e2T3cwtZVqqmo54tzZoj1KXi3+Aw7u
 ER9zfNEl+p0zMjNGp1lN1Oo0IlJwkAnXFWzDL840eJ3Ch+1by2eIk3eTx9c6QWB/l1nV
 r8W3a9jMfXeAXinkJfPP4+lG57uNJhr2v1BBOS74Jhar3SQ2CDOEXpt70Rijbx0Av4g4
 rrhg==
X-Gm-Message-State: AOAM532qZYFcfjJjsXriWjsQgJasNOUez8CHP/va3Ryay/kgq6UkjtjK
 oACInownCweA/hix5iJB7+9ssmPcCjYLXuX+8NaCjA==
X-Google-Smtp-Source: ABdhPJxviAgpH40GcN8RqQXsVDkwFlmeEiohAphnoVRJGd8mfAwe+K5VvwHS3Qg4VCOkTu1PQXrEEcD2nTGC84T5HCs=
X-Received: by 2002:ac8:5e54:0:b0:2f3:f4ee:efbd with SMTP id
 i20-20020ac85e54000000b002f3f4eeefbdmr17736764qtx.295.1653345940458; Mon, 23
 May 2022 15:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-7-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-7-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 01:45:29 +0300
Message-ID: <CAA8EJpqhqtc1A0SJqAhOveZcdsBEjPNZLpR3tTM2L3+p3QtiWA@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dsi_phy_28nm_8960: Use stack memory for
 temporary clock names
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
> The clock names formatted into the hw_clk's init structure are only used
> for the duration of the registration function where they are kstrdup'ed,
> making it unnecessary to keep the allocations alive for the duration of
> the device (through devm).
>
> Just like the other DSI PHY PLL clock trees, use a stack-local char
> array and save on memory outside of the pll_28nm_register function.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: we can use clk_name instead of vco_name too.

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 943a7e847c90..554978fc434d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -383,7 +383,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
>
>  static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
>  {
> -       char *clk_name, *vco_name;
> +       char clk_name[32], vco_name[32];
>         struct clk_init_data vco_init = {
>                 .parent_data = &(const struct clk_parent_data) {
>                         .fw_name = "ref",
> @@ -404,14 +404,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>         if (!bytediv)
>                 return -ENOMEM;
>
> -       vco_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> -       if (!vco_name)
> -               return -ENOMEM;
> -
> -       clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> -       if (!clk_name)
> -               return -ENOMEM;
> -
>         snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
>         vco_init.name = vco_name;
>
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
