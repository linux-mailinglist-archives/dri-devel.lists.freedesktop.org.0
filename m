Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18C434DCB6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 02:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801166E59F;
	Tue, 30 Mar 2021 00:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B626E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 00:01:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617062499; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jVBSUgu+pFEDHXWSRsZb2UnG++J0IAwLqxbV86v1OcY=;
 b=CWf9/IlaiDLUlF5np+Zi1BfDndId7hb2NHQqvrc529YnekpB93exwoiV8MVPHGnWvkd55IpL
 WRtK6mHyRlyL6bEejpbQ12MIWYOU7Yl4WXlezB09+vDTDYUuRfmcTeEQbsnHi+Wgf/g2XRU4
 WRudpzA2Np6r/zxWidjEMa5gYJ0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60626a4987ce1fbb5675107f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 00:01:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9B84AC433C6; Tue, 30 Mar 2021 00:01:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FFACC433ED;
 Tue, 30 Mar 2021 00:01:11 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 29 Mar 2021 17:01:11 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 15/25] drm/msm/dsi: drop vco_delay setting
 from 7nm, 10nm, 14nm drivers
In-Reply-To: <20210327110305.3289784-16-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-16-dmitry.baryshkov@linaro.org>
Message-ID: <d09bbd7d79f8d99fc906e22be56d8d0f@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> These drivers do not use vco_delay variable, so drop it from all of
> them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 3 ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 ----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 3 ---
>  3 files changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index e0df12a841b2..bfb96d87d1d7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -99,7 +99,6 @@ struct dsi_pll_10nm {
>  	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
>  	spinlock_t postdiv_lock;
> 
> -	int vco_delay;
>  	struct dsi_pll_config pll_configuration;
>  	struct dsi_pll_regs reg_setup;
> 
> @@ -771,8 +770,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy 
> *phy)
>  	pll = &pll_10nm->base;
>  	pll->cfg = phy->cfg;
> 
> -	pll_10nm->vco_delay = 1;
> -
>  	ret = pll_10nm_register(pll_10nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 7fe7c8348b42..434d02ffa7fe 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -122,8 +122,6 @@ struct dsi_pll_14nm {
>  	void __iomem *phy_cmn_mmio;
>  	void __iomem *mmio;
> 
> -	int vco_delay;
> -
>  	struct dsi_pll_input in;
>  	struct dsi_pll_output out;
> 
> @@ -1012,8 +1010,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy 
> *phy)
>  	pll = &pll_14nm->base;
>  	pll->cfg = phy->cfg;
> 
> -	pll_14nm->vco_delay = 1;
> -
>  	ret = pll_14nm_register(pll_14nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e6c8040e1bd3..f760904efac9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -99,7 +99,6 @@ struct dsi_pll_7nm {
>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
>  	spinlock_t postdiv_lock;
> 
> -	int vco_delay;
>  	struct dsi_pll_config pll_configuration;
>  	struct dsi_pll_regs reg_setup;
> 
> @@ -796,8 +795,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
>  	pll = &pll_7nm->base;
>  	pll->cfg = phy->cfg;
> 
> -	pll_7nm->vco_delay = 1;
> -
>  	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
