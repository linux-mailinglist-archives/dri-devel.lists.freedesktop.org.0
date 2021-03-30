Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016C34DD3A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 02:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBA86E5C1;
	Tue, 30 Mar 2021 00:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BED6E5C0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 00:50:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617065408; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=J+/8jldF974VbFcFFVixYM95X47UrAQeS0th03XM8dg=;
 b=dXDDmGc0jYbv+YOc+uYitRV0ypwTvk47AwgTetEwowRpY1VcAuOURfIpWAn5zCuX8bS+eVG1
 X/5XeC9mXZAsYvW0zF/EgGClmb2l/fYJGx2036KLwoKPyR2VO5UnoI62s74VOZ+andpaN7Vg
 +iuNlnN567PkkZTHGioKEGNZf1g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 606275bd3f4005d0758a0661 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 00:50:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E7829C43464; Tue, 30 Mar 2021 00:50:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0027AC433CA;
 Tue, 30 Mar 2021 00:50:01 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 29 Mar 2021 17:50:01 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 17/25] drm/msi/dsi: inline
 msm_dsi_pll_helper_clk_prepare/unprepare
In-Reply-To: <20210327110305.3289784-18-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-18-dmitry.baryshkov@linaro.org>
Message-ID: <6c9c821b965f4a00aaa2ae45e8574c31@codeaurora.org>
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
> 10nm and 7nm already do not use these helpers, as they handle setting
> slave DSI clocks after enabling VCO. Modify the rest of PHY drivers to
> remove unnecessary indirection and drop enable_seq/disable_seq PLL
> callbacks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

There is some amount of duplication of code when we inline the
vco ops to the respective PLL files. Diff stats have infact more
additions than removal, however in terms of the bigger interest of
removing the dsi_pll.c/dsi_pll.h in the coming patchsets
https://patchwork.freedesktop.org/patch/426369/?series=88517&rev=2
I am okay with this change. Hence,

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>


> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  87 +++++++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  86 ++++++++-----
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 120 ++++++++++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.c         |  35 -----
>  drivers/gpu/drm/msm/dsi/phy/dsi_pll.h         |   2 -
>  6 files changed, 171 insertions(+), 161 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 8133732e0c7f..b477d21804c8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -32,8 +32,6 @@ struct msm_dsi_phy_ops {
>  };
> 
>  struct msm_dsi_pll_ops {
> -	int (*enable_seq)(struct msm_dsi_pll *pll);
> -	void (*disable_seq)(struct msm_dsi_pll *pll);
>  	void (*save_state)(struct msm_dsi_pll *pll);
>  	int (*restore_state)(struct msm_dsi_pll *pll);
>  };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 434d02ffa7fe..91c5bb2fd169 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -652,12 +652,58 @@ static unsigned long
> dsi_pll_14nm_vco_recalc_rate(struct clk_hw *hw,
>  	return (unsigned long)vco_rate;
>  }
> 
> +static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
> +{
> +	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	void __iomem *base = pll_14nm->mmio;
> +	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> +	bool locked;
> +
> +	DBG("");
> +
> +	if (unlikely(pll->pll_on))
> +		return 0;
> +
> +	pll_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
> +	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
> +
> +	locked = pll_14nm_poll_for_ready(pll_14nm, POLL_MAX_READS,
> +					 POLL_TIMEOUT_US);
> +
> +	if (unlikely(!locked)) {
> +		DRM_DEV_ERROR(&pll_14nm->pdev->dev, "DSI PLL lock failed\n");
> +		return -EINVAL;
> +	}
> +
> +	DBG("DSI PLL lock success");
> +	pll->pll_on = true;
> +
> +	return 0;
> +}
> +
> +static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
> +{
> +	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> +	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> +	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> +
> +	DBG("");
> +
> +	if (unlikely(!pll->pll_on))
> +		return;
> +
> +	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
> +
> +	pll->pll_on = false;
> +}
> +
>  static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
>  	.round_rate = msm_dsi_pll_helper_clk_round_rate,
>  	.set_rate = dsi_pll_14nm_vco_set_rate,
>  	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
> -	.prepare = msm_dsi_pll_helper_clk_prepare,
> -	.unprepare = msm_dsi_pll_helper_clk_unprepare,
> +	.prepare = dsi_pll_14nm_vco_prepare,
> +	.unprepare = dsi_pll_14nm_vco_unprepare,
>  };
> 
>  /*
> @@ -749,39 +795,6 @@ static const struct clk_ops
> clk_ops_dsi_pll_14nm_postdiv = {
>   * PLL Callbacks
>   */
> 
> -static int dsi_pll_14nm_enable_seq(struct msm_dsi_pll *pll)
> -{
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> -	void __iomem *base = pll_14nm->mmio;
> -	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> -	bool locked;
> -
> -	DBG("");
> -
> -	pll_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
> -	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
> -
> -	locked = pll_14nm_poll_for_ready(pll_14nm, POLL_MAX_READS,
> -					 POLL_TIMEOUT_US);
> -
> -	if (unlikely(!locked))
> -		DRM_DEV_ERROR(&pll_14nm->pdev->dev, "DSI PLL lock failed\n");
> -	else
> -		DBG("DSI PLL lock success");
> -
> -	return locked ? 0 : -EINVAL;
> -}
> -
> -static void dsi_pll_14nm_disable_seq(struct msm_dsi_pll *pll)
> -{
> -	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> -	void __iomem *cmn_base = pll_14nm->phy_cmn_mmio;
> -
> -	DBG("");
> -
> -	pll_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 0);
> -}
> -
>  static void dsi_pll_14nm_save_state(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(pll);
> @@ -1157,8 +1170,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = 
> {
>  	.pll_ops = {
>  		.save_state = dsi_pll_14nm_save_state,
>  		.restore_state = dsi_pll_14nm_restore_state,
> -		.disable_seq = dsi_pll_14nm_disable_seq,
> -		.enable_seq = dsi_pll_14nm_enable_seq,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> @@ -1183,8 +1194,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_14nm_660_cfgs = {
>  	.pll_ops = {
>  		.save_state = dsi_pll_14nm_save_state,
>  		.restore_state = dsi_pll_14nm_restore_state,
> -		.disable_seq = dsi_pll_14nm_disable_seq,
> -		.enable_seq = dsi_pll_14nm_enable_seq,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index ed369eb18e9d..20b31398b540 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -289,19 +289,7 @@ static unsigned long
> dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>  	return vco_rate;
>  }
> 
> -static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
> -	.round_rate = msm_dsi_pll_helper_clk_round_rate,
> -	.set_rate = dsi_pll_28nm_clk_set_rate,
> -	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
> -	.prepare = msm_dsi_pll_helper_clk_prepare,
> -	.unprepare = msm_dsi_pll_helper_clk_unprepare,
> -	.is_enabled = dsi_pll_28nm_clk_is_enabled,
> -};
> -
> -/*
> - * PLL Callbacks
> - */
> -static int _dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
> +static int _dsi_pll_28nm_vco_prepare_hpm(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
>  	struct device *dev = &pll_28nm->pdev->dev;
> @@ -376,21 +364,28 @@ static int _dsi_pll_28nm_enable_seq_hpm(struct
> msm_dsi_pll *pll)
>  	return locked ? 0 : -EINVAL;
>  }
> 
> -static int dsi_pll_28nm_enable_seq_hpm(struct msm_dsi_pll *pll)
> +static int dsi_pll_28nm_vco_prepare_hpm(struct clk_hw *hw)
>  {
> +	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
>  	int i, ret;
> 
> +	if (unlikely(pll->pll_on))
> +		return 0;
> +
>  	for (i = 0; i < 3; i++) {
> -		ret = _dsi_pll_28nm_enable_seq_hpm(pll);
> -		if (!ret)
> +		ret = _dsi_pll_28nm_vco_prepare_hpm(pll);
> +		if (!ret) {
> +			pll->pll_on = true;
>  			return 0;
> +		}
>  	}
> 
>  	return ret;
>  }
> 
> -static int dsi_pll_28nm_enable_seq_lp(struct msm_dsi_pll *pll)
> +static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
>  {
> +	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
>  	struct device *dev = &pll_28nm->pdev->dev;
>  	void __iomem *base = pll_28nm->mmio;
> @@ -400,6 +395,9 @@ static int dsi_pll_28nm_enable_seq_lp(struct
> msm_dsi_pll *pll)
> 
>  	DBG("id=%d", pll_28nm->id);
> 
> +	if (unlikely(pll->pll_on))
> +		return 0;
> +
>  	pll_28nm_software_reset(pll_28nm);
> 
>  	/*
> @@ -424,22 +422,54 @@ static int dsi_pll_28nm_enable_seq_lp(struct
> msm_dsi_pll *pll)
> 
>  	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
> 
> -	if (unlikely(!locked))
> +	if (unlikely(!locked)) {
>  		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
> -	else
> -		DBG("DSI PLL lock success");
> +		return -EINVAL;
> +	}
> 
> -	return locked ? 0 : -EINVAL;
> +	DBG("DSI PLL lock success");
> +	pll->pll_on = true;
> +
> +	return 0;
>  }
> 
> -static void dsi_pll_28nm_disable_seq(struct msm_dsi_pll *pll)
> +static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
>  {
> +	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> 
>  	DBG("id=%d", pll_28nm->id);
> +
> +	if (unlikely(!pll->pll_on))
> +		return;
> +
>  	pll_write(pll_28nm->mmio + REG_DSI_28nm_PHY_PLL_GLB_CFG, 0x00);
> +
> +	pll->pll_on = false;
>  }
> 
> +static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
> +	.round_rate = msm_dsi_pll_helper_clk_round_rate,
> +	.set_rate = dsi_pll_28nm_clk_set_rate,
> +	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
> +	.prepare = dsi_pll_28nm_vco_prepare_hpm,
> +	.unprepare = dsi_pll_28nm_vco_unprepare,
> +	.is_enabled = dsi_pll_28nm_clk_is_enabled,
> +};
> +
> +static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
> +	.round_rate = msm_dsi_pll_helper_clk_round_rate,
> +	.set_rate = dsi_pll_28nm_clk_set_rate,
> +	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
> +	.prepare = dsi_pll_28nm_vco_prepare_lp,
> +	.unprepare = dsi_pll_28nm_vco_unprepare,
> +	.is_enabled = dsi_pll_28nm_clk_is_enabled,
> +};
> +
> +/*
> + * PLL Callbacks
> + */
> +
>  static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> @@ -490,7 +520,6 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
>  		.num_parents = 1,
>  		.name = vco_name,
>  		.flags = CLK_IGNORE_UNUSED,
> -		.ops = &clk_ops_dsi_pll_28nm_vco,
>  	};
>  	struct device *dev = &pll_28nm->pdev->dev;
>  	struct clk_hw *hw;
> @@ -498,6 +527,11 @@ static int pll_28nm_register(struct dsi_pll_28nm
> *pll_28nm, struct clk_hw **prov
> 
>  	DBG("%d", pll_28nm->id);
> 
> +	if (pll_28nm->base.cfg->type == MSM_DSI_PHY_28NM_LP)
> +		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
> +	else
> +		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
> +
>  	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
>  	pll_28nm->base.clk_hw.init = &vco_init;
>  	ret = devm_clk_hw_register(dev, &pll_28nm->base.clk_hw);
> @@ -753,8 +787,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  	.pll_ops = {
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> -		.disable_seq = dsi_pll_28nm_disable_seq,
> -		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> @@ -779,8 +811,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  	.pll_ops = {
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> -		.disable_seq = dsi_pll_28nm_disable_seq,
> -		.enable_seq = dsi_pll_28nm_enable_seq_hpm,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> @@ -805,8 +835,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = 
> {
>  	.pll_ops = {
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> -		.disable_seq = dsi_pll_28nm_disable_seq,
> -		.enable_seq = dsi_pll_28nm_enable_seq_lp,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 45b2bf482392..952444e3e8f0 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -178,12 +178,76 @@ static unsigned long
> dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
>  	return vco_rate;
>  }
> 
> +static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
> +{
> +	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +	struct device *dev = &pll_28nm->pdev->dev;
> +	void __iomem *base = pll_28nm->mmio;
> +	bool locked;
> +	unsigned int bit_div, byte_div;
> +	int max_reads = 1000, timeout_us = 100;
> +	u32 val;
> +
> +	DBG("id=%d", pll_28nm->id);
> +
> +	if (unlikely(pll->pll_on))
> +		return 0;
> +
> +	/*
> +	 * before enabling the PLL, configure the bit clock divider since we
> +	 * don't expose it as a clock to the outside world
> +	 * 1: read back the byte clock divider that should already be set
> +	 * 2: divide by 8 to get bit clock divider
> +	 * 3: write it to POSTDIV1
> +	 */
> +	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
> +	byte_div = val + 1;
> +	bit_div = byte_div / 8;
> +
> +	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
> +	val &= ~0xf;
> +	val |= (bit_div - 1);
> +	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8, val);
> +
> +	/* enable the PLL */
> +	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
> +			DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
> +
> +	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
> +
> +	if (unlikely(!locked)) {
> +		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
> +		return -EINVAL;
> +	}
> +
> +	DBG("DSI PLL lock success");
> +	pll->pll_on = true;
> +
> +	return 0;
> +}
> +
> +static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
> +{
> +	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> +
> +	DBG("id=%d", pll_28nm->id);
> +
> +	if (unlikely(!pll->pll_on))
> +		return;
> +
> +	pll_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
> +
> +	pll->pll_on = false;
> +}
> +
>  static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
>  	.round_rate = msm_dsi_pll_helper_clk_round_rate,
>  	.set_rate = dsi_pll_28nm_clk_set_rate,
>  	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
> -	.prepare = msm_dsi_pll_helper_clk_prepare,
> -	.unprepare = msm_dsi_pll_helper_clk_unprepare,
> +	.prepare = dsi_pll_28nm_vco_prepare,
> +	.unprepare = dsi_pll_28nm_vco_unprepare,
>  	.is_enabled = dsi_pll_28nm_clk_is_enabled,
>  };
> 
> @@ -270,56 +334,6 @@ static const struct clk_ops clk_bytediv_ops = {
>  /*
>   * PLL Callbacks
>   */
> -static int dsi_pll_28nm_enable_seq(struct msm_dsi_pll *pll)
> -{
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> -	struct device *dev = &pll_28nm->pdev->dev;
> -	void __iomem *base = pll_28nm->mmio;
> -	bool locked;
> -	unsigned int bit_div, byte_div;
> -	int max_reads = 1000, timeout_us = 100;
> -	u32 val;
> -
> -	DBG("id=%d", pll_28nm->id);
> -
> -	/*
> -	 * before enabling the PLL, configure the bit clock divider since we
> -	 * don't expose it as a clock to the outside world
> -	 * 1: read back the byte clock divider that should already be set
> -	 * 2: divide by 8 to get bit clock divider
> -	 * 3: write it to POSTDIV1
> -	 */
> -	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9);
> -	byte_div = val + 1;
> -	bit_div = byte_div / 8;
> -
> -	val = pll_read(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8);
> -	val &= ~0xf;
> -	val |= (bit_div - 1);
> -	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_8, val);
> -
> -	/* enable the PLL */
> -	pll_write(base + REG_DSI_28nm_8960_PHY_PLL_CTRL_0,
> -			DSI_28nm_8960_PHY_PLL_CTRL_0_ENABLE);
> -
> -	locked = pll_28nm_poll_for_ready(pll_28nm, max_reads, timeout_us);
> -
> -	if (unlikely(!locked))
> -		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
> -	else
> -		DBG("DSI PLL lock success");
> -
> -	return locked ? 0 : -EINVAL;
> -}
> -
> -static void dsi_pll_28nm_disable_seq(struct msm_dsi_pll *pll)
> -{
> -	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> -
> -	DBG("id=%d", pll_28nm->id);
> -	pll_write(pll_28nm->mmio + REG_DSI_28nm_8960_PHY_PLL_CTRL_0, 0x00);
> -}
> -
>  static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
>  {
>  	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(pll);
> @@ -652,8 +666,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs 
> = {
>  	.pll_ops = {
>  		.save_state = dsi_pll_28nm_save_state,
>  		.restore_state = dsi_pll_28nm_restore_state,
> -		.disable_seq = dsi_pll_28nm_disable_seq,
> -		.enable_seq = dsi_pll_28nm_enable_seq,
>  	},
>  	.min_pll_rate = VCO_MIN_RATE,
>  	.max_pll_rate = VCO_MAX_RATE,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> index 652c2d6bfeec..cae668b669a4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
> @@ -21,38 +21,3 @@ long msm_dsi_pll_helper_clk_round_rate(struct clk_hw 
> *hw,
>  	else
>  		return rate;
>  }
> -
> -int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw)
> -{
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -	int ret = 0;
> -
> -	/*
> -	 * Certain PLLs do not allow VCO rate update when it is on.
> -	 * Keep track of their status to turn on/off after set rate success.
> -	 */
> -	if (unlikely(pll->pll_on))
> -		return 0;
> -
> -	ret = pll->cfg->pll_ops.enable_seq(pll);
> -	if (ret) {
> -		DRM_ERROR("DSI PLL failed to lock\n");
> -		return ret;
> -	}
> -
> -	pll->pll_on = true;
> -
> -	return 0;
> -}
> -
> -void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw)
> -{
> -	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
> -
> -	if (unlikely(!pll->pll_on))
> -		return;
> -
> -	pll->cfg->pll_ops.disable_seq(pll);
> -
> -	pll->pll_on = false;
> -}
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> index eca13cf67c21..da83e4c11f4f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.h
> @@ -39,8 +39,6 @@ static inline void pll_write_ndelay(void __iomem
> *reg, u32 data, u32 delay_ns)
>  /* clock callbacks */
>  long msm_dsi_pll_helper_clk_round_rate(struct clk_hw *hw,
>  		unsigned long rate, unsigned long *parent_rate);
> -int msm_dsi_pll_helper_clk_prepare(struct clk_hw *hw);
> -void msm_dsi_pll_helper_clk_unprepare(struct clk_hw *hw);
> 
>  #endif /* __DSI_PLL_H__ */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
