Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5949B4137D6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 18:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF0389E38;
	Tue, 21 Sep 2021 16:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85D989E38
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:51:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632243098; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yYnH5G8EL6aJ087DvAF6xGKWgeQIW2UcOlEh2Sq5TFY=;
 b=Ua7wXYCWp+Vk7fzqDtl9w0icjn6SLNbjIdVYOj4bTtZXiXH6LnMIOtIYSaR5UdH1nCv5BYoM
 1ImNXsNCCqM9xaVeGouG5toER2k8NAGPgHB+JN5OC8CVx7akhDol9XrTqOKZSLS2O8P6RKTn
 DgrkTpkJZbvmR/lJVaMjJORA61Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 614a0d90b585cc7d24c6c3ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 16:51:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E9499C4361A; Tue, 21 Sep 2021 16:51:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0555CC4338F;
 Tue, 21 Sep 2021 16:51:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 21 Sep 2021 09:51:26 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi/phy: fix clock names in 28nm_8960
 phy
In-Reply-To: <20210921162245.1858118-1-dmitry.baryshkov@linaro.org>
References: <20210921162245.1858118-1-dmitry.baryshkov@linaro.org>
Message-ID: <1499dd56e79e60c0548647cc9f4b760f@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-09-21 09:22, Dmitry Baryshkov wrote:
> The commit 9f91f22aafcd ("drm/msm/dsi: remove duplicate fields from
> dsi_pll_Nnm instances") mistakenly changed registered clock names. 
> While
> the platform is in progress of migration to using clock properties in
> the dts rather than the global clock names, we should provide backwards
> compatibility. Thus restore registerd global clock names.
> 
> Fixes: 9f91f22aafcd ("drm/msm/dsi: remove duplicate fields from
> dsi_pll_Nnm instances")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index aaa37456f4ee..71ed4aa0dc67 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -428,7 +428,7 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  	bytediv->reg = pll_28nm->phy->pll_base + 
> REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
> 
>  	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
> -	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
> +	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id + 1);
> 
>  	bytediv_init.name = clk_name;
>  	bytediv_init.ops = &clk_bytediv_ops;
> @@ -442,7 +442,7 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  		return ret;
>  	provided_clocks[DSI_BYTE_PLL_CLK] = &bytediv->hw;
> 
> -	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
> +	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id + 1);
>  	/* DIV3 */
>  	hw = devm_clk_hw_register_divider(dev, clk_name,
>  				parent_name, 0, pll_28nm->phy->pll_base +
