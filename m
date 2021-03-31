Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D66350569
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 19:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5959C6EB2F;
	Wed, 31 Mar 2021 17:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C486EB2A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 17:27:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617211647; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4y96lfIJR5cX7xfxcTl5GFdTEijjLjbhSUKQ0NtyIfQ=;
 b=F4eMUBv0/sd+LLeGWF7JAZGoAHJoZeUqcK6zR5OBWWlcSbQ0KbuWahDdNDELNTlff+ddxYL3
 d3ds3Ku77J1+GwVypoBfF0HTPJzZOiJaPkIlFN2qCVCOBuI1f45LSmut0XDaBBXPAUM84KNr
 out3biLd5faH8SELUdX7+4x8Hz4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6064b0f32cc44d3aea12be70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 31 Mar 2021 17:27:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8DD86C43467; Wed, 31 Mar 2021 17:27:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 901A0C433CA;
 Wed, 31 Mar 2021 17:27:12 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 31 Mar 2021 10:27:12 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 17/24] drm/msm/dsi: make
 save_state/restore_state callbacks accept msm_dsi_phy
In-Reply-To: <20210331105735.3690009-18-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
 <20210331105735.3690009-18-dmitry.baryshkov@linaro.org>
Message-ID: <ffe1671260a766ef80750362d10a540e@codeaurora.org>
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
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-31 03:57, Dmitry Baryshkov wrote:
> Make save_state/restore callbacks accept struct msm_dsi_phy rather than
> struct msm_dsi_pll. This moves them to struct msm_dsi_phy_ops, allowing
> us to drop struct msm_dsi_pll_ops.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 12 +++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         | 11 +++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 24 ++++++-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 24 ++++++-------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 34 ++++++++-----------
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 18 +++++-----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 24 ++++++-------
>  7 files changed, 64 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index a1360e2dad3b..2c5ccead3baa 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -858,9 +858,9 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
> 
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
>  {
> -	if (phy->cfg->pll_ops.save_state) {
> -		phy->cfg->pll_ops.save_state(phy->pll);
> -		phy->pll->state_saved = true;
> +	if (phy->cfg->ops.save_pll_state) {
> +		phy->cfg->ops.save_pll_state(phy);
> +		phy->state_saved = true;
>  	}
>  }
> 
> @@ -868,12 +868,12 @@ int msm_dsi_phy_pll_restore_state(struct 
> msm_dsi_phy *phy)
>  {
>  	int ret;
> 
> -	if (phy->cfg->pll_ops.restore_state && phy->pll->state_saved) {
> -		ret = phy->cfg->pll_ops.restore_state(phy->pll);
> +	if (phy->cfg->ops.restore_pll_state && phy->state_saved) {
> +		ret = phy->cfg->ops.restore_pll_state(phy);
>  		if (ret)
>  			return ret;
> 
> -		phy->pll->state_saved = false;
> +		phy->state_saved = false;
>  	}
> 
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index b477d21804c8..0b51828c3146 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -17,7 +17,6 @@
>  struct msm_dsi_pll {
>  	struct clk_hw	clk_hw;
>  	bool		pll_on;
> -	bool		state_saved;
> 
>  	const struct msm_dsi_phy_cfg *cfg;
>  };
> @@ -29,17 +28,13 @@ struct msm_dsi_phy_ops {
>  	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
>  			struct msm_dsi_phy_clk_request *clk_req);
>  	void (*disable)(struct msm_dsi_phy *phy);
> -};
> -
> -struct msm_dsi_pll_ops {
> -	void (*save_state)(struct msm_dsi_pll *pll);
> -	int (*restore_state)(struct msm_dsi_pll *pll);
> +	void (*save_pll_state)(struct msm_dsi_phy *phy);
> +	int (*restore_pll_state)(struct msm_dsi_phy *phy);
>  };
> 
>  struct msm_dsi_phy_cfg {
>  	struct dsi_reg_config reg_cfg;
>  	struct msm_dsi_phy_ops ops;
> -	const struct msm_dsi_pll_ops pll_ops;
> 
>  	unsigned long	min_pll_rate;
>  	unsigned long	max_pll_rate;
> @@ -115,6 +110,8 @@ struct msm_dsi_phy {
>  	struct msm_dsi_pll *pll;
> 
>  	struct clk_hw_onecell_data *provided_clocks;
> +
> +	bool state_saved;
>  };
> 
>  /*
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 91ae0f8dbd88..fefff08f83fd 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -518,9 +518,9 @@ static const struct clk_ops 
> clk_ops_dsi_pll_10nm_vco = {
>   * PLL Callbacks
>   */
> 
> -static void dsi_pll_10nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_10nm_pll_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
>  	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
>  	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
>  	u32 cmn_clk_cfg0, cmn_clk_cfg1;
> @@ -541,9 +541,9 @@ static void dsi_pll_10nm_save_state(struct 
> msm_dsi_pll *pll)
>  	    cached->pix_clk_div, cached->pll_mux);
>  }
> 
> -static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_10nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(pll);
> +	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(phy->pll);
>  	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
>  	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
>  	u32 val;
> @@ -562,7 +562,9 @@ static int dsi_pll_10nm_restore_state(struct
> msm_dsi_pll *pll)
>  	val |= cached->pll_mux;
>  	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
> 
> -	ret = dsi_pll_10nm_vco_set_rate(&pll->clk_hw,
> pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
> +	ret = dsi_pll_10nm_vco_set_rate(&phy->pll->clk_hw,
> +			pll_10nm->vco_current_rate,
> +			pll_10nm->vco_ref_clk_rate);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_10nm->pdev->dev,
>  			"restore vco rate failed. ret=%d\n", ret);
> @@ -1005,10 +1007,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = 
> {
>  		.enable = dsi_10nm_phy_enable,
>  		.disable = dsi_10nm_phy_disable,
>  		.pll_init = dsi_pll_10nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_10nm_save_state,
> -		.restore_state = dsi_pll_10nm_restore_state,
> +		.save_pll_state = dsi_10nm_pll_save_state,
> +		.restore_pll_state = dsi_10nm_pll_restore_state,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
> @@ -1029,10 +1029,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_10nm_8998_cfgs = {
>  		.enable = dsi_10nm_phy_enable,
>  		.disable = dsi_10nm_phy_disable,
>  		.pll_init = dsi_pll_10nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_10nm_save_state,
> -		.restore_state = dsi_pll_10nm_restore_state,
> +		.save_pll_state = dsi_10nm_pll_save_state,
> +		.restore_pll_state = dsi_10nm_pll_restore_state,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 91c5bb2fd169..fb22c4b1b765 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -795,9 +795,9 @@ static const struct clk_ops 
> clk_ops_dsi_pll_14nm_postdiv = {
>   * PLL Callbacks
>   */
> 
> -static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_14nm_pll_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
>  	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
>  	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
>  	u32 data;
> @@ -810,18 +810,18 @@ static void dsi_pll_14nm_save_state(struct
> msm_dsi_pll *pll)
>  	DBG("DSI%d PLL save state %x %x", pll_14nm->id,
>  	    cached_state->n1postdiv, cached_state->n2postdiv);
> 
> -	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
> +	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
>  }
> 
> -static int dsi_pll_14nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_14nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(phy->pll);
>  	struct pll_14nm_cached_state *cached_state = &pll_14nm->cached_state;
>  	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
>  	u32 data;
>  	int ret;
> 
> -	ret = dsi_pll_14nm_vco_set_rate(&pll->clk_hw,
> +	ret = dsi_pll_14nm_vco_set_rate(&phy->pll->clk_hw,
>  					cached_state->vco_rate, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_14nm->pdev->dev,
> @@ -1166,10 +1166,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  		.enable = dsi_14nm_phy_enable,
>  		.disable = dsi_14nm_phy_disable,
>  		.pll_init = dsi_pll_14nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_14nm_save_state,
> -		.restore_state = dsi_pll_14nm_restore_state,
> +		.save_pll_state = dsi_14nm_pll_save_state,
> +		.restore_pll_state = dsi_14nm_pll_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> @@ -1190,10 +1188,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_14nm_660_cfgs = {
>  		.enable = dsi_14nm_phy_enable,
>  		.disable = dsi_14nm_phy_disable,
>  		.pll_init = dsi_pll_14nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_14nm_save_state,
> -		.restore_state = dsi_pll_14nm_restore_state,
> +		.save_pll_state = dsi_14nm_pll_save_state,
> +		.restore_pll_state = dsi_14nm_pll_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 20b31398b540..e589ec8f4cc8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -470,9 +470,9 @@ static const struct clk_ops 
> clk_ops_dsi_pll_28nm_vco_lp = {
>   * PLL Callbacks
>   */
> 
> -static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_28nm_pll_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
> 
> @@ -481,20 +481,20 @@ static void dsi_pll_28nm_save_state(struct
> msm_dsi_pll *pll)
>  	cached_state->postdiv1 =
>  			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
>  	cached_state->byte_mux = pll_read(base + 
> REG_DSI_28nm_PHY_PLL_VREG_CFG);
> -	if (dsi_pll_28nm_clk_is_enabled(&pll->clk_hw))
> -		cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
> +	if (dsi_pll_28nm_clk_is_enabled(&phy->pll->clk_hw))
> +		cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
>  	else
>  		cached_state->vco_rate = 0;
>  }
> 
> -static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
>  	int ret;
> 
> -	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
> +	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
>  					cached_state->vco_rate, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
> @@ -527,7 +527,7 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
> 
>  	DBG("%d", pll_28nm->id);
> 
> -	if (pll_28nm->base.cfg->type == MSM_DSI_PHY_28NM_LP)
> +	if (pll_28nm->base.cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
>  		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
>  	else
>  		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
> @@ -783,10 +783,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_28nm_save_state,
> -		.restore_state = dsi_pll_28nm_restore_state,
> +		.save_pll_state = dsi_28nm_pll_save_state,
> +		.restore_pll_state = dsi_28nm_pll_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> @@ -807,10 +805,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_28nm_save_state,
> -		.restore_state = dsi_pll_28nm_restore_state,
> +		.save_pll_state = dsi_28nm_pll_save_state,
> +		.restore_pll_state = dsi_28nm_pll_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> @@ -831,10 +827,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs 
> = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_28nm_save_state,
> -		.restore_state = dsi_pll_28nm_restore_state,
> +		.save_pll_state = dsi_28nm_pll_save_state,
> +		.restore_pll_state = dsi_28nm_pll_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 952444e3e8f0..1e35971b7132 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -334,9 +334,9 @@ static const struct clk_ops clk_bytediv_ops = {
>  /*
>   * PLL Callbacks
>   */
> -static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_28nm_pll_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
> 
> @@ -347,17 +347,17 @@ static void dsi_pll_28nm_save_state(struct
> msm_dsi_pll *pll)
>  	cached_state->postdiv1 =
>  			pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
> 
> -	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
> +	cached_state->vco_rate = clk_hw_get_rate(&phy->pll->clk_hw);
>  }
> 
> -static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(phy->pll);
>  	struct pll_28nm_cached_state *cached_state = &pll_28nm->cached_state;
>  	void __iomem *base = pll_28nm->mmio;
>  	int ret;
> 
> -	ret = dsi_pll_28nm_clk_set_rate(&pll->clk_hw,
> +	ret = dsi_pll_28nm_clk_set_rate(&phy->pll->clk_hw,
>  					cached_state->vco_rate, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
> @@ -662,10 +662,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_8960_cfgs = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
>  		.pll_init = dsi_pll_28nm_8960_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_28nm_save_state,
> -		.restore_state = dsi_pll_28nm_restore_state,
> +		.save_pll_state = dsi_28nm_pll_save_state,
> +		.restore_pll_state = dsi_28nm_pll_restore_state,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 321d23b3ed18..8ac57f907ed3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -543,9 +543,9 @@ static const struct clk_ops clk_ops_dsi_pll_7nm_vco 
> = {
>   * PLL Callbacks
>   */
> 
> -static void dsi_pll_7nm_save_state(struct msm_dsi_pll *pll)
> +static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
>  	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
>  	u32 cmn_clk_cfg0, cmn_clk_cfg1;
> @@ -566,9 +566,9 @@ static void dsi_pll_7nm_save_state(struct 
> msm_dsi_pll *pll)
>  	    cached->pix_clk_div, cached->pll_mux);
>  }
> 
> -static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
> +static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
> -	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->pll);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
>  	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
>  	u32 val;
> @@ -587,7 +587,9 @@ static int dsi_pll_7nm_restore_state(struct
> msm_dsi_pll *pll)
>  	val |= cached->pll_mux;
>  	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
> 
> -	ret = dsi_pll_7nm_vco_set_rate(&pll->clk_hw,
> pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
> +	ret = dsi_pll_7nm_vco_set_rate(&phy->pll->clk_hw,
> +			pll_7nm->vco_current_rate,
> +			pll_7nm->vco_ref_clk_rate);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
>  			"restore vco rate failed. ret=%d\n", ret);
> @@ -1038,10 +1040,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = 
> {
>  		.enable = dsi_7nm_phy_enable,
>  		.disable = dsi_7nm_phy_disable,
>  		.pll_init = dsi_pll_7nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_7nm_save_state,
> -		.restore_state = dsi_pll_7nm_restore_state,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
>  	},
>  	.min_pll_rate = 600000000UL,
>  	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
> ULONG_MAX,
> @@ -1063,10 +1063,8 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_7nm_8150_cfgs = {
>  		.enable = dsi_7nm_phy_enable,
>  		.disable = dsi_7nm_phy_disable,
>  		.pll_init = dsi_pll_7nm_init,
> -	},
> -	.pll_ops = {
> -		.save_state = dsi_pll_7nm_save_state,
> -		.restore_state = dsi_pll_7nm_restore_state,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
>  	},
>  	.min_pll_rate = 1000000000UL,
>  	.max_pll_rate = 3500000000UL,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
